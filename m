Return-Path: <linux-media+bounces-39314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD6EB1F7CB
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B72BB3BF5EF
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EC51F3FE9;
	Sun, 10 Aug 2025 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eTwyup11"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3B1F3BA2
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789552; cv=none; b=juSKJdEkmZUOOn0tZquDaTBWU8k5m0su9EaN4ldg/fj3EHbKw6/VcHZ3H/ZnxfpxPozNHNfiS9jDZWuwzS3mu5Td5FPeIiRJRxoeuSw4DUy5GXs04zSzpVG7GKN/8WzaUYjMgIxS7SLOqSPc/m+Q2RAy6icw2mOCEQ7N3IhHuGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789552; c=relaxed/simple;
	bh=9lmvYyOYztL02CeNZX+3xsDeVzk4qhTGGo4MAk7g7zE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DUrCGvMXRsgO7+kiFMOm2czbR/QZ6D1xYEKPgvf2428jiVn/efoHsFiWhOoBesN3bk1fsESxN3TAjKW8FahRcFc2wFgMomAScAlBUL5eQb2cbjG7rQaENoefHuifdn1lHauW6CiAFGRMZkO4W/XNi+crwCUU+5gdOTr2C3IyglA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eTwyup11; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A6CBD104D;
	Sun, 10 Aug 2025 03:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789498;
	bh=9lmvYyOYztL02CeNZX+3xsDeVzk4qhTGGo4MAk7g7zE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eTwyup11RNxcIQnRk180JYNAmUjuNiE/vFA4VJ4ZxZ6DrnZ7FI4fO3O9OlIiH9335
	 MSkealOmqzCzVuXcWsro5AyOmGEaSunfh8MXUcUZlS+AANtX6MAU04xNDpcKnQWPJ3
	 L7etgHokItfjG+uixCVhB2bvP3ORB15RRYU0c63s=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 41/76] media: mtk: jpeg: Access v4l2_fh from file->private_data
Date: Sun, 10 Aug 2025 04:30:23 +0300
Message-ID: <20250810013100.29776-42-laurent.pinchart+renesas@ideasonboard.com>
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
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 29 ++++++++-----------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index de15d6f0b490..6268d651bdcf 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -119,14 +119,9 @@ static inline struct mtk_jpeg_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
 	return container_of(ctrl->handler, struct mtk_jpeg_ctx, ctrl_hdl);
 }
 
-static inline struct mtk_jpeg_ctx *mtk_jpeg_fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mtk_jpeg_ctx, fh);
-}
-
 static inline struct mtk_jpeg_ctx *mtk_jpeg_file_to_ctx(struct file *filp)
 {
-	return mtk_jpeg_fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mtk_jpeg_ctx, fh);
 }
 
 static inline struct mtk_jpeg_src_buf *mtk_jpeg_vb2_to_srcbuf(
@@ -217,7 +212,7 @@ static int mtk_jpeg_enum_fmt(struct mtk_jpeg_fmt *mtk_jpeg_formats, int n,
 static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
 	return mtk_jpeg_enum_fmt(jpeg->variant->formats,
@@ -228,7 +223,7 @@ static int mtk_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 static int mtk_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 
 	return mtk_jpeg_enum_fmt(jpeg->variant->formats,
@@ -310,7 +305,7 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 	struct vb2_queue *vq;
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	int i;
 
@@ -356,7 +351,7 @@ static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 					   struct v4l2_format *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct mtk_jpeg_fmt *fmt;
 
@@ -385,7 +380,7 @@ static int mtk_jpeg_try_fmt_vid_cap_mplane(struct file *file, void *priv,
 static int mtk_jpeg_try_fmt_vid_out_mplane(struct file *file, void *priv,
 					   struct v4l2_format *f)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct mtk_jpeg_fmt *fmt;
 
@@ -475,7 +470,7 @@ static int mtk_jpeg_s_fmt_vid_out_mplane(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
+	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_file_to_ctx(file), f,
 				     MTK_JPEG_FMT_FLAG_OUTPUT);
 }
 
@@ -488,7 +483,7 @@ static int mtk_jpeg_s_fmt_vid_cap_mplane(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
-	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_fh_to_ctx(priv), f,
+	return mtk_jpeg_s_fmt_mplane(mtk_jpeg_file_to_ctx(file), f,
 				     MTK_JPEG_FMT_FLAG_CAPTURE);
 }
 
@@ -517,7 +512,7 @@ static int mtk_jpeg_subscribe_event(struct v4l2_fh *fh,
 static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
@@ -542,7 +537,7 @@ static int mtk_jpeg_enc_g_selection(struct file *file, void *priv,
 static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
@@ -571,7 +566,7 @@ static int mtk_jpeg_dec_g_selection(struct file *file, void *priv,
 static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
 				    struct v4l2_selection *s)
 {
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
@@ -594,7 +589,7 @@ static int mtk_jpeg_enc_s_selection(struct file *file, void *priv,
 static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct vb2_buffer *vb;
 	struct mtk_jpeg_src_buf *jpeg_src_buf;
-- 
Regards,

Laurent Pinchart


