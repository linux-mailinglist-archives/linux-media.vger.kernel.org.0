Return-Path: <linux-media+bounces-37026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB71AFB624
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26FDD188D4F7
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6445C2BE7D4;
	Mon,  7 Jul 2025 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWYdT8N4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473BD29AB0F
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751898794; cv=none; b=ocf2ELEDnmOGw4K9iyFIC703IR95dtrS5RCrucTxVf9PKCs5xQdzw/UNaPWEFw0nu04kbH7X+w52Zzk8kbZt+4jt4dIf7CfCf4EUZlgL+Syxd9PCYt98qkUmyL4bB2vUnWtstYYEYNUTAnI1qehiyS1Z8LTjQ5KcERnPXSqGVOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751898794; c=relaxed/simple;
	bh=Xbp4XTspnnH2qc0MvrZ/nuH2E/LKLki8BSaCz1hWwVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFLslE6VMUqSkeEpwjelWC5Vdh9eIINtk3+EPXpbAtLPAT5fecpEoKBsfMP0t4rrrObKaqHW6kYHZrgzNBeLD/pW03Df3aeYiQDdfA5wddE8vfEDtBI3zrhotS+GlOuS3l08FQPMeynWFIyPy9a1bE8kGwtb3bQdCGvZIoKykK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWYdT8N4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751898793; x=1783434793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xbp4XTspnnH2qc0MvrZ/nuH2E/LKLki8BSaCz1hWwVk=;
  b=NWYdT8N4c1td60sEvTo5xlwIAnv66PIp5U92aOiNbrbj0X5xZDd+NheC
   kPfz331QGghnHVgMe7lpu9Askx6XeR5u0ze16HFRos3iNmdsPK7gW0agB
   IajhONVMP1s2gmB5VqEwvfYUdE/dE7MMW0CzrMWywn5bxTu/KJ0HgXyxq
   qbAwPx24fDW+sco88hLHMt07zzPA1+XbfA2BAl9T0OMipkxUS+reMUMPP
   0ganGmoq5RKSivBriOH9oBM9BqIeJbmNvRJg1yl9SksQU+ycOW8eVVPyq
   EEeOUkMYCputgimcysCqrr7OmhGLEHFdz3SZF4ZVu+vycZVH19aRHKLsT
   Q==;
X-CSE-ConnectionGUID: DnilTu27R9CSb2v8jpPhow==
X-CSE-MsgGUID: 6XtwM/oGT/KlPIiB1HNXSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64361760"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="64361760"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 07:33:12 -0700
X-CSE-ConnectionGUID: LJqKY6aaT9CkxC6qTsJllA==
X-CSE-MsgGUID: +UX2k9O9Rx+sKR1fCSjnLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="155594188"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.123])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 07:33:05 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: mehdi.djait@linux.intel.com
Cc: alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	benjamin.mugnier@foss.st.com,
	dan.scally@ideasonboard.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hdegoede@redhat.com,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	khalasa@piap.pl,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	linux-media@vger.kernel.org,
	m.felsch@pengutronix.de,
	mani@kernel.org,
	matthias.fend@emfend.at,
	mchehab@kernel.org,
	michael.riesch@collabora.com,
	naush@raspberrypi.com,
	nicholas@rothemail.net,
	nicolas.dufresne@collabora.com,
	paul.elder@ideasonboard.com,
	pavel@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com,
	slongerbeam@gmail.com,
	stanislaw.gruszka@linux.intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: [PATCH v3] media: v4l2-common: Add a helper for obtaining the clock producer
Date: Mon,  7 Jul 2025 16:32:53 +0200
Message-ID: <20250707143253.167910-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <kobm27v4vkwj7akssxll57yybkfbwfk3vakhweub5e6tl6otkc@qtl2dgd2xei2>
References: <kobm27v4vkwj7akssxll57yybkfbwfk3vakhweub5e6tl6otkc@qtl2dgd2xei2>
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
. The clock-frequency _DSD property is present.
. A reference to the clock producer is present, where the clock is provided
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
index bd160a8c9efe..fedb21a74671 100644
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
+	if (IS_ERR(clk))
+		return clk;
+
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
index 0a43f56578bc..9d6c236e8f14 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -97,6 +97,7 @@ int v4l2_ctrl_query_fill(struct v4l2_queryctrl *qctrl,
 
 /* ------------------------------------------------------------------------- */
 
+struct clk;
 struct v4l2_device;
 struct v4l2_subdev;
 struct v4l2_subdev_ops;
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


