Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2A1549545
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 00:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbfFQWjg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 18:39:36 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33820 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfFQWjg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 18:39:36 -0400
Received: by mail-lj1-f195.google.com with SMTP id p17so11002571ljg.1
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 15:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ABYffBVfdOiWrG/AiRDuBRMHr2SLw9MUxcfKQv7x0Qk=;
        b=nmu5sER8RZd2kPTfpv5evHgbZY4VO4r5LTjM08cTwsG3HLluNWnZID+MwunKib0GvH
         KFmG1RPEuwLKdSgGeeiTW1YQVuLDV+XoQlqJrGTFa9IUKk1CPI61KautJFiMSljZ2j4f
         LX2F40Rjfosbi9+7gWUEPZt4rmFgxS+RRRytHhpZnuskApPxpZ3Wek3ClM0SOH2T55sf
         rh/6C3Mj/HAIbUPDlLclAtK5xYZJV2QMtfzIVzKm0jExKOoB0y4ayXxEi1zbk6bYNAPn
         1pJMDo9ULFJk0AL6+Y9H0gTQcK7G3D3K2bblG+NGG6r7BQD7gsoFKoUcAc0eSuE/fqzq
         R8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ABYffBVfdOiWrG/AiRDuBRMHr2SLw9MUxcfKQv7x0Qk=;
        b=ao/HT/vlraLCqTk9xheG89epZSdFWHpprgQwwFnQKSiG3kmMecAs8pO0bHL5bXnCq6
         BZrwPWGt4WrJb8MopMZIIRLBpfMngn8PCSRLmkdgMa31GuwGNVRbV91ApZshi7y3kfvt
         MTOuEoK7tw/nBoRLmOosBs1Sw6/6pOvxrCNHPrS9rx/uaYNWSDH8+qig6YnjfbJYdAyE
         EvSLqOIAhDexfZmHdGZ4LIumuy+NidEoO68uXkbJ0mxqL3JlHMm2uBlU4wFcTSLlZeEI
         iWGMha4anILVH7eE+kJ6mC+w+sHvPMA4DwW/DZpqPc2bMpgEuLZU6rL5GWvbTRbsKObK
         M7MA==
X-Gm-Message-State: APjAAAXYpDEYSqxj67SbURyXxLnDZMRhttW6Dsp3RCQAEcM7xR1NA3km
        fQm8BRAalliQl4vqWS6kdvKBoDq6TfU73g==
X-Google-Smtp-Source: APXvYqxWX3bgAD3/nP1rwJGjPMlUYQm5l8yFsVnbZsop/nlYZV7resrmtF3uITixkQH3DMDiHij+BQ==
X-Received: by 2002:a2e:658e:: with SMTP id e14mr30387542ljf.147.1560811173222;
        Mon, 17 Jun 2019 15:39:33 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id i23sm2287347ljb.7.2019.06.17.15.39.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 15:39:32 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v3 8/9] media: vivid: add CEC support to display present ctrl
Date:   Tue, 18 Jun 2019 09:37:25 +0200
Message-Id: <20190618073726.61776-9-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190618073726.61776-1-johan.korsnes@gmail.com>
References: <20190618073726.61776-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set/invalidate physical addresses based on the configuration of the
display present control. This is relevant not only when the display
present control is modified, but also when the Vivid instance EDID is
set/cleared.

Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
---
 drivers/media/platform/vivid/vivid-ctrls.c    | 25 ++++++++++++++++---
 drivers/media/platform/vivid/vivid-vid-cap.c  | 17 +++++++++++--
 .../media/platform/vivid/vivid-vid-common.c   |  2 ++
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index ed80ba51441e..3e916c8befb7 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -18,6 +18,7 @@
 #include "vivid-radio-common.h"
 #include "vivid-osd.h"
 #include "vivid-ctrls.h"
+#include "vivid-cec.h"
 
 #define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
 #define VIVID_CID_BUTTON		(VIVID_CID_CUSTOM_BASE + 0)
@@ -925,7 +926,7 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_out);
 	struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
 	u32 display_present = 0;
-	unsigned int i, j;
+	unsigned int i, j, bus_idx;
 
 	switch (ctrl->id) {
 	case VIVID_CID_HAS_CROP_OUT:
@@ -964,15 +965,31 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
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
+		bus_idx = dev->cec_output2bus_map[dev->output];
+		if (!dev->cec_tx_adap[bus_idx])
+			break;
+
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
index 646d228d4a51..7d74afbbda2b 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -1753,7 +1753,8 @@ int vidioc_s_edid(struct file *file, void *_fh,
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	u16 phys_addr;
-	unsigned int i;
+	u32 display_present = 0;
+	unsigned int i, j;
 	int ret;
 
 	memset(edid->reserved, 0, sizeof(edid->reserved));
@@ -1763,6 +1764,8 @@ int vidioc_s_edid(struct file *file, void *_fh,
 		return -EINVAL;
 	if (edid->blocks == 0) {
 		dev->edid_blocks = 0;
+		v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, 0);
+		v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, 0);
 		phys_addr = CEC_PHYS_ADDR_INVALID;
 		goto set_phys_addr;
 	}
@@ -1781,13 +1784,23 @@ int vidioc_s_edid(struct file *file, void *_fh,
 	dev->edid_blocks = edid->blocks;
 	memcpy(dev->edid, edid->edid, edid->blocks * 128);
 
+	for (i = 0, j = 0; i < dev->num_outputs; i++)
+		if (dev->output_type[i] == HDMI)
+			display_present |=
+				dev->display_present[i] << j++;
+
+	v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, display_present);
+	v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, display_present);
+
 set_phys_addr:
 	/* TODO: a proper hotplug detect cycle should be emulated here */
 	cec_s_phys_addr(dev->cec_rx_adap, phys_addr, false);
 
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
index 10a344c29a1a..1f33eb1a76b6 100644
--- a/drivers/media/platform/vivid/vivid-vid-common.c
+++ b/drivers/media/platform/vivid/vivid-vid-common.c
@@ -887,6 +887,8 @@ int vidioc_g_edid(struct file *file, void *_fh,
 			return -EINVAL;
 		if (dev->output_type[edid->pad] != HDMI)
 			return -EINVAL;
+		if (!dev->display_present[edid->pad])
+			return -ENODATA;
 		bus_idx = dev->cec_output2bus_map[edid->pad];
 		adap = dev->cec_tx_adap[bus_idx];
 	}
-- 
2.19.1

