Return-Path: <linux-media+bounces-33005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBFABF1D1
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 12:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 092ED3B2B47
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 10:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D1525F98E;
	Wed, 21 May 2025 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhKdZrnL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C125F96C;
	Wed, 21 May 2025 10:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824090; cv=none; b=nYmLjN7r+dz+oUpuMHE81NMPNFYtinjCdwvgeVzhcVRMRk16xAUGO055Txf4qsPKE4l+87d4Wtt13iuf5XBWMeGHFgLq7CMm5JIaUDkLZscG1iDaEmUMKuYV5nMEwxdvBFEaKWTNZp9aft3x8140cAOWtgQ41GN+m/NO7y+iotw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824090; c=relaxed/simple;
	bh=+wlc/7OClAAA467deiIvJUNQ18kvAOcac006bNFNMl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sF253p43O6iCd7Dzv0KiWzPLSaFpXsQCkMZCeXGuZsG7+Axapc6MzIoIEXFl4RcoDEBhFm2bjXlG2JspXna+i0ebjMLQAP+0DBnD2MdMD5bl41+JnTfCzzffjTSTUymXYFp6oTTBucHzSGm0A9J7TfT5p+RYfRroP+wd8YnpId4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhKdZrnL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747824089; x=1779360089;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+wlc/7OClAAA467deiIvJUNQ18kvAOcac006bNFNMl8=;
  b=RhKdZrnLAGPRWBlkGoiBTtQve5tV1bLmECgidENkeJo3rrrMulyRkG5E
   7qs+n9x81UJztNXHRP0jI7N0y+8icFvDeOLsI4PYWq8ScT85Yo+yBr7k+
   nWpfnVlD67tXnF2JrUqixLENRkeFZfwy50P8LeUAbvjnPst8crPq0HRfp
   n9kcIfVARmlHbAqbqDAjJ0QtXqkLh252+Y2+795njI2pGghX7jvlZbeKl
   L54ZBaWlyRO9NjMLk+IeBq2jGlyHKIH75JXiEymDwUlPRPsTkgJ9y/Qe3
   iiYLelijnfX6HYBoxc3RCyaBtCOmNDsqDX5jk6rdPN8FLi/joFOhjAEap
   A==;
X-CSE-ConnectionGUID: HFs6aSiqSimOpw/tHYT1ZQ==
X-CSE-MsgGUID: XeUU8TzAQjCY7nrhTrXxOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49855699"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49855699"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:41:28 -0700
X-CSE-ConnectionGUID: SDlHgTFeRkmDs+jO+knkLQ==
X-CSE-MsgGUID: c6WzZpZ0RSudqTbbvIOBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="140535595"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.231])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:41:24 -0700
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
	arnd@arndb.de,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [RFC PATCH v5] media: v4l2-common: Add a helper for obtaining the clock producer
Date: Wed, 21 May 2025 12:41:15 +0200
Message-ID: <20250521104115.176950-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

This function also handles the special ACPI-based system case where:
The clock-frequency _DSD property is present.
A reference to the clock producer is present, where the clock is provided
by a camera sensor PMIC driver (e.g. int3472/tps68470.c).
In this case try to set the clock-frequency value to the provided clock.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
v4 -> v5:
Suggested by Arnd Bergmann:
	- removed IS_REACHABLE(CONFIG_COMMON_CLK). IS_REACHABLE() is actually
	discouraged [1]. COFIG_COMMON_CLK is a bool, so IS_ENABLED() will be the
	right solution here
Suggested by Hans de Goede:
	- added handling for the special ACPI-based system case, where
	  both a reference to the clock-provider and the _DSD
	  clock-frequency are present.
	- updated the function's kernel-doc and the commit msg
	  to mention this special case.
Link v4: https://lore.kernel.org/linux-media/20250321130329.342236-1-mehdi.djait@linux.intel.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/kbuild/kconfig-language.rst?h=next-20250513&id=700bd25bd4f47a0f4e02e0a25dde05f1a6b16eea

v3 -> v4:
Suggested by Laurent:
	- removed the #ifdef to use IS_REACHABLE(CONFIG_COMMON_CLK)
	- changed to kasprintf() to allocate the clk name when id is NULL and
	  used the __free(kfree) scope-based cleanup helper when
	  defining the variable to hold the allocated name
Link v3: https://lore.kernel.org/linux-media/20250321093814.18159-1-mehdi.djait@linux.intel.com/

v2 -> v3:
- Added #ifdef CONFIG_COMMON_CLK for the ACPI case
Link v2: https://lore.kernel.org/linux-media/20250310122305.209534-1-mehdi.djait@linux.intel.com/

v1 -> v2:
Suggested by Sakari:
    - removed clk_name
    - removed the IS_ERR() check
    - improved the kernel-doc comment and commit msg
Link v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com



 drivers/media/v4l2-core/v4l2-common.c | 46 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 25 +++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 4ee4aa19efe6..6099acd339ad 100644
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
@@ -665,3 +668,46 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
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
+	ret = device_property_read_u32(dev, "clock-frequency", &rate);
+
+	if (clk) {
+		if (!ret) {
+			ret = clk_set_rate(clk, rate);
+			if (ret)
+				dev_warn(dev, "Failed to set clock rate: %u\n",
+					 rate);
+		}
+
+		return clk;
+	}
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_acpi_node(dev_fwnode(dev)))
+		return ERR_PTR(-ENOENT);
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
index fda903bb3674..5ddbf7b3d9c3 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -586,6 +586,31 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
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
+ *
+ * For ACPI-based platforms, the function will read the "clock-frequency"
+ * ACPI _DSD property and register a fixed-clock with the frequency indicated
+ * in the property.
+ *
+ * This function also handles the special ACPI-based system case where:
+ * The clock-frequency _DSD property is present.
+ * A reference to the clock producer is present, where the clock is provided by
+ * a camera sensor PMIC driver (e.g. int3472/tps68470.c)
+ * In this case try to set the clock-frequency value to the provided clock.
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
2.49.0


