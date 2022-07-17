Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F613577515
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 10:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbiGQIht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 04:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGQIhs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 04:37:48 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819A31759A
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 01:37:47 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oCzmc-00EZqC-1Q; Sun, 17 Jul 2022 08:37:46 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1oCzmZ-005Gdv-UU; Sun, 17 Jul 2022 08:37:43 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.20] v3: hantro/cedrus/vb2 updates (#84899)
Date:   Sun, 17 Jul 2022 08:37:43 +0000
Message-Id: <20220717083743.1255569-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <7b7eb926-9600-0116-b983-bc18613e7674@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/7b7eb926-9600-0116-b983-bc18613e7674@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/225499/
Build time: 00:46:47
Link: https://lore.kernel.org/linux-media/7b7eb926-9600-0116-b983-bc18613e7674@xs4all.nl

gpg: Signature made Fri 15 Jul 2022 02:49:56 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]

Summary: got 4/20 patches with issues, being 2 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-Add-P010-tiled-format.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5495 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1725742
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 50 seconds
	../drivers/media/test-drivers/vimc/vimc-core.c: ../drivers/media/test-drivers/vimc/vimc-core.c:214 vimc_create_links() warn: passing a valid pointer to 'PTR_ERR'
	../drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun6i_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
	../drivers/media/usb/uvc/uvc_ctrl.c: ../drivers/media/usb/uvc/uvc_ctrl.c:2472 uvc_ctrl_init_ctrl() error: we previously assumed 'mapping' could be null (see line 2458)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2884 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-Add-P010-tiled-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:73: WARNING: line length of 165 exceeds 100 columns
	-:85: ERROR: trailing statements should be on next line
	-:97: WARNING: line length of 107 exceeds 100 columns

patches/0014-media-cedrus-h265-Implement-support-for-tiles.patch:

   checkpatch.pl:
	$ cat patches/0014-media-cedrus-h265-Implement-support-for-tiles.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:72: CHECK: Alignment should match open parenthesis
	-:74: CHECK: Alignment should match open parenthesis

patches/0015-videobuf2-Introduce-vb2_find_buffer.patch:

    allyesconfig: return code #0:
	../drivers/media/usb/uvc/uvc_ctrl.c: ../drivers/media/usb/uvc/uvc_ctrl.c:2472 uvc_ctrl_init_ctrl() error: we previously assumed 'mapping' could be null (see line 2458)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2858 em28xx_v4l2_init() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1725741
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 52 seconds

patches/0020-rkvdec-Use-vb2_find_buffer.patch:

   checkpatch.pl:
	$ cat patches/0020-rkvdec-Use-vb2_find_buffer.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:57: CHECK: Comparison to NULL could be written "run->ref_buf[ref->index]"


Error #512 when building PDF docs

