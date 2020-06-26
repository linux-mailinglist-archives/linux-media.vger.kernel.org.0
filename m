Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3035320AE08
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 10:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbgFZIGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 04:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729233AbgFZIGL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 04:06:11 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01F0C08C5DB
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:11 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s14so3990786plq.6
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2020 01:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TWY5ln+C0L5OKLhUHNQQA4fWR9u7spTeGdlwWwYsNjU=;
        b=Slagczj0xrrOFm1MOfsX8roJrvclPrrdjO/KQF5e43edEdSHjpLmgtD7EMUFLumA2p
         F+NlibBwsDg954zvFK2IjotKSpE3+XXnK7Swg5QkeeEPHXz1+LeywZXNegqeBuIOE8mS
         sFFhGb0+UxEkvs5krTXfHTBFTFRqmyUjqw5LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TWY5ln+C0L5OKLhUHNQQA4fWR9u7spTeGdlwWwYsNjU=;
        b=OWF1raZUMOiuM/vKWlTZKc2laLhm1L4aX16RgrfaYuVdHI2CKlyoHxzEH94ijk7FoO
         i9Ik6TcCmbai/39Ol6/34Nvbilb5zE6PmLPajtLyO9P8rzEYuTGvhQuO5BcqNhVe0bTy
         /KGUX8YUhpgAyzEccZqLKoUTZ/juCYgKqqB+z8+Tse0cT8zNABduLRLS4Mr+JwOEPOye
         1/tqyH0DxErtJYhsF3oBBZoIuMQtKiwWLaNucNZt8UBKGnKtK89RMojv0rXljoMhFcDB
         HCnx21ZhBGXAXluKHKRKhAgezBYo/wsO3zzBJ2/7kUfR+wLYF20xCyEV/rJ2tY/fbbxf
         6HGA==
X-Gm-Message-State: AOAM532/u/FtT5yNvok+6YtokNbBaqSu8S/qSDlfvdn/z3vYj2n01gVu
        wsFTDtq4P9rT5ICeyEKMXiA1/A==
X-Google-Smtp-Source: ABdhPJzB6OS4MIy7FxYEhNxsUaXWLmhNbV7pXZcQs36M9K67HYVXmMOT1RHeGGDakRBrYaHMcAgM2Q==
X-Received: by 2002:a17:90a:4f4b:: with SMTP id w11mr2172580pjl.11.1593158771591;
        Fri, 26 Jun 2020 01:06:11 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:93d9:de4d:e834:3086])
        by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 01:06:10 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 13/18] media: mtk-vcodec: venc: use platform data for ENUM_FRAMESIZES
Date:   Fri, 26 Jun 2020 17:04:37 +0900
Message-Id: <20200626080442.292309-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vidioc_enum_framesizes() assumes that all encoders support H.264 and VP8,
which is not necessarily true and requires to duplicate information about
the supported codecs which is already stored in the platform data.

Fix this by referring to the platform data to find out whether a given
format is supported. Since the supported sizes are all the same
regardless of the format, we can then return a copy of a static value if
the format is supported.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 24 ++++++++-----------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 1a981d842c19..f8d4fbe927f9 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -26,17 +26,9 @@
 
 static void mtk_venc_worker(struct work_struct *work);
 
-static const struct mtk_codec_framesizes mtk_venc_framesizes[] = {
-	{
-		.fourcc	= V4L2_PIX_FMT_H264,
-		.stepwise = { MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
-			      MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16 },
-	},
-	{
-		.fourcc = V4L2_PIX_FMT_VP8,
-		.stepwise = { MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
-			      MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16 },
-	},
+static const struct v4l2_frmsize_stepwise mtk_venc_framesizes = {
+	MTK_VENC_MIN_W, MTK_VENC_MAX_W, 16,
+	MTK_VENC_MIN_H, MTK_VENC_MAX_H, 16,
 };
 
 #define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_venc_framesizes)
@@ -134,17 +126,21 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f,
 static int vidioc_enum_framesizes(struct file *file, void *fh,
 				  struct v4l2_frmsizeenum *fsize)
 {
+	const struct mtk_vcodec_enc_pdata *pdata =
+		fh_to_ctx(fh)->dev->venc_pdata;
 	int i = 0;
 
 	if (fsize->index != 0)
 		return -EINVAL;
 
-	for (i = 0; i < NUM_SUPPORTED_FRAMESIZE; ++i) {
-		if (fsize->pixel_format != mtk_venc_framesizes[i].fourcc)
+	for (i = 0; i < pdata->num_capture_formats; ++i) {
+		const struct mtk_video_fmt *fmt = &pdata->capture_formats[i];
+
+		if (fsize->pixel_format != fmt->fourcc)
 			continue;
 
 		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-		fsize->stepwise = mtk_venc_framesizes[i].stepwise;
+		fsize->stepwise = mtk_venc_framesizes;
 		return 0;
 	}
 
-- 
2.27.0.212.ge8ba1cc988-goog

