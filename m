Return-Path: <linux-media+bounces-39315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C74D2B1F7CC
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAA1717C80C
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCC51F4180;
	Sun, 10 Aug 2025 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OkORkKoo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFEC19E826
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789554; cv=none; b=Z4jI1f/jk5qhRULLiiFxyYlgMmysPT9wjiuXEsJpesx99effdf4RcgGh7aU33Rs3Dp1HPAHHHMA6MoyRncoKfVaU9wmbtgmRUEIj8SMxKAXA3vbd5Qe3rAb/Vfmf1bg9F0skTJFbaCeb8ntQmG4A0Zo6g7ttndn+jN/T9QmEMzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789554; c=relaxed/simple;
	bh=8ZW/fYRbVNxKNkH0puQ2nI/GJaAdMYvb4mxwpUrIp1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUPQCoPYDuQ2u2WkjxGHvad6h/o1gsh4r+OoKZJbSOqLqFnmTr9WUUSavr91P0rwFiZ8LLhcCvzNjsWJ6+tOPs/OjBupRUlT5dOvPNSeOXwc9UA29UQqt+gFJXMvvsfU/QggxA4GK018P5yYOTDYLjvHoQNTUHnEXcH1BBRxSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OkORkKoo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5EDE019C6;
	Sun, 10 Aug 2025 03:31:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789500;
	bh=8ZW/fYRbVNxKNkH0puQ2nI/GJaAdMYvb4mxwpUrIp1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OkORkKooUOhwVeXvPPkglqJSS5uIR+TnINksNSnOlz221HSo0vaWKFKX4uc0kRcQF
	 8vayPHPScIa/uv+0laUgxb3FOuV+YENrllpoQNJMzCCLoX2onyIwZuub4ID8DJ5Lea
	 DBDkWpzJR/r8EP7uO61am7Kg+9BWXw+Ylw76xs+Y=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 42/76] media: mtk_mdp_m2m: Access v4l2_fh from file
Date: Sun, 10 Aug 2025 04:30:24 +0300
Message-ID: <20250810013100.29776-43-laurent.pinchart+renesas@ideasonboard.com>
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
 .../media/platform/mediatek/mdp/mtk_mdp_m2m.c | 23 ++++++++-----------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 7e89a8443707..03c07948dfdd 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -348,14 +348,9 @@ static int mtk_mdp_try_crop(struct mtk_mdp_ctx *ctx, u32 type,
 	return 0;
 }
 
-static inline struct mtk_mdp_ctx *fh_to_ctx(struct v4l2_fh *fh)
-{
-	return container_of(fh, struct mtk_mdp_ctx, fh);
-}
-
 static inline struct mtk_mdp_ctx *file_to_ctx(struct file *filp)
 {
-	return fh_to_ctx(file_to_v4l2_fh(filp));
+	return container_of(file_to_v4l2_fh(filp), struct mtk_mdp_ctx, fh);
 }
 
 static inline struct mtk_mdp_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
@@ -594,7 +589,7 @@ static const struct vb2_ops mtk_mdp_m2m_qops = {
 static int mtk_mdp_m2m_querycap(struct file *file, void *fh,
 				struct v4l2_capability *cap)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_dev *mdp = ctx->mdp_dev;
 
 	strscpy(cap->driver, MTK_MDP_MODULE_NAME, sizeof(cap->driver));
@@ -632,7 +627,7 @@ static int mtk_mdp_m2m_enum_fmt_vid_out(struct file *file, void *priv,
 static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 				    struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
 	int i;
@@ -671,7 +666,7 @@ static int mtk_mdp_m2m_g_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 				      struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 
 	if (!mtk_mdp_try_fmt_mplane(ctx, f))
 		return -EINVAL;
@@ -681,7 +676,7 @@ static int mtk_mdp_m2m_try_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 				    struct v4l2_format *f)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct vb2_queue *vq;
 	struct mtk_mdp_frame *frame;
 	struct v4l2_pix_format_mplane *pix_mp;
@@ -727,7 +722,7 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 			       struct v4l2_requestbuffers *reqbufs)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 
 	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
 }
@@ -735,7 +730,7 @@ static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_VPU_INIT)) {
@@ -773,8 +768,8 @@ static inline bool mtk_mdp_is_target_crop(u32 target)
 static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
 				       struct v4l2_selection *s)
 {
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
 	bool valid = false;
 
 	if (s->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
@@ -840,8 +835,8 @@ static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
 static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 				   struct v4l2_selection *s)
 {
+	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
-	struct mtk_mdp_ctx *ctx = fh_to_ctx(fh);
 	struct v4l2_rect new_r;
 	struct mtk_mdp_variant *variant = ctx->mdp_dev->variant;
 	int ret;
-- 
Regards,

Laurent Pinchart


