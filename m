Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B06221CF5A
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 08:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbgGMGJw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 02:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729339AbgGMGJv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 02:09:51 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206F6C08C5DD
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:51 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id cv18so6129210pjb.1
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2020 23:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sxvr8s/NHxCkyhh7PIH9LpOL4fHeYb/Kvpdz2+ATe9s=;
        b=DWWH+FXOvXKdSMxYAHRFSmEYh3PV0xpioqdjOti4quFB7TjJPSOs64lXwfgZ3w/22p
         iQvFr1Hvz5zYvoC+gumOr5SDq6P8PBLUtH6DbD3aOc0zZmxIjlmWwZYH/gvi/zBDcp0H
         VKu4Ac5dYDLg/07yrOoa+taF1ne5GilW7mTAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sxvr8s/NHxCkyhh7PIH9LpOL4fHeYb/Kvpdz2+ATe9s=;
        b=TjsGhnb9ylB0dPMlova4XL3/oZzWNaYo6jzT6mI2xrPQ7U7HMMYbLgfAfWgRTlAB1O
         MmAtF0T5aSM8hT7gifnAeEngCOyHjY63q4PhkZ8o5yQ7z5bYKCG/VsJTXWWeez3Zudc3
         I/sJw4XkLJh5lBQXhA8kl9x39HWXBEKm1kZTuiuPGjhr1DjpakQPC64Lcps/1AefNxED
         Q66YYHXkZB8ZZBVGQEjP+b8UgUO7zz0Uubh2XFOGlY/KM2jWXOMpGhLLdb7z2i7ZVDCq
         VapqENNKIitaSjMVD2qLxd+B/RXdHIBY8w907H4a1nUCjnPyjU7pXMd4DkJngSI/lI2J
         Qr2A==
X-Gm-Message-State: AOAM532dY+DWO7w8ktv7jDCblYBQd7PIskPmH69Ga7DxKvv2JrFVdw22
        NCFuSLQsTow0L80M2kH7UIOUEQ==
X-Google-Smtp-Source: ABdhPJzpyNY2W96p+3OsfbLcqScGGEW/S1dua6Bv7SBbCX2P/6r1xgmTTaBboiIVCFxE20Zbyhesjg==
X-Received: by 2002:a17:90a:e511:: with SMTP id t17mr19326850pjy.87.1594620590700;
        Sun, 12 Jul 2020 23:09:50 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
        by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 23:09:50 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 13/16] media: mtk-vcodec: venc: use platform data for ENUM_FRAMESIZES
Date:   Mon, 13 Jul 2020 15:08:39 +0900
Message-Id: <20200713060842.471356-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
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
2.27.0.383.g050319c2ae-goog

