Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C31C7A3F8A
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 05:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238169AbjIRDBm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Sep 2023 23:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238324AbjIRDBj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Sep 2023 23:01:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62469123
        for <linux-media@vger.kernel.org>; Sun, 17 Sep 2023 20:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695006094; x=1726542094;
  h=from:to:cc:subject:date:message-id;
  bh=+6Q0VR7aQDb8sx9TqSkQzuIotbifoyAUFgKK4Wpc+gQ=;
  b=YEPCQG9Uj88DepH275qjArtfqPgApazxQnEXfPslk67oDdIQetMeIAFy
   FAO9K3rXfFlV6r6+o4UyPNv5VMZ/auN8x7uufc+VEYtTuZ4mfdwOo9el5
   Ngac4IhSSLFgR+QNA1Vz7fQFn5UhVAzYJ4xAfUxtx0etfNY0w88bny1F/
   Zu5B2zN1/FjslKNrrfRcBUMuMzydVM/q6jbIzkx4ihHhYtzvvuiJp0YJy
   GAssUsAyYy3qXOIB2eSpYcv4d4/Cwp8qDWOiSGYf2H//ekuN0iTIijAiI
   /r3dCiUP4/LDsCDYcyVu/MqBWWN1iPJsC8lTfN/8oPxkjOQ9f+7DHqUDC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="358968662"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="358968662"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 20:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="748855792"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="748855792"
Received: from ipu5-build.bj.intel.com ([10.238.232.146])
  by fmsmga007.fm.intel.com with ESMTP; 17 Sep 2023 20:01:31 -0700
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        qingwu.zhang@intel.com
Cc:     bingbu.cao@linux.intel.com, krzk@kernel.org, jim.lai@intel.com
Subject: [PATCH] media: i2c/hi556: add a new mode 1296x722 settings
Date:   Mon, 18 Sep 2023 10:58:12 +0800
Message-Id: <1695005892-11494-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new mode - 16:9 resolution 1296x722 for hi556.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
---
 drivers/media/i2c/hi556.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index fd56ba138739..b8dcdfe67eb4 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -477,6 +477,50 @@ static const struct hi556_reg mode_1296x972_regs[] = {
 	{0x0958, 0xbb80},
 };
 
+static const struct hi556_reg mode_1296x722_regs[] = {
+	{0x0a00, 0x0000},
+	{0x0b0a, 0x8259},
+	{0x0f30, 0x5b15},
+	{0x0f32, 0x7167},
+	{0x004a, 0x0100},
+	{0x004c, 0x0000},
+	{0x004e, 0x0100},
+	{0x000c, 0x0122},
+	{0x0008, 0x0b00},
+	{0x005a, 0x0404},
+	{0x0012, 0x000c},
+	{0x0018, 0x0a33},
+	{0x0022, 0x0008},
+	{0x0028, 0x0017},
+	{0x0024, 0x0022},
+	{0x002a, 0x002b},
+	{0x0026, 0x012a},
+	{0x002c, 0x06cf},
+	{0x002e, 0x3311},
+	{0x0030, 0x3311},
+	{0x0032, 0x3311},
+	{0x0006, 0x0814},
+	{0x0a22, 0x0000},
+	{0x0a12, 0x0510},
+	{0x0a14, 0x02d2},
+	{0x003e, 0x0000},
+	{0x0074, 0x0812},
+	{0x0070, 0x0409},
+	{0x0804, 0x0308},
+	{0x0806, 0x0100},
+	{0x0a04, 0x016a},
+	{0x090c, 0x09c0},
+	{0x090e, 0x0010},
+	{0x0902, 0x4319},
+	{0x0914, 0xc106},
+	{0x0916, 0x040e},
+	{0x0918, 0x0304},
+	{0x091a, 0x0708},
+	{0x091c, 0x0e06},
+	{0x091e, 0x0300},
+	{0x0958, 0xbb80},
+};
+
 static const char * const hi556_test_pattern_menu[] = {
 	"Disabled",
 	"Solid Colour",
@@ -556,7 +600,25 @@ static const struct hi556_mode supported_modes[] = {
 			.regs = mode_1296x972_regs,
 		},
 		.link_freq_index = HI556_LINK_FREQ_437MHZ_INDEX,
-	}
+	},
+	{
+		.width = 1296,
+		.height = 722,
+		.crop = {
+			.left = HI556_PIXEL_ARRAY_LEFT,
+			.top = 250,
+			.width = HI556_PIXEL_ARRAY_WIDTH,
+			.height = 1444
+		},
+		.fll_def = HI556_FLL_30FPS,
+		.fll_min = HI556_FLL_30FPS_MIN,
+		.llp = 0x0b00,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1296x722_regs),
+			.regs = mode_1296x722_regs,
+		},
+		.link_freq_index = HI556_LINK_FREQ_437MHZ_INDEX,
+	},
 };
 
 struct hi556 {
-- 
2.7.4

