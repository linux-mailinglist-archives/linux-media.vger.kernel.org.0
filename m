Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0573949540
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 00:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfFQWjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 18:39:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36656 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfFQWja (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 18:39:30 -0400
Received: by mail-lf1-f65.google.com with SMTP id q26so7770849lfc.3
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 15:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8Ee+wVZquNUAxJdxa7cThKIZKlz2CcWN6snPlvX3PQ=;
        b=IMR0OGuPFM96lwsE3Zrjc6rTX6zmBezlHSm+r+UvT8Q4mscH43K1HOAygXHxT5yR6z
         5afLjdAThCmI9YooOfyw8pxn14GSClYiyT/NMBSW0lmomhOxhWhsdKPjYt2p91S9DPx/
         9QUw4jmgIl9GHJaHvm1I01x63/6P5j4abyWTFZQ/MCU1zzhE76lndtLoazGAS3TEpBEi
         13WWWZ14O1TrjSxP016dCoku1SHR6Q5KZUAsPbsCDNEA4menLnle1F9Jdyyuyvg36DFJ
         lswUIdEIBmRLA73elZqDg8mYxfhsjUbbMWP0GkxMtPVlkCqUc81Tucd8if5AGrklvEAu
         uo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8Ee+wVZquNUAxJdxa7cThKIZKlz2CcWN6snPlvX3PQ=;
        b=XwRgxCEqL6hLO9odqiu/mvk4H+nEtAQ6ic4PbO0JXE+oMw/VED772CNtMVZwkFW4X9
         /gwQ/SSFTsleRmCsC8OjOSoo7MQ/CHgskdVsCkTOy3Pq10TEh9aO8aet9NOJj+7uMjo8
         J7enZlTr21eb2A1W3bWiFrMCp3GiG1U3nx8d/7b+wC3hASl17IF1eAbgfGXy6CyCXP75
         oJe8jL7N9gnQ/I9wvYDgy2fJLEH9SKH3KOdX/7JlpMYaxwdqNmmr635pP1eq1yt8gbld
         7zU3vXgHc80JNBSK/tWsKc0yu0yemjc0Ai1FRlFia/Eo+W1V+n6et5tpUD9fva+oI8u7
         xXQg==
X-Gm-Message-State: APjAAAVgSYSwdgg+8fUJV7ZfFhJVCliEjJ3HKNx9qpgtlbCg5IljBJ4s
        LQ29NcUP0MpAjpNBTTwAkXSIapiiiKEQyg==
X-Google-Smtp-Source: APXvYqzdV6qAkh3Sk91eZfNQ8Wv0HxtWRCZCuPjgNsLv+j8nRjslFB1SRCwVWuKO4HO0vlz4IEfLBg==
X-Received: by 2002:ac2:43bb:: with SMTP id t27mr36140369lfl.187.1560811167380;
        Mon, 17 Jun 2019 15:39:27 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id i23sm2287347ljb.7.2019.06.17.15.39.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 15:39:26 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v3 3/9] media: vivid: add display present control
Date:   Tue, 18 Jun 2019 09:37:20 +0200
Message-Id: <20190618073726.61776-4-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190618073726.61776-1-johan.korsnes@gmail.com>
References: <20190618073726.61776-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index 85e6aaf7bf0d..b1d5332b363f 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -730,6 +730,7 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	for (i = 0; i < dev->num_outputs; i++) {
 		dev->output_type[i] = ((output_types[inst] >> i) & 1) ? HDMI : SVID;
 		dev->output_name_counter[i] = out_type_counter[dev->output_type[i]]++;
+		dev->display_present[i] = true;
 	}
 	dev->has_audio_outputs = out_type_counter[SVID];
 	if (out_type_counter[HDMI] == 16) {
@@ -1038,6 +1039,8 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 		goto unreg_dev;
 
 	/* enable/disable interface specific controls */
+	if (dev->num_outputs && dev->output_type[0] != HDMI)
+		v4l2_ctrl_activate(dev->ctrl_display_present, false);
 	if (dev->num_inputs && dev->input_type[0] != HDMI) {
 		v4l2_ctrl_activate(dev->ctrl_dv_timings_signal_mode, false);
 		v4l2_ctrl_activate(dev->ctrl_dv_timings, false);
diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index 84994ff909ea..9cd535570d50 100644
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
index e27103f694c5..6e6e8e0fb4bd 100644
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
 
@@ -1588,6 +1604,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
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
2.19.1

