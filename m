Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99616482AA4
	for <lists+linux-media@lfdr.de>; Sun,  2 Jan 2022 10:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbiABJTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Jan 2022 04:19:39 -0500
Received: from www.linuxtv.org ([130.149.80.248]:43662 "EHLO www.linuxtv.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbiABJTj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 2 Jan 2022 04:19:39 -0500
Received: from builder.linuxtv.org ([140.211.167.10])
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1n3x1d-00APWj-GW; Sun, 02 Jan 2022 09:19:37 +0000
Received: from [127.0.0.1] (helo=builder.linuxtv.org)
        by builder.linuxtv.org with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1n3x1Z-00H86j-TJ; Sun, 02 Jan 2022 09:19:35 +0000
Date:   Sun, 2 Jan 2022 09:19:33 +0000 (UTC)
From:   Jenkins Builder Robot <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Message-ID: <1716493076.0.1641115173344@builder.linuxtv.org>
In-Reply-To: <2044525779.0.1641028773123@builder.linuxtv.org>
References: <2044525779.0.1641028773123@builder.linuxtv.org>
Subject: Build failed in Jenkins: media-build #3757
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Instance-Identity: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApAf928QubrKEjMQ0IZR0WWXn8zG7uTdH33F2Idx4Xmlp6Z138NdNMQYNG71OKzmvn3/E1G4rpd9JsMls16nRZ2NAPgOWX0qfFr6HyOoQklLGZt+vkOFb0BvmBFfdI+00J5B1SPupxv4pT3bDLSiwbBNCOLY4sdB0gG1ng14mzu47G8zmH6l2ZE/9urEd6OLFhzrb6ym4vlkCE8uvNJAdAWbeafd1plHSLdU/TVqHMZELuM0wt9khqhUOkfE+dHr7h6DNrkFpvm/8j/5wTuy98ZwwWimP+pfjSQMgKrhXjwHcJJa2N9v1HdwrwlUaRYuA6o8fwUHNC9vLj7cCXM3qiwIDAQAB
X-Jenkins-Job: media-build
X-Jenkins-Result: FAILURE
Auto-submitted: auto-generated
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

See <https://builder.linuxtv.org/job/media-build/3757/display/redirect>

Changes:


------------------------------------------
[...truncated 7.67 KB...]
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
No version yet, using 5.10.0-9-amd64
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Applying patches for kernel 5.10.0-9-amd64
patch -s -f -N -p1 -i ../backports/api_version.patch
patch -s -f -N -p1 -i ../backports/pr_fmt.patch
patch -s -f -N -p1 -i ../backports/debug.patch
patch -s -f -N -p1 -i ../backports/drx39xxj.patch
patch -s -f -N -p1 -i ../backports/ccs.patch
patch -s -f -N -p1 -i ../backports/rc-cec.patch
patch -s -f -N -p1 -i ../backports/v5.15_container_of.patch
patch -s -f -N -p1 -i ../backports/v5.14_bus_void_return.patch
patch -s -f -N -p1 -i ../backports/v5.12_uvc.patch
patch -s -f -N -p1 -i ../backports/v5.11_isa.patch
patch -s -f -N -p1 -i ../backports/v5.10_vb2_dma_buf_map.patch
Patched drivers/media/dvb-core/dvbdev.c
Patched drivers/media/v4l2-core/v4l2-dev.c
Patched drivers/media/rc/rc-main.c
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
./scripts/make_kconfig.pl /lib/modules/5.10.0-9-amd64/build /lib/modules/5.10.0-9-amd64/source 1
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
VIDEO_OMAP3: Requires at least kernel 9.255.255
VIDEO_MEM2MEM_DEINTERLACE: Requires at least kernel 9.255.255
VIDEO_IMX258: Requires at least kernel 9.255.255
VIDEO_IMX274: Requires at least kernel 9.255.255
VIDEO_IMX319: Requires at least kernel 9.255.255
VIDEO_OV02A10: Requires at least kernel 9.255.255
VIDEO_OV772X: Requires at least kernel 9.255.255
VIDEO_OV9650: Requires at least kernel 9.255.255
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
perl scripts/make_config_compat.pl /lib/modules/5.10.0-9-amd64/source ./.myconfig ./config-compat.h
creating symbolic links...
Kernel build directory is /lib/modules/5.10.0-9-amd64/build
make -C ../linux apply_patches
make[2]: Entering directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
Patches for 5.10.0-9-amd64 already applied.
make[2]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/linux'>
make -C /lib/modules/5.10.0-9-amd64/build M=<https://builder.linuxtv.org/job/media-build/ws/v4l>  modules
make[2]: Entering directory '/usr/src/linux-headers-5.10.0-9-amd64'
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dw9714.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/dw9768.o>
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
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/bt856.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/bt866.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ks0127.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ths7303.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ths8200.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tvp5150.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tvp514x.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tvp7002.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tw2804.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tw9903.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tw9906.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tw9910.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cs3308.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cs5345.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/cs53l32a.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/m52790.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/tlv320aic23b.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/uda1342.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/wm8775.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/wm8739.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/vp27smpx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/sony-btf-mpx.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/upd64031a.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/upd64083.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov2640.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov2680.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov2685.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov2740.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov5647.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov5648.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov5670.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov5675.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov5693.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov5695.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov6650.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov7251.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov7640.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov7670.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov8856.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov8865.o>
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov9640.o>
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov2740.c>: In function 'ov2740_probe':
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov2740.c>:1165:15: error: implicit declaration of function 'acpi_dev_state_d0'; did you mean 'acpi_dev_suspend'? [-Werror=implicit-function-declaration]
 1165 |  full_power = acpi_dev_state_d0(&client->dev);
      |               ^~~~~~~~~~~~~~~~~
      |               acpi_dev_suspend
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov2740.c>: At top level:
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov2740.c>:1248:3: error: 'struct i2c_driver' has no member named 'flags'
 1248 |  .flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
      |   ^~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov2740.c>:1248:11: error: 'I2C_DRV_ACPI_WAIVE_D0_PROBE' undeclared here (not in a function)
 1248 |  .flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
  CC [M]  <https://builder.linuxtv.org/job/media-build/ws/v4l/ov9734.o>
make[4]: *** [/usr/src/linux-headers-5.10.0-9-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/ov2740.o]> Error 1
make[4]: *** Waiting for unfinished jobs....
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5675.c>: In function 'ov5675_probe':
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5675.c>:1185:15: error: implicit declaration of function 'acpi_dev_state_d0'; did you mean 'acpi_dev_suspend'? [-Werror=implicit-function-declaration]
 1185 |  full_power = acpi_dev_state_d0(&client->dev);
      |               ^~~~~~~~~~~~~~~~~
      |               acpi_dev_suspend
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5675.c>: At top level:
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5675.c>:1264:3: error: 'struct i2c_driver' has no member named 'flags'
 1264 |  .flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
      |   ^~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5675.c>:1264:11: error: 'I2C_DRV_ACPI_WAIVE_D0_PROBE' undeclared here (not in a function)
 1264 |  .flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-9-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/ov5675.o]> Error 1
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5670.c>: In function 'ov5670_probe':
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5670.c>:2493:15: error: implicit declaration of function 'acpi_dev_state_d0'; did you mean 'acpi_dev_suspend'? [-Werror=implicit-function-declaration]
 2493 |  full_power = acpi_dev_state_d0(&client->dev);
      |               ^~~~~~~~~~~~~~~~~
      |               acpi_dev_suspend
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5670.c>: At top level:
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5670.c>:2596:3: error: 'struct i2c_driver' has no member named 'flags'
 2596 |  .flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
      |   ^~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov5670.c>:2596:11: error: 'I2C_DRV_ACPI_WAIVE_D0_PROBE' undeclared here (not in a function)
 2596 |  .flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-9-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/ov5670.o]> Error 1
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov8856.c>: In function 'ov8856_probe':
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov8856.c>:2489:15: error: implicit declaration of function 'acpi_dev_state_d0'; did you mean 'acpi_dev_suspend'? [-Werror=implicit-function-declaration]
 2489 |  full_power = acpi_dev_state_d0(&client->dev);
      |               ^~~~~~~~~~~~~~~~~
      |               acpi_dev_suspend
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov8856.c>: At top level:
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov8856.c>:2580:3: error: 'struct i2c_driver' has no member named 'flags'
 2580 |  .flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
      |   ^~~~~
<https://builder.linuxtv.org/job/media-build/ws/v4l/ov8856.c>:2580:11: error: 'I2C_DRV_ACPI_WAIVE_D0_PROBE' undeclared here (not in a function)
 2580 |  .flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [/usr/src/linux-headers-5.10.0-9-common/scripts/Makefile.build:285: <https://builder.linuxtv.org/job/media-build/ws/v4l/ov8856.o]> Error 1
make[3]: *** [/usr/src/linux-headers-5.10.0-9-common/Makefile:1846: <https://builder.linuxtv.org/job/media-build/ws/v4l]> Error 2
make[2]: *** [/usr/src/linux-headers-5.10.0-9-common/Makefile:185: __sub-make] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-5.10.0-9-amd64'
make[1]: *** [Makefile:53: default] Error 2
make[1]: Leaving directory '<https://builder.linuxtv.org/job/media-build/ws/v4l'>
make: *** [Makefile:26: all] Error 2
build failed at ./build line 533
Build step 'Execute shell' marked build as failure
