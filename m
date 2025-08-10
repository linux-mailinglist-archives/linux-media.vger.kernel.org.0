Return-Path: <linux-media+bounces-39322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC91B1F7D5
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A022217B655
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F109C1ABED9;
	Sun, 10 Aug 2025 01:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lyBhdMXM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D543B1624D5;
	Sun, 10 Aug 2025 01:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789565; cv=none; b=bd+N4ZodttiHGdsMrWVEgzfsNrYwIshdNVuqTZan4YOCBmwM4XuuKOyLqqyKZ67yPB93CeKxSPdLsxp6hz+k5Rcvw3/FcnO+PuddfheObbgL+f9CcCnExG5JXX3lvb374OU6iutpbUkstpSnn6nULdLVNfJQ3lf2wn9HBb5pzJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789565; c=relaxed/simple;
	bh=PQWUYH47SdmKo2TY317NN45jFfxsJnv06VnqrTgNPw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mm44Rhe5oC3sDyExymX7lS9MlCPDVEYXoy0Jq5UnHB4Q9P7G2mGDzXCWJEFoBW6v+iA7ZA0CNizb7Kqa1y1w5CM2k5Cot7JiuYmDGNNNyTU+wyxPPOuBQ/xw6VvLmNKOzI0Y5CU5YT/DQQ7/o8+y6YmiQrCc094N2kO/w/tILSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lyBhdMXM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AAEBC8CB;
	Sun, 10 Aug 2025 03:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789511;
	bh=PQWUYH47SdmKo2TY317NN45jFfxsJnv06VnqrTgNPw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lyBhdMXMqG4pZ9l+auIjGaJHww3jrJloMTS+wEELBELBhLX19vlwMmmNPx7X6R7KV
	 fMpGkFjSMwXHXtV8eVBdmcR2bpUQtXwVsAYaXKbqCQ/qwP6BBUH6rxUhF9HBM2FGpV
	 e24n4GpSOq7/DdN5yjk6jlex2fdsynqlxmXYnpyg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 49/76] media: renesas: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:31 +0300
Message-ID: <20250810013100.29776-50-laurent.pinchart+renesas@ideasonboard.com>
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
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


