Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C4E7E4F10
	for <lists+linux-media@lfdr.de>; Wed,  8 Nov 2023 03:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234851AbjKHCp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 21:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235397AbjKHCp4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 21:45:56 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42CE9D78
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 18:45:54 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAE9C433C8
        for <linux-media@vger.kernel.org>; Wed,  8 Nov 2023 02:45:53 +0000 (UTC)
Date:   Wed, 08 Nov 2023 03:45:51 +0100
Message-ID: <2cfc33811f9b2913aabf506ebc2b94d4.hverkuil@xs4all.nl>
From:   "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: cron job: media_tree daily build: WARNINGS
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This message is generated daily by a cron job that builds media_tree for
the architectures in the list below.

Results of the daily build of media_tree:

date:			Wed Nov  8 03:00:12 CET 2023
media-tree git repo:	git://linuxtv.org/hverkuil/media_tree.git
media-tree git branch:	media_stage/master
media-tree git hash:	3e238417254bfdcc23fe207780b59cbb08656762
v4l-utils git hash:	fcf62ab17d69bc9ddb59e8d0ee7a8b56d9eba336
edid-decode git hash:	385c6cb09714593be3aa5b5d123e4e42bf4fbb05
gcc version:		i686-linux-gcc (GCC) 13.2.0
ccache version:		ccache version 4.8.3
smatch/sparse repo:     git://repo.or.cz/smatch.git
smatch version:		v0.5.0-8522-gd27ec581
sparse version:		v0.5.0-8522-gd27ec581
build-scripts repo:     https://git.linuxtv.org/hverkuil/build-scripts.git
build-scripts git hash: a6e978cf5c59a26504d37fee4ae779ecc19359fb
host hardware:		x86_64
host os:		6.1.55-cobaltpc1

linux-git-powerpc64: OK
linux-git-arm: OK
linux-git-arm64: OK
linux-git-i686: OK
linux-git-x86_64: OK
no-acpi.config: OK
no-of.config: OK
no-pm.config: OK
no-pm-sleep.config: OK
no-debug-fs.config: OK
sparse: WARNINGS:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

smatch: WARNINGS:

drivers/media/usb/dvb-usb/dvb-usb-firmware.c:121 dvb_usb_download_firmware() warn: '&fw' from request_firmware() not released on lines: 121.
drivers/media/i2c/ccs/ccs-core.c:3574 ccs_probe() warn: '&fw' from request_firmware() not released on lines: 3574.
drivers/media/i2c/ccs/ccs-core.c:3574 ccs_probe() warn: '&fw' from request_firmware() not released on lines: 3574.
drivers/media/platform/amphion/vpu_core.c:72 vpu_core_load_firmware() warn: '&pfw' from request_firmware() not released on lines: 72.
drivers/media/i2c/cx25840/cx25840-firmware.c:155 cx25840_loadfw() warn: '&fw' from request_firmware() not released on lines: 137,155.
drivers/media/usb/dvb-usb/gp8psk.c:180 gp8psk_load_bcm4500fw() warn: '&fw' from request_firmware() not released on lines: 180.
drivers/media/radio/wl128x/fmdrv_common.c:1291 fm_download_firmware() warn: '&fw_entry' from request_firmware() not released on lines: 1291.
drivers/media/common/siano/smscoreapi.c:1178 smscore_load_firmware_from_file() warn: '&fw' from request_firmware() not released on lines: 1178.
drivers/media/i2c/s5c73m3/s5c73m3-core.c:367 s5c73m3_load_fw() warn: '&fw' from request_firmware() not released on lines: 367.
drivers/media/i2c/adv7180.c:1514 adv7180_probe() warn: 'client->irq' from request_threaded_irq() not released on lines: 1514.
drivers/media/dvb-frontends/drx39xyj/drxj.c:11908 drx_ctrl_u_code() warn: '&fw' from request_firmware() not released on lines: 11877,11886,11896,11908.
drivers/media/usb/dvb-usb/opera1.c:501 opera1_xilinx_load_firmware() warn: '&fw' from request_firmware() not released on lines: 501.
drivers/media/usb/dvb-usb/dib0700_devices.c:2415 stk9090m_frontend_attach() warn: '&state->frontend_firmware' from request_firmware() not released on lines: 2415.
drivers/media/usb/dvb-usb/dib0700_devices.c:2497 nim9090md_frontend_attach() warn: '&state->frontend_firmware' from request_firmware() not released on lines: 2489,2497.
drivers/media/dvb-frontends/af9013.c:1122 af9013_download_firmware() warn: '&firmware' from request_firmware() not released on lines: 1122.
drivers/media/radio/radio-wl1273.c:527 wl1273_fm_upload_firmware_patch() warn: '&fw_p' from request_firmware() not released on lines: 527.
drivers/media/pci/ngene/ngene-core.c:1258 ngene_load_firm() warn: '&fw' from request_firmware() not released on lines: 1258.
drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:53 dvb_usbv2_download_firmware() warn: '&fw' from request_firmware() not released on lines: 53.
drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
drivers/media/usb/siano/smsusb.c:298 smsusb1_load_firmware() warn: '&fw' from request_firmware() not released on lines: 298.
drivers/media/usb/siano/smsusb.c:298 smsusb1_load_firmware() warn: '&fw' from request_firmware() not released on lines: 298.
drivers/media/usb/s2255/s2255drv.c:2335 s2255_probe() warn: '&dev->fw_data->fw' from request_firmware() not released on lines: 2335.
drivers/media/dvb-frontends/cx24116.c:508 cx24116_firmware_ondemand() warn: '&fw' from request_firmware() not released on lines: 508.
drivers/media/dvb-frontends/cx24117.c:488 cx24117_firmware_ondemand() warn: '&fw' from request_firmware() not released on lines: 488.
drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c:329 ttusb_boot_dsp() warn: '&fw' from request_firmware() not released on lines: 329.
drivers/staging/media/meson/vdec/vdec_1.c:83 vdec_1_load_firmware() warn: '&fw' from request_firmware() not released on lines: 83.
drivers/media/platform/mediatek/vpu/mtk_vpu.c:559 load_requested_vpu() warn: '&vpu_fw' from request_firmware() not released on lines: 529.
drivers/media/platform/mediatek/vpu/mtk_vpu.c:559 load_requested_vpu() warn: '&vpu_fw' from request_firmware() not released on lines: 529.
drivers/media/usb/ttusb-dec/ttusb_dec.c:1404 ttusb_dec_boot_dsp() warn: '&fw_entry' from request_firmware() not released on lines: 1333,1346,1362,1371.
drivers/media/usb/dvb-usb-v2/lmedm04.c:755 lme_firmware_switch() warn: '&fw' from request_firmware() not released on lines: 752.
drivers/media/usb/dvb-usb-v2/lmedm04.c:755 lme_firmware_switch() warn: '&fw' from request_firmware() not released on lines: 752.
drivers/media/usb/dvb-usb-v2/lmedm04.c:755 lme_firmware_switch() warn: '&fw' from request_firmware() not released on lines: 752.
drivers/media/pci/bt8xx/bttv-cards.c:3913 pvr_boot() warn: '&fw_entry' from request_firmware() not released on lines: 3913.
drivers/media/usb/as102/as102_fw.c:225 as102_fw_upload() warn: '&firmware' from request_firmware() not released on lines: 225.
drivers/media/usb/as102/as102_fw.c:225 as102_fw_upload() warn: '&firmware' from request_firmware() not released on lines: 225.
drivers/media/tuners/xc5000.c:1213 xc_load_fw_and_init_tuner() warn: '&fw' from request_firmware() not released on lines: 1125,1213.
drivers/media/dvb-frontends/drxd_hard.c:907 load_firmware() warn: '&fw' from request_firmware() not released on lines: 902.
drivers/media/dvb-frontends/ds3000.c:367 ds3000_firmware_ondemand() warn: '&fw' from request_firmware() not released on lines: 367.
drivers/media/platform/qcom/venus/firmware.c:145 venus_load_fw() warn: '&mdt' from request_firmware() not released on lines: 145.
drivers/media/pci/cx18/cx18-firmware.c:123 load_cpu_fw_direct() warn: '&fw' from request_firmware() not released on lines: 112.
drivers/media/pci/cx18/cx18-firmware.c:196 load_apu_fw_direct() warn: '&fw' from request_firmware() not released on lines: 184.
drivers/media/pci/cx18/cx18-av-firmware.c:207 cx18_av_loadfw() warn: '&fw' from request_firmware() not released on lines: 127.
drivers/media/usb/cx231xx/cx231xx-417.c:1075 cx231xx_load_firmware() warn: '&firmware' from request_firmware() not released on lines: 1002,1011,1060,1073.
drivers/media/pci/cx18/cx18-dvb.c:147 yuan_mpc718_mt352_reqfw() warn: 'fw' from request_firmware() not released on lines: 147.
drivers/media/pci/cx23885/cx23885-417.c:995 cx23885_load_firmware() warn: '&firmware' from request_firmware() not released on lines: 934,940,952,963,970.
drivers/staging/media/ipu3/ipu3-css-fw.c:263 imgu_css_fw_init() warn: '&css->fw' from request_firmware() not released on lines: 263.
drivers/staging/media/ipu3/ipu3-css-fw.c:263 imgu_css_fw_init() warn: '&css->fw' from request_firmware() not released on lines: 263.
drivers/media/dvb-frontends/m88ds3103.c:1135 m88ds3103_init() warn: '&firmware' from request_firmware() not released on lines: 1135.
drivers/staging/media/av7110/av7110_hw.c:281 av7110_bootarm() warn: '&fw' from request_firmware() not released on lines: 250,258,269.
drivers/media/usb/go7007/go7007-driver.c:114 go7007_load_encoder() warn: '&fw_entry' from request_firmware() not released on lines: 94,101,114.
drivers/media/usb/go7007/go7007-fw.c:1620 go7007_construct_fw_image() warn: '&fw_entry' from request_firmware() not released on lines: 1620.
drivers/media/usb/go7007/go7007-loader.c:101 go7007_loader_probe() warn: '&fw' from request_firmware() not released on lines: 101.
drivers/media/usb/go7007/go7007-loader.c:101 go7007_loader_probe() warn: '&fw' from request_firmware() not released on lines: 101.
drivers/staging/media/av7110/av7110.c:1537 get_firmware() warn: '&fw' from request_firmware() not released on lines: 1520,1528,1537.
drivers/media/dvb-frontends/mn88472.c:501 mn88472_init() warn: '&firmware' from request_firmware() not released on lines: 501.
drivers/media/dvb-frontends/mn88473.c:549 mn88473_init() warn: '&fw' from request_firmware() not released on lines: 549.
drivers/media/dvb-frontends/mxl692.c:932 mxl692_init() warn: '&firmware' from request_firmware() not released on lines: 932.
drivers/media/dvb-frontends/nxt200x.c:912 nxt2002_init() warn: '&fw' from request_firmware() not released on lines: 875.
drivers/media/dvb-frontends/nxt200x.c:1084 nxt2004_init() warn: '&fw' from request_firmware() not released on lines: 942.
drivers/media/dvb-frontends/or51132.c:358 or51132_set_parameters() warn: '&fw' from request_firmware() not released on lines: 337.
drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c:1147 load_c8sectpfe_fw() warn: '&fw' from request_firmware() not released on lines: 1120,1126,1133.
drivers/media/dvb-frontends/si2165.c:521 si2165_upload_firmware() warn: '&fw' from request_firmware() not released on lines: 521.
drivers/media/platform/st/sti/hva/hva-hw.c:412 hva_hw_probe() warn: 'hva->clk' from clk_prepare() not released on lines: 412.
drivers/media/dvb-frontends/si2168.c:536 si2168_init() warn: '&fw' from request_firmware() not released on lines: 536.
drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c:82 s5p_mfc_load_firmware() warn: '&fw_blob' from request_firmware() not released on lines: 75.
include/linux/ihex.h:82 request_ihex_firmware() warn: '&lfw' from request_firmware() not released on lines: 79.
drivers/media/dvb-frontends/tda10048.c:557 tda10048_firmware_upload() warn: '&fw' from request_firmware() not released on lines: 557.
drivers/media/dvb-frontends/tda10071.c:1035 tda10071_init() warn: '&fw' from request_firmware() not released on lines: 1035.

COMPILE_TEST: OK
strcpy/strncpy/strlcpy: OK
abi-compliance: ABI OK
pahole: ABI OK
utils: OK
spec-git: OK
kerneldoc: OK

date:			Wed Nov  8 03:16:07 CET 2023
virtme-64: WARNINGS: Final Summary: 3218, Succeeded: 3218, Failed: 0, Warnings: 3
virtme-32: WARNINGS: Final Summary: 3342, Succeeded: 3342, Failed: 0, Warnings: 4

date:			Wed Nov  8 03:44:43 CET 2023

Detailed results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.log

Detailed regression test results are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-64-dmesg.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32.log
https://hverkuil.home.xs4all.nl/logs/Wednesday-test-media-32-dmesg.log

Full logs are available here:

https://hverkuil.home.xs4all.nl/logs/Wednesday.tar.bz2

The Media Infrastructure API from this daily build is here:

https://hverkuil.home.xs4all.nl/spec/index.html
