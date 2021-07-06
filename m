Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF823BC868
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 11:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhGFJUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 05:20:31 -0400
Received: from mga03.intel.com ([134.134.136.65]:39636 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230472AbhGFJUa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Jul 2021 05:20:30 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="209126418"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; 
   d="scan'208";a="209126418"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2021 02:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; 
   d="scan'208";a="562950896"
Received: from ipu5-build.bj.intel.com ([10.238.232.202])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2021 02:17:50 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        robert.foss@linaro.org
Cc:     tian.shu.qiu@intel.com, senozhatsky@chromium.org,
        tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: ov8856: ignore gpio and regulator for ov8856 with ACPI
Date:   Tue,  6 Jul 2021 17:18:49 +0800
Message-Id: <1625563129-12696-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For ov8856 working with ACPI, it does not depend on the reset gpio
and regulator to do reset and power control, so should get the gpio
and regulator for non-ACPI cases only, otherwise it will break ov8856
with ACPI.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Tianshu Qiu <tian.shu.qiu@intel.com>
Cc: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/i2c/ov8856.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 88e19f30d376..a88857209a46 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2304,25 +2304,25 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856, struct device *dev)
 
 		clk_set_rate(ov8856->xvclk, xvclk_rate);
 		xvclk_rate = clk_get_rate(ov8856->xvclk);
+
+		ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+							     GPIOD_OUT_LOW);
+		if (IS_ERR(ov8856->reset_gpio))
+			return PTR_ERR(ov8856->reset_gpio);
+
+		for (i = 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
+			ov8856->supplies[i].supply = ov8856_supply_names[i];
+
+		ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov8856_supply_names),
+					      ov8856->supplies);
+		if (ret)
+			return ret;
 	}
 
 	if (xvclk_rate != OV8856_XVCLK_19_2)
 		dev_warn(dev, "external clock rate %u is unsupported",
 			 xvclk_rate);
 
-	ov8856->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						     GPIOD_OUT_LOW);
-	if (IS_ERR(ov8856->reset_gpio))
-		return PTR_ERR(ov8856->reset_gpio);
-
-	for (i = 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
-		ov8856->supplies[i].supply = ov8856_supply_names[i];
-
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov8856_supply_names),
-				      ov8856->supplies);
-	if (ret)
-		return ret;
-
 	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
 	if (!ep)
 		return -ENXIO;
-- 
2.7.4

