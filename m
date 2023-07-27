Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D75764FAF
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 11:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbjG0J2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 05:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234080AbjG0J1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 05:27:35 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C29127
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 02:16:53 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qOx74-005XDg-Ro; Thu, 27 Jul 2023 09:16:51 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qOx71-0043Wi-3A;
        Thu, 27 Jul 2023 09:16:48 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.6] Separate sub-device and link creation in V4L2 (#93494)
Date:   Thu, 27 Jul 2023 09:16:46 +0000
Message-Id: <20230727091646.966859-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZMIFk/WXQSPxjryK@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZMIFk/WXQSPxjryK@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/325582/
Build time: 00:18:37
Link: https://lore.kernel.org/linux-media/ZMIFk/WXQSPxjryK@valkosipuli.retiisi.eu

gpg: Signature made Thu 27 Jul 2023 05:32:57 AM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: got 11/38 patches with issues, being 11 at build time

Error/warnings:

patches/0001-media-v4l-async-Drop-v4l2_async_nf_parse_fwnode_endp.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2890 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1971344
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 56 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression

   checkpatch.pl:
	$ cat patches/0001-media-v4l-async-Drop-v4l2_async_nf_parse_fwnode_endp.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:46: CHECK: Please don't use multiple blank lines

patches/0002-media-v4l-fwnode-Remove-unneeded-forward-declaration.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.

patches/0014-media-v4l-async-Make-V4L2-async-match-information-a-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

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
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2884 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000032Kb sm_state_count = 1976038
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 53 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression

patches/0015-media-v4l-async-Rename-V4L2_ASYNC_MATCH_-macros-add-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000004Kb sm_state_count = 1976012
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 55 seconds
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2890 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

patches/0017-media-v4l-async-Clean-up-list-heads-and-entries.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000004Kb sm_state_count = 1971073
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 55 seconds
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2884 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

patches/0019-media-v4l-async-Rename-v4l2_async_subdev-as-v4l2_asy.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

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
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1971588
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 54 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression

patches/0022-media-v4l-async-Rework-internal-lists.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000032Kb sm_state_count = 1969576
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 53 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression

patches/0023-media-v4l-async-Obtain-async-connection-based-on-sub.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000004Kb sm_state_count = 1971439
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 53 seconds
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2884 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

patches/0024-media-v4l-async-Allow-multiple-connections-between-e.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1971081
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 54 seconds
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2890 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

patches/0027-media-v4l-async-Support-fwnode-endpoint-list-matchin.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1968884
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 53 seconds
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2890 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

patches/0037-media-v4l-async-Set-v4l2_device-and-subdev-in-async-.patch:

    allyesconfig: return code #0:
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c: ../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:476 ov2680_init_cfg() error: we previously assumed 'sd_state' could be null (see line 468)
	../drivers/staging/media/atomisp/i2c/atomisp-ov2680.c:524 ov2680_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:447 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_fops.c: ../drivers/staging/media/atomisp/pci/atomisp_fops.c:517 atomisp_open() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2801 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2900 atomisp_cp_morph_table() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:4283 atomisp_set_fmt_to_snr() warn: variable dereferenced before check 'asd' (see line 4268)

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:479 ub913_log_status() error: uninitialized symbol 'v2'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:642 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1780 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1971523
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 53 seconds
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2884 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

