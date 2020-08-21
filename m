Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BB224D2C1
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 12:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgHUKiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 06:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728745AbgHUKhU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 06:37:20 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5A4C061343
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:37:20 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f5so689423plr.9
        for <linux-media@vger.kernel.org>; Fri, 21 Aug 2020 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qeCw5SHhSURz002CCjWwXJ+voNEnpmlB74TZQPNY2mk=;
        b=eyjzs6DvTt93/s/iw/vdrInZBoRwwczVMGIMjRohCUaR8glc+mZKV9T15v0aN6XOax
         qUSmgxwnX3s2wnYAU6dhqvjCenKdVS+37U3Pa9cRqcSnE/vYQnSeX2vxANglqN8AHHXX
         eEUShw4o7MMmh4+5UpI4BwEHPKqSCDDbNaBeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qeCw5SHhSURz002CCjWwXJ+voNEnpmlB74TZQPNY2mk=;
        b=lAR9C5ooa/ESeoTaQOyDl90UYHHNYc+G9WYdNYjFOD6fI9lMtf26WAVY4m5wdOCIxW
         Q6+DHMIS/NYrapwOR+8hY+pFLrYCDqPCQeYopPuyXuE3Z2aPv0assV1uwMtnTHNMp7a8
         lu2PimuSSdfOT90LGTE2RMD4z3oO8d7jXNpxNvptXUg76v7rWkz0ep1SJCVpfcPx5SxZ
         cZkWv+vDna+b7+3pXDsMbfXbuv8BuedQPRexAqRWMcCynPvBG1WegMThLAvC+KYxlFFR
         wjA6rIAKQUdql2YXykgXkvBJE73Rp2kUkeZJhyNlomkKV5haAtQDJJPDK6IdPUZoAaPX
         VPdQ==
X-Gm-Message-State: AOAM533eMRaoOAZ1OlbNf/vWaLtOLbVm3GVk+SZ8NXi+mUfRCb753ohl
        sB571OBNjR9l2hCpfqZWrEEhWQ==
X-Google-Smtp-Source: ABdhPJxWsCfHREyNSan+olqL30atRwJo5/+vE1d3bcoj+3viNyXCtesXVTygLNadw20+sUboqGrdiA==
X-Received: by 2002:a17:90a:a58d:: with SMTP id b13mr2000471pjq.55.1598006239562;
        Fri, 21 Aug 2020 03:37:19 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 03:37:18 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 14/17] media: mtk-vcodec: venc: use platform data for ENUM_FRAMESIZES
Date:   Fri, 21 Aug 2020 19:36:05 +0900
Message-Id: <20200821103608.2310097-15-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
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
2.28.0.297.g1956fa8f8d-goog

