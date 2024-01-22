Return-Path: <linux-media+bounces-3955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC0E83597E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 03:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26C41281B59
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 02:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D578F139B;
	Mon, 22 Jan 2024 02:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGkYQIcQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FD2EBB
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 02:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705892126; cv=none; b=O1NJE7z3cycG9KxD9+J5h9vJ/mXgs8mVFbPE7QLDz+s9Lw4zYsic2UYcjpAozmus97D1oGkz+3R8TOZTnIpkpY5ixClV2OCxWTAr5mZHkqCti4h8Hk/qDxqqzs53ryVIJpmaPWrDK1144DTn/svpU/8dSYSxCexdZ7+4Tqe26Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705892126; c=relaxed/simple;
	bh=/zEJgpG4O0GwCO3+FLxMndbCC0Ah7dHUjum9aCDozVA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q/xmfs9n4RyeqNEVP3GheKo/LGrc9YxK9Phcj+x/o84YN3N6iRK1EIBSlFYGDHg6rJNBRsYcxgcsAWGxqy4MWyMfVd1NuYty3NgmBf+OVfrQiILOXgwLQpmxscQJ8G9Zmmi0401zWNCuydszjcJUtU9WdVOs/Qh3LypYp++q3x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGkYQIcQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705892124; x=1737428124;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/zEJgpG4O0GwCO3+FLxMndbCC0Ah7dHUjum9aCDozVA=;
  b=OGkYQIcQHKWY7XzqxpfPLqo89zvSHuNxmxhhALndfKSKGYShVLPY5zo3
   tesyTz9u/8R3wjQrEISk69LrY7Z1oziXDZuKcsAldelzflObaLCv9LLbe
   B+nz5NzNZX0UDgRYjbE+V9J2zcPuXxT9YUvIfFEcq6Y2GeHAmqDXpDkRH
   7zTMpuY/SJmPXhJj+A3SR71blkEqemkoFZE5dTE43S+59Zpfp6pU4u1Ov
   4kpk1ti3PujFDzu+gkVr4i3udo7kWXkk2JYiNIuGPC4XqQ5OS5BrlEq+y
   55LMQcbB91zORV5X2vURrT0KD8aINOkZh7gdqi9UPf5SD2+T65qIuc2s2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="19663866"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="19663866"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 18:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="958612864"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="958612864"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.227.107.10])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2024 18:55:20 -0800
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy.yeh@intel.com,
	qingwu.zhang@intel.com,
	bingbu.cao@linux.intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v2] media: ov08x40: Avoid sensor probing in D0 state
Date: Mon, 22 Jan 2024 10:54:34 +0800
Message-Id: <20240122025434.3002620-1-jason.z.chen@intel.com>
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
 drivers/media/i2c/ov08x40.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index ddcb4b6848b..4139efce42f 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2453,6 +2453,9 @@ struct ov08x40 {
 
 	/* Mutex for serialized access */
 	struct mutex mutex;
+
+	/* True if the device has been identified */
+	bool identified;
 };
 
 #define to_ov08x40(_sd)	container_of(_sd, struct ov08x40, sd)
@@ -2997,6 +3000,9 @@ static int ov08x40_identify_module(struct ov08x40 *ov08x)
 	int ret;
 	u32 val;
 
+	if (ov08x->identified)
+		return 0;
+
 	ret = ov08x40_read_reg(ov08x, OV08X40_REG_CHIP_ID,
 			       OV08X40_REG_VALUE_24BIT, &val);
 	if (ret)
@@ -3005,9 +3011,11 @@ static int ov08x40_identify_module(struct ov08x40 *ov08x)
 	if (val != OV08X40_CHIP_ID) {
 		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
 			OV08X40_CHIP_ID, val);
-		return -EIO;
+		return -ENXIO;
 	}
 
+	ov08x->identified = true;
+
 	return 0;
 }
 
@@ -3225,6 +3233,7 @@ static int ov08x40_probe(struct i2c_client *client)
 {
 	struct ov08x40 *ov08x;
 	int ret;
+	bool full_power;
 
 	/* Check HW config */
 	ret = ov08x40_check_hwcfg(&client->dev);
@@ -3240,11 +3249,14 @@ static int ov08x40_probe(struct i2c_client *client)
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
@@ -3272,11 +3284,8 @@ static int ov08x40_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto error_media_entity;
 
-	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
-	 */
-	pm_runtime_set_active(&client->dev);
+	if (full_power)
+		pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
 
@@ -3320,6 +3329,7 @@ static struct i2c_driver ov08x40_i2c_driver = {
 	},
 	.probe = ov08x40_probe,
 	.remove = ov08x40_remove,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 
 module_i2c_driver(ov08x40_i2c_driver);
-- 
2.34.1


