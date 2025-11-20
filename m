Return-Path: <linux-media+bounces-47498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E5EC74271
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 14:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 57B042AF20
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA47345739;
	Thu, 20 Nov 2025 13:15:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23D1EBA14;
	Thu, 20 Nov 2025 13:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644549; cv=none; b=LvgQ7flh9nBKDzI/8VjkqScR2n98kqZPEFnwZ3miuMwnYZeOtqNytRIE1VziByphHfTEayj8b8/Dbbz2RSCybw1b4DfhvNBhOmouWNXX7foJpTomhAGJ8FMXfRG3kKC9+lt4KYnfiIkg+irSHP7YTTe3g5aYkzsP+B8CdhkqQ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644549; c=relaxed/simple;
	bh=+mPVpAouIO+JmxpJ8BK6t2Z/XXNxA452XiSeo01Kd/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HTH8IccLAvQtFdjUrt9AmL7qZrmP+qdpn/9szvlWGzROwDqkr/EibuspaTfpbm+7FZoPkcCIUyOmE/pTfxmO6cmkg9IXAZQrrCw9VRZG08iO5/4Ff7bY0m6V8KYG0IXlRSXXisQ3r0xE9OUgTHvzR+ldQa1emw+HMKIlOiuTAE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 5EACB31EBA;
	Thu, 20 Nov 2025 14:08:37 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v3 1/3] media: pci: mgb4: Add support for GMSL1 modules
Date: Thu, 20 Nov 2025 14:08:25 +0100
Message-ID: <20251120130827.1882-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251120130827.1882-1-tumic@gpxsee.org>
References: <20251120130827.1882-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Add support for GMSL1 modules. GMSL1 modules have 2 inputs, 2 outputs and
require a separate FW (id #3).

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_core.c      | 22 ++++++--
 drivers/media/pci/mgb4/mgb4_core.h      |  9 ++--
 drivers/media/pci/mgb4/mgb4_sysfs.h     |  6 ++-
 drivers/media/pci/mgb4/mgb4_sysfs_in.c  | 49 +++++++++++++----
 drivers/media/pci/mgb4/mgb4_sysfs_out.c | 38 ++++++++++---
 drivers/media/pci/mgb4/mgb4_vin.c       | 72 ++++++++++++++++---------
 drivers/media/pci/mgb4/mgb4_vout.c      | 64 +++++++++++++++-------
 7 files changed, 189 insertions(+), 71 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 3ce6b717ca32..a7cb8dc50b53 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -381,6 +381,18 @@ static int get_serial_number(struct mgb4_dev *mgbdev)
 	return 0;
 }
 
+static const char *module_type_str(struct mgb4_dev *mgbdev)
+{
+	if (MGB4_IS_FPDL3(mgbdev))
+		return "FPDL3";
+	else if (MGB4_IS_GMSL3(mgbdev))
+		return "GMSL3";
+	else if (MGB4_IS_GMSL1(mgbdev))
+		return "GMSL1";
+	else
+		return "UNKNOWN";
+}
+
 static int get_module_version(struct mgb4_dev *mgbdev)
 {
 	struct device *dev = &mgbdev->pdev->dev;
@@ -402,19 +414,21 @@ static int get_module_version(struct mgb4_dev *mgbdev)
 	}
 
 	mgbdev->module_version = ~((u32)version) & 0xff;
-	if (!(MGB4_IS_FPDL3(mgbdev) || MGB4_IS_GMSL(mgbdev))) {
+	if (!(MGB4_IS_FPDL3(mgbdev) ||
+	      MGB4_IS_GMSL3(mgbdev) ||
+	      MGB4_IS_GMSL1(mgbdev))) {
 		dev_err(dev, "unknown module type\n");
 		return -EINVAL;
 	}
 	fw_version = mgb4_read_reg(&mgbdev->video, 0xC4) >> 24;
 	if ((MGB4_IS_FPDL3(mgbdev) && fw_version != 1) ||
-	    (MGB4_IS_GMSL(mgbdev) && fw_version != 2)) {
+	    (MGB4_IS_GMSL3(mgbdev) && fw_version != 2) ||
+	    (MGB4_IS_GMSL1(mgbdev) && fw_version != 3)) {
 		dev_err(dev, "module/firmware type mismatch\n");
 		return -EINVAL;
 	}
 
-	dev_info(dev, "%s module detected\n",
-		 MGB4_IS_FPDL3(mgbdev) ? "FPDL3" : "GMSL");
+	dev_info(dev, "%s module detected\n", module_type_str(mgbdev));
 
 	return 0;
 }
diff --git a/drivers/media/pci/mgb4/mgb4_core.h b/drivers/media/pci/mgb4/mgb4_core.h
index cc24068400a2..06ef8bb44089 100644
--- a/drivers/media/pci/mgb4/mgb4_core.h
+++ b/drivers/media/pci/mgb4/mgb4_core.h
@@ -18,14 +18,17 @@
 #define MGB4_VIN_DEVICES  2
 #define MGB4_VOUT_DEVICES 2
 
-#define MGB4_IS_GMSL(mgbdev) \
+#define MGB4_IS_GMSL1(mgbdev) \
+	(((mgbdev)->module_version >> 4) == 6)
+#define MGB4_IS_GMSL3(mgbdev) \
 	((((mgbdev)->module_version >> 4) >= 2) && \
 	 (((mgbdev)->module_version >> 4) <= 4))
 #define MGB4_IS_FPDL3(mgbdev) \
 	(((mgbdev)->module_version >> 4) == 1)
 #define MGB4_HAS_VOUT(mgbdev) \
-	((((mgbdev)->module_version >> 4) >= 1) && \
-	 (((mgbdev)->module_version >> 4) <= 3))
+	(((((mgbdev)->module_version >> 4) >= 1) && \
+	  (((mgbdev)->module_version >> 4) <= 3)) || \
+	 ((((mgbdev)->module_version >> 4) == 6)))
 
 struct mgb4_dma_channel {
 	struct dma_chan *chan;
diff --git a/drivers/media/pci/mgb4/mgb4_sysfs.h b/drivers/media/pci/mgb4/mgb4_sysfs.h
index 017d82c0624e..fa7fd232c2c2 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs.h
+++ b/drivers/media/pci/mgb4/mgb4_sysfs.h
@@ -11,8 +11,10 @@
 
 extern struct attribute *mgb4_pci_attrs[];
 extern struct attribute *mgb4_fpdl3_in_attrs[];
-extern struct attribute *mgb4_gmsl_in_attrs[];
+extern struct attribute *mgb4_gmsl3_in_attrs[];
+extern struct attribute *mgb4_gmsl1_in_attrs[];
 extern struct attribute *mgb4_fpdl3_out_attrs[];
-extern struct attribute *mgb4_gmsl_out_attrs[];
+extern struct attribute *mgb4_gmsl3_out_attrs[];
+extern struct attribute *mgb4_gmsl1_out_attrs[];
 
 #endif
diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_in.c b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
index 9626fa59e3d3..4cd4addcd0a5 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs_in.c
+++ b/drivers/media/pci/mgb4/mgb4_sysfs_in.c
@@ -36,10 +36,13 @@ static ssize_t oldi_lane_width_show(struct device *dev,
 	u32 config;
 	int ret;
 
-	i2c_reg = MGB4_IS_GMSL(mgbdev) ? 0x1CE : 0x49;
-	i2c_mask = MGB4_IS_GMSL(mgbdev) ? 0x0E : 0x03;
-	i2c_single_val = MGB4_IS_GMSL(mgbdev) ? 0x00 : 0x02;
-	i2c_dual_val = MGB4_IS_GMSL(mgbdev) ? 0x0E : 0x00;
+	if (MGB4_IS_GMSL1(mgbdev))
+		return sprintf(buf, "0\n");
+
+	i2c_reg = MGB4_IS_GMSL3(mgbdev) ? 0x1CE : 0x49;
+	i2c_mask = MGB4_IS_GMSL3(mgbdev) ? 0x0E : 0x03;
+	i2c_single_val = MGB4_IS_GMSL3(mgbdev) ? 0x00 : 0x02;
+	i2c_dual_val = MGB4_IS_GMSL3(mgbdev) ? 0x0E : 0x00;
 
 	mutex_lock(&mgbdev->i2c_lock);
 	ret = mgb4_i2c_read_byte(&vindev->deser, i2c_reg);
@@ -79,21 +82,24 @@ static ssize_t oldi_lane_width_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (MGB4_IS_GMSL1(mgbdev))
+		return val ? -EINVAL : count;
+
 	switch (val) {
 	case 0: /* single */
 		fpga_data = 0;
-		i2c_data = MGB4_IS_GMSL(mgbdev) ? 0x00 : 0x02;
+		i2c_data = MGB4_IS_GMSL3(mgbdev) ? 0x00 : 0x02;
 		break;
 	case 1: /* dual */
 		fpga_data = 1U << 9;
-		i2c_data = MGB4_IS_GMSL(mgbdev) ? 0x0E : 0x00;
+		i2c_data = MGB4_IS_GMSL3(mgbdev) ? 0x0E : 0x00;
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	i2c_reg = MGB4_IS_GMSL(mgbdev) ? 0x1CE : 0x49;
-	i2c_mask = MGB4_IS_GMSL(mgbdev) ? 0x0E : 0x03;
+	i2c_reg = MGB4_IS_GMSL3(mgbdev) ? 0x1CE : 0x49;
+	i2c_mask = MGB4_IS_GMSL3(mgbdev) ? 0x0E : 0x03;
 
 	mutex_lock(&mgbdev->i2c_lock);
 	ret = mgb4_i2c_mask_byte(&vindev->deser, i2c_reg, i2c_mask, i2c_data);
@@ -102,7 +108,7 @@ static ssize_t oldi_lane_width_store(struct device *dev,
 		return -EIO;
 	mgb4_mask_reg(&mgbdev->video, vindev->config->regs.config, 1U << 9,
 		      fpga_data);
-	if (MGB4_IS_GMSL(mgbdev)) {
+	if (MGB4_IS_GMSL3(mgbdev)) {
 		/* reset input link */
 		mutex_lock(&mgbdev->i2c_lock);
 		ret = mgb4_i2c_mask_byte(&vindev->deser, 0x10, 1U << 5, 1U << 5);
@@ -745,7 +751,7 @@ struct attribute *mgb4_fpdl3_in_attrs[] = {
 	NULL
 };
 
-struct attribute *mgb4_gmsl_in_attrs[] = {
+struct attribute *mgb4_gmsl3_in_attrs[] = {
 	&dev_attr_input_id.attr,
 	&dev_attr_link_status.attr,
 	&dev_attr_stream_status.attr,
@@ -770,3 +776,26 @@ struct attribute *mgb4_gmsl_in_attrs[] = {
 	&dev_attr_gmsl_fec.attr,
 	NULL
 };
+
+struct attribute *mgb4_gmsl1_in_attrs[] = {
+	&dev_attr_input_id.attr,
+	&dev_attr_link_status.attr,
+	&dev_attr_stream_status.attr,
+	&dev_attr_video_width.attr,
+	&dev_attr_video_height.attr,
+	&dev_attr_hsync_status.attr,
+	&dev_attr_vsync_status.attr,
+	&dev_attr_oldi_lane_width.attr,
+	&dev_attr_color_mapping.attr,
+	&dev_attr_hsync_gap_length.attr,
+	&dev_attr_vsync_gap_length.attr,
+	&dev_attr_pclk_frequency.attr,
+	&dev_attr_hsync_width.attr,
+	&dev_attr_vsync_width.attr,
+	&dev_attr_hback_porch.attr,
+	&dev_attr_hfront_porch.attr,
+	&dev_attr_vback_porch.attr,
+	&dev_attr_vfront_porch.attr,
+	&dev_attr_frequency_range.attr,
+	NULL
+};
diff --git a/drivers/media/pci/mgb4/mgb4_sysfs_out.c b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
index 573aa61c69d4..5769f3ca6c2f 100644
--- a/drivers/media/pci/mgb4/mgb4_sysfs_out.c
+++ b/drivers/media/pci/mgb4/mgb4_sysfs_out.c
@@ -665,6 +665,7 @@ static ssize_t pclk_frequency_store(struct device *dev,
 {
 	struct video_device *vdev = to_video_device(dev);
 	struct mgb4_vout_dev *voutdev = video_get_drvdata(vdev);
+	struct mgb4_dev *mgbdev = voutdev->mgbdev;
 	unsigned long val;
 	int ret;
 	unsigned int dp;
@@ -679,14 +680,16 @@ static ssize_t pclk_frequency_store(struct device *dev,
 		return -EBUSY;
 	}
 
-	dp = (val > 50000) ? 1 : 0;
+	dp = (MGB4_IS_FPDL3(mgbdev) && val > 50000) ? 1 : 0;
 	voutdev->freq = mgb4_cmt_set_vout_freq(voutdev, val >> dp) << dp;
-
-	mgb4_mask_reg(&voutdev->mgbdev->video, voutdev->config->regs.config,
-		      0x10, dp << 4);
-	mutex_lock(&voutdev->mgbdev->i2c_lock);
-	ret = mgb4_i2c_mask_byte(&voutdev->ser, 0x4F, 1 << 6, ((~dp) & 1) << 6);
-	mutex_unlock(&voutdev->mgbdev->i2c_lock);
+	mgb4_mask_reg(&mgbdev->video, voutdev->config->regs.config, 0x10,
+		      dp << 4);
+	if (MGB4_IS_FPDL3(mgbdev)) {
+		mutex_lock(&mgbdev->i2c_lock);
+		ret = mgb4_i2c_mask_byte(&voutdev->ser, 0x4F, 1 << 6,
+					 ((~dp) & 1) << 6);
+		mutex_unlock(&mgbdev->i2c_lock);
+	}
 
 	mutex_unlock(voutdev->vdev.lock);
 
@@ -731,7 +734,7 @@ struct attribute *mgb4_fpdl3_out_attrs[] = {
 	NULL
 };
 
-struct attribute *mgb4_gmsl_out_attrs[] = {
+struct attribute *mgb4_gmsl3_out_attrs[] = {
 	&dev_attr_output_id.attr,
 	&dev_attr_video_source.attr,
 	&dev_attr_display_width.attr,
@@ -739,3 +742,22 @@ struct attribute *mgb4_gmsl_out_attrs[] = {
 	&dev_attr_frame_rate.attr,
 	NULL
 };
+
+struct attribute *mgb4_gmsl1_out_attrs[] = {
+	&dev_attr_output_id.attr,
+	&dev_attr_video_source.attr,
+	&dev_attr_display_width.attr,
+	&dev_attr_display_height.attr,
+	&dev_attr_frame_rate.attr,
+	&dev_attr_hsync_polarity.attr,
+	&dev_attr_vsync_polarity.attr,
+	&dev_attr_de_polarity.attr,
+	&dev_attr_pclk_frequency.attr,
+	&dev_attr_hsync_width.attr,
+	&dev_attr_vsync_width.attr,
+	&dev_attr_hback_porch.attr,
+	&dev_attr_hfront_porch.attr,
+	&dev_attr_vback_porch.attr,
+	&dev_attr_vfront_porch.attr,
+	NULL
+};
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 4b38076486ff..be55491b52b2 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -32,7 +32,8 @@
 #include "mgb4_vin.h"
 
 ATTRIBUTE_GROUPS(mgb4_fpdl3_in);
-ATTRIBUTE_GROUPS(mgb4_gmsl_in);
+ATTRIBUTE_GROUPS(mgb4_gmsl3_in);
+ATTRIBUTE_GROUPS(mgb4_gmsl1_in);
 
 static const struct mgb4_vin_config vin_cfg[] = {
 	{0, 0, 0, 6, {0x10, 0x00, 0x04, 0x08, 0x1C, 0x14, 0x18, 0x20, 0x24, 0x28, 0xE8}},
@@ -44,23 +45,31 @@ static const struct i2c_board_info fpdl3_deser_info[] = {
 	{I2C_BOARD_INFO("deserializer2", 0x36)},
 };
 
-static const struct i2c_board_info gmsl_deser_info[] = {
+static const struct i2c_board_info gmsl3_deser_info[] = {
 	{I2C_BOARD_INFO("deserializer1", 0x4C)},
 	{I2C_BOARD_INFO("deserializer2", 0x2A)},
 };
 
+static const struct i2c_board_info gmsl1_deser_info[] = {
+	{I2C_BOARD_INFO("deserializer1", 0x2C)},
+	{I2C_BOARD_INFO("deserializer2", 0x6C)},
+};
+
 static const struct mgb4_i2c_kv fpdl3_i2c[] = {
 	{0x06, 0xFF, 0x04}, {0x07, 0xFF, 0x01}, {0x45, 0xFF, 0xE8},
 	{0x49, 0xFF, 0x00}, {0x34, 0xFF, 0x00}, {0x23, 0xFF, 0x00}
 };
 
-static const struct mgb4_i2c_kv gmsl_i2c[] = {
+static const struct mgb4_i2c_kv gmsl3_i2c[] = {
 	{0x01, 0x03, 0x03}, {0x300, 0x0C, 0x0C}, {0x03, 0xC0, 0xC0},
 	{0x1CE, 0x0E, 0x0E}, {0x11, 0x05, 0x00}, {0x05, 0xC0, 0x40},
 	{0x307, 0x0F, 0x00}, {0xA0, 0x03, 0x00}, {0x3E0, 0x07, 0x07},
 	{0x308, 0x01, 0x01}, {0x10, 0x20, 0x20}, {0x300, 0x40, 0x40}
 };
 
+static const struct mgb4_i2c_kv gmsl1_i2c[] = {
+};
+
 static const struct v4l2_dv_timings_cap video_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
 	.bt = {
@@ -796,22 +805,29 @@ static irqreturn_t err_handler(int irq, void *ctx)
 
 static int deser_init(struct mgb4_vin_dev *vindev, int id)
 {
-	int rv, addr_size;
-	size_t values_count;
-	const struct mgb4_i2c_kv *values;
-	const struct i2c_board_info *info;
+	int rv, addr_size = 0;
+	size_t count = 0;
+	const struct mgb4_i2c_kv *values = NULL;
+	const struct i2c_board_info *info = NULL;
 	struct device *dev = &vindev->mgbdev->pdev->dev;
 
-	if (MGB4_IS_GMSL(vindev->mgbdev)) {
-		info = &gmsl_deser_info[id];
+	if (MGB4_IS_GMSL3(vindev->mgbdev)) {
+		info = &gmsl3_deser_info[id];
 		addr_size = 16;
-		values = gmsl_i2c;
-		values_count = ARRAY_SIZE(gmsl_i2c);
-	} else {
+		values = gmsl3_i2c;
+		count = ARRAY_SIZE(gmsl3_i2c);
+	} else if (MGB4_IS_FPDL3(vindev->mgbdev)) {
 		info = &fpdl3_deser_info[id];
 		addr_size = 8;
 		values = fpdl3_i2c;
-		values_count = ARRAY_SIZE(fpdl3_i2c);
+		count = ARRAY_SIZE(fpdl3_i2c);
+	} else if (MGB4_IS_GMSL1(vindev->mgbdev)) {
+		info = &gmsl1_deser_info[id];
+		addr_size = 8;
+		values = gmsl1_i2c;
+		count = ARRAY_SIZE(gmsl1_i2c);
+	} else {
+		return -EINVAL;
 	}
 
 	rv = mgb4_i2c_init(&vindev->deser, vindev->mgbdev->i2c_adap, info,
@@ -820,7 +836,7 @@ static int deser_init(struct mgb4_vin_dev *vindev, int id)
 		dev_err(dev, "failed to create deserializer\n");
 		return rv;
 	}
-	rv = mgb4_i2c_configure(&vindev->deser, values, values_count);
+	rv = mgb4_i2c_configure(&vindev->deser, values, count);
 	if (rv < 0) {
 		dev_err(dev, "failed to configure deserializer\n");
 		goto err_i2c_dev;
@@ -838,11 +854,12 @@ static void fpga_init(struct mgb4_vin_dev *vindev)
 {
 	struct mgb4_regs *video = &vindev->mgbdev->video;
 	const struct mgb4_vin_regs *regs = &vindev->config->regs;
+	int dp = MGB4_IS_GMSL1(vindev->mgbdev) ? 0 : 1;
 
 	mgb4_write_reg(video, regs->config, 0x00000001);
 	mgb4_write_reg(video, regs->sync, 0x03E80002);
 	mgb4_write_reg(video, regs->padding, 0x00000000);
-	mgb4_write_reg(video, regs->config, 1U << 9);
+	mgb4_write_reg(video, regs->config, dp << 9);
 }
 
 static void create_debugfs(struct mgb4_vin_dev *vindev)
@@ -890,10 +907,21 @@ static void create_debugfs(struct mgb4_vin_dev *vindev)
 #endif
 }
 
+static const struct attribute_group **module_groups(struct mgb4_dev *mgbdev)
+{
+	if (MGB4_IS_FPDL3(mgbdev))
+		return mgb4_fpdl3_in_groups;
+	else if (MGB4_IS_GMSL3(mgbdev))
+		return mgb4_gmsl3_in_groups;
+	else if (MGB4_IS_GMSL1(mgbdev))
+		return mgb4_gmsl1_in_groups;
+	else
+		return NULL;
+}
+
 struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id)
 {
 	int rv;
-	const struct attribute_group **groups;
 	struct mgb4_vin_dev *vindev;
 	struct pci_dev *pdev = mgbdev->pdev;
 	struct device *dev = &pdev->dev;
@@ -914,14 +942,13 @@ struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id)
 	INIT_WORK(&vindev->dma_work, dma_transfer);
 	INIT_WORK(&vindev->err_work, signal_change);
 
-	/* IRQ callback */
+	/* IRQ callbacks */
 	vin_irq = xdma_get_user_irq(mgbdev->xdev, vindev->config->vin_irq);
 	rv = request_irq(vin_irq, vin_handler, 0, "mgb4-vin", vindev);
 	if (rv) {
 		dev_err(dev, "failed to register vin irq handler\n");
 		goto err_alloc;
 	}
-	/* Error IRQ callback */
 	err_irq = xdma_get_user_irq(mgbdev->xdev, vindev->config->err_irq);
 	rv = request_irq(err_irq, err_handler, 0, "mgb4-err", vindev);
 	if (rv) {
@@ -986,9 +1013,7 @@ struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id)
 	}
 
 	/* Module sysfs attributes */
-	groups = MGB4_IS_GMSL(mgbdev)
-	  ? mgb4_gmsl_in_groups : mgb4_fpdl3_in_groups;
-	rv = device_add_groups(&vindev->vdev.dev, groups);
+	rv = device_add_groups(&vindev->vdev.dev, module_groups(mgbdev));
 	if (rv) {
 		dev_err(dev, "failed to create sysfs attributes\n");
 		goto err_video_dev;
@@ -1014,7 +1039,6 @@ struct mgb4_vin_dev *mgb4_vin_create(struct mgb4_dev *mgbdev, int id)
 
 void mgb4_vin_free(struct mgb4_vin_dev *vindev)
 {
-	const struct attribute_group **groups;
 	int vin_irq = xdma_get_user_irq(vindev->mgbdev->xdev,
 					vindev->config->vin_irq);
 	int err_irq = xdma_get_user_irq(vindev->mgbdev->xdev,
@@ -1025,9 +1049,7 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
 	free_irq(vin_irq, vindev);
 	free_irq(err_irq, vindev);
 
-	groups = MGB4_IS_GMSL(vindev->mgbdev)
-	  ? mgb4_gmsl_in_groups : mgb4_fpdl3_in_groups;
-	device_remove_groups(&vindev->vdev.dev, groups);
+	device_remove_groups(&vindev->vdev.dev, module_groups(vindev->mgbdev));
 
 	mgb4_i2c_free(&vindev->deser);
 	video_unregister_device(&vindev->vdev);
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index fd93fbbaf755..44e9565d4d06 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -25,7 +25,8 @@
 #include "mgb4_vout.h"
 
 ATTRIBUTE_GROUPS(mgb4_fpdl3_out);
-ATTRIBUTE_GROUPS(mgb4_gmsl_out);
+ATTRIBUTE_GROUPS(mgb4_gmsl3_out);
+ATTRIBUTE_GROUPS(mgb4_gmsl1_out);
 
 static const struct mgb4_vout_config vout_cfg[] = {
 	{0, 0, 8, {0x78, 0x60, 0x64, 0x68, 0x74, 0x6C, 0x70, 0x7C, 0xE0}},
@@ -37,10 +38,18 @@ static const struct i2c_board_info fpdl3_ser_info[] = {
 	{I2C_BOARD_INFO("serializer2", 0x16)},
 };
 
+static const struct i2c_board_info gmsl1_ser_info[] = {
+	{I2C_BOARD_INFO("serializer1", 0x24)},
+	{I2C_BOARD_INFO("serializer2", 0x22)},
+};
+
 static const struct mgb4_i2c_kv fpdl3_i2c[] = {
 	{0x05, 0xFF, 0x04}, {0x06, 0xFF, 0x01}, {0xC2, 0xFF, 0x80}
 };
 
+static const struct mgb4_i2c_kv gmsl1_i2c[] = {
+};
+
 static const struct v4l2_dv_timings_cap video_timings_cap = {
 	.type = V4L2_DV_BT_656_1120,
 	.bt = {
@@ -634,12 +643,24 @@ static irqreturn_t handler(int irq, void *ctx)
 
 static int ser_init(struct mgb4_vout_dev *voutdev, int id)
 {
-	int rv;
-	const struct i2c_board_info *info = &fpdl3_ser_info[id];
 	struct mgb4_i2c_client *ser = &voutdev->ser;
 	struct device *dev = &voutdev->mgbdev->pdev->dev;
+	const struct i2c_board_info *info = NULL;
+	const struct mgb4_i2c_kv *values = NULL;
+	size_t count = 0;
+	int rv;
+
+	if (MGB4_IS_FPDL3(voutdev->mgbdev)) {
+		info = &fpdl3_ser_info[id];
+		values = fpdl3_i2c;
+		count = ARRAY_SIZE(fpdl3_i2c);
+	} else if (MGB4_IS_GMSL1(voutdev->mgbdev)) {
+		info = &gmsl1_ser_info[id];
+		values = gmsl1_i2c;
+		count = ARRAY_SIZE(gmsl1_i2c);
+	}
 
-	if (MGB4_IS_GMSL(voutdev->mgbdev))
+	if (!info)
 		return 0;
 
 	rv = mgb4_i2c_init(ser, voutdev->mgbdev->i2c_adap, info, 8);
@@ -647,7 +668,7 @@ static int ser_init(struct mgb4_vout_dev *voutdev, int id)
 		dev_err(dev, "failed to create serializer\n");
 		return rv;
 	}
-	rv = mgb4_i2c_configure(ser, fpdl3_i2c, ARRAY_SIZE(fpdl3_i2c));
+	rv = mgb4_i2c_configure(ser, values, count);
 	if (rv < 0) {
 		dev_err(dev, "failed to configure serializer\n");
 		goto err_i2c_dev;
@@ -665,18 +686,19 @@ static void fpga_init(struct mgb4_vout_dev *voutdev)
 {
 	struct mgb4_regs *video = &voutdev->mgbdev->video;
 	const struct mgb4_vout_regs *regs = &voutdev->config->regs;
+	int dp = MGB4_IS_GMSL1(voutdev->mgbdev) ? 0 : 1;
+	u32 source = (voutdev->config->id + MGB4_VIN_DEVICES) << 2;
 
-	mgb4_write_reg(video, regs->config, 0x00000011);
+	mgb4_write_reg(video, regs->config, 0x00000001);
 	mgb4_write_reg(video, regs->resolution, (1280 << 16) | 640);
 	mgb4_write_reg(video, regs->hsync, 0x00283232);
 	mgb4_write_reg(video, regs->vsync, 0x40141F1E);
 	mgb4_write_reg(video, regs->frame_limit, MGB4_HW_FREQ / 60);
 	mgb4_write_reg(video, regs->padding, 0x00000000);
 
-	voutdev->freq = mgb4_cmt_set_vout_freq(voutdev, 61150 >> 1) << 1;
+	voutdev->freq = mgb4_cmt_set_vout_freq(voutdev, 61150 >> dp) << dp;
 
-	mgb4_write_reg(video, regs->config,
-		       (voutdev->config->id + MGB4_VIN_DEVICES) << 2 | 1 << 4);
+	mgb4_write_reg(video, regs->config, source | dp << 4);
 }
 
 static void create_debugfs(struct mgb4_vout_dev *voutdev)
@@ -720,10 +742,21 @@ static void create_debugfs(struct mgb4_vout_dev *voutdev)
 #endif
 }
 
+static const struct attribute_group **module_groups(struct mgb4_dev *mgbdev)
+{
+	if (MGB4_IS_FPDL3(mgbdev))
+		return mgb4_fpdl3_out_groups;
+	else if (MGB4_IS_GMSL3(mgbdev))
+		return mgb4_gmsl3_out_groups;
+	else if (MGB4_IS_GMSL1(mgbdev))
+		return mgb4_gmsl1_out_groups;
+	else
+		return NULL;
+}
+
 struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id)
 {
 	int rv, irq;
-	const struct attribute_group **groups;
 	struct mgb4_vout_dev *voutdev;
 	struct pci_dev *pdev = mgbdev->pdev;
 	struct device *dev = &pdev->dev;
@@ -804,9 +837,7 @@ struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id)
 	}
 
 	/* Module sysfs attributes */
-	groups = MGB4_IS_GMSL(mgbdev)
-	  ? mgb4_gmsl_out_groups : mgb4_fpdl3_out_groups;
-	rv = device_add_groups(&voutdev->vdev.dev, groups);
+	rv = device_add_groups(&voutdev->vdev.dev, module_groups(mgbdev));
 	if (rv) {
 		dev_err(dev, "failed to create sysfs attributes\n");
 		goto err_video_dev;
@@ -830,15 +861,10 @@ struct mgb4_vout_dev *mgb4_vout_create(struct mgb4_dev *mgbdev, int id)
 
 void mgb4_vout_free(struct mgb4_vout_dev *voutdev)
 {
-	const struct attribute_group **groups;
 	int irq = xdma_get_user_irq(voutdev->mgbdev->xdev, voutdev->config->irq);
 
 	free_irq(irq, voutdev);
-
-	groups = MGB4_IS_GMSL(voutdev->mgbdev)
-	  ? mgb4_gmsl_out_groups : mgb4_fpdl3_out_groups;
-	device_remove_groups(&voutdev->vdev.dev, groups);
-
+	device_remove_groups(&voutdev->vdev.dev, module_groups(voutdev->mgbdev));
 	mgb4_i2c_free(&voutdev->ser);
 	video_unregister_device(&voutdev->vdev);
 	v4l2_device_unregister(&voutdev->v4l2dev);
-- 
2.51.2


