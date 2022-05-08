Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A377451EC70
	for <lists+linux-media@lfdr.de>; Sun,  8 May 2022 11:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbiEHJYI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 May 2022 05:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbiEHJYI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 May 2022 05:24:08 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34ECE01F
        for <linux-media@vger.kernel.org>; Sun,  8 May 2022 02:20:16 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nnd5K-002QmE-OG; Sun, 08 May 2022 09:20:15 +0000
Received: from localhost ([127.0.0.1] helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nnd5J-009AMA-Ap; Sun, 08 May 2022 09:20:12 +0000
Date:   Sun, 8 May 2022 09:20:12 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <544003635.1.1652001612830@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3890
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/3890/display/redirect>

Changes:


------------------------------------------
[...truncated 17.97 KB...]
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
No version yet, using 5.10.0-12-amd64
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 5.10.0-12-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/ccs.patch
patch -s -f -N -p1 -i ../backports/rc-cec.patch
patch -s -f -N -p1 -i ../backports/v5.17_spi.patch
patch -s -f -N -p1 -i ../backports/v5.17_iosys.patch
patch -s -f -N -p1 -i ../backports/v5.17_overflow.patch
patch -s -f -N -p1 -i ../backports/v5.15_container_of.patch
patch -s -f -N -p1 -i ../backports/v5.14_bus_void_return.patch
patch -s -f -N -p1 -i ../backports/v5.13_atmel.patch
patch -s -f -N -p1 -i ../backports/v5.13_stk1160.patch
patch -s -f -N -p1 -i ../backports/v5.12_uvc.patch
patch -s -f -N -p1 -i ../backports/v5.11_isa.patch
patch -s -f -N -p1 -i ../backports/v5.10_vb2_dma_buf_map.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
./scripts/make_kconfig.pl /lib/modules/5.10.0-12-amd64/build /lib/modules/5.10.0-12-amd64/source 1
Preparing to compile for kernel version 5.10.0

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
VIDEO_MEM2MEM_DEINTERLACE: Requires at least kernel 9.255.255
VIDEO_OMAP3: Requires at least kernel 9.255.255
VIDEO_HI556: Requires at least kernel 9.255.255
VIDEO_IMX208: Requires at least kernel 9.255.255
VIDEO_IMX258: Requires at least kernel 9.255.255
VIDEO_IMX274: Requires at least kernel 9.255.255
VIDEO_IMX319: Requires at least kernel 9.255.255
VIDEO_OV02A10: Requires at least kernel 9.255.255
VIDEO_OV2740: Requires at least kernel 9.255.255
VIDEO_OV5670: Requires at least kernel 9.255.255
VIDEO_OV5675: Requires at least kernel 9.255.255
VIDEO_OV772X: Requires at least kernel 9.255.255
VIDEO_OV8856: Requires at least kernel 9.255.255
VIDEO_OV9650: Requires at least kernel 9.255.255
VIDEO_ISL7998X: Requires at least kernel 9.255.255
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
perl scripts/make_config_compat.pl /lib/modules/5.10.0-12-amd64/source ./.myconfig ./config-compat.h
creating symbolic links...
Kernel build directory is /lib/modules/5.10.0-12-amd64/build
make -C ../linux apply_patches
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Patches for 5.10.0-12-amd64 already applied.
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make -C /lib/modules/5.10.0-12-amd64/build M=<https://builder.linuxtv.org/job/media-build/ws/v4l>  modules
make[2]: Entering directory '/usr/src/linux-headers-5.10.0-12-amd64'
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/max2175.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ad5820.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ad9389b.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adp1653.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7170.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7175.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7180.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7183.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7343.o>
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-device.h>:13,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7343.c>:33:
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>: In function 'v4l2_subdev_get_unlocked_active_state':
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>:1263:3: error: implicit declaration of function 'lockdep_assert_not_held'; did you mean 'lockdep_assert_held'? [-Werror=implicit-function-declaration]
 1263 |   lockdep_assert_not_held(sd->active_state->lock);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
      |   lockdep_assert_held
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-12-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7343.o]> Error 1
make[4]: *** Waiting for unfinished jobs....
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/i2c/adp1653.h>:21,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/adp1653.c>:26:
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>: In function 'v4l2_subdev_get_unlocked_active_state':
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>:1263:3: error: implicit declaration of function 'lockdep_assert_not_held'; did you mean 'lockdep_assert_held'? [-Werror=implicit-function-declaration]
 1263 |   lockdep_assert_not_held(sd->active_state->lock);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
      |   lockdep_assert_held
cc1: some warnings being treated as errors
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-device.h>:13,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7170.c>:25:
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>: In function 'v4l2_subdev_get_unlocked_active_state':
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>:1263:3: error: implicit declaration of function 'lockdep_assert_not_held'; did you mean 'lockdep_assert_held'? [-Werror=implicit-function-declaration]
 1263 |   lockdep_assert_not_held(sd->active_state->lock);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
      |   lockdep_assert_held
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-12-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7170.o]> Error 1
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-device.h>:13,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7175.c>:21:
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>: In function 'v4l2_subdev_get_unlocked_active_state':
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>:1263:3: error: implicit declaration of function 'lockdep_assert_not_held'; did you mean 'lockdep_assert_held'? [-Werror=implicit-function-declaration]
 1263 |   lockdep_assert_not_held(sd->active_state->lock);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
      |   lockdep_assert_held
cc1: some warnings being treated as errors
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-device.h>:13,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7183.c>:20:
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>: In function 'v4l2_subdev_get_unlocked_active_state':
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>:1263:3: error: implicit declaration of function 'lockdep_assert_not_held'; did you mean 'lockdep_assert_held'? [-Werror=implicit-function-declaration]
 1263 |   lockdep_assert_not_held(sd->active_state->lock);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
      |   lockdep_assert_held
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-12-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7183.o]> Error 1
make[4]: *** [/usr/src/linux-headers-5.10.0-12-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7175.o]> Error 1
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-device.h>:13,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7180.c>:20:
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>: In function 'v4l2_subdev_get_unlocked_active_state':
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>:1263:3: error: implicit declaration of function 'lockdep_assert_not_held'; did you mean 'lockdep_assert_held'? [-Werror=implicit-function-declaration]
 1263 |   lockdep_assert_not_held(sd->active_state->lock);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
      |   lockdep_assert_held
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-12-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/adv7180.o]> Error 1
make[4]: *** [/usr/src/linux-headers-5.10.0-12-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/adp1653.o]> Error 1
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-device.h>:13,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/max2175.c>:24:
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>: In function 'v4l2_subdev_get_unlocked_active_state':
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>:1263:3: error: implicit declaration of function 'lockdep_assert_not_held'; did you mean 'lockdep_assert_held'? [-Werror=implicit-function-declaration]
 1263 |   lockdep_assert_not_held(sd->active_state->lock);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
      |   lockdep_assert_held
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-12-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/max2175.o]> Error 1
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-device.h>:13,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/ad5820.c>:25:
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>: In function 'v4l2_subdev_get_unlocked_active_state':
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>:1263:3: error: implicit declaration of function 'lockdep_assert_not_held'; did you mean 'lockdep_assert_held'? [-Werror=implicit-function-declaration]
 1263 |   lockdep_assert_not_held(sd->active_state->lock);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
      |   lockdep_assert_held
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-12-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/ad5820.o]> Error 1
In file included from <https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-device.h>:13,
                 from <https://builder.linuxtv.org/job/media-build/ws/v4l/ad9389b.c>:22:
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>: In function 'v4l2_subdev_get_unlocked_active_state':
<https://builder.linuxtv.org/job/media-build/ws/v4l/../linux/include/media/v4l2-subdev.h>:1263:3: error: implicit declaration of function 'lockdep_assert_not_held'; did you mean 'lockdep_assert_held'? [-Werror=implicit-function-declaration]
 1263 |   lockdep_assert_not_held(sd->active_state->lock);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
      |   lockdep_assert_held
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-12-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/ad9389b.o]> Error 1
make[3]: *** [/usr/src/linux-headers-5.10.0-12-common/Makefile:1846: <https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[2]: *** [/usr/src/linux-headers-5.10.0-12-common/Makefile:185: __sub-make] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-5.10.0-12-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
