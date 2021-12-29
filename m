Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C645480F33
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 04:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238491AbhL2DSN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Dec 2021 22:18:13 -0500
Received: from mga07.intel.com ([134.134.136.100]:19067 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231775AbhL2DSM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Dec 2021 22:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640747892; x=1672283892;
  h=from:to:cc:subject:date:message-id;
  bh=rgVM2tFX4W4CSDoV5xGa4VZUqGILKR+InaRCrCIRvmc=;
  b=BQ+xl0CkUWmjHz2cgtN6ad7ZGsm9mxF9nIMp2Ek0BVHJ0XZ0+sYTvEJv
   DSD+cRhKrHXS3ZSA1TYViSA2Z4ZVBdxUZZ7wMRPpNSTFQL4Sgf12H7fyl
   4WXDavuM5mElkPtxsn/DgmeHUYZ+G971nT1ROZ8jvXWYLQC87rWMOgtkl
   leI2NGtfuudTkN/x9uS62SYPgQp8nX9IPs3yHDBDAFWVwE5yzpYnaBkHe
   0jZi0qI3Vt+BY+R8d+EZiFACTMyTFup5prLIex7eEnQvlOOSRUGA9+Bjs
   FMfmE+oYaEhUdqC0sEIinuKU5p1RVVDt7qWSJvLlXRgH6WUWSf14Vjq8t
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="304814611"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="304814611"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2021 19:18:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="524706321"
Received: from ipu5-build.bj.intel.com ([10.238.232.188])
  by fmsmga007.fm.intel.com with ESMTP; 28 Dec 2021 19:18:10 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
Cc:     shawnx.tu@intel.com, krzk@kernel.org, senozhatsky@chromium.org,
        tfiga@chromium.org, bingbu.cao@intel.com,
        bingbu.cao@linux.intel.com, andy.yeh@intel.com
Subject: [PATCH] media: ov8856: apply digital gain by setting global gain control register
Date:   Wed, 29 Dec 2021 11:15:15 +0800
Message-Id: <1640747715-15435-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MWB gain register are used to set gain for each mwb channel mannually.
However, it will involve some artifacts if gain cannot be applied to
each channel synchronously. Enable global gain control to set digital
global gain instead of setting AWB gain separately to fix this issue.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/ov8856.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 8785764b7a74..a9728afc81d4 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -63,6 +63,7 @@
 #define	OV8856_ANAL_GAIN_STEP		1
 
 /* Digital gain controls from sensor */
+#define OV8856_REG_DIGITAL_GAIN		0x350a
 #define OV8856_REG_MWB_R_GAIN		0x5019
 #define OV8856_REG_MWB_G_GAIN		0x501b
 #define OV8856_REG_MWB_B_GAIN		0x501d
@@ -351,7 +352,7 @@ static const struct ov8856_reg lane_2_mode_3280x2464[] = {
 		{0x484b, 0x05},
 		{0x5000, 0x57},
 		{0x5001, 0x0a},
-		{0x5004, 0x04},
+		{0x5004, 0x06},
 		{0x502e, 0x03},
 		{0x5030, 0x41},
 		{0x5795, 0x02},
@@ -543,7 +544,7 @@ static const struct ov8856_reg lane_2_mode_1640x1232[] = {
 		{0x484b, 0x05},
 		{0x5000, 0x57},
 		{0x5001, 0x0a},
-		{0x5004, 0x04},
+		{0x5004, 0x06},
 		{0x502e, 0x03},
 		{0x5030, 0x41},
 		{0x5795, 0x00},
@@ -734,7 +735,7 @@ static const struct ov8856_reg lane_4_mode_3280x2464[] = {
 		{0x484b, 0x05},
 		{0x5000, 0x57},
 		{0x5001, 0x0a},
-		{0x5004, 0x04},
+		{0x5004, 0x06},
 		{0x502e, 0x03},
 		{0x5030, 0x41},
 		{0x5780, 0x14},
@@ -925,7 +926,7 @@ static const struct ov8856_reg lane_4_mode_1640x1232[] = {
 		{0x484b, 0x05},
 		{0x5000, 0x57},
 		{0x5001, 0x0a},
-		{0x5004, 0x04},
+		{0x5004, 0x06},
 		{0x502e, 0x03},
 		{0x5030, 0x41},
 		{0x5780, 0x14},
@@ -1755,19 +1756,7 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 
 static int ov8856_update_digital_gain(struct ov8856 *ov8856, u32 d_gain)
 {
-	int ret;
-
-	ret = ov8856_write_reg(ov8856, OV8856_REG_MWB_R_GAIN,
-			       OV8856_REG_VALUE_16BIT, d_gain);
-	if (ret)
-		return ret;
-
-	ret = ov8856_write_reg(ov8856, OV8856_REG_MWB_G_GAIN,
-			       OV8856_REG_VALUE_16BIT, d_gain);
-	if (ret)
-		return ret;
-
-	return ov8856_write_reg(ov8856, OV8856_REG_MWB_B_GAIN,
+	return ov8856_write_reg(ov8856, OV8856_REG_DIGITAL_GAIN,
 				OV8856_REG_VALUE_16BIT, d_gain);
 }
 
-- 
2.7.4

