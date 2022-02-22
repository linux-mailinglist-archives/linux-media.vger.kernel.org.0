Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFD14BFE66
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 17:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbiBVQWh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 11:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiBVQWg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 11:22:36 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E933392D22
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 08:22:09 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nMXvU-00CfKv-EU; Tue, 22 Feb 2022 16:22:08 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nMXvR-009YH7-Rv; Tue, 22 Feb 2022 16:22:05 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.18] De-stage imx7-mipi-csis & some fixes (#80898)
Date:   Tue, 22 Feb 2022 16:22:05 +0000
Message-Id: <20220222162205.2276659-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <234e557c-69b9-b4fe-44c4-7995739cd6ed@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/234e557c-69b9-b4fe-44c4-7995739cd6ed@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/185173/
Build time: 00:20:07
Link: https://lore.kernel.org/linux-media/234e557c-69b9-b4fe-44c4-7995739cd6ed@xs4all.nl

gpg: Signature made Tue 22 Feb 2022 03:51:45 PM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 3/11 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-imx-De-stage-imx7-mipi-csis.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds

   checkpatch.pl:
	$ cat patches/0001-media-imx-De-stage-imx7-mipi-csis.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:76: WARNING: please write a help paragraph that fully describes the config symbol
	-:87: WARNING: please write a help paragraph that fully describes the config symbol

patches/0002-media-imx-Rename-imx7-mipi-csis.c-to-imx-mipi-csis.c.patch:

   checkpatch.pl:
	$ cat patches/0002-media-imx-Rename-imx7-mipi-csis.c-to-imx-mipi-csis.c.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:45: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
	-:77: WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

patches/0010-doc-media-Document-MM21-tiled-format.patch:

   checkpatch.pl:
	$ cat patches/0010-doc-media-Document-MM21-tiled-format.patch | formail -c | ./scripts/checkpatch.pl --terse --mailback --no-summary --strict
	-:12: WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)


Error #512 when building PDF docs

