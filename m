Return-Path: <linux-media+bounces-39244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC86B1F6A7
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 647251886C3A
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DBB2C3255;
	Sat,  9 Aug 2025 21:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GImPkPys"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C82C3251;
	Sat,  9 Aug 2025 21:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774323; cv=none; b=mnJ2EEaV3de3WCwknIObR3yAO/SdF03hIcvWTi1nUklRxm5UzZFPwskphT1zJetmUum2qViC+/Elk5oBpCToohNlnShqMlYcoDoYUS1ZQuFQ66/UL7UwDhN1kRbmS6RMnRVqoBAbhqX4GgnkVAbOLhqH9ol9tZD/ojvQoZRz3Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774323; c=relaxed/simple;
	bh=RTuU5gF+Pnv7QFPYmzxAZueyLDTQrkoFY0RSxOFOOCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rsrvqyjmb+/LnOJpCSkfEcaFNTglpmyDTNUYeKf8EpvAPeB9HEvb7dDHtTN+ZQdT0+ZMsmfTsI1Cy+BkeZcO2Bwx76prkMOUMPuzIluQKRYW4So6xYs8ykgC2LpS/A42XzE9grfAzRBhXR9s/SJ4PE7Xh+ZVYesQqeUHYl7saYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GImPkPys; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7D81E1440;
	Sat,  9 Aug 2025 23:17:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774262;
	bh=RTuU5gF+Pnv7QFPYmzxAZueyLDTQrkoFY0RSxOFOOCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GImPkPys4VzekcKtzPUUC/KesUmhWqTlTQ4tuPiXbrscvMB24Akln/DFXDGVV4I2w
	 oBft9yWXNpUAqKN23WTZRI794AW6NWO8dkP9fOtKswV9LdMYDQRmiCVyZSsyNygNVk
	 hbjNzaSu05vPxggR7tWp4lmtwBf6OfTgkwwGnzck=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 49/76] media: renesas: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:26 +0300
Message-ID: <20250809211654.28887-50-laurent.pinchart@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 drivers/media/platform/renesas/rcar_fdp1.c | 13 ++++--------
 drivers/media/platform/renesas/rcar_jpu.c  | 23 +++++++++-------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
index e2dba0e4f315..84c3901a2e5d 100644
--- a/drivers/media/platform/renesas/rcar_fdp1.c
+++ b/drivers/media/platform/renesas/rcar_fdp1.c
@@ -630,14 +630,9 @@ struct fdp1_ctx {
 	struct fdp1_field_buffer	*previous;
 };
 
-static inline struct fdp1_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct fdp1_ctx, fh);
-}
-
 static inline struct fdp1_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct fdp1_ctx, fh);
 }
 
 static struct fdp1_q_data *get_q_data(struct fdp1_ctx *ctx,
@@ -1411,8 +1406,8 @@ static int fdp1_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int fdp1_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
+	struct fdp1_ctx *ctx = file_to_ctx(file);
 	struct fdp1_q_data *q_data;
-	struct fdp1_ctx *ctx = fh_to_ctx(priv);
 
 	if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
 		return -EINVAL;
@@ -1589,7 +1584,7 @@ static void fdp1_try_fmt_capture(struct fdp1_ctx *ctx,
 
 static int fdp1_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct fdp1_ctx *ctx = fh_to_ctx(priv);
+	struct fdp1_ctx *ctx = file_to_ctx(file);
 
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		fdp1_try_fmt_output(ctx, NULL, &f->fmt.pix_mp);
@@ -1660,7 +1655,7 @@ static void fdp1_set_format(struct fdp1_ctx *ctx,
 
 static int fdp1_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct fdp1_ctx *ctx = fh_to_ctx(priv);
+	struct fdp1_ctx *ctx = file_to_ctx(file);
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct vb2_queue *vq = v4l2_m2m_get_vq(m2m_ctx, f->type);
 
diff --git a/drivers/media/platform/renesas/rcar_jpu.c b/drivers/media/platform/renesas/rcar_jpu.c
index 0b479dfa2917..9c70a74a2969 100644
--- a/drivers/media/platform/renesas/rcar_jpu.c
+++ b/drivers/media/platform/renesas/rcar_jpu.c
@@ -480,14 +480,9 @@ static struct jpu_ctx *ctrl_to_ctx(struct v4l2_ctrl *c)
 	return container_of(c->handler, struct jpu_ctx, ctrl_handler);
 }
 
-static struct jpu_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct jpu_ctx, fh);
-}
-
 static struct jpu_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct jpu_ctx, fh);
 }
 
 static void jpu_set_tbl(struct jpu *jpu, u32 reg, const unsigned int *tbl,
@@ -661,7 +656,7 @@ static u8 jpu_parse_hdr(void *buffer, unsigned long size, unsigned int *width,
 static int jpu_querycap(struct file *file, void *priv,
 			struct v4l2_capability *cap)
 {
-	struct jpu_ctx *ctx = fh_to_ctx(priv);
+	struct jpu_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->encoder)
 		strscpy(cap->card, DRV_NAME " encoder", sizeof(cap->card));
@@ -719,7 +714,7 @@ static int jpu_enum_fmt(struct v4l2_fmtdesc *f, u32 type)
 static int jpu_enum_fmt_cap(struct file *file, void *priv,
 			    struct v4l2_fmtdesc *f)
 {
-	struct jpu_ctx *ctx = fh_to_ctx(priv);
+	struct jpu_ctx *ctx = file_to_ctx(file);
 
 	return jpu_enum_fmt(f, ctx->encoder ? JPU_ENC_CAPTURE :
 			    JPU_DEC_CAPTURE);
@@ -728,7 +723,7 @@ static int jpu_enum_fmt_cap(struct file *file, void *priv,
 static int jpu_enum_fmt_out(struct file *file, void *priv,
 			    struct v4l2_fmtdesc *f)
 {
-	struct jpu_ctx *ctx = fh_to_ctx(priv);
+	struct jpu_ctx *ctx = file_to_ctx(file);
 
 	return jpu_enum_fmt(f, ctx->encoder ? JPU_ENC_OUTPUT : JPU_DEC_OUTPUT);
 }
@@ -828,7 +823,7 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct jpu_fmt **fmtinfo,
 
 static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct jpu_ctx *ctx = fh_to_ctx(priv);
+	struct jpu_ctx *ctx = file_to_ctx(file);
 
 	if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
 		return -EINVAL;
@@ -839,7 +834,7 @@ static int jpu_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct vb2_queue *vq;
-	struct jpu_ctx *ctx = fh_to_ctx(priv);
+	struct jpu_ctx *ctx = file_to_ctx(file);
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct jpu_fmt *fmtinfo;
 	struct jpu_q_data *q_data;
@@ -868,8 +863,8 @@ static int jpu_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 
 static int jpu_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
+	struct jpu_ctx *ctx = file_to_ctx(file);
 	struct jpu_q_data *q_data;
-	struct jpu_ctx *ctx = fh_to_ctx(priv);
 
 	if (!v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type))
 		return -EINVAL;
@@ -902,8 +897,8 @@ static const struct v4l2_ctrl_ops jpu_ctrl_ops = {
 
 static int jpu_streamon(struct file *file, void *priv, enum v4l2_buf_type type)
 {
-	struct jpu_ctx *ctx = fh_to_ctx(priv);
 	struct jpu_q_data *src_q_data, *dst_q_data, *orig, adj, *ref;
+	struct jpu_ctx *ctx = file_to_ctx(file);
 	enum v4l2_buf_type adj_type;
 
 	src_q_data = jpu_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
@@ -1284,8 +1279,8 @@ static int jpu_open(struct file *file)
 
 static int jpu_release(struct file *file)
 {
-	struct jpu *jpu = video_drvdata(file);
 	struct jpu_ctx *ctx = file_to_ctx(file);
+	struct jpu *jpu = video_drvdata(file);
 
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-- 
Regards,

Laurent Pinchart


