Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C66B2692645
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 20:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbjBJT1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 14:27:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232864AbjBJT1f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 14:27:35 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C9430E82
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 11:27:23 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id w5so7487361plg.8
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 11:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9RU7LGjCcl/n5aNo4YV2g6HAIfq8h+RVsJNbdFRhSA4=;
        b=nsJqOlD8Irr4wzFVvdWgGVAiL+uvO+MWO4wo8xGdSIBGE9zq8H95tLHLmK9bNVaWsg
         IrRRmBVOsC9teopVsJEEt3zO0k7ZQA4ROZwM6YPBV7Im2Pp5sUMAZxVrDo1tYkrZSYWj
         RJZzWLUHVKvX/Im7cap+BiFsFzA2QdsBV27N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RU7LGjCcl/n5aNo4YV2g6HAIfq8h+RVsJNbdFRhSA4=;
        b=NW0xymQqyR5C+IN4RJW2hoGslvaYIyTOetmqdmdNXTJ/0auq4kEWaqWBCTeYstB2+4
         EwBntVRB6fLLvRUF/tP2dlwZDdkjUfKaYNliLa609PIW9lv50SNAaVGk4iZ3PGHO8ruE
         UvVo89GT0tYPxVtEFco2dI3sGq3yRtxVcTJhVEDRhvTFJYK0HNCMUGzFIZdr5+yoSgUe
         JMXaiIbNyGZv8D1RPpLz9PaGW/jfZ3QzlfQDOJ+S+YLksRPRkcwopc9mE8093s7Uof1g
         rQgVTNwM4Y9Bx8vUyUtJ2jXxJCqeBc8NCeiR3HHWP/nox9Y8JGTVU3LqWL5/Ex6DO3Qh
         7Ksw==
X-Gm-Message-State: AO0yUKVZQRrqWY1C64/vElCq6AbwY7tqj6WMdsU90T21jkQzKyUYoFwC
        AniVlMEdQHkoDrVQ81yg9V6xbbpnU9MsHlQ4
X-Google-Smtp-Source: AK7set9jTjDqngw7+AP+BsrxNhdx/xl/gzya7AkKeXw8s3AsOQflefI7GkDZ/DuoDTJemvxOkJXJ8w==
X-Received: by 2002:a17:90b:1647:b0:22c:3544:8cb0 with SMTP id il7-20020a17090b164700b0022c35448cb0mr18357571pjb.8.1676057243183;
        Fri, 10 Feb 2023 11:27:23 -0800 (PST)
Received: from localhost ([2620:15c:90:200:8a15:2992:3564:d558])
        by smtp.gmail.com with UTF8SMTPSA id k31-20020a17090a3ea200b00233afe09177sm1455335pjc.8.2023.02.10.11.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 11:27:22 -0800 (PST)
From:   Fritz Koenig <frkoenig@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     quic_vgarodia@quicinc.com, nhebert@chromium.org,
        Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH] media: venus: Correct P010 buffer alignment
Date:   Fri, 10 Feb 2023 11:26:46 -0800
Message-Id: <20230210192646.553795-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to msm_media_info.h the correct alignment
for the stride of P010 buffers is 128.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---

The change to vdec.c isn't the most ideal.  It would be great
if there was a way to check the bitdepth of a format, or
retrieve the stride from hfi.  There is a facility to store
the stride for encoding, but currently nothing for retrieving.

 drivers/media/platform/qcom/venus/helpers.c | 4 ++--
 drivers/media/platform/qcom/venus/vdec.c    | 7 ++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index ab6a29ffc81e2..a2ceab7f9ddbf 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -988,8 +988,8 @@ static u32 get_framesize_raw_p010(u32 width, u32 height)
 {
 	u32 y_plane, uv_plane, y_stride, uv_stride, y_sclines, uv_sclines;
 
-	y_stride = ALIGN(width * 2, 256);
-	uv_stride = ALIGN(width * 2, 256);
+	y_stride = ALIGN(width * 2, 128);
+	uv_stride = ALIGN(width * 2, 128);
 	y_sclines = ALIGN(height, 32);
 	uv_sclines = ALIGN((height + 1) >> 1, 16);
 	y_plane = y_stride * y_sclines;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4ceaba37e2e57..3aaac480c9839 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -204,8 +204,13 @@ vdec_try_fmt_common(struct venus_inst *inst, struct v4l2_format *f)
 					   pixmp->height);
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		unsigned int stride = pixmp->width;
+
+		if (pixmp->pixelformat == V4L2_PIX_FMT_P010)
+			stride *= 2;
+
 		pfmt[0].sizeimage = szimage;
-		pfmt[0].bytesperline = ALIGN(pixmp->width, 128);
+		pfmt[0].bytesperline = ALIGN(stride, 128);
 	} else {
 		pfmt[0].sizeimage = clamp_t(u32, pfmt[0].sizeimage, 0, SZ_8M);
 		pfmt[0].sizeimage = max(pfmt[0].sizeimage, szimage);
-- 
2.39.1.581.gbfd45094c4-goog

