Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 183FA2CBAD
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbfE1QTu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:19:50 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33876 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfE1QTt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:19:49 -0400
Received: by mail-ed1-f65.google.com with SMTP id p27so32668391eda.1
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 09:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2Liz4NCCkeIBXJzHuCYEdHXabuK8WltPZOXFWQKF9Lk=;
        b=jalgBXwZsJpWeL9E3HwrJxvMQDgU/P7voF2qpNXwtWvw8IkfMlOtvGoCXFdvo+urXG
         RAu4wCv0qzVHuYYlPWONgahgXqnK8RViEcmOh/zznULmV7kKG+mVR4kDhvQIZGbhLyws
         PVT/Drmauo63evOGJk6wHdbhv4oLX0WpMVezstM56s0NTHRBFfz4E6UsddhOdVpQ/wpz
         FU//8RVSLuy/UBFLOBvVkjU8lw2GFqrsSoOfOu1iWvIvLdiagiumrzzyDn9AgNLjBQfk
         Mth1NpufUaSLXKwvwCGBX6V//x71uP1QkAV7ORat05J4iUrWiiT8vDyC1kQ1np/Z/xjN
         NkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2Liz4NCCkeIBXJzHuCYEdHXabuK8WltPZOXFWQKF9Lk=;
        b=iQU9UzGVkNBieWfPXwalgTme+wAntrgtr5TzyVQODBqmi5Jg864oWFL8OZIlWSY7YY
         D/NWtSAhggR+OJ8hNuAX+KI8uGZipwybGMxlx1rQyd1HAhlAj0kYGPCLeD3cseqHAOCq
         gOC7hHlq4DYgJZc892bYtBvVHpTqAnDE5AUEPT/zbcuAsIJgbeU5fx1ptU64pXWYEvg9
         Iwqg1Gckx9gI0Iwf1LJNuACk8BwqJQL7EUnOYi12kgxr6PpoTGRZ9NdbZ2I0bmGb4hLh
         sxt4iVGV21yOX8LgQp20G1TBoKcnHUMgd7sSsg1FSckZU/8faPZh8OB94ZR86vNIR3Wo
         xuKA==
X-Gm-Message-State: APjAAAVF+s6A5ixl1+vmMlP+QpXZWF68j0DJnWmDcx6aBTVOv25PUlEW
        /WC38BL9/B8CIboiYsN5IiVCh3ifxXE=
X-Google-Smtp-Source: APXvYqz7gMtmIbeSsTb06GqFztbuXy7/KZ2IXlF+/bRJVc5AquVG+TovskMFkl0StLcppglmbOhf6g==
X-Received: by 2002:a50:b865:: with SMTP id k34mr131325632ede.16.1559060386621;
        Tue, 28 May 2019 09:19:46 -0700 (PDT)
Received: from ubuntu.localdomain ([173.38.220.62])
        by smtp.gmail.com with ESMTPSA id c38sm4313002edc.22.2019.05.28.09.19.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:19:46 -0700 (PDT)
From:   johan.korsnes@gmail.com
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH 3/8] media: vivid: add display present control
Date:   Tue, 28 May 2019 10:19:07 -0700
Message-Id: <20190528171912.3688-4-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528171912.3688-1-johan.korsnes@gmail.com>
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Johan Korsnes <johan.korsnes@gmail.com>

Add a custom control for selecting the presence of a display connected
to the active output. This control is part of an effort to implement
proper HDMI (dis)connect behavior for vivid.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.c    |  3 +++
 drivers/media/platform/vivid/vivid-core.h    |  2 ++
 drivers/media/platform/vivid/vivid-ctrls.c   | 18 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-vid-out.c |  6 ++++++
 4 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index c4c31d0e006a..20a0dcebd783 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -732,6 +732,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	for (i = 0; i < dev->num_outputs; i++) {
 		dev->output_type[i] = ((output_types[inst] >> i) & 1) ? HDMI : SVID;
 		dev->output_name_counter[i] = out_type_counter[dev->output_type[i]]++;
+		dev->display_present[i] = true;
 	}
 	dev->has_audio_outputs = out_type_counter[SVID];
 	if (out_type_counter[HDMI] == 16) {
@@ -1040,6 +1041,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		goto unreg_dev;
 
 	/* enable/disable interface specific controls */
+	if (dev->num_outputs && dev->output_type[0] != HDMI)
+		v4l2_ctrl_activate(dev->ctrl_display_present, false);
 	if (dev->num_inputs && dev->input_type[0] != HDMI) {
 		v4l2_ctrl_activate(dev->ctrl_dv_timings_signal_mode, false);
 		v4l2_ctrl_activate(dev->ctrl_dv_timings, false);
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index a18fd19215b6..24104df6c444 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -237,6 +237,7 @@ struct vivid_dev {
 		struct v4l2_ctrl	*ctrl_dv_timings_signal_mode;
 		struct v4l2_ctrl	*ctrl_dv_timings;
 	};
+	struct v4l2_ctrl		*ctrl_display_present;
 	struct v4l2_ctrl		*ctrl_has_crop_cap;
 	struct v4l2_ctrl		*ctrl_has_compose_cap;
 	struct v4l2_ctrl		*ctrl_has_scaler_cap;
@@ -361,6 +362,7 @@ struct vivid_dev {
 	u8				*scaled_line;
 	u8				*blended_line;
 	unsigned			cur_scaled_line;
+	bool				display_present[MAX_OUTPUTS];
 
 	/* Output Overlay */
 	void				*fb_vbase_out;
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index 74b2c92fbfa0..67a330f15552 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -68,6 +68,7 @@
 #define VIVID_CID_PERCENTAGE_FILL	(VIVID_CID_VIVID_BASE + 41)
 #define VIVID_CID_REDUCED_FPS		(VIVID_CID_VIVID_BASE + 42)
 #define VIVID_CID_HSV_ENC		(VIVID_CID_VIVID_BASE + 43)
+#define VIVID_CID_DISPLAY_PRESENT	(VIVID_CID_VIVID_BASE + 44)
 
 #define VIVID_CID_STD_SIGNAL_MODE	(VIVID_CID_VIVID_BASE + 60)
 #define VIVID_CID_STANDARD		(VIVID_CID_VIVID_BASE + 61)
@@ -944,6 +945,12 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 		if (dev->loop_video)
 			vivid_send_source_change(dev, HDMI);
 		break;
+	case VIVID_CID_DISPLAY_PRESENT:
+		if (dev->output_type[dev->output] != HDMI)
+			break;
+
+		dev->display_present[dev->output] = ctrl->val;
+		break;
 	}
 	return 0;
 }
@@ -982,6 +989,15 @@ static const struct v4l2_ctrl_config vivid_ctrl_has_scaler_out = {
 	.step = 1,
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_display_present = {
+	.ops = &vivid_vid_out_ctrl_ops,
+	.id = VIVID_CID_DISPLAY_PRESENT,
+	.name = "Display Present",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.max = 1,
+	.def = 1,
+	.step = 1,
+};
 
 /* Streaming Controls */
 
@@ -1587,6 +1603,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 		dev->ctrl_tx_mode = v4l2_ctrl_new_std_menu(hdl_vid_out, NULL,
 			V4L2_CID_DV_TX_MODE, V4L2_DV_TX_MODE_HDMI,
 			0, V4L2_DV_TX_MODE_HDMI);
+		dev->ctrl_display_present = v4l2_ctrl_new_custom(hdl_vid_out,
+			&vivid_ctrl_display_present, NULL);
 	}
 	if ((dev->has_vid_cap && dev->has_vid_out) ||
 	    (dev->has_vbi_cap && dev->has_vbi_out))
diff --git a/drivers/media/platform/vivid/vivid-vid-out.c b/drivers/media/platform/vivid/vivid-vid-out.c
index 9350ca65dd91..148b663a6075 100644
--- a/drivers/media/platform/vivid/vivid-vid-out.c
+++ b/drivers/media/platform/vivid/vivid-vid-out.c
@@ -1094,6 +1094,12 @@ int vidioc_s_output(struct file *file, void *priv, unsigned o)
 
 	dev->vbi_out_dev.tvnorms = dev->vid_out_dev.tvnorms;
 	vivid_update_format_out(dev);
+
+	v4l2_ctrl_activate(dev->ctrl_display_present, vivid_is_hdmi_out(dev));
+	if (vivid_is_hdmi_out(dev))
+		v4l2_ctrl_s_ctrl(dev->ctrl_display_present,
+				 dev->display_present[dev->output]);
+
 	return 0;
 }
 
-- 
2.17.1

