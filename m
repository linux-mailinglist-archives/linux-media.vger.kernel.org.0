Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4288A7BC41B
	for <lists+linux-media@lfdr.de>; Sat,  7 Oct 2023 04:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234028AbjJGCNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 22:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbjJGCNi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 22:13:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68813BD;
        Fri,  6 Oct 2023 19:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696644815; x=1728180815;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mPhVkZ28uC8rO+EkJlB8t2QI4qe8UU3L9Nm83Q74Y+E=;
  b=chfh0dlcsOfNRLRs9akS0+WkSzr9bNv+ubBgRER9GbgHnoq2GcW9j+LV
   sMpmJIy2IjC+ArSCHGECA7+0NvmXxD9JFBa49mVM0yP7Atb3dsoYyxv6G
   NqvHw9iZvhKFzWjTn1WmBFbVsuu0HAO51tq3fwesgogWZLhn7uuvOjFio
   sua2qtqsfsh5LGQ2gV0XP/qrkHauegJw3+/dC/0S8ZaNOiiYasEmEKyBv
   5yt7vFSUmJ/YbEMP3gBltt+zfMdeMy8KeDumTHXyVGDggXI94ERrjjFh7
   5B6jPt9mWCqkDuXIUNJFJox7TGlPCSDYVBBk20TsFcJlvFJxXch2itZzp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="387752346"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="387752346"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 19:13:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="787576134"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="787576134"
Received: from haoyao-desk.bj.intel.com ([10.238.232.41])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 19:13:34 -0700
From:   Hao Yao <hao.yao@intel.com>
To:     Dan Scally <dan.scally@ideasonboard.com>, djrscally@gmail.com,
        Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        Hao Yao <hao.yao@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] platform/x86: int3472: Add strobe GPIO function
Date:   Sat,  7 Oct 2023 10:13:09 +0800
Message-Id: <20231007021309.9332-1-hao.yao@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Strobe pin is used for Lattice MIPI aggregator to control the LED
so it can be handled together with privacy LED.

Signed-off-by: Hao Yao <hao.yao@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/int3472/common.h   | 1 +
 drivers/platform/x86/intel/int3472/discrete.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 9f29baa13860..655ae3ec0593 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -19,6 +19,7 @@
 /* PMIC GPIO Types */
 #define INT3472_GPIO_TYPE_RESET					0x00
 #define INT3472_GPIO_TYPE_POWERDOWN				0x01
+#define INT3472_GPIO_TYPE_STROBE				0x02
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index e33c2d75975c..b644ce65c990 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -102,6 +102,7 @@ static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polar
 		*func = "clk-enable";
 		*polarity = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 		*func = "privacy-led";
 		*polarity = GPIO_ACTIVE_HIGH;
@@ -211,6 +212,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			err_msg = "Failed to register clock\n";
 
 		break;
+	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 		ret = skl_int3472_register_pled(int3472, agpio, polarity);
 		if (ret)
-- 
2.34.1

