Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF09C51D7E
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 23:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbfFXV6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 17:58:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54186 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726372AbfFXV6I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 17:58:08 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hfWyS-0007FY-EG; Mon, 24 Jun 2019 21:58:04 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: vivid: fix potential integer overflow on left shift
Date:   Mon, 24 Jun 2019 22:58:04 +0100
Message-Id: <20190624215804.12122-1-colin.king@canonical.com>
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
shifting 2ULL to avoid a 32 bit overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 8a99e9faa131 ("media: vivid: add HDMI (dis)connect RX emulation")
Fixes: 79a792dafac6 ("media: vivid: add HDMI (dis)connect TX emulation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/vivid/vivid-ctrls.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index 3e916c8befb7..8f340cfd6993 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -1634,8 +1634,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			0, V4L2_DV_RGB_RANGE_AUTO);
 		dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
 			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0,
-			(2 << (dev->num_hdmi_inputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_inputs - 1)) - 1);
+			(2ULL << (dev->num_hdmi_inputs - 1)) - 1, 0,
+			(2ULL << (dev->num_hdmi_inputs - 1)) - 1);
 
 	}
 	if (dev->num_hdmi_outputs) {
@@ -1653,16 +1653,16 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			&vivid_ctrl_display_present, NULL);
 		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
 			NULL, V4L2_CID_DV_TX_HOTPLUG, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
+			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
 		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
 			NULL, V4L2_CID_DV_TX_RXSENSE, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
+			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
 		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
 			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+			(2ULL << (dev->num_hdmi_outputs - 1)) - 1, 0,
+			(2ULL << (dev->num_hdmi_outputs - 1)) - 1);
 	}
 	if ((dev->has_vid_cap && dev->has_vid_out) ||
 	    (dev->has_vbi_cap && dev->has_vbi_out))
-- 
2.20.1

