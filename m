Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 833881850B8
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 22:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbgCMVMy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 17:12:54 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:33087 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726681AbgCMVMx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 17:12:53 -0400
X-IronPort-AV: E=Sophos;i="5.70,550,1574089200"; 
   d="scan'208";a="41835038"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Mar 2020 06:12:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1541B40E09D5;
        Sat, 14 Mar 2020 06:12:47 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] media: i2c: ov5645: Switch to assigned-clock-rates
Date:   Fri, 13 Mar 2020 21:12:32 +0000
Message-Id: <1584133954-6953-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch switches to assigned-clock-rates for specifying the clock rate.
The clk-conf.c internally handles setting the clock rate when
assigned-clock-rates is passed.

The driver now sets the clock frequency only if the deprecated property
clock-frequency is defined instead assigned-clock-rates, this is to avoid
breakage with existing DT binaries.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a6c17d1..4fbabf3 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1055,6 +1055,7 @@ static int ov5645_probe(struct i2c_client *client)
 	struct device_node *endpoint;
 	struct ov5645 *ov5645;
 	u8 chip_id_high, chip_id_low;
+	bool set_clk = false;
 	unsigned int i;
 	u32 xclk_freq;
 	int ret;
@@ -1094,12 +1095,18 @@ static int ov5645_probe(struct i2c_client *client)
 		return PTR_ERR(ov5645->xclk);
 	}
 
-	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not get xclk frequency\n");
-		return ret;
+	/* check if deprecated property clock-frequency is defined */
+	ret = of_property_read_u32(dev->of_node, "clock-frequency",
+				   &xclk_freq);
+	if (!ret) {
+		ret = clk_set_rate(ov5645->xclk, xclk_freq);
+		if (ret) {
+			dev_err(dev, "could not set xclk frequency\n");
+			return ret;
+		}
 	}
 
+	xclk_freq = clk_get_rate(ov5645->xclk);
 	/* external clock must be 24MHz, allow 1% tolerance */
 	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
 		dev_err(dev, "external clock frequency %u is not supported\n",
@@ -1107,12 +1114,6 @@ static int ov5645_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	ret = clk_set_rate(ov5645->xclk, xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not set xclk frequency\n");
-		return ret;
-	}
-
 	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
 		ov5645->supplies[i].supply = ov5645_supply_name[i];
 
-- 
2.7.4

