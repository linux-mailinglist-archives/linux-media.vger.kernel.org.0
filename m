Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2603183B1A
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 22:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgCLVNG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 17:13:06 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:33019 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726312AbgCLVNF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 17:13:05 -0400
X-IronPort-AV: E=Sophos;i="5.70,546,1574089200"; 
   d="scan'208";a="41514819"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Mar 2020 06:13:03 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4102B400C095;
        Fri, 13 Mar 2020 06:13:00 +0900 (JST)
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
        Ezequiel Garcia <ezequiel@collabora.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] media: i2c: ov5645: Switch to assigned-clock-rates
Date:   Thu, 12 Mar 2020 21:12:31 +0000
Message-Id: <1584047552-20166-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584047552-20166-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1584047552-20166-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/media/i2c/ov5645.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a6c17d1..6cd16c5 100644
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
@@ -1094,10 +1095,17 @@ static int ov5645_probe(struct i2c_client *client)
 		return PTR_ERR(ov5645->xclk);
 	}
 
-	ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
+	ret = of_property_read_u32(dev->of_node, "assigned-clock-rates",
+				   &xclk_freq);
 	if (ret) {
-		dev_err(dev, "could not get xclk frequency\n");
-		return ret;
+		/* check if deprecated property clock-frequency is defined */
+		ret = of_property_read_u32(dev->of_node, "clock-frequency",
+					   &xclk_freq);
+		if (ret) {
+			dev_err(dev, "could not get xclk frequency\n");
+			return ret;
+		}
+		set_clk = true;
 	}
 
 	/* external clock must be 24MHz, allow 1% tolerance */
@@ -1107,10 +1115,12 @@ static int ov5645_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	ret = clk_set_rate(ov5645->xclk, xclk_freq);
-	if (ret) {
-		dev_err(dev, "could not set xclk frequency\n");
-		return ret;
+	if (set_clk) {
+		ret = clk_set_rate(ov5645->xclk, xclk_freq);
+		if (ret) {
+			dev_err(dev, "could not set xclk frequency\n");
+			return ret;
+		}
 	}
 
 	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
-- 
2.7.4

