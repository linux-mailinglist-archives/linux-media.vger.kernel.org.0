Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1E6F7BC419
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 04:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbjJGCNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 22:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbjJGCNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 22:13:04 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1B7C2;
        Fri,  6 Oct 2023 19:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696644781; x=1728180781;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rzHN8yUSG8uSjBkx+O48FATAq6MVtFpsJucGvn1kg4o=;
  b=fzwu0TCEqDJf4kcf5a79CPRgKmw2K/+wcIQfmym0b/hPPf8RK40K1Rlk
   DbviLM3LFtQR+1oObO/mwuyj1xWpSgCYNgXjQcW7qS0hIlIMTlapAOcFm
   Y9c0GdmaUI05k8LzoKGrGVzMIPVIFhwgntMLaiWHk82f7kDMH0yzulwo3
   ZARQXPtz0FbBvoQF2+ssMUG2c+HsyQJDicDfIaCCOclY412vnM8Y/2cEl
   wCE8Opyy+yjv/wL6arPvQNoOvoBEJiVnf3s7FW9We+Q279GyreRFY1H63
   FV8AB88pMYtv32kMrqOyjvTi6Y+17cCigYb2cs1DGitU9+RJliJf8k0Km
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="414869999"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="414869999"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 19:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="781857651"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="781857651"
Received: from haoyao-desk.bj.intel.com ([10.238.232.41])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 19:12:53 -0700
From:   Hao Yao <hao.yao@intel.com>
To:     Dan Scally <dan.scally@ideasonboard.com>, djrscally@gmail.com,
        Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Hao Yao <hao.yao@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] platform/x86: int3472: Add handshake GPIO function
Date:   Sat,  7 Oct 2023 10:12:25 +0800
Message-Id: <20231007021225.9240-1-hao.yao@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Handshake pin is used for Lattice MIPI aggregator to enable the
camera sensor. After pulled up, recommend to wail ~250ms to get
everything ready.

Signed-off-by: Hao Yao <hao.yao@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/common.h   | 1 +
 drivers/platform/x86/intel/int3472/discrete.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 655ae3ec0593..3ad4c72afb45 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -23,6 +23,7 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 
 #define INT3472_PDEV_MAX_NAME_LEN				23
 #define INT3472_MAX_SENSOR_GPIOS				3
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b644ce65c990..4753161b4080 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -111,6 +111,10 @@ static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polar
 		*func = "power-enable";
 		*polarity = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_HANDSHAKE:
+		*func = "handshake";
+		*polarity = GPIO_ACTIVE_HIGH;
+		break;
 	default:
 		*func = "unknown";
 		*polarity = GPIO_ACTIVE_HIGH;
@@ -201,6 +205,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	switch (type) {
 	case INT3472_GPIO_TYPE_RESET:
 	case INT3472_GPIO_TYPE_POWERDOWN:
+	case INT3472_GPIO_TYPE_HANDSHAKE:
 		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
 		if (ret)
 			err_msg = "Failed to map GPIO pin to sensor\n";
-- 
2.34.1

