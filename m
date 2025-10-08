Return-Path: <linux-media+bounces-43991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8CBC6338
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 19:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC22F400BBD
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 17:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625EC2C0F7B;
	Wed,  8 Oct 2025 17:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lXeLJML8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164DA2C028D
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759945880; cv=none; b=pbJdbvSIYUVDOYz2yGLrDOXP3Nwmg6UMUVeUvhpCUrKyYVs9JzK5xQx4RhcIts2aRkkrfKLh9RUARngp/nB8A/Z9hrYFlBzMYZTDjHKQEBYn0n9TiIQie43Ao6+BynfL7XHxgrlB85+yLeuSmjgaEikTQq0qJXXOmRt/JBzJna4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759945880; c=relaxed/simple;
	bh=WMeeQtK3YO+AKh44/py72TXav7h/l0dcqATYTLzyBjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eamxBg2uObD9g7rciXKIDXkYrZHa/3weTFgy5Epf21ICFugeVaK+baBJScV3C3/QYEcOPt9+eD2PbJ2jXPD28+1TYh+TNpV47mtoe8LEEKIRtff+YqUJtX/7xnnHVnMPPEz387L1Kkf4VM5ZeW+c0u9SgXGEWvnQEY8rcmWxx6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lXeLJML8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DB05AEFE;
	Wed,  8 Oct 2025 19:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759945781;
	bh=WMeeQtK3YO+AKh44/py72TXav7h/l0dcqATYTLzyBjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lXeLJML8XFLBTETv6GS7ukLCV4jzZRzEql/bGaUb9tGRZvpHVzZ22qOt+f8BC0wKv
	 Y1OliAtWTjReI/6eVoWuWn1/bxL0nvFQAAQ7xKvIjL6yyuqW7zXxP0ZbLTIjqNfCix
	 bJDJdgSgzFZjbMqcZ+x8DfDu/BzuovhCrNqSTKDM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 09/25] media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed,  8 Oct 2025 20:50:36 +0300
Message-ID: <20251008175052.19925-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_get_vq() function never returns NULL.

In the set format handler, the check may have been intended to catch
invalid format types, but that's not needed as the V4L2 core picks the
appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
type can't be incorrect.

In the get format handler, the return value is not used for any purpose
other than the NULL check, which was therefore probably intended to
catch invalid format types. That's not needed for the same reason as in
the set format handler.

In other locations the v4l2_m2m_get_vq() function is called with a
hardcoded V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE type, so the NULL check
can't have been an attempt to catch an invalid type there either.

Drop the unneeded return value checks and, as the function has no side
effect, the unneeded function call as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c     | 7 -------
 .../mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c    | 2 --
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c    | 2 --
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c     | 8 --------
 4 files changed, 19 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 98838217b97d..a07f878b7c82 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -674,15 +674,8 @@ static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 {
 	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
-	struct vb2_queue *vq;
 	struct mtk_q_data *q_data;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_vdec_err(ctx, "no vb2 queue for type=%d", f->type);
-		return -EINVAL;
-	}
-
 	q_data = mtk_vdec_get_q_data(ctx, f->type);
 
 	pix_mp->field = V4L2_FIELD_NONE;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index bf21f2467a0f..08e0f5a70935 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1810,8 +1810,6 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
 
 	/* reference buffers */
 	vq = v4l2_m2m_get_vq(instance->ctx->m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (!vq)
-		return -EINVAL;
 
 	/* get current output buffer */
 	vb = &v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx)->vb2_buf;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 47c302745c1d..45cd555a5fb5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1686,8 +1686,6 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 	/* reference buffers */
 	vq = v4l2_m2m_get_vq(instance->ctx->m2m_ctx,
 			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
-	if (!vq)
-		return -EINVAL;
 
 	/* get current output buffer */
 	vb = &v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx)->vb2_buf;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
index a01dc25a7699..f7222c617839 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -422,10 +422,6 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	const struct mtk_video_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_venc_err(ctx, "fail to get vq");
-		return -EINVAL;
-	}
 
 	if (vb2_is_busy(vq)) {
 		mtk_v4l2_venc_err(ctx, "queue busy");
@@ -477,10 +473,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	const struct mtk_video_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_venc_err(ctx, "fail to get vq");
-		return -EINVAL;
-	}
 
 	if (vb2_is_busy(vq)) {
 		mtk_v4l2_venc_err(ctx, "queue busy");
-- 
Regards,

Laurent Pinchart


