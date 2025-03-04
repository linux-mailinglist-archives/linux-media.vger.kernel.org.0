Return-Path: <linux-media+bounces-27468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7FA4DC23
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 12:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 184941891E3E
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD4920371B;
	Tue,  4 Mar 2025 11:11:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35C20370B
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741086693; cv=none; b=SodidQ+XUhujHxJx9qWupU1Lpyu4pFLXOuNKtXrUCrCd+PDCUwTzq1MhcMPJoqFITec+upMkx1z/Wx8CeASeA3/VQqiKpQxR8Xku5PnMLYYO1LP0BZRZ/m/lBtwr/XSZ/E/WynyjbK4pVMEV0xrAgapkMrUmmwhDgDj49P8MPqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741086693; c=relaxed/simple;
	bh=tedXg8qK3yuswSTSRUmp/0LWMNh0UL+cJovwIVR60Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQp5ly7qldNkkzmnCQjGEDQgUPGOb0JOswMGPesV/yW4K4KdSGrwlnXu+AI68goDajFzlOEHAKIQlFVNNGdhvi4TFIWpBWhXiYs8wd6dP4X2aQqkljreWlIDWj6oySnwlqLlUtGngco7lz3hMYu/owbK0jUa3Jt4yb0GF2yI+RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB7AC4CEE5;
	Tue,  4 Mar 2025 11:11:31 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 8/8] media: platform: use (t,l)/wxh format for rectangle
Date: Tue,  4 Mar 2025 12:08:14 +0100
Message-ID: <16494f15d337e99bbca1f566cd8b01424cc9e3ac.1741086494.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1741086494.git.hverkuil@xs4all.nl>
References: <cover.1741086494.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize reporting of rectangles to (t,l)/wxh.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  |  2 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-regs.c   |  4 ++--
 drivers/media/platform/nxp/dw100/dw100.c           |  8 ++++----
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |  8 ++++----
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |  2 +-
 .../platform/rockchip/rkisp1/rkisp1-resizer.c      |  2 +-
 .../platform/samsung/exynos4-is/fimc-capture.c     |  6 +++---
 .../media/platform/samsung/exynos4-is/fimc-lite.c  |  8 ++++----
 .../platform/samsung/s3c-camif/camif-capture.c     | 12 ++++++------
 drivers/media/platform/st/sti/bdisp/bdisp-debug.c  |  8 ++++----
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c   | 14 +++++++-------
 drivers/media/platform/st/sti/delta/delta-debug.c  |  8 ++++----
 drivers/media/platform/st/stm32/stm32-dcmi.c       | 10 +++++-----
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        | 10 +++++-----
 drivers/media/platform/ti/am437x/am437x-vpfe.c     |  2 +-
 15 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 28c998bd3a81..d0fd77dcf8e2 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -342,7 +342,7 @@ static int mtk_mdp_try_crop(struct mtk_mdp_ctx *ctx, u32 type,
 	if (r->left & 1)
 		r->left -= 1;
 
-	mtk_mdp_dbg(2, "[%d] crop l,t,w,h:%d,%d,%d,%d, max:%dx%d", ctx->id,
+	mtk_mdp_dbg(2, "[%d] crop (%d,%d)/%ux%u, max:%dx%d", ctx->id,
 		    r->left, r->top, r->width,
 		    r->height, max_w, max_h);
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
index 657356f87743..644b223b2877 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.c
@@ -236,7 +236,7 @@ int mdp_try_crop(struct mdp_m2m_ctx *ctx, struct v4l2_rect *r,
 	u32 framew, frameh, walign, halign;
 	int ret;
 
-	dev_dbg(dev, "%d target:%d, set:(%d,%d) %ux%u", ctx->id,
+	dev_dbg(dev, "%d target:%d, set:(%d,%d)/%ux%u", ctx->id,
 		s->target, s->r.left, s->r.top, s->r.width, s->r.height);
 
 	left = s->r.left;
@@ -275,7 +275,7 @@ int mdp_try_crop(struct mdp_m2m_ctx *ctx, struct v4l2_rect *r,
 	r->width = right - left;
 	r->height = bottom - top;
 
-	dev_dbg(dev, "%d crop:(%d,%d) %ux%u", ctx->id,
+	dev_dbg(dev, "%d crop:(%d,%d)/%ux%u", ctx->id,
 		r->left, r->top, r->width, r->height);
 	return 0;
 }
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 66582e7f92fc..3d1db1121bf9 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -961,9 +961,9 @@ static int dw100_s_selection(struct file *file, void *fh,
 	src_q_data = dw100_get_q_data(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 
 	dev_dbg(&ctx->dw_dev->pdev->dev,
-		">>> Buffer Type: %u Target: %u Rect: %ux%u@%d.%d\n",
+		">>> Buffer Type: %u Target: %u Rect: (%d,%d)/%ux%u\n",
 		sel->type, sel->target,
-		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
+		sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
@@ -1025,9 +1025,9 @@ static int dw100_s_selection(struct file *file, void *fh,
 	}
 
 	dev_dbg(&ctx->dw_dev->pdev->dev,
-		"<<< Buffer Type: %u Target: %u Rect: %ux%u@%d.%d\n",
+		"<<< Buffer Type: %u Target: %u Rect: (%d,%d)/%ux%u\n",
 		sel->type, sel->target,
-		sel->r.width, sel->r.height, sel->r.left, sel->r.top);
+		sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
 	return 0;
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 756fdfdbce61..0683c7d23468 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -591,8 +591,8 @@ static int rvin_s_selection(struct file *file, void *fh,
 
 		vin->crop = s->r = r;
 
-		vin_dbg(vin, "Cropped %dx%d@%d:%d of %dx%d\n",
-			r.width, r.height, r.left, r.top,
+		vin_dbg(vin, "Cropped (%d,%d)/%ux%u of %dx%d\n",
+			r.left, r.top, r.width, r.height,
 			max_rect.width, max_rect.height);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
@@ -616,8 +616,8 @@ static int rvin_s_selection(struct file *file, void *fh,
 
 		vin->compose = s->r = r;
 
-		vin_dbg(vin, "Compose %dx%d@%d:%d in %dx%d\n",
-			r.width, r.height, r.left, r.top,
+		vin_dbg(vin, "Compose (%d,%d)/%ux%u in %dx%d\n",
+			r.left, r.top, r.width, r.height,
 			vin->format.width, vin->format.height);
 		break;
 	default:
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index d94917211828..8c29a1c9309a 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -881,7 +881,7 @@ static int rkisp1_isp_set_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	dev_dbg(isp->rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
+	dev_dbg(isp->rkisp1->dev, "%s: pad: %d sel(%d,%d)/%ux%u\n", __func__,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
 	if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index f073e72a0d37..8e6b753d3081 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -600,7 +600,7 @@ static int rkisp1_rsz_set_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP || sel->pad == RKISP1_RSZ_PAD_SRC)
 		return -EINVAL;
 
-	dev_dbg(rsz->rkisp1->dev, "%s: pad: %d sel(%d,%d)/%dx%d\n", __func__,
+	dev_dbg(rsz->rkisp1->dev, "%s: pad: %d sel(%d,%d)/%ux%u\n", __func__,
 		sel->pad, sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
 	rkisp1_rsz_set_sink_crop(rsz, sd_state, &sel->r);
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index c3c2e474a18a..5b412afd7d60 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -700,7 +700,7 @@ static void fimc_capture_try_selection(struct fimc_ctx *ctx,
 	r->top  = clamp_t(u32, r->top, 0, sink->f_height - r->height);
 	r->left = round_down(r->left, var->hor_offs_align);
 
-	dbg("target %#x: (%d,%d)/%dx%d, sink fmt: %dx%d",
+	dbg("target %#x: (%d,%d)/%ux%u, sink fmt: %dx%d",
 	    target, r->left, r->top, r->width, r->height,
 	    sink->f_width, sink->f_height);
 }
@@ -1622,7 +1622,7 @@ static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
 		r->height = f->height;
 	}
 
-	dbg("target %#x: l:%d, t:%d, %dx%d, f_w: %d, f_h: %d",
+	dbg("target %#x: (%d,%d)/%ux%u, f_w: %d, f_h: %d",
 	    sel->pad, r->left, r->top, r->width, r->height,
 	    f->f_width, f->f_height);
 
@@ -1671,7 +1671,7 @@ static int fimc_subdev_set_selection(struct v4l2_subdev *sd,
 		spin_unlock_irqrestore(&fimc->slock, flags);
 	}
 
-	dbg("target %#x: (%d,%d)/%dx%d", sel->target, r->left, r->top,
+	dbg("target %#x: (%d,%d)/%ux%u", sel->target, r->left, r->top,
 	    r->width, r->height);
 
 	mutex_unlock(&fimc->lock);
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index f23e51e3da2f..0ce293b0718b 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -611,7 +611,7 @@ static void fimc_lite_try_crop(struct fimc_lite *fimc, struct v4l2_rect *r)
 	r->left = round_down(r->left, fimc->dd->win_hor_offs_align);
 	r->top  = clamp_t(u32, r->top, 0, frame->f_height - r->height);
 
-	v4l2_dbg(1, debug, &fimc->subdev, "(%d,%d)/%dx%d, sink fmt: %dx%d\n",
+	v4l2_dbg(1, debug, &fimc->subdev, "(%d,%d)/%ux%u, sink fmt: %dx%d\n",
 		 r->left, r->top, r->width, r->height,
 		 frame->f_width, frame->f_height);
 }
@@ -631,7 +631,7 @@ static void fimc_lite_try_compose(struct fimc_lite *fimc, struct v4l2_rect *r)
 	r->left = round_down(r->left, fimc->dd->out_hor_offs_align);
 	r->top  = clamp_t(u32, r->top, 0, fimc->out_frame.f_height - r->height);
 
-	v4l2_dbg(1, debug, &fimc->subdev, "(%d,%d)/%dx%d, source fmt: %dx%d\n",
+	v4l2_dbg(1, debug, &fimc->subdev, "(%d,%d)/%ux%u, source fmt: %dx%d\n",
 		 r->left, r->top, r->width, r->height,
 		 frame->f_width, frame->f_height);
 }
@@ -1140,7 +1140,7 @@ static int fimc_lite_subdev_get_selection(struct v4l2_subdev *sd,
 	}
 	mutex_unlock(&fimc->lock);
 
-	v4l2_dbg(1, debug, sd, "%s: (%d,%d) %dx%d, f_w: %d, f_h: %d\n",
+	v4l2_dbg(1, debug, sd, "%s: (%d,%d)/%ux%u, f_w: %d, f_h: %d\n",
 		 __func__, f->rect.left, f->rect.top, f->rect.width,
 		 f->rect.height, f->f_width, f->f_height);
 
@@ -1174,7 +1174,7 @@ static int fimc_lite_subdev_set_selection(struct v4l2_subdev *sd,
 	}
 	mutex_unlock(&fimc->lock);
 
-	v4l2_dbg(1, debug, sd, "%s: (%d,%d) %dx%d, f_w: %d, f_h: %d\n",
+	v4l2_dbg(1, debug, sd, "%s: (%d,%d)/%ux%u, f_w: %d, f_h: %d\n",
 		 __func__, f->rect.left, f->rect.top, f->rect.width,
 		 f->rect.height, f->f_width, f->f_height);
 
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index bd1149e8abc2..3e566b65f417 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -1030,9 +1030,9 @@ static int s3c_camif_s_selection(struct file *file, void *priv,
 	vp->state |= ST_VP_CONFIG;
 	spin_unlock_irqrestore(&camif->slock, flags);
 
-	pr_debug("type: %#x, target: %#x, flags: %#x, (%d,%d)/%dx%d\n",
-		sel->type, sel->target, sel->flags,
-		sel->r.left, sel->r.top, sel->r.width, sel->r.height);
+	pr_debug("type: %#x, target: %#x, flags: %#x, (%d,%d)/%ux%u\n",
+		 sel->type, sel->target, sel->flags,
+		 sel->r.left, sel->r.top, sel->r.width, sel->r.height);
 
 	return 0;
 }
@@ -1372,7 +1372,7 @@ static int s3c_camif_subdev_get_selection(struct v4l2_subdev *sd,
 
 	mutex_unlock(&camif->lock);
 
-	v4l2_dbg(1, debug, sd, "%s: crop: (%d,%d) %dx%d, size: %ux%u\n",
+	v4l2_dbg(1, debug, sd, "%s: crop: (%d,%d)/%ux%u, size: %ux%u\n",
 		 __func__, crop->left, crop->top, crop->width,
 		 crop->height, mf->width, mf->height);
 
@@ -1424,7 +1424,7 @@ static void __camif_try_crop(struct camif_dev *camif, struct v4l2_rect *r)
 		}
 	}
 
-	v4l2_dbg(1, debug, &camif->v4l2_dev, "crop: (%d,%d)/%dx%d, fmt: %ux%u\n",
+	v4l2_dbg(1, debug, &camif->v4l2_dev, "crop: (%d,%d)/%ux%u, fmt: %ux%u\n",
 		 r->left, r->top, r->width, r->height, mf->width, mf->height);
 }
 
@@ -1464,7 +1464,7 @@ static int s3c_camif_subdev_set_selection(struct v4l2_subdev *sd,
 	}
 	mutex_unlock(&camif->lock);
 
-	v4l2_dbg(1, debug, sd, "%s: (%d,%d) %dx%d, f_w: %u, f_h: %u\n",
+	v4l2_dbg(1, debug, sd, "%s: (%d,%d)/%ux%u, f_w: %u, f_h: %u\n",
 		 __func__, crop->left, crop->top, crop->width, crop->height,
 		 camif->mbus_fmt.width, camif->mbus_fmt.height);
 
diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-debug.c b/drivers/media/platform/st/sti/bdisp/bdisp-debug.c
index a27f638df11c..f9348aeacc11 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-debug.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-debug.c
@@ -455,11 +455,11 @@ static int last_request_show(struct seq_file *s, void *data)
 
 	seq_printf(s, "Format:    %s\t\t\t%s\n",
 		   bdisp_fmt_to_str(src), bdisp_fmt_to_str(dst));
-	seq_printf(s, "Crop area: %dx%d @ %d,%d  ==>\t%dx%d @ %d,%d\n",
-		   src.crop.width, src.crop.height,
+	seq_printf(s, "Crop area: (%d,%d)/%ux%u  ==>\t(%d,%d)/%ux%u\n",
 		   src.crop.left, src.crop.top,
-		   dst.crop.width, dst.crop.height,
-		   dst.crop.left, dst.crop.top);
+		   src.crop.width, src.crop.height,
+		   dst.crop.left, dst.crop.top,
+		   dst.crop.width, dst.crop.height);
 	seq_printf(s, "Buff size: %dx%d\t\t%dx%d\n\n",
 		   src.width, src.height, dst.width, dst.height);
 
diff --git a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
index 73ad66ed20f2..1eb934490c0b 100644
--- a/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c
@@ -953,8 +953,8 @@ static int bdisp_s_selection(struct file *file, void *fh,
 	if ((out.left < 0) || (out.left >= frame->width) ||
 	    (out.top < 0) || (out.top >= frame->height)) {
 		dev_err(ctx->bdisp_dev->dev,
-			"Invalid crop: %dx%d@(%d,%d) vs frame: %dx%d\n",
-			out.width, out.height, out.left, out.top,
+			"Invalid crop: (%d,%d)/%ux%u vs frame: %dx%d\n",
+			out.left, out.top, out.width, out.height,
 			frame->width, frame->height);
 		return -EINVAL;
 	}
@@ -966,8 +966,8 @@ static int bdisp_s_selection(struct file *file, void *fh,
 	if (((out.left + out.width) > frame->width) ||
 	    ((out.top + out.height) > frame->height)) {
 		dev_err(ctx->bdisp_dev->dev,
-			"Invalid crop: %dx%d@(%d,%d) vs frame: %dx%d\n",
-			out.width, out.height, out.left, out.top,
+			"Invalid crop: (%d,%d)/%ux%u vs frame: %dx%d\n",
+			out.left, out.top, out.width, out.height,
 			frame->width, frame->height);
 		return -EINVAL;
 	}
@@ -982,9 +982,9 @@ static int bdisp_s_selection(struct file *file, void *fh,
 	if ((out.left != in->left) || (out.top != in->top) ||
 	    (out.width != in->width) || (out.height != in->height)) {
 		dev_dbg(ctx->bdisp_dev->dev,
-			"%s crop updated: %dx%d@(%d,%d) -> %dx%d@(%d,%d)\n",
-			__func__, in->width, in->height, in->left, in->top,
-			out.width, out.height, out.left, out.top);
+			"%s crop updated: (%d,%d)/%ux%u -> (%d,%d)/%ux%u\n",
+			__func__, in->left, in->top, in->width, in->height,
+			out.left, out.top, out.width, out.height);
 		*in = out;
 	}
 
diff --git a/drivers/media/platform/st/sti/delta/delta-debug.c b/drivers/media/platform/st/sti/delta/delta-debug.c
index 4b2eb6b63aa2..6acf46913cda 100644
--- a/drivers/media/platform/st/sti/delta/delta-debug.c
+++ b/drivers/media/platform/st/sti/delta/delta-debug.c
@@ -16,14 +16,14 @@ char *delta_streaminfo_str(struct delta_streaminfo *s, char *str,
 		return NULL;
 
 	snprintf(str, len,
-		 "%4.4s %dx%d %s %s dpb=%d %s %s %s%dx%d@(%d,%d) %s%d/%d",
+		 "%4.4s %dx%d %s %s dpb=%d %s %s %s(%d,%d)/%ux%u %s%d/%d",
 		 (char *)&s->streamformat, s->width, s->height,
 		 s->profile, s->level, s->dpb,
 		 (s->field == V4L2_FIELD_NONE) ? "progressive" : "interlaced",
 		 s->other,
 		 s->flags & DELTA_STREAMINFO_FLAG_CROP ? "crop=" : "",
-		 s->crop.width, s->crop.height,
 		 s->crop.left, s->crop.top,
+		 s->crop.width, s->crop.height,
 		 s->flags & DELTA_STREAMINFO_FLAG_PIXELASPECT ? "par=" : "",
 		 s->pixelaspect.numerator,
 		 s->pixelaspect.denominator);
@@ -38,13 +38,13 @@ char *delta_frameinfo_str(struct delta_frameinfo *f, char *str,
 		return NULL;
 
 	snprintf(str, len,
-		 "%4.4s %dx%d aligned %dx%d %s %s%dx%d@(%d,%d) %s%d/%d",
+		 "%4.4s %dx%d aligned %dx%d %s %s(%d,%d)/%ux%u %s%d/%d",
 		 (char *)&f->pixelformat, f->width, f->height,
 		 f->aligned_width, f->aligned_height,
 		 (f->field == V4L2_FIELD_NONE) ? "progressive" : "interlaced",
 		 f->flags & DELTA_STREAMINFO_FLAG_CROP ? "crop=" : "",
-		 f->crop.width, f->crop.height,
 		 f->crop.left, f->crop.top,
+		 f->crop.width, f->crop.height,
 		 f->flags & DELTA_STREAMINFO_FLAG_PIXELASPECT ? "par=" : "",
 		 f->pixelaspect.numerator,
 		 f->pixelaspect.denominator);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 9b699ee2b1e0..20fbe485ed7d 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -388,9 +388,9 @@ static void dcmi_set_crop(struct stm32_dcmi *dcmi)
 		 ((dcmi->crop.left << 1));
 	reg_write(dcmi->regs, DCMI_CWSTRT, start);
 
-	dev_dbg(dcmi->dev, "Cropping to %ux%u@%u:%u\n",
-		dcmi->crop.width, dcmi->crop.height,
-		dcmi->crop.left, dcmi->crop.top);
+	dev_dbg(dcmi->dev, "Cropping to (%d,%d)/%ux%u\n",
+		dcmi->crop.left, dcmi->crop.top,
+		dcmi->crop.width, dcmi->crop.height);
 
 	/* Enable crop */
 	reg_set(dcmi->regs, DCMI_CR, CR_CROP);
@@ -1292,8 +1292,8 @@ static int dcmi_s_selection(struct file *file, void *priv,
 		/* Crop if request is different than sensor resolution */
 		dcmi->do_crop = true;
 		dcmi->crop = r;
-		dev_dbg(dcmi->dev, "s_selection: crop %ux%u@(%u,%u) from %ux%u\n",
-			r.width, r.height, r.left, r.top,
+		dev_dbg(dcmi->dev, "s_selection: crop (%d,%d)/%ux%u from %ux%u\n",
+			r.left, r.top, r.width, r.height,
 			pix.width, pix.height);
 	} else {
 		/* Disable crop */
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 3c742a546441..db76a02a1848 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -373,8 +373,8 @@ static int dcmipp_byteproc_set_selection(struct v4l2_subdev *sd,
 		mf->width = s->r.width;
 		mf->height = s->r.height;
 
-		dev_dbg(byteproc->dev, "s_selection: crop %ux%u@(%u,%u)\n",
-			crop->width, crop->height, crop->left, crop->top);
+		dev_dbg(byteproc->dev, "s_selection: crop (%d,%d)/%ux%u\n",
+			crop->left, crop->top, crop->width, crop->height);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
 		mf = v4l2_subdev_state_get_format(sd_state, 0);
@@ -386,9 +386,9 @@ static int dcmipp_byteproc_set_selection(struct v4l2_subdev *sd,
 		mf->width = s->r.width;
 		mf->height = s->r.height;
 
-		dev_dbg(byteproc->dev, "s_selection: compose %ux%u@(%u,%u)\n",
-			compose->width, compose->height,
-			compose->left, compose->top);
+		dev_dbg(byteproc->dev, "s_selection: compose (%d,%d)/%ux%u\n",
+			compose->left, compose->top,
+			compose->width, compose->height);
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 44cdccb89377..1ca559df7e59 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2030,7 +2030,7 @@ vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
 	vpfe->fmt.fmt.pix.sizeimage = vpfe->fmt.fmt.pix.bytesperline *
 						vpfe->fmt.fmt.pix.height;
 
-	vpfe_dbg(1, vpfe, "cropped (%d,%d)/%dx%d of %dx%d\n",
+	vpfe_dbg(1, vpfe, "cropped (%d,%d)/%ux%u of %dx%d\n",
 		 r.left, r.top, r.width, r.height, cr.width, cr.height);
 
 	return 0;
-- 
2.47.2


