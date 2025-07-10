Return-Path: <linux-media+bounces-37398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF42B00AA7
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0992A189BAE2
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3B42F4334;
	Thu, 10 Jul 2025 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Dzf2eu11"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE2B2F1995
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169810; cv=none; b=HkU0XrmHGsWpPmvPNqV6kZGbc8kHS9o0Cb5xox2avCdZj1j/O+HCCprJ9xhEfzTI8LrSf5gZuD3Mnuqi8SyXRFhtFxzLpE6oqUGQV0vbFn7LXIexcQUt5UXBmOiiuOWw37thl64NeGfiG/SDvfQiyJxIfefRK2fmrpv1DojeA2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169810; c=relaxed/simple;
	bh=ABj1gb9PbamVX+Ht/732/UyYVz/kyA88x8ZPUilfOas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtFdhw0Y+EopoZPxmNWaD74LLrjwj9o5/nXxtvirVmkxRpoYOnoGPjbipL/rSkYD+zTYMPxCN07NFOyInSz0eeO/g73g7a9Qo2Y+8hKM76WCl4jLGcsNszt1AUQPmvn5AGR2BBtSTQimSsY8TwryPnwzRnF1qkGzQ9kphELFS0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Dzf2eu11; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D7AD43DC;
	Thu, 10 Jul 2025 19:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169779;
	bh=ABj1gb9PbamVX+Ht/732/UyYVz/kyA88x8ZPUilfOas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dzf2eu11ZTq62w9Ay4+nbB/13zQy1ajByyb33QIjB0xUrH8MmOZ3ZePhRkg2C09hr
	 evhZxEE/z0GNBqYwEkTfp6usLWxywX8OiI7zv93iRgryrSz43/ex7jcTgXWnsuCFHn
	 vGD8oDdMQgkUIMIbVIrakzn5/gQnNxggzyBTWVDo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 55/72] media: v4l2-common: Add legacy camera sensor clock helper
Date: Thu, 10 Jul 2025 20:47:51 +0300
Message-ID: <20250710174808.5361-56-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recently introduced devm_v4l2_sensor_clk_get() helper aims at
simplifying sensor drivers by centralizing clock handling code, as well
as reducing cargo-cult and deprecated behaviour.

A set of drivers implement external clock handling in a non-standard
way. This can't be changed as there is a high risk of breaking existing
platforms, but keeping the code as-is creates a risk of new drivers
copying deprecated behaviour.

To fix this, introduce a new devm_v4l2_sensor_clk_get_legacy() helper
and use it in those driver. Compared to devm_v4l2_sensor_clk_get(), the
new helper takes the "clock-frequency" property into account and sets
the external clock rate on OF platforms, and adds the ability to specify
a fixed default or fallback clock rate in case the "clock-frequency"
property is not present.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 39 +++++++++++++++++++------
 include/media/v4l2-common.h           | 41 ++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index cfc78ea6276c..6f140a78e683 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -703,24 +703,40 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 }
 EXPORT_SYMBOL_GPL(v4l2_link_freq_to_bitmap);
 
-struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
+struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
+				       bool legacy, bool fixed_rate,
+				       unsigned long clk_rate)
 {
+	bool of_node = is_of_node(dev_fwnode(dev));
 	const char *clk_id __free(kfree) = NULL;
 	struct clk_hw *clk_hw;
 	struct clk *clk;
-	bool of_node;
-	u32 rate;
-	int ret;
+	u32 rate = clk_rate;
+	int ret = 0;
 
 	clk = devm_clk_get_optional(dev, id);
 	if (IS_ERR(clk))
 		return clk;
 
-	ret = device_property_read_u32(dev, "clock-frequency", &rate);
-	of_node = is_of_node(dev_fwnode(dev));
+	/*
+	 * If the caller didn't request a fixed rate, retrieve it from the
+	 * clock-frequency property. -EINVAL indicates the property is absent,
+	 * and is not a failure. Other errors, or success with a clock-frequency
+	 * value of 0, are hard failures.
+	 */
+	if (!fixed_rate || !clk_rate) {
+		ret = device_property_read_u32(dev, "clock-frequency", &rate);
+		if (ret != -EINVAL || !rate)
+			return ERR_PTR(-EINVAL);
+	}
 
 	if (clk) {
-		if (!ret && !of_node) {
+		/*
+		 * On non-OF platforms, or when legacy behaviour is requested,
+		 * set the clock rate if a rate has been specified by the caller
+		 * of by the clock-frequency property.
+		 */
+		if (rate && (!of_node || legacy)) {
 			ret = clk_set_rate(clk, rate);
 			if (ret) {
 				dev_err(dev, "Failed to set clock rate: %u\n",
@@ -731,9 +747,14 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
 		return clk;
 	}
 
-	if (!IS_ENABLED(CONFIG_COMMON_CLK) || of_node)
+	/*
+	 * Register a dummy fixed clock on non-OF platforms or when legacy
+	 * behaviour is requested. This required the common clock framework.
+	 */
+	if (!IS_ENABLED(CONFIG_COMMON_CLK) || (of_node && !legacy))
 		return ERR_PTR(-ENOENT);
 
+	/* We need a rate to create a clock. */
 	if (ret)
 		return ERR_PTR(ret == -EINVAL ? -EPROBE_DEFER : ret);
 
@@ -750,4 +771,4 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
 
 	return clk_hw->clk;
 }
-EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
+EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 9d6c236e8f14..d9f32df3942d 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -621,6 +621,10 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
 			     unsigned int num_of_driver_link_freqs,
 			     unsigned long *bitmap);
 
+struct clk *__devm_v4l2_sensor_clk_get(struct device *dev, const char *id,
+				       bool legacy, bool fixed_rate,
+				       unsigned long clk_rate);
+
 /**
  * devm_v4l2_sensor_clk_get - lookup and obtain a reference to a clock producer
  *	for a camera sensor.
@@ -645,7 +649,42 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
  *
  * Returns a pointer to a struct clk on success or an error pointer on failure.
  */
-struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id);
+static inline struct clk *
+devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
+{
+	return __devm_v4l2_sensor_clk_get(dev, id, false, false, 0);
+}
+
+/**
+ * devm_v4l2_sensor_clk_get_legacy - lookup and obtain a reference to a clock
+ *	producer for a camera sensor.
+ *
+ * @dev: device for v4l2 sensor clock "consumer"
+ * @id: clock consumer ID
+ * @fixed_rate: interpret the @clk_rate as a fixed rate or default rate
+ * @clk_rate: the clock rate
+ *
+ * This function behaves the same way as devm_v4l2_sensor_clk_get() except that
+ * it extends the behaviour on ACPI platforms to all platforms.
+ *
+ * The function also provides the ability to set the clock rate to a fixed
+ * frequency by setting @fixed_rate to true and specifying the fixed frequency
+ * in @clk_rate, or to use a default clock rate when the "clock-frequency"
+ * property is absent by setting @fixed_rate to false and specifying the default
+ * frequency in @clk_rate. Setting @fixed_rate to true and @clk_rate to 0 is an
+ * error.
+ *
+ * This function is meant to support legacy behaviour in existing drivers only.
+ * It must not be used in any new driver.
+ *
+ * Returns a pointer to a struct clk on success or an error pointer on failure.
+ */
+static inline struct clk *
+devm_v4l2_sensor_clk_get_legacy(struct device *dev, const char *id,
+				bool fixed_rate, unsigned long clk_rate)
+{
+	return __devm_v4l2_sensor_clk_get(dev, id, true, fixed_rate, clk_rate);
+}
 
 static inline u64 v4l2_buffer_get_timestamp(const struct v4l2_buffer *buf)
 {
-- 
Regards,

Laurent Pinchart


