Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2663C49543
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 00:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfFQWjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 18:39:33 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43938 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfFQWjd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 18:39:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id 16so10945336ljv.10
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ER7DwWnpX64iz4NoLRwKjNvdBmhiTQuP6a7TfB5APHs=;
        b=UvU3BsNjrZ4AW8dbRjucKlvmG6eCv0FHkoalX8YpjscF70NGLs8XYfudvrTgLRrft2
         q9MqTWYT1PHg3wfVc9QVfCvONuZI4U+iOKQG/XOTi9GtwkIJXP16leE6Px3mc6YbTrow
         fCAvKLODnh7XWAbbKPAfe+ojWQd4Nx6HtRZWThKDIBatbgLVDcoku6cPVxZRyUzG/Hgx
         3xtbfjOXp33T3clqNTFHZVq7z/M1JaqeUK5ZnSfZCUJPB/Z+LlT8qqLG9cihfJgfMGsq
         R/ONZuI1OzH6BMfcxdKmk95py95RRP9F90F5lwRVjCW3ALm7J7yZtyjx+yDIeJpy5RmG
         W31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ER7DwWnpX64iz4NoLRwKjNvdBmhiTQuP6a7TfB5APHs=;
        b=RIrR1GJFqcJRBPQLDqYKMhvq65+xHVm7ANZQIGhvisUrCRhYP3iMy7FAjLekd4I2kW
         x2PvloTY+rQ8qqYRuvMf3ul6X8xMJAXx/1A+v66FNz1ltsZOOPjifLtocz+Im+cyliQF
         8hKaBI5Hg95loVvwapO0P4yFujZapn6gieEO6UZpbsc6oQ7LF4LQlZToLIr4ytVXpLhJ
         qksnKCuDrtL6ZRekuou7lr9e57qhL50DVUOuOaTWaUjiiwqXHY8YsuJb/MypA4ANHMms
         LsKLqKFktYDAlEjPaTzaZLtaF/fBNvA+wSQgX9QmULEZ4FXZRx/FuT6nYhFQv6WSUztk
         xh1Q==
X-Gm-Message-State: APjAAAUqWr+cTTf8KTKrjXJus10AH/5+Tc6gdGT9ibMF4zJSXaVjC+Po
        +Lq+2+xMri26FeU3dZUQbYs4fcXtlxTbVA==
X-Google-Smtp-Source: APXvYqx81VHeHZqOlXX7szNlY6SE42RM5vwkXZy+3e6yp4mC+TaHx4mSihDJyIW1536vUxJWEaY58Q==
X-Received: by 2002:a2e:9cd4:: with SMTP id g20mr9793786ljj.205.1560811170952;
        Mon, 17 Jun 2019 15:39:30 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id i23sm2287347ljb.7.2019.06.17.15.39.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 15:39:30 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v3 6/9] media: vivid: add HDMI (dis)connect RX emulation
Date:   Tue, 18 Jun 2019 09:37:23 +0200
Message-Id: <20190618073726.61776-7-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190618073726.61776-1-johan.korsnes@gmail.com>
References: <20190618073726.61776-1-johan.korsnes@gmail.com>
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
 drivers/media/platform/vivid/vivid-ctrls.c | 21 +++++++++++++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index 2900cbe585cd..ecf33957765f 100644
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
index ab25973894b4..ed80ba51441e 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -358,7 +358,7 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 		V4L2_COLORSPACE_470_SYSTEM_BG,
 	};
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_cap);
-	unsigned i;
+	unsigned int i, j;
 
 	switch (ctrl->id) {
 	case VIVID_CID_TEST_PATTERN:
@@ -472,6 +472,18 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
 			dev->ctrl_dv_timings_signal_mode->val;
 		dev->query_dv_timings[dev->input] = dev->ctrl_dv_timings->val;
 
+		dev->power_present = 0;
+		for (i = 0, j = 0;
+		     i < ARRAY_SIZE(dev->dv_timings_signal_mode);
+		     i++)
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
@@ -1583,7 +1595,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			v4l2_ctrl_new_custom(hdl_vbi_cap, &vivid_ctrl_vbi_cap_interlaced, NULL);
 	}
 
-	if (has_hdmi && dev->has_vid_cap) {
+	if (dev->num_hdmi_inputs) {
 		dev->ctrl_dv_timings_signal_mode = v4l2_ctrl_new_custom(hdl_vid_cap,
 					&vivid_ctrl_dv_timings_signal_mode, NULL);
 
@@ -1603,6 +1615,11 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
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

