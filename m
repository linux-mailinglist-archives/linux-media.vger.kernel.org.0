Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 154CF4BB7F2
	for <lists+linux-media@lfdr.de>; Fri, 18 Feb 2022 12:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbiBRLVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Feb 2022 06:21:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbiBRLVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Feb 2022 06:21:06 -0500
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD18117EC38
        for <linux-media@vger.kernel.org>; Fri, 18 Feb 2022 03:20:49 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nL1Jf-006fD7-VI; Fri, 18 Feb 2022 11:20:47 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nL1Jd-00949f-Tq; Fri, 18 Feb 2022 11:20:45 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.18] Various fixes/enhancements (#80828)
Date:   Fri, 18 Feb 2022 11:20:45 +0000
Message-Id: <20220218112045.2160877-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <49e455a5-2468-b45e-4449-4db4c2821bdd@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/49e455a5-2468-b45e-4449-4db4c2821bdd@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/183981/
Build time: 00:23:43
Link: https://lore.kernel.org/linux-media/49e455a5-2468-b45e-4449-4db4c2821bdd@xs4all.nl

gpg: Signature made Fri 18 Feb 2022 10:50:35 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 1/22 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-Revert-media-em28xx-add-missing-em28xx_close_extensi.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/test-drivers/vivid/vivid-core.c: ../drivers/media/test-drivers/vivid/vivid-core.c:1981 vivid_create_instance() parse error: turning off implications after 60 seconds
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

