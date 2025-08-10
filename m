Return-Path: <linux-media+bounces-39344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248CB1F7EE
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 030DF4E1376
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D79E2147FB;
	Sun, 10 Aug 2025 01:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MrmnPEXn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0C01DE881
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789603; cv=none; b=AmGabdu9l4dtQXBlx0QlQVv1SEWVUpb+XKO55rhirAHBWI9mVUUkFmICX6ld6cID3sVMjt8l0Ndtg4t1A/UQPRdPWQGFgkWsXKLMy9k8GlIl+lEBf7mbEdEgJ8K7VnV3f3av3WgdJufFPmueAYKixly6/Tg2bmWty9et3ADAaco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789603; c=relaxed/simple;
	bh=oiXypMK8LVPuEJiUUOPfdVclJRGq3ePrrGGCHk5DpEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e33hRM5HgGxH/52ud05X+KFdaggwEIOU6zSZmVx2tvA1LjogpyTWnozDBlZEg95/5SA4abSzIynTW3i4mgIQzv2vIlOl3O7mxgGJnDDB+00jDe9mne1gvGxlyRf3/hthmcM1UNkOlFaxC+/QjZIBR7ePq0qcptm5E21EL67JfSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MrmnPEXn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3132099F;
	Sun, 10 Aug 2025 03:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789547;
	bh=oiXypMK8LVPuEJiUUOPfdVclJRGq3ePrrGGCHk5DpEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MrmnPEXnIIoH7rOM26ZSf+jXTPkuA3JBSmZ90wm+ms1uTHPCg06/hLH0VGuDBoamS
	 xVUgn1wp7K62gZPX+sR9FNDQCJM/7OxXUlZ+c7qxZahciUKLnRQr5nZxaHA055drT8
	 9sWxs6qISQZ0ip1Oz1iQD3QppF8wcE01D8dy9fuo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 71/76] media: test-drivers: Rename second ioctl handlers argument to 'void *priv'
Date: Sun, 10 Aug 2025 04:30:53 +0300
Message-ID: <20250810013100.29776-72-laurent.pinchart+renesas@ideasonboard.com>
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

The second argument to the ioctl handlers is not a file handle any more.
Rename it from 'void *fh' to 'void *priv', to avoid misconceptions. This
is particularly important in test drivers as they are meant to be used
as reference implementations.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/test-drivers/vicodec/vicodec-core.c | 14 +--
 .../media/test-drivers/vimc/vimc-capture.c    |  2 +-
 drivers/media/test-drivers/vivid/vivid-core.c | 96 +++++++++----------
 .../media/test-drivers/vivid/vivid-radio-rx.c |  8 +-
 .../media/test-drivers/vivid/vivid-radio-rx.h |  8 +-
 .../media/test-drivers/vivid/vivid-radio-tx.c |  4 +-
 .../media/test-drivers/vivid/vivid-radio-tx.h |  4 +-
 .../media/test-drivers/vivid/vivid-sdr-cap.c  | 18 ++--
 .../media/test-drivers/vivid/vivid-sdr-cap.h  | 18 ++--
 .../media/test-drivers/vivid/vivid-vbi-cap.c  | 10 +-
 .../media/test-drivers/vivid/vivid-vbi-cap.h  |  8 +-
 .../media/test-drivers/vivid/vivid-vbi-out.c  |  8 +-
 .../media/test-drivers/vivid/vivid-vbi-out.h  |  6 +-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 24 ++---
 .../media/test-drivers/vivid/vivid-vid-cap.h  | 24 ++---
 .../test-drivers/vivid/vivid-vid-common.c     |  8 +-
 .../test-drivers/vivid/vivid-vid-common.h     |  8 +-
 .../media/test-drivers/vivid/vivid-vid-out.c  | 16 ++--
 .../media/test-drivers/vivid/vivid-vid-out.h  | 16 ++--
 19 files changed, 150 insertions(+), 150 deletions(-)

diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
index c340fd226040..174ea761d09a 100644
--- a/drivers/media/test-drivers/vicodec/vicodec-core.c
+++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
@@ -1207,20 +1207,20 @@ static int vidioc_s_selection(struct file *file, void *priv,
 	return 0;
 }
 
-static int vicodec_encoder_cmd(struct file *file, void *fh,
+static int vicodec_encoder_cmd(struct file *file, void *priv,
 			    struct v4l2_encoder_cmd *ec)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
 	int ret;
 
-	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, priv, ec);
 	if (ret < 0)
 		return ret;
 
 	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
 		return 0;
 
-	ret = v4l2_m2m_ioctl_encoder_cmd(file, fh, ec);
+	ret = v4l2_m2m_ioctl_encoder_cmd(file, priv, ec);
 	if (ret < 0)
 		return ret;
 
@@ -1235,7 +1235,7 @@ static int vicodec_encoder_cmd(struct file *file, void *fh,
 	return 0;
 }
 
-static int vicodec_decoder_cmd(struct file *file, void *fh,
+static int vicodec_decoder_cmd(struct file *file, void *priv,
 			    struct v4l2_decoder_cmd *dc)
 {
 	struct vicodec_ctx *ctx = file2ctx(file);
@@ -1247,14 +1247,14 @@ static int vicodec_decoder_cmd(struct file *file, void *fh,
 	 */
 	WARN_ON(ctx->is_stateless);
 
-	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dc);
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, priv, dc);
 	if (ret < 0)
 		return ret;
 
 	if (!vb2_is_streaming(&ctx->fh.m2m_ctx->out_q_ctx.q))
 		return 0;
 
-	ret = v4l2_m2m_ioctl_decoder_cmd(file, fh, dc);
+	ret = v4l2_m2m_ioctl_decoder_cmd(file, priv, dc);
 	if (ret < 0)
 		return ret;
 
@@ -1269,7 +1269,7 @@ static int vicodec_decoder_cmd(struct file *file, void *fh,
 	return 0;
 }
 
-static int vicodec_enum_framesizes(struct file *file, void *fh,
+static int vicodec_enum_framesizes(struct file *file, void *priv,
 				   struct v4l2_frmsizeenum *fsize)
 {
 	switch (fsize->pixel_format) {
diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 10df039278e7..45fda9d17bcb 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -169,7 +169,7 @@ static int vimc_capture_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int vimc_capture_enum_framesizes(struct file *file, void *fh,
+static int vimc_capture_enum_framesizes(struct file *file, void *priv,
 				    struct v4l2_frmsizeenum *fsize)
 {
 	const struct vimc_pix_map *vpix;
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 9c9a93a3b540..86506be36acb 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -277,49 +277,49 @@ static int vidioc_querycap(struct file *file, void  *priv,
 	return 0;
 }
 
-static int vidioc_s_hw_freq_seek(struct file *file, void *fh, const struct v4l2_hw_freq_seek *a)
+static int vidioc_s_hw_freq_seek(struct file *file, void *priv, const struct v4l2_hw_freq_seek *a)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO)
-		return vivid_radio_rx_s_hw_freq_seek(file, fh, a);
+		return vivid_radio_rx_s_hw_freq_seek(file, priv, a);
 	return -ENOTTY;
 }
 
-static int vidioc_enum_freq_bands(struct file *file, void *fh, struct v4l2_frequency_band *band)
+static int vidioc_enum_freq_bands(struct file *file, void *priv, struct v4l2_frequency_band *band)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO)
-		return vivid_radio_rx_enum_freq_bands(file, fh, band);
+		return vivid_radio_rx_enum_freq_bands(file, priv, band);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_enum_freq_bands(file, fh, band);
+		return vivid_sdr_enum_freq_bands(file, priv, band);
 	return -ENOTTY;
 }
 
-static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
+static int vidioc_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO)
-		return vivid_radio_rx_g_tuner(file, fh, vt);
+		return vivid_radio_rx_g_tuner(file, priv, vt);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_g_tuner(file, fh, vt);
-	return vivid_video_g_tuner(file, fh, vt);
+		return vivid_sdr_g_tuner(file, priv, vt);
+	return vivid_video_g_tuner(file, priv, vt);
 }
 
-static int vidioc_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
+static int vidioc_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_RADIO)
-		return vivid_radio_rx_s_tuner(file, fh, vt);
+		return vivid_radio_rx_s_tuner(file, priv, vt);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_s_tuner(file, fh, vt);
-	return vivid_video_s_tuner(file, fh, vt);
+		return vivid_sdr_s_tuner(file, priv, vt);
+	return vivid_video_s_tuner(file, priv, vt);
 }
 
-static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency *vf)
+static int vidioc_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
@@ -329,11 +329,11 @@ static int vidioc_g_frequency(struct file *file, void *fh, struct v4l2_frequency
 			vdev->vfl_dir == VFL_DIR_RX ?
 			&dev->radio_rx_freq : &dev->radio_tx_freq, vf);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_g_frequency(file, fh, vf);
-	return vivid_video_g_frequency(file, fh, vf);
+		return vivid_sdr_g_frequency(file, priv, vf);
+	return vivid_video_g_frequency(file, priv, vf);
 }
 
-static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
+static int vidioc_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
@@ -343,113 +343,113 @@ static int vidioc_s_frequency(struct file *file, void *fh, const struct v4l2_fre
 			vdev->vfl_dir == VFL_DIR_RX ?
 			&dev->radio_rx_freq : &dev->radio_tx_freq, vf);
 	if (vdev->vfl_type == VFL_TYPE_SDR)
-		return vivid_sdr_s_frequency(file, fh, vf);
-	return vivid_video_s_frequency(file, fh, vf);
+		return vivid_sdr_s_frequency(file, priv, vf);
+	return vivid_video_s_frequency(file, priv, vf);
 }
 
-static int vidioc_overlay(struct file *file, void *fh, unsigned i)
+static int vidioc_overlay(struct file *file, void *priv, unsigned i)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
 		return -ENOTTY;
-	return vivid_vid_out_overlay(file, fh, i);
+	return vivid_vid_out_overlay(file, priv, i);
 }
 
-static int vidioc_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *a)
+static int vidioc_g_fbuf(struct file *file, void *priv, struct v4l2_framebuffer *a)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
 		return -ENOTTY;
-	return vivid_vid_out_g_fbuf(file, fh, a);
+	return vivid_vid_out_g_fbuf(file, priv, a);
 }
 
-static int vidioc_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffer *a)
+static int vidioc_s_fbuf(struct file *file, void *priv, const struct v4l2_framebuffer *a)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
 		return -ENOTTY;
-	return vivid_vid_out_s_fbuf(file, fh, a);
+	return vivid_vid_out_s_fbuf(file, priv, a);
 }
 
-static int vidioc_s_std(struct file *file, void *fh, v4l2_std_id id)
+static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_s_std(file, fh, id);
-	return vivid_vid_out_s_std(file, fh, id);
+		return vivid_vid_cap_s_std(file, priv, id);
+	return vivid_vid_out_s_std(file, priv, id);
 }
 
-static int vidioc_s_dv_timings(struct file *file, void *fh, struct v4l2_dv_timings *timings)
+static int vidioc_s_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_s_dv_timings(file, fh, timings);
-	return vivid_vid_out_s_dv_timings(file, fh, timings);
+		return vivid_vid_cap_s_dv_timings(file, priv, timings);
+	return vivid_vid_out_s_dv_timings(file, priv, timings);
 }
 
-static int vidioc_g_pixelaspect(struct file *file, void *fh,
+static int vidioc_g_pixelaspect(struct file *file, void *priv,
 				int type, struct v4l2_fract *f)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_g_pixelaspect(file, fh, type, f);
-	return vivid_vid_out_g_pixelaspect(file, fh, type, f);
+		return vivid_vid_cap_g_pixelaspect(file, priv, type, f);
+	return vivid_vid_out_g_pixelaspect(file, priv, type, f);
 }
 
-static int vidioc_g_selection(struct file *file, void *fh,
+static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *sel)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_g_selection(file, fh, sel);
-	return vivid_vid_out_g_selection(file, fh, sel);
+		return vivid_vid_cap_g_selection(file, priv, sel);
+	return vivid_vid_out_g_selection(file, priv, sel);
 }
 
-static int vidioc_s_selection(struct file *file, void *fh,
+static int vidioc_s_selection(struct file *file, void *priv,
 			      struct v4l2_selection *sel)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_s_selection(file, fh, sel);
-	return vivid_vid_out_s_selection(file, fh, sel);
+		return vivid_vid_cap_s_selection(file, priv, sel);
+	return vivid_vid_out_s_selection(file, priv, sel);
 }
 
-static int vidioc_g_parm(struct file *file, void *fh,
+static int vidioc_g_parm(struct file *file, void *priv,
 			  struct v4l2_streamparm *parm)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_type == VFL_TYPE_TOUCH)
-		return vivid_g_parm_tch(file, fh, parm);
+		return vivid_g_parm_tch(file, priv, parm);
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_g_parm(file, fh, parm);
-	return vivid_vid_out_g_parm(file, fh, parm);
+		return vivid_vid_cap_g_parm(file, priv, parm);
+	return vivid_vid_out_g_parm(file, priv, parm);
 }
 
-static int vidioc_s_parm(struct file *file, void *fh,
+static int vidioc_s_parm(struct file *file, void *priv,
 			  struct v4l2_streamparm *parm)
 {
 	struct video_device *vdev = video_devdata(file);
 
 	if (vdev->vfl_dir == VFL_DIR_RX)
-		return vivid_vid_cap_s_parm(file, fh, parm);
+		return vivid_vid_cap_s_parm(file, priv, parm);
 	return -ENOTTY;
 }
 
-static int vidioc_log_status(struct file *file, void *fh)
+static int vidioc_log_status(struct file *file, void *priv)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
 
-	v4l2_ctrl_log_status(file, fh);
+	v4l2_ctrl_log_status(file, priv);
 	if (vdev->vfl_dir == VFL_DIR_RX && vdev->vfl_type == VFL_TYPE_VIDEO)
 		tpg_log_status(&dev->tpg);
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-rx.c b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
index be711cae2d49..b5e3026f883e 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-rx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-rx.c
@@ -133,7 +133,7 @@ __poll_t vivid_radio_rx_poll(struct file *file, struct poll_table_struct *wait)
 	return EPOLLIN | EPOLLRDNORM | v4l2_ctrl_poll(file, wait);
 }
 
-int vivid_radio_rx_enum_freq_bands(struct file *file, void *fh, struct v4l2_frequency_band *band)
+int vivid_radio_rx_enum_freq_bands(struct file *file, void *priv, struct v4l2_frequency_band *band)
 {
 	if (band->tuner != 0)
 		return -EINVAL;
@@ -145,7 +145,7 @@ int vivid_radio_rx_enum_freq_bands(struct file *file, void *fh, struct v4l2_freq
 	return 0;
 }
 
-int vivid_radio_rx_s_hw_freq_seek(struct file *file, void *fh, const struct v4l2_hw_freq_seek *a)
+int vivid_radio_rx_s_hw_freq_seek(struct file *file, void *priv, const struct v4l2_hw_freq_seek *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	unsigned low, high;
@@ -214,7 +214,7 @@ int vivid_radio_rx_s_hw_freq_seek(struct file *file, void *fh, const struct v4l2
 	return 0;
 }
 
-int vivid_radio_rx_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
+int vivid_radio_rx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	int delta = 800;
@@ -267,7 +267,7 @@ int vivid_radio_rx_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 	return 0;
 }
 
-int vivid_radio_rx_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
+int vivid_radio_rx_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-rx.h b/drivers/media/test-drivers/vivid/vivid-radio-rx.h
index c9c7849f6f99..a2ae17c78ece 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-rx.h
+++ b/drivers/media/test-drivers/vivid/vivid-radio-rx.h
@@ -11,9 +11,9 @@
 ssize_t vivid_radio_rx_read(struct file *, char __user *, size_t, loff_t *);
 __poll_t vivid_radio_rx_poll(struct file *file, struct poll_table_struct *wait);
 
-int vivid_radio_rx_enum_freq_bands(struct file *file, void *fh, struct v4l2_frequency_band *band);
-int vivid_radio_rx_s_hw_freq_seek(struct file *file, void *fh, const struct v4l2_hw_freq_seek *a);
-int vivid_radio_rx_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt);
-int vivid_radio_rx_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt);
+int vivid_radio_rx_enum_freq_bands(struct file *file, void *priv, struct v4l2_frequency_band *band);
+int vivid_radio_rx_s_hw_freq_seek(struct file *file, void *priv, const struct v4l2_hw_freq_seek *a);
+int vivid_radio_rx_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt);
+int vivid_radio_rx_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt);
 
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-tx.c b/drivers/media/test-drivers/vivid/vivid-radio-tx.c
index f6e80b8d00a6..ada60722066e 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-tx.c
+++ b/drivers/media/test-drivers/vivid/vivid-radio-tx.c
@@ -96,7 +96,7 @@ __poll_t vivid_radio_tx_poll(struct file *file, struct poll_table_struct *wait)
 	return EPOLLOUT | EPOLLWRNORM | v4l2_ctrl_poll(file, wait);
 }
 
-int vidioc_g_modulator(struct file *file, void *fh, struct v4l2_modulator *a)
+int vidioc_g_modulator(struct file *file, void *priv, struct v4l2_modulator *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -115,7 +115,7 @@ int vidioc_g_modulator(struct file *file, void *fh, struct v4l2_modulator *a)
 	return 0;
 }
 
-int vidioc_s_modulator(struct file *file, void *fh, const struct v4l2_modulator *a)
+int vidioc_s_modulator(struct file *file, void *priv, const struct v4l2_modulator *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
diff --git a/drivers/media/test-drivers/vivid/vivid-radio-tx.h b/drivers/media/test-drivers/vivid/vivid-radio-tx.h
index c2bf1e7e634a..20cb6f1363ff 100644
--- a/drivers/media/test-drivers/vivid/vivid-radio-tx.h
+++ b/drivers/media/test-drivers/vivid/vivid-radio-tx.h
@@ -11,7 +11,7 @@
 ssize_t vivid_radio_tx_write(struct file *, const char __user *, size_t, loff_t *);
 __poll_t vivid_radio_tx_poll(struct file *file, struct poll_table_struct *wait);
 
-int vidioc_g_modulator(struct file *file, void *fh, struct v4l2_modulator *a);
-int vidioc_s_modulator(struct file *file, void *fh, const struct v4l2_modulator *a);
+int vidioc_g_modulator(struct file *file, void *priv, struct v4l2_modulator *a);
+int vidioc_s_modulator(struct file *file, void *priv, const struct v4l2_modulator *a);
 
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index c633fc2ed664..2664a593e8e1 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -344,7 +344,7 @@ const struct vb2_ops vivid_sdr_cap_qops = {
 	.buf_request_complete	= sdr_cap_buf_request_complete,
 };
 
-int vivid_sdr_enum_freq_bands(struct file *file, void *fh,
+int vivid_sdr_enum_freq_bands(struct file *file, void *priv,
 		struct v4l2_frequency_band *band)
 {
 	switch (band->tuner) {
@@ -363,7 +363,7 @@ int vivid_sdr_enum_freq_bands(struct file *file, void *fh,
 	}
 }
 
-int vivid_sdr_g_frequency(struct file *file, void *fh,
+int vivid_sdr_g_frequency(struct file *file, void *priv,
 		struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -382,7 +382,7 @@ int vivid_sdr_g_frequency(struct file *file, void *fh,
 	}
 }
 
-int vivid_sdr_s_frequency(struct file *file, void *fh,
+int vivid_sdr_s_frequency(struct file *file, void *priv,
 		const struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -423,7 +423,7 @@ int vivid_sdr_s_frequency(struct file *file, void *fh,
 	}
 }
 
-int vivid_sdr_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
+int vivid_sdr_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 {
 	switch (vt->index) {
 	case 0:
@@ -447,14 +447,14 @@ int vivid_sdr_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 	}
 }
 
-int vivid_sdr_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
+int vivid_sdr_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
 {
 	if (vt->index > 1)
 		return -EINVAL;
 	return 0;
 }
 
-int vidioc_enum_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+int vidioc_enum_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_fmtdesc *f)
 {
 	if (f->index >= ARRAY_SIZE(formats))
 		return -EINVAL;
@@ -462,7 +462,7 @@ int vidioc_enum_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	return 0;
 }
 
-int vidioc_g_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f)
+int vidioc_g_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -471,7 +471,7 @@ int vidioc_g_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-int vidioc_s_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f)
+int vidioc_s_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct vb2_queue *q = &dev->vb_sdr_cap_q;
@@ -495,7 +495,7 @@ int vidioc_s_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f)
 	return 0;
 }
 
-int vidioc_try_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f)
+int vidioc_try_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f)
 {
 	int i;
 
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.h b/drivers/media/test-drivers/vivid/vivid-sdr-cap.h
index 813c9248e5a7..3d8eeabbfc10 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.h
@@ -8,15 +8,15 @@
 #ifndef _VIVID_SDR_CAP_H_
 #define _VIVID_SDR_CAP_H_
 
-int vivid_sdr_enum_freq_bands(struct file *file, void *fh, struct v4l2_frequency_band *band);
-int vivid_sdr_g_frequency(struct file *file, void *fh, struct v4l2_frequency *vf);
-int vivid_sdr_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
-int vivid_sdr_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt);
-int vivid_sdr_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt);
-int vidioc_enum_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f);
-int vidioc_g_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f);
-int vidioc_s_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f);
-int vidioc_try_fmt_sdr_cap(struct file *file, void *fh, struct v4l2_format *f);
+int vivid_sdr_enum_freq_bands(struct file *file, void *priv, struct v4l2_frequency_band *band);
+int vivid_sdr_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf);
+int vivid_sdr_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf);
+int vivid_sdr_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt);
+int vivid_sdr_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt);
+int vidioc_enum_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_fmtdesc *f);
+int vidioc_g_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f);
+int vidioc_s_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f);
+int vidioc_try_fmt_sdr_cap(struct file *file, void *priv, struct v4l2_format *f);
 void vivid_sdr_cap_process(struct vivid_dev *dev, struct vivid_buffer *buf);
 
 extern const struct vb2_ops vivid_sdr_cap_qops;
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index a09f62c66c33..791382a54b4f 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -282,7 +282,7 @@ void vivid_fill_service_lines(struct v4l2_sliced_vbi_format *vbi, u32 service_se
 	}
 }
 
-int vidioc_g_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+int vidioc_g_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
@@ -294,7 +294,7 @@ int vidioc_g_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format
 	return 0;
 }
 
-int vidioc_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+int vidioc_try_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
@@ -310,11 +310,11 @@ int vidioc_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_forma
 	return 0;
 }
 
-int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt)
+int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
-	int ret = vidioc_try_fmt_sliced_vbi_cap(file, fh, fmt);
+	int ret = vidioc_try_fmt_sliced_vbi_cap(file, priv, fmt);
 
 	if (ret)
 		return ret;
@@ -324,7 +324,7 @@ int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format
 	return 0;
 }
 
-int vidioc_g_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_sliced_vbi_cap *cap)
+int vidioc_g_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_sliced_vbi_cap *cap)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct video_device *vdev = video_devdata(file);
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.h b/drivers/media/test-drivers/vivid/vivid-vbi-cap.h
index 91d2de01381c..ec2d200c9e0d 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.h
@@ -16,10 +16,10 @@ int vidioc_g_fmt_vbi_cap(struct file *file, void *priv,
 					struct v4l2_format *f);
 int vidioc_s_fmt_vbi_cap(struct file *file, void *priv,
 					struct v4l2_format *f);
-int vidioc_g_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt);
-int vidioc_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt);
-int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format *fmt);
-int vidioc_g_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_sliced_vbi_cap *cap);
+int vidioc_g_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt);
+int vidioc_try_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt);
+int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_format *fmt);
+int vidioc_g_sliced_vbi_cap(struct file *file, void *priv, struct v4l2_sliced_vbi_cap *cap);
 
 void vivid_fill_service_lines(struct v4l2_sliced_vbi_format *vbi, u32 service_set);
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
index b7a09d2f394e..7b3ea96744bb 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
@@ -168,7 +168,7 @@ int vidioc_s_fmt_vbi_out(struct file *file, void *priv,
 	return 0;
 }
 
-int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt)
+int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
@@ -180,7 +180,7 @@ int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format
 	return 0;
 }
 
-int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt)
+int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
@@ -196,12 +196,12 @@ int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_forma
 	return 0;
 }
 
-int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh,
+int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *priv,
 		struct v4l2_format *fmt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
-	int ret = vidioc_try_fmt_sliced_vbi_out(file, fh, fmt);
+	int ret = vidioc_try_fmt_sliced_vbi_out(file, priv, fmt);
 
 	if (ret)
 		return ret;
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.h b/drivers/media/test-drivers/vivid/vivid-vbi-out.h
index 76584940cdaf..a28e55519ade 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-out.h
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.h
@@ -13,9 +13,9 @@ int vidioc_g_fmt_vbi_out(struct file *file, void *priv,
 					struct v4l2_format *f);
 int vidioc_s_fmt_vbi_out(struct file *file, void *priv,
 					struct v4l2_format *f);
-int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt);
-int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt);
-int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *fh, struct v4l2_format *fmt);
+int vidioc_g_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt);
+int vidioc_try_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt);
+int vidioc_s_fmt_sliced_vbi_out(struct file *file, void *priv, struct v4l2_format *fmt);
 
 extern const struct vb2_ops vivid_vbi_out_qops;
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 2e4c1ed37cd2..8b3162e82032 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -899,7 +899,7 @@ int vivid_vid_cap_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_vid_cap_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+int vivid_vid_cap_s_selection(struct file *file, void *priv, struct v4l2_selection *s)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_rect *crop = &dev->crop_cap;
@@ -1222,7 +1222,7 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
 	return 0;
 }
 
-int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *vin)
+int vidioc_enumaudio(struct file *file, void *priv, struct v4l2_audio *vin)
 {
 	if (vin->index >= ARRAY_SIZE(vivid_audio_inputs))
 		return -EINVAL;
@@ -1230,7 +1230,7 @@ int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *vin)
 	return 0;
 }
 
-int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
+int vidioc_g_audio(struct file *file, void *priv, struct v4l2_audio *vin)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1240,7 +1240,7 @@ int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *vin)
 	return 0;
 }
 
-int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *vin)
+int vidioc_s_audio(struct file *file, void *priv, const struct v4l2_audio *vin)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1252,7 +1252,7 @@ int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *vin)
 	return 0;
 }
 
-int vivid_video_g_frequency(struct file *file, void *fh, struct v4l2_frequency *vf)
+int vivid_video_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1262,7 +1262,7 @@ int vivid_video_g_frequency(struct file *file, void *fh, struct v4l2_frequency *
 	return 0;
 }
 
-int vivid_video_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
+int vivid_video_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1274,7 +1274,7 @@ int vivid_video_s_frequency(struct file *file, void *fh, const struct v4l2_frequ
 	return 0;
 }
 
-int vivid_video_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
+int vivid_video_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1286,7 +1286,7 @@ int vivid_video_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt
 	return 0;
 }
 
-int vivid_video_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
+int vivid_video_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	enum tpg_quality qual;
@@ -1490,7 +1490,7 @@ static bool valid_cvt_gtf_timings(struct v4l2_dv_timings *timings)
 	return false;
 }
 
-int vivid_vid_cap_s_dv_timings(struct file *file, void *_fh,
+int vivid_vid_cap_s_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1513,7 +1513,7 @@ int vivid_vid_cap_s_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-int vidioc_query_dv_timings(struct file *file, void *_fh,
+int vidioc_query_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1600,7 +1600,7 @@ void vivid_update_connected_outputs(struct vivid_dev *dev)
 	}
 }
 
-int vidioc_s_edid(struct file *file, void *_fh,
+int vidioc_s_edid(struct file *file, void *priv,
 			 struct v4l2_edid *edid)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1638,7 +1638,7 @@ int vidioc_s_edid(struct file *file, void *_fh,
 	return 0;
 }
 
-int vidioc_enum_framesizes(struct file *file, void *fh,
+int vidioc_enum_framesizes(struct file *file, void *priv,
 					 struct v4l2_frmsizeenum *fsize)
 {
 	struct vivid_dev *dev = video_drvdata(file);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.h b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
index 7a8daf0af2ca..38a99f7e038e 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.h
@@ -29,7 +29,7 @@ int vidioc_g_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_try_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_s_fmt_vid_cap(struct file *file, void *priv, struct v4l2_format *f);
 int vivid_vid_cap_g_selection(struct file *file, void *priv, struct v4l2_selection *sel);
-int vivid_vid_cap_s_selection(struct file *file, void *fh, struct v4l2_selection *s);
+int vivid_vid_cap_s_selection(struct file *file, void *priv, struct v4l2_selection *s);
 int vivid_vid_cap_g_pixelaspect(struct file *file, void *priv, int type, struct v4l2_fract *f);
 int vidioc_enum_fmt_vid_overlay(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
 int vidioc_g_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *f);
@@ -38,19 +38,19 @@ int vidioc_s_fmt_vid_overlay(struct file *file, void *priv, struct v4l2_format *
 int vidioc_enum_input(struct file *file, void *priv, struct v4l2_input *inp);
 int vidioc_g_input(struct file *file, void *priv, unsigned *i);
 int vidioc_s_input(struct file *file, void *priv, unsigned i);
-int vidioc_enumaudio(struct file *file, void *fh, struct v4l2_audio *vin);
-int vidioc_g_audio(struct file *file, void *fh, struct v4l2_audio *vin);
-int vidioc_s_audio(struct file *file, void *fh, const struct v4l2_audio *vin);
-int vivid_video_g_frequency(struct file *file, void *fh, struct v4l2_frequency *vf);
-int vivid_video_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
-int vivid_video_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt);
-int vivid_video_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt);
+int vidioc_enumaudio(struct file *file, void *priv, struct v4l2_audio *vin);
+int vidioc_g_audio(struct file *file, void *priv, struct v4l2_audio *vin);
+int vidioc_s_audio(struct file *file, void *priv, const struct v4l2_audio *vin);
+int vivid_video_g_frequency(struct file *file, void *priv, struct v4l2_frequency *vf);
+int vivid_video_s_frequency(struct file *file, void *priv, const struct v4l2_frequency *vf);
+int vivid_video_s_tuner(struct file *file, void *priv, const struct v4l2_tuner *vt);
+int vivid_video_g_tuner(struct file *file, void *priv, struct v4l2_tuner *vt);
 int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *id);
 int vivid_vid_cap_s_std(struct file *file, void *priv, v4l2_std_id id);
-int vivid_vid_cap_s_dv_timings(struct file *file, void *_fh, struct v4l2_dv_timings *timings);
-int vidioc_query_dv_timings(struct file *file, void *_fh, struct v4l2_dv_timings *timings);
-int vidioc_s_edid(struct file *file, void *_fh, struct v4l2_edid *edid);
-int vidioc_enum_framesizes(struct file *file, void *fh, struct v4l2_frmsizeenum *fsize);
+int vivid_vid_cap_s_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings);
+int vidioc_query_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings);
+int vidioc_s_edid(struct file *file, void *priv, struct v4l2_edid *edid);
+int vidioc_enum_framesizes(struct file *file, void *priv, struct v4l2_frmsizeenum *fsize);
 int vidioc_enum_frameintervals(struct file *file, void *priv, struct v4l2_frmivalenum *fival);
 int vivid_vid_cap_g_parm(struct file *file, void *priv, struct v4l2_streamparm *parm);
 int vivid_vid_cap_s_parm(struct file *file, void *priv, struct v4l2_streamparm *parm);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
index df7678db67fb..786a1aa3b26b 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
@@ -1021,7 +1021,7 @@ int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	return 0;
 }
 
-int vidioc_g_dv_timings(struct file *file, void *_fh,
+int vidioc_g_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1039,7 +1039,7 @@ int vidioc_g_dv_timings(struct file *file, void *_fh,
 	return 0;
 }
 
-int vidioc_enum_dv_timings(struct file *file, void *_fh,
+int vidioc_enum_dv_timings(struct file *file, void *priv,
 				    struct v4l2_enum_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1056,7 +1056,7 @@ int vidioc_enum_dv_timings(struct file *file, void *_fh,
 			NULL, NULL);
 }
 
-int vidioc_dv_timings_cap(struct file *file, void *_fh,
+int vidioc_dv_timings_cap(struct file *file, void *priv,
 				    struct v4l2_dv_timings_cap *cap)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1073,7 +1073,7 @@ int vidioc_dv_timings_cap(struct file *file, void *_fh,
 	return 0;
 }
 
-int vidioc_g_edid(struct file *file, void *_fh,
+int vidioc_g_edid(struct file *file, void *priv,
 			 struct v4l2_edid *edid)
 {
 	struct vivid_dev *dev = video_drvdata(file);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.h b/drivers/media/test-drivers/vivid/vivid-vid-common.h
index c49ac85abaed..fb5878174dba 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.h
@@ -32,10 +32,10 @@ int vivid_vid_adjust_sel(unsigned flags, struct v4l2_rect *r);
 
 int vivid_enum_fmt_vid(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
 int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id);
-int vidioc_g_dv_timings(struct file *file, void *_fh, struct v4l2_dv_timings *timings);
-int vidioc_enum_dv_timings(struct file *file, void *_fh, struct v4l2_enum_dv_timings *timings);
-int vidioc_dv_timings_cap(struct file *file, void *_fh, struct v4l2_dv_timings_cap *cap);
-int vidioc_g_edid(struct file *file, void *_fh, struct v4l2_edid *edid);
+int vidioc_g_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings);
+int vidioc_enum_dv_timings(struct file *file, void *priv, struct v4l2_enum_dv_timings *timings);
+int vidioc_dv_timings_cap(struct file *file, void *priv, struct v4l2_dv_timings_cap *cap);
+int vidioc_g_edid(struct file *file, void *priv, struct v4l2_edid *edid);
 int vidioc_subscribe_event(struct v4l2_fh *fh, const struct v4l2_event_subscription *sub);
 
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index c3398bce6c15..8c037b90833e 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -672,7 +672,7 @@ int vivid_vid_out_g_selection(struct file *file, void *priv,
 	return 0;
 }
 
-int vivid_vid_out_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+int vivid_vid_out_s_selection(struct file *file, void *priv, struct v4l2_selection *s)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_rect *crop = &dev->crop_out;
@@ -880,7 +880,7 @@ int vidioc_s_fmt_vid_out_overlay(struct file *file, void *priv,
 	return ret;
 }
 
-int vivid_vid_out_overlay(struct file *file, void *fh, unsigned i)
+int vivid_vid_out_overlay(struct file *file, void *priv, unsigned i)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -893,7 +893,7 @@ int vivid_vid_out_overlay(struct file *file, void *fh, unsigned i)
 	return 0;
 }
 
-int vivid_vid_out_g_fbuf(struct file *file, void *fh,
+int vivid_vid_out_g_fbuf(struct file *file, void *priv,
 				struct v4l2_framebuffer *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -920,7 +920,7 @@ int vivid_vid_out_g_fbuf(struct file *file, void *fh,
 	return 0;
 }
 
-int vivid_vid_out_s_fbuf(struct file *file, void *fh,
+int vivid_vid_out_s_fbuf(struct file *file, void *priv,
 				const struct v4l2_framebuffer *a)
 {
 	struct vivid_dev *dev = video_drvdata(file);
@@ -1016,7 +1016,7 @@ int vidioc_s_output(struct file *file, void *priv, unsigned o)
 	return 0;
 }
 
-int vidioc_enumaudout(struct file *file, void *fh, struct v4l2_audioout *vout)
+int vidioc_enumaudout(struct file *file, void *priv, struct v4l2_audioout *vout)
 {
 	if (vout->index >= ARRAY_SIZE(vivid_audio_outputs))
 		return -EINVAL;
@@ -1024,7 +1024,7 @@ int vidioc_enumaudout(struct file *file, void *fh, struct v4l2_audioout *vout)
 	return 0;
 }
 
-int vidioc_g_audout(struct file *file, void *fh, struct v4l2_audioout *vout)
+int vidioc_g_audout(struct file *file, void *priv, struct v4l2_audioout *vout)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1034,7 +1034,7 @@ int vidioc_g_audout(struct file *file, void *fh, struct v4l2_audioout *vout)
 	return 0;
 }
 
-int vidioc_s_audout(struct file *file, void *fh, const struct v4l2_audioout *vout)
+int vidioc_s_audout(struct file *file, void *priv, const struct v4l2_audioout *vout)
 {
 	struct vivid_dev *dev = video_drvdata(file);
 
@@ -1072,7 +1072,7 @@ static bool valid_cvt_gtf_timings(struct v4l2_dv_timings *timings)
 	return false;
 }
 
-int vivid_vid_out_s_dv_timings(struct file *file, void *_fh,
+int vivid_vid_out_s_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.h b/drivers/media/test-drivers/vivid/vivid-vid-out.h
index 8d56314f4ea1..1d03891a5de5 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.h
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.h
@@ -22,23 +22,23 @@ int vidioc_g_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_try_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_s_fmt_vid_out(struct file *file, void *priv, struct v4l2_format *f);
 int vivid_vid_out_g_selection(struct file *file, void *priv, struct v4l2_selection *sel);
-int vivid_vid_out_s_selection(struct file *file, void *fh, struct v4l2_selection *s);
+int vivid_vid_out_s_selection(struct file *file, void *priv, struct v4l2_selection *s);
 int vivid_vid_out_g_pixelaspect(struct file *file, void *priv, int type, struct v4l2_fract *f);
 int vidioc_enum_fmt_vid_out_overlay(struct file *file, void  *priv, struct v4l2_fmtdesc *f);
 int vidioc_g_fmt_vid_out_overlay(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_try_fmt_vid_out_overlay(struct file *file, void *priv, struct v4l2_format *f);
 int vidioc_s_fmt_vid_out_overlay(struct file *file, void *priv, struct v4l2_format *f);
-int vivid_vid_out_overlay(struct file *file, void *fh, unsigned i);
-int vivid_vid_out_g_fbuf(struct file *file, void *fh, struct v4l2_framebuffer *a);
-int vivid_vid_out_s_fbuf(struct file *file, void *fh, const struct v4l2_framebuffer *a);
+int vivid_vid_out_overlay(struct file *file, void *priv, unsigned i);
+int vivid_vid_out_g_fbuf(struct file *file, void *priv, struct v4l2_framebuffer *a);
+int vivid_vid_out_s_fbuf(struct file *file, void *priv, const struct v4l2_framebuffer *a);
 int vidioc_enum_output(struct file *file, void *priv, struct v4l2_output *out);
 int vidioc_g_output(struct file *file, void *priv, unsigned *i);
 int vidioc_s_output(struct file *file, void *priv, unsigned i);
-int vidioc_enumaudout(struct file *file, void *fh, struct v4l2_audioout *vout);
-int vidioc_g_audout(struct file *file, void *fh, struct v4l2_audioout *vout);
-int vidioc_s_audout(struct file *file, void *fh, const struct v4l2_audioout *vout);
+int vidioc_enumaudout(struct file *file, void *priv, struct v4l2_audioout *vout);
+int vidioc_g_audout(struct file *file, void *priv, struct v4l2_audioout *vout);
+int vidioc_s_audout(struct file *file, void *priv, const struct v4l2_audioout *vout);
 int vivid_vid_out_s_std(struct file *file, void *priv, v4l2_std_id id);
-int vivid_vid_out_s_dv_timings(struct file *file, void *_fh, struct v4l2_dv_timings *timings);
+int vivid_vid_out_s_dv_timings(struct file *file, void *priv, struct v4l2_dv_timings *timings);
 int vivid_vid_out_g_parm(struct file *file, void *priv, struct v4l2_streamparm *parm);
 
 #endif
-- 
Regards,

Laurent Pinchart


