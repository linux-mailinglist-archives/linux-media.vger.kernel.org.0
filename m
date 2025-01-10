Return-Path: <linux-media+bounces-24571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 340FBA0892F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 08:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FFEE3A9438
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 07:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718DE207E0B;
	Fri, 10 Jan 2025 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crepUCjx"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E7620767A
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736494772; cv=none; b=OiG4Fe3FZedKoNsvgerhYpkJaiAcpUPEu6e3Cfrr7UP0RDUMRnvrLc+el2IAXUqqeghCcJskvIrOp4nu2CUmdQcfPie83sjekIy+bjUU5uBHN3UG5sUmu7nHt1JX5f8lV4Q3CHkzMZz9HwiQPz3pbHN6wOqdLgYObEsAG6BmxpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736494772; c=relaxed/simple;
	bh=L4vxGAh5ey/KYIRpWeXCeTalPyUM79cUzjC87JIm6KM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ScDlwOwb1Gfpgv+TZ6On74N4ZVtZz4aQ3DOAqteay6WGKbEybY3+4QduHXBvM2JCHWfnkq9q8dbEwTkY4cRB29aSgBVaxFCUzDhPldLm+Rc4+qM/kAQu8vELQ8Mx6vjhlhU3a/uGeVzp0HGcC+eUcbOA7342H9YT0BRQKz1Rxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crepUCjx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736494771; x=1768030771;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L4vxGAh5ey/KYIRpWeXCeTalPyUM79cUzjC87JIm6KM=;
  b=crepUCjxYJn4pVpGzznYeHQLzSvH1NIe8vZj4BjqFjTi/7E8UWOahMQS
   GLo9OdyA6INOd3Oa1IssFhEBq76B0JQGzaWTh7o010bDOHQ3eHpZEeRsG
   RVtmhH8ZQQ183bsULkO7wr+ZpE4IpMVVJBqYja7kuWWhu3xXgfoA1Ht0G
   bN11/1PGY4c8FqgXGgmlYtd4VGvnry8DOBTE0EJbv/wclBiT+w+VsTY7e
   wprz+qVEYWfnLLw4CnEKOehVOY3pSlwYUipsMeQ9bXxk2vzdf15tG47Ze
   bRZusdTUoknU6xqE1RvJtVu90FniN2f/ySHZp4JpATvNXFxvqCD/+kiD/
   g==;
X-CSE-ConnectionGUID: h7yIj5Q/SyeS3MrhpwvAIA==
X-CSE-MsgGUID: fLCEt81tRgGIzCq2Qa5YdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="37011881"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="37011881"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 23:39:26 -0800
X-CSE-ConnectionGUID: 93Ny+AeBRWWex8mq+KPUFg==
X-CSE-MsgGUID: wpBUQlLATPydYOsG9YhqNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103844105"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 23:39:25 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id CFA8311FA2C;
	Fri, 10 Jan 2025 09:39:21 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hdegoede@redhat.com
Subject: [PATCH 2/2] media: i2c: ov2740: Small cleanups
Date: Fri, 10 Jan 2025 09:39:19 +0200
Message-Id: <20250110073919.1228953-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110073919.1228953-1-sakari.ailus@linux.intel.com>
References: <20250110073919.1228953-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Small cleanups for the driver, namely removal of OV2740_NUM_SUPPLIES
macro, use of unsigned int for a loop and printing the missing "0x" for a
hexadecimal number.

Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 04e93618f408..80d151e8ae29 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -83,8 +83,6 @@ static const char * const ov2740_supply_name[] = {
 	"DVDD",
 };
 
-#define OV2740_NUM_SUPPLIES ARRAY_SIZE(ov2740_supply_name)
-
 struct nvm_data {
 	struct nvmem_device *nvmem;
 	struct regmap *regmap;
@@ -536,7 +534,7 @@ struct ov2740 {
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *powerdown_gpio;
 	struct clk *clk;
-	struct regulator_bulk_data supplies[OV2740_NUM_SUPPLIES];
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov2740_supply_name)];
 
 	/* Current mode */
 	const struct ov2740_mode *cur_mode;
@@ -655,7 +653,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 		return -ENXIO;
 	}
 
-	dev_dbg(&client->dev, "chip id: %x\n", val);
+	dev_dbg(&client->dev, "chip id: 0x%x\n", val);
 
 	ov2740->identified = true;
 
@@ -1321,7 +1319,8 @@ static int ov2740_suspend(struct device *dev)
 	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
 	gpiod_set_value_cansleep(ov2740->powerdown_gpio, 1);
 	clk_disable_unprepare(ov2740->clk);
-	regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(ov2740_supply_name),
+			       ov2740->supplies);
 	return 0;
 }
 
@@ -1331,13 +1330,15 @@ static int ov2740_resume(struct device *dev)
 	struct ov2740 *ov2740 = to_ov2740(sd);
 	int ret;
 
-	ret = regulator_bulk_enable(OV2740_NUM_SUPPLIES, ov2740->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov2740_supply_name),
+				    ov2740->supplies);
 	if (ret)
 		return ret;
 
 	ret = clk_prepare_enable(ov2740->clk);
 	if (ret) {
-		regulator_bulk_disable(OV2740_NUM_SUPPLIES, ov2740->supplies);
+		regulator_bulk_disable(ARRAY_SIZE(ov2740_supply_name),
+				       ov2740->supplies);
 		return ret;
 	}
 
@@ -1353,7 +1354,8 @@ static int ov2740_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ov2740 *ov2740;
 	bool full_power;
-	int i, ret;
+	unsigned int i;
+	int ret;
 
 	ov2740 = devm_kzalloc(&client->dev, sizeof(*ov2740), GFP_KERNEL);
 	if (!ov2740)
@@ -1391,10 +1393,11 @@ static int ov2740_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ov2740->clk),
 				     "failed to get clock\n");
 
-	for (i = 0; i < OV2740_NUM_SUPPLIES; i++)
+	for (i = 0; i < ARRAY_SIZE(ov2740_supply_name); i++)
 		ov2740->supplies[i].supply = ov2740_supply_name[i];
 
-	ret = devm_regulator_bulk_get(dev, OV2740_NUM_SUPPLIES, ov2740->supplies);
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov2740_supply_name),
+				      ov2740->supplies);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
-- 
2.39.5


