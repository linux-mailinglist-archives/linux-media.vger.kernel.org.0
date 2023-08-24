Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33C2C787C57
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 02:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238918AbjHXX7y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 19:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244166AbjHXX7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 19:59:22 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFD931FE9
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 16:58:47 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qZKDu-007Ctd-4D; Thu, 24 Aug 2023 23:58:46 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.96)
        (envelope-from <jenkins@linuxtv.org>)
        id 1qZKDr-005KxD-2f;
        Thu, 24 Aug 2023 23:58:43 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL for v6.5] media fixes (#94321)
Date:   Thu, 24 Aug 2023 23:58:42 +0000
Message-Id: <20230824235842.1272178-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825015419.0848a4bc@coco.lan>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230825015419.0848a4bc@coco.lan/
Build log: https://builder.linuxtv.org/job/patchwork/333715/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20230825015419.0848a4bc@coco.lan

gpg: Signature made Thu 24 Aug 2023 11:52:18 PM UTC
gpg:                using RSA key F909AE68FC11DF09C1755C00085F3EBD8EE4E115
gpg: Good signature from "Mauro Carvalho Chehab <mchehab+huawei@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@kernel.org>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <m.chehab@samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@osg.samsung.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab@s-opensource.com>" [ultimate]
gpg:                 aka "Mauro Carvalho Chehab <mchehab+samsung@kernel.org>" [ultimate]
gpg:                 aka "[jpeg image of size 3594]" [ultimate]


Build aborted due to a fatal error:
FAILED: patch patch patches/0001-media-vcodec-Fix-potential-array-out-of-bounds-in-en.patch doesn't apply:
Applying patch patches/0001-media-vcodec-Fix-potential-array-out-of-bounds-in-en.patch
can't find file to patch at input line 27
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From e7f2e65699e2290fd547ec12a17008764e5d9620 Mon Sep 17 00:00:00 2001
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

