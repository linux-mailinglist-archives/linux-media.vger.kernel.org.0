Return-Path: <linux-media+bounces-27956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A79A59421
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEEF818897C8
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEAB2253E6;
	Mon, 10 Mar 2025 12:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPSEGU/E"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10A21C182;
	Mon, 10 Mar 2025 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741609401; cv=none; b=eXujqVHv7BuIbWODzzZI+TOo9FR4TMkTflF9MJbBRQmxCUQLCyLXSl76RL+C5JjAR6nyw4KCPgd0qGKd9KNl+CNK+4T7oY3x+uFW5AXgEKq7+Lngg7nOhOUluPerDuVw5P6hrAocA5cUiBegWMyvHiUAu3xVxck1W4Tv/BpDOOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741609401; c=relaxed/simple;
	bh=dT//UUcj+RqiVI68CLZOn94nDljT+vtKOHfROrfwdSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZVWP2MJVbBa7VEuqWrc46FvAQNZQ9wbKhMyXI6WgO4JeN7Mf298iw8FjnWShTxnjPXZFRzTE0LA64cAnnUFlNTmenZD1R1Ql4dVEaOmHJPWx97hrGE6cTRL7amE7/HldKdYyaqau0o0le1XO6ZHf+J0TQTgor+lFfxt7EyA2A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPSEGU/E; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741609399; x=1773145399;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dT//UUcj+RqiVI68CLZOn94nDljT+vtKOHfROrfwdSw=;
  b=BPSEGU/EMbMnxiuEGWBnnMG/qH5h53qFmHTffCY06TzAqn8hDln+ldh3
   O9KrSMd0zuT9ZhLD3/wdHxu0rT7FuSisYMbBEExDTSdJ5nHhFaDO6UKyj
   cTbYNjshSNz1fAGIyBY3X0zdegEPtm+0iUv9H6YuZJzFMHmIPMGYwn8Dx
   x+Tfkq93QGcb3fYCTgEqRbbX9H6lHEp6qj+vYmnImo427UgogMGXmWgmW
   2ckmhstZ8m4StP+mAjEGUBGi9kmobf4M0SWrbcDcla7kfkBoMpvkj6cM/
   U742JPHzWH8ov5FFN/HjrdQIXUVvmTthBcEbrfpvt53TybyMp9G/guS/Y
   w==;
X-CSE-ConnectionGUID: gBevGz15QM6XA/E1BjUHFw==
X-CSE-MsgGUID: 7zhOEFWLTair7Ze/aPjIvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="60152464"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="60152464"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 05:23:18 -0700
X-CSE-ConnectionGUID: GQUR5dldQLyIwz1CGDA+zQ==
X-CSE-MsgGUID: 0oZjZxIQQCWgUgyXGCaDSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="124586068"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.245])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 05:23:15 -0700
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
Subject: [RFC PATCH v2] media: v4l2-common: Add a helper for obtaining the clock producer
Date: Mon, 10 Mar 2025 13:23:05 +0100
Message-ID: <20250310122305.209534-1-mehdi.djait@linux.intel.com>
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
no clock producer like ACPI-based platforms.

For ACPI-based platforms the function will read the "clock-frequency"
ACPI _DSD property and register a fixed frequency clock with the frequency
indicated in the property.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
Link for discussion (where this patch was proposed): https://lore.kernel.org/linux-media/20250220154909.152538-1-mehdi.djait@linux.intel.com/

v1 -> v2:
Suggested by Sakari:
    - removed clk_name
    - removed the IS_ERR() check
    - improved the kernel-doc comment and commit msg
Link for v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com

 drivers/media/v4l2-core/v4l2-common.c | 35 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 18 ++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..99d826acb213 100644
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
@@ -636,3 +639,35 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
+
+struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
+{
+	struct clk_hw *clk_hw;
+	struct clk *clk;
+	u32 rate;
+	int ret;
+
+	clk = devm_clk_get_optional(dev, id);
+	if (clk)
+		return clk;
+
+	if (!is_acpi_node(dev_fwnode(dev)))
+		return ERR_PTR(-ENOENT);
+
+	ret = device_property_read_u32(dev, "clock-frequency", &rate);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (!id) {
+		id = devm_kasprintf(dev, GFP_KERNEL, "clk-%s", dev_name(dev));
+		if (!id)
+			return ERR_PTR(-ENOMEM);
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


