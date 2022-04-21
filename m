Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8FAD50AB72
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 00:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442430AbiDUWYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 18:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238958AbiDUWYv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 18:24:51 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A36A42EF4
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 15:21:58 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nhfBU-00BFxg-QV; Thu, 21 Apr 2022 22:21:56 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nhfBS-00Dx9d-5B; Thu, 21 Apr 2022 22:21:54 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.19] imx-mipi-csis improvements (#82601)
Date:   Thu, 21 Apr 2022 22:21:54 +0000
Message-Id: <20220421222154.3325607-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YmHTWoXzK4xfk94B@pendragon.ideasonboard.com>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/YmHTWoXzK4xfk94B@pendragon.ideasonboard.com/
Build log: https://builder.linuxtv.org/job/patchwork/201535/
Build time: 00:19:10
Link: https://lore.kernel.org/linux-media/YmHTWoXzK4xfk94B@pendragon.ideasonboard.com

gpg: Signature made Thu 21 Apr 2022 09:54:33 PM UTC
gpg:                using RSA key CB9D6877529820CD53099B1B65F89C37BC54210D
gpg:                issuer "laurent.pinchart@ideasonboard.com"
gpg: Can't check signature: No public key

Summary: got 2/9 patches with issues, being 1 at build time

Error/warnings:

patches/0001-media-imx-imx-mipi-csis-Rename-csi_state-to-mipi_csi.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2868 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-imx-imx-mipi-csis-Rename-csi_state-to-mipi_csi.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:279: CHECK: Alignment should match open parenthesis

patches/0009-media-imx-imx-mipi-csis-Fix-active-format-initializa.patch:

   checkpatch.pl:
	$ cat patches/0009-media-imx-imx-mipi-csis-Fix-active-format-initializa.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:6: WARNING: Unknown commit id '52f69bc5f8c0', maybe rebased or not pulled?
	-:10: WARNING: Unknown commit id '52f69bc5f8c0', maybe rebased or not pulled?

