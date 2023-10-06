Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C237E7BB4E1
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 12:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbjJFKJ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 06:09:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbjJFKJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 06:09:23 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1EDBE
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 03:09:16 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qohli-007oQg-Qc; Fri, 06 Oct 2023 10:09:14 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qohlf-0078m2-3A;
        Fri, 06 Oct 2023 10:09:12 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Sean Young <sean@mess.org>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.7] More rc fixes (#95584)
Date:   Fri,  6 Oct 2023 10:09:10 +0000
Message-Id: <20231006100910.1702013-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <ZR/RzbrHMZjn2jrh@gofer.mess.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/ZR/RzbrHMZjn2jrh@gofer.mess.org/
Build log: https://builder.linuxtv.org/job/patchwork/345856/
Build time: 00:34:55
Link: https://lore.kernel.org/linux-media/ZR/RzbrHMZjn2jrh@gofer.mess.org

gpg: Signature made Fri 06 Oct 2023 09:11:47 AM UTC
gpg:                using RSA key A624251A26084A9ED9E4C8B6425F639D3960FA9E
gpg:                issuer "sean@mess.org"
gpg: Good signature from "Sean Young <sean@mess.org>" [full]

Summary: got 1/2 patches with issues, being 1 at build time

Error/warnings:

patches/0001-media-rc-keymaps-add-missing-MODULE_DESCRIPTION-to-k.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/i2c/atomisp-gc0310.c:446 gc0310_s_stream() warn: missing error code 'ret'
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2779 atomisp_cp_dvs_6axis_config() warn: missing unwind goto?
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:2878 atomisp_cp_morph_table() warn: missing unwind goto?

    allyesconfig: return code #0:
	../drivers/media/i2c/adp1653.c: ../drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	../drivers/media/usb/dvb-usb-v2/af9035.c: ../drivers/media/usb/dvb-usb-v2/af9035.c:467 af9035_i2c_master_xfer() warn: inconsistent returns '&d->i2c_mutex'.
	  Locked on  : 326,387
	  Unlocked on: 465,467
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1974 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/i2c/mt9m114.c: ../drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?
	../drivers/media/i2c/ov5645.c: ../drivers/media/i2c/ov5645.c:687 ov5645_set_power_on() warn: 'ov5645->xclk' from clk_prepare_enable() not released on lines: 687.
	../drivers/media/dvb-frontends/mb86a16.c: ../drivers/media/dvb-frontends/mb86a16.c:1449 mb86a16_set_fe() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2213 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2517 dvb_register() parse error: OOM: 3013268Kb sm_state_count = 1753539
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2517 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 76 seconds
	../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c: ../drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2792 mxc_jpeg_probe() warn: missing unwind goto?
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: OOM: 3003988Kb sm_state_count = 2158
	../drivers/media/pci/cx25821/cx25821-medusa-video.c: ../drivers/media/pci/cx25821/cx25821-medusa-video.c:399 medusa_set_videostandard() parse error: __split_smt: function too hairy.  Giving up after 6 seconds
	../drivers/media/usb/uvc/uvc_v4l2.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../include/linux/rcuwait.h, ...):
	SPARSE:../drivers/media/usb/uvc/uvc_v4l2.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/pci/mgb4/mgb4_sysfs_out.c: ../drivers/media/pci/mgb4/mgb4_sysfs_out.c:118 video_source_store() warn: potential spectre issue 'mgbdev->vin' [r] (local cap)
	../drivers/media/pci/mgb4/mgb4_sysfs_out.c: ../drivers/media/pci/mgb4/mgb4_sysfs_out.c:122 video_source_store() warn: possible spectre second half.  'loopin_new'
	../drivers/media/pci/ivtv/ivtvfb.c: note: in included file (through ../arch/x86/include/asm/uaccess.h, ../include/linux/uaccess.h, ../include/linux/sched/task.h, ../include/linux/sched/signal.h, ../drivers/media/pci/ivtv/ivtv-driver.h):
	SPARSE:../drivers/media/pci/ivtv/ivtvfb.c ../arch/x86/include/asm/uaccess_64.h:88:24: warning: cast removes address space '__user' of expression
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2804 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

