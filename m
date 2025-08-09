Return-Path: <linux-media+bounces-39234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB1B1F695
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA3217F1A5
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198E32C15A8;
	Sat,  9 Aug 2025 21:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BgpR+42N"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6E27C872
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774307; cv=none; b=E3xTFaGIqqv3xpt8z3rqPJ3oFbjrlcE2zI+vE4dh/ZDHeYwRVm1dSnAyQRzezEBYefmYPvECOWIDo8IbRSB8eH0amyDXkkwwffZsFIS2qmcltJwp+Ks30c1ne+4me7GIcF6ejGdrgoQy/FOTQFoR5yzxw37OAy9RdxI+bxWTiEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774307; c=relaxed/simple;
	bh=wKM8rev5WX7dPhGgLpd3xurm9bbGjTWTZknYYUGWqTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEBTTJNKSp+k8lXfSjeRinIY8CgU8on6af1zMaOabpPFEsVzE0ZaMzrVgGb1eOH802x6uf8WHxftjqoJQpEjbfJfmE6F1PcrLAuPKY7Lg3r/dkXjMfUqPh8Ip06qMWv2vtJ3NaJGGQHu1M0jSAEA3MHHHgHYla0H5CxUhuLufwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BgpR+42N; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 32C9AEFE;
	Sat,  9 Aug 2025 23:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774247;
	bh=wKM8rev5WX7dPhGgLpd3xurm9bbGjTWTZknYYUGWqTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BgpR+42NAEgsbUmH0GhnGT+GSgOqh+E4FIS0G2+VBkfsQVfJsE6vfyngafuntoS2x
	 i0BrC5FfHEefrbWXBR4ct/Bkc0APvsoToy9t5z0+hxK7FVt9aR5jDgJgpYtYmlX5js
	 ilajv8WIWrSNuQkJujiJRdQPxiSqDyyLa3CbNLso=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 40/76] media: m2m-deinterlace: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:17 +0300
Message-ID: <20250809211654.28887-41-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
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


