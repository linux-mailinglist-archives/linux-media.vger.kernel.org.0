Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2454F8CBD9
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 08:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfHNGTh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 14 Aug 2019 02:19:37 -0400
Received: from www.linuxtv.org ([130.149.80.248]:41155 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725263AbfHNGTg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 02:19:36 -0400
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtp (Exim 4.84_2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxmd7-00047X-CS; Wed, 14 Aug 2019 06:19:29 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1hxmd7-0006eC-Ox; Wed, 14 Aug 2019 06:19:29 +0000
Date:   Wed, 14 Aug 2019 06:19:29 +0000 (UTC)
From:   jenkins@linuxtv.org
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1376893238.3.1565763569765.JavaMail.jenkins@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #45
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/45/display/redirect>

Changes:

------------------------------------------
[...truncated 13.13 KB...]
  6050K .......... .......... .......... .......... .......... 99%  155M 0s
  6100K .......... .......... ..........                      100%  162M=1.7s

2019-08-14 06:19:09 (3.54 MB/s) - ‘linux-media.tar.bz2’ saved [6277677/6277677]

make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
tar xfj linux-media.tar.bz2
rm -f .patches_applied .linked_dir .git_log.md5
make: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
**********************************************************
* Downloading firmwares from linuxtv.org.                *
**********************************************************
firmware/dvb-usb-vp702x-01.fw
firmware/dvb-usb-vp7045-01.fw
firmware/dvb-fe-bcm3510-01.fw
firmware/as102_data2_st.hex
firmware/dvb-usb-terratec-h7-drxk.fw
firmware/isdbt_nova_12mhz.inp
firmware/Boot.S
firmware/dvb_nova_12mhz_b0.inp
firmware/dvb-fe-xc4000-1.4.1.fw
firmware/sms1xxx-hcw-55xxx-isdbt-02.fw
firmware/sms1xxx-nova-a-dvbt-01.fw
firmware/dvb-usb-avertv-a800-02.fw
firmware/cmmb_venice_12mhz.inp
firmware/dvb-fe-xc5000c-4.1.30.7.fw
firmware/v4l-cx23418-cpu.fw
firmware/v4l-cx23885-enc-broken.fw
firmware/dvb-fe-drxj-mc-vsb-1.0.8.fw
firmware/dvb_nova_12mhz.inp
firmware/dvb-usb-dib0700-1.20.fw
firmware/tdmb_nova_12mhz.inp
firmware/as102_data1_st.hex
firmware/dvb-fe-or51132-vsb.fw
firmware/dvb-usb-it9135-02.fw
firmware/v4l-cx23418-apu.fw
firmware/dvb-ttpci-01.fw-261f
firmware/v4l-cx23418-dig.fw
firmware/dvb-ttpci-01.fw-261c
firmware/dvb-usb-bluebird-01.fw
firmware/dvb-fe-or51211.fw
firmware/dvb-fe-or51132-qam.fw
firmware/sms1xxx-stellar-dvbt-01.fw
firmware/dvb-usb-dibusb-5.0.0.11.fw
firmware/dvb-fe-drxj-mc-vsb-qam-1.0.8.fw
firmware/dvb-usb-terratec-h5-drxk.fw
firmware/dvb-usb-wt220u-02.fw
firmware/v4l-cx23885-enc.fw
firmware/dvb-ttpci-01.fw-2622
firmware/dvb-usb-wt220u-01.fw
firmware/v4l-cx25840.fw
firmware/dvb-fe-drxj-mc-1.0.8.fw
firmware/v4l-cx231xx-avcore-01.fw
firmware/dvb-usb-dtt200u-01.fw
firmware/dvb-usb-dibusb-6.0.0.8.fw
firmware/sms1xxx-nova-b-dvbt-01.fw
firmware/dvb-fe-xc5000-1.6.114.fw
firmware/cmmb_vega_12mhz.inp
firmware/dvb-usb-it9135-01.fw
firmware/isdbt_nova_12mhz_b0.inp
firmware/dvb-ttpci-01.fw-261a
firmware/dvb-ttpci-01.fw-261b
firmware/dvb-ttpci-01.fw-261d
firmware/README
firmware/isdbt_rio.inp
firmware/dvb-usb-umt-010-02.fw
firmware/sms1xxx-hcw-55xxx-dvbt-02.fw
firmware/dvb-usb-terratec-h7-az6007.fw
firmware/v4l-cx23885-avcore-01.fw
******************
* Start building *
******************
make -C <https://builder.linuxtv.org/job/media-build/ws/v4l> allyesconfig
make[1]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 4.19.0-5-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
patch -s -f -N -p1 -i ../backports/v4.20_access_ok.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
./scripts/make_kconfig.pl /lib/modules/4.19.0-5-amd64/build /lib/modules/4.19.0-5-amd64/source 1
Preparing to compile for kernel version 4.19.0

***WARNING:*** You do not have the full kernel sources installed.
This does not prevent you from building the v4l-dvb tree if you have the
kernel headers, but the full kernel source may be required in order to use
make menuconfig / xconfig / qconfig.

If you are experiencing problems building the v4l-dvb tree, please try
building against a vanilla kernel before reporting a bug.

Vanilla kernels are available at http://kernel.org.
On most distros, this will compile a newly downloaded kernel:

cp /boot/config-`uname -r` <your kernel dir>/.config
cd <your kernel dir>
make all modules_install install

Please see your distro's web site for instructions to build a new kernel.

WARNING: This is the V4L/DVB backport tree, with experimental drivers
	 backported to run on legacy kernels from the development tree at:
		http://git.linuxtv.org/media-tree.git.
	 It is generally safe to use it for testing a new driver or
	 feature, but its usage on production environments is risky.
	 Don't use it in production. You've been warned.
VIDEO_IPU3_CIO2: Requires at least kernel 9.255.255
VIDEO_OMAP3: Requires at least kernel 9.255.255
VIDEO_DW9714: Requires at least kernel 9.255.255
VIDEO_IPU3_IMGU: Requires at least kernel 9.255.255
Created default (all yes) .config file
./scripts/fix_kconfig.pl
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make -C <https://builder.linuxtv.org/job/media-build/ws/v4l> 
make[1]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
./scripts/make_myconfig.pl
[ ! -f "./config-mycompat.h" ] && echo "/* empty config-mycompat.h */" > "./config-mycompat.h" || true
creating symbolic links...
perl scripts/make_config_compat.pl /lib/modules/4.19.0-5-amd64/source ./.myconfig ./config-compat.h
Kernel build directory is /lib/modules/4.19.0-5-amd64/build
make -C ../linux apply_patches
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Patches for 4.19.0-5-amd64 already applied.
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make -C /lib/modules/4.19.0-5-amd64/build M=<https://builder.linuxtv.org/job/media-build/ws/v4l>  modules
make[2]: Entering directory '/usr/src/linux-headers-4.19.0-5-amd64'
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msp3400-driver.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msp3400-kthreads.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp-regs.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp-quirk.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/smiapp-limits.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/et8ek8_mode.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/et8ek8_driver.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-audio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-firmware.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-vbi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-ir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols_controls.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols_capture.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/aptina-pll.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tvaudio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda7432.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa6588.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda9840.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tda1997x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tea6415c.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tea6420.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7110.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7115.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa717x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7127.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa7185.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/saa6752hs.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ad5820.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ak7375.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dw9807-vcm.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7170.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7175.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7180.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7183.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7343.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7393.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7604.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7842.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ad9389b.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7511-v4l2.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vpx3220.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vs6624.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/bt819.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/tda1997x.c>: In function 'tda1997x_probe':
<https://builder.linuxtv.org/job/media-build/ws/v4l/tda1997x.c>:2694:22: error: implicit declaration of function 'devm_i2c_new_dummy_device'; did you mean 'i2c_new_probed_device'? [-Werror=implicit-function-declaration]
  state->client_cec = devm_i2c_new_dummy_device(&client->dev,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
                      i2c_new_probed_device
<https://builder.linuxtv.org/job/media-build/ws/v4l/tda1997x.c>:2694:20: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  state->client_cec = devm_i2c_new_dummy_device(&client->dev,
                    ^
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/tda1997x.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7180.c>: In function 'adv7180_probe':
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7180.c>:1332:23: error: implicit declaration of function 'i2c_new_dummy_device'; did you mean 'i2c_new_probed_device'? [-Werror=implicit-function-declaration]
   state->csi_client = i2c_new_dummy_device(client->adapter,
                       ^~~~~~~~~~~~~~~~~~~~
                       i2c_new_probed_device
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7180.c>:1332:21: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   state->csi_client = i2c_new_dummy_device(client->adapter,
                     ^
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7180.c>:1339:21: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   state->vpp_client = i2c_new_dummy_device(client->adapter,
                     ^
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7180.o]> Error 1
<https://builder.linuxtv.org/job/media-build/ws/v4l/ad9389b.c>: In function 'ad9389b_probe':
<https://builder.linuxtv.org/job/media-build/ws/v4l/ad9389b.c>:1151:27: error: implicit declaration of function 'i2c_new_dummy_device'; did you mean 'i2c_new_probed_device'? [-Werror=implicit-function-declaration]
  state->edid_i2c_client = i2c_new_dummy_device(client->adapter, (0x7e >> 1));
                           ^~~~~~~~~~~~~~~~~~~~
                           i2c_new_probed_device
<https://builder.linuxtv.org/job/media-build/ws/v4l/ad9389b.c>:1151:25: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  state->edid_i2c_client = i2c_new_dummy_device(client->adapter, (0x7e >> 1));
                         ^
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/ad9389b.o]> Error 1
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7511-v4l2.c>: In function 'adv7511_probe':
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7511-v4l2.c>:1875:20: error: implicit declaration of function 'i2c_new_dummy_device'; did you mean 'i2c_new_probed_device'? [-Werror=implicit-function-declaration]
  state->i2c_edid = i2c_new_dummy_device(client->adapter,
                    ^~~~~~~~~~~~~~~~~~~~
                    i2c_new_probed_device
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7511-v4l2.c>:1875:18: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  state->i2c_edid = i2c_new_dummy_device(client->adapter,
                  ^
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7511-v4l2.c>:1892:18: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   state->i2c_cec = i2c_new_dummy_device(client->adapter,
                  ^
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7511-v4l2.c>:1904:20: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  state->i2c_pktmem = i2c_new_dummy_device(client->adapter, state->i2c_pktmem_addr >> 1);
                    ^
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7511-v4l2.o]> Error 1
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7842.c>: In function 'adv7842_dummy_client':
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7842.c>:3403:7: error: implicit declaration of function 'i2c_new_dummy_device'; did you mean 'i2c_new_probed_device'? [-Werror=implicit-function-declaration]
  cp = i2c_new_dummy_device(client->adapter, io_read(sd, io_reg) >> 1);
       ^~~~~~~~~~~~~~~~~~~~
       i2c_new_probed_device
<https://builder.linuxtv.org/job/media-build/ws/v4l/adv7842.c>:3403:5: warning: assignment to 'struct i2c_client *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  cp = i2c_new_dummy_device(client->adapter, io_read(sd, io_reg) >> 1);
     ^
cc1: some warnings being treated as errors
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:314: <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7842.o]> Error 1
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 526
Build step 'Execute shell' marked build as failure
