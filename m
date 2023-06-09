Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF02729D2A
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 16:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241332AbjFIOna (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 10:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241306AbjFIOn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 10:43:29 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0763585
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 07:43:26 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7dKn-000BHJ-0Z; Fri, 09 Jun 2023 14:43:25 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1q7dKk-00F0L9-PW; Fri, 09 Jun 2023 14:43:22 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.5] (v2) Add AV1 stateless decoder support (#92432)
Date:   Fri,  9 Jun 2023 14:43:22 +0000
Message-Id: <20230609144322.3576181-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <9f27c809-f0ff-44d5-1e9f-ea4a369f5a4f@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/9f27c809-f0ff-44d5-1e9f-ea4a369f5a4f@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/313145/
Build time: 00:49:06
Link: https://lore.kernel.org/linux-media/9f27c809-f0ff-44d5-1e9f-ea4a369f5a4f@xs4all.nl

gpg: Signature made Fri 09 Jun 2023 09:33:06 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 8/15 patches with issues, being 6 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-Add-AV1-uAPI.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	SPARSE:../drivers/staging/media/tegra-video/vip.c ../drivers/staging/media/tegra-video/vip.c:280:24: warning: symbol 'tegra_vip_driver' was not declared. Should it be static?
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000032Kb sm_state_count = 1966364
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 53 seconds
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2864 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-Add-AV1-uAPI.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:1388: WARNING: Avoid logging continuation uses where feasible
	-:1391: WARNING: Avoid logging continuation uses where feasible
	-:1394: WARNING: Avoid logging continuation uses where feasible
	-:1397: WARNING: Avoid logging continuation uses where feasible
	-:1784: ERROR: trailing statements should be on next line

patches/0004-v4l2-common-Add-support-for-fractional-bpp.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/staging/media/tegra-video/vip.c ../drivers/staging/media/tegra-video/vip.c:280:24: warning: symbol 'tegra_vip_driver' was not declared. Should it be static?
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2799 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1963608
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 55 seconds
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression

   checkpatch.pl:
	$ cat patches/0004-v4l2-common-Add-support-for-fractional-bpp.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:47: WARNING: line length of 191 exceeds 100 columns
	-:48: WARNING: line length of 191 exceeds 100 columns
	-:49: WARNING: line length of 191 exceeds 100 columns
	-:50: WARNING: line length of 191 exceeds 100 columns
	-:51: WARNING: line length of 191 exceeds 100 columns
	-:52: WARNING: line length of 191 exceeds 100 columns
	-:53: WARNING: line length of 191 exceeds 100 columns
	-:54: WARNING: line length of 191 exceeds 100 columns
	-:55: WARNING: line length of 191 exceeds 100 columns
	-:56: WARNING: line length of 191 exceeds 100 columns
	-:57: WARNING: line length of 191 exceeds 100 columns
	-:58: WARNING: line length of 191 exceeds 100 columns
	-:59: WARNING: line length of 191 exceeds 100 columns
	-:60: WARNING: line length of 191 exceeds 100 columns
	-:61: WARNING: line length of 191 exceeds 100 columns
	-:62: WARNING: line length of 191 exceeds 100 columns
	-:63: WARNING: line length of 191 exceeds 100 columns
	-:64: WARNING: line length of 192 exceeds 100 columns
	-:65: WARNING: line length of 193 exceeds 100 columns
	-:74: WARNING: line length of 191 exceeds 100 columns
	-:75: WARNING: line length of 191 exceeds 100 columns
	-:76: WARNING: line length of 191 exceeds 100 columns
	-:77: WARNING: line length of 191 exceeds 100 columns
	-:78: WARNING: line length of 191 exceeds 100 columns
	-:79: WARNING: line length of 192 exceeds 100 columns
	-:98: WARNING: line length of 191 exceeds 100 columns
	-:99: WARNING: line length of 191 exceeds 100 columns
	-:100: WARNING: line length of 191 exceeds 100 columns
	-:101: WARNING: line length of 191 exceeds 100 columns
	-:102: WARNING: line length of 191 exceeds 100 columns
	-:103: WARNING: line length of 191 exceeds 100 columns
	-:104: WARNING: line length of 191 exceeds 100 columns
	-:105: WARNING: line length of 191 exceeds 100 columns
	-:107: WARNING: line length of 191 exceeds 100 columns
	-:108: WARNING: line length of 191 exceeds 100 columns
	-:109: WARNING: line length of 191 exceeds 100 columns
	-:110: WARNING: line length of 191 exceeds 100 columns
	-:111: WARNING: line length of 191 exceeds 100 columns
	-:112: WARNING: line length of 191 exceeds 100 columns
	-:113: WARNING: line length of 191 exceeds 100 columns
	-:118: WARNING: line length of 192 exceeds 100 columns
	-:119: WARNING: line length of 192 exceeds 100 columns
	-:134: WARNING: line length of 191 exceeds 100 columns
	-:135: WARNING: line length of 191 exceeds 100 columns
	-:136: WARNING: line length of 191 exceeds 100 columns
	-:137: WARNING: line length of 191 exceeds 100 columns
	-:138: WARNING: line length of 191 exceeds 100 columns
	-:139: WARNING: line length of 191 exceeds 100 columns
	-:141: WARNING: line length of 191 exceeds 100 columns
	-:142: WARNING: line length of 191 exceeds 100 columns
	-:143: WARNING: line length of 191 exceeds 100 columns
	-:144: WARNING: line length of 191 exceeds 100 columns
	-:145: WARNING: line length of 191 exceeds 100 columns
	-:168: WARNING: line length of 199 exceeds 100 columns
	-:169: WARNING: line length of 199 exceeds 100 columns
	-:170: WARNING: line length of 199 exceeds 100 columns
	-:171: WARNING: line length of 199 exceeds 100 columns
	-:172: WARNING: line length of 199 exceeds 100 columns
	-:173: WARNING: line length of 199 exceeds 100 columns
	-:174: WARNING: line length of 199 exceeds 100 columns
	-:175: WARNING: line length of 199 exceeds 100 columns
	-:176: WARNING: line length of 199 exceeds 100 columns
	-:177: WARNING: line length of 199 exceeds 100 columns
	-:178: WARNING: line length of 199 exceeds 100 columns
	-:179: WARNING: line length of 199 exceeds 100 columns
	-:180: WARNING: line length of 199 exceeds 100 columns
	-:181: WARNING: line length of 199 exceeds 100 columns
	-:182: WARNING: line length of 199 exceeds 100 columns
	-:183: WARNING: line length of 199 exceeds 100 columns
	-:184: WARNING: line length of 199 exceeds 100 columns
	-:185: WARNING: line length of 199 exceeds 100 columns
	-:186: WARNING: line length of 199 exceeds 100 columns
	-:187: WARNING: line length of 199 exceeds 100 columns
	-:196: WARNING: line length of 119 exceeds 100 columns
	-:223: WARNING: line length of 112 exceeds 100 columns

patches/0005-media-Add-NV15_4L4-pixel-format.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/staging/media/tegra-video/vip.c ../drivers/staging/media/tegra-video/vip.c:280:24: warning: symbol 'tegra_vip_driver' was not declared. Should it be static?
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:416 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:212 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3013 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3112 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2775 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2864 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: OOM: 3000016Kb sm_state_count = 1963619
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2570 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 54 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression

   checkpatch.pl:
	$ cat patches/0005-media-Add-NV15_4L4-pixel-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:60: WARNING: line length of 191 exceeds 100 columns
	-:73: ERROR: trailing statements should be on next line

patches/0010-media-verisilicon-Add-AV1-entropy-helpers.patch:

   checkpatch.pl:
	$ cat patches/0010-media-verisilicon-Add-AV1-entropy-helpers.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:96: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:118: ERROR: Macros with complex values should be enclosed in parentheses
	-:120: ERROR: Macros with complex values should be enclosed in parentheses
	-:122: ERROR: Macros with complex values should be enclosed in parentheses
	-:124: ERROR: Macros with complex values should be enclosed in parentheses
	-:126: ERROR: Macros with complex values should be enclosed in parentheses
	-:129: ERROR: Macros with complex values should be enclosed in parentheses
	-:132: ERROR: Macros with complex values should be enclosed in parentheses
	-:135: ERROR: Macros with complex values should be enclosed in parentheses
	-:138: ERROR: Macros with complex values should be enclosed in parentheses
	-:141: ERROR: Macros with complex values should be enclosed in parentheses
	-:144: ERROR: Macros with complex values should be enclosed in parentheses
	-:147: ERROR: Macros with complex values should be enclosed in parentheses
	-:151: ERROR: Macros with complex values should be enclosed in parentheses
	-:155: ERROR: Macros with complex values should be enclosed in parentheses

patches/0011-media-verisilicon-Add-Rockchip-AV1-decoder.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c ../drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:2019:34: warning: symbol 'rockchip_vpu981_postproc_ops' was not declared. Should it be static?

   checkpatch.pl:
	$ cat patches/0011-media-verisilicon-Add-Rockchip-AV1-decoder.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:143: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:670: WARNING: line length of 117 exceeds 100 columns
	-:694: ERROR: trailing statements should be on next line
	-:983: WARNING: line length of 101 exceeds 100 columns

patches/0012-media-verisilicon-Add-film-grain-feature-to-AV1-driv.patch:

    allyesconfig: return code #0:
	SPARSE:../drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c ../drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c:2229:34: warning: symbol 'rockchip_vpu981_postproc_ops' was not declared. Should it be static?

   checkpatch.pl:
	$ cat patches/0012-media-verisilicon-Add-film-grain-feature-to-AV1-driv.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:64: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
	-:494: WARNING: function definition argument 's32' should also have an identifier name
	-:494: WARNING: function definition argument 's32' should also have an identifier name
	-:494: WARNING: function definition argument 's32' should also have an identifier name
	-:494: WARNING: function definition argument 's32' should also have an identifier name
	-:494: WARNING: function definition argument 's32' should also have an identifier name
	-:534: WARNING: line length of 105 exceeds 100 columns

patches/0014-media-verisilicon-Conditionally-ignore-native-format.patch:

   checkpatch.pl:
	$ cat patches/0014-media-verisilicon-Conditionally-ignore-native-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:161: CHECK: Unnecessary parentheses around 'formats[i].codec_mode !=
	-:192: WARNING: line length of 105 exceeds 100 columns

patches/0015-media-mediatek-vcodec-support-stateless-AV1-decoder.patch:

    allyesconfig: return code #0:
	../drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c: ../drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c:347 vdec_msg_queue_init() warn: missing unwind goto?

   checkpatch.pl:
	$ cat patches/0015-media-mediatek-vcodec-support-stateless-AV1-decoder.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:128: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?


Error #512 when building PDF docs

