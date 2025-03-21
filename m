Return-Path: <linux-media+bounces-28555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B32A6A6B7D6
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 10:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC0891896DDC
	for <lists+linux-media@lfdr.de>; Fri, 21 Mar 2025 09:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6352206A3;
	Fri, 21 Mar 2025 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EyTJ5Bbc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8552212FB3;
	Fri, 21 Mar 2025 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742549907; cv=none; b=bpL+RamiBV6spDRH8W3BN08/UFiYCUXhQkDaZ7uTTc62o62ndPrw6cpba/+NFGz4Rbe1CbVRB2dgqPV9aVIklralUcO9dA+Ip85Hrj3XdRRlcbrOzhGgbAsZOBVl2xmXeM6cVF5xds50bNMIG5TK2wn04S6aw+gtd9Rw0hNDCxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742549907; c=relaxed/simple;
	bh=I+g5uyiO8BthO6kUgy4ZEHhW95DL2yo/6eN6vFueBUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cMQeVaUwQjq+5wiZpXlB9WK8nbn/LtmJal8hiB9Fl4+rFq6ip/SRTB+CeO1VJz4iCKDs1C8KQw3qeFkX4gqUCRowVxrEztT1yxkkbwfFbNmIkWvl7QvEY68IQMjJWdDlm8KeOJpfvhEcn30pfnw8hAahGCoX2UnYsYHbDUWUOnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EyTJ5Bbc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742549906; x=1774085906;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I+g5uyiO8BthO6kUgy4ZEHhW95DL2yo/6eN6vFueBUc=;
  b=EyTJ5BbcPfOWV4sfyrPT4xypHJxdoiQqH8JGKR1h/IeM+mrC4z8TTolx
   ZYNFJwztURpk5QCvBBkVrYEi9MOPjLiYZsYxwyL7jOvp7pOD2PVYZjvpX
   ZSdW7z5tz5xZuuuPLYnZ/meHUwiF5/M07ZrbaAGO552fUOUU0n7R7cR+E
   gTBAeWcy0z4Kvml5Tr6avv2nJohFfsUrAc8qT6vInGtQ3P3sZ667MU/zm
   5q4hQsFFuo1EXCowv4aK+HwbKl1LUaPGjrc0HmcoMPvDSKNwUqv7UDk4b
   NIAohZnP4NdgJL83XlR89v5tKzREOUmrGpRjJJF8ME8HPcq2TQiM3KJkF
   A==;
X-CSE-ConnectionGUID: IqXpbv3nQ3aFmsr/5LTl9g==
X-CSE-MsgGUID: Q6qQAzHLTGy34LG4pzV9OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47692857"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="47692857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 02:38:25 -0700
X-CSE-ConnectionGUID: sUS3o+3GS4GAOYCitUd15g==
X-CSE-MsgGUID: Fs09Uo8ASs6mt6Nt72E0Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="123872631"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.43])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 02:38:22 -0700
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
Subject: [RFC PATCH v3] media: v4l2-common: Add a helper for obtaining the clock producer
Date: Fri, 21 Mar 2025 10:38:14 +0100
Message-ID: <20250321093814.18159-1-mehdi.djait@linux.intel.com>
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
Link for discussion (where this patch was proposed): https://lore.kernel.org/linux-media/20250220154909.152538-1-mehdi.djait@linux.intel.com/

v1 -> v2:
Suggested by Sakari:
    - removed clk_name
    - removed the IS_ERR() check
    - improved the kernel-doc comment and commit msg
Link for v1: https://lore.kernel.org/linux-media/20250227092643.113939-1-mehdi.djait@linux.intel.com

v2 -> v3:
- Added #ifdef CONFIG_COMMON_CLK for the ACPI case

 drivers/media/v4l2-core/v4l2-common.c | 39 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 18 +++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 0a2f4f0d0a07..4e30f8b777b7 100644
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
@@ -636,3 +639,39 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
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
+#ifdef CONFIG_COMMON_CLK
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
+#else
+	return ERR_PTR(-ENOENT);
+#endif
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


