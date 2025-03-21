Return-Path: <linux-media+bounces-28567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7CA6BB63
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 14:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 255A2173BE5
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 13:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2A922AE75;
	Fri, 21 Mar 2025 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/OnUb6j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A651E87B;
	Fri, 21 Mar 2025 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742562222; cv=none; b=GG8vPJVeJYSm7qGY18vFNO4K9+fytqpgQwW9yFvi40aqMC17vD9zVTBaStcdNC2ZIlM5bp6laV0mxYzSH4+I/FObrhXDUjAsNXimaSDQrIATbLWpQcaZcKsTdJysXYmZSk7z4khVKF005D9t5EdjuWDHluAaAhOtyJVZxyltHCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742562222; c=relaxed/simple;
	bh=RbGSfYMZiSR1R6pyGV7kYXdZSh+jN1eALQiLe7CfXTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uNKwKTEddySSPcF307Hngd6ej19FruWII8AQ6RLkPvk/1dTIrRgPLJDT4gVYlKj7DMGgLJxxdJT0aCtKIL95qEjM1dTlTrNvb+6+ezkYu+GWaf0sUudHFqKDA+a9U4Xub0F1oLQXXZ5RgEf1saZbNhgeC7ll7HO5DQ/rm2eXIw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/OnUb6j; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742562220; x=1774098220;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RbGSfYMZiSR1R6pyGV7kYXdZSh+jN1eALQiLe7CfXTg=;
  b=O/OnUb6j1rBiO1TQErCrMimOErOMSXmgZzXbcKptwk9BIkgH5KXTe9v9
   EIzgihzBSWVHORqMPpv6LLTPu3B8UdaEdPuu8AYQZD6shh17b3SalqP3P
   IiARk0mA3LHHOmbOuqREpl87OUg5z2kgqxRK7YubLjUX+EU6x1uCBd0i2
   GxQ0Sc1aFlYQc5xlALUvr5Q1lMp03mWCvLl/xUg1YTAoQ+TldNyjo1g0e
   AlicuiaBStq9N5xjowGNtpqJvLlHtrVQPWWRdXsHJW3QxZ8hw+CrvnNa8
   /ymNv5tKNAVZdlisrLSAoemsMtC4DO3CcKlq/QdkU0JZwYyFLSrNgM3o2
   A==;
X-CSE-ConnectionGUID: Vx+wKolmT4ODKOUsOOQmwQ==
X-CSE-MsgGUID: g0ZKNZW5Qq+VSYAcHPfuig==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47706519"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="47706519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 06:03:39 -0700
X-CSE-ConnectionGUID: K14PDU8GSrKUbRSuiyhpuw==
X-CSE-MsgGUID: qmIVk99gS0KqLgbW9AkF9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123911843"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.43])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 06:03:37 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	hverkuil@xs4all.nl,
	kieran.bingham@ideasonboard.com,
	naush@raspberrypi.com,
	mchehab@kernel.org,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [RFC PATCH v4] media: v4l2-common: Add a helper for obtaining the clock producer
Date: Fri, 21 Mar 2025 14:03:29 +0100
Message-ID: <20250321130329.342236-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
platforms to retrieve a reference to the clock producer from firmware.

This helper behaves the same as clk_get_optional() except where there is
no clock producer like in ACPI-based platforms.

For ACPI-based platforms the function will read the "clock-frequency"
ACPI _DSD property and register a fixed frequency clock with the frequency
indicated in the property.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
v1 -> v2:
Suggested by Sakari:
    - removed clk_name
    - removed the IS_ERR() check
    - improved the kernel-doc comment and commit msg
Link v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com

v2 -> v3:
- Added #ifdef CONFIG_COMMON_CLK for the ACPI case
Link v2: https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/

v3 -> v4:
Suggested by Laurent:
	- removed the #ifdef to use IS_REACHABLE(CONFIG_COMMON_CLK)
	- changed to kasprintf() to allocate the clk name when id is NULL and
	  used the __free(kfree) scope-based cleanup helper when
	  defining the variable to hold the allocated name
Link v3: https://lore.kernel.org/linux-media/20250321093814.18159-1-mehdi.djait@linux.intel.com/


 drivers/media/v4l2-core/v4l2-common.c | 40 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 18 ++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..b33152e2c3af 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -34,6 +34,9 @@
  * Added Gerd Knorrs v4l1 enhancements (Justin Schoeman)
  */
 
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/kernel.h>
@@ -636,3 +639,40 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
+
+struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
+{
+	const char *clk_id __free(kfree) = NULL;
+	struct clk_hw *clk_hw;
+	struct clk *clk;
+	u32 rate;
+	int ret;
+
+	clk = devm_clk_get_optional(dev, id);
+	if (clk)
+		return clk;
+
+	if (!IS_REACHABLE(CONFIG_COMMON_CLK))
+		return ERR_PTR(-ENOENT);
+
+	if (!is_acpi_node(dev_fwnode(dev)))
+		return ERR_PTR(-ENOENT);
+
+	ret = device_property_read_u32(dev, "clock-frequency", &rate);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (!id) {
+		clk_id = kasprintf(GFP_KERNEL, "clk-%s", dev_name(dev));
+		if (!clk_id)
+			return ERR_PTR(-ENOMEM);
+		id = clk_id;
+	}
+
+	clk_hw = devm_clk_hw_register_fixed_rate(dev, id, NULL, 0, rate);
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+}
+EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 63ad36f04f72..35b9ac698e8a 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -573,6 +573,24 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 			     unsigned int num_of_driver_link_freqs,
 			     unsigned long *bitmap);
 
+/**
+ * devm_v4l2_sensor_clk_get - lookup and obtain a reference to an optional clock
+ *			      producer for a camera sensor.
+ *
+ * @dev: device for v4l2 sensor clock "consumer"
+ * @id: clock consumer ID
+ *
+ * This function behaves the same way as clk_get_optional() except where there
+ * is no clock producer like in ACPI-based platforms.
+ * For ACPI-based platforms, the function will read the "clock-frequency"
+ * ACPI _DSD property and register a fixed-clock with the frequency indicated
+ * in the property.
+ *
+ * Return:
+ * * pointer to a struct clk on success or an error code on failure.
+ */
+struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
+
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
-- 
2.48.1


