Return-Path: <linux-media+bounces-27141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E51BA4790A
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 10:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79E117A59C2
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 09:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46967227E96;
	Thu, 27 Feb 2025 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXIH+4j5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CCE226D06;
	Thu, 27 Feb 2025 09:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740648417; cv=none; b=GNyhWirpCoKtjUk3MbUcYZhYTvXPC54M7J2658ygGRovK5tY1tg3bqfYVmyB2yg5/nptNSi4k4kgLaStOHwvL0N1O0ro/Ap0KJIgzv1WpKnnXluBbdRT6XItDQ4gT4AXthT41ImTcgTMji2vqK32wmQFKupyBjX4ycvGCbD8TNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740648417; c=relaxed/simple;
	bh=S1XOeVmtQkcD/IsX/mGhIpVMvMKU1yve/GlRx1cRLgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cFB2HcRkFNzljqEQWBWVLI4FsWfVZlHB9BW9OkNkUe3cAzegkuluHwZTphK+bQIIwC1yVu4OGx/b0eOEDJaMB/Yhm91XiKL40u45e0O5GtixzhWuyWDy5jN/Zb3SjtPVnmp9N9FXl4sbdGb2FiW/VfmxhJrVqPcrtcd9ek4l6Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXIH+4j5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740648417; x=1772184417;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S1XOeVmtQkcD/IsX/mGhIpVMvMKU1yve/GlRx1cRLgE=;
  b=DXIH+4j5Dn8LXMH8NLt0prCM28QL7lCzMAEXsa9G4ZrFL1n/yLrzsquT
   9ebHN/JRumCdIwSC9bTzkvr9XcOXA3PgcR22yk91vYC3P/kn6klyiM0Vl
   LB/vNWaBjUEYTkLb845lPr2uhbIok8WQyCtH35CO9ntTet4HKq210uaLm
   r8J0NniLZ3fRvQeDAXwlnmZQdAk0tuqdXOVn1yiq/CD5XrtCRDrwOc23X
   A4S+wTl3UARfl/HNr/4YX928j5d/yEGYH5cC8JQvavPtSofdBve9FcEpN
   Kr7VtAyhSo5Jk1TOIVOmVPWr1LIGVk10vlnVMxzfnirvzTB+7/eMYeQdm
   Q==;
X-CSE-ConnectionGUID: psYvn6rRR4SqBRKB/Qc4pg==
X-CSE-MsgGUID: 9GyMvUcdSZOiSrqF7rVeRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58945456"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="58945456"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 01:26:56 -0800
X-CSE-ConnectionGUID: nENdso6DTfa6qS65dYaoyA==
X-CSE-MsgGUID: QDsYqhjQQk6TLy1G6HX71Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121571993"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 01:26:52 -0800
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
Subject: [RFC PATCH v1] media: v4l2-common: Add a helper for obtaining the clock producer
Date: Thu, 27 Feb 2025 10:26:43 +0100
Message-ID: <20250227092643.113939-1-mehdi.djait@linux.intel.com>
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
no clock producer like typically in ACPI-based platforms.
For ACPI-based platforms the function will read the "clock-frequency"
property (_DSD ACPI property) and register a fixed frequency clock with
the frequency indicated in the property.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 38 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 19 ++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..308a13536ac3 100644
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
@@ -636,3 +639,38 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
+
+struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
+{
+	struct clk_hw *clk_hw;
+	struct clk *clk;
+	char *clk_name;
+	u32 rate;
+	int ret;
+
+	clk = devm_clk_get_optional(dev, id);
+	if (clk || IS_ERR(clk))
+		return clk;
+
+	if (!is_acpi_node(dev_fwnode(dev)))
+		return ERR_PTR(-EINVAL);
+
+	ret = device_property_read_u32(dev, "clock-frequency", &rate);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (!id) {
+		clk_name = devm_kasprintf(dev, GFP_KERNEL, "clk-%s",
+					  dev_name(dev));
+		if (!clk_name)
+			return ERR_PTR(-ENOMEM);
+	}
+
+	clk_hw = devm_clk_hw_register_fixed_rate(dev, id ? id : clk_name, NULL,
+						 0, rate);
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+}
+EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 63ad36f04f72..6446575b2a75 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -573,6 +573,25 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
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
+ * property (_DSD ACPI property) and register a fixed-clock with the frequency
+ * indicated in the property.
+ *
+ * Return:
+ * * %pointer to a struct clk: Success
+ * * %valid IS_ERR() condition containing errno: Failure
+ */
+struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
+
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
-- 
2.48.1


