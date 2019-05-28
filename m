Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADF1D2CBAA
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfE1QTr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:19:47 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33705 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfE1QTq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:19:46 -0400
Received: by mail-ed1-f65.google.com with SMTP id n17so32661665edb.0
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Tn09DCVhs608C7/xrElWyIfonV79qaa6OOafPQNFFsw=;
        b=AyNmSkqaW8ERZcBslkNKnCHfffF2DVDNPRbUkSmCzcy+Uv05bhIsZ7HSUAjOe2Ny3n
         7itHWTLaLdcy0sKKD6XOOnYbUyQwx5EYxW2QUt27zMYx/S4Yq5scg/h+KtK5D2x3T1hI
         p8CwBpjxGzJVHt6qn4M538WwbAF0wG/3s+F5fdWShlDNNJfnuZfKOqN73vdNszEViSeP
         KkC36IGVsltZlaBA3AOEDvtG3bknNriaplqRqIyidwdqP95SgbHcEfhFVJfTLZKEO05o
         TjOr6lpG4rza0xYjF1qYx1mnTfMeapkFRSbRti3fdxXqC6imdgQ7GiWlteiujU8GSJHc
         SCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Tn09DCVhs608C7/xrElWyIfonV79qaa6OOafPQNFFsw=;
        b=YMrQi5tpG/fZouKZZuVNDN6XzB/cx+0VAICHUrcbjKZqpsM950hfTvZLRs+EIBdGn9
         JAWs6LVDDtfAxXaj3H4kgBw+KOnkFU5eyn9qt0ig5XOBHfKbIH6jTiyjT2TvGwLZt506
         uByzujep0TVdZqufXtHG1DDPR35kPrCAPWekPC2GGpcEkGEFfRvzjUxRnlX9v6M4x9MN
         gzqoS2qPkieoc8AuQpnD6a9KHWMX0BbTiZzCUal/xXJo16W4Qwfbu08T1IJ8vIVT4k75
         5vMZ6ynBEaFqHQ5TgpQHF0Y2fwIqomA/oCYD+StZeykNS+qRZhCnqyoPPKXWvPzv45dI
         wQoQ==
X-Gm-Message-State: APjAAAUAvc5isKZFcDjU7XkMJ7aKR++DWuKadGxjWRr2e+U/2X0OTh3E
        S7+uSYSW+oTc+xMqXLEsLLXLdGvDmEY=
X-Google-Smtp-Source: APXvYqwJ5pP64w1aHFhb19GRVxQIpvKWvJoO7p6K9SQ3DeGofmTxNrOGpf4eAJOkKnnuzCX3LAEwGQ==
X-Received: by 2002:a50:a3b5:: with SMTP id s50mr131221439edb.149.1559060384856;
        Tue, 28 May 2019 09:19:44 -0700 (PDT)
Received: from ubuntu.localdomain ([173.38.220.62])
        by smtp.gmail.com with ESMTPSA id c38sm4313002edc.22.2019.05.28.09.19.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:19:44 -0700 (PDT)
From:   johan.korsnes@gmail.com
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH 1/8] media: vivid: make input dv_timings per-input
Date:   Tue, 28 May 2019 10:19:05 -0700
Message-Id: <20190528171912.3688-2-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528171912.3688-1-johan.korsnes@gmail.com>
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Johan Korsnes <johan.korsnes@gmail.com>

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
index 7047df6f0e0e..49cc3b429b48 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -1007,7 +1007,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		tvnorms_cap = V4L2_STD_ALL;
 	if (dev->output_type[0] == SVID)
 		tvnorms_out = V4L2_STD_ALL;
-	dev->dv_timings_cap = def_dv_timings;
+	for (i = 0; i < MAX_INPUTS; i++)
+		dev->dv_timings_cap[i] = def_dv_timings;
 	dev->dv_timings_out = def_dv_timings;
 	dev->tv_freq = 2804 /* 175.25 * 16 */;
 	dev->tv_audmode = V4L2_TUNER_MODE_STEREO;
@@ -1037,6 +1038,15 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
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
index 6697c7009629..a77c548f47d8 100644
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
+	unsigned			query_dv_timings_last[MAX_INPUTS];
+	unsigned			query_dv_timings[MAX_INPUTS];
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
index 530ac8decb25..f4354c800088 100644
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
+	unsigned input = dev->input;
 
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
+			v4l2_dv_timings_presets[dev->query_dv_timings_last[input]];
+		dev->query_dv_timings_last[input] =
+			(dev->query_dv_timings_last[input] + 1) %
+			dev->query_dv_timings_size;
 	}
 	return 0;
 }
diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
index 74b83bcc6119..1d6576ac539b 100644
--- a/drivers/media/platform/vivid/vivid-vid-common.c
+++ b/drivers/media/platform/vivid/vivid-vid-common.c
@@ -843,7 +843,7 @@ int vidioc_g_dv_timings(struct file *file, void *_fh,
 	if (vdev->vfl_dir == VFL_DIR_RX) {
 		if (!vivid_is_hdmi_cap(dev))
 			return -ENODATA;
-		*timings = dev->dv_timings_cap;
+		*timings = dev->dv_timings_cap[dev->input];
 	} else {
 		if (!vivid_is_hdmi_out(dev))
 			return -ENODATA;
-- 
2.17.1

