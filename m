Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF4D34F413
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 00:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbhC3WPo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 18:15:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbhC3WPP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 18:15:15 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293DEC061574
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 15:15:15 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id bt4so8464553pjb.5
        for <linux-media@vger.kernel.org>; Tue, 30 Mar 2021 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CEJVo99ddrzFsx+Y7vim0XaXbjg0vh0wW249qitilJc=;
        b=meUgQ8XuuGX2w/BSIG4Hz4EF7XC9+2efqf9gHbw/McANGT1S0Z0TwooXm0EwVoeeC9
         VE8+hDP4ClO6laZGUWRq3SVtNUY/kdGhkrNvjHfnz4qTguvnPvdB9sio+aLJYHTz63na
         0F//yTUTwk/POk31IhOjDpQm/II1tGnLMgLPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CEJVo99ddrzFsx+Y7vim0XaXbjg0vh0wW249qitilJc=;
        b=HDLPMRHxqqGcv/Ty9dgMSmtzQ5Ai92VkuBrKc7nWjPJGtK9/HIQgRx42ElDIONkFlc
         hQA506HBY45q6VwcgZ4NsgO8b4RsW2T5Z0WF/JOAhB4HM7F0G+CQqcfUZDXKA/qhpuhd
         QN2o0iUF/qTdpKGmdrja1ybPRenV0AQHTMe6gV4iDocWwCn4lpIhLv5+pvWwSeV0PUa8
         LaHg+NezQEg8T/VuymO22xMpq6EhRpbM7bDct78UGeN/do427b1ObwUA8oOJrwol5JrH
         AEJuJBMmfheFQpSvbg/osOdXgSEAFWvXYQENzVkcSUyV4rFNhneEn7tqyGXjn2OQ+EsW
         WVqg==
X-Gm-Message-State: AOAM531bOgU5r2gXx7Z5TUhg/l8mZgYe/1SSEtA0Q/9ED+P7LBb4Y5eT
        J0y3Bzqhf41NJqxgdrPRFYoG5N7oKYMghg==
X-Google-Smtp-Source: ABdhPJwNoj3YqVLpIvr86EesTfK7j0NfYhZD74Zo1vS33U/TjjIPnrqrAU2LRkP5QexaxBFNGQ6mcQ==
X-Received: by 2002:a17:90a:8b07:: with SMTP id y7mr439343pjn.78.1617142514280;
        Tue, 30 Mar 2021 15:15:14 -0700 (PDT)
Received: from localhost (201.59.83.34.bc.googleusercontent.com. [34.83.59.201])
        by smtp.gmail.com with UTF8SMTPSA id q66sm124518pja.27.2021.03.30.15.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 15:15:13 -0700 (PDT)
From:   Fritz Koenig <frkoenig@chromium.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, tiffany.lin@mediatek.com,
        acourbot@chromium.org
Cc:     Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH] media: mtk-vcodec: vdec: Reduce padding in VIDIOC_TRY_FMT
Date:   Tue, 30 Mar 2021 22:15:06 +0000
Message-Id: <20210330221506.2278606-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the header has been parsed or the codec is stateless
reduce the padding of the decoded frame.
In stateless codecs width and height are specified by
the application.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 59 ++++++++++++-------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 56d86e59421e..9c88454dc10c 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -653,7 +653,7 @@ static int vidioc_vdec_subscribe_evt(struct v4l2_fh *fh,
 	}
 }
 
-static int vidioc_try_fmt(struct v4l2_format *f,
+static int vidioc_try_fmt(struct v4l2_format *f, void *priv,
 			  const struct mtk_video_fmt *fmt)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
@@ -665,6 +665,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		pix_fmt_mp->plane_fmt[0].bytesperline = 0;
 	} else if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		int tmp_w, tmp_h;
+		struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 
 		pix_fmt_mp->height = clamp(pix_fmt_mp->height,
 					MTK_VDEC_MIN_H,
@@ -673,27 +674,45 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 					MTK_VDEC_MIN_W,
 					MTK_VDEC_MAX_W);
 
+		tmp_w = pix_fmt_mp->width;
+		tmp_h = pix_fmt_mp->height;
+
+		if (ctx->dev->vdec_pdata->uses_stateless_api ||
+			ctx->state >= MTK_STATE_HEADER) {
+			v4l_bound_align_image(&pix_fmt_mp->width,
+						MTK_VDEC_MIN_W,
+						MTK_VDEC_MAX_W, 4,
+						&pix_fmt_mp->height,
+						MTK_VDEC_MIN_H,
+						MTK_VDEC_MAX_H, 5, 6);
+
+			if (pix_fmt_mp->width < tmp_w &&
+				(pix_fmt_mp->width + 16) <= MTK_VDEC_MAX_W)
+				pix_fmt_mp->width += 16;
+			if (pix_fmt_mp->height < tmp_h &&
+				(pix_fmt_mp->height + 32) <= MTK_VDEC_MAX_H)
+				pix_fmt_mp->height += 32;
+		} else {
 		/*
-		 * Find next closer width align 64, heign align 64, size align
+		 * Find next closer width align 64, height align 64, size align
 		 * 64 rectangle
 		 * Note: This only get default value, the real HW needed value
 		 *       only available when ctx in MTK_STATE_HEADER state
 		 */
-		tmp_w = pix_fmt_mp->width;
-		tmp_h = pix_fmt_mp->height;
-		v4l_bound_align_image(&pix_fmt_mp->width,
-					MTK_VDEC_MIN_W,
-					MTK_VDEC_MAX_W, 6,
-					&pix_fmt_mp->height,
-					MTK_VDEC_MIN_H,
-					MTK_VDEC_MAX_H, 6, 9);
-
-		if (pix_fmt_mp->width < tmp_w &&
-			(pix_fmt_mp->width + 64) <= MTK_VDEC_MAX_W)
-			pix_fmt_mp->width += 64;
-		if (pix_fmt_mp->height < tmp_h &&
-			(pix_fmt_mp->height + 64) <= MTK_VDEC_MAX_H)
-			pix_fmt_mp->height += 64;
+			v4l_bound_align_image(&pix_fmt_mp->width,
+						MTK_VDEC_MIN_W,
+						MTK_VDEC_MAX_W, 6,
+						&pix_fmt_mp->height,
+						MTK_VDEC_MIN_H,
+						MTK_VDEC_MAX_H, 6, 9);
+
+			if (pix_fmt_mp->width < tmp_w &&
+				(pix_fmt_mp->width + 64) <= MTK_VDEC_MAX_W)
+				pix_fmt_mp->width += 64;
+			if (pix_fmt_mp->height < tmp_h &&
+				(pix_fmt_mp->height + 64) <= MTK_VDEC_MAX_H)
+				pix_fmt_mp->height += 64;
+		}
 
 		mtk_v4l2_debug(0,
 			"before resize width=%d, height=%d, after resize width=%d, height=%d, sizeimage=%d",
@@ -729,7 +748,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 		fmt = mtk_vdec_find_format(f);
 	}
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(f, priv, fmt);
 }
 
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
@@ -749,7 +768,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 		return -EINVAL;
 	}
 
-	return vidioc_try_fmt(f, fmt);
+	return vidioc_try_fmt(f, priv, fmt);
 }
 
 static int vidioc_vdec_g_selection(struct file *file, void *priv,
@@ -875,7 +894,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 		return -EINVAL;
 
 	q_data->fmt = fmt;
-	vidioc_try_fmt(f, q_data->fmt);
+	vidioc_try_fmt(f, priv, q_data->fmt);
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		q_data->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
 		q_data->coded_width = pix_mp->width;
-- 
2.31.0.291.g576ba9dcdaf-goog

