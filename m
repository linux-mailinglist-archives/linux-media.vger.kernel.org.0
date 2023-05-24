Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B55270EBF3
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 05:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239310AbjEXDks (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 23:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233493AbjEXDkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 23:40:46 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BD2FA
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 20:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684899645; x=1716435645;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=djAB2SXj9J7C3GUudaivKA0+nqo79cJDXlqZKqy2e3E=;
  b=kUuoEcCDfzkiyxc0u2n79OYS1kiLXkQs6QSzNnYr6OxJJzG+XZP+15QW
   8hv9zqigbUBmWxFB0b5tT+G0pbvQhkeJ2GZxoy+wNx656mHv8Xgm17fDZ
   zlkcuDWjIXREzX5X96xIbcS5BFl0sfs9Gvge8Lb/mYTP1mg67azTCYFMB
   E8I4FyoJYDMXyEyTNAE61PP1WyrUJTnziYKfzX7qIgSu9tTTelImJRcLY
   fARLv3Dkg3PFw0XYjLQrhwE4Cm4UD3t/uCgC45kfdZsOUOJbiSY9isc/3
   gwmJtHqxwvpf09wICIDI3RDWfBlTE+j89BrQyQsMgr2+Uc1bZoJMCwpQu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416904066"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="416904066"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 20:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="734993486"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="734993486"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga008.jf.intel.com with ESMTP; 23 May 2023 20:40:41 -0700
From:   bingbu.cao@intel.com
To:     djrscally@gmail.com, dan.scally@ideasonboard.com, hao.yao@intel.com
Cc:     markgross@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        andriy.shevchenko@linux.intel.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 2/3] platform/x86: int3472: Evaluate device's _DSM method to control imaging clock
Date:   Wed, 24 May 2023 11:51:34 +0800
Message-Id: <20230524035135.90315-2-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524035135.90315-1-bingbu.cao@intel.com>
References: <20230524035135.90315-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Bingbu Cao <bingbu.cao@intel.com>

On some platforms, the imaging clock should be controlled by evaluating
specific clock device's _DSM method instead of setting gpio, so this
change register clock if no gpio based clock and then use the _DSM method
to enable and disable clock.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 81 ++++++++++++++++++-
 drivers/platform/x86/intel/int3472/common.h   |  6 +-
 drivers/platform/x86/intel/int3472/discrete.c |  4 +
 3 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index d1088be5af78..f0a1d2ef137b 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -11,6 +11,32 @@
 
 #include "common.h"
 
+static const guid_t img_clk_guid =
+	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
+		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
+
+static void skl_int3472_enable_clk_acpi_method(struct int3472_gpio_clock *clk,
+					       bool enable)
+{
+	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
+	union acpi_object args[3];
+	union acpi_object argv4;
+
+	args[0].integer.type = ACPI_TYPE_INTEGER;
+	args[0].integer.value = clk->imgclk_index;
+	args[1].integer.type = ACPI_TYPE_INTEGER;
+	args[1].integer.value = enable ? 1 : 0;
+	args[2].integer.type = ACPI_TYPE_INTEGER;
+	args[2].integer.value = 1;
+
+	argv4.type = ACPI_TYPE_PACKAGE;
+	argv4.package.count = 3;
+	argv4.package.elements = args;
+
+	acpi_evaluate_dsm(acpi_device_handle(int3472->adev), &img_clk_guid,
+			  0, 1, &argv4);
+}
+
 /*
  * The regulators have to have .ops to be valid, but the only ops we actually
  * support are .enable and .disable which are handled via .ena_gpiod. Pass an
@@ -22,7 +48,11 @@ static int skl_int3472_clk_prepare(struct clk_hw *hw)
 {
 	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
 
-	gpiod_set_value_cansleep(clk->ena_gpio, 1);
+	if (clk->ena_gpio)
+		gpiod_set_value_cansleep(clk->ena_gpio, 1);
+	else
+		skl_int3472_enable_clk_acpi_method(clk, 1);
+
 	return 0;
 }
 
@@ -30,7 +60,10 @@ static void skl_int3472_clk_unprepare(struct clk_hw *hw)
 {
 	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
 
-	gpiod_set_value_cansleep(clk->ena_gpio, 0);
+	if (clk->ena_gpio)
+		gpiod_set_value_cansleep(clk->ena_gpio, 0);
+	else
+		skl_int3472_enable_clk_acpi_method(clk, 0);
 }
 
 static int skl_int3472_clk_enable(struct clk_hw *hw)
@@ -86,6 +119,50 @@ static const struct clk_ops skl_int3472_clock_ops = {
 	.recalc_rate = skl_int3472_clk_recalc_rate,
 };
 
+int skl_int3472_register_clock_src(struct int3472_discrete_device *int3472)
+{
+	struct clk_init_data init = {
+		.ops = &skl_int3472_clock_ops,
+		.flags = CLK_GET_RATE_NOCACHE,
+	};
+	int ret;
+
+	if (int3472->clock.cl)
+		return -EBUSY;
+
+	init.name = kasprintf(GFP_KERNEL, "%s-clk",
+			      acpi_dev_name(int3472->adev));
+	if (!init.name)
+		return -ENOMEM;
+
+	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
+	int3472->clock.clk_hw.init = &init;
+	int3472->clock.clk = clk_register(&int3472->adev->dev,
+					  &int3472->clock.clk_hw);
+	if (IS_ERR(int3472->clock.clk)) {
+		ret = PTR_ERR(int3472->clock.clk);
+		goto out_free_init_name;
+	}
+
+	int3472->clock.cl = clkdev_create(int3472->clock.clk, NULL,
+					  int3472->sensor_name);
+	if (!int3472->clock.cl) {
+		ret = -ENOMEM;
+		goto err_unregister_clk;
+	}
+
+	kfree(init.name);
+
+	return 0;
+
+err_unregister_clk:
+	clk_unregister(int3472->clock.clk);
+out_free_init_name:
+	kfree(init.name);
+
+	return ret;
+}
+
 int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
 			       struct acpi_resource_gpio *agpio, u32 polarity)
 {
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 61688e450ce5..036b804e8ea5 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -64,7 +64,9 @@ struct int3472_cldb {
 	u8 control_logic_type;
 	u8 control_logic_id;
 	u8 sensor_card_sku;
-	u8 reserved[28];
+	u8 reserved[10];
+	u8 clock_source;
+	u8 reserved2[17];
 };
 
 struct int3472_gpio_function_remap {
@@ -100,6 +102,7 @@ struct int3472_discrete_device {
 		struct clk_lookup *cl;
 		struct gpio_desc *ena_gpio;
 		u32 frequency;
+		u8 imgclk_index;
 	} clock;
 
 	struct int3472_pled {
@@ -123,6 +126,7 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
 
 int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
 			       struct acpi_resource_gpio *agpio, u32 polarity);
+int skl_int3472_register_clock_src(struct int3472_discrete_device *int3472);
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
 
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index ef020e23e596..d5d5c650d6d2 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -309,6 +309,9 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
 	if (ret < 0)
 		return ret;
 
+	/* If no gpio based clk registered, try register with clock source */
+	skl_int3472_register_clock_src(int3472);
+
 	acpi_dev_free_resource_list(&resource_list);
 
 	int3472->gpios.dev_id = int3472->sensor_name;
@@ -356,6 +359,7 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
 	int3472->adev = adev;
 	int3472->dev = &pdev->dev;
 	platform_set_drvdata(pdev, int3472);
+	int3472->clock.imgclk_index = cldb.clock_source;
 
 	ret = skl_int3472_get_sensor_adev_and_name(&pdev->dev, &int3472->sensor,
 						   &int3472->sensor_name);
-- 
2.40.1

