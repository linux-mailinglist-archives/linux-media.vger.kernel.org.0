Return-Path: <linux-media+bounces-35959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC88AE9EE0
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 15:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A5933B2AE3
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A77B2E5416;
	Thu, 26 Jun 2025 13:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDdXKKY0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7355E267F59
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944907; cv=none; b=qtG3HAJthB66UV9L0HsB8LZYu7kxGPgsAxeCSIhaiAEPec6XoNXwJLQMwFVZHI+aTo9jWPO5kNOT4V2ff72O3tJVBM1mGvHs6RCk7r+t2JXK6fC3t/sn8RdLeeu3pzGCz4317TUWAzE+M5oLsxejKM4I2hfRovSQJ7uPLlxKYnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944907; c=relaxed/simple;
	bh=RbgX9909RkcBV25gJIEGgMcM/orX4Qk8vGESxekOUhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0Ywbzh+z9NJLGW3i7XVrBhvvW45/aKe/zDXzwp+4RvGp7kxGrhYSXAOqfG5Vw6AY59KPyTrJFd+PcTymFLbVOy/9bx9uf0YzqEivWfyOY6t6Dp2Vcuh8dQtBXmyMT0jI3FVOzpPIXQ9FtwmiMMJykhmgqgo61xuP3UTwOSXddw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDdXKKY0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944905; x=1782480905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RbgX9909RkcBV25gJIEGgMcM/orX4Qk8vGESxekOUhE=;
  b=PDdXKKY0iR+xpmES+CbjSf4pSY3UAJ/vXJjp+srj8X19G9uJdbrUdTc8
   1ccsrOYt9eTzoc4/JlrMOpuzYCvvjuEa92zH/PTNngmByZrw5knNFbEb+
   1EJpWCZmcMrzTHxcWL633lUpCfh961Z9lAGil+rQavzCQZZjCBGRyWzFe
   Zvbx2NkDFbhHMC9YGPNxL9g6Z0JLp+4yLMLRyrW8ABbbV2hLamPgCyT7z
   +g0i3cL8WW8O4EmVhj5q3eCRiZfxGC0q0jd6Qcf88Iv1vQzRKZmOQqhAm
   bTKohq7ufG5tDZ4DEW6a32Ei/U5w9rZIwaN5sFNsDWJQIjofg/feH+NUF
   w==;
X-CSE-ConnectionGUID: MDAOZ3WCS2a8zqm9apTgAQ==
X-CSE-MsgGUID: vawvq61aQneAJKPaR43zlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56921158"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="56921158"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:35:00 -0700
X-CSE-ConnectionGUID: 3tazlGBfSqeyPca/bIMGew==
X-CSE-MsgGUID: 2U/UgoQwQbOuKDwXOqpyxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153049276"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.225])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:34:53 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	matthias.fend@emfend.at,
	mchehab@kernel.org,
	mehdi.djait@linux.intel.com,
	michael.riesch@collabora.com,
	naush@raspberrypi.com,
	nicholas@rothemail.net,
	nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com,
	dan.scally@ideasonboard.com,
	pavel@kernel.org,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	slongerbeam@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	linux-media@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 01/48] media: v4l2-common: Add a helper for obtaining the clock producer
Date: Thu, 26 Jun 2025 15:33:52 +0200
Message-ID: <8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750942967.git.mehdi.djait@linux.intel.com>
References: <cover.1750942967.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a helper for v4l2 sensor drivers on both DT- and ACPI-based
platforms to retrieve a reference to the clock producer from firmware.

This helper behaves the same as devm_clk_get() except where there is
no clock producer like in ACPI-based platforms.

For ACPI-based platforms the function will read the "clock-frequency"
ACPI _DSD property and register a fixed frequency clock with the frequency
indicated in the property.

This function also handles the special ACPI-based system case where:
The clock-frequency _DSD property is present.
A reference to the clock producer is present, where the clock is provided
by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
In this case try to set the clock-frequency value to the provided clock.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 52 +++++++++++++++++++++++++++
 include/media/v4l2-common.h           | 27 ++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bd160a8c9efe..ac98895b0394 100644
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
@@ -673,3 +676,52 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
+
+struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
+{
+	const char *clk_id __free(kfree) = NULL;
+	struct clk_hw *clk_hw;
+	struct clk *clk;
+	bool of_node;
+	u32 rate;
+	int ret;
+
+	clk = devm_clk_get_optional(dev, id);
+	ret = device_property_read_u32(dev, "clock-frequency", &rate);
+	of_node = is_of_node(dev_fwnode(dev));
+
+	if (clk) {
+		if (!ret && !of_node) {
+			ret = clk_set_rate(clk, rate);
+			if (ret) {
+				dev_err(dev, "Failed to set clock rate: %u\n",
+					rate);
+				return ERR_PTR(ret);
+			}
+		}
+		return clk;
+	}
+
+	if (PTR_ERR(clk) == -EPROBE_DEFER)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
+		return ERR_PTR(-ENOENT);
+
+	if (ret)
+		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
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
index 0a43f56578bc..1c79ca4d5c73 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -100,6 +100,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
 struct v4l2_device;
 struct v4l2_subdev;
 struct v4l2_subdev_ops;
+struct clk;
 
 /* I2C Helper functions */
 #include <linux/i2c.h>
@@ -620,6 +621,32 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 			     unsigned int num_of_driver_link_freqs,
 			     unsigned long *bitmap);
 
+/**
+ * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
+ *	for a camera sensor.
+ *
+ * @dev: device for v4l2 sensor clock "consumer"
+ * @id: clock consumer ID
+ *
+ * This function behaves the same way as devm_clk_get() except where there
+ * is no clock producer like in ACPI-based platforms.
+ *
+ * For ACPI-based platforms, the function will read the "clock-frequency"
+ * ACPI _DSD property and register a fixed-clock with the frequency indicated
+ * in the property.
+ *
+ * This function also handles the special ACPI-based system case where:
+ *
+ * * The clock-frequency _DSD property is present.
+ * * A reference to the clock producer is present, where the clock is provided
+ *   by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
+ *
+ * In this case try to set the clock-frequency value to the provided clock.
+ *
+ * Returns a pointer to a struct clk on success or an error pointer on failure.
+ */
+struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
+
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
 	/*
-- 
2.49.0


