Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39C8A52604B
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 12:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379622AbiEMKtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 06:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379624AbiEMKts (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 06:49:48 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B538296BEE
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 03:49:48 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1npSri-009n9h-Er; Fri, 13 May 2022 10:49:46 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1npSrf-00Cf52-SS; Fri, 13 May 2022 10:49:43 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab+samsung@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v5.19] v2: H.264 Field Decoding Support for Frame-based (#83186)
Date:   Fri, 13 May 2022 10:49:43 +0000
Message-Id: <20220513104943.3017802-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <68d6a73a-5571-0ea3-0fca-ff06fe6bda45@xs4all.nl>
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

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/68d6a73a-5571-0ea3-0fca-ff06fe6bda45@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/207145/
Build time: 00:28:12
Link: https://lore.kernel.org/linux-media/68d6a73a-5571-0ea3-0fca-ff06fe6bda45@xs4all.nl

gpg: Signature made Fri 13 May 2022 08:43:06 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Can't check signature: No public key

Summary: got 1/23 patches with issues, being 1 at build time, plus one error when buinding PDF document

Error/warnings:

patches/0001-media-doc-Document-dual-use-of-H.264-pic_num-frame_n.patch:

    allyesconfig: return code #0:
	../scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
	../scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
	../scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples

    allyesconfig: return code #0:
	SMATCH:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: :warning: array of flexible structures
	SPARSE:../drivers/media/usb/siano/smsusb.c ../drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures
	../drivers/media/platform/qcom/venus/helpers.c: ../drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
	../drivers/media/usb/em28xx/em28xx-video.c: ../drivers/media/usb/em28xx/em28xx-video.c:2900 em28xx_v4l2_init() parse error: turning off implications after 60 seconds


Error #512 when building PDF docs

