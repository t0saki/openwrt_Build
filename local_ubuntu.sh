apt update -y
apt install build-essential clang flex bison g++ gawk \
gcc-multilib g++-multilib gettext git libncurses-dev libssl-dev \
python3-distutils rsync unzip zlib1g-dev file wget -y
  
apt install software-properties-common -y

curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
eval "$(./bin/micromamba shell hook -s posix)"

micromamba create -n build gcc gxx python -c conda-forge -y
micromamba activate build

./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
make