Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B906A3435E
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 11:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfFDJiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 05:38:06 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33915 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbfFDJiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 05:38:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id c85so3551125pfc.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 02:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kkz/XzAOhnm/D/+CBYg1z225Vw/50tqayYaD8NUxlbU=;
        b=lNej2GHpJFHhSX5Wafo2JC+jKDIiMJEwglY1egsj2tTgl0CQtE88cOwbO0CgShR/KB
         Ei4wKW9rV86pYeUnXfZu+AQwz61DDo54QbRPMjYNhpkuvX3qkzL+8VGxuV7UGUS6G+jC
         NfY7SaKvaII5e5ct8H33XKnTvOJMIVnIWbuCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kkz/XzAOhnm/D/+CBYg1z225Vw/50tqayYaD8NUxlbU=;
        b=B/kvPftm2ZmuBjlI6J30oAPL6ZN08oum/5GJizlScQoXb9qYQmH/M306Foihl90a26
         qiO3BLSTT4Ekd6T9/8/2qXWDoxbqaLot1f5llZr1aMHP1FJw4F8WOKFCEwHbDslJsIQ1
         98foKHd+w0RrQ4u+sAkfXOKghYyPFIYT/GBG+Gny3vJfMFfzb/5RSZ3kcCVvA4DcSqwR
         1kKWNA3EZxw8Qga8WhRJNLN8niQliUiybIvT6FIAdj3SbOqWcwlsTbGmLvpmqFq8S/eE
         rvjQ818I/RymjQzUFRcX8NmBzULYXu+2o7KK5PEQ2GLrbGteUPqRq0zr9JDn0/ZAKfeH
         BR1g==
X-Gm-Message-State: APjAAAXVElIx4KnrLaNRtwtViyPbBKvKmV5puEFB6eyRI9l2tDumZ7Iy
        eGVPGVLNuTxMDjez1zan10CEAQ==
X-Google-Smtp-Source: APXvYqz2Fz/pnGXv0ZPvgJW7e6d7ZqtCPt+NixsSUGw1uA+K5fsccM7BUPplF4NCNUk+DabA0RDGRQ==
X-Received: by 2002:a17:90a:372a:: with SMTP id u39mr7218059pjb.2.1559641084175;
        Tue, 04 Jun 2019 02:38:04 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id j7sm17431588pfa.184.2019.06.04.02.38.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 02:38:03 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 4/5] media: mtk-vcodec: constify formats
Date:   Tue,  4 Jun 2019 18:37:36 +0900
Message-Id: <20190604093737.172599-5-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190604093737.172599-1-acourbot@chromium.org>
References: <20190604093737.172599-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Formats are read-only internal memory structures, so make them const.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 19 ++++++++++---------
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 19 ++++++++++---------
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 371e70d6a803..131a8117ece2 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -19,7 +19,7 @@
 #define DFT_CFG_WIDTH	MTK_VDEC_MIN_W
 #define DFT_CFG_HEIGHT	MTK_VDEC_MIN_H
 
-static struct mtk_video_fmt mtk_video_formats[] = {
+static const struct mtk_video_fmt mtk_video_formats[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_H264,
 		.type = MTK_FMT_DEC,
@@ -63,9 +63,9 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
 #define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
 #define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
 
-static struct mtk_video_fmt *mtk_vdec_find_format(struct v4l2_format *f)
+static const struct mtk_video_fmt *mtk_vdec_find_format(struct v4l2_format *f)
 {
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 	unsigned int k;
 
 	for (k = 0; k < NUM_FORMATS; k++) {
@@ -266,7 +266,7 @@ static void mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
 static void mtk_vdec_update_fmt(struct mtk_vcodec_ctx *ctx,
 				unsigned int pixelformat)
 {
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 	struct mtk_q_data *dst_q_data;
 	unsigned int k;
 
@@ -639,7 +639,8 @@ static int vidioc_vdec_subscribe_evt(struct v4l2_fh *fh,
 	}
 }
 
-static int vidioc_try_fmt(struct v4l2_format *f, struct mtk_video_fmt *fmt)
+static int vidioc_try_fmt(struct v4l2_format *f,
+			  const struct mtk_video_fmt *fmt)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	int i;
@@ -712,7 +713,7 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct mtk_video_fmt *fmt)
 static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 
 	fmt = mtk_vdec_find_format(f);
 	if (!fmt) {
@@ -727,7 +728,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 
 	fmt = mtk_vdec_find_format(f);
 	if (!fmt) {
@@ -821,7 +822,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	struct v4l2_pix_format_mplane *pix_mp;
 	struct mtk_q_data *q_data;
 	int ret = 0;
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 
 	mtk_v4l2_debug(3, "[%d]", ctx->id);
 
@@ -920,7 +921,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
 
 static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
 {
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 	int i, j = 0;
 
 	for (i = 0; i < NUM_FORMATS; i++) {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 4b10996e6532..0a29a0694124 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -124,7 +124,7 @@ struct mtk_q_data {
 	enum v4l2_field	field;
 	unsigned int	bytesperline[MTK_VCODEC_MAX_PLANES];
 	unsigned int	sizeimage[MTK_VCODEC_MAX_PLANES];
-	struct mtk_video_fmt	*fmt;
+	const struct mtk_video_fmt	*fmt;
 };
 
 /**
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 1a3845809b92..868147616da7 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -24,7 +24,7 @@
 
 static void mtk_venc_worker(struct work_struct *work);
 
-static struct mtk_video_fmt mtk_video_formats[] = {
+static const struct mtk_video_fmt mtk_video_formats[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_NV12M,
 		.type = MTK_FMT_FRAME,
@@ -153,7 +153,7 @@ static const struct v4l2_ctrl_ops mtk_vcodec_enc_ctrl_ops = {
 
 static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
 {
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 	int i, j = 0;
 
 	for (i = 0; i < NUM_FORMATS; ++i) {
@@ -261,9 +261,9 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
 	return &ctx->q_data[MTK_Q_DATA_DST];
 }
 
-static struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f)
+static const struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f)
 {
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 	unsigned int k;
 
 	for (k = 0; k < NUM_FORMATS; k++) {
@@ -278,7 +278,8 @@ static struct mtk_video_fmt *mtk_venc_find_format(struct v4l2_format *f)
 /* V4L2 specification suggests the driver corrects the format struct if any of
  * the dimensions is unsupported
  */
-static int vidioc_try_fmt(struct v4l2_format *f, struct mtk_video_fmt *fmt)
+static int vidioc_try_fmt(struct v4l2_format *f,
+			  const struct mtk_video_fmt *fmt)
 {
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	int i;
@@ -414,7 +415,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data;
 	int i, ret;
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
 	if (!vq) {
@@ -476,7 +477,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	struct vb2_queue *vq;
 	struct mtk_q_data *q_data;
 	int ret, i;
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
@@ -575,7 +576,7 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
 static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 					 struct v4l2_format *f)
 {
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 
 	fmt = mtk_venc_find_format(f);
@@ -594,7 +595,7 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 					 struct v4l2_format *f)
 {
-	struct mtk_video_fmt *fmt;
+	const struct mtk_video_fmt *fmt;
 
 	fmt = mtk_venc_find_format(f);
 	if (!fmt) {
-- 
2.22.0.rc1.311.g5d7573a151-goog

