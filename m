Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9D62EAE79
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 16:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbhAEPcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 10:32:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38064 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728032AbhAEPcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 10:32:42 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB9AC8D4;
        Tue,  5 Jan 2021 16:29:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609860587;
        bh=QSV2EgsEcI+VUFZdLU6143klIflXIN9hmmEECM0wriQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pvoH85kJfbws6O31dk807SZl6iMF7W9WC5c6802IalKJ9UF8wfZ5FaGDawH5AlntB
         uGoMfQoPeS6tiDIa0F+jKv6yUk76FDnc2NdKNW83TipcYJFZ08j79l4YCtYFOmALaJ
         DxbXTkqmo0IHo7ZOS8JOrlWyaP40UUNO75a4DNU0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 17/75] media: imx: capture: Store v4l2_pix_format in imx_media_video_dev
Date:   Tue,  5 Jan 2021 17:27:54 +0200
Message-Id: <20210105152852.5733-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx_media_video_dev structure stores the active format on the video
node in an instance of v4l2_format. This wastes memory when all we need
is the information contained in the smaller v4l2_pix_format
sub-structure. Replace v4l2_format by v4l2_pix_format to save memory.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 15 +++++--------
 drivers/staging/media/imx/imx-media-capture.c | 22 +++++++++----------
 drivers/staging/media/imx/imx-media-csi.c     | 11 ++++------
 drivers/staging/media/imx/imx-media-vdic.c    |  2 +-
 drivers/staging/media/imx/imx-media.h         |  2 +-
 drivers/staging/media/imx/imx7-media-csi.c    |  7 +++---
 6 files changed, 25 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 47df1a5a1ae8..adb1a09e59d2 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -204,7 +204,7 @@ static void prp_vb2_buf_done(struct prp_priv *priv, struct ipuv3_channel *ch)
 
 	done = priv->active_vb2_buf[priv->ipu_buf_num];
 	if (done) {
-		done->vbuf.field = vdev->fmt.fmt.pix.field;
+		done->vbuf.field = vdev->fmt.field;
 		done->vbuf.sequence = priv->frame_sequence;
 		vb = &done->vbuf.vb2_buf;
 		vb->timestamp = ktime_get_ns();
@@ -229,7 +229,7 @@ static void prp_vb2_buf_done(struct prp_priv *priv, struct ipuv3_channel *ch)
 		ipu_idmac_clear_buffer(ch, priv->ipu_buf_num);
 
 	if (priv->interweave_swap && ch == priv->out_ch)
-		phys += vdev->fmt.fmt.pix.bytesperline;
+		phys += vdev->fmt.bytesperline;
 
 	ipu_cpmem_set_buffer(ch, priv->ipu_buf_num, phys);
 }
@@ -362,7 +362,7 @@ static int prp_setup_channel(struct prp_priv *priv,
 	ipu_cpmem_zero(channel);
 
 	memset(&image, 0, sizeof(image));
-	image.pix = vdev->fmt.fmt.pix;
+	image.pix = vdev->fmt;
 	image.rect = vdev->compose;
 
 	/*
@@ -457,7 +457,7 @@ static int prp_setup_rotation(struct prp_priv *priv)
 	int ret;
 
 	infmt = &priv->format_mbus[PRPENCVF_SINK_PAD];
-	outfmt = &vdev->fmt.fmt.pix;
+	outfmt = &vdev->fmt;
 	incc = priv->cc[PRPENCVF_SINK_PAD];
 	outcc = vdev->cc;
 
@@ -586,7 +586,7 @@ static int prp_setup_norotation(struct prp_priv *priv)
 	int ret;
 
 	infmt = &priv->format_mbus[PRPENCVF_SINK_PAD];
-	outfmt = &vdev->fmt.fmt.pix;
+	outfmt = &vdev->fmt;
 	incc = priv->cc[PRPENCVF_SINK_PAD];
 	outcc = vdev->cc;
 
@@ -665,17 +665,14 @@ static int prp_start(struct prp_priv *priv)
 {
 	struct imx_ic_priv *ic_priv = priv->ic_priv;
 	struct imx_media_video_dev *vdev = priv->vdev;
-	struct v4l2_pix_format *outfmt;
 	int ret;
 
 	ret = prp_get_ipu_resources(priv);
 	if (ret)
 		return ret;
 
-	outfmt = &vdev->fmt.fmt.pix;
-
 	ret = imx_media_alloc_dma_buf(ic_priv->ipu_dev, &priv->underrun_buf,
-				      outfmt->sizeimage);
+				      vdev->fmt.sizeimage);
 	if (ret)
 		goto out_put_ipu;
 
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 335cb74baa4c..f778d9588eb3 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -189,7 +189,7 @@ static int capture_g_fmt_vid_cap(struct file *file, void *fh,
 {
 	struct capture_priv *priv = video_drvdata(file);
 
-	*f = priv->vdev.fmt;
+	f->fmt.pix = priv->vdev.fmt;
 
 	return 0;
 }
@@ -294,7 +294,7 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	priv->vdev.fmt.fmt.pix = f->fmt.pix;
+	priv->vdev.fmt = f->fmt.pix;
 
 	return 0;
 }
@@ -343,8 +343,8 @@ static int capture_g_selection(struct file *file, void *fh,
 		 */
 		s->r.left = 0;
 		s->r.top = 0;
-		s->r.width = priv->vdev.fmt.fmt.pix.width;
-		s->r.height = priv->vdev.fmt.fmt.pix.height;
+		s->r.width = priv->vdev.fmt.width;
+		s->r.height = priv->vdev.fmt.height;
 		break;
 	default:
 		return -EINVAL;
@@ -458,7 +458,7 @@ static int capture_queue_setup(struct vb2_queue *vq,
 			       struct device *alloc_devs[])
 {
 	struct capture_priv *priv = vb2_get_drv_priv(vq);
-	struct v4l2_pix_format *pix = &priv->vdev.fmt.fmt.pix;
+	struct v4l2_pix_format *pix = &priv->vdev.fmt;
 	unsigned int count = *nbuffers;
 
 	if (vq->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -497,7 +497,7 @@ static int capture_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vb2_queue *vq = vb->vb2_queue;
 	struct capture_priv *priv = vb2_get_drv_priv(vq);
-	struct v4l2_pix_format *pix = &priv->vdev.fmt.fmt.pix;
+	struct v4l2_pix_format *pix = &priv->vdev.fmt;
 
 	if (vb2_plane_size(vb, 0) < pix->sizeimage) {
 		dev_err(priv->dev,
@@ -544,8 +544,8 @@ static int capture_validate_fmt(struct capture_priv *priv)
 	if (ret)
 		return ret;
 
-	return (priv->vdev.fmt.fmt.pix.width != f.fmt.pix.width ||
-		priv->vdev.fmt.fmt.pix.height != f.fmt.pix.height ||
+	return (priv->vdev.fmt.width != f.fmt.pix.width ||
+		priv->vdev.fmt.height != f.fmt.pix.height ||
 		priv->vdev.cc->cs != cc->cs ||
 		priv->vdev.compose.width != compose.width ||
 		priv->vdev.compose.height != compose.height) ? -EINVAL : 0;
@@ -732,12 +732,10 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 		return ret;
 	}
 
-	vdev->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt.fmt.pix,
-				      &fmt_src.format, NULL);
+	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
 	vdev->compose.width = fmt_src.format.width;
 	vdev->compose.height = fmt_src.format.height;
-	vdev->cc = imx_media_find_pixel_format(vdev->fmt.fmt.pix.pixelformat,
+	vdev->cc = imx_media_find_pixel_format(vdev->fmt.pixelformat,
 					       PIXFMT_SEL_ANY);
 
 	/* Register the video device. */
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 434866d28bfd..3a1501434288 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -267,7 +267,7 @@ static void csi_vb2_buf_done(struct csi_priv *priv)
 
 	done = priv->active_vb2_buf[priv->ipu_buf_num];
 	if (done) {
-		done->vbuf.field = vdev->fmt.fmt.pix.field;
+		done->vbuf.field = vdev->fmt.field;
 		done->vbuf.sequence = priv->frame_sequence;
 		vb = &done->vbuf.vb2_buf;
 		vb->timestamp = ktime_get_ns();
@@ -292,7 +292,7 @@ static void csi_vb2_buf_done(struct csi_priv *priv)
 		ipu_idmac_clear_buffer(priv->idmac_ch, priv->ipu_buf_num);
 
 	if (priv->interweave_swap)
-		phys += vdev->fmt.fmt.pix.bytesperline;
+		phys += vdev->fmt.bytesperline;
 
 	ipu_cpmem_set_buffer(priv->idmac_ch, priv->ipu_buf_num, phys);
 }
@@ -422,7 +422,7 @@ static int csi_idmac_setup_channel(struct csi_priv *priv)
 	ipu_cpmem_zero(priv->idmac_ch);
 
 	memset(&image, 0, sizeof(image));
-	image.pix = vdev->fmt.fmt.pix;
+	image.pix = vdev->fmt;
 	image.rect = vdev->compose;
 
 	csi_idmac_setup_vb2_buf(priv, phys);
@@ -596,7 +596,6 @@ static int csi_idmac_setup(struct csi_priv *priv)
 static int csi_idmac_start(struct csi_priv *priv)
 {
 	struct imx_media_video_dev *vdev = priv->vdev;
-	struct v4l2_pix_format *outfmt;
 	int ret;
 
 	ret = csi_idmac_get_ipu_resources(priv);
@@ -605,10 +604,8 @@ static int csi_idmac_start(struct csi_priv *priv)
 
 	ipu_smfc_map_channel(priv->smfc, priv->csi_id, priv->vc_num);
 
-	outfmt = &vdev->fmt.fmt.pix;
-
 	ret = imx_media_alloc_dma_buf(priv->dev, &priv->underrun_buf,
-				      outfmt->sizeimage);
+				      vdev->fmt.sizeimage);
 	if (ret)
 		goto out_put_ipu;
 
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 395b850736fa..abf290bda98d 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -246,7 +246,7 @@ static int setup_vdi_channel(struct vdic_priv *priv,
 	ipu_cpmem_zero(channel);
 
 	memset(&image, 0, sizeof(image));
-	image.pix = vdev->fmt.fmt.pix;
+	image.pix = vdev->fmt;
 	image.rect = vdev->compose;
 	/* one field to VDIC channels */
 	image.pix.height /= 2;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 1761451d3003..483fda2f13d9 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -105,7 +105,7 @@ struct imx_media_video_dev {
 	struct video_device *vfd;
 
 	/* the user format */
-	struct v4l2_format fmt;
+	struct v4l2_pix_format fmt;
 	/* the compose rectangle */
 	struct v4l2_rect compose;
 	const struct imx_media_pixfmt *cc;
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a3f3df901704..98eb41f6496c 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -585,7 +585,7 @@ static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 
 	done = csi->active_vb2_buf[csi->buf_num];
 	if (done) {
-		done->vbuf.field = vdev->fmt.fmt.pix.field;
+		done->vbuf.field = vdev->fmt.field;
 		done->vbuf.sequence = csi->frame_sequence;
 		vb = &done->vbuf.vb2_buf;
 		vb->timestamp = ktime_get_ns();
@@ -667,11 +667,10 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 static int imx7_csi_dma_start(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
-	struct v4l2_pix_format *out_pix = &vdev->fmt.fmt.pix;
 	int ret;
 
 	ret = imx_media_alloc_dma_buf(csi->dev, &csi->underrun_buf,
-				      out_pix->sizeimage);
+				      vdev->fmt.sizeimage);
 	if (ret < 0) {
 		v4l2_warn(&csi->sd, "consider increasing the CMA area\n");
 		return ret;
@@ -716,7 +715,7 @@ static void imx7_csi_dma_stop(struct imx7_csi *csi)
 static int imx7_csi_configure(struct imx7_csi *csi)
 {
 	struct imx_media_video_dev *vdev = csi->vdev;
-	struct v4l2_pix_format *out_pix = &vdev->fmt.fmt.pix;
+	struct v4l2_pix_format *out_pix = &vdev->fmt;
 	__u32 in_code = csi->format_mbus[IMX7_CSI_PAD_SINK].code;
 	u32 cr1, cr18;
 	int width = out_pix->width;
-- 
Regards,

Laurent Pinchart

