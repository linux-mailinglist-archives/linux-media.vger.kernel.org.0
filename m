Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24EE34953E
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 00:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbfFQWj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 18:39:28 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46224 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfFQWj2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 18:39:28 -0400
Received: by mail-lf1-f65.google.com with SMTP id z15so7722038lfh.13
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MA/vL3mDcyDua43IocdLwudylpaz6V7agKuqfN7wtJE=;
        b=fmjMhkwB9KQTmu2gFhtiv9w9eQYp0DD96IxSUZ0oZCpBTwljbxnjxWsFEGrXVklUml
         WNRv5dCyORFVhDGGONQxWG2BAa9ttrs9qDZF9NrtAuZDaOYM9vJJgjozPCY4qkHguqft
         oNNnEMF4gL050yJWAWS5TYQnrG00QJtXcbrcC++wyawkhmi7rvy1KmH4m2kykY/RaQ4r
         wJ6uDipO6Odf8GKuB27NjytbTfIiOSQ/gNiY0aS3LXF6EsJhwOhC6cOO3+znTEmbt3xs
         TazF1CygCUxBaUmzzEK5bWc6U/+DToFSW8LDMiZPFyVRncznfDb2HGTme+EnARqYtTmc
         SoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MA/vL3mDcyDua43IocdLwudylpaz6V7agKuqfN7wtJE=;
        b=pKFQAPiSQL/auIWfFSoEOJcrVbCfbWQILai38NWKGxIjNqPtkdYANzNEKDyOy5DM4Z
         1tP+bGWVhssovlbtCFOm8yBv0Nx2WMQSv/5uN4ivMIJM83pHErh3SGFjJrHtr0NaYmsg
         IOAdeiG+X0K3E6sErXWJNTNENSGwfucNvfhUYdI4bX7FzhSH7XsvKDcEue3WqAqCvNCj
         YjHlxuG+qbxRpDx55pUMgXWldtffZW81O2YejmfimTFAB6iwmtP/VNLCxSF+Yg16jiA+
         qTlJTOlGSJTBT7Q/FNNyGah5y7G8Kn0H+UvSkj9pK2yc3fe0UdqWbPI3nMJzS1yClhb+
         H+Kw==
X-Gm-Message-State: APjAAAXSBfdOGm5ruaHIAXHPlBouQ/e4ONv8aOiWQdpGLxg+mv9trP8q
        Al7jy2dSssSpZsV0Kc1V1eYfDKqxNlIJFQ==
X-Google-Smtp-Source: APXvYqyrr932Zi+BL9CiF4iCcimokUHKvvxHOAY/OdUh0/ID7uKitRwNNwDzoABPTt9W5guT69RI7Q==
X-Received: by 2002:a19:671c:: with SMTP id b28mr4562614lfc.164.1560811165306;
        Mon, 17 Jun 2019 15:39:25 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id i23sm2287347ljb.7.2019.06.17.15.39.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 15:39:24 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v3 1/9] media: vivid: make input dv_timings per-input
Date:   Tue, 18 Jun 2019 09:37:18 +0200
Message-Id: <20190618073726.61776-2-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190618073726.61776-1-johan.korsnes@gmail.com>
References: <20190618073726.61776-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make the following properties per-input

-DV Timings Signal Mode
-DV Timings

These properties need to be per-input in order to implement proper
HDMI (dis)connect-behavior, where the signal mode will be used to
signify whether or not there is an input device connected.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.c     | 12 +++-
 drivers/media/platform/vivid/vivid-core.h     | 11 ++--
 drivers/media/platform/vivid/vivid-ctrls.c    | 13 ++--
 .../media/platform/vivid/vivid-kthread-cap.c  |  2 +-
 drivers/media/platform/vivid/vivid-vid-cap.c  | 63 ++++++++++++-------
 .../media/platform/vivid/vivid-vid-common.c   |  2 +-
 6 files changed, 69 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index beb2e566a43c..f481f1768184 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -1005,7 +1005,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		tvnorms_cap = V4L2_STD_ALL;
 	if (dev->output_type[0] == SVID)
 		tvnorms_out = V4L2_STD_ALL;
-	dev->dv_timings_cap = def_dv_timings;
+	for (i = 0; i < MAX_INPUTS; i++)
+		dev->dv_timings_cap[i] = def_dv_timings;
 	dev->dv_timings_out = def_dv_timings;
 	dev->tv_freq = 2804 /* 175.25 * 16 */;
 	dev->tv_audmode = V4L2_TUNER_MODE_STEREO;
@@ -1035,6 +1036,15 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	if (ret)
 		goto unreg_dev;
 
+	/* enable/disable interface specific controls */
+	if (dev->num_inputs && dev->input_type[0] != HDMI) {
+		v4l2_ctrl_activate(dev->ctrl_dv_timings_signal_mode, false);
+		v4l2_ctrl_activate(dev->ctrl_dv_timings, false);
+	} else if (dev->num_inputs && dev->input_type[0] == HDMI) {
+		v4l2_ctrl_activate(dev->ctrl_std_signal_mode, false);
+		v4l2_ctrl_activate(dev->ctrl_standard, false);
+	}
+
 	/*
 	 * update the capture and output formats to do a proper initial
 	 * configuration.
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index 6697c7009629..90b879d28da5 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -304,18 +304,19 @@ struct vivid_dev {
 	v4l2_std_id			query_std;
 	enum tpg_video_aspect		std_aspect_ratio;
 
-	enum vivid_signal_mode		dv_timings_signal_mode;
+	enum vivid_signal_mode		dv_timings_signal_mode[MAX_INPUTS];
 	char				**query_dv_timings_qmenu;
 	char				*query_dv_timings_qmenu_strings;
 	unsigned			query_dv_timings_size;
-	unsigned			query_dv_timings_last;
-	unsigned			query_dv_timings;
-	enum tpg_video_aspect		dv_timings_aspect_ratio;
+	unsigned int			query_dv_timings_last[MAX_INPUTS];
+	unsigned int			query_dv_timings[MAX_INPUTS];
+	enum tpg_video_aspect		dv_timings_aspect_ratio[MAX_INPUTS];
 
 	/* Input */
 	unsigned			input;
 	v4l2_std_id			std_cap;
-	struct v4l2_dv_timings		dv_timings_cap;
+	struct v4l2_dv_timings		dv_timings_cap[MAX_INPUTS];
+	int				dv_timings_cap_sel[MAX_INPUTS];
 	u32				service_set_cap;
 	struct vivid_vbi_gen_data	vbi_gen;
 	u8				*edid;
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index 4cd526ff248b..a3c9661caf95 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -467,16 +467,19 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
 		break;
 	case VIVID_CID_DV_TIMINGS_SIGNAL_MODE:
-		dev->dv_timings_signal_mode = dev->ctrl_dv_timings_signal_mode->val;
-		if (dev->dv_timings_signal_mode == SELECTED_DV_TIMINGS)
-			dev->query_dv_timings = dev->ctrl_dv_timings->val;
+		dev->dv_timings_signal_mode[dev->input] =
+			dev->ctrl_dv_timings_signal_mode->val;
+		dev->query_dv_timings[dev->input] = dev->ctrl_dv_timings->val;
+
 		v4l2_ctrl_activate(dev->ctrl_dv_timings,
-				dev->dv_timings_signal_mode == SELECTED_DV_TIMINGS);
+			dev->dv_timings_signal_mode[dev->input] ==
+				SELECTED_DV_TIMINGS);
+
 		vivid_update_quality(dev);
 		vivid_send_source_change(dev, HDMI);
 		break;
 	case VIVID_CID_DV_TIMINGS_ASPECT_RATIO:
-		dev->dv_timings_aspect_ratio = ctrl->val;
+		dev->dv_timings_aspect_ratio[dev->input] = ctrl->val;
 		tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
 		break;
 	case VIVID_CID_TSTAMP_SRC:
diff --git a/drivers/media/platform/vivid/vivid-kthread-cap.c b/drivers/media/platform/vivid/vivid-kthread-cap.c
index f8006a30c12f..b4eee952e1c9 100644
--- a/drivers/media/platform/vivid/vivid-kthread-cap.c
+++ b/drivers/media/platform/vivid/vivid-kthread-cap.c
@@ -421,7 +421,7 @@ static void vivid_fillbuff(struct vivid_dev *dev, struct vivid_buffer *buf)
 		((vivid_is_svid_cap(dev) &&
 		!VIVID_INVALID_SIGNAL(dev->std_signal_mode)) ||
 		(vivid_is_hdmi_cap(dev) &&
-		!VIVID_INVALID_SIGNAL(dev->dv_timings_signal_mode))))
+		!VIVID_INVALID_SIGNAL(dev->dv_timings_signal_mode[dev->input]))))
 		is_loop = true;
 
 	buf->vb.sequence = dev->vid_cap_seq_count;
diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
index 530ac8decb25..a3b1b7c33630 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -299,7 +299,8 @@ void vivid_update_quality(struct vivid_dev *dev)
 		tpg_s_quality(&dev->tpg, TPG_QUAL_NOISE, 0);
 		return;
 	}
-	if (vivid_is_hdmi_cap(dev) && VIVID_INVALID_SIGNAL(dev->dv_timings_signal_mode)) {
+	if (vivid_is_hdmi_cap(dev) &&
+	    VIVID_INVALID_SIGNAL(dev->dv_timings_signal_mode[dev->input])) {
 		tpg_s_quality(&dev->tpg, TPG_QUAL_NOISE, 0);
 		return;
 	}
@@ -361,7 +362,7 @@ enum tpg_video_aspect vivid_get_video_aspect(const struct vivid_dev *dev)
 		return dev->std_aspect_ratio;
 
 	if (vivid_is_hdmi_cap(dev))
-		return dev->dv_timings_aspect_ratio;
+		return dev->dv_timings_aspect_ratio[dev->input];
 
 	return TPG_VIDEO_ASPECT_IMAGE;
 }
@@ -386,7 +387,7 @@ static enum tpg_pixel_aspect vivid_get_pixel_aspect(const struct vivid_dev *dev)
  */
 void vivid_update_format_cap(struct vivid_dev *dev, bool keep_controls)
 {
-	struct v4l2_bt_timings *bt = &dev->dv_timings_cap.bt;
+	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
 	unsigned size;
 	u64 pixelclock;
 
@@ -486,8 +487,8 @@ static enum v4l2_field vivid_field_cap(struct vivid_dev *dev, enum v4l2_field fi
 		}
 	}
 	if (vivid_is_hdmi_cap(dev))
-		return dev->dv_timings_cap.bt.interlaced ? V4L2_FIELD_ALTERNATE :
-						       V4L2_FIELD_NONE;
+		return dev->dv_timings_cap[dev->input].bt.interlaced ?
+			V4L2_FIELD_ALTERNATE : V4L2_FIELD_NONE;
 	return V4L2_FIELD_NONE;
 }
 
@@ -1310,10 +1311,10 @@ int vidioc_enum_input(struct file *file, void *priv,
 				dev->input_name_counter[inp->index]);
 		inp->capabilities = V4L2_IN_CAP_DV_TIMINGS;
 		if (dev->edid_blocks == 0 ||
-		    dev->dv_timings_signal_mode == NO_SIGNAL)
+		    dev->dv_timings_signal_mode[dev->input] == NO_SIGNAL)
 			inp->status |= V4L2_IN_ST_NO_SIGNAL;
-		else if (dev->dv_timings_signal_mode == NO_LOCK ||
-			 dev->dv_timings_signal_mode == OUT_OF_RANGE)
+		else if (dev->dv_timings_signal_mode[dev->input] == NO_LOCK ||
+			 dev->dv_timings_signal_mode[dev->input] == OUT_OF_RANGE)
 			inp->status |= V4L2_IN_ST_NO_H_LOCK;
 		break;
 	}
@@ -1353,7 +1354,7 @@ int vidioc_g_input(struct file *file, void *priv, unsigned *i)
 int vidioc_s_input(struct file *file, void *priv, unsigned i)
 {
 	struct vivid_dev *dev = video_drvdata(file);
-	struct v4l2_bt_timings *bt = &dev->dv_timings_cap.bt;
+	struct v4l2_bt_timings *bt = &dev->dv_timings_cap[dev->input].bt;
 	unsigned brightness;
 
 	if (i >= dev->num_inputs)
@@ -1407,6 +1408,20 @@ int vidioc_s_input(struct file *file, void *priv, unsigned i)
 	v4l2_ctrl_modify_range(dev->brightness,
 			128 * i, 255 + 128 * i, 1, 128 + 128 * i);
 	v4l2_ctrl_s_ctrl(dev->brightness, brightness);
+
+	/* Restore per-input states. */
+	v4l2_ctrl_activate(dev->ctrl_dv_timings_signal_mode,
+			   vivid_is_hdmi_cap(dev));
+	v4l2_ctrl_activate(dev->ctrl_dv_timings, vivid_is_hdmi_cap(dev) &&
+			   dev->dv_timings_signal_mode[dev->input] ==
+			   SELECTED_DV_TIMINGS);
+	if (vivid_is_hdmi_cap(dev)) {
+		v4l2_ctrl_s_ctrl(dev->ctrl_dv_timings_signal_mode,
+				 dev->dv_timings_signal_mode[dev->input]);
+		v4l2_ctrl_s_ctrl(dev->ctrl_dv_timings,
+				 dev->query_dv_timings[dev->input]);
+	}
+
 	return 0;
 }
 
@@ -1676,12 +1691,13 @@ int vivid_vid_cap_s_dv_timings(struct file *file, void *_fh,
 	    !valid_cvt_gtf_timings(timings))
 		return -EINVAL;
 
-	if (v4l2_match_dv_timings(timings, &dev->dv_timings_cap, 0, false))
+	if (v4l2_match_dv_timings(timings, &dev->dv_timings_cap[dev->input],
+				  0, false))
 		return 0;
 	if (vb2_is_busy(&dev->vb_vid_cap_q))
 		return -EBUSY;
 
-	dev->dv_timings_cap = *timings;
+	dev->dv_timings_cap[dev->input] = *timings;
 	vivid_update_format_cap(dev, false);
 	return 0;
 }
@@ -1690,26 +1706,31 @@ int vidioc_query_dv_timings(struct file *file, void *_fh,
 				    struct v4l2_dv_timings *timings)
 {
 	struct vivid_dev *dev = video_drvdata(file);
+	unsigned int input = dev->input;
+	unsigned int last = dev->query_dv_timings_last[input];
 
 	if (!vivid_is_hdmi_cap(dev))
 		return -ENODATA;
-	if (dev->dv_timings_signal_mode == NO_SIGNAL ||
+	if (dev->dv_timings_signal_mode[input] == NO_SIGNAL ||
 	    dev->edid_blocks == 0)
 		return -ENOLINK;
-	if (dev->dv_timings_signal_mode == NO_LOCK)
+	if (dev->dv_timings_signal_mode[input] == NO_LOCK)
 		return -ENOLCK;
-	if (dev->dv_timings_signal_mode == OUT_OF_RANGE) {
+	if (dev->dv_timings_signal_mode[input] == OUT_OF_RANGE) {
 		timings->bt.pixelclock = vivid_dv_timings_cap.bt.max_pixelclock * 2;
 		return -ERANGE;
 	}
-	if (dev->dv_timings_signal_mode == CURRENT_DV_TIMINGS) {
-		*timings = dev->dv_timings_cap;
-	} else if (dev->dv_timings_signal_mode == SELECTED_DV_TIMINGS) {
-		*timings = v4l2_dv_timings_presets[dev->query_dv_timings];
+	if (dev->dv_timings_signal_mode[input] == CURRENT_DV_TIMINGS) {
+		*timings = dev->dv_timings_cap[input];
+	} else if (dev->dv_timings_signal_mode[input] ==
+		   SELECTED_DV_TIMINGS) {
+		*timings =
+			v4l2_dv_timings_presets[dev->query_dv_timings[input]];
 	} else {
-		*timings = v4l2_dv_timings_presets[dev->query_dv_timings_last];
-		dev->query_dv_timings_last = (dev->query_dv_timings_last + 1) %
-						dev->query_dv_timings_size;
+		*timings =
+			v4l2_dv_timings_presets[last];
+		dev->query_dv_timings_last[input] =
+			(last + 1) % dev->query_dv_timings_size;
 	}
 	return 0;
 }
diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
index 9307ce1cdd16..98c0e5b4d391 100644
--- a/drivers/media/platform/vivid/vivid-vid-common.c
+++ b/drivers/media/platform/vivid/vivid-vid-common.c
@@ -823,7 +823,7 @@ int vidioc_g_dv_timings(struct file *file, void *_fh,
 	if (vdev->vfl_dir == VFL_DIR_RX) {
 		if (!vivid_is_hdmi_cap(dev))
 			return -ENODATA;
-		*timings = dev->dv_timings_cap;
+		*timings = dev->dv_timings_cap[dev->input];
 	} else {
 		if (!vivid_is_hdmi_out(dev))
 			return -ENODATA;
-- 
2.19.1

