Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39AE87A191E
	for <lists+linux-media@lfdr.de>; Fri, 15 Sep 2023 10:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjIOIqH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 04:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233093AbjIOIqD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 04:46:03 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB8C2717
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694767558; x=1726303558;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N4U1xEY/L/XxPa+S6RoX5i0piSYYryWIM3J9u6Q8Ip8=;
  b=nTTL9MXbimaLBCjIhIc+voFY6Nfbjff66bhOghx+r1wJL0jHTstqiJyC
   XU2V0YkCXjcaK07czBru/5v5CAlwIkJ5HUrxfmrPC++ZGI93Kg41EadlZ
   oIo3eXI7LkTGF8zA//dOtIN0j51l6Sh2Zt40wj+bxOsxLE/BbN0qQZ6XC
   MPuR7t2SWibDTd6H3xkHwLof8GJq8N02iWvF01CEtOFsUAVoa3u5jBEaf
   a6v9bNT6EP20OboCtO8B00IgRRqujFYay8Y1g6x7YMzRzjFET934oMEON
   EnFYE2SXZw7xCHuhA4NQUPI4DG53txnn/VU/YAuClxzXuyBajXYsv5+mn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465564174"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="465564174"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 01:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="810447505"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="810447505"
Received: from haoyao-desk.bj.intel.com ([10.238.232.41])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 01:45:56 -0700
From:   Hao Yao <hao.yao@intel.com>
To:     linux-media@vger.kernel.org, arec.kao@intel.com
Cc:     sakari.ailus@intel.com, bingbu.cao@intel.com, arun.t@intel.com,
        daxing.li@intel.com, Hao Yao <hao.yao@intel.com>
Subject: [PATCH] media: ov13b10: Add 1364x768 register settings
Date:   Fri, 15 Sep 2023 16:45:27 +0800
Message-Id: <20230915084527.170824-1-hao.yao@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit adds support for:

- 1364x768 at 120 FPS

Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 drivers/media/i2c/ov13b10.c | 58 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index dbc642c5995b..d6e672042b39 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -31,6 +31,7 @@
 #define OV13B10_REG_VTS			0x380e
 #define OV13B10_VTS_30FPS		0x0c7c
 #define OV13B10_VTS_60FPS		0x063e
+#define OV13B10_VTS_120FPS		0x0320
 #define OV13B10_VTS_MAX			0x7fff
 
 /* HBLANK control - read only */
@@ -468,6 +469,50 @@ static const struct ov13b10_reg mode_2080x1170_regs[] = {
 	{0x5001, 0x0d},
 };
 
+static const struct ov13b10_reg mode_1364x768_120fps_regs[] = {
+	{0x0305, 0xaf},
+	{0x3011, 0x7c},
+	{0x3501, 0x03},
+	{0x3502, 0x00},
+	{0x3662, 0x88},
+	{0x3714, 0x28},
+	{0x3739, 0x10},
+	{0x37c2, 0x14},
+	{0x37d9, 0x06},
+	{0x37e2, 0x0c},
+	{0x37e4, 0x00},
+	{0x3800, 0x02},
+	{0x3801, 0xe4},
+	{0x3802, 0x03},
+	{0x3803, 0x48},
+	{0x3804, 0x0d},
+	{0x3805, 0xab},
+	{0x3806, 0x09},
+	{0x3807, 0x60},
+	{0x3808, 0x05},
+	{0x3809, 0x54},
+	{0x380a, 0x03},
+	{0x380b, 0x00},
+	{0x380c, 0x04},
+	{0x380d, 0x8e},
+	{0x380e, 0x03},
+	{0x380f, 0x20},
+	{0x3811, 0x07},
+	{0x3813, 0x07},
+	{0x3814, 0x03},
+	{0x3816, 0x03},
+	{0x3820, 0x8b},
+	{0x3c8c, 0x18},
+	{0x4008, 0x00},
+	{0x4009, 0x05},
+	{0x4050, 0x00},
+	{0x4051, 0x05},
+	{0x4501, 0x08},
+	{0x4505, 0x04},
+	{0x5000, 0xfd},
+	{0x5001, 0x0d},
+};
+
 static const char * const ov13b10_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Color Bar Type 1",
@@ -568,7 +613,18 @@ static const struct ov13b10_mode supported_modes[] = {
 			.regs = mode_2080x1170_regs,
 		},
 		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
-	}
+	},
+	{
+		.width = 1364,
+		.height = 768,
+		.vts_def = OV13B10_VTS_120FPS,
+		.vts_min = OV13B10_VTS_120FPS,
+		.link_freq_index = OV13B10_LINK_FREQ_INDEX_0,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1364x768_120fps_regs),
+			.regs = mode_1364x768_120fps_regs,
+		},
+	},
 };
 
 struct ov13b10 {
-- 
2.34.1

