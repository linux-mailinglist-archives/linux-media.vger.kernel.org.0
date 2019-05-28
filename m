Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4492CBB0
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 18:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbfE1QTx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 12:19:53 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33891 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfE1QTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 12:19:52 -0400
Received: by mail-ed1-f67.google.com with SMTP id p27so32668684eda.1
        for <linux-media@vger.kernel.org>; Tue, 28 May 2019 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nyCFncznA7GU6X7PDb87G6p1kZ3meol8JkyFiTWY6TA=;
        b=AgaejSgk3CYFpCZlikKk2xka476KW9L37GpZTckvpPWPmxyUM5FpZXh5Te1YbIm6N/
         8suerUzj3TzRcStARnTVz5RLNgJSGZKg9DdMKzvHySuADG89VeaoKVdmAX7kNpoXbK19
         yZVg9nHHPKG687wyS70Fs0YydyqAo5b+xLonDGg7z3QV3wU0qkIaiU0YLGsZVexqjsKV
         scU45mDI1dyVCFohoJ6mLXhWw2Fa66YaFhpviYcAanP5n9zv8uDlgHT0KA29G9QVeqtT
         ujVczZj833keF2mmTv0tVrdlYK8ZU24Y5F8TbBIFEKUYE59rFVxzPfJ3Zun7Fpo4FibG
         emDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nyCFncznA7GU6X7PDb87G6p1kZ3meol8JkyFiTWY6TA=;
        b=AyPVK5xrAT2CANSa2Y5rDwMDiNuEJGaE3xRvj5pFA95xfPXnUrltbNHPwcJSxkmw5I
         RrfbUmizJtYwhiiPjGI6WQUBIGmb+xNjoHYkX+LCuM3lv+QyNeDozy4IbcgPxGYyba4H
         KlIGfVg5yTGuvtZOpqEB/BRIv5IFJJlIQRlGCawTWS6i+7Aq3HOB43KtSFobEgFbrw/Y
         ZLiOX1UURLqhHf1va8t2ANOG9acP9xnMP15fsvqTVeMXksUEBeZ/tp/hySxMeqOB6Z2K
         37U8lQb00ciK/mtdAEdXAWsuGOP04nz8jZzVT2RRYK4KY3eJpJtdADf5oq99UMn+DUiJ
         9qcA==
X-Gm-Message-State: APjAAAWmtq6iWErRoQd0wyTLbYKdQdOLqvHpae8RQ7+fSkKobZQAW34b
        VrjPQrY2XgkQeIFZCwgfOO5S0Wh/mJ4=
X-Google-Smtp-Source: APXvYqyjOye+ZjGwrto/8X3ev0jVXWNKFW+VUV24vtWdkKzyOm12NpE23wn2+YBu1LbEeOy5ZDT0ZA==
X-Received: by 2002:aa7:d711:: with SMTP id t17mr130439970edq.80.1559060390691;
        Tue, 28 May 2019 09:19:50 -0700 (PDT)
Received: from ubuntu.localdomain ([173.38.220.62])
        by smtp.gmail.com with ESMTPSA id c38sm4313002edc.22.2019.05.28.09.19.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 09:19:50 -0700 (PDT)
From:   johan.korsnes@gmail.com
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH 7/8] media: vivid: add CEC support to display present ctrl
Date:   Tue, 28 May 2019 10:19:11 -0700
Message-Id: <20190528171912.3688-8-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528171912.3688-1-johan.korsnes@gmail.com>
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Johan Korsnes <johan.korsnes@gmail.com>

Set/invalidate physical addresses based on the configuration of the
display present control. This is relevant not only when the display
present control is modified, but also when the Vivid instance EDID is
set/cleared.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-core.c     | 16 ++++++------
 drivers/media/platform/vivid/vivid-ctrls.c    | 25 ++++++++++++++++---
 drivers/media/platform/vivid/vivid-vid-cap.c  |  6 ++++-
 .../media/platform/vivid/vivid-vid-common.c   |  2 ++
 4 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
index b2b4ee48cef0..ca46ac24f51e 100644
--- a/drivers/media/platform/vivid/vivid-core.c
+++ b/drivers/media/platform/vivid/vivid-core.c
@@ -1060,14 +1060,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	vivid_update_format_cap(dev, false);
 	vivid_update_format_out(dev);
 
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
-	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
-
 	/* initialize overlay */
 	dev->fb_cap.fmt.width = dev->src_rect.width;
 	dev->fb_cap.fmt.height = dev->src_rect.height;
@@ -1488,6 +1480,14 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	}
 #endif
 
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
+	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
+
 	/* Now that everything is fine, let's add it to device list */
 	vivid_devs[inst] = dev;
 
diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index ae3690fd1b52..e4758a2837e6 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -18,6 +18,7 @@
 #include "vivid-radio-common.h"
 #include "vivid-osd.h"
 #include "vivid-ctrls.h"
+#include "vivid-cec.h"
 
 #define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
 #define VIVID_CID_BUTTON		(VIVID_CID_CUSTOM_BASE + 0)
@@ -923,7 +924,7 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_out);
 	struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
 	u32 display_present = 0;
-	unsigned i, j;
+	unsigned i, j, bus_idx;
 
 	switch (ctrl->id) {
 	case VIVID_CID_HAS_CROP_OUT:
@@ -962,15 +963,31 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 			break;
 
 		dev->display_present[dev->output] = ctrl->val;
-
 		for (i = 0, j = 0; i < dev->num_outputs; i++)
 			if (dev->output_type[i] == HDMI)
 				display_present |=
 					dev->display_present[i] << j++;
 
-		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, display_present);
 		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_rxsense, display_present);
-		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, display_present);
+
+		if (dev->edid_blocks) {
+			__v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present,
+					   display_present);
+			__v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug,
+					   display_present);
+		}
+
+		if (dev->cec_tx_adap == NULL)
+			break;
+
+		bus_idx = dev->cec_output2bus_map[dev->output];
+		if (ctrl->val && dev->edid_blocks)
+			cec_s_phys_addr(dev->cec_tx_adap[bus_idx],
+					dev->cec_tx_adap[bus_idx]->phys_addr,
+					false);
+		else
+			cec_phys_addr_invalidate(dev->cec_tx_adap[bus_idx]);
+
 		break;
 	}
 	return 0;
diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
index ca15c13abf6c..920be638da83 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -1760,6 +1760,7 @@ int vidioc_s_edid(struct file *file, void *_fh,
 		return -EINVAL;
 	if (edid->blocks == 0) {
 		dev->edid_blocks = 0;
+		v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, false);
 		phys_addr = CEC_PHYS_ADDR_INVALID;
 		goto set_phys_addr;
 	}
@@ -1777,6 +1778,7 @@ int vidioc_s_edid(struct file *file, void *_fh,
 
 	dev->edid_blocks = edid->blocks;
 	memcpy(dev->edid, edid->edid, edid->blocks * 128);
+	v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, true);
 
 set_phys_addr:
 	/* TODO: a proper hotplug detect cycle should be emulated here */
@@ -1784,7 +1786,9 @@ int vidioc_s_edid(struct file *file, void *_fh,
 
 	for (i = 0; i < MAX_OUTPUTS && dev->cec_tx_adap[i]; i++)
 		cec_s_phys_addr(dev->cec_tx_adap[i],
-				v4l2_phys_addr_for_input(phys_addr, i + 1),
+				dev->display_present[i] ?
+				v4l2_phys_addr_for_input(phys_addr, i + 1) :
+				CEC_PHYS_ADDR_INVALID,
 				false);
 	return 0;
 }
diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
index b6882426fc12..0addf8ef7dbf 100644
--- a/drivers/media/platform/vivid/vivid-vid-common.c
+++ b/drivers/media/platform/vivid/vivid-vid-common.c
@@ -907,6 +907,8 @@ int vidioc_g_edid(struct file *file, void *_fh,
 			return -EINVAL;
 		if (dev->output_type[edid->pad] != HDMI)
 			return -EINVAL;
+		if (!dev->display_present[dev->output])
+			return -ENODATA;
 		bus_idx = dev->cec_output2bus_map[edid->pad];
 		adap = dev->cec_tx_adap[bus_idx];
 	}
-- 
2.17.1

