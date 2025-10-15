Return-Path: <linux-media+bounces-44529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3643BDD39C
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 09:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DC4B3B7CBD
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 07:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF8F314D35;
	Wed, 15 Oct 2025 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iEMWdVgH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3BD2BDC23
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 07:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760514862; cv=none; b=MQp1Y2mhoi9DVAJkff6hw9tCLX65BP/iiC3MApHl75UpgX7qNZqKBX9RNkYBGptWnKUWUf7jYEUVxN0rVvg4VPh2Z1BhlUtu0w/MnGAqrn21v9Le4UpJKnX9TRHfTwrCqXMb1D3UJKfTmcRr9u1B6d/LDGYVENtm2msHORi/tNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760514862; c=relaxed/simple;
	bh=R5HOgozqJoHFs+15LqFltUnY9B75cS3L+R4SpplU7WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4VClEJrDUk9hHJrDFr08yVhX4WAn7H/ZqwjlBR/nrss7GRaq02mM7/EnBUK67YTnz3DYFHn3O8x30qDD0w3wO7IEC6x92LyVqF6mS1M+YDmwEUHAZfgvfqZXzONfQiNI4NF3QD8f9E3SB65Er6pmUyn+StdR7goWkAl0WPoLks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iEMWdVgH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 94093162B;
	Wed, 15 Oct 2025 09:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760514759;
	bh=R5HOgozqJoHFs+15LqFltUnY9B75cS3L+R4SpplU7WI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEMWdVgHen4l3vZ7/248hwYc24ni4PWQ1bSDhTVNllVtT9oouIrkKyK1Ioh5g341A
	 BVn0eWk1uu8GCNMw5HGjQCZwf2kFqgbP7N+HRQ8z7I6sxynJfHClVDLWFzgZ1ZunN6
	 teI7e4RmJFUxEfi+tK1/rcSlUtg/lq4impkPTDGE=
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
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [PATCH v2 09/25] media: mediatek: vcodec: Drop unneeded v4l2_m2m_get_vq() NULL check
Date: Wed, 15 Oct 2025 10:53:32 +0300
Message-ID: <20251015075353.22625-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_m2m_get_vq() function never returns NULL.

In the set format handlers, the check may have been intended to catch
invalid format types, but that's not needed as the V4L2 core picks the
appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
type can't be incorrect.

In the get format handlers, the return value is not used for any purpose
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
Changes since v1:

- Address vidioc_venc_g_fmt()
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  7 -------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      |  2 --
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c      |  2 --
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c       | 14 --------------
 4 files changed, 25 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d691bd533103..1f32ba11a18c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -674,15 +674,8 @@ static int vidioc_vdec_g_fmt(struct file *file, void *priv,
 {
 	struct mtk_vcodec_dec_ctx *ctx = file_to_dec_ctx(file);
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
index d815e962ab89..6faf3f659e75 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
@@ -421,10 +421,6 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
 	const struct mtk_video_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_venc_err(ctx, "fail to get vq");
-		return -EINVAL;
-	}
 
 	if (vb2_is_busy(vq)) {
 		mtk_v4l2_venc_err(ctx, "queue busy");
@@ -476,10 +472,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	const struct mtk_video_fmt *fmt;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq) {
-		mtk_v4l2_venc_err(ctx, "fail to get vq");
-		return -EINVAL;
-	}
 
 	if (vb2_is_busy(vq)) {
 		mtk_v4l2_venc_err(ctx, "queue busy");
@@ -524,15 +516,9 @@ static int vidioc_venc_g_fmt(struct file *file, void *priv,
 {
 	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	struct mtk_vcodec_enc_ctx *ctx = file_to_enc_ctx(file);
-	struct vb2_queue *vq;
 	struct mtk_q_data *q_data = mtk_venc_get_q_data(ctx, f->type);
 	int i;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (!vq)
-		return -EINVAL;
-
-
 	pix->width = q_data->coded_width;
 	pix->height = q_data->coded_height;
 	pix->pixelformat = q_data->fmt->fourcc;
-- 
Regards,

Laurent Pinchart


