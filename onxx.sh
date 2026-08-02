#!/bin/bash

# Open GitHub
echo -e "\033[38;5;214m[$current_time]\033[0m \033[1;32m[INFO]:\033[0mInstagram Open..."
am start -a android.intent.action.VIEW -d "https://Instagram.com/_insrnx_" com.android.chrome >/dev/null 2>&1 || {
    echo -e "\033[38;5;214m[$current_time]\033[0m \033[1;33m[WARNING]:\033[0m Could not open ."
}

#========================================
#   TERMUX BACKUP & RESTORE TOOL v2.0
#   Created by: Hari Jadhav  (onxx)
#   Description: Ye tool Termux ke saare
#                important data ko backup
#                karta hai aur restore bhi.
#                Termux uninstall hone ke baad
#                bhi aapka data safe rehta hai.
#========================================

#----------------------------------------
# Color Definitions (Terminal Colors)
# Ye colors output ko visually attractive
# banate hain terminal mein
#----------------------------------------
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color (reset)

#----------------------------------------
# Banner Function
# Screen clear karta hai aur tool ka
# attractive header dikhata hai
#----------------------------------------
show_banner() {
    clear
    echo -e "${RED}"
    cat << "EOF"
  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡤⢖⣯⡽⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣳⠛⠻⠦⢤⣀⣠⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡴⢾⣿⣧⣄⠀⠤⢀⣀⣿⣶⣝⢶⣤⣀⠀⠀⠀⠀⢠⢾⡇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⣡⡞⣻⡿⠟⣛⣛⣿⣿⣿⣿⣛⢿⣧⣿⣿⡝⠓⠒⠚⢁⡼⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡼⢣⣿⣯⣾⣿⣾⣟⣻⣿⣿⣿⡟⣿⡟⣷⣼⣿⣿⣻⣷⠞⠛⠋⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣿⣾⣿⣿⣿⣿⡁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣛⠻⢷⡄⠀⠀⠀⠀V1.2
⠀⠀⠀⠀⠀⠀⠀⠀⠠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⢛⣥⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀BY HARI 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣹⣷⡀⠀⠀⠀⠀⠀⠀⣸⢻⢿⣿⣿⣛⡻⠿⣿⣿⣿⣿⣿⣿⠈⢻⣿⣿⣿⣿⣿⠿⢿⣿⠿⠋⠀⠀⠀⠀IG _insrnx_⠀
⠀⠀⠀⠀⢀⣀⣀⣰⡼⣯⣿⣧⠀⠀⠀⠀⠀⠀⣇⣐⣯⣭⣍⣙⢿⣦⣈⢿⣿⣿⣿⣿⣷⠁⣿⣿⣿⢿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⡿⠛⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣾⣽⣷⠏⢹⣿⣿⣿⣿⣿⣿⣧⣿⡿⣁⣿⣿⣻⡀⠀⠀⠀⠀⠀⠀⠀⠀
⢀⣿⠃⠈⢻⣿⣿⣿⣿⡿⠁⠀⠀⣀⠴⢪⣿⢹⣿⣿⣿⢿⢻⣏⣙⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣵⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀
⢸⡇⠀⠀⠀⠈⠉⠉⠁⠀⠀⣠⢞⣵⣫⣿⣿⣼⣿⣿⣯⣸⣿⣏⣉⣩⢿⣏⣩⣭⣝⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣙⡶⢤⣀⡀⠀⠀⠀
⢸⣷⠀⠀⠀⠀⠀⠀⠀⠀⣴⣻⣿⣿⣻⣿⣿⣿⣿⣿⣿⣏⢉⣉⣩⣷⣾⣿⣿⣷⣿⡜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢻⣮⣹⡆⠀⠀
⠈⢻⣧⠀⠀⠀⠀⠀⠀⣴⢃⣟⣾⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⠇⠀⠀
⠀⠈⢻⣗⢦⣤⣤⣤⣾⠛⣿⣿⠁⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣿⣿⠙⠻⢿⣿⡿⢛⣿⣿⣿⡿⠋⠀⠀⠀
⠀⠀⠀⠘⠛⠿⠿⠿⣿⣸⣿⣿⣢⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⡿⠀⣤⣤⣤⣴⣿⣿⣿⡟⠁⠀⠀⠀⠀
⠀⠀⢠⡄⠀⠀⠀⣴⣻⣿⣿⣿⣿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⢹⣿⣿⢿⣿⠃⣼⣿⣿⣿⣿⣯⣼⣿⠃⠀⠀⠀⠀⠀
⠀⠀⢸⡇⠀⢰⣿⣿⣿⣿⣿⣿⣿⡿⠋⣀⣤⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠙⠿⣿⡿⢰⣿⣿⣿⣿⣿⡿⠛⠋⠀⠀⠀⠀⠀⠀
⠀⡀⠘⡇⠀⢸⣿⣿⠟⠉⠉⠉⠁⠀⡴⣥⣶⣿⣿⣿⣿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢳⡀⠃⠀⣼⣿⣿⠀⠀⠀⣴⣾⣯⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⡀⢧⠀⢸⣿⣿⣿⠀⠀⠀⠻⣿⠿⠛⠁⠀⣀⡠⠆⠀⣀⣀⡤⠴⠶⠒⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠳⡌⢷⣿⣟⣿⣿⣠⡤⢄⡠⠖⣀⣤⠶⠚⠁⠀⠒⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠘⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⡉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF
    echo -e "${NC}"
    echo -e "${RED}                       Follow IG _insrnx_ 🐈‍⬛"
    echo -e "${GREEN}               [+] Full Data Protection Tool [+]${NC}"
    echo -e "${YELLOW}             [+] Uninstall ke baad bhi data wapas! [+]${NC}"
    echo ""
}

#----------------------------------------
# Environment Check
# Check karta hai ke Termux environment
# available hai ya nahi (HOME directory)
#----------------------------------------
if [ ! -d "$HOME" ]; then
    echo -e "${RED}[!] Termux environment nahi mila!${NC}"
    exit 1
fi

#----------------------------------------
# Global Variables & Directories
# BACKUP_DIR    -> Local backup storage location
# RESTORE_SCRIPT-> Restore script path (unused but defined)
# TIMESTAMP     -> Unique timestamp for each backup file
#----------------------------------------
BACKUP_DIR="$HOME/termux_backups"
RESTORE_SCRIPT="$HOME/termux_restore.sh"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")   # Format: YYYYMMDD_HHMMSS

# Backup directory create karo (agar nahi hai toh banao)
mkdir -p "$BACKUP_DIR"

#----------------------------------------
# Menu Function
# User ko main options dikhata hai
#----------------------------------------
show_menu() {
    echo -e "${CYAN}╔══════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║         ${WHITE}MAIN MENU${CYAN}                  ║${NC}"
    echo -e "${CYAN}╠══════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${GREEN}  [1] Full Backup (Sab Kuch)${CYAN}        ║${NC}"
    echo -e "${CYAN}║${GREEN}  [2] Custom Backup${CYAN}                 ║${NC}"
    echo -e "${CYAN}║${BLUE}  [3] Restore Data${CYAN}                  ║${NC}"
    echo -e "${CYAN}║${YELLOW}  [4] View Backup History${CYAN}           ║${NC}"
    echo -e "${CYAN}║${MAGENTA}  [5] Delete Old Backups${CYAN}            ║${NC}"
    echo -e "${CYAN}║${RED}  [0] Exit${CYAN}                          ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${NC}"
    echo ""
}

#----------------------------------------
# FULL BACKUP FUNCTION
# Saare home directory files ko backup karta hai
# Exclude karta hai: backup dir itself, cache, tmp
# Uses tar with gzip compression (.tar.gz)
#----------------------------------------
full_backup() {
    show_banner
    echo -e "${YELLOW}[*] Full Backup shuru ho raha hai...${NC}"
    echo -e "${YELLOW}[*] Thoda time lagega, sabr karo...${NC}"
    echo ""

    # Backup file ka naam aur path set karo
    BACKUP_FILE="$BACKUP_DIR/termux_full_backup_$TIMESTAMP.tar.gz"

    # tar command:
    # -c = create new archive
    # -z = gzip compress
    # -f = output filename
    # --exclude = inhe skip karo (backup dir khud me bhi na jaye)
    # -C $HOME = home directory se start karo
    # . = current directory (sab kuch)
    tar -czf "$BACKUP_FILE" \
        --exclude="$BACKUP_DIR" \
        --exclude="$HOME/.cache" \
        --exclude="$HOME/tmp" \
        -C "$HOME" . 2>/dev/null

    if [ $? -eq 0 ]; then
        # Backup size nikalo using du command
        BACKUP_SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
        echo -e "${GREEN}[✓] Backup successful!${NC}"
        echo -e "${GREEN}[✓] File: $BACKUP_FILE${NC}"
        echo -e "${GREEN}[✓] Size: $BACKUP_SIZE${NC}"
        echo ""

        # Restore code generate karo (standalone script)
        generate_restore_code "$BACKUP_FILE"
    else
        echo -e "${RED}[✗] Backup failed!${NC}"
    fi
}

#----------------------------------------
# CUSTOM BACKUP FUNCTION
# User jo specific folders select kare unka
# backup leta hai
#----------------------------------------
custom_backup() {
    show_banner
    echo -e "${CYAN}[?] Kaunse folders backup karne hain? (space se alag karo)${NC}"
    echo -e "${YELLOW}Example: storage downloads documents${NC}"
    read -p "> " folders

    if [ -z "$folders" ]; then
        echo -e "${RED}[!] Koi folder select nahi kiya!${NC}"
        return
    fi

    BACKUP_FILE="$BACKUP_DIR/termux_custom_backup_$TIMESTAMP.tar.gz"

    echo -e "${YELLOW}[*] Custom Backup shuru ho raha hai...${NC}"

    # tar command: selected folders ko HOME se backup karo
    tar -czf "$BACKUP_FILE" -C "$HOME" $folders 2>/dev/null

    if [ $? -eq 0 ]; then
        BACKUP_SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
        echo -e "${GREEN}[✓] Custom Backup successful!${NC}"
        echo -e "${GREEN}[✓] File: $BACKUP_FILE${NC}"
        echo -e "${GREEN}[✓] Size: $BACKUP_SIZE${NC}"
        echo ""
        generate_restore_code "$BACKUP_FILE"
    else
        echo -e "${RED}[✗] Backup failed!${NC}"
    fi
}

#----------------------------------------
# GENERATE RESTORE CODE FUNCTION
# Har backup ke saath ek standalone
# restore script generate karta hai
# Saath mein backup file ko /sdcard/Download/
# mein bhi copy kar deta hai (safety ke liye)
#----------------------------------------
generate_restore_code() {
    local backup_file="$1"
    local backup_name=$(basename "$backup_file")

    echo -e "${MAGENTA}═══════════════════════════════════════════════════════${NC}"
    echo -e "${MAGENTA}        🔐 RESTORE CODE GENERATED 🔐${NC}"
    echo -e "${MAGENTA}═══════════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "${CYAN}[📁] Backup File: ${WHITE}$backup_name${NC}"
    echo -e "${CYAN}[📂] Location: ${WHITE}$backup_file${NC}"
    echo -e "${CYAN}[📅] Date: ${WHITE}$(date)${NC}"
    echo ""
    echo -e "${YELLOW}⚠️  IMPORTANT: Ye backup file ko safe jagah rakh lo!${NC}"
    echo -e "${YELLOW}⚠️  Termux uninstall hone ke baad bhi ye file bachani hai!${NC}"
    echo ""

    # Standalone restore script banao (Heredoc se)
    RESTORE_CODE_FILE="$BACKUP_DIR/restore_code_$TIMESTAMP.sh"

    cat > "$RESTORE_CODE_FILE" << 'RESTORE_EOF'
#!/bin/bash
#========================================
#   TERMUX RESTORE SCRIPT
#   Auto-generated Restore Code
#   Ye script backup restore karne ke
#   liye use hota hai (Termux reinstall
#   ke baad bhi chalega)
#========================================

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║           🔄 TERMUX DATA RESTORE TOOL 🔄                    ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# User se backup file location pucho
echo -e "${YELLOW}[?] Backup file kahan rakhi hai?${NC}"
echo -e "${YELLOW}    1. Internal Storage (/sdcard/Download/)${NC}"
echo -e "${YELLOW}    2. Custom Path${NC}"
read -p "> " choice

# Location based on user choice
if [ "$choice" == "1" ]; then
    BACKUP_PATH="/sdcard/Download"
elif [ "$choice" == "2" ]; then
    echo -e "${YELLOW}[?] Full path batao backup file ka:${NC}"
    read -p "> " BACKUP_PATH
else
    echo -e "${RED}[!] Galat choice!${NC}"
    exit 1
fi

# Available backup files dikhao
echo -e "${CYAN}[*] Available backup files:${NC}"
ls -lh "$BACKUP_PATH"/termux_*_backup_*.tar.gz 2>/dev/null || {
    echo -e "${RED}[!] Koi backup file nahi milli!${NC}"
    exit 1
}

echo ""
echo -e "${YELLOW}[?] Kaunsa backup restore karna hai? (poora naam likho)${NC}"
read -p "> " selected_file

FULL_PATH="$BACKUP_PATH/$selected_file"

# Check karo ke file exist karta hai ya nahi
if [ ! -f "$FULL_PATH" ]; then
    echo -e "${RED}[!] File nahi milli: $FULL_PATH${NC}"
    exit 1
fi

echo -e "${YELLOW}[*] Restore shuru ho raha hai...${NC}"
echo -e "${YELLOW}[*] Thoda time lagega...${NC}"

# Restore operation: extract tar.gz in home directory
cd "$HOME"
tar -xzf "$FULL_PATH" 2>/dev/null

if [ $? -eq 0 ]; then
    echo -e "${GREEN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                                                              ║"
    echo "║           ✅ DATA SUCCESSFULLY RESTORED! ✅                 ║"
    echo "║                                                              ║"
    echo "║        Termux ko band karke dubara khol lo!                 ║"
    echo "║        Sab kuch wapas aa gaya hai! 🎉                       ║"
    echo "║                                                              ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
else
    echo -e "${RED}[✗] Restore failed!${NC}"
fi
RESTORE_EOF

    chmod +x "$RESTORE_CODE_FILE"

    echo -e "${GREEN}[✓] Restore Code ban gaya!${NC}"
    echo -e "${GREEN}[✓] File: $RESTORE_CODE_FILE${NC}"
    echo ""
    echo -e "${CYAN}📋 STEPS TO RESTORE AFTER UNINSTALL:${NC}"
    echo -e "${WHITE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${YELLOW}1️⃣  Backup file ko /sdcard/Download/ mein copy karo${NC}"
    echo -e "${YELLOW}2️⃣  Termux uninstall karke dubara install karo${NC}"
    echo -e "${YELLOW}3️⃣  Ye restore script run karo:${NC}"
    echo -e "${GREEN}    bash $RESTORE_CODE_FILE${NC}"
    echo -e "${YELLOW}4️⃣  Ya manually restore karo:${NC}"
    echo -e "${GREEN}    cd \$HOME && tar -xzf /sdcard/Download/$backup_name${NC}"
    echo -e "${WHITE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""

    # Safety copy: backup file + restore code dono /sdcard/Download mein bhi save karo
    if [ -d "/sdcard/Download" ]; then
        cp "$RESTORE_CODE_FILE" "/sdcard/Download/termux_restore_code_$TIMESTAMP.sh" 2>/dev/null
        cp "$backup_file" "/sdcard/Download/" 2>/dev/null
        echo -e "${GREEN}[✓] Backup & Restore Code /sdcard/Download/ mein bhi save ho gaya!${NC}"
        echo -e "${GREEN}[✓] Ab uninstall ke baad bhi safe hai!${NC}"
    fi
    echo ""
}

#----------------------------------------
# RESTORE DATA FUNCTION
# Existing backup se data restore karta hai
# 3 options: Internal Storage, Custom Path,
# ya Backup History se
#----------------------------------------
restore_data() {
    show_banner
    echo -e "${CYAN}[*] Restore Mode${NC}"
    echo ""

    echo -e "${YELLOW}[?] Backup file kahan hai?${NC}"
    echo -e "${GREEN}  [1] Internal Storage (/sdcard/Download/)${NC}"
    echo -e "${GREEN}  [2] Custom Path${NC}"
    echo -e "${GREEN}  [3] Backup History se${NC}"
    read -p "> " rchoice

    case $rchoice in
        1) BACKUP_LOC="/sdcard/Download" ;;
        2)
            echo -e "${YELLOW}[?] Path batao:${NC}"
            read -p "> " BACKUP_LOC
            ;;
        3) BACKUP_LOC="$BACKUP_DIR" ;;
        *)
            echo -e "${RED}[!] Galat choice!${NC}"
            return
            ;;
    esac

    echo -e "${CYAN}[*] Available backups:${NC}"
    ls -lh "$BACKUP_LOC"/termux_*_backup_*.tar.gz 2>/dev/null || {
        echo -e "${RED}[!] Koi backup nahi mila!${NC}"
        return
    }

    echo ""
    echo -e "${YELLOW}[?] Kaunsa backup restore karna hai? (poora naam)${NC}"
    read -p "> " bfile

    FULL_BPATH="$BACKUP_LOC/$bfile"

    if [ ! -f "$FULL_BPATH" ]; then
        echo -e "${RED}[!] File nahi milli!${NC}"
        return
    fi

    echo -e "${YELLOW}[!] Warning: Current data overwrite ho jayega!${NC}"
    echo -e "${YELLOW}[?] Kya continue karna hai? (yes/no)${NC}"
    read -p "> " confirm

    if [ "$confirm" != "yes" ]; then
        echo -e "${RED}[!] Cancel kiya gaya!${NC}"
        return
    fi

    echo -e "${YELLOW}[*] Restore shuru ho raha hai...${NC}"
    cd "$HOME"

    # tar extract command: backup file ko extract karo home directory mein
    tar -xzf "$FULL_BPATH" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[✓] Restore successful!${NC}"
        echo -e "${GREEN}[✓] Termux ko restart karo!${NC}"
    else
        echo -e "${RED}[✗] Restore failed!${NC}"
    fi
}

#----------------------------------------
# VIEW HISTORY FUNCTION
# Local aur Storage dono jagah ke
# backup files dikhata hai
#----------------------------------------
view_history() {
    show_banner
    echo -e "${CYAN}╔══════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║      ${WHITE}BACKUP HISTORY${CYAN}                 ║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════╝${NC}"
    echo ""

    if [ -d "$BACKUP_DIR" ]; then
        echo -e "${GREEN}Local Backups:${NC}"
        # Local backup files list karo
        ls -lh "$BACKUP_DIR"/termux_*_backup_*.tar.gz 2>/dev/null || echo -e "${RED}Koi backup nahi!${NC}"
    fi

    echo ""
    if [ -d "/sdcard/Download" ]; then
        echo -e "${GREEN}Storage Backups:${NC}"
        # SD Card backup files list karo
        ls -lh "/sdcard/Download"/termux_*_backup_*.tar.gz 2>/dev/null || echo -e "${RED}Koi backup nahi!${NC}"
    fi
    echo ""
}

#----------------------------------------
# DELETE OLD BACKUPS FUNCTION
# Saare old backup files aur restore
# codes delete kar deta hai
#----------------------------------------
delete_backups() {
    show_banner
    echo -e "${RED}[!] Ye sab backups delete kar dega!${NC}"
    echo -e "${YELLOW}[?] Kya pakka delete karna hai? (yes/no)${NC}"
    read -p "> " delconfirm

    if [ "$delconfirm" == "yes" ]; then
        # Local backups delete karo
        rm -f "$BACKUP_DIR"/termux_*_backup_*.tar.gz 2>/dev/null
        rm -f "$BACKUP_DIR"/restore_code_*.sh 2>/dev/null
        # SD Card backups delete karo
        rm -f "/sdcard/Download"/termux_*_backup_*.tar.gz 2>/dev/null
        rm -f "/sdcard/Download"/termux_restore_code_*.sh 2>/dev/null
        echo -e "${GREEN}[✓] Sab backups delete ho gaye!${NC}"
    else
        echo -e "${YELLOW}[!] Cancel kiya gaya!${NC}"
    fi
}

#----------------------------------------
# MAIN LOOP
# Tool continuously chalta hai
# jab tak user exit nahi karta
#----------------------------------------
while true; do
    show_banner
    show_menu
    echo -e "${CYAN}[?] Kya karna hai? (number daalo)${NC}"
    read -p "> " choice

    case $choice in
        1)
            full_backup
            echo -e "${YELLOW}[*] Koi key dabao wapas jane ke liye...${NC}"
            read -n 1
            ;;
        2)
            custom_backup
            echo -e "${YELLOW}[*] Koi key dabao wapas jane ke liye...${NC}"
            read -n 1
            ;;
        3)
            restore_data
            echo -e "${YELLOW}[*] Koi key dabao wapas jane ke liye...${NC}"
            read -n 1
            ;;
        4)
            view_history
            echo -e "${YELLOW}[*] Koi key dabao wapas jane ke liye...${NC}"
            read -n 1
            ;;
        5)
            delete_backups
            echo -e "${YELLOW}[*] Koi key dabao wapas jane ke liye...${NC}"
            read -n 1
            ;;
        0)
            show_banner
            echo -e "${GREEN}👋 Bye Bye! Apna data safe rakhna!${NC}"
            echo ""
            exit 0
            ;;
        *)
            echo -e "${RED}[!] Galat option!${NC}"
            sleep 1
            ;;
    esac
done