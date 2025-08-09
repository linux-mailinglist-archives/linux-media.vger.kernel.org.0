Return-Path: <linux-media+bounces-39240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84894B1F6A2
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687AB18888C1
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919D22C3244;
	Sat,  9 Aug 2025 21:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bQikie47"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0F2C2AA5;
	Sat,  9 Aug 2025 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774318; cv=none; b=X6atv6Eq/HiUEs70uAmGdxOHTenv5nAmOwzGiRp5Tgtg70uRRTCotC/yLpD9VqZSAiRa6xRNDRNLoXTwhx1px1M1rwrJLfVZGkwxWBPG/vg29i0jdRckk1lQjTruGxb5ECy07jzDkefzCgT0xjMGAJLqCiraWzYOWbj7Ge9wUKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774318; c=relaxed/simple;
	bh=1vT99Hy1o9+SjMX3wyA9kizBHdqfzTNdaopZLy4caKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHUI4ir5aHG0VavNLeNzoy0QR9gFEOv5C4ZZsoPObJnUzrVc47aLlxRU3fz/ojXCqS4znQaiI7te10kmA5h9049+u+/9v8/hT2w9G79xqUeVaYQ/CPwhlaN6kydlqXVHxAFq8zKtPcWjorXSqKP/ZV4x/0tl9886X9zpIczO9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bQikie47; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 02FDF502;
	Sat,  9 Aug 2025 23:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774256;
	bh=1vT99Hy1o9+SjMX3wyA9kizBHdqfzTNdaopZLy4caKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bQikie47qB9LAEFIhf3CndEsLL+aCd4E8jF/RzcF0HPK6EGVsU3ZcqpmD3c1J+Vzy
	 QXObYcC91J8l8jvxuzgI1E9jt8avNCozGrAhBi/o1NcU3j9eMXN06RR3QWAnhsaiTx
	 PKMF8kYBVljB7mv0miQz8kwt0+kS9dnAahChPdgo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 45/76] media: tegra-vde: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 00:16:22 +0300
Message-ID: <20250809211654.28887-46-laurent.pinchart@ideasonboard.com>
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
 .../media/platform/nvidia/tegra-vde/v4l2.c    | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index 0c50f4ff82e0..d94978ae2baf 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -46,9 +46,9 @@ static const struct v4l2_ctrl_config ctrl_cfgs[] = {
 	},
 };
 
-static inline struct tegra_ctx *fh_to_tegra_ctx(struct v4l2_fh *fh)
+static inline struct tegra_ctx *file_to_tegra_ctx(struct file *file)
 {
-	return container_of(fh, struct tegra_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct tegra_ctx, fh);
 }
 
 static void tegra_set_control_data(struct tegra_ctx *ctx, void *data, u32 id)
@@ -506,7 +506,7 @@ static int tegra_querycap(struct file *file, void *priv,
 static int tegra_enum_decoded_fmt(struct file *file, void *priv,
 				  struct v4l2_fmtdesc *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 
 	if (WARN_ON(!ctx->coded_fmt_desc))
 		return -EINVAL;
@@ -522,7 +522,7 @@ static int tegra_enum_decoded_fmt(struct file *file, void *priv,
 static int tegra_g_decoded_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 
 	*f = ctx->decoded_fmt;
 	return 0;
@@ -531,8 +531,8 @@ static int tegra_g_decoded_fmt(struct file *file, void *priv,
 static int tegra_try_decoded_fmt(struct file *file, void *priv,
 				 struct v4l2_format *f)
 {
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
 	const struct tegra_coded_fmt_desc *coded_desc;
 	unsigned int i;
 
@@ -571,7 +571,7 @@ static int tegra_try_decoded_fmt(struct file *file, void *priv,
 static int tegra_s_decoded_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	struct vb2_queue *vq;
 	int err;
 
@@ -593,7 +593,7 @@ static int tegra_s_decoded_fmt(struct file *file, void *priv,
 static int tegra_enum_coded_fmt(struct file *file, void *priv,
 				struct v4l2_fmtdesc *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	const struct tegra_vde_soc *soc = ctx->vde->soc;
 
 	if (f->index >= soc->num_coded_fmts)
@@ -607,7 +607,7 @@ static int tegra_enum_coded_fmt(struct file *file, void *priv,
 static int tegra_g_coded_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 
 	*f = ctx->coded_fmt;
 	return 0;
@@ -631,7 +631,7 @@ static int tegra_try_coded_fmt(struct file *file, void *priv,
 			       struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	const struct tegra_vde_soc *soc = ctx->vde->soc;
 	int size = pix_mp->plane_fmt[0].sizeimage;
 	const struct tegra_coded_fmt_desc *desc;
@@ -656,7 +656,7 @@ static int tegra_try_coded_fmt(struct file *file, void *priv,
 static int tegra_s_coded_fmt(struct file *file, void *priv,
 			     struct v4l2_format *f)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	const struct tegra_coded_fmt_desc *desc;
 	struct vb2_queue *peer_vq, *vq;
@@ -718,7 +718,7 @@ static int tegra_s_coded_fmt(struct file *file, void *priv,
 static int tegra_enum_framesizes(struct file *file, void *priv,
 				 struct v4l2_frmsizeenum *fsize)
 {
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(priv);
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	const struct tegra_coded_fmt_desc *fmt;
 
 	if (fsize->index)
@@ -852,8 +852,8 @@ static int tegra_open(struct file *file)
 
 static int tegra_release(struct file *file)
 {
+	struct tegra_ctx *ctx = file_to_tegra_ctx(file);
 	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct tegra_ctx *ctx = fh_to_tegra_ctx(fh);
 	struct tegra_vde *vde = ctx->vde;
 
 	v4l2_fh_del(fh, file);
-- 
Regards,

Laurent Pinchart


