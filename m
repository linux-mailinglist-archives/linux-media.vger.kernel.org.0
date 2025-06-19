Return-Path: <linux-media+bounces-35370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CC4AE0C3C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E3881BC5C3A
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E73128DB62;
	Thu, 19 Jun 2025 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CipjD8xF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C05152DE7;
	Thu, 19 Jun 2025 18:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750356021; cv=none; b=ekEBAbOgIAmmEH9nfqyUYQvNKD3bIiPBNc+be9NS9nRLRqR+MA6+/BfBvtaA9zEa85t0z+AfTofjOOhm8orcYP40TWyExG2cOT6n0vYBehXoMwi3e2fr7iUJXpa59GBqA/YO+82NovPeuBa8LIr28MKaAx9DYNZ0pxmltTj4W2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750356021; c=relaxed/simple;
	bh=xUDH6Y3f+vFZWMAVIrIgE0XQt44yZHQIeaYAsn5eqzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmvTCe+QLRdHeUs/BRkY1TwxPzqIiIPiRrQML7SpNA2WafQhnWUwU88i+4eBMjXzvecgQhkGHYBWsMZDbZtHxx/UnWJ1EkqkaOESTdggHXG05uV4htkV4I5zjRObPeIwP5dEsvFhScrZdOEw/UZfDj5JoFgI1VoHz3lEYj2803g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CipjD8xF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750356020; x=1781892020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xUDH6Y3f+vFZWMAVIrIgE0XQt44yZHQIeaYAsn5eqzo=;
  b=CipjD8xF5xa892MyAecx2zN4gfFwbgWslX9ZlGQsZLOJARzMSwYCLdvH
   9mKV392UZScFgzDiBkqXyTK51sryUDCAjX87K0FeOI3NhcQgZSCSa5Jx3
   /vazFWWvlfkh/gSrsONLVE596JkbjD/ttOMPa/nMefdS3c6SEXIc7tWFL
   8xvN+jAQobDMEShH7NwwP1bHaaIng6gPl0WQJX2xQtRmZJtiaCzOwecj9
   LhlRDatoHAEm9vUX3rRhH7A07FmK98cPRvAYN4O/ZafIhpiKvx9e1fpZL
   2gSXtr2PSPv314QwwuIpjHutOdve0IOCW+z09dyzgZMJOTGugPy4HxdUC
   A==;
X-CSE-ConnectionGUID: do9xO6MkRw6e+yjZGfROIA==
X-CSE-MsgGUID: 4sQq9viDSHCQG610V80UyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64047691"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="64047691"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:19 -0700
X-CSE-ConnectionGUID: 4Z+bK9ZzTqy4LPirAxmCdg==
X-CSE-MsgGUID: dVS6tmMNTKSxAA71simgXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150919257"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.13])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:00:09 -0700
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com
Cc: akinobu.mita@gmail.com,
	stanislaw.gruszka@linux.intel.com,
	hdegoede@redhat.com,
	arnd@arndb.de,
	alain.volmat@foss.st.com,
	andrzej.hajda@intel.com,
	benjamin.mugnier@foss.st.com,
	dave.stevenson@raspberrypi.com,
	hansg@kernel.org,
	hverkuil@xs4all.nl,
	jacopo.mondi@ideasonboard.com,
	jonas@kwiboo.se,
	kieran.bingham@ideasonboard.com,
	khalasa@piap.pl,
	prabhakar.csengg@gmail.com,
	mani@kernel.org,
	m.felsch@pengutronix.de,
	martink@posteo.de,
	mattwmajewski@gmail.com,
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
	petrcvekcz@gmail.com,
	rashanmu@gmail.com,
	ribalda@chromium.org,
	rmfrfs@gmail.com,
	zhengsq@rock-chips.com,
	slongerbeam@gmail.com,
	sylvain.petinot@foss.st.com,
	s.nawrocki@samsung.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	zhi.mao@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 01/55] media: v4l2-common: Add a helper for obtaining the clock producer
Date: Thu, 19 Jun 2025 19:58:54 +0200
Message-ID: <1f8a0bb1896a57e818fad30a236b350127689be6.1750352394.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750352394.git.mehdi.djait@linux.intel.com>
References: <cover.1750352394.git.mehdi.djait@linux.intel.com>
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
by a camera sensor PMIC driver (e.g. int3472/tps68470.c)
In this case try to set the clock-frequency value to the provided clock.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index bd160a8c9efe..c53221165c5a 100644
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
@@ -673,3 +676,49 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
+
+struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
+{
+	const char *clk_id __free(kfree) = NULL;
+	struct clk_hw *clk_hw;
+	struct clk *clk;
+	bool acpi_node;
+	u32 rate;
+	int ret;
+
+	clk = devm_clk_get_optional(dev, id);
+	ret = device_property_read_u32(dev, "clock-frequency", &rate);
+	acpi_node = is_acpi_node(dev_fwnode(dev));
+
+	if (clk) {
+		if (!ret && acpi_node) {
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
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
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
index 0a43f56578bc..72d8fcc6057f 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -620,6 +620,31 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
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

