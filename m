Return-Path: <linux-media+bounces-39319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA34DB1F7D1
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 656093A7DC5
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B52C1A7264;
	Sun, 10 Aug 2025 01:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lc7PXKy0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5550A188A0C
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789561; cv=none; b=tD7NUKLc2F5HoVB24zxtrjbGLx/MoP0PLhKKOEuEegkIngr/uxdQ4Lm9kuWUICbLG72RRfT16ksHPzpDKNmkiXrfkz1oCzhKXgLOTy2/7EC0LCuU4/LWttnaCuurVy8FbkWlS7yHrorh/lToBGtZ121Wq7Sna37S0nhTZb2wv+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789561; c=relaxed/simple;
	bh=eYpl3VPRVVHFrLllpso+ngxALAeAFPyLumFsOQDdL6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRtFyBFNTehkp/6m4R3q+tj5nw6sNOZEgxYIjX/KFmA/s1g5fbDH1f0eU33E5hIgI9vzOafEF5H7MDOhEIVjiXr2apc5J6RI3tvxdwxioQhYdHKaPuEp9+ci6BC7SZ3WiDwI/rh3q3yTkfksxQ/NXVZ2uoGHJJ+5pa6+O0YmGe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lc7PXKy0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E289518B9;
	Sun, 10 Aug 2025 03:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789507;
	bh=eYpl3VPRVVHFrLllpso+ngxALAeAFPyLumFsOQDdL6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lc7PXKy0O7NvPwP8QdnOkBbNND9InbGjlF3AdfnlFsSI+eekk9HgAU0bzp1A5N7In
	 67wo8LIkFZXZp8g7QD5KXcC1ISk+Gczk8yS05JLnZwEPGSEORblmKYDYr0wslB9I/N
	 9v5HmQM75A0i1QYD0pMQs2O2Qpw+WiEMi9UHtxUk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 46/76] media: imx-jpeg: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:28 +0300
Message-ID: <20250810013100.29776-47-laurent.pinchart+renesas@ideasonboard.com>
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
Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
Co-developed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Update file-to-ctx macro due to removal of fh-to-ctx macro
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 35 ++++++++-----------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index a34e644b2cb1..df3ccdf767ba 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -644,14 +644,9 @@ static void print_mxc_buf(struct mxc_jpeg_dev *jpeg, struct vb2_buffer *buf,
 	}
 }
 
-static inline struct mxc_jpeg_ctx *mxc_jpeg_fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mxc_jpeg_ctx, fh);
-}
-
 static inline struct mxc_jpeg_ctx *mxc_jpeg_file_to_ctx(struct file *filp)
 {
-	return mxc_jpeg_fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mxc_jpeg_ctx, fh);
 }
 
 static int enum_fmt(const struct mxc_jpeg_fmt *mxc_formats, int n,
@@ -1610,7 +1605,7 @@ static int mxc_jpeg_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	unsigned long flags;
 	int ret;
 
@@ -1643,7 +1638,7 @@ static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
 				struct v4l2_encoder_cmd *cmd)
 {
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	unsigned long flags;
 	int ret;
 
@@ -2260,7 +2255,7 @@ static int mxc_jpeg_querycap(struct file *file, void *priv,
 static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_q_data *q_data = mxc_jpeg_get_q_data(ctx, f->type);
 
 	if (ctx->mxc_jpeg->mode == MXC_JPEG_ENCODE) {
@@ -2300,7 +2295,7 @@ static int mxc_jpeg_enum_fmt_vid_cap(struct file *file, void *priv,
 static int mxc_jpeg_enum_fmt_vid_out(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	u32 type = ctx->mxc_jpeg->mode == MXC_JPEG_DECODE ?  MXC_JPEG_FMT_TYPE_ENC :
 							     MXC_JPEG_FMT_TYPE_RAW;
 	int ret;
@@ -2441,7 +2436,7 @@ static int mxc_jpeg_try_fmt(struct v4l2_format *f,
 static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 	struct device *dev = jpeg->dev;
 	struct mxc_jpeg_q_data tmp_q;
@@ -2460,7 +2455,7 @@ static int mxc_jpeg_try_fmt_vid_cap(struct file *file, void *priv,
 static int mxc_jpeg_try_fmt_vid_out(struct file *file, void *priv,
 				    struct v4l2_format *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 	struct device *dev = jpeg->dev;
 	struct mxc_jpeg_q_data tmp_q;
@@ -2512,20 +2507,20 @@ static int mxc_jpeg_s_fmt(struct mxc_jpeg_ctx *ctx,
 static int mxc_jpeg_s_fmt_vid_cap(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
-	return mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
+	return mxc_jpeg_s_fmt(mxc_jpeg_file_to_ctx(file), f);
 }
 
 static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 				  struct v4l2_format *f)
 {
 	int ret;
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct vb2_queue *dst_vq;
 	struct mxc_jpeg_q_data *q_data_cap;
 	enum v4l2_buf_type cap_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	struct v4l2_format fc;
 
-	ret = mxc_jpeg_s_fmt(mxc_jpeg_fh_to_ctx(priv), f);
+	ret = mxc_jpeg_s_fmt(ctx, f);
 	if (ret)
 		return ret;
 
@@ -2554,7 +2549,7 @@ static int mxc_jpeg_s_fmt_vid_out(struct file *file, void *priv,
 static int mxc_jpeg_g_fmt_vid(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(priv);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_dev *jpeg = ctx->mxc_jpeg;
 	struct device *dev = jpeg->dev;
 	struct v4l2_pix_format_mplane   *pix_mp = &f->fmt.pix_mp;
@@ -2592,7 +2587,7 @@ static int mxc_jpeg_g_fmt_vid(struct file *file, void *priv,
 
 static int mxc_jpeg_dec_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_q_data *q_data_cap;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE && s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
@@ -2621,7 +2616,7 @@ static int mxc_jpeg_dec_g_selection(struct file *file, void *fh, struct v4l2_sel
 
 static int mxc_jpeg_enc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_q_data *q_data_out;
 
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT && s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -2649,7 +2644,7 @@ static int mxc_jpeg_enc_g_selection(struct file *file, void *fh, struct v4l2_sel
 
 static int mxc_jpeg_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 
 	if (ctx->mxc_jpeg->mode == MXC_JPEG_DECODE)
 		return mxc_jpeg_dec_g_selection(file, fh, s);
@@ -2659,7 +2654,7 @@ static int mxc_jpeg_g_selection(struct file *file, void *fh, struct v4l2_selecti
 
 static int mxc_jpeg_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 {
-	struct mxc_jpeg_ctx *ctx = mxc_jpeg_fh_to_ctx(fh);
+	struct mxc_jpeg_ctx *ctx = mxc_jpeg_file_to_ctx(file);
 	struct mxc_jpeg_q_data *q_data_out;
 
 	if (ctx->mxc_jpeg->mode != MXC_JPEG_ENCODE)
-- 
Regards,

Laurent Pinchart


