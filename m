Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 059CC70EBF2
	for <lists+linux-media@lfdr.de>; Wed, 24 May 2023 05:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239155AbjEXDkr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 23:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239310AbjEXDkp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 23:40:45 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DF518D
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 20:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684899642; x=1716435642;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iAbgAAPYit+CNTbNck2i5yPYY7gIZ0IK8M0KxbJqp+Y=;
  b=oEffoSZuC/+iFpKlMM003ohm0+8e+eULH3NeRNDO+ICh5hWM8Ch5pYji
   kf7TE0chXPVnQ7fCtLO3CDLYy6MIHAVCOHMi63m4dBDv0hSECEY7sUw+s
   Vr1vxAdgu7Ls1T0xooWvH4/M24Yx1OhK6WyfqnO6XurQ0gbORrbv/SINc
   gflx+JtbztaTZCIOzUSw6Oat8OkwxafKmghwnGZZWwF8zr9pgM+yxZElp
   WzpeOLWeYN1rWvYxWIbDV0MAViaKc++6/OrplNRAsxv8FQNf2pUQHpgg+
   f5xSCHRdMoJMvRidBh2jDFnrzFJYxGeVvweaEPCsKu3qWiKfR4gUdtxck
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416904064"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="416904064"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 20:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="734993461"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; 
   d="scan'208";a="734993461"
Received: from icg-kernel3.bj.intel.com ([172.16.126.100])
  by orsmga008.jf.intel.com with ESMTP; 23 May 2023 20:40:38 -0700
From:   bingbu.cao@intel.com
To:     djrscally@gmail.com, dan.scally@ideasonboard.com, hao.yao@intel.com
Cc:     markgross@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, hdegoede@redhat.com,
        andriy.shevchenko@linux.intel.com, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com
Subject: [PATCH 1/3] platform/x86: int3472: Avoid crash in unregistering regulator gpio
Date:   Wed, 24 May 2023 11:51:33 +0800
Message-Id: <20230524035135.90315-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.40.1
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

From: Hao Yao <hao.yao@intel.com>

When int3472 is loaded before GPIO driver, acpi_get_and_request_gpiod()
failed but the returned gpio descriptor is not NULL, it will cause panic
in later gpiod_put(), so set the gpio_desc to NULL in register error
handling to avoid such crash.

Signed-off-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 .../x86/intel/int3472/clk_and_regulator.c        | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 1086c3d83494..d1088be5af78 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -101,9 +101,12 @@ int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
 
 	int3472->clock.ena_gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
 							     "int3472,clk-enable");
-	if (IS_ERR(int3472->clock.ena_gpio))
-		return dev_err_probe(int3472->dev, PTR_ERR(int3472->clock.ena_gpio),
-				     "getting clk-enable GPIO\n");
+	if (IS_ERR(int3472->clock.ena_gpio)) {
+		ret = PTR_ERR(int3472->clock.ena_gpio);
+		int3472->clock.ena_gpio = NULL;
+		return dev_err_probe(int3472->dev, ret,
+				     "failed to get gpio for clock\n");
+	}
 
 	if (polarity == GPIO_ACTIVE_LOW)
 		gpiod_toggle_active_low(int3472->clock.ena_gpio);
@@ -199,8 +202,11 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 	int3472->regulator.gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
 							     "int3472,regulator");
 	if (IS_ERR(int3472->regulator.gpio)) {
-		dev_err(int3472->dev, "Failed to get regulator GPIO line\n");
-		return PTR_ERR(int3472->regulator.gpio);
+		ret = PTR_ERR(int3472->regulator.gpio);
+		int3472->regulator.gpio = NULL;
+
+		return dev_err_probe(int3472->dev, ret,
+				     "failed to get regulator gpio\n");
 	}
 
 	/* Ensure the pin is in output mode and non-active state */
-- 
2.40.1

