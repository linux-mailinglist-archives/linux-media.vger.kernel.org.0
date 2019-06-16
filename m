Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D06F4765A
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfFPSXO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:23:14 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36378 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfFPSXN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:23:13 -0400
Received: by mail-lj1-f196.google.com with SMTP id i21so7140942ljj.3
        for <linux-media@vger.kernel.org>; Sun, 16 Jun 2019 11:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N54B7V3/crrHsYQ7XRe2UXjRltByFANOUdnJd0qI2Xs=;
        b=iZ1PcCE9IrMEXVLD+ULCBjKrhBJH7ka09tdlzCN0au38KtV9YA9hlyl7DkODae6CG+
         xhDBXgnIhKM+9v6XXDutO/hSibSZh3Z2cArum32rP+CsgFFn6OTbXZa1M82l9gpvzb/q
         9rLWJLWUu0QwZZTIeYoKzBtg/tgb3e9cHMfmrFXO7C9mkQp29Zxt3GoitMJx6/ysrVjW
         +dDrDvPX4204KHJXXRlgcxipaxo3ZN+rLDMJQkn4kU3Rmvf75q+9Y+TSIaw3s7/eOBM1
         rFTJur2SIjjbmqT3sc5lF6MNk6Y+ZD/ZCVtKweqV1pzqUXd7Y0f1Zr0zf0gf9CukGiWD
         dGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N54B7V3/crrHsYQ7XRe2UXjRltByFANOUdnJd0qI2Xs=;
        b=s+UUKGymDPVWL/IMidNwDYN2zRynJI3ls5h1pRTq6jz77cbg5z6Gi/3Z9YeYyPvUtf
         kIR8u9jdRlPAkmTWOChOHcppHcmw12nArsVTSUiivSh/nylRzVV+TVldrQh3yWnaqyPx
         VYEeNUcuwz3aiwE6JshSwyXtPiBBY4JpEhd8EkeC0BApNn4CGz+dRL/OVgx5+iw0Mld5
         29vuc7pzIBAKWCgrDh4kretgxvGmqTbCubQV+FM8YMeSR9P5j5XDX2VOu5i2D/cxox5J
         S0SHMvNk3JRWrgKuQhEDxNOETqdkxjiS0mPkGXQZ2Zb1tmmer5MLau5Y0yu/USbGEAz1
         hL+Q==
X-Gm-Message-State: APjAAAVv/PSPBdQGxSN/+iTEuHfztNgh6GgAeQ024URdPevEVqoRYKxH
        qrBR5ZNeQkEhgnOTDhfwh70fPQnOu1Y=
X-Google-Smtp-Source: APXvYqzrleBzkWRS8rGpvT2UWblc5YYPlzX2YILkrSR5rjPQe7DXtzXWP+PYl97jCFJ8cXR/5zJkDw==
X-Received: by 2002:a2e:b0d0:: with SMTP id g16mr45277295ljl.161.1560709390414;
        Sun, 16 Jun 2019 11:23:10 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id z85sm1714081ljb.101.2019.06.16.11.23.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:23:09 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v2 2/9] media: vivid: make input std_signal per-input
Date:   Sun, 16 Jun 2019 11:22:11 -0700
Message-Id: <20190616182218.37726-3-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616182218.37726-1-johan.korsnes@gmail.com>
References: <20190616182218.37726-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the following properties per-input:

-Standard Signal Mode
-Standard

These properties need to be per-input in order to implement proper HDMI
(dis)connect-behavior, where the signal mode will be used to signify
whether or not there is an inpute device connected.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.c     |  5 +-
 drivers/media/platform/vivid/vivid-core.h     | 10 ++--
 drivers/media/platform/vivid/vivid-ctrls.c    | 13 +++--
 .../media/platform/vivid/vivid-kthread-cap.c  |  6 +--
 drivers/media/platform/vivid/vivid-vbi-cap.c  | 16 +++---
 drivers/media/platform/vivid/vivid-vid-cap.c  | 50 +++++++++++--------
 .../media/platform/vivid/vivid-vid-common.c   |  4 +-
 7 files changed, 59 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index f481f1768184..85e6aaf7bf0d 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -999,14 +999,15 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	dev->webcam_size_idx = 1;
 	dev->webcam_ival_idx = 3;
 	tpg_s_fourcc(&dev->tpg, dev->fmt_cap->fourcc);
-	dev->std_cap = V4L2_STD_PAL;
 	dev->std_out = V4L2_STD_PAL;
 	if (dev->input_type[0] == TV || dev->input_type[0] == SVID)
 		tvnorms_cap = V4L2_STD_ALL;
 	if (dev->output_type[0] == SVID)
 		tvnorms_out = V4L2_STD_ALL;
-	for (i = 0; i < MAX_INPUTS; i++)
+	for (i = 0; i < MAX_INPUTS; i++) {
 		dev->dv_timings_cap[i] = def_dv_timings;
+		dev->std_cap[i] = V4L2_STD_PAL;
+	}
 	dev->dv_timings_out = def_dv_timings;
 	dev->tv_freq = 2804 /* 175.25 * 16 */;
 	dev->tv_audmode = V4L2_TUNER_MODE_STEREO;
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index a77c548f47d8..a18fd19215b6 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -299,10 +299,10 @@ struct vivid_dev {
 	bool				time_wrap;
 	u64				time_wrap_offset;
 	unsigned			perc_dropped_buffers;
-	enum vivid_signal_mode		std_signal_mode;
-	unsigned			query_std_last;
-	v4l2_std_id			query_std;
-	enum tpg_video_aspect		std_aspect_ratio;
+	enum vivid_signal_mode		std_signal_mode[MAX_INPUTS];
+	unsigned			query_std_last[MAX_INPUTS];
+	v4l2_std_id			query_std[MAX_INPUTS];
+	enum tpg_video_aspect		std_aspect_ratio[MAX_INPUTS];
 
 	enum vivid_signal_mode		dv_timings_signal_mode[MAX_INPUTS];
 	char				**query_dv_timings_qmenu;
@@ -314,7 +314,7 @@ struct vivid_dev {
 
 	/* Input */
 	unsigned			input;
-	v4l2_std_id			std_cap;
+	v4l2_std_id			std_cap[MAX_INPUTS];
 	struct v4l2_dv_timings		dv_timings_cap[MAX_INPUTS];
 	int				dv_timings_cap_sel[MAX_INPUTS];
 	u32				service_set_cap;
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index a3c9661caf95..74b2c92fbfa0 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -463,7 +463,7 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		tpg_s_show_square(&dev->tpg, ctrl->val);
 		break;
 	case VIVID_CID_STD_ASPECT_RATIO:
-		dev->std_aspect_ratio = ctrl->val;
+		dev->std_aspect_ratio[dev->input] = ctrl->val;
 		tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
 		break;
 	case VIVID_CID_DV_TIMINGS_SIGNAL_MODE:
@@ -1130,10 +1130,13 @@ static int vivid_sdtv_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case VIVID_CID_STD_SIGNAL_MODE:
-		dev->std_signal_mode = dev->ctrl_std_signal_mode->val;
-		if (dev->std_signal_mode == SELECTED_STD)
-			dev->query_std = vivid_standard[dev->ctrl_standard->val];
-		v4l2_ctrl_activate(dev->ctrl_standard, dev->std_signal_mode == SELECTED_STD);
+		dev->std_signal_mode[dev->input] = dev->ctrl_std_signal_mode->val;
+		if (dev->std_signal_mode[dev->input] == SELECTED_STD)
+			dev->query_std[dev->input] =
+				vivid_standard[dev->ctrl_standard->val];
+		v4l2_ctrl_activate(dev->ctrl_standard,
+				   dev->std_signal_mode[dev->input] ==
+					SELECTED_STD);
 		vivid_update_quality(dev);
 		vivid_send_source_change(dev, TV);
 		vivid_send_source_change(dev, SVID);
diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
index b4eee952e1c9..6cf495a7d5cc 100644
--- a/drivers/media/platform/vivid/vivid-kthread-cap.c
+++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
@@ -43,7 +43,7 @@
 static inline v4l2_std_id vivid_get_std_cap(const struct vivid_dev *dev)
 {
 	if (vivid_is_sdtv_cap(dev))
-		return dev->std_cap;
+		return dev->std_cap[dev->input];
 	return 0;
 }
 
@@ -408,7 +408,7 @@ static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 	unsigned factor = V4L2_FIELD_HAS_T_OR_B(dev->field_cap) ? 2 : 1;
 	unsigned line_height = 16 / factor;
 	bool is_tv = vivid_is_sdtv_cap(dev);
-	bool is_60hz = is_tv && (dev->std_cap & V4L2_STD_525_60);
+	bool is_60hz = is_tv && (dev->std_cap[dev->input] & V4L2_STD_525_60);
 	unsigned p;
 	int line = 1;
 	u8 *basep[TPG_MAX_PLANES][2];
@@ -419,7 +419,7 @@ static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 
 	if (dev->loop_video && dev->can_loop_video &&
 		((vivid_is_svid_cap(dev) &&
-		!VIVID_INVALID_SIGNAL(dev->std_signal_mode)) ||
+		!VIVID_INVALID_SIGNAL(dev->std_signal_mode[dev->input])) ||
 		(vivid_is_hdmi_cap(dev) &&
 		!VIVID_INVALID_SIGNAL(dev->dv_timings_signal_mode[dev->input]))))
 		is_loop = true;
diff --git a/drivers/media/platform/vivid/vivid-vbi-cap.c b/drivers/media/platform/vivid/vivid-vbi-cap.c
index 40ecd7902b56..1a9348eea781 100644
--- a/drivers/media/platform/vivid/vivid-vbi-cap.c
+++ b/drivers/media/platform/vivid/vivid-vbi-cap.c
@@ -18,7 +18,7 @@
 static void vivid_sliced_vbi_cap_fill(struct vivid_dev *dev, unsigned seqnr)
 {
 	struct vivid_vbi_gen_data *vbi_gen = &dev->vbi_gen;
-	bool is_60hz = dev->std_cap & V4L2_STD_525_60;
+	bool is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
 
 	vivid_vbi_gen_sliced(vbi_gen, is_60hz, seqnr);
 
@@ -65,7 +65,7 @@ static void vivid_sliced_vbi_cap_fill(struct vivid_dev *dev, unsigned seqnr)
 
 static void vivid_g_fmt_vbi_cap(struct vivid_dev *dev, struct v4l2_vbi_format *vbi)
 {
-	bool is_60hz = dev->std_cap & V4L2_STD_525_60;
+	bool is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
 
 	vbi->sampling_rate = 27000000;
 	vbi->offset = 24;
@@ -93,7 +93,7 @@ void vivid_raw_vbi_cap_process(struct vivid_dev *dev, struct vivid_buffer *buf)
 
 	memset(vbuf, 0x10, vb2_plane_size(&buf->vb.vb2_buf, 0));
 
-	if (!VIVID_INVALID_SIGNAL(dev->std_signal_mode))
+	if (!VIVID_INVALID_SIGNAL(dev->std_signal_mode[dev->input]))
 		vivid_vbi_gen_raw(&dev->vbi_gen, &vbi, vbuf);
 }
 
@@ -111,7 +111,7 @@ void vivid_sliced_vbi_cap_process(struct vivid_dev *dev,
 	vivid_sliced_vbi_cap_fill(dev, buf->vb.sequence);
 
 	memset(vbuf, 0, vb2_plane_size(&buf->vb.vb2_buf, 0));
-	if (!VIVID_INVALID_SIGNAL(dev->std_signal_mode)) {
+	if (!VIVID_INVALID_SIGNAL(dev->std_signal_mode[dev->input])) {
 		unsigned i;
 
 		for (i = 0; i < 25; i++)
@@ -124,7 +124,7 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
 		       unsigned sizes[], struct device *alloc_devs[])
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vq);
-	bool is_60hz = dev->std_cap & V4L2_STD_525_60;
+	bool is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
 	unsigned size = vq->type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE ?
 		36 * sizeof(struct v4l2_sliced_vbi_data) :
 		1440 * 2 * (is_60hz ? 12 : 18);
@@ -144,7 +144,7 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
 static int vbi_cap_buf_prepare(struct vb2_buffer *vb)
 {
 	struct vivid_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
-	bool is_60hz = dev->std_cap & V4L2_STD_525_60;
+	bool is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
 	unsigned size = vb->vb2_queue->type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE ?
 		36 * sizeof(struct v4l2_sliced_vbi_data) :
 		1440 * 2 * (is_60hz ? 12 : 18);
@@ -302,7 +302,7 @@ int vidioc_try_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_forma
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	struct v4l2_sliced_vbi_format *vbi = &fmt->fmt.sliced;
-	bool is_60hz = dev->std_cap & V4L2_STD_525_60;
+	bool is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
 	u32 service_set = vbi->service_set;
 
 	if (!vivid_is_sdtv_cap(dev) || !dev->has_sliced_vbi_cap)
@@ -337,7 +337,7 @@ int vidioc_g_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_sliced_vbi_
 	bool is_60hz;
 
 	if (vdev->vfl_dir == VFL_DIR_RX) {
-		is_60hz = dev->std_cap & V4L2_STD_525_60;
+		is_60hz = dev->std_cap[dev->input] & V4L2_STD_525_60;
 		if (!vivid_is_sdtv_cap(dev) || !dev->has_sliced_vbi_cap ||
 		    cap->type != V4L2_BUF_TYPE_SLICED_VBI_CAPTURE)
 			return -EINVAL;
diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
index f4354c800088..ca15c13abf6c 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -196,7 +196,7 @@ static void vid_cap_buf_finish(struct vb2_buffer *vb)
 	 * test this.
 	 */
 	vbuf->flags |= V4L2_BUF_FLAG_TIMECODE;
-	if (dev->std_cap & V4L2_STD_525_60)
+	if (dev->std_cap[dev->input] & V4L2_STD_525_60)
 		fps = 30;
 	tc->type = (fps == 30) ? V4L2_TC_TYPE_30FPS : V4L2_TC_TYPE_25FPS;
 	tc->flags = 0;
@@ -304,7 +304,8 @@ void vivid_update_quality(struct vivid_dev *dev)
 		tpg_s_quality(&dev->tpg, TPG_QUAL_NOISE, 0);
 		return;
 	}
-	if (vivid_is_sdtv_cap(dev) && VIVID_INVALID_SIGNAL(dev->std_signal_mode)) {
+	if (vivid_is_sdtv_cap(dev) &&
+	    VIVID_INVALID_SIGNAL(dev->std_signal_mode[dev->input])) {
 		tpg_s_quality(&dev->tpg, TPG_QUAL_NOISE, 0);
 		return;
 	}
@@ -359,7 +360,7 @@ static enum tpg_quality vivid_get_quality(struct vivid_dev *dev, s32 *afc)
 enum tpg_video_aspect vivid_get_video_aspect(const struct vivid_dev *dev)
 {
 	if (vivid_is_sdtv_cap(dev))
-		return dev->std_aspect_ratio;
+		return dev->std_aspect_ratio[dev->input];
 
 	if (vivid_is_hdmi_cap(dev))
 		return dev->dv_timings_aspect_ratio[dev->input];
@@ -370,7 +371,7 @@ enum tpg_video_aspect vivid_get_video_aspect(const struct vivid_dev *dev)
 static enum tpg_pixel_aspect vivid_get_pixel_aspect(const struct vivid_dev *dev)
 {
 	if (vivid_is_sdtv_cap(dev))
-		return (dev->std_cap & V4L2_STD_525_60) ?
+		return (dev->std_cap[dev->input] & V4L2_STD_525_60) ?
 			TPG_PIXEL_ASPECT_NTSC : TPG_PIXEL_ASPECT_PAL;
 
 	if (vivid_is_hdmi_cap(dev) &&
@@ -404,7 +405,7 @@ void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 	case SVID:
 		dev->field_cap = dev->tv_field_cap;
 		dev->src_rect.width = 720;
-		if (dev->std_cap & V4L2_STD_525_60) {
+		if (dev->std_cap[dev->input] & V4L2_STD_525_60) {
 			dev->src_rect.height = 480;
 			dev->timeperframe_vid_cap = (struct v4l2_fract) { 1001, 30000 };
 			dev->service_set_cap = V4L2_SLICED_CAPTION_525;
@@ -587,7 +588,7 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 		h = sz->height;
 	} else if (vivid_is_sdtv_cap(dev)) {
 		w = 720;
-		h = (dev->std_cap & V4L2_STD_525_60) ? 480 : 576;
+		h = (dev->std_cap[dev->input] & V4L2_STD_525_60) ? 480 : 576;
 	} else {
 		w = dev->src_rect.width;
 		h = dev->src_rect.height;
@@ -1323,9 +1324,9 @@ int vidioc_enum_input(struct file *file, void *priv,
 	if (dev->sensor_vflip)
 		inp->status |= V4L2_IN_ST_VFLIP;
 	if (dev->input == inp->index && vivid_is_sdtv_cap(dev)) {
-		if (dev->std_signal_mode == NO_SIGNAL) {
+		if (dev->std_signal_mode[dev->input] == NO_SIGNAL) {
 			inp->status |= V4L2_IN_ST_NO_SIGNAL;
-		} else if (dev->std_signal_mode == NO_LOCK) {
+		} else if (dev->std_signal_mode[dev->input] == NO_LOCK) {
 			inp->status |= V4L2_IN_ST_NO_H_LOCK;
 		} else if (vivid_is_tv_cap(dev)) {
 			switch (tpg_g_quality(&dev->tpg)) {
@@ -1415,11 +1416,20 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
 	v4l2_ctrl_activate(dev->ctrl_dv_timings, vivid_is_hdmi_cap(dev) &&
 			   dev->dv_timings_signal_mode[dev->input] ==
 			   SELECTED_DV_TIMINGS);
+	v4l2_ctrl_activate(dev->ctrl_std_signal_mode, vivid_is_sdtv_cap(dev));
+	v4l2_ctrl_activate(dev->ctrl_standard, vivid_is_sdtv_cap(dev) &&
+			   dev->std_signal_mode[dev->input]);
+
 	if (vivid_is_hdmi_cap(dev)) {
 		v4l2_ctrl_s_ctrl(dev->ctrl_dv_timings_signal_mode,
 				 dev->dv_timings_signal_mode[dev->input]);
 		v4l2_ctrl_s_ctrl(dev->ctrl_dv_timings,
 				 dev->query_dv_timings[dev->input]);
+	} else if (vivid_is_sdtv_cap(dev)) {
+		v4l2_ctrl_s_ctrl(dev->ctrl_std_signal_mode,
+				 dev->std_signal_mode[dev->input]);
+		v4l2_ctrl_s_ctrl(dev->ctrl_standard,
+				 dev->std_signal_mode[dev->input]);
 	}
 
 	return 0;
@@ -1515,7 +1525,7 @@ int vivid_video_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 		vt->rxsubchans = V4L2_TUNER_SUB_MONO;
 	} else {
 		unsigned channel_nr = dev->tv_freq / (6 * 16);
-		unsigned options = (dev->std_cap & V4L2_STD_NTSC_M) ? 4 : 3;
+		unsigned options = (dev->std_cap[dev->input] & V4L2_STD_NTSC_M) ? 4 : 3;
 
 		switch (channel_nr % options) {
 		case 0:
@@ -1525,7 +1535,7 @@ int vivid_video_g_tuner(struct file *file, void *fh, struct v4l2_tuner *vt)
 			vt->rxsubchans = V4L2_TUNER_SUB_STEREO;
 			break;
 		case 2:
-			if (dev->std_cap & V4L2_STD_NTSC_M)
+			if (dev->std_cap[dev->input] & V4L2_STD_NTSC_M)
 				vt->rxsubchans = V4L2_TUNER_SUB_MONO | V4L2_TUNER_SUB_SAP;
 			else
 				vt->rxsubchans = V4L2_TUNER_SUB_LANG1 | V4L2_TUNER_SUB_LANG2;
@@ -1585,20 +1595,20 @@ int vidioc_querystd(struct file *file, void *priv, v4l2_std_id *id)
 
 	if (!vivid_is_sdtv_cap(dev))
 		return -ENODATA;
-	if (dev->std_signal_mode == NO_SIGNAL ||
-	    dev->std_signal_mode == NO_LOCK) {
+	if (dev->std_signal_mode[dev->input] == NO_SIGNAL ||
+	    dev->std_signal_mode[dev->input] == NO_LOCK) {
 		*id = V4L2_STD_UNKNOWN;
 		return 0;
 	}
 	if (vivid_is_tv_cap(dev) && tpg_g_quality(&dev->tpg) == TPG_QUAL_NOISE) {
 		*id = V4L2_STD_UNKNOWN;
-	} else if (dev->std_signal_mode == CURRENT_STD) {
-		*id = dev->std_cap;
-	} else if (dev->std_signal_mode == SELECTED_STD) {
-		*id = dev->query_std;
+	} else if (dev->std_signal_mode[dev->input] == CURRENT_STD) {
+		*id = dev->std_cap[dev->input];
+	} else if (dev->std_signal_mode[dev->input] == SELECTED_STD) {
+		*id = dev->query_std[dev->input];
 	} else {
-		*id = vivid_standard[dev->query_std_last];
-		dev->query_std_last = (dev->query_std_last + 1) % ARRAY_SIZE(vivid_standard);
+		*id = vivid_standard[dev->query_std_last[dev->input]];
+		dev->query_std_last[dev->input] = (dev->query_std_last[dev->input] + 1) % ARRAY_SIZE(vivid_standard);
 	}
 
 	return 0;
@@ -1610,11 +1620,11 @@ int vivid_vid_cap_s_std(struct file *file, void *priv, v4l2_std_id id)
 
 	if (!vivid_is_sdtv_cap(dev))
 		return -ENODATA;
-	if (dev->std_cap == id)
+	if (dev->std_cap[dev->input] == id)
 		return 0;
 	if (vb2_is_busy(&dev->vb_vid_cap_q) || vb2_is_busy(&dev->vb_vbi_cap_q))
 		return -EBUSY;
-	dev->std_cap = id;
+	dev->std_cap[dev->input] = id;
 	vivid_update_format_cap(dev, false);
 	return 0;
 }
diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
index 98c0e5b4d391..10a344c29a1a 100644
--- a/drivers/media/platform/vivid/vivid-vid-common.c
+++ b/drivers/media/platform/vivid/vivid-vid-common.c
@@ -645,7 +645,7 @@ bool vivid_vid_can_loop(struct vivid_dev *dev)
 	    dev->field_cap == V4L2_FIELD_SEQ_BT)
 		return false;
 	if (vivid_is_svid_cap(dev) && vivid_is_svid_out(dev)) {
-		if (!(dev->std_cap & V4L2_STD_525_60) !=
+		if (!(dev->std_cap[dev->input] & V4L2_STD_525_60) !=
 		    !(dev->std_out & V4L2_STD_525_60))
 			return false;
 		return true;
@@ -805,7 +805,7 @@ int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 	if (vdev->vfl_dir == VFL_DIR_RX) {
 		if (!vivid_is_sdtv_cap(dev))
 			return -ENODATA;
-		*id = dev->std_cap;
+		*id = dev->std_cap[dev->input];
 	} else {
 		if (!vivid_is_svid_out(dev))
 			return -ENODATA;
-- 
2.19.1

