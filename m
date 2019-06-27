Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 391DA57DDE
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 10:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfF0IFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 04:05:46 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46097 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfF0IFq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 04:05:46 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hgPPZ-0002y3-DM; Thu, 27 Jun 2019 08:05:41 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V3] media: vivid: fix potential integer overflow on left shift
Date:   Thu, 27 Jun 2019 09:05:41 +0100
Message-Id: <20190627080541.11122-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a potential integer overflow when int 2 is left shifted
as this is evaluated using 32 bit arithmetic but is being used in
a context that expects an expression of type s64.  Fix this by
generating a mask using GENMASK to avoid a 32 bit overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 8a99e9faa131 ("media: vivid: add HDMI (dis)connect RX emulation")
Fixes: 79a792dafac6 ("media: vivid: add HDMI (dis)connect TX emulation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: use intermediate variables for the shifted expression to make code
    a bit more readable.
V3: use GENMASK rather than shifting logic, rename variables adding
    _mask suffix.
---

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/vivid/vivid-ctrls.c | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index 3e916c8befb7..b04997569228 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -1613,6 +1613,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	}
 
 	if (dev->num_hdmi_inputs) {
+		s64 hdmi_input_mask = GENMASK(dev->num_hdmi_inputs - 1, 0);
+
 		dev->ctrl_dv_timings_signal_mode = v4l2_ctrl_new_custom(hdl_vid_cap,
 					&vivid_ctrl_dv_timings_signal_mode, NULL);
 
@@ -1633,12 +1635,13 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			V4L2_CID_DV_RX_RGB_RANGE, V4L2_DV_RGB_RANGE_FULL,
 			0, V4L2_DV_RGB_RANGE_AUTO);
 		dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
-			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0,
-			(2 << (dev->num_hdmi_inputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_inputs - 1)) - 1);
+			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0, hdmi_input_mask,
+			0, hdmi_input_mask);
 
 	}
 	if (dev->num_hdmi_outputs) {
+		s64 hdmi_output_mask = GENMASK(dev->num_hdmi_outputs - 1, 0);
+
 		/*
 		 * We aren't doing anything with this at the moment, but
 		 * HDMI outputs typically have this controls.
@@ -1652,17 +1655,14 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 		dev->ctrl_display_present = v4l2_ctrl_new_custom(hdl_vid_out,
 			&vivid_ctrl_display_present, NULL);
 		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
-			NULL, V4L2_CID_DV_TX_HOTPLUG, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+			NULL, V4L2_CID_DV_TX_HOTPLUG, 0, hdmi_output_mask,
+			0, hdmi_output_mask);
 		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
-			NULL, V4L2_CID_DV_TX_RXSENSE, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+			NULL, V4L2_CID_DV_TX_RXSENSE, 0, hdmi_output_mask,
+			0, hdmi_output_mask);
 		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
-			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0, hdmi_output_mask,
+			0, hdmi_output_mask);
 	}
 	if ((dev->has_vid_cap && dev->has_vid_out) ||
 	    (dev->has_vbi_cap && dev->has_vbi_out))
-- 
2.20.1

