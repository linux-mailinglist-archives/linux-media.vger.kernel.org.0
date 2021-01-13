Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA582F4758
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 10:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbhAMJQm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 13 Jan 2021 04:16:42 -0500
Received: from www.linuxtv.org ([130.149.80.248]:49628 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727466AbhAMJQm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 04:16:42 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kzcFy-00CxaD-Ci; Wed, 13 Jan 2021 09:15:58 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1kzcJO-0004r0-5O; Wed, 13 Jan 2021 09:19:30 +0000
Date:   Wed, 13 Jan 2021 09:19:29 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <797693416.44.1610529570151@builder.linuxtv.org>
In-Reply-To: <700614131.43.1610443168238@builder.linuxtv.org>
References: <700614131.43.1610443168238@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3359
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

See <https://builder.linuxtv.org/job/media-build/3359/display/redirect?page=changes>

Changes:

[hverkuil-cisco] linux/Makefile: add include/uapi/linux/ccs.h

[hverkuil-cisco] v4l/versions.txt: ov8865 needs probe_new

[hverkuil-cisco] Add backports/v5.0_gpio.patch

[hverkuil-cisco] Add backports/v4.11_pwc.patch

[hverkuil-cisco] v4l/version.txt: ov5648 needs probe_new

[hverkuil-cisco] v4l/versions.txt: OV5647 needs GPIOD_*


------------------------------------------
[...truncated 11.43 KB...]
  4700K .......... .......... .......... .......... .......... 67% 21.3M 1s
  4750K .......... .......... .......... .......... .......... 67% 23.5M 1s
  4800K .......... .......... .......... .......... .......... 68% 18.4M 1s
  4850K .......... .......... .......... .......... .......... 69% 17.6M 1s
  4900K .......... .......... .......... .......... .......... 69% 21.3M 1s
  4950K .......... .......... .......... .......... .......... 70% 21.1M 1s
  5000K .......... .......... .......... .......... .......... 71% 19.6M 1s
  5050K .......... .......... .......... .......... .......... 72% 21.7M 0s
  5100K .......... .......... .......... .......... .......... 72% 1.88M 0s
  5150K .......... .......... .......... .......... .......... 73% 24.5M 0s
  5200K .......... .......... .......... .......... .......... 74% 16.5M 0s
  5250K .......... .......... .......... .......... .......... 74% 21.3M 0s
  5300K .......... .......... .......... .......... .......... 75% 23.9M 0s
  5350K .......... .......... .......... .......... .......... 76% 21.9M 0s
  5400K .......... .......... .......... .......... .......... 77% 24.5M 0s
  5450K .......... .......... .......... .......... .......... 77% 23.0M 0s
  5500K .......... .......... .......... .......... .......... 78% 22.0M 0s
  5550K .......... .......... .......... .......... .......... 79% 23.3M 0s
  5600K .......... .......... .......... .......... .......... 79% 32.1M 0s
  5650K .......... .......... .......... .......... .......... 80% 63.5M 0s
  5700K .......... .......... .......... .......... .......... 81% 63.5M 0s
  5750K .......... .......... .......... .......... .......... 81% 49.6M 0s
  5800K .......... .......... .......... .......... .......... 82% 52.1M 0s
  5850K .......... .......... .......... .......... .......... 83% 56.5M 0s
  5900K .......... .......... .......... .......... .......... 84% 56.7M 0s
  5950K .......... .......... .......... .......... .......... 84% 54.9M 0s
  6000K .......... .......... .......... .......... .......... 85% 44.6M 0s
  6050K .......... .......... .......... .......... .......... 86% 50.4M 0s
  6100K .......... .......... .......... .......... .......... 86% 63.8M 0s
  6150K .......... .......... .......... .......... .......... 87% 50.6M 0s
  6200K .......... .......... .......... .......... .......... 88% 32.3M 0s
  6250K .......... .......... .......... .......... .......... 89% 18.5M 0s
  6300K .......... .......... .......... .......... .......... 89% 7.59M 0s
  6350K .......... .......... .......... .......... .......... 90%  149M 0s
  6400K .......... .......... .......... .......... .......... 91%  118M 0s
  6450K .......... .......... .......... .......... .......... 91% 36.8M 0s
  6500K .......... .......... .......... .......... .......... 92% 24.4M 0s
  6550K .......... .......... .......... .......... .......... 93% 25.7M 0s
  6600K .......... .......... .......... .......... .......... 94% 23.2M 0s
  6650K .......... .......... .......... .......... .......... 94% 2.17M 0s
  6700K .......... .......... .......... .......... .......... 95% 64.4M 0s
  6750K .......... .......... .......... .......... .......... 96% 57.3M 0s
  6800K .......... .......... .......... .......... .......... 96% 31.5M 0s
  6850K .......... .......... .......... .......... .......... 97% 55.0M 0s
  6900K .......... .......... .......... .......... .......... 98% 39.6M 0s
  6950K .......... .......... .......... .......... .......... 98% 61.8M 0s
  7000K .......... .......... .......... .......... .......... 99% 37.5M 0s
  7050K .......... .......... ....                            100% 59.5M=1.4s

2021-01-13 09:16:38 (4.96 MB/s) - ‘linux-media.tar.bz2’ saved [7244164/7244164]

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
scripts/make_makefile.pl
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cx25840-core.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-core.c>:31:10: fatal error: uapi/linux/ccs.h: No such file or directory
 #include <uapi/linux/ccs.h>
          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/usr/src/linux-headers-4.19.0-5-common/scripts/Makefile.build:308: <https://builder.linuxtv.org/job/media-build/ws/v4l/ccs-core.o]> Error 1
make[5]: *** Waiting for unfinished jobs....
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
make[4]: *** [/usr/src/linux-headers-4.19.0-5-common/Makefile:1539: _module_<https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[3]: *** [Makefile:146: sub-make] Error 2
make[2]: *** [Makefile:8: all] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.19.0-5-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
