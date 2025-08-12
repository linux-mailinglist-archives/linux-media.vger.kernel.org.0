Return-Path: <linux-media+bounces-39681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01343B23B30
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4967C7205E7
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7D72E5B38;
	Tue, 12 Aug 2025 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A79Ts1Dt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05612E173E
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035276; cv=none; b=CxdO+0LD0qnrkwysfkTTh/KG2yxpLLkqqx+F6KXKkNA3rDWt8FLFMcjU1GnXwGYSw3FWJjPhdeXT7tveICaq9E/fKFOWnWpvbAEjjwSsx1yoFVkgr60+bVwsnEvlgMqWQ8q8ihhQ3yHpIrGpeFv6REAKZ3NEWi0u4ogg2NqpsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035276; c=relaxed/simple;
	bh=FaD8HCMhLkHFvNxX89mXx82sBuNRbHYr4e9WnrJPm8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/THa+KmqHnREmWzu8ekD84U+L/e5cB9zgb8d4Au1G9Ze/rxl4sZQGb8q9HJEDnWqmO9z0LtgSo/nm4ddW3vDKPGv92onThGxJOvla2z/V5D0sKPeogVql75nBZBrEjmPJiw7/wlTeDVibrLfHqcdOBJoi19SXiUhTdhAK+zLOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A79Ts1Dt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7F66D4A4;
	Tue, 12 Aug 2025 23:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035220;
	bh=FaD8HCMhLkHFvNxX89mXx82sBuNRbHYr4e9WnrJPm8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A79Ts1Dt2x69libgFk1sQ5x05OmPEXlaZovVXt0zZv6v2AWXPlxonWNBvY/YvI69u
	 0b2kYlJtzbVIdkq/mRns8J0IjEomL2xNkYS32+YtZiu5Zv5zNgJf+8/jxNFikzRxay
	 BdzpUdtn0hJQDFVx+C0XIHdkRl9hsMApatR22JXg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthew Majewski <mattwmajewski@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 45/72] media: v4l2-common: Add legacy camera sensor clock helper
Date: Wed, 13 Aug 2025 00:45:53 +0300
Message-ID: <20250812214620.30425-46-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
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
Changes since v1:

- Fix error condition check when retrieving clock-frequency value
- Fix typo
---
 drivers/media/v4l2-core/v4l2-common.c | 39 +++++++++++++++++++------
 include/media/v4l2-common.h           | 41 ++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index a5334aa35992..dbeb2933f8e8 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -709,24 +709,40 @@ int v4l2_link_freq_to_bitmap(struct device *dev, const u64 *fw_link_freqs,
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
+		if ((ret && ret != -EINVAL) || (!ret && !rate))
+			return ERR_PTR(-EINVAL);
+	}
 
 	if (clk) {
-		if (!ret && !of_node) {
+		/*
+		 * On non-OF platforms, or when legacy behaviour is requested,
+		 * set the clock rate if a rate has been specified by the caller
+		 * or by the clock-frequency property.
+		 */
+		if (rate && (!of_node || legacy)) {
 			ret = clk_set_rate(clk, rate);
 			if (ret) {
 				dev_err(dev, "Failed to set clock rate: %u\n",
@@ -737,9 +753,14 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
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
 
@@ -756,4 +777,4 @@ struct clk *devm_v4l2_sensor_clk_get(struct device *dev, const char *id)
 
 	return clk_hw->clk;
 }
-EXPORT_SYMBOL_GPL(devm_v4l2_sensor_clk_get);
+EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 9d6c236e8f14..a21a5bc3784a 100644
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


