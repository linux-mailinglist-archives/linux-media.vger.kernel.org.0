Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F217A76B597
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 15:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233947AbjHANNW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 09:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233881AbjHANNR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 09:13:17 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5321AA
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 06:13:15 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qQpBZ-008Ofn-N0; Tue, 01 Aug 2023 13:13:13 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qQpBW-001JE0-2U;
        Tue, 01 Aug 2023 13:13:10 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR 6.6] Ds90ub9xx driver fixes and improvements (#93729)
Date:   Tue,  1 Aug 2023 13:13:09 +0000
Message-Id: <20230801131309.312219-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZMj7Dbg8iLAznZyi@valkosipuli.retiisi.eu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZMj7Dbg8iLAznZyi@valkosipuli.retiisi.eu/
Build log: https://builder.linuxtv.org/job/patchwork/327062/
Build time: 00:30:22
Link: https://lore.kernel.org/linux-media/ZMj7Dbg8iLAznZyi@valkosipuli.retiisi.eu

gpg: Signature made Tue 01 Aug 2023 12:25:24 PM UTC
gpg:                using DSA key 53AC58A5F5948636C04A1BF8141DFA54A1EC8DEA
gpg:                issuer "sakari.ailus@linux.intel.com"
gpg: Good signature from "Sakari Ailus <sakari.ailus@linux.intel.com>" [full]

Summary: got 9/9 patches with issues, being 9 at build time

Error/warnings:

patches/0001-media-i2c-ds90ub9x3-Fix-sub-device-matching.patch:

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
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000008Kb sm_state_count = 1971102
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 58 seconds
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2890 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-i2c-ds90ub9x3-Fix-sub-device-matching.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 1029939b3782 ("media: v4l: async: Simplify async sub-device fwnode matching")'

patches/0002-media-i2c-ds90ub960-Configure-CSI-2-continuous-clock.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1788 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.

patches/0003-media-i2c-ds90ub953-Use-v4l2_fwnode_endpoint_parse.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:644 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:644 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:644 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.

patches/0004-media-i2c-ds90ub913-Use-v4l2_fwnode_endpoint_parse.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:481 ub913_log_status() error: uninitialized symbol 'v1'.
	../drivers/media/i2c/ds90ub913.c: ../drivers/media/i2c/ds90ub913.c:481 ub913_log_status() error: uninitialized symbol 'v2'.

patches/0005-media-i2c-ds90ub953-Handle-V4L2_MBUS_CSI2_NONCONTINU.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:645 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:645 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:645 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.

patches/0006-media-i2c-ds90ub960-Allow-FPD-Link-async-mode.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1788 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.

patches/0007-media-i2c-ds90ub953-Restructure-clkout-management.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:654 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:654 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:654 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.

patches/0008-media-i2c-ds90ub953-Support-non-sync-mode.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:655 ub953_log_status() error: uninitialized symbol 'gpio_local_data'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:655 ub953_log_status() error: uninitialized symbol 'gpio_input_ctrl'.
	../drivers/media/i2c/ds90ub953.c: ../drivers/media/i2c/ds90ub953.c:655 ub953_log_status() error: uninitialized symbol 'gpio_pin_sts'.

patches/0009-media-i2c-ds90ub960-Rename-RXPORT_MODE_CSI2_ASYNC-to.patch:

    allyesconfig: return code #0:
	../drivers/media/i2c/ds90ub960.c: ../drivers/media/i2c/ds90ub960.c:1788 ub960_init_tx_ports() error: uninitialized symbol 'pll_div'.

