Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7194765E
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfFPSXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:23:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39379 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfFPSXQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:23:16 -0400
Received: by mail-lf1-f65.google.com with SMTP id p24so4900242lfo.6
        for <linux-media@vger.kernel.org>; Sun, 16 Jun 2019 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fnTVyYahKWFPMJKeD8cm3G5tqzY0S8/+9zqNy64vgwE=;
        b=VIe/5aPkD+QGD13z5gPoDCW6AUsDC5Zw2VHLGUQ+oDaPonMB0ccVLolLytsvewXCaw
         4qqsciqpDvisw1oapLrReeAJlFVjNx6u+Qp/robG3q/rGLHJtL0+Kv3/fEMqIkyRNpSH
         g6bSqItkJNwAG6s+dmH29ayMp+ihoInGLkR9SEPfrYu9+/vNoIFuylJGQvtWSDC0INp7
         3A6nVeOodcXdV48exd7Kcjmd2EBwjgiTkR5hR3vqyx3bwz9oviC8VcQAPFwygFVZ+bKp
         8Zx/OMci6ba20cV5aBm+KAlsMIyhYv7W2Skzru4DanexwtfAI4AqSuVjbibdTy/B+5il
         5gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fnTVyYahKWFPMJKeD8cm3G5tqzY0S8/+9zqNy64vgwE=;
        b=EFVa7/oaX6LkYcrQAs9n390yiruSvPoInsE39r0dn/d1nvsv1OvkbhJVI/E1uk6+So
         3NVVUvHKgJlzJ9HvcXMoS1V+xrI+IIMoivT/1ZOqYkIe6x7egn7ygy6uXml9cb1OoCsK
         sUnZ9DesMiTUDfBd7roj0RxI2Wpp1yC07e31ky30Iy8MDO/xZ3B7otUdgS5ItmTdFfhL
         p9RkUL0MpXm/GW7Cw8UjzGt456ElZRY0yT7V2aBD1HGtCalcgA1/A+REGqEQcrorIPjQ
         UWjLioXmRLVJMkEzzx1VTovvxnmahLrAskeNagm8A44XNMiROix0BSnBC4XpPFrg0SJW
         Ev+A==
X-Gm-Message-State: APjAAAWNJZGYmQGp5vskvLwZ9qYblEqAfBlue8QCm8k8HVylZrAiEg4f
        Ws0j6E0kAU4Hr5t0/r9rftxPwUHSbVc=
X-Google-Smtp-Source: APXvYqxPchESvDlKexhjtBzQA9nbQuDVIs0X92khh+PFT/4hs3y9k+/isW7HbFA14hFamixmtA9yWA==
X-Received: by 2002:a05:6512:144:: with SMTP id m4mr54510359lfo.114.1560709394505;
        Sun, 16 Jun 2019 11:23:14 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id z85sm1714081ljb.101.2019.06.16.11.23.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:23:13 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v2 6/9] media: vivid: add HDMI (dis)connect RX emulation
Date:   Sun, 16 Jun 2019 11:22:15 -0700
Message-Id: <20190616182218.37726-7-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616182218.37726-1-johan.korsnes@gmail.com>
References: <20190616182218.37726-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds the following bitmask control:
-V4L2_CID_DV_RX_POWER_PRESENT

The RX_POWER_PRESENT bitmask is set based on the digital video timings
signal mode. This also removes 1/1 warnings for v4l2-compliance test on
vivid instance with HDMI input.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.h  |  4 ++++
 drivers/media/platform/vivid/vivid-ctrls.c | 19 +++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index b7307cbba2a5..f5ad92c376f7 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -252,6 +252,8 @@ struct vivid_dev {
 	struct v4l2_ctrl		*ctrl_tx_hotplug;
 	struct v4l2_ctrl		*ctrl_tx_rxsense;
 
+	struct v4l2_ctrl		*ctrl_rx_power_present;
+
 	struct v4l2_ctrl		*radio_tx_rds_pi;
 	struct v4l2_ctrl		*radio_tx_rds_pty;
 	struct v4l2_ctrl		*radio_tx_rds_mono_stereo;
@@ -335,6 +337,8 @@ struct vivid_dev {
 	unsigned			tv_field_cap;
 	unsigned			tv_audio_input;
 
+	u32				power_present;
+
 	/* Capture Overlay */
 	struct v4l2_framebuffer		fb_cap;
 	struct v4l2_fh			*overlay_cap_owner;
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index 5cb7232a8278..ae3690fd1b52 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -358,7 +358,7 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		V4L2_COLORSPACE_470_SYSTEM_BG,
 	};
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_cap);
-	unsigned i;
+	unsigned i, j;
 
 	switch (ctrl->id) {
 	case VIVID_CID_TEST_PATTERN:
@@ -472,6 +472,16 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 			dev->ctrl_dv_timings_signal_mode->val;
 		dev->query_dv_timings[dev->input] = dev->ctrl_dv_timings->val;
 
+		dev->power_present = 0;
+		for (i = 0, j = 0; i < ARRAY_SIZE(dev->dv_timings_signal_mode); i++)
+			if (dev->input_type[i] == HDMI) {
+				if (dev->dv_timings_signal_mode[i] != NO_SIGNAL)
+					dev->power_present |= (1 << j);
+				j++;
+			}
+		__v4l2_ctrl_s_ctrl(dev->ctrl_rx_power_present,
+				   dev->power_present);
+
 		v4l2_ctrl_activate(dev->ctrl_dv_timings,
 			dev->dv_timings_signal_mode[dev->input] ==
 				SELECTED_DV_TIMINGS);
@@ -1582,7 +1592,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			v4l2_ctrl_new_custom(hdl_vbi_cap, &vivid_ctrl_vbi_cap_interlaced, NULL);
 	}
 
-	if (has_hdmi && dev->has_vid_cap) {
+	if (dev->num_hdmi_inputs) {
 		dev->ctrl_dv_timings_signal_mode = v4l2_ctrl_new_custom(hdl_vid_cap,
 					&vivid_ctrl_dv_timings_signal_mode, NULL);
 
@@ -1602,6 +1612,11 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			&vivid_vid_cap_ctrl_ops,
 			V4L2_CID_DV_RX_RGB_RANGE, V4L2_DV_RGB_RANGE_FULL,
 			0, V4L2_DV_RGB_RANGE_AUTO);
+		dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
+			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0,
+			(2 << (dev->num_hdmi_inputs - 1)) - 1, 0,
+			(2 << (dev->num_hdmi_inputs - 1)) - 1);
+
 	}
 	if (dev->num_hdmi_outputs) {
 		/*
-- 
2.19.1

