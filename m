Return-Path: <linux-media+bounces-27522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF287A4ED19
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB27118906EC
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6F3264FBD;
	Tue,  4 Mar 2025 19:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGkh7YfB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630D42638B3;
	Tue,  4 Mar 2025 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741115852; cv=none; b=c9xdhGT8W5reAfgJm2DO+a2iePbfKYUariNVysUlqvb7/ZgL6P+8YyN5S01EUIkQ9AuZpOVsv/sDlKN0vFnig0leVPtL4xxM0gAnMieX0w4bEZdlvJYSczuAf9wf+IlKnRv9gAoffBj5C4tK9spZ9NhAoav0XiNB3R254vQmv8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741115852; c=relaxed/simple;
	bh=uK2+8lBz360Uys9oVMWg//rNrEukUIaibr5z/0zhx7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mmXolqRHZqMekI4ztWpHpRGuC9gLAhb43k6NHeBTiNCCvFG6PCql+11sYwmNuu2f79yRpDCyp6XHSq/YAZNSp+H1pbjquLJgn1aBHBR/VJrASElG1JWOqnWF4HIdkAXK/24cpPseJW8N/vntN3mo7qqrNShTijXRvNSr87T5vfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGkh7YfB; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-474e93b0caaso1854441cf.2;
        Tue, 04 Mar 2025 11:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741115849; x=1741720649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmJnmcc0N2wLcu0IcTSasZgcxGFn/LgzthWHWxMaXBg=;
        b=BGkh7YfBWk8fWCfYPwpFXNEPmk85dmjEuZVpSeoEkgqjb5/7CFIJ5IUnmxHrBZHU9k
         6l4AUmIdmHXAWI5W3BgweKSFDUuTdz839mOQaxKHIG6CbPtpqh+QnLzKWkwZ7TPHWh/A
         zR49c6ede1Dot/doMVO+NR4NTEowM62FjVHF5vnhiAb9lJW4eoqeji7rjhIGwlCWLHrP
         ENUXM5L8iGFeed6CIQp3Sbam3XVxmQWu8XSROnd/q1M656f6YQPHe6SuZm4XiHK16NQ2
         BtuXK4n3ZuVHh20ZLuCiasEjgmCC5g9KYeGyO7zqswS6dOYmrvKz2Gz85z6RG7ykKURc
         joeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741115849; x=1741720649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmJnmcc0N2wLcu0IcTSasZgcxGFn/LgzthWHWxMaXBg=;
        b=gqBX71sGE+0lbOp8VVbBBZPxRdy1aYHsRlFkFar+jRmvWlZIxGnDwCPCKl3ZWFvBG7
         5sLnY8Zah0Kntenj9UhqugbJ6/nhvyoGxlWkx6vbHvVOw8Nev8pWbO1bxHd0oT9sxMBx
         XhTKCkz9nxKolK6v8Oxb9ZrRmqz0gR6yRQr86w2FkpnMsoGxFK19aLEFqOXLBpnt9BJ8
         LZLrDTfkA9cBR1OkWvVpj8/RW0Xdssyvo2ZYV/80feko9TUzqLtyD/lj8OfMK9fIH9oo
         WbNyKzxrWkTu3s+N1DgZfqaI2PBIWAuErH2KTTgI+Qz03+MJwqfOz2IXjEHHTBSYo4pP
         cnkg==
X-Forwarded-Encrypted: i=1; AJvYcCWJuIIfbO/1RztZzY0xuFIFLhXiHJuHfo01LSVh1tESXZp+lb1r9VORpHabSA0UY9Yi26tyaQ2aHEfjegY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgGSb2hu8cibNrAXk/NDj/4/TSGPg88O591zFJIvyXmx6Fd3br
	LIacu9qarKkWtPxf+nZ2ZBhY61ZgH4OGTb4dlX6cpn4+aFXBeHQQ
X-Gm-Gg: ASbGncvbInAaciMlLf06W4dEoD1agsM9leI2Fwq5c9Edn8AJN8OEmbSuO7RnyEeg1u3
	KGbC8+HL5wBF9VAqWeIaHEPGM/Z5RJIN8dfdOhXZv0vjjXzF6BccRfR6kNUum1rvHJ/96ZQ1FO+
	a89im7rTfy2hbvW1gWELOY21EDMzqNwnO5If4cuOVa0prvVOx9sEETaQKGd6gF0An3ukl+fHz3P
	D2suz8GMAB46ZC72mpa4s9ADS71fOJrnwgPzOoLMmYIRol6P0sGl/he9pVR/x7qJbPu1LkaRrG2
	Cof7tPYl7GpCljaDoAIwd6HkQYNz/h5aEC0wfHFb3wdcitU+c17231bRTXdXfDwTO+di92S+d7A
	dWjO4lMkURw==
X-Google-Smtp-Source: AGHT+IE90avtjSNOtr3w1u/I13H9dpm5sBaeIeV65j/slah5WyqBAeM4cJpjNltCzWd0jtaTZvYbkQ==
X-Received: by 2002:ac8:5f46:0:b0:471:f5a4:546 with SMTP id d75a77b69052e-4750b2405a9mr1408971cf.3.1741115849033;
        Tue, 04 Mar 2025 11:17:29 -0800 (PST)
Received: from matt-Z87X-UD4H.mynetworksettings.com ([2600:1002:a012:8f2c:1c50:24c:178b:a9b3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474f351687bsm24079351cf.19.2025.03.04.11.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:17:28 -0800 (PST)
From: Matthew Majewski <mattwmajewski@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Majewski <mattwmajewski@gmail.com>
Subject: [PATCH 3/3] media: vim2m: Add parametized support for multiplanar API
Date: Tue,  4 Mar 2025 14:17:01 -0500
Message-Id: <20250304191701.2957096-4-mattwmajewski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304191701.2957096-1-mattwmajewski@gmail.com>
References: <20250304191701.2957096-1-mattwmajewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the mulitiplaner API. The device can now act as
either a multi-planar or a single-planar device depending on a module
parameter, similar to the way vivid behaves.

Multiplanar support was added by implementing the appropate
try/get/set mplane functions, and by modifying the queue_setup() and
buf_prepare() functions to handle multiple planes. Implementation
was inspired by vivid.

Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
---
 drivers/media/test-drivers/vim2m.c | 306 +++++++++++++++++++++++++----
 1 file changed, 267 insertions(+), 39 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index a22b61793a52..91123ec4cd22 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -43,6 +43,10 @@ static unsigned int default_transtime = 40; /* Max 25 fps */
 module_param(default_transtime, uint, 0644);
 MODULE_PARM_DESC(default_transtime, "default transaction time in ms");
 
+static unsigned int multiplanar = 1;
+module_param(multiplanar, uint, 0644);
+MODULE_PARM_DESC(multiplanar, "1 (default) creates a single planar device, 2 creates multiplanar device.");
+
 #define MIN_W 32
 #define MIN_H 32
 #define MAX_W 640
@@ -135,7 +139,8 @@ static struct vim2m_fmt formats[] = {
 struct vim2m_q_data {
 	unsigned int		width;
 	unsigned int		height;
-	unsigned int		sizeimage;
+	unsigned int            num_mem_planes;
+	unsigned int		sizeimage[VIDEO_MAX_PLANES];
 	unsigned int		sequence;
 	struct vim2m_fmt	*fmt;
 };
@@ -194,6 +199,7 @@ struct vim2m_dev {
 	struct mutex		dev_mutex;
 
 	struct v4l2_m2m_dev	*m2m_dev;
+	bool			multiplanar;
 };
 
 struct vim2m_ctx {
@@ -238,8 +244,10 @@ static struct vim2m_q_data *get_q_data(struct vim2m_ctx *ctx,
 {
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		return &ctx->q_data[V4L2_M2M_SRC];
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		return &ctx->q_data[V4L2_M2M_DST];
 	default:
 		return NULL;
@@ -250,8 +258,10 @@ static const char *type_name(enum v4l2_buf_type type)
 {
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		return "Output";
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		return "Capture";
 	default:
 		return "Invalid";
@@ -721,6 +731,7 @@ static int vidioc_g_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 {
 	struct vb2_queue *vq;
 	struct vim2m_q_data *q_data;
+	int ret;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
 	if (!vq)
@@ -730,12 +741,12 @@ static int vidioc_g_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 	if (!q_data)
 		return -EINVAL;
 
-	f->fmt.pix.width	= q_data->width;
-	f->fmt.pix.height	= q_data->height;
+	ret = v4l2_fill_pixfmt(&f->fmt.pix, q_data->fmt->fourcc,
+			       q_data->width, q_data->height);
+	if (ret)
+		return ret;
+
 	f->fmt.pix.field	= V4L2_FIELD_NONE;
-	f->fmt.pix.pixelformat	= q_data->fmt->fourcc;
-	f->fmt.pix.bytesperline	= (q_data->width * q_data->fmt->depth) >> 3;
-	f->fmt.pix.sizeimage	= q_data->sizeimage;
 	f->fmt.pix.colorspace	= ctx->colorspace;
 	f->fmt.pix.xfer_func	= ctx->xfer_func;
 	f->fmt.pix.ycbcr_enc	= ctx->ycbcr_enc;
@@ -744,33 +755,102 @@ static int vidioc_g_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 	return 0;
 }
 
+static int vidioc_g_fmt_mplane(struct vim2m_ctx *ctx, struct v4l2_format *f)
+{
+	struct vb2_queue *vq;
+	struct vim2m_q_data *q_data;
+	int ret;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (!vq)
+		return -EINVAL;
+
+	q_data = get_q_data(ctx, f->type);
+	if (!q_data)
+		return -EINVAL;
+
+	ret = v4l2_fill_pixfmt_mp(&f->fmt.pix_mp, q_data->fmt->fourcc,
+				  q_data->width, q_data->height);
+	if (ret)
+		return ret;
+
+	f->fmt.pix_mp.field	   = V4L2_FIELD_NONE;
+	f->fmt.pix_mp.colorspace   = ctx->colorspace;
+	f->fmt.pix_mp.xfer_func	   = ctx->xfer_func;
+	f->fmt.pix_mp.ycbcr_enc	   = ctx->ycbcr_enc;
+	f->fmt.pix_mp.quantization = ctx->quant;
+
+	return 0;
+}
+
 static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (dev->multiplanar)
+		return -ENOTTY;
+
 	return vidioc_g_fmt(file2ctx(file), f);
 }
 
 static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (dev->multiplanar)
+		return -ENOTTY;
+
 	return vidioc_g_fmt(file2ctx(file), f);
 }
 
-static int vidioc_try_fmt(struct v4l2_format *f)
+static int vidioc_g_fmt_vid_out_mplane(struct file *file, void *priv,
+				       struct v4l2_format *f)
 {
-	int width, height, walign, halign;
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (!dev->multiplanar)
+		return -ENOTTY;
+
+	return vidioc_g_fmt_mplane(file2ctx(file), f);
+}
+
+static int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *priv,
+				       struct v4l2_format *f)
+{
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (!dev->multiplanar)
+		return -ENOTTY;
 
-	width = clamp(f->fmt.pix.width, MIN_W, MAX_W);
-	height = clamp(f->fmt.pix.width, MIN_H, MAX_H);
+	return vidioc_g_fmt_mplane(file2ctx(file), f);
+}
+
+static int vidioc_try_fmt(struct v4l2_format *f, bool is_mplane)
+{
+	int walign, halign, ret;
+	int width = (is_mplane) ? f->fmt.pix_mp.width : f->fmt.pix.width;
+	int height = (is_mplane) ? f->fmt.pix_mp.height : f->fmt.pix.height;
+	u32 pixfmt = (is_mplane) ? f->fmt.pix_mp.pixelformat :
+		f->fmt.pix.pixelformat;
+
+	width = clamp(width, MIN_W, MAX_W);
+	height = clamp(height, MIN_H, MAX_H);
 
-	get_alignment(f->fmt.pix.pixelformat, &walign, &halign);
+	get_alignment(pixfmt, &walign, &halign);
 	width = ALIGN(width, walign);
 	height = ALIGN(height, halign);
 
 	f->fmt.pix.field = V4L2_FIELD_NONE;
 
-	return v4l2_fill_pixfmt(&f->fmt.pix, f->fmt.pix.pixelformat,
-			       width, height);
+	if (is_mplane) {
+		ret = v4l2_fill_pixfmt_mp(&f->fmt.pix_mp, pixfmt, width,
+					  height);
+	} else {
+		ret = v4l2_fill_pixfmt(&f->fmt.pix, pixfmt,  width, height);
+	}
+	return ret;
 }
 
 static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
@@ -778,6 +858,10 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct vim2m_fmt *fmt;
 	struct vim2m_ctx *ctx = file2ctx(file);
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (dev->multiplanar)
+		return -ENOTTY;
 
 	fmt = find_format(f->fmt.pix.pixelformat);
 	if (!fmt) {
@@ -795,7 +879,36 @@ static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 	f->fmt.pix.ycbcr_enc = ctx->ycbcr_enc;
 	f->fmt.pix.quantization = ctx->quant;
 
-	return vidioc_try_fmt(f);
+	return vidioc_try_fmt(f, false);
+}
+
+static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
+					 struct v4l2_format *f)
+{
+	struct vim2m_fmt *fmt;
+	struct vim2m_ctx *ctx = file2ctx(file);
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (!dev->multiplanar)
+		return -ENOTTY;
+
+	fmt = find_format(f->fmt.pix_mp.pixelformat);
+	if (!fmt) {
+		f->fmt.pix_mp.pixelformat = formats[0].fourcc;
+		fmt = find_format(f->fmt.pix_mp.pixelformat);
+	}
+	if (!(fmt->types & MEM2MEM_CAPTURE)) {
+		v4l2_err(&ctx->dev->v4l2_dev,
+			 "Fourcc format (0x%08x) invalid.\n",
+			 f->fmt.pix.pixelformat);
+		return -EINVAL;
+	}
+	f->fmt.pix_mp.colorspace = ctx->colorspace;
+	f->fmt.pix_mp.xfer_func = ctx->xfer_func;
+	f->fmt.pix_mp.ycbcr_enc = ctx->ycbcr_enc;
+	f->fmt.pix_mp.quantization = ctx->quant;
+
+	return vidioc_try_fmt(f, true);
 }
 
 static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
@@ -803,6 +916,10 @@ static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
 {
 	struct vim2m_fmt *fmt;
 	struct vim2m_ctx *ctx = file2ctx(file);
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (dev->multiplanar)
+		return -ENOTTY;
 
 	fmt = find_format(f->fmt.pix.pixelformat);
 	if (!fmt) {
@@ -818,13 +935,45 @@ static int vidioc_try_fmt_vid_out(struct file *file, void *priv,
 	if (!f->fmt.pix.colorspace)
 		f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
 
-	return vidioc_try_fmt(f);
+	return vidioc_try_fmt(f, false);
+}
+
+static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
+					 struct v4l2_format *f)
+{
+	struct vim2m_fmt *fmt;
+	struct vim2m_ctx *ctx = file2ctx(file);
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (!dev->multiplanar)
+		return -ENOTTY;
+
+	fmt = find_format(f->fmt.pix_mp.pixelformat);
+	if (!fmt) {
+		f->fmt.pix_mp.pixelformat = formats[0].fourcc;
+		fmt = find_format(f->fmt.pix_mp.pixelformat);
+	}
+	if (!(fmt->types & MEM2MEM_OUTPUT)) {
+		v4l2_err(&ctx->dev->v4l2_dev,
+			 "Fourcc format (0x%08x) invalid.\n",
+			 f->fmt.pix_mp.pixelformat);
+		return -EINVAL;
+	}
+	if (!f->fmt.pix_mp.colorspace)
+		f->fmt.pix_mp.colorspace = V4L2_COLORSPACE_REC709;
+
+	return vidioc_try_fmt(f, true);
 }
 
 static int vidioc_s_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 {
 	struct vim2m_q_data *q_data;
 	struct vb2_queue *vq;
+	unsigned int i;
+	bool is_mplane = ctx->dev->multiplanar;
+	u32 pixfmt = (is_mplane) ? f->fmt.pix_mp.pixelformat : f->fmt.pix.pixelformat;
+	u32 width = (is_mplane) ? f->fmt.pix_mp.width : f->fmt.pix.width;
+	u32 height = (is_mplane) ? f->fmt.pix_mp.height : f->fmt.pix.height;
 
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
 	if (!vq)
@@ -839,11 +988,17 @@ static int vidioc_s_fmt(struct vim2m_ctx *ctx, struct v4l2_format *f)
 		return -EBUSY;
 	}
 
-	q_data->fmt		= find_format(f->fmt.pix.pixelformat);
-	q_data->width		= f->fmt.pix.width;
-	q_data->height		= f->fmt.pix.height;
-	q_data->sizeimage	= q_data->width * q_data->height
-				* q_data->fmt->depth >> 3;
+	q_data->fmt		= find_format(pixfmt);
+	q_data->width		= width;
+	q_data->height		= height;
+	if (is_mplane) {
+		q_data->num_mem_planes = f->fmt.pix_mp.num_planes;
+		for (i = 0; i < f->fmt.pix_mp.num_planes; i++)
+			q_data->sizeimage[i] = f->fmt.pix_mp.plane_fmt[i].sizeimage;
+	} else {
+		q_data->sizeimage[0] = f->fmt.pix.sizeimage;
+		q_data->num_mem_planes = 1;
+	}
 
 	dprintk(ctx->dev, 1,
 		"Format for type %s: %dx%d (%d bpp), fmt: %c%c%c%c\n",
@@ -861,6 +1016,10 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	int ret;
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (dev->multiplanar)
+		return -ENOTTY;
 
 	ret = vidioc_try_fmt_vid_cap(file, priv, f);
 	if (ret)
@@ -869,12 +1028,32 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	return vidioc_s_fmt(file2ctx(file), f);
 }
 
+static int vidioc_s_fmt_vid_cap_mplane(struct file *file, void *priv,
+				       struct v4l2_format *f)
+{
+	int ret;
+	struct vim2m_dev *dev = video_drvdata(file);
+
+	if (!dev->multiplanar)
+		return -ENOTTY;
+
+	ret = vidioc_try_fmt_vid_cap_mplane(file, priv, f);
+	if (ret)
+		return ret;
+
+	return vidioc_s_fmt(file2ctx(file), f);
+}
+
 static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
 	struct vim2m_ctx *ctx = file2ctx(file);
+	struct vim2m_dev *dev = video_drvdata(file);
 	int ret;
 
+	if (dev->multiplanar)
+		return -ENOTTY;
+
 	ret = vidioc_try_fmt_vid_out(file, priv, f);
 	if (ret)
 		return ret;
@@ -889,6 +1068,30 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 	return ret;
 }
 
+static int vidioc_s_fmt_vid_out_mplane(struct file *file, void *priv,
+				       struct v4l2_format *f)
+{
+	struct vim2m_ctx *ctx = file2ctx(file);
+	struct vim2m_dev *dev = video_drvdata(file);
+	int ret;
+
+	if (!dev->multiplanar)
+		return -ENOTTY;
+
+	ret = vidioc_try_fmt_vid_out_mplane(file, priv, f);
+	if (ret)
+		return ret;
+
+	ret = vidioc_s_fmt(file2ctx(file), f);
+	if (!ret) {
+		ctx->colorspace = f->fmt.pix_mp.colorspace;
+		ctx->xfer_func = f->fmt.pix_mp.xfer_func;
+		ctx->ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
+		ctx->quant = f->fmt.pix_mp.quantization;
+	}
+	return ret;
+}
+
 static int vim2m_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vim2m_ctx *ctx =
@@ -939,11 +1142,17 @@ static const struct v4l2_ioctl_ops vim2m_ioctl_ops = {
 	.vidioc_g_fmt_vid_cap	= vidioc_g_fmt_vid_cap,
 	.vidioc_try_fmt_vid_cap	= vidioc_try_fmt_vid_cap,
 	.vidioc_s_fmt_vid_cap	= vidioc_s_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap_mplane = vidioc_g_fmt_vid_cap_mplane,
+	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt_vid_cap_mplane,
+	.vidioc_s_fmt_vid_cap_mplane	= vidioc_s_fmt_vid_cap_mplane,
 
 	.vidioc_enum_fmt_vid_out = vidioc_enum_fmt_vid_out,
 	.vidioc_g_fmt_vid_out	= vidioc_g_fmt_vid_out,
 	.vidioc_try_fmt_vid_out	= vidioc_try_fmt_vid_out,
 	.vidioc_s_fmt_vid_out	= vidioc_s_fmt_vid_out,
+	.vidioc_g_fmt_vid_out_mplane = vidioc_g_fmt_vid_out_mplane,
+	.vidioc_try_fmt_vid_out_mplane = vidioc_try_fmt_vid_out_mplane,
+	.vidioc_s_fmt_vid_out_mplane	= vidioc_s_fmt_vid_out_mplane,
 
 	.vidioc_reqbufs		= v4l2_m2m_ioctl_reqbufs,
 	.vidioc_querybuf	= v4l2_m2m_ioctl_querybuf,
@@ -972,23 +1181,32 @@ static int vim2m_queue_setup(struct vb2_queue *vq,
 {
 	struct vim2m_ctx *ctx = vb2_get_drv_priv(vq);
 	struct vim2m_q_data *q_data;
-	unsigned int size, count = *nbuffers;
+	unsigned int size, p, count = *nbuffers;
 
 	q_data = get_q_data(ctx, vq->type);
 	if (!q_data)
 		return -EINVAL;
 
-	size = q_data->width * q_data->height * q_data->fmt->depth >> 3;
+	size = 0;
+	for (p = 0; p < q_data->num_mem_planes; p++)
+		size += q_data->sizeimage[p];
 
 	while (size * count > MEM2MEM_VID_MEM_LIMIT)
 		(count)--;
 	*nbuffers = count;
 
-	if (*nplanes)
-		return sizes[0] < size ? -EINVAL : 0;
-
-	*nplanes = 1;
-	sizes[0] = size;
+	if (*nplanes) {
+		if (*nplanes != q_data->num_mem_planes)
+			return -EINVAL;
+		for (p = 0; p < q_data->num_mem_planes; p++) {
+			if (sizes[p] < q_data->sizeimage[p])
+				return -EINVAL;
+		}
+	} else {
+		*nplanes = q_data->num_mem_planes;
+		for (p = 0; p < q_data->num_mem_planes; p++)
+			sizes[p] = q_data->sizeimage[p];
+	}
 
 	dprintk(ctx->dev, 1, "%s: get %d buffer(s) of size %d each.\n",
 		type_name(vq->type), count, size);
@@ -1015,21 +1233,24 @@ static int vim2m_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vim2m_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct vim2m_q_data *q_data;
+	unsigned int p;
 
 	dprintk(ctx->dev, 2, "type: %s\n", type_name(vb->vb2_queue->type));
 
 	q_data = get_q_data(ctx, vb->vb2_queue->type);
 	if (!q_data)
 		return -EINVAL;
-	if (vb2_plane_size(vb, 0) < q_data->sizeimage) {
-		dprintk(ctx->dev, 1,
-			"%s data will not fit into plane (%lu < %lu)\n",
-			__func__, vb2_plane_size(vb, 0),
-			(long)q_data->sizeimage);
-		return -EINVAL;
-	}
 
-	vb2_set_plane_payload(vb, 0, q_data->sizeimage);
+	for (p = 0; p < q_data->num_mem_planes; p++) {
+		if (vb2_plane_size(vb, p) < q_data->sizeimage[p]) {
+			dprintk(ctx->dev, 1,
+				"%s data will not fit into plane (%lu < %lu)\n",
+				__func__, vb2_plane_size(vb, p),
+				(long)q_data->sizeimage[p]);
+			return -EINVAL;
+		}
+		vb2_set_plane_payload(vb, p, q_data->sizeimage[p]);
+	}
 
 	return 0;
 }
@@ -1100,7 +1321,8 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	struct vim2m_ctx *ctx = priv;
 	int ret;
 
-	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	src_vq->type = (ctx->dev->multiplanar) ? V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE :
+		V4L2_BUF_TYPE_VIDEO_OUTPUT;
 	src_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 	src_vq->drv_priv = ctx;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
@@ -1114,7 +1336,8 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
 	if (ret)
 		return ret;
 
-	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	dst_vq->type = (ctx->dev->multiplanar) ? V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
+		V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
@@ -1188,10 +1411,11 @@ static int vim2m_open(struct file *file)
 	ctx->q_data[V4L2_M2M_SRC].fmt = &formats[0];
 	ctx->q_data[V4L2_M2M_SRC].width = 640;
 	ctx->q_data[V4L2_M2M_SRC].height = 480;
-	ctx->q_data[V4L2_M2M_SRC].sizeimage =
+	ctx->q_data[V4L2_M2M_SRC].sizeimage[0] =
 		ctx->q_data[V4L2_M2M_SRC].width *
 		ctx->q_data[V4L2_M2M_SRC].height *
 		(ctx->q_data[V4L2_M2M_SRC].fmt->depth >> 3);
+	ctx->q_data[V4L2_M2M_SRC].num_mem_planes = 1;
 	ctx->q_data[V4L2_M2M_DST] = ctx->q_data[V4L2_M2M_SRC];
 	ctx->colorspace = V4L2_COLORSPACE_REC709;
 
@@ -1268,7 +1492,7 @@ static const struct video_device vim2m_videodev = {
 	.ioctl_ops	= &vim2m_ioctl_ops,
 	.minor		= -1,
 	.release	= vim2m_device_release,
-	.device_caps	= V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
+	.device_caps	= V4L2_CAP_STREAMING,
 };
 
 static const struct v4l2_m2m_ops m2m_ops = {
@@ -1299,10 +1523,14 @@ static int vim2m_probe(struct platform_device *pdev)
 	atomic_set(&dev->num_inst, 0);
 	mutex_init(&dev->dev_mutex);
 
+	dev->multiplanar = (multiplanar == 2);
+
 	dev->vfd = vim2m_videodev;
 	vfd = &dev->vfd;
 	vfd->lock = &dev->dev_mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
+	vfd->device_caps |= (dev->multiplanar) ? V4L2_CAP_VIDEO_M2M_MPLANE :
+		V4L2_CAP_VIDEO_M2M;
 
 	video_set_drvdata(vfd, dev);
 	v4l2_info(&dev->v4l2_dev,
-- 
2.25.1


