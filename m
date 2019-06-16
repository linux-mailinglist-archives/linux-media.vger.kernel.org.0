Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEB04765D
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2019 20:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfFPSXQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Jun 2019 14:23:16 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35272 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfFPSXQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Jun 2019 14:23:16 -0400
Received: by mail-lj1-f194.google.com with SMTP id x25so7164794ljh.2
        for <linux-media@vger.kernel.org>; Sun, 16 Jun 2019 11:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=grfO7/IeZW+Yqz/o5lXO0RxuRu3utTA7vMaEtFxLdTA=;
        b=joqmbq+5tvz/8mXcCvdMLjP2v6p+CfJOxny4O2Sdd1nVBw35a5OI7WtMwsBBqcMGS8
         9ZkbkcEnaPOEcYToyWL0fJ9QI/eE4TaM3uD+dNmLeB9laOGnQSZhE/7wQjvJGtRT7uiG
         OqOLAH5kWrgza88FpZ+vviLXiy1s+v653FAnVHu5GndywnTlyAdCraE29d3OCkVRTsWK
         I5HZtVBUqpBFTZGRS9cvxvXxH2bW8O5mSW0QsRi9Ri+izPs/VMAVQdBMTmjnEHspzG1F
         /StGTo2jnmfpbuVMyNKS5k5ARzA0phts9gb7L6FQI5gLS157vm2e7+xXD3/ZaTrIs2MC
         boaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=grfO7/IeZW+Yqz/o5lXO0RxuRu3utTA7vMaEtFxLdTA=;
        b=WXQp2sYErrxdNP9SxaPWynYILGJwx8zqshkwB4QdSlmOr8dzkrpn+J3DtZ+a95vAeO
         rJo/GGwzIMd8/gUwBuwzWccTrsl76Js7Y3uk1qgmN5qgAbE+HXFhh7mg88QF7S1T0VhL
         fksb+fW/1vObxmJmRG9V11tIE60UaeFKwFBOex/uT0ct8SQ8TncLf+OIX0Ny7LHtqAss
         yryiCMi6+N/jH7cH3FNb9dJSiE9+KPV2cZ/gGxNSRvXEqxaa2fmKuxoIlebov4CCI/Si
         Rh7+JRV+3dxS5qzeAVpLVioxAWweYbDp6p0Ku53Zh7guHfADtHKKE3mzg4GPS6+fEqTc
         WH3w==
X-Gm-Message-State: APjAAAVqtPDDRNKHGSmazhMyTyb+gy6yFtuvivxHiIc96zhKhvG8uX4U
        fWgerAl3uyVtRUPx8CRVBeoNGkscME8=
X-Google-Smtp-Source: APXvYqxVAhy/OQKVlWPOMglzThvxOwyhrBErqVseGtSi4pHGtKtQETbAD5czbN+BpW6jUet2vYxF/w==
X-Received: by 2002:a2e:86c1:: with SMTP id n1mr33665509ljj.162.1560709393573;
        Sun, 16 Jun 2019 11:23:13 -0700 (PDT)
Received: from localhost.localdomain ([178.74.2.49])
        by smtp.gmail.com with ESMTPSA id z85sm1714081ljb.101.2019.06.16.11.23.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 11:23:12 -0700 (PDT)
From:   Johan Korsnes <johan.korsnes@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
Subject: [PATCH v2 5/9] media: vivid: add HDMI (dis)connect TX emulation
Date:   Sun, 16 Jun 2019 11:22:14 -0700
Message-Id: <20190616182218.37726-6-johan.korsnes@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616182218.37726-1-johan.korsnes@gmail.com>
References: <20190616182218.37726-1-johan.korsnes@gmail.com>
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
2.19.1

