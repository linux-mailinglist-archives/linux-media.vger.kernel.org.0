Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E50A761DA3
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 17:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbjGYPut (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 11:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232210AbjGYPus (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 11:50:48 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1882102
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 08:50:46 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qOKJA-004cWd-VC; Tue, 25 Jul 2023 15:50:44 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qOKJ8-00EnGM-2a;
        Tue, 25 Jul 2023 15:50:42 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v6.5] uvcvideo fix (#93408)
Date:   Tue, 25 Jul 2023 15:50:42 +0000
Message-Id: <20230725155042.3525949-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230725152733.GG21640@pendragon.ideasonboard.com>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230725152733.GG21640@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/325124/
Build time: 00:18:23
Link: https://lore.kernel.org/linux-media/20230725152733.GG21640@pendragon.ideasonboard.com

gpg: Signature made Tue 25 Jul 2023 03:24:37 PM UTC
gpg:                using EDDSA key C09EF871B3827B413F971CA9CC3F2D800327DE64
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 1/1 patches with issues, being 1 at build time

Error/warnings:

patches/0001-media-uvcvideo-Fix-menu-count-handling-for-userspace.patch:

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
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c: ../drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c:143 mtk_vcodec_get_reg_bases() error: buffer overflow 'mtk_dec_reg_names' 11 <= 11
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2772 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: OOM: 3000004Kb sm_state_count = 1967949
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2558 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 53 seconds
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/pvrusb2/pvrusb2-hdw.c: ../drivers/media/usb/pvrusb2/pvrusb2-hdw.c:3293 pvr2_hdw_get_tuner_status() warn: inconsistent indenting

   checkpatch.pl:
	$ cat patches/0001-media-uvcvideo-Fix-menu-count-handling-for-userspace.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:13: WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report

