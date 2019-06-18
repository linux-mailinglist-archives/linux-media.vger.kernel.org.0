Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB60549542
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 00:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfFQWjd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 18:39:33 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41117 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbfFQWjc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 18:39:32 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so7742192lfa.8
        for <linux-media@vger.kernel.org>; Mon, 17 Jun 2019 15:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D2cKtzPtYHFF+OB755/oCW8Hi9/UortAVZrAHZMkeWk=;
        b=l6fz9CUPWmIbEKZaCI8KXagr8cFURNsNK5VoWHc99zme5Ud5z21E4Ojnuwd15sRpJU
         JndyCk+f8wZRQrNndnDTvTyYERtoTlvUX0+0hXPUeUvh4Ca3zyBLeIdM7UXP9LBUdIRN
         wVH0OQqhpgrhZnf2guTMAUeqhZ6t5Qp81k3VVFyMMg9pHWT03TYvSHGL9xrIUx+uSWqq
         jHwI5bAZAkmQLsQjeuO9UVtvtV3DyKPSLfuc1vINXhwlrk+XnA01c8HPg6sg1syAZY9L
         Gw8cJApuxt3yHMehj1rrM31rcNdEMWGB4v7vp2PivzaNyvnrkqCC29VXGe67n7SXtUg3
         884Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D2cKtzPtYHFF+OB755/oCW8Hi9/UortAVZrAHZMkeWk=;
        b=i87MDqQHl5mtZdjik8G0uZvi4G1CxUCZ5lbh/bCOr/X+KeVNVHeB1RXdbjFLDtbuOK
         TMglw2l1cJYpcxN2RUbUO1BpML85ri9N2cLDYAOf9HHH8bVPes/mXS+BZSCKwuJ188iX
         +spopD8uy6Gj3IbhtSEt4HMpoYeOHswD01Dd7lzJJ9SiCm7VYgFw58/Q8I6/1JUsU2SW
         WgJV6MSlEoQ8dXXss+NHldErpbwax8XVLERPrLHrqt6/onCoH2bBfHCRCTNgtMX6jU6d
         2LAckD+OwA63c8y9W8cZlg1wNlmplqCEelvctGYE2LgProg6PFSnd5wBLGBG+dtkxc/8
         jiOQ==
X-Gm-Message-State: APjAAAXN27SagLsftGuNb87zAms+EtBZFzpw6yt8FvlNxWzfth2AjsfR
        ei6x2HvsfR0W/kowLjl+Qej4EHbRSRGeXQ==
X-Google-Smtp-Source: APXvYqzcQTDvxisdB8ybnJerLoYD+1Csa6y8aBjNzyUHikr17cvmJY/vje7uLkIZ1TY74pBheygSgw==
X-Received: by 2002:a05:6512:24a:: with SMTP id b10mr54234510lfo.37.1560811170097;
        Mon, 17 Jun 2019 15:39:30 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id i23sm2287347ljb.7.2019.06.17.15.39.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 15:39:29 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v3 5/9] media: vivid: add HDMI (dis)connect TX emulation
Date:   Tue, 18 Jun 2019 09:37:22 +0200
Message-Id: <20190618073726.61776-6-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190618073726.61776-1-johan.korsnes@gmail.com>
References: <20190618073726.61776-1-johan.korsnes@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index 495609bd9952..2900cbe585cd 100644
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
index 6e6e8e0fb4bd..ab25973894b4 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -912,6 +912,8 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_out);
 	struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
+	u32 display_present = 0;
+	unsigned int i, j;
 
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
@@ -1593,7 +1604,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			V4L2_CID_DV_RX_RGB_RANGE, V4L2_DV_RGB_RANGE_FULL,
 			0, V4L2_DV_RGB_RANGE_AUTO);
 	}
-	if (has_hdmi && dev->has_vid_out) {
+	if (dev->num_hdmi_outputs) {
 		/*
 		 * We aren't doing anything with this at the moment, but
 		 * HDMI outputs typically have this controls.
@@ -1606,6 +1617,18 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
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
2.19.1

