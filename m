Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD7078067E
	for <lists+linux-media@lfdr.de>; Fri, 18 Aug 2023 09:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239606AbjHRHlY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Aug 2023 03:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358190AbjHRHkd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Aug 2023 03:40:33 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B57435A5
        for <linux-media@vger.kernel.org>; Fri, 18 Aug 2023 00:40:31 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qWu5t-0036yo-Uh; Fri, 18 Aug 2023 07:40:29 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qWu5r-0039Va-0I;
        Fri, 18 Aug 2023 07:40:27 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     builder@linuxtv.org
Subject: Re: [GIT FIXES FOR v6.5] media: vcodec: Fix potential array out-of-bounds (#94169)
Date:   Fri, 18 Aug 2023 07:40:26 +0000
Message-Id: <20230818074026.751525-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <d5414054-36fc-3ade-5384-6ef9278210aa@xs4all.nl>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/d5414054-36fc-3ade-5384-6ef9278210aa@xs4all.nl/
Build log: https://builder.linuxtv.org/job/patchwork/331805/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/d5414054-36fc-3ade-5384-6ef9278210aa@xs4all.nl

gpg: Signature made Thu 17 Aug 2023 07:47:03 AM UTC
gpg:                using EDDSA key 52ADCAAE8A4F70B99ACD8D726B425DF79B1C1E76
gpg: Good signature from "Hans Verkuil <hverkuil-cisco@xs4all.nl>" [unknown]
gpg:                 aka "Hans Verkuil <hverkuil@xs4all.nl>" [full]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-vcodec-Fix-potential-array-out-of-bounds-in-en.patch doesn't apply:
Applying patch patches/0001-media-vcodec-Fix-potential-array-out-of-bounds-in-en.patch
can't find file to patch at input line 27
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From be702f08ce683406765d6e28656d697691a74b59 Mon Sep 17 00:00:00 2001
|From: Wei Chen <harperchen1110@gmail.com>
|Date: Thu, 10 Aug 2023 08:23:33 +0000
|Subject: media: vcodec: Fix potential array out-of-bounds in encoder
| queue_setup
|
|variable *nplanes is provided by user via system call argument. The
|possible value of q_data->fmt->num_planes is 1-3, while the value
|of *nplanes can be 1-8. The array access by index i can cause array
|out-of-bounds.
|
|Fix this bug by checking *nplanes against the array size.
|
|Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
|Signed-off-by: Wei Chen <harperchen1110@gmail.com>
|Cc: stable@vger.kernel.org
|Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
|Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
|---
| drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
| 1 file changed, 2 insertions(+)
|
|diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
|index 9ff439a50f53..315e97a2450e 100644
|--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
|+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch patches/0001-media-vcodec-Fix-potential-array-out-of-bounds-in-en.patch does not apply (enforce with -f)

