Return-Path: <linux-media+bounces-39207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFEAB1F667
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4006B4E06AE
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD43E27C145;
	Sat,  9 Aug 2025 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dSSmiGMv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154C327F724;
	Sat,  9 Aug 2025 21:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774265; cv=none; b=kLimiTAvUgkf3dtxzYNYH8sdrZle1w7sPueock3y107NkB11IeJU1BSmAIWAbkR43Jg0GmWZdyTL7GcgPI8xQYhtGPTojYFQ4wHWcKnm9Jc+NUR9Z2vJULZX8OxU3kyBoT7sNMoASb/G2d7cH0WR0YqvQNe5uugcM0dn1d3rpU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774265; c=relaxed/simple;
	bh=1ESr2w/CoIkkkOAjyAd8tOU1IaSJkYBpQt6RuJ7iBlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CoovuGVXMSEQ6LPEHS6QX0jgUZO3xvSArHhaAlNbtQLOzxu2aTpelHkyCtualeRrqWUlTGOi9L6IxadvMjpcDFuBD1v/PftK+J0g5DYeovkt43X7HUL/EbqVojt//7oeFcas/MRV1SSFuls6HGf28IWUTcYyL5soYLtRsuHxsxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dSSmiGMv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B6E95165B;
	Sat,  9 Aug 2025 23:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774194;
	bh=1ESr2w/CoIkkkOAjyAd8tOU1IaSJkYBpQt6RuJ7iBlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dSSmiGMvbxBCPtRIKQzplmWY4AZQ/kBCiuc8s5h5y2g3bft5X0xtZUX9gxWbuOPVc
	 0WpseDLgyEVKTmx52wB+Tu6PwnJeIF0j4hnH6EIHNOLOJIVGzB3/cb6268gxWMnngh
	 JwFES7ZsuvttSW9RXToqdxhVcG0YdEaI9DiPMtXI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Ming Qian <ming.qian@nxp.com>,
	Zhou Peng <eagle.zhou@nxp.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Benoit Parrot <bparrot@ti.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mike Isely <isely@pobox.com>,
	Hans de Goede <hansg@kernel.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Akash Kumar <quic_akakum@quicinc.com>,
	Abhishek Tamboli <abhishektamboli9@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 09/76] media: Replace file->private_data access with file_to_v4l2_fh()
Date: Sun, 10 Aug 2025 00:15:46 +0300
Message-ID: <20250809211654.28887-10-laurent.pinchart@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Accessing file->private_data manually to retrieve the v4l2_fh pointer is
error-prone, as the field is a void * and will happily cast implicitly
to any pointer type.

Replace all remaining locations that read the v4l2_fh pointer directly
from file->private_data with usage of the file_to_v4l2_fh() function.
The change was generated manually.

No functional change is intended, this only paves the way to remove
direct accesses to file->private_data and make V4L2 drivers safer.
Other accesses to the field will be addressed separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/pci/cx18/cx18-driver.h                 |  2 +-
 drivers/media/pci/cx18/cx18-fileops.c                |  2 +-
 drivers/media/pci/saa7164/saa7164.h                  |  4 ++--
 drivers/media/platform/amphion/vpu.h                 |  2 +-
 drivers/media/platform/imagination/e5010-jpeg-enc.h  |  2 +-
 drivers/media/platform/nxp/dw100/dw100.c             |  2 +-
 drivers/media/platform/nxp/imx-pxp.c                 |  2 +-
 drivers/media/platform/qcom/iris/iris_vidc.c         |  2 +-
 drivers/media/platform/qcom/venus/core.h             |  2 +-
 .../media/platform/samsung/s3c-camif/camif-capture.c |  6 +++---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c     |  2 +-
 .../media/platform/sunxi/sun8i-rotate/sun8i_rotate.c |  2 +-
 drivers/media/platform/ti/vpe/vpe.c                  |  2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c    |  2 +-
 drivers/media/test-drivers/vim2m.c                   |  2 +-
 drivers/media/test-drivers/visl/visl.h               |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c        |  4 ++--
 drivers/media/test-drivers/vivid/vivid-radio-rx.c    |  4 ++--
 drivers/media/test-drivers/vivid/vivid-radio-tx.c    |  4 ++--
 drivers/media/usb/hdpvr/hdpvr-video.c                | 12 ++++++------
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c             |  2 +-
 drivers/media/usb/uvc/uvcvideo.h                     |  2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c        |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                 |  4 ++--
 drivers/staging/most/video/video.c                   |  2 +-
 drivers/usb/gadget/function/uvc.h                    |  5 +++++
 drivers/usb/gadget/function/uvc_v4l2.c               |  2 +-
 27 files changed, 43 insertions(+), 38 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-driver.h b/drivers/media/pci/cx18/cx18-driver.h
index 485ca9747c4c..92acd23a8c4d 100644
--- a/drivers/media/pci/cx18/cx18-driver.h
+++ b/drivers/media/pci/cx18/cx18-driver.h
@@ -414,7 +414,7 @@ static inline struct cx18_open_id *fh2id(struct v4l2_fh *fh)
 
 static inline struct cx18_open_id *file2id(struct file *file)
 {
-	return fh2id(file->private_data);
+	return fh2id(file_to_v4l2_fh(file));
 }
 
 /* forward declaration of struct defined in cx18-cards.h */
diff --git a/drivers/media/pci/cx18/cx18-fileops.c b/drivers/media/pci/cx18/cx18-fileops.c
index af25628b11ba..89e38b303630 100644
--- a/drivers/media/pci/cx18/cx18-fileops.c
+++ b/drivers/media/pci/cx18/cx18-fileops.c
@@ -709,7 +709,7 @@ int cx18_v4l2_close(struct file *filp)
 	}
 
 	if (id->type == CX18_ENC_STREAM_TYPE_YUV &&
-	    filp->private_data == vdev->queue->owner) {
+	    file_to_v4l2_fh(filp) == vdev->queue->owner) {
 		vb2_queue_release(vdev->queue);
 		vdev->queue->owner = NULL;
 	}
diff --git a/drivers/media/pci/saa7164/saa7164.h b/drivers/media/pci/saa7164/saa7164.h
index 7b511f7f1cfc..94e987e7b5e5 100644
--- a/drivers/media/pci/saa7164/saa7164.h
+++ b/drivers/media/pci/saa7164/saa7164.h
@@ -182,7 +182,7 @@ struct saa7164_encoder_fh {
 
 static inline struct saa7164_encoder_fh *to_saa7164_encoder_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct saa7164_encoder_fh, fh);
+	return container_of(file_to_v4l2_fh(filp), struct saa7164_encoder_fh, fh);
 }
 
 struct saa7164_vbi_fh {
@@ -193,7 +193,7 @@ struct saa7164_vbi_fh {
 
 static inline struct saa7164_vbi_fh *to_saa7164_vbi_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct saa7164_vbi_fh, fh);
+	return container_of(file_to_v4l2_fh(filp), struct saa7164_vbi_fh, fh);
 }
 
 struct saa7164_histogram_bucket {
diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
index cac0f1a64fea..bfd171a3ded4 100644
--- a/drivers/media/platform/amphion/vpu.h
+++ b/drivers/media/platform/amphion/vpu.h
@@ -328,7 +328,7 @@ static inline const char *vpu_core_type_desc(enum vpu_core_type type)
 
 static inline struct vpu_inst *to_inst(struct file *filp)
 {
-	return container_of(filp->private_data, struct vpu_inst, fh);
+	return container_of(file_to_v4l2_fh(filp), struct vpu_inst, fh);
 }
 
 #define ctrl_to_inst(ctrl)	\
diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.h b/drivers/media/platform/imagination/e5010-jpeg-enc.h
index eefaf60489d3..da57bc1baa46 100644
--- a/drivers/media/platform/imagination/e5010-jpeg-enc.h
+++ b/drivers/media/platform/imagination/e5010-jpeg-enc.h
@@ -122,7 +122,7 @@ struct e5010_context {
 
 static inline struct e5010_context *to_e5010_context(struct file *filp)
 {
-	return container_of(filp->private_data, struct e5010_context, fh);
+	return container_of(file_to_v4l2_fh(filp), struct e5010_context, fh);
 }
 
 /*
diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
index 3d1db1121bf9..2460f09a6813 100644
--- a/drivers/media/platform/nxp/dw100/dw100.c
+++ b/drivers/media/platform/nxp/dw100/dw100.c
@@ -266,7 +266,7 @@ static inline int dw100_dump_regs(struct seq_file *m)
 
 static inline struct dw100_ctx *dw100_file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct dw100_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct dw100_ctx, fh);
 }
 
 static struct dw100_q_data *dw100_get_q_data(struct dw100_ctx *ctx,
diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
index 7f8ffbac582f..879b1803a2b3 100644
--- a/drivers/media/platform/nxp/imx-pxp.c
+++ b/drivers/media/platform/nxp/imx-pxp.c
@@ -248,7 +248,7 @@ struct pxp_ctx {
 
 static inline struct pxp_ctx *file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct pxp_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct pxp_ctx, fh);
 }
 
 static struct pxp_q_data *get_q_data(struct pxp_ctx *ctx,
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index c417e8c31f80..0c3b47b9958a 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -69,7 +69,7 @@ static void iris_remove_session(struct iris_inst *inst)
 
 static inline struct iris_inst *iris_get_inst(struct file *filp, void *fh)
 {
-	return container_of(filp->private_data, struct iris_inst, fh);
+	return container_of(file_to_v4l2_fh(filp), struct iris_inst, fh);
 }
 
 static void iris_m2m_device_run(void *priv)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 5b1ba1c69adb..3c0c5f9dbe7b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -535,7 +535,7 @@ struct venus_inst {
 
 static inline struct venus_inst *to_inst(struct file *filp)
 {
-	return container_of(filp->private_data, struct venus_inst, fh);
+	return container_of(file_to_v4l2_fh(filp), struct venus_inst, fh);
 }
 
 static inline void *to_hfi_priv(struct venus_core *core)
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index 3e566b65f417..cae15a4ce5fd 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -572,7 +572,7 @@ static int s3c_camif_close(struct file *file)
 
 	mutex_lock(&camif->lock);
 
-	if (vp->owner == file->private_data) {
+	if (vp->owner == file_to_v4l2_fh(file)) {
 		camif_stop_capture(vp);
 		vb2_queue_release(&vp->vb_queue);
 		vp->owner = NULL;
@@ -595,7 +595,7 @@ static __poll_t s3c_camif_poll(struct file *file,
 	__poll_t ret;
 
 	mutex_lock(&camif->lock);
-	if (vp->owner && vp->owner != file->private_data)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		ret = EPOLLERR;
 	else
 		ret = vb2_poll(&vp->vb_queue, file, wait);
@@ -609,7 +609,7 @@ static int s3c_camif_mmap(struct file *file, struct vm_area_struct *vma)
 	struct camif_vp *vp = video_drvdata(file);
 	int ret;
 
-	if (vp->owner && vp->owner != file->private_data)
+	if (vp->owner && vp->owner != file_to_v4l2_fh(file))
 		ret = -EBUSY;
 	else
 		ret = vb2_mmap(&vp->vb_queue, vma);
diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index 3e7f2df70408..43755043e8af 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -309,7 +309,7 @@ static void deinterlace_init(struct deinterlace_dev *dev)
 
 static inline struct deinterlace_ctx *deinterlace_file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct deinterlace_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct deinterlace_ctx, fh);
 }
 
 static bool deinterlace_check_format(u32 pixelformat)
diff --git a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
index abd10b218aa1..d0608b5d900f 100644
--- a/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
+++ b/drivers/media/platform/sunxi/sun8i-rotate/sun8i_rotate.c
@@ -170,7 +170,7 @@ static irqreturn_t rotate_irq(int irq, void *data)
 
 static inline struct rotate_ctx *rotate_file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct rotate_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct rotate_ctx, fh);
 }
 
 static void rotate_prepare_format(struct v4l2_pix_format *pix_fmt)
diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
index b76b5d18c963..4b9b2bec7377 100644
--- a/drivers/media/platform/ti/vpe/vpe.c
+++ b/drivers/media/platform/ti/vpe/vpe.c
@@ -424,7 +424,7 @@ struct vpe_ctx {
 
 static inline struct vpe_ctx *to_vpe_ctx(struct file *filp)
 {
-	return container_of(filp->private_data, struct vpe_ctx, fh);
+	return container_of(file_to_v4l2_fh(filp), struct vpe_ctx, fh);
 }
 
 /*
diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index c45f5cf12ded..e27f6761cba1 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -144,7 +144,7 @@ static const struct v4l2_event vicodec_eos_event = {
 
 static inline struct vicodec_ctx *file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct vicodec_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct vicodec_ctx, fh);
 }
 
 static struct vicodec_q_data *get_q_data(struct vicodec_ctx *ctx,
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 1d1a9e768505..55d885be5bcc 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -236,7 +236,7 @@ struct vim2m_ctx {
 
 static inline struct vim2m_ctx *file2ctx(struct file *file)
 {
-	return container_of(file->private_data, struct vim2m_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct vim2m_ctx, fh);
 }
 
 static struct vim2m_q_data *get_q_data(struct vim2m_ctx *ctx,
diff --git a/drivers/media/test-drivers/visl/visl.h b/drivers/media/test-drivers/visl/visl.h
index 434e9efbf9b2..ad3d0ab791d6 100644
--- a/drivers/media/test-drivers/visl/visl.h
+++ b/drivers/media/test-drivers/visl/visl.h
@@ -163,7 +163,7 @@ struct visl_ctrl_desc {
 
 static inline struct visl_ctx *visl_file_to_ctx(struct file *file)
 {
-	return container_of(file->private_data, struct visl_ctx, fh);
+	return container_of(file_to_v4l2_fh(file), struct visl_ctx, fh);
 }
 
 static inline struct visl_ctx *visl_v4l2fh_to_ctx(struct v4l2_fh *v4l2_fh)
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 8d56168c72aa..9c9a93a3b540 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -654,11 +654,11 @@ static int vivid_fop_release(struct file *file)
 		v4l2_info(&dev->v4l2_dev, "reconnect\n");
 		vivid_reconnect(dev);
 	}
-	if (file->private_data == dev->radio_rx_rds_owner) {
+	if (file_to_v4l2_fh(file) == dev->radio_rx_rds_owner) {
 		dev->radio_rx_rds_last_block = 0;
 		dev->radio_rx_rds_owner = NULL;
 	}
-	if (file->private_data == dev->radio_tx_rds_owner) {
+	if (file_to_v4l2_fh(file) == dev->radio_tx_rds_owner) {
 		dev->radio_tx_rds_last_block = 0;
 		dev->radio_tx_rds_owner = NULL;
 	}
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-rx.c b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
index 79c1723bd84c..be711cae2d49 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-rx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
@@ -42,13 +42,13 @@ ssize_t vivid_radio_rx_read(struct file *file, char __user *buf,
 	if (mutex_lock_interruptible(&dev->mutex))
 		return -ERESTARTSYS;
 	if (dev->radio_rx_rds_owner &&
-	    file->private_data != dev->radio_rx_rds_owner) {
+	    file_to_v4l2_fh(file) != dev->radio_rx_rds_owner) {
 		mutex_unlock(&dev->mutex);
 		return -EBUSY;
 	}
 	if (dev->radio_rx_rds_owner == NULL) {
 		vivid_radio_rds_init(dev);
-		dev->radio_rx_rds_owner = file->private_data;
+		dev->radio_rx_rds_owner = file_to_v4l2_fh(file);
 	}
 
 retry:
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-tx.c b/drivers/media/test-drivers/vivid/vivid-radio-tx.c
index 049d40b948bb..f6e80b8d00a6 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-tx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-tx.c
@@ -39,11 +39,11 @@ ssize_t vivid_radio_tx_write(struct file *file, const char __user *buf,
 	if (mutex_lock_interruptible(&dev->mutex))
 		return -ERESTARTSYS;
 	if (dev->radio_tx_rds_owner &&
-	    file->private_data != dev->radio_tx_rds_owner) {
+	    file_to_v4l2_fh(file) != dev->radio_tx_rds_owner) {
 		mutex_unlock(&dev->mutex);
 		return -EBUSY;
 	}
-	dev->radio_tx_rds_owner = file->private_data;
+	dev->radio_tx_rds_owner = file_to_v4l2_fh(file);
 
 retry:
 	timestamp = ktime_sub(ktime_get(), dev->radio_rds_init_time);
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 4c431bd9b503..ea17f1a5f5b0 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -390,7 +390,7 @@ static int hdpvr_release(struct file *file)
 	struct hdpvr_device *dev = video_drvdata(file);
 
 	mutex_lock(&dev->io_mutex);
-	if (file->private_data == dev->owner) {
+	if (file_to_v4l2_fh(file) == dev->owner) {
 		hdpvr_stop_streaming(dev);
 		dev->owner = NULL;
 	}
@@ -426,7 +426,7 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 			mutex_unlock(&dev->io_mutex);
 			goto err;
 		}
-		dev->owner = file->private_data;
+		dev->owner = file_to_v4l2_fh(file);
 		print_buffer_status();
 	}
 	mutex_unlock(&dev->io_mutex);
@@ -541,7 +541,7 @@ static __poll_t hdpvr_poll(struct file *filp, poll_table *wait)
 				 "start_streaming failed\n");
 			dev->status = STATUS_IDLE;
 		} else {
-			dev->owner = filp->private_data;
+			dev->owner = file_to_v4l2_fh(filp);
 		}
 
 		print_buffer_status();
@@ -1048,7 +1048,7 @@ static int vidioc_encoder_cmd(struct file *filp, void *priv,
 
 	switch (a->cmd) {
 	case V4L2_ENC_CMD_START:
-		if (dev->owner && filp->private_data != dev->owner) {
+		if (dev->owner && file_to_v4l2_fh(filp) != dev->owner) {
 			res = -EBUSY;
 			break;
 		}
@@ -1056,12 +1056,12 @@ static int vidioc_encoder_cmd(struct file *filp, void *priv,
 			break;
 		res = hdpvr_start_streaming(dev);
 		if (!res)
-			dev->owner = filp->private_data;
+			dev->owner = file_to_v4l2_fh(filp);
 		else
 			dev->status = STATUS_IDLE;
 		break;
 	case V4L2_ENC_CMD_STOP:
-		if (dev->owner && filp->private_data != dev->owner) {
+		if (dev->owner && file_to_v4l2_fh(filp) != dev->owner) {
 			res = -EBUSY;
 			break;
 		}
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index 7dc7c90ebf62..481b03bbecf8 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -48,7 +48,7 @@ struct pvr2_v4l2_fh {
 
 static inline struct pvr2_v4l2_fh *to_pvr2_v4l2_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct pvr2_v4l2_fh, fh);
+	return container_of(file_to_v4l2_fh(filp), struct pvr2_v4l2_fh, fh);
 }
 
 struct pvr2_v4l2 {
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8b5625203048..70dc80e2b213 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -639,7 +639,7 @@ struct uvc_fh {
 
 static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct uvc_fh, vfh);
+	return container_of(file_to_v4l2_fh(filp), struct uvc_fh, vfh);
 }
 
 /* ------------------------------------------------------------------------
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 8c07400bd280..8a5559225ff2 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -678,7 +678,7 @@ static inline bool ctrl_is_pointer(struct file *file, u32 id)
 	const struct v4l2_ioctl_ops *ops = vdev->ioctl_ops;
 
 	if (test_bit(V4L2_FL_USES_V4L2_FH, &vdev->flags))
-		fh = file->private_data;
+		fh = file_to_v4l2_fh(file);
 
 	if (fh && fh->ctrl_handler)
 		hdl = fh->ctrl_handler;
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 46da373066f4..8c81852c3046 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1197,7 +1197,7 @@ static int v4l_s_priority(const struct v4l2_ioctl_ops *ops,
 	vfd = video_devdata(file);
 	if (!test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
 		return -ENOTTY;
-	vfh = file->private_data;
+	vfh = file_to_v4l2_fh(file);
 	return v4l2_prio_change(vfd->prio, &vfh->prio, *p);
 }
 
@@ -3084,7 +3084,7 @@ static long __video_do_ioctl(struct file *file,
 	}
 
 	if (test_bit(V4L2_FL_USES_V4L2_FH, &vfd->flags))
-		vfh = file->private_data;
+		vfh = file_to_v4l2_fh(file);
 
 	/*
 	 * We need to serialize streamon/off with queueing new requests.
diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index bce7ffeac8fe..116331cead2a 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -54,7 +54,7 @@ struct comp_fh {
 
 static inline struct comp_fh *to_comp_fh(struct file *filp)
 {
-	return container_of(filp->private_data, struct comp_fh, fh);
+	return container_of(file_to_v4l2_fh(filp), struct comp_fh, fh);
 }
 
 static LIST_HEAD(video_devices);
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 6f44dd732315..9e79cbe50715 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -196,6 +196,11 @@ struct uvc_file_handle {
 #define to_uvc_file_handle(handle) \
 	container_of(handle, struct uvc_file_handle, vfh)
 
+static inline struct uvc_file_handle *file_to_uvc_file_handle(struct file *filp)
+{
+	return container_of(file_to_v4l2_fh(filp), struct uvc_file_handle, vfh);
+}
+
 /* ------------------------------------------------------------------------
  * Functions
  */
diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
index fc9a8d31a1e9..886300a29b90 100644
--- a/drivers/usb/gadget/function/uvc_v4l2.c
+++ b/drivers/usb/gadget/function/uvc_v4l2.c
@@ -685,7 +685,7 @@ uvc_v4l2_release(struct file *file)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct uvc_device *uvc = video_get_drvdata(vdev);
-	struct uvc_file_handle *handle = to_uvc_file_handle(file->private_data);
+	struct uvc_file_handle *handle = file_to_uvc_file_handle(file);
 	struct uvc_video *video = handle->device;
 
 	mutex_lock(&video->mutex);
-- 
Regards,

Laurent Pinchart


