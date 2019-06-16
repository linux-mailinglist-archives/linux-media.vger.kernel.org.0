Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704BB47660
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbfFPSXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:23:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36383 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfFPSXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:23:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id i21so7141074ljj.3
        for <linux-media@vger.kernel.org>; Sun, 16 Jun 2019 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xn+n6GB1S/CzeuOjlk6rSLVQ0iuBHqJ9VhPUaIuAkTk=;
        b=GcJ6RYr6P3qQJZk8N5Cri7rfgwhpqzwxC6JXzG6tdUydBGjMrs+Vn6PHwHFUS9TvHy
         0xlo2Wjlt3542Tkw3qC2QoKPXx4YRLD9gzx2nTKmO2xDZo5LV3YkaLFGjSmIrioeUv+F
         NtMeYzzfLYySzQNsoKYRKsiaPkWsEUcfhnaiwAn0kffVfr2ue7eSmxxVIo10zXNTAh6S
         t2orwZnunfQ+WQRITomJ3ZSJi2Mc3GrtWzaHHz7pXzizLKrf5+0V3Y5fUAxtpYjcM4qU
         wQ85ORNsXeiW183HgYCabyJmLUF3QLTCV2Zeir9JaBRqj8WENMUd2CAvwXpZRvonj40Z
         C4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xn+n6GB1S/CzeuOjlk6rSLVQ0iuBHqJ9VhPUaIuAkTk=;
        b=V3Q44vat7t8RpbXZfnqrEB25H+ZhZMeGB3jo7xtU/BMCg1RENGerEkx0Etn18iW0v0
         Pf6mBOrupmPUIY/dgCd1nDu/ywsanuf5Nw7O7Mh80OHsVsq+W8v+5VT5jBiZKz3SS+s7
         +802l+S65WLP/4t/lYD3jccytBYwWAMexPYC+dGiRvJuskXccKfIhbb+L8t5zxd2sZl2
         laX8DpWhhMm2lMwedfomG2isajS8L+JRyVHAWzQHnAyU2VZzE0YSghD9FpzjVq1riSba
         oNZEy3NHBDn4WgE0yPPIEMR3u2efTpZfOBshh7vqgduHoi8CVIMCZM2zSTpMIeiWZV1S
         CKdQ==
X-Gm-Message-State: APjAAAWXQQgbT7b/oU7QJbLL+lun5JIy83iL4zEAMinb0ug+hdPw6PoT
        Gg0TNAZ8JikxMukM9sHkj+FLibnyjog=
X-Google-Smtp-Source: APXvYqwBm9qQMhtYP3I6OCPxNIBVo/oS6CKk26EpAxl2HQ/Ohu+3OoAOsnZRv8uciohCYG+Fu2xMmA==
X-Received: by 2002:a2e:98f:: with SMTP id 137mr9966347ljj.232.1560709397088;
        Sun, 16 Jun 2019 11:23:17 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id z85sm1714081ljb.101.2019.06.16.11.23.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:23:16 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v2 8/9] media: vivid: add CEC support to display present ctrl
Date:   Sun, 16 Jun 2019 11:22:17 -0700
Message-Id: <20190616182218.37726-9-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616182218.37726-1-johan.korsnes@gmail.com>
References: <20190616182218.37726-1-johan.korsnes@gmail.com>
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
index ae3690fd1b52..807c9e92e051 100644
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
+		if (!dev->cec_tx_adap)
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
index ca15c13abf6c..0d1ee9a221db 100644
--- a/drivers/media/platform/vivid/vivid-vid-cap.c
+++ b/drivers/media/platform/vivid/vivid-vid-cap.c
@@ -1750,7 +1750,8 @@ int vidioc_s_edid(struct file *file, void *_fh,
 {
 	struct vivid_dev *dev = video_drvdata(file);
 	u16 phys_addr;
-	unsigned int i;
+	u32 display_present = 0;
+	unsigned int i, j;
 	int ret;
 
 	memset(edid->reserved, 0, sizeof(edid->reserved));
@@ -1760,6 +1761,8 @@ int vidioc_s_edid(struct file *file, void *_fh,
 		return -EINVAL;
 	if (edid->blocks == 0) {
 		dev->edid_blocks = 0;
+		v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, 0);
+		v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, 0);
 		phys_addr = CEC_PHYS_ADDR_INVALID;
 		goto set_phys_addr;
 	}
@@ -1778,13 +1781,23 @@ int vidioc_s_edid(struct file *file, void *_fh,
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

