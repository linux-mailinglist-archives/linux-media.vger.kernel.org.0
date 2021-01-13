Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6E12F4759
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 10:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbhAMJRE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 13 Jan 2021 04:17:04 -0500
Received: from www.linuxtv.org ([130.149.80.248]:49648 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727641AbhAMJRE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 04:17:04 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kzcGM-00CxmO-7h; Wed, 13 Jan 2021 09:16:22 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kzcJm-0004rb-My; Wed, 13 Jan 2021 09:19:54 +0000
Date:   Wed, 13 Jan 2021 09:19:54 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <504328279.45.1610529594705@builder.linuxtv.org>
In-Reply-To: <797693416.44.1610529570151@builder.linuxtv.org>
References: <797693416.44.1610529570151@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3360
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/3360/display/redirect>

Changes:


------------------------------------------
[...truncated 1.28 KB...]
+ ./build
Checking if the needed tools for Debian GNU/Linux 10 (buster) are available
Needed package dependencies are met.

************************************************************
* This script will download the latest tarball and build it*
* Assuming that your kernel is compatible with the latest  *
* drivers. If not, you'll need to add some extra backports,*
* ./backports/<kernel> directory.                          *
* It will also update this tree to be sure that all compat *
* bits are there, to avoid compilation failures            *
************************************************************
************************************************************
* All drivers and build system are under GPLv2 License     *
* Firmware files are under the license terms found at:     *
* http://www.linuxtv.org/downloads/firmware/               *
* Please abort in the next 5 secs if you don't agree with  *
* the license                                              *
************************************************************

Not aborted. It means that the licence was agreed. Proceeding...

****************************
Updating the building system
****************************
From git://linuxtv.org/media_build
 * branch                      master     -> FETCH_HEAD
Already up to date.
make: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
wget http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2.md5 -O linux-media.tar.bz2.md5.tmp
--2021-01-13 09:17:04--  http://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2.md5
Resolving linuxtv.org (linuxtv.org)... 130.149.80.248
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2.md5 [following]
--2021-01-13 09:17:04--  https://linuxtv.org/downloads/drivers/linux-media-LATEST.tar.bz2.md5
Connecting to linuxtv.org (linuxtv.org)|130.149.80.248|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 105 [application/x-bzip2]
Saving to: ‘linux-media.tar.bz2.md5.tmp’

     0K                                                       100%  180M=0s

2021-01-13 09:17:05 (180 MB/s) - ‘linux-media.tar.bz2.md5.tmp’ saved [105/105]

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
patch -s -f -N -p1 -i ../backports/ccs.patch
patch -s -f -N -p1 -i ../backports/v5.10_vb2_dma_buf_map.patch
patch -s -f -N -p1 -i ../backports/v5.9_tasklet.patch
patch -s -f -N -p1 -i ../backports/v5.9_netup_unidvb_devm_revert.patch
patch -s -f -N -p1 -i ../backports/v5.7_mmap_read_lock.patch
patch -s -f -N -p1 -i ../backports/v5.7_vm_map_ram.patch
patch -s -f -N -p1 -i ../backports/v5.7_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.7_define_seq_attribute.patch
patch -s -f -N -p1 -i ../backports/v5.6_pin_user_pages.patch
patch -s -f -N -p1 -i ../backports/v5.6_const_fb_ops.patch
patch -s -f -N -p1 -i ../backports/v5.6_pm_runtime_get_if_active.patch
patch -s -f -N -p1 -i ../backports/v5.5_alsa_pcm_api_updates.patch
patch -s -f -N -p1 -i ../backports/v5.5_memtype_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_dev_printk_h.patch
patch -s -f -N -p1 -i ../backports/v5.5_vb2_kmap.patch
patch -s -f -N -p1 -i ../backports/v5.4_revert_spi_transfer.patch
patch -s -f -N -p1 -i ../backports/v5.1_vm_map_pages.patch
patch -s -f -N -p1 -i ../backports/v5.1_devm_i2c_new_dummy_device.patch
patch -s -f -N -p1 -i ../backports/v5.0_ipu3-cio2.patch
patch -s -f -N -p1 -i ../backports/v5.0_time32.patch
patch -s -f -N -p1 -i ../backports/v5.0_gpio.patch
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
CEC_CROS_EC: Requires at least kernel 9.255.255
V4L2_H264: Requires at least kernel 9.255.255
VIDEO_IPU3_CIO2: Requires at least kernel 9.255.255
VIDEO_OMAP3: Requires at least kernel 9.255.255
VIDEO_IMX274: Requires at least kernel 9.255.255
SND_BT87X: Requires at least kernel 9.255.255
INTEL_ATOMISP: Requires at least kernel 9.255.255
VIDEO_HANTRO: Requires at least kernel 9.255.255
VIDEO_ROCKCHIP_VDEC: Requires at least kernel 9.255.255
VIDEO_IPU3_IMGU: Requires at least kernel 9.255.255
Created default (all yes) .config file
./scripts/fix_kconfig.pl
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make -C <https://builder.linuxtv.org/job/media-build/ws/v4l> 
make[1]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
./scripts/make_myconfig.pl
[ ! -f "./config-mycompat.h" ] && echo "/* empty config-mycompat.h */" > "./config-mycompat.h" || true
perl scripts/make_config_compat.pl /lib/modules/4.19.0-5-amd64/source ./.myconfig ./config-compat.h
creating symbolic links...
Kernel build directory is /lib/modules/4.19.0-5-amd64/build
make -C ../linux apply_patches
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Patches for 4.19.0-5-amd64 already applied.
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make -C /lib/modules/4.19.0-5-amd64/build M=<https://builder.linuxtv.org/job/media-build/ws/v4l>  modules
make[2]: Entering directory '/usr/src/linux-headers-4.19.0-5-amd64'
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msp3400-driver.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/msp3400-kthreads.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-reg-access.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-quirk.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-limits.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-data.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/et8ek8_mode.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/et8ek8_driver.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-data.c>: In function 'ccs_data_parse_regs.isra.4':
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-data.c>:309:11: warning: 'regs_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
   *__regs = regs_base;
   ~~~~~~~~^~~~~~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-data.c>:290:16: warning: 'regs' may be used uninitialized in this function [-Wmaybe-uninitialized]
    regs->value = bin_alloc(bin, len);
    ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-data.c>: In function 'ccs_data_parse_rules':
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-data.c>:505:25: warning: 'next_rule' may be used uninitialized in this function [-Wmaybe-uninitialized]
     rules->num_if_rules = __num_if_rules;
     ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-data.c>:558:12: warning: 'rules_base' may be used uninitialized in this function [-Wmaybe-uninitialized]
   *__rules = rules_base;
   ~~~~~~~~~^~~~~~~~~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-data.c>: In function 'ccs_data_parse_pdaf.isra.10':
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-data.c>:724:20: warning: 'pdgroup' may be used uninitialized in this function [-Wmaybe-uninitialized]
    pdesc = &pdgroup->descs[j];
             ~~~~~~~^~~~~~~
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-audio.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-firmware.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-vbi.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-ir.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols_core.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols_controls.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m5mols_capture.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-core.c>:31:10: fatal error: uapi/linux/ccs.h: No such file or directory
 #include <uapi/linux/ccs.h>
          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:309: <https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-core.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
