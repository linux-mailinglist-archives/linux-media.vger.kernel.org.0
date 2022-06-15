Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54E0A54CC97
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 17:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242731AbiFOPVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 11:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239037AbiFOPVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 11:21:32 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC8024956
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 08:21:30 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o1Upk-004sQr-TT; Wed, 15 Jun 2022 15:21:28 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o1Upi-00C5SS-K2; Wed, 15 Jun 2022 15:21:26 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.20] rkisp1 misc fixes and improvements (#84037)
Date:   Wed, 15 Jun 2022 15:21:26 +0000
Message-Id: <20220615152126.2880870-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YqnuxKlNjA0AaIAR@pendragon.ideasonboard.com>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YqnuxKlNjA0AaIAR@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/216642/
Build time: 00:29:41
Link: https://lore.kernel.org/linux-media/YqnuxKlNjA0AaIAR@pendragon.ideasonboard.com

gpg: Signature made Wed 15 Jun 2022 01:52:17 PM UTC
gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 4/21 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-rkisp1-capture-Initialize-entity-before-video-.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: OOM: 3000004Kb sm_state_count = 543764
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() warn: Function too hairy.  No more merges.
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: __split_smt: function too hairy.  Giving up after 8 seconds

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5539 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000028Kb sm_state_count = 1725876
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 50 seconds
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0008-media-rkisp1-regs-Don-t-use-BIT-macro-for-multi-bit-.patch:

   checkpatch.pl:
	$ cat patches/0008-media-rkisp1-regs-Don-t-use-BIT-macro-for-multi-bit-.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:28: CHECK: Prefer using the BIT macro
	-:37: CHECK: Prefer using the BIT macro
	-:43: CHECK: Prefer using the BIT macro
	-:48: CHECK: Prefer using the BIT macro
	-:52: CHECK: Prefer using the BIT macro
	-:60: CHECK: Prefer using the BIT macro
	-:63: CHECK: Prefer using the BIT macro
	-:68: CHECK: Prefer using the BIT macro
	-:74: CHECK: Prefer using the BIT macro
	-:83: CHECK: Prefer using the BIT macro
	-:87: CHECK: Prefer using the BIT macro
	-:93: CHECK: Prefer using the BIT macro
	-:98: CHECK: Prefer using the BIT macro
	-:102: CHECK: Prefer using the BIT macro
	-:107: CHECK: Prefer using the BIT macro
	-:116: CHECK: Prefer using the BIT macro
	-:120: CHECK: Prefer using the BIT macro
	-:126: CHECK: Prefer using the BIT macro
	-:129: CHECK: Prefer using the BIT macro
	-:136: CHECK: Prefer using the BIT macro
	-:145: CHECK: Prefer using the BIT macro
	-:149: CHECK: Prefer using the BIT macro
	-:158: CHECK: Prefer using the BIT macro
	-:167: CHECK: Prefer using the BIT macro
	-:176: CHECK: Prefer using the BIT macro
	-:185: CHECK: Prefer using the BIT macro

patches/0012-media-rkisp1-Move-debugfs-code-to-a-separate-file.patch:

   checkpatch.pl:
	$ cat patches/0012-media-rkisp1-Move-debugfs-code-to-a-separate-file.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:58: WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

patches/0013-media-rkisp1-Compile-debugfs-support-conditionally.patch:

   checkpatch.pl:
	$ cat patches/0013-media-rkisp1-Compile-debugfs-support-conditionally.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:57: CHECK: Please use a blank line after function/struct/union/enum declarations


Error #512 when building PDF docs

