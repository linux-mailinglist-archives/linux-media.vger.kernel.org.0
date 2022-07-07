Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EACA56A1C9
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 14:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235228AbiGGMOv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 08:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235105AbiGGMOu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 08:14:50 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F23A16593
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 05:14:48 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o9QP9-000mFw-04; Thu, 07 Jul 2022 12:14:47 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1o9QP6-00H1F5-SC; Thu, 07 Jul 2022 12:14:44 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.20] Prepare destaging of imx7-media-csi (#84629)
Date:   Thu,  7 Jul 2022 12:14:44 +0000
Message-Id: <20220707121444.4056305-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YsbEoobPgKoYcZUs@pendragon.ideasonboard.com>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YsbEoobPgKoYcZUs@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/222893/
Build time: 00:36:24
Link: https://lore.kernel.org/linux-media/YsbEoobPgKoYcZUs@pendragon.ideasonboard.com

gpg: Signature made Thu 07 Jul 2022 11:33:24 AM UTC
gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 5/50 patches with issues, being 1 at build time

Error/warnings:

patches/0001-staging-media-imx-imx7-media-csi-Initialize-locks-ea.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: OOM: 3000008Kb sm_state_count = 543759
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() warn: Function too hairy.  No more merges.
	../drivers/staging/media/atomisp/pci/atomisp_cmd.c: ../drivers/staging/media/atomisp/pci/atomisp_cmd.c:3534 atomisp_cp_general_isp_parameters() parse error: __split_smt: function too hairy.  Giving up after 7 seconds

    allyesconfig: return code #0:
	../drivers/media/i2c/cx25840/cx25840-core.c: ../drivers/media/i2c/cx25840/cx25840-core.c:5561 cx23885_dif_setup() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: OOM: 3000024Kb sm_state_count = 1725875
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() warn: Function too hairy.  No more merges.
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2548 dvb_register() parse error: __split_smt: function too hairy.  Giving up after 48 seconds
	../drivers/media/dvb-frontends/sp887x.c: ../drivers/media/dvb-frontends/sp887x.c:178 sp887x_initial_setup() error: __memcpy() '&buf[2]' too small (30 vs 16384)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2878 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

patches/0003-staging-media-imx-imx7-media-csi-Import-notifier-hel.patch:

   checkpatch.pl:
	$ cat patches/0003-staging-media-imx-imx7-media-csi-Import-notifier-hel.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:211: CHECK: Alignment should match open parenthesis

patches/0030-staging-media-imx-imx7-media-csi-Decouple-from-imx_m.patch:

   checkpatch.pl:
	$ cat patches/0030-staging-media-imx-imx7-media-csi-Decouple-from-imx_m.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:66: WARNING: Possible unnecessary 'out of memory' message

patches/0033-staging-media-imx-imx7-media-csi-Import-format-helpe.patch:

   checkpatch.pl:
	$ cat patches/0033-staging-media-imx-imx7-media-csi-Import-format-helpe.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:70: ERROR: Macros with complex values should be enclosed in parentheses
	-:91: CHECK: Lines should not end with a '('
	-:99: CHECK: Lines should not end with a '('
	-:146: CHECK: Lines should not end with a '('
	-:207: CHECK: Lines should not end with a '('
	-:218: CHECK: Lines should not end with a '('
	-:229: CHECK: Lines should not end with a '('
	-:240: CHECK: Lines should not end with a '('
	-:251: CHECK: Lines should not end with a '('

patches/0043-staging-media-imx-imx7-media-csi-Inline-imx7_csi_ini.patch:

   checkpatch.pl:
	$ cat patches/0043-staging-media-imx-imx7-media-csi-Inline-imx7_csi_ini.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:88: CHECK: Alignment should match open parenthesis

