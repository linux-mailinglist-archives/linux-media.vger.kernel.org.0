Return-Path: <linux-media+bounces-3235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F7D8251C7
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 11:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 491251C21597
	for <lists+linux-media@lfdr.de>; Fri,  5 Jan 2024 10:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D6624B50;
	Fri,  5 Jan 2024 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U499RrVh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C1C24B43
	for <linux-media@vger.kernel.org>; Fri,  5 Jan 2024 10:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704450055; x=1735986055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fXkWjPvxl2VSUEpWxpCbnQjv1Rlt4kVDWe2GBj6IElw=;
  b=U499RrVhJ2bElsvF3n/rUQB1cg9UVpnIuB0m0Wsfw7mMzsE2I9rXUguG
   qbRrqN71y2gD93VAdfziT6vW2XEaIrTe4crGKISZFoGHe8yGLkInOGzwr
   o2J0ygPlkTC/0s1F5KagTDBxf4ty4KtHZKWK/NVIaXp0cUrPzmkrql4Lq
   5VVnBkNWtFHD7+CqRvW8U/JslxuszF3xWAdnljqK9o0kQsEYQqPlkMB27
   yS1El4XRrGN+6jSdIzahcglE75vnrqEC75zUlYTSK/5B3gGZbhSz7YvmI
   MpjEHcCoUKdA8hW4SaxQwdPrVCFJO1RrdqoEbjm8IbgnfiTsuRKctZV1n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="18993882"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="18993882"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 02:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="814926898"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="814926898"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.227.107.10])
  by orsmga001.jf.intel.com with ESMTP; 05 Jan 2024 02:20:51 -0800
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy.yeh@intel.com,
	qingwu.zhang@intel.com,
	bingbu.cao@linux.intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v1] media: ov08x40: Avoid sensor probing in D0 state
Date: Fri,  5 Jan 2024 18:20:08 +0800
Message-Id: <20240105102008.2879073-1-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Chen <jason.z.chen@intel.com>

When the system enters the D0 state and attempt to probe the device,
another component, such as LED, will also be pulled high due to the
hardware design. It's advisable to keep the device being probed in
a different D state.

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 8f24be08c7b..f46cf0eb6c1 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -3226,6 +3226,7 @@ static int ov08x40_probe(struct i2c_client *client)
 {
 	struct ov08x40 *ov08x;
 	int ret;
+	bool full_power;
 
 	/* Check HW config */
 	ret = ov08x40_check_hwcfg(&client->dev);
@@ -3241,11 +3242,14 @@ static int ov08x40_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov08x->sd, client, &ov08x40_subdev_ops);
 
-	/* Check module identity */
-	ret = ov08x40_identify_module(ov08x);
-	if (ret) {
-		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
-		return ret;
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
+		/* Check module identity */
+		ret = ov08x40_identify_module(ov08x);
+		if (ret) {
+			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
+			return ret;
+		}
 	}
 
 	/* Set default mode to max resolution */
@@ -3277,7 +3281,8 @@ static int ov08x40_probe(struct i2c_client *client)
 	 * Device is already turned on by i2c-core with ACPI domain PM.
 	 * Enable runtime PM and turn off the device.
 	 */
-	pm_runtime_set_active(&client->dev);
+	if (full_power)
+		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
@@ -3321,6 +3326,7 @@ static struct i2c_driver ov08x40_i2c_driver = {
 	},
 	.probe = ov08x40_probe,
 	.remove = ov08x40_remove,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 
 module_i2c_driver(ov08x40_i2c_driver);
-- 
2.34.1


