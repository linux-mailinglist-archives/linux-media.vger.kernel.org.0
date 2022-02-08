Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C8A4AD8C2
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 14:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343539AbiBHNPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 08:15:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbiBHMTn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 07:19:43 -0500
X-Greylist: delayed 1208 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 04:19:42 PST
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40FAC03FEC0
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 04:19:42 -0800 (PST)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nHP9g-009qox-IR; Tue, 08 Feb 2022 11:59:32 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1nHP9c-00AyCh-QE; Tue, 08 Feb 2022 11:59:29 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.18] Various fixes (#80608)
Date:   Tue,  8 Feb 2022 11:59:28 +0000
Message-Id: <20220208115928.2614657-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <d8cfded5-dc29-f7b7-c09d-7b6296e6ebae@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/d8cfded5-dc29-f7b7-c09d-7b6296e6ebae@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/181128/
Build time: 00:19:21
Link: https://lore.kernel.org/linux-media/d8cfded5-dc29-f7b7-c09d-7b6296e6ebae@xs4all.nl

gpg: Signature made Tue 08 Feb 2022 11:22:27 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 1/5 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-s5p_mfc_dec-set-flags-for-OUTPUT-coded-formats.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	../drivers/media/rc/meson-ir-tx.c:22: warning: expecting prototype for meson(). Prototype was for DEVICE_NAME() instead
	../drivers/media/i2c/ov08d10.c: ../drivers/media/i2c/ov08d10.c:1276 ov08d10_enum_frame_size() warn: inconsistent returns '&ov08d10->mutex'.
	  Locked on  : 1268
	  Unlocked on: 1276
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:658 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 654)
	../drivers/media/pci/cx23885/cx23885-dvb.c: ../drivers/media/pci/cx23885/cx23885-dvb.c:2625 dvb_register() parse error: turning off implications after 60 seconds
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2874 em28xx_v4l2_init() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

