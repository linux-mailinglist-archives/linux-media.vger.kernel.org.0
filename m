Return-Path: <linux-media+bounces-39313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B47B1F7CA
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37044177824
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A50B1F3BAE;
	Sun, 10 Aug 2025 01:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kg5WhOdC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADF319D082
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789550; cv=none; b=eR11rs1GAMRmMefYeKLraAiDLtkkDQ6cx6lAvEcdMhsMdNzQ5v8fz16ONtSL6FvoJJLQl78YB7EDbEron3p2qHAdYw83XSqMlyT2SHphsMYplPR6aeenEiJhDIE5SJL+ldgpcj3QsYjSkTesi7ZR/t2S3tquwK9JQMWogfh8f5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789550; c=relaxed/simple;
	bh=wKM8rev5WX7dPhGgLpd3xurm9bbGjTWTZknYYUGWqTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2dz9XjmEjwOzTyhZwPIXSs3DwI9+aADOM2qPUbw+Irdlr8y92hhnc8GQzGGYp5m032uIcqEQ/bfkYUIgSY4eb+gKcqEWVvft1IqwXGz8evK3OkFxKqb9k4xtZNArrxFzCvoTWpz4DtaJkCBqNhPXxT2voJNoVMMuOxRt2jNJKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kg5WhOdC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0F32019C6;
	Sun, 10 Aug 2025 03:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789497;
	bh=wKM8rev5WX7dPhGgLpd3xurm9bbGjTWTZknYYUGWqTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kg5WhOdCbE5ll6ZDyFjh877WPiQ8nKtK/jack/MgonRrl2CsCw1/65pZXQ3pw9k6m
	 ZnBSVyNi7yQZOZZpErgisGdhj+05+bZXuX6gpCbHj4qzFy+Tz89kh+dl/klLMcbWlt
	 xbBr+f6MCl2l/YnNSStPsoJmH/ycBWE5z7Zyq5kI=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [PATCH v3 40/76] media: m2m-deinterlace: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:22 +0300
Message-ID: <20250810013100.29776-41-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/m2m-deinterlace.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
index 51c2f206cb1f..e07e57d4206b 100644
--- a/drivers/media/platform/m2m-deinterlace.c
+++ b/drivers/media/platform/m2m-deinterlace.c
@@ -517,13 +517,13 @@ static int vidioc_g_fmt(struct deinterlace_ctx *ctx, struct v4l2_format *f)
 static int vidioc_g_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	return vidioc_g_fmt(priv, f);
+	return vidioc_g_fmt(file_to_ctx(file), f);
 }
 
 static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	return vidioc_g_fmt(priv, f);
+	return vidioc_g_fmt(file_to_ctx(file), f);
 }
 
 static int vidioc_try_fmt(struct v4l2_format *f, struct deinterlace_fmt *fmt)
@@ -544,8 +544,8 @@ static int vidioc_try_fmt(struct v4l2_format *f, struct deinterlace_fmt *fmt)
 static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
+	struct deinterlace_ctx *ctx = file_to_ctx(file);
 	struct deinterlace_fmt *fmt;
-	struct deinterlace_ctx *ctx = priv;
 
 	fmt = find_format(f);
 	if (!fmt || !(fmt->types & MEM2MEM_CAPTURE))
@@ -638,20 +638,20 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	ret = vidioc_try_fmt_vid_cap(file, priv, f);
 	if (ret)
 		return ret;
-	return vidioc_s_fmt(priv, f);
+	return vidioc_s_fmt(file_to_ctx(file), f);
 }
 
 static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct deinterlace_ctx *ctx = priv;
+	struct deinterlace_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	ret = vidioc_try_fmt_vid_out(file, priv, f);
 	if (ret)
 		return ret;
 
-	ret = vidioc_s_fmt(priv, f);
+	ret = vidioc_s_fmt(ctx, f);
 	if (!ret)
 		ctx->colorspace = f->fmt.pix.colorspace;
 
@@ -661,8 +661,8 @@ static int vidioc_s_fmt_vid_out(struct file *file, void *priv,
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
+	struct deinterlace_ctx *ctx = file_to_ctx(file);
 	struct deinterlace_q_data *s_q_data, *d_q_data;
-	struct deinterlace_ctx *ctx = priv;
 
 	s_q_data = get_q_data(V4L2_BUF_TYPE_VIDEO_OUTPUT);
 	d_q_data = get_q_data(V4L2_BUF_TYPE_VIDEO_CAPTURE);
-- 
Regards,

Laurent Pinchart


