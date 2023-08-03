Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01C3B76F591
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 00:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232591AbjHCWTs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 18:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232583AbjHCWTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 18:19:42 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF563C3A
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 15:19:28 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qRgfF-009cwt-K5; Thu, 03 Aug 2023 22:19:25 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qRgfC-00CWKi-2J;
        Thu, 03 Aug 2023 22:19:23 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.6] V4L2 patches for 6.6 (#93899)
Date:   Thu,  3 Aug 2023 22:19:20 +0000
Message-Id: <20230803221920.2984215-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZMwT47FMjDGIBgNe@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZMwT47FMjDGIBgNe@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/327697/
Build time: 00:18:51
Link: https://lore.kernel.org/linux-media/ZMwT47FMjDGIBgNe@valkosipuli.retiisi.eu

gpg: Signature made Thu 03 Aug 2023 04:28:28 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: got 14/84 patches with issues, being 4 at build time

Error/warnings:

patches/0001-media-i2c-Add-a-camera-sensor-top-level-menu.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2890 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000004Kb sm_state_count = 1971076
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 55 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression

   checkpatch.pl:
	$ cat patches/0001-media-i2c-Add-a-camera-sensor-top-level-menu.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:17: WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
	-:36: WARNING: please write a help paragraph that fully describes the config symbol

patches/0006-media-subdev-Constify-v4l2_subdev_set_routing_with_f.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2890 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000004Kb sm_state_count = 1971399
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 56 seconds
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression

patches/0008-media-Add-MIPI-CCI-register-access-helper-functions.patch:

   checkpatch.pl:
	$ cat patches/0008-media-Add-MIPI-CCI-register-access-helper-functions.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:44: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0011-media-atomisp-ov2680-Convert-to-new-CCI-register-acc.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:458 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 450)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:497 ov2680_s_stream() warn: missing error code 'ret'

patches/0012-media-Remove-ov_16bit_addr_reg_helpers.h.patch:

   checkpatch.pl:
	$ cat patches/0012-media-Remove-ov_16bit_addr_reg_helpers.h.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:19: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0020-media-rcar-csi2-Add-support-for-C-PHY-on-R-Car-V4H.patch:

   checkpatch.pl:
	$ cat patches/0020-media-rcar-csi2-Add-support-for-C-PHY-on-R-Car-V4H.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:99: WARNING: line length of 123 exceeds 100 columns
	-:100: WARNING: line length of 123 exceeds 100 columns
	-:101: WARNING: line length of 123 exceeds 100 columns
	-:102: WARNING: line length of 123 exceeds 100 columns
	-:103: WARNING: line length of 123 exceeds 100 columns
	-:104: WARNING: line length of 123 exceeds 100 columns
	-:105: WARNING: line length of 123 exceeds 100 columns
	-:106: WARNING: line length of 123 exceeds 100 columns
	-:107: WARNING: line length of 123 exceeds 100 columns
	-:108: WARNING: line length of 123 exceeds 100 columns
	-:109: WARNING: line length of 123 exceeds 100 columns
	-:110: WARNING: line length of 123 exceeds 100 columns
	-:111: WARNING: line length of 123 exceeds 100 columns
	-:112: WARNING: line length of 123 exceeds 100 columns
	-:113: WARNING: line length of 123 exceeds 100 columns
	-:114: WARNING: line length of 123 exceeds 100 columns
	-:115: WARNING: line length of 123 exceeds 100 columns
	-:116: WARNING: line length of 123 exceeds 100 columns
	-:117: WARNING: line length of 123 exceeds 100 columns
	-:118: WARNING: line length of 123 exceeds 100 columns
	-:119: WARNING: line length of 123 exceeds 100 columns
	-:120: WARNING: line length of 123 exceeds 100 columns
	-:121: WARNING: line length of 123 exceeds 100 columns
	-:122: WARNING: line length of 123 exceeds 100 columns
	-:123: WARNING: line length of 123 exceeds 100 columns
	-:124: WARNING: line length of 123 exceeds 100 columns
	-:125: WARNING: line length of 123 exceeds 100 columns
	-:126: WARNING: line length of 123 exceeds 100 columns
	-:127: WARNING: line length of 123 exceeds 100 columns
	-:128: WARNING: line length of 123 exceeds 100 columns
	-:129: WARNING: line length of 123 exceeds 100 columns
	-:130: WARNING: line length of 123 exceeds 100 columns
	-:131: WARNING: line length of 123 exceeds 100 columns
	-:132: WARNING: line length of 123 exceeds 100 columns
	-:133: WARNING: line length of 123 exceeds 100 columns
	-:134: WARNING: line length of 123 exceeds 100 columns

patches/0031-media-ipu-bridge-Move-ipu-bridge.h-to-include-media.patch:

   checkpatch.pl:
	$ cat patches/0031-media-ipu-bridge-Move-ipu-bridge.h-to-include-media.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:15: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0034-media-atomisp-csi2-bridge-Switch-to-new-common-ipu_b.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?

patches/0037-media-i2c-Add-driver-for-DW9719-VCM.patch:

   checkpatch.pl:
	$ cat patches/0037-media-i2c-Add-driver-for-DW9719-VCM.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:47: WARNING: please write a help paragraph that fully describes the config symbol

patches/0038-media-pci-intel-ivsc-Add-CSI-submodule.patch:

   checkpatch.pl:
	$ cat patches/0038-media-pci-intel-ivsc-Add-CSI-submodule.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:54: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0039-media-pci-intel-ivsc-Add-ACE-submodule.patch:

   checkpatch.pl:
	$ cat patches/0039-media-pci-intel-ivsc-Add-ACE-submodule.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:46: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0047-media-ov5640-Fix-initial-RESETB-state-and-annotate-t.patch:

   checkpatch.pl:
	$ cat patches/0047-media-ov5640-Fix-initial-RESETB-state-and-annotate-t.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:22: WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report

patches/0080-media-atomisp-Drop-atomisp-ov2680-sensor-driver.patch:

   checkpatch.pl:
	$ cat patches/0080-media-atomisp-Drop-atomisp-ov2680-sensor-driver.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:62: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0084-media-i2c-ccs-Check-rules-is-non-NULL.patch:

   checkpatch.pl:
	$ cat patches/0084-media-i2c-ccs-Check-rules-is-non-NULL.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:16: WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
	-:117: WARNING: line length of 101 exceeds 100 columns

