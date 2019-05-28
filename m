Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790A42CBAE
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfE1QTv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:19:51 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42340 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfE1QTu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:19:50 -0400
Received: by mail-ed1-f68.google.com with SMTP id g24so4681954eds.9
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 09:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=whUELaBiLoKOS1VsPI86n4TCafSUCO6vv98fgHZdlOc=;
        b=KdTG4Fsh5NcX93ZJ5yK17Ml6KVWLkausbgdZhfSPrzi02iDjJd5F8VN6qMXzamJOlK
         uvQZ6TtPJjuhawpjIMvXbn+kNsXOtmoJTHnrAmPg5qmdlgM9YbE60sdn6n0Fl7LfOLAf
         7DKRPKWdTrIDEl7g/ypYdEELFhHXSgWjb2QSeDHGcp5Lu/8dd7V1AHyOdBKYC36kzJXw
         sDVKpNatp9/QYKMipy4UD26pU4qTn4ULbvGCiVXLwAmvWNQ6udvAdbt07HujeriYUj2A
         MwZCESwbh/m9rb2ooExUEOLV3zYNXXT1O+2IFdAhqTvx9a3H3BFxqfGC0U3BgxyJ7VEc
         QHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=whUELaBiLoKOS1VsPI86n4TCafSUCO6vv98fgHZdlOc=;
        b=i9iKDpQB6HFxuEf0sJb99QvqtPkU3bG5VEEaDMjZTjcF7uuLO/DHGYSs8BOwWC0j3B
         T65p+GqHrW1b2euBLKCvaUA05tEo7M04vElwfhrtJwgMh7ZQylnAVNogvxUBIccyr3jz
         8lCPVsJK0n54SObuV1X7wlTlKUEDGXgnK/tCYZKtNs2LzEW4cqmcaq4OB6EuUzaRUnYe
         x7njsZfnNCSIpY6hggh5wON3dp8js/gtMJO/JhQuG9QhkLPKwDyGrJTTex1j3vdRbUya
         BWM1XW26MY/grVdsPNI9En7GhOGsTVS36W/uaamTwAkhvG+cn7SZVLV9lHgjECkUyOqg
         UBfw==
X-Gm-Message-State: APjAAAUKYaizCUEQ4CNy6Sl3dIpxN8zf9iJof7qDDf3xgQNhUAYLcPwV
        JqEf5U93EeoKqbeBfbkNebmc/uMDka8=
X-Google-Smtp-Source: APXvYqxT6T75vAKnwhOTeDXHLTysM44F4opO+9YIySIMSRhRiZkvS+dLjfGlRN41611ozQAu1BVwMA==
X-Received: by 2002:aa7:c5d2:: with SMTP id h18mr87897585eds.110.1559060388680;
        Tue, 28 May 2019 09:19:48 -0700 (PDT)
Received: from ubuntu.localdomain ([173.38.220.62])
        by smtp.gmail.com with ESMTPSA id c38sm4313002edc.22.2019.05.28.09.19.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:19:48 -0700 (PDT)
From:   johan.korsnes@gmail.com
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH 5/8] media: vivid: add HDMI (dis)connect TX emulation
Date:   Tue, 28 May 2019 10:19:09 -0700
Message-Id: <20190528171912.3688-6-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528171912.3688-1-johan.korsnes@gmail.com>
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Johan Korsnes <johan.korsnes@gmail.com>

Adds the following bitmask controls:
-V4L2_CID_DV_TX_EDID_PRESENT
-V4L2_CID_DV_TX_HOTPLUG
-V4L2_CID_DV_TX_RXSENSE

The bitmasks are all set based on the custom vivid DISPLAY_PRESENT
control. This also removes 2/2 v4l2-compliance warnings for vivid
output device.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.h  |  3 +++
 drivers/media/platform/vivid/vivid-ctrls.c | 25 +++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vivid/vivid-core.h b/drivers/media/platform/vivid/vivid-core.h
index 1d04b7209f2b..b7307cbba2a5 100644
--- a/drivers/media/platform/vivid/vivid-core.h
+++ b/drivers/media/platform/vivid/vivid-core.h
@@ -248,6 +248,9 @@ struct vivid_dev {
 	struct v4l2_ctrl		*ctrl_has_scaler_out;
 	struct v4l2_ctrl		*ctrl_tx_mode;
 	struct v4l2_ctrl		*ctrl_tx_rgb_range;
+	struct v4l2_ctrl		*ctrl_tx_edid_present;
+	struct v4l2_ctrl		*ctrl_tx_hotplug;
+	struct v4l2_ctrl		*ctrl_tx_rxsense;
 
 	struct v4l2_ctrl		*radio_tx_rds_pi;
 	struct v4l2_ctrl		*radio_tx_rds_pty;
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index 67a330f15552..5cb7232a8278 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -912,6 +912,8 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_out);
 	struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
+	u32 display_present = 0;
+	unsigned i, j;
 
 	switch (ctrl->id) {
 	case VIVID_CID_HAS_CROP_OUT:
@@ -950,6 +952,15 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 			break;
 
 		dev->display_present[dev->output] = ctrl->val;
+
+		for (i = 0, j = 0; i < dev->num_outputs; i++)
+			if (dev->output_type[i] == HDMI)
+				display_present |=
+					dev->display_present[i] << j++;
+
+		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, display_present);
+		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_rxsense, display_present);
+		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, display_present);
 		break;
 	}
 	return 0;
@@ -1592,7 +1603,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			V4L2_CID_DV_RX_RGB_RANGE, V4L2_DV_RGB_RANGE_FULL,
 			0, V4L2_DV_RGB_RANGE_AUTO);
 	}
-	if (has_hdmi && dev->has_vid_out) {
+	if (dev->num_hdmi_outputs) {
 		/*
 		 * We aren't doing anything with this at the moment, but
 		 * HDMI outputs typically have this controls.
@@ -1605,6 +1616,18 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			0, V4L2_DV_TX_MODE_HDMI);
 		dev->ctrl_display_present = v4l2_ctrl_new_custom(hdl_vid_out,
 			&vivid_ctrl_display_present, NULL);
+		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
+			NULL, V4L2_CID_DV_TX_HOTPLUG, 0,
+			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
+			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
+			NULL, V4L2_CID_DV_TX_RXSENSE, 0,
+			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
+			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
+			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
+			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
+			(2 << (dev->num_hdmi_outputs - 1)) - 1);
 	}
 	if ((dev->has_vid_cap && dev->has_vid_out) ||
 	    (dev->has_vbi_cap && dev->has_vbi_out))
-- 
2.17.1

