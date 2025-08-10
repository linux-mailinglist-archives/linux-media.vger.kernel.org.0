Return-Path: <linux-media+bounces-39317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B69B1F7CF
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2AF189E34F
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857641F4606;
	Sun, 10 Aug 2025 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UfWZA/Wq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA1D158520;
	Sun, 10 Aug 2025 01:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789559; cv=none; b=BxFaSWWhS2HqsqVQ96jp94WTxzlCMqd/jlKRmEm8CPkMUD32Ajmku0jby/xgiKN9dOBITZNtapjI1dhALxtYgTiI85V+RhmGGwJubQY6HrQtWwBNEexqIfdmuJ3NASI1ZnrrKV2EBrw8uX+3xCgtDrXC0mikWl3FvuE2a5sNqTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789559; c=relaxed/simple;
	bh=1vT99Hy1o9+SjMX3wyA9kizBHdqfzTNdaopZLy4caKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3f7cS1mHgqUqCpxX3qAQ/4L5iaovZ1+OAfgU2Pxf/ML9Cg7MGfh8yq1LOMXQKxbKuVcc9qRLSuFWuNW86x4MFYmrFOx2g4g+DTtnnZWT/dIQ6t7mu3WHKrIEXs/wDYvsHb6Att6FacIf/tV7t0f9FOChf0tMzilvXeqASZdFmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UfWZA/Wq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 532D119C6;
	Sun, 10 Aug 2025 03:31:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789505;
	bh=1vT99Hy1o9+SjMX3wyA9kizBHdqfzTNdaopZLy4caKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UfWZA/Wq+qaWBe5NsfSnXx8l8vIMkBvTn8wjvjE1BoyxQVzQJ5l8kjBA4XOfXzU3r
	 ktDS9vNQ+nFGCksGjCYrjqnqWmVW8OBq2CVlulTxSSq+oLmZk9RuhP6oVtLKKl4T3C
	 KSOckPth8+numwuY5oY20W/NRjGNVCXLyjx6uhYA=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 45/76] media: tegra-vde: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:27 +0300
Message-ID: <20250810013100.29776-46-laurent.pinchart+renesas@ideasonboard.com>
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


