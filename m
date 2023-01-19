Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 177516736D7
	for <lists+linux-media@lfdr.de>; Thu, 19 Jan 2023 12:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjASL3q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Jan 2023 06:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230353AbjASL3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Jan 2023 06:29:33 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A016F8A7;
        Thu, 19 Jan 2023 03:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674127757; x=1705663757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QPl/84At/7CklOKY4iDHADsrN39puNNjvYV0F53XPa4=;
  b=EmVMtgyBFupaBiBJHO8f9Wy64S47uKQURAunygoSGsKwmI6qWUGdWu61
   WlcUfWwFnI3S155l+kBMPjmSNEmtjHvwMK9qMUorQdntMKjj4hz3kJMB+
   WuxBihm9jNEoLCgQWbPdc/+hbTqGQmGAYi7iQvzqSxyX7plbpH+SttK8D
   5DW8u9wAADxgSOiaPU9tWkobeZSuIIAT+1UlIyu4QF+Ggs46HkAdUcwlw
   3asTp08YCnyPbgKXCdZ3wZCnhT/J5QGhOvVOPxR7CybalZ+6scvJA2U5m
   65H9j3awolDDQfkg9xsRc6lWNzWN3Pac6Tgzpm1Bme9yEcAsxySWHkZ+0
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669100400"; 
   d="scan'208";a="208443550"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jan 2023 04:29:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 04:29:16 -0700
Received: from microchip1-OptiPlex-9020.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 04:29:13 -0700
From:   shravan kumar <shravan.chippa@microchip.com>
To:     <paul.j.murphy@intel.com>, <daniele.alessandrelli@intel.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "shravan kumar" <shravan.chippa@microchip.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v10 5/5] media: i2c: imx334: update pixel and link frequency
Date:   Thu, 19 Jan 2023 16:58:48 +0530
Message-ID: <20230119112848.3523273-6-shravan.chippa@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119112848.3523273-1-shravan.chippa@microchip.com>
References: <20230119112848.3523273-1-shravan.chippa@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shravan Chippa <shravan.chippa@microchip.com>

Update pixel_rate and link frequency for 1920x1080@30
while changing mode.

Add dummy ctrl cases for pixel_rate and link frequency
to avoid error while changing the modes dynamically

add support to handle multiple link frequencies

Suggested-by: Sakari Ailus <sakari.ailus@iki.fi>
Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
---
 drivers/media/i2c/imx334.c | 41 ++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 309c706114d2..62b104eaa437 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -49,7 +49,8 @@
 #define IMX334_INCLK_RATE	24000000
 
 /* CSI2 HW configuration */
-#define IMX334_LINK_FREQ	891000000
+#define IMX334_LINK_FREQ_891M	891000000
+#define IMX334_LINK_FREQ_445M	445500000
 #define IMX334_NUM_DATA_LANES	4
 
 #define IMX334_REG_MIN		0x00
@@ -139,12 +140,14 @@ struct imx334 {
 	u32 vblank;
 	const struct imx334_mode *cur_mode;
 	struct mutex mutex;
+	unsigned long menu_skip_mask;
 	u32 cur_code;
 	bool streaming;
 };
 
 static const s64 link_freq[] = {
-	IMX334_LINK_FREQ,
+	IMX334_LINK_FREQ_891M,
+	IMX334_LINK_FREQ_445M,
 };
 
 /* Sensor mode registers for 1920x1080@30fps */
@@ -468,7 +471,7 @@ static const struct imx334_mode supported_modes[] = {
 		.vblank_min = 45,
 		.vblank_max = 132840,
 		.pclk = 297000000,
-		.link_freq_idx = 0,
+		.link_freq_idx = 1,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
@@ -598,6 +601,11 @@ static int imx334_update_controls(struct imx334 *imx334,
 	if (ret)
 		return ret;
 
+	ret = __v4l2_ctrl_modify_range(imx334->pclk_ctrl, mode->pclk,
+				       mode->pclk, 1, mode->pclk);
+	if (ret)
+		return ret;
+
 	ret = __v4l2_ctrl_modify_range(imx334->hblank_ctrl, mode->hblank,
 				       mode->hblank, 1, mode->hblank);
 	if (ret)
@@ -698,6 +706,8 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
 		pm_runtime_put(imx334->dev);
 
 		break;
+	case V4L2_CID_PIXEL_RATE:
+	case V4L2_CID_LINK_FREQ:
 	case V4L2_CID_HBLANK:
 		ret = 0;
 		break;
@@ -1047,7 +1057,7 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	struct fwnode_handle *ep;
 	unsigned long rate;
 	int ret;
-	int i;
+	int i, j;
 
 	if (!fwnode)
 		return -ENXIO;
@@ -1097,11 +1107,20 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 		goto done_endpoint_free;
 	}
 
-	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
-		if (bus_cfg.link_frequencies[i] == IMX334_LINK_FREQ)
+	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
+		for (j = 0; j < ARRAY_SIZE(link_freq); j++) {
+			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
+				set_bit(j, &imx334->menu_skip_mask);
+				break;
+			}
+		}
+
+		if (j == ARRAY_SIZE(link_freq)) {
+			ret = dev_err_probe(imx334->dev, -EINVAL,
+					    "no supported link freq found\n");
 			goto done_endpoint_free;
-
-	ret = -EINVAL;
+		}
+	}
 
 done_endpoint_free:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -1232,10 +1251,10 @@ static int imx334_init_controls(struct imx334 *imx334)
 	imx334->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 							&imx334_ctrl_ops,
 							V4L2_CID_LINK_FREQ,
-							ARRAY_SIZE(link_freq) -
-							1,
-							mode->link_freq_idx,
+							__fls(imx334->menu_skip_mask),
+							__ffs(imx334->menu_skip_mask),
 							link_freq);
+
 	if (imx334->link_freq_ctrl)
 		imx334->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-- 
2.34.1

