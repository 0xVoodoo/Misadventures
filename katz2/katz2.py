import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-f", "--file", help="Mimikatz output file", required=True)
parser.add_argument("-m", "--mode", help="Mimikatz mode used to obtain the output logonpasswords|cache", required=True)
args = parser.parse_args()

def dump(creds):
    if isinstance(creds, list) and len(creds) >= 2:
        username = creds[0]
        hsh = creds[1]
        dumpfile = username+".txt"
        with open(dumpfile, "w+") as df:
            df.write(hsh)
    else:
        pass

def sekurlsa():
    filename = args.file
    creds = []
    with open(filename) as f:
        for line in f:
            if "authentication" in line.lower():
                dump(creds)
                creds = []
            elif "username" in line.lower():
                username = line.split(":")[1].strip()
                if username.lower() in creds or username.lower() == "(null)":
                    pass
                else:
                    creds.append(username.lower())
            elif "ntlm" in line.lower():
                ntlm = line.strip().split(":")[1].strip()
                if ntlm in creds:
                    pass
                else:
                    creds.append(ntlm)

def cache():
    filename = args.file
    creds = []
    with open(filename) as f:
        for line in f:
            if "nl$" in line.lower():
                print(creds)
                dump(creds)
                creds = []
            elif "user" in line.lower():
                username = line.split(":")[1].strip()
                if username.lower() in creds or username.lower() == "(null)":
                    pass
                else:
                    creds.append(username.lower())
            elif "mscachev2" in line.lower():
                mscache = line.strip().split(":")[1].strip()
                if mscache in creds:
                    pass
                else:
                    creds.append(mscache)

    print("[+] Credential pairs written to disk")

if __name__ == "__main__":
    match args.mode:
        case "logonpasswords":
            sekurlsa()
        case "cache":
            cache()
