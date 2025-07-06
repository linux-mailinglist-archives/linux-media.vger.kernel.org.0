Return-Path: <linux-media+bounces-36582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F32AF58E9
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9804C1898C6E
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 13:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D211828B3F3;
	Wed,  2 Jul 2025 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReoJHCZT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DB828EA6F;
	Wed,  2 Jul 2025 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462508; cv=none; b=mZLDrL8w8XS6lR7Ed/mzY4XxdJIVoN+HF4naEa8CgKGymLrpktvKvyt//wp1jih/dVHThkJw6+dsM+dkR+Apxd4NKDw7wLPCmfw+PVDo9nJShJ/KpJO32NVQ4hbFyh2P7HV8iCq+5+tWLGzYNLiIi4EF4NffXt4EytMXBhiQsJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462508; c=relaxed/simple;
	bh=YoX642jsIo+1etwpFOG30eio/I5sq+15x5RAQrp94I8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4NDNA0TnMGi+6ftD2XjhbU/7OANhI3M1vK8ig77+M7/5AWuFVpanFfVp0QLw4K0BGANcRgo3x5Yxq2r+oUprxwWilFjGddxXwLYpzMZk2AKgCtaDsgy70YdNku9JDxvsga5vbfYiOZP5bxXTqLuD7GtbM0Qq7/XZWrWQKHkLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReoJHCZT; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade5b8aab41so897618066b.0;
        Wed, 02 Jul 2025 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462504; x=1752067304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzBNkC1LrICEdp72G1BYaNAZRdriqn0nQ8BzbvM7AnI=;
        b=ReoJHCZT+UAddnrrNiTP714sXH9d5NHpf67Zdf8qM3uOlE2epKYpENcmbakVnXLD1m
         BVK19+nRbDHB7Oqp+Im3Kbsyvi7xryNfLKCR/uApD8QYx7+OniAHyezSt/BziVVNmBrn
         2rOXJR5Wyd0Qeb/6pzN2QFnJ3TEBtQUAuRzTgptmL7v7g4sXeFXtUHZP75UY7hKuJRyf
         0xy9zvniGzmWTuxr9WkplNH+2v7TapaWQQYbbZonaz+6WRKbKxN/tefw1AHxd9fteJvz
         3vxV52nWGhoQVTt5HXKFzKdy1xFV8QWPxGWEAPM8NyU34FB5oaC6u+dsFFDolD1UBy+u
         5yWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462504; x=1752067304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzBNkC1LrICEdp72G1BYaNAZRdriqn0nQ8BzbvM7AnI=;
        b=CJ4L26DswVzqmQlC+ObMDwn19AwpQopJMCgQQ1dQ+LGsRUpR4kgSHu3nnYAglLpM5E
         8BXZFL6Cy6/GfaOoTqcKiiu1g/wVLq+huk5xjotJz41dtUshrperG6XgMCt7fQTKGvPh
         iJLImVX1a0/T3YPkJzL0huCpYGNHan2uUYuymOrriAtW33YmVE8XE9RA/gvhYPrZGIAA
         PjWgM2AaFHKdgsc+Q0OC672P+RwDLgrHMBkFIcZr1TnwwgHUoCrb7wsGeoMTa5LXPQy3
         ivTjy6AVNET3/AhhYYNqZMkMJf9n1Uo57dZpqBNoBYBSUZgPamfCu6GpvmjJ2hqfKSob
         WajQ==
X-Forwarded-Encrypted: i=1; AJvYcCU08wDBj/XWW6fn/ZWKgStRZUoqy6n1vsUuKryQ/OdsbIsLPKoeOGnf8BcIA3ExWxR4Vz6gre1sR0OJFQ==@vger.kernel.org, AJvYcCWCmDAoaR/ojCpRPODJ6H9Xp9qQxOEQ1CNqo3m5hJNt5P7Puw/dUPlDE0k8+ujy6sXzVPYgceOIg/b/@vger.kernel.org, AJvYcCXy4hSSqBXRhRkTZ5PhyvQViCiNNH9Om5y8dLdMsR5oaxO0cMlOe3CIMOz27boVHlsc8emEF3boVrMLyByK@vger.kernel.org
X-Gm-Message-State: AOJu0YyJF0ASn4C74M/JUk8scd37ujQn4uSsuXKq3wwolrUvZ51o5niS
	kiptflKoEN2CqZCHCk9bATJrVAZwYcLGWSJb2UGADqX2d0HDHpPSUzBV
X-Gm-Gg: ASbGnctGf2YNZkCxqet+bYAySmUmf5BKGS8/wOU51UxW2oUcEWUZuUw/m1vsY2yUzyN
	vfxx7zq1M9MpiUmYbTyLBWzktFOckIHKNTkv+21mk17ToLnr8zPzIE46vJgnpaf67YJRPW4laW+
	rnp9bt76qFvpUbUM3SZHEfw28Wnyd0NSkyE5hIqdOQQ7moOBHhA5U7w7vwjw+sMSq/cxxpM+DeA
	cX7RyItAYN1wazl6jG7FZWMHuiLZZ5qhEku9jtbuPYL87TWA8a1chfT2FlLulWkKFpUU8ts3kb5
	gPy3oumEPzJpTDjb2beGDUINW9C3rq9Q88V6V4cfA+0GNca/R7O4dffvd7DPuNLFn+AK3eaOsL4
	=
X-Google-Smtp-Source: AGHT+IGmH+d+rJqdg7lcNzB3/fwDYNsWBYq6muddgYXHLvA0iF1uj2AkmeLO7/yU0aO2dA31B/VMrQ==
X-Received: by 2002:a17:906:d7e1:b0:ae0:aed9:eba0 with SMTP id a640c23a62f3a-ae3c2ceef09mr281682366b.55.1751462503903;
        Wed, 02 Jul 2025 06:21:43 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:43 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v5 15/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
Date: Wed,  2 Jul 2025 16:20:41 +0300
Message-ID: <20250702132104.1537926-16-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These drivers are meant to be used as a common framework for Maxim
GMSL2/3 serializers and deserializers.

This framework enables support for the following new features across
all the chips:
 * Full Streams API support
 * .get_frame_desc()
 * .get_mbus_config()
 * I2C ATR
 * automatic GMSL link version negotiation
 * automatic stream id selection
 * automatic VC remapping
 * automatic pixel mode / tunnel mode selection
 * automatic double mode selection / data padding
 * logging of internal state and chip status registers via .log_status()
 * PHY modes
 * serializer pinctrl
 * TPG

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 MAINTAINERS                                 |   1 +
 drivers/media/i2c/Kconfig                   |   2 +
 drivers/media/i2c/Makefile                  |   1 +
 drivers/media/i2c/maxim-serdes/Kconfig      |  16 +
 drivers/media/i2c/maxim-serdes/Makefile     |   3 +
 drivers/media/i2c/maxim-serdes/max_serdes.c | 413 ++++++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_serdes.h | 183 +++++++++
 7 files changed, 619 insertions(+)
 create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
 create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 334195989c00..8cd57b66afe3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14769,6 +14769,7 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
+F:	drivers/media/i2c/maxim-serdes/
 
 MAXIM MAX11205 DRIVER
 M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4c199da6ea..f504016aadfd 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1700,6 +1700,8 @@ config VIDEO_MAX96717
 	  To compile this driver as a module, choose M here: the
 	  module will be called max96717.
 
+source "drivers/media/i2c/maxim-serdes/Kconfig"
+
 endmenu
 
 endif # VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee..25a0093d40ec 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_VIDEO_MAX9271_LIB) += max9271.o
 obj-$(CONFIG_VIDEO_MAX9286) += max9286.o
 obj-$(CONFIG_VIDEO_MAX96714) += max96714.o
 obj-$(CONFIG_VIDEO_MAX96717) += max96717.o
+obj-$(CONFIG_VIDEO_MAXIM_SERDES) += maxim-serdes/
 obj-$(CONFIG_VIDEO_ML86V7667) += ml86v7667.o
 obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
 obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
diff --git a/drivers/media/i2c/maxim-serdes/Kconfig b/drivers/media/i2c/maxim-serdes/Kconfig
new file mode 100644
index 000000000000..cae1d5a1293e
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_MAXIM_SERDES
+	tristate "Maxim GMSL2/3 Serializer and Deserializer support"
+	depends on VIDEO_DEV
+	select I2C_ATR
+	select I2C_MUX
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver supports the Maxim GMSL2/3 common Serializer and
+	  Deserializer framework.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called max_serdes.
diff --git a/drivers/media/i2c/maxim-serdes/Makefile b/drivers/media/i2c/maxim-serdes/Makefile
new file mode 100644
index 000000000000..630fbb486bab
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+max-serdes-objs := max_serdes.o
+obj-$(CONFIG_VIDEO_MAXIM_SERDES) += max-serdes.o
diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.c b/drivers/media/i2c/maxim-serdes/max_serdes.c
new file mode 100644
index 000000000000..73e018d1f0d2
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_serdes.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/stringify.h>
+
+#include <media/mipi-csi2.h>
+
+#include <video/videomode.h>
+
+#include <uapi/linux/media-bus-format.h>
+
+#include "max_serdes.h"
+
+const char * const max_serdes_tpg_patterns[] = {
+	[MAX_SERDES_TPG_PATTERN_GRADIENT] = "Gradient",
+	[MAX_SERDES_TPG_PATTERN_CHECKERBOARD] = "Checkerboard",
+};
+
+static const char * const max_gmsl_versions[] = {
+	[MAX_SERDES_GMSL_2_3GBPS] = "GMSL2 3Gbps",
+	[MAX_SERDES_GMSL_2_6GBPS] = "GMSL2 6Gbps",
+	[MAX_SERDES_GMSL_3] = "GMSL3",
+};
+
+const char *max_serdes_gmsl_version_str(enum max_serdes_gmsl_version version)
+{
+	if (version > MAX_SERDES_GMSL_3)
+		return NULL;
+
+	return max_gmsl_versions[version];
+}
+
+static const char * const max_gmsl_mode[] = {
+	[MAX_SERDES_GMSL_PIXEL_MODE] = "pixel",
+	[MAX_SERDES_GMSL_TUNNEL_MODE] = "tunnel",
+};
+
+const char *max_serdes_gmsl_mode_str(enum max_serdes_gmsl_mode mode)
+{
+	if (mode > MAX_SERDES_GMSL_TUNNEL_MODE)
+		return NULL;
+
+	return max_gmsl_mode[mode];
+}
+
+static const struct max_serdes_mipi_format max_serdes_mipi_formats[] = {
+	{ MIPI_CSI2_DT_EMBEDDED_8B, 8 },
+	{ MIPI_CSI2_DT_YUV422_8B, 16 },
+	{ MIPI_CSI2_DT_YUV422_10B, 20 },
+	{ MIPI_CSI2_DT_RGB565, 16 },
+	{ MIPI_CSI2_DT_RGB666, 18 },
+	{ MIPI_CSI2_DT_RGB888, 24 },
+	{ MIPI_CSI2_DT_RAW8, 8 },
+	{ MIPI_CSI2_DT_RAW10, 10 },
+	{ MIPI_CSI2_DT_RAW12, 12 },
+	{ MIPI_CSI2_DT_RAW14, 14 },
+	{ MIPI_CSI2_DT_RAW16, 16 },
+};
+
+const struct max_serdes_mipi_format *max_serdes_mipi_format_by_dt(u8 dt)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(max_serdes_mipi_formats); i++)
+		if (max_serdes_mipi_formats[i].dt == dt)
+			return &max_serdes_mipi_formats[i];
+
+	return NULL;
+}
+
+int max_serdes_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				   struct v4l2_mbus_frame_desc_entry *entry)
+{
+	struct v4l2_mbus_frame_desc fd;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_subdev_call(sd, pad, get_frame_desc, pad, &fd);
+	if (ret)
+		return ret;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < fd.num_entries; i++) {
+		if (fd.entry[i].stream == stream) {
+			*entry = fd.entry[i];
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+int max_serdes_get_fd_bpp(struct v4l2_mbus_frame_desc_entry *entry,
+			  unsigned int *bpp)
+{
+	const struct max_serdes_mipi_format *format;
+
+	format = max_serdes_mipi_format_by_dt(entry->bus.csi2.dt);
+	if (!format)
+		return -ENOENT;
+
+	*bpp = format->bpp;
+
+	return 0;
+}
+
+int max_serdes_process_bpps(struct device *dev, u32 bpps,
+			    u32 allowed_double_bpps, unsigned int *doubled_bpp)
+{
+	unsigned int min_bpp;
+	unsigned int max_bpp;
+	bool doubled = false;
+
+	if (!bpps)
+		return 0;
+
+	*doubled_bpp = 0;
+
+	/*
+	 * Hardware can double bpps 8, 10, 12, and it can pad bpps < 16
+	 * to another bpp <= 16:
+	 * Hardware can only stream a single constant bpp up to 24.
+	 *
+	 * From these features and limitations, the following rules
+	 * can be deduced:
+	 *
+	 * A bpp of 8 can always be doubled if present.
+	 * A bpp of 10 can be doubled only if there are no other bpps or the
+	 * only other bpp is 20.
+	 * A bpp of 12 can be doubled only if there are no other bpps or the
+	 * only other bpp is 24.
+	 * Bpps <= 16 cannot coexist with bpps > 16.
+	 * Bpps <= 16 need to be padded to the biggest bpp.
+	 */
+
+	min_bpp = __ffs(bpps);
+	max_bpp = __fls(bpps);
+
+	if (min_bpp == 8) {
+		doubled = true;
+	} else if (min_bpp == 10 || min_bpp == 12) {
+		u32 bpp_or_double = BIT(min_bpp) | BIT(min_bpp * 2);
+		u32 other_bpps = bpps & ~bpp_or_double;
+
+		if (!other_bpps)
+			doubled = true;
+	}
+
+	if (doubled && (allowed_double_bpps & BIT(min_bpp))) {
+		*doubled_bpp = min_bpp;
+		bpps &= ~BIT(min_bpp);
+		bpps |= BIT(min_bpp * 2);
+	}
+
+	min_bpp = __ffs(bpps);
+	max_bpp = __fls(bpps);
+
+	if (max_bpp > 24) {
+		dev_err(dev, "Cannot stream bpps > 24\n");
+		return -EINVAL;
+	}
+
+	if (min_bpp <= 16 && max_bpp > 16) {
+		dev_err(dev, "Cannot stream bpps <= 16 with bpps > 16\n");
+		return -EINVAL;
+	}
+
+	if (max_bpp > 16 && min_bpp != max_bpp) {
+		dev_err(dev, "Cannot stream multiple bpps when one is > 16\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int max_serdes_xlate_enable_disable_streams(struct max_serdes_source *sources,
+					    u32 source_sink_pad_offset,
+					    const struct v4l2_subdev_state *state,
+					    u32 pad, u64 updated_streams_mask,
+					    u32 sink_pad_start, u32 num_sink_pads,
+					    bool enable)
+{
+	u32 failed_sink_pad;
+	int ret;
+	u32 i;
+
+	for (i = sink_pad_start; i < sink_pad_start + num_sink_pads; i++) {
+		u64 matched_streams_mask = updated_streams_mask;
+		u64 updated_sink_streams_mask;
+		struct max_serdes_source *source;
+
+		updated_sink_streams_mask =
+			v4l2_subdev_state_xlate_streams(state, pad, i,
+							&matched_streams_mask);
+		if (!updated_sink_streams_mask)
+			continue;
+
+		source = &sources[i + source_sink_pad_offset];
+		if (!source)
+			continue;
+
+		if (enable)
+			ret = v4l2_subdev_enable_streams(source->sd, source->pad,
+							 updated_sink_streams_mask);
+		else
+			ret = v4l2_subdev_disable_streams(source->sd, source->pad,
+							  updated_sink_streams_mask);
+		if (ret) {
+			failed_sink_pad = i;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	for (i = sink_pad_start; i < failed_sink_pad; i++) {
+		u64 matched_streams_mask = updated_streams_mask;
+		u64 updated_sink_streams_mask;
+		struct max_serdes_source *source;
+
+		updated_sink_streams_mask =
+			v4l2_subdev_state_xlate_streams(state, pad, i,
+							&matched_streams_mask);
+		if (!updated_sink_streams_mask)
+			continue;
+
+		source = &sources[i + source_sink_pad_offset];
+		if (!source)
+			continue;
+
+		if (!enable)
+			v4l2_subdev_enable_streams(source->sd, source->pad,
+						   updated_sink_streams_mask);
+		else
+			v4l2_subdev_disable_streams(source->sd, source->pad,
+						    updated_sink_streams_mask);
+	}
+
+	return ret;
+}
+
+int max_serdes_get_streams_masks(struct device *dev,
+				 const struct v4l2_subdev_state *state,
+				 u32 pad, u64 updated_streams_mask,
+				 u32 num_pads, u64 *old_streams_masks,
+				 u64 **new_streams_masks, bool enable)
+{
+	u64 *streams_masks;
+	unsigned int i;
+
+	streams_masks = devm_kcalloc(dev, num_pads, sizeof(*streams_masks), GFP_KERNEL);
+	if (!streams_masks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pads; i++) {
+		u64 matched_streams_mask = updated_streams_mask;
+		u64 updated_sink_streams_mask;
+
+		updated_sink_streams_mask =
+			v4l2_subdev_state_xlate_streams(state, pad, i,
+							&matched_streams_mask);
+		if (!updated_sink_streams_mask)
+			continue;
+
+		streams_masks[i] = old_streams_masks[i];
+		if (enable)
+			streams_masks[i] |= updated_sink_streams_mask;
+		else
+			streams_masks[i] &= ~updated_sink_streams_mask;
+	}
+
+	if (enable)
+		streams_masks[pad] |= updated_streams_mask;
+	else
+		streams_masks[pad] &= ~updated_streams_mask;
+
+	*new_streams_masks = streams_masks;
+
+	return 0;
+}
+
+static const struct videomode max_serdes_tpg_pixel_videomodes[] = {
+	{
+		.pixelclock = 25000000,
+		.hactive = 640,
+		.hfront_porch = 10,
+		.hsync_len = 96,
+		.hback_porch = 40,
+		.vactive = 480,
+		.vfront_porch = 2,
+		.vsync_len = 24,
+		.vback_porch = 24,
+	},
+	{
+		.pixelclock = 75000000,
+		.hactive = 1920,
+		.hfront_porch = 88,
+		.hsync_len = 44,
+		.hback_porch = 148,
+		.vactive = 1080,
+		.vfront_porch = 4,
+		.vsync_len = 16,
+		.vback_porch = 36,
+	},
+	{
+		.pixelclock = 150000000,
+		.hactive = 1920,
+		.hfront_porch = 88,
+		.hsync_len = 44,
+		.hback_porch = 148,
+		.vactive = 1080,
+		.vfront_porch = 4,
+		.vsync_len = 16,
+		.vback_porch = 36,
+	},
+};
+
+static void max_serdes_get_vm_timings(const struct videomode *vm,
+				      struct max_serdes_tpg_timings *timings)
+{
+	u32 hact = vm->hactive;
+	u32 hfp = vm->hfront_porch;
+	u32 hsync = vm->hsync_len;
+	u32 hbp = vm->hback_porch;
+	u32 htot = hact + hfp + hbp + hsync;
+
+	u32 vact = vm->vactive;
+	u32 vfp = vm->vfront_porch;
+	u32 vsync = vm->vsync_len;
+	u32 vbp = vm->vback_porch;
+	u32 vtot = vact + vfp + vbp + vsync;
+
+	*timings = (struct max_serdes_tpg_timings) {
+		.gen_vs = true,
+		.gen_hs = true,
+		.gen_de = true,
+		.vs_inv = true,
+		.vs_dly = 0,
+		.vs_high = vsync * htot,
+		.vs_low = (vact + vfp + vbp) * htot,
+		.v2h = 0,
+		.hs_high = hsync,
+		.hs_low = hact + hfp + hbp,
+		.hs_cnt = vact + vfp + vbp + vsync,
+		.v2d = htot * (vsync + vbp) + (hsync + hbp),
+		.de_high = hact,
+		.de_low = hfp + hsync + hbp,
+		.de_cnt = vact,
+		.clock = vm->pixelclock,
+		.fps = DIV_ROUND_CLOSEST(vm->pixelclock, vtot * htot),
+	};
+}
+
+int max_serdes_get_tpg_timings(const struct max_serdes_tpg_entry *entry,
+			       struct max_serdes_tpg_timings *timings)
+{
+	u32 fps;
+
+	if (!entry)
+		return 0;
+
+	fps = DIV_ROUND_CLOSEST(1 * entry->interval.denominator,
+				entry->interval.numerator);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(max_serdes_tpg_pixel_videomodes); i++) {
+		struct max_serdes_tpg_timings vm_timings;
+		const struct videomode *vm;
+
+		vm = &max_serdes_tpg_pixel_videomodes[i];
+
+		max_serdes_get_vm_timings(vm, &vm_timings);
+
+		if (vm->hactive == entry->width &&
+		    vm->vactive == entry->height &&
+		    vm_timings.fps == fps) {
+			*timings = vm_timings;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(max_serdes_get_tpg_timings);
+
+int max_serdes_validate_tpg_routing(struct v4l2_subdev_krouting *routing)
+{
+	const struct v4l2_subdev_route *route;
+
+	if (routing->num_routes != 1)
+		return -EINVAL;
+
+	route = &routing->routes[0];
+
+	if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
+		return -EINVAL;
+
+	if (route->sink_stream != MAX_SERDES_TPG_STREAM)
+		return -EINVAL;
+
+	return 0;
+}
+
+MODULE_DESCRIPTION("Maxim GMSL2 Serializer/Deserializer Driver");
+MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.h b/drivers/media/i2c/maxim-serdes/max_serdes.h
new file mode 100644
index 000000000000..fdd761fcd8b2
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/max_serdes.h
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 Analog Devices Inc.
+ */
+
+#ifndef MAX_SERDES_H
+#define MAX_SERDES_H
+
+#include <linux/types.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-subdev.h>
+
+#define REG_SEQUENCE_2(reg, val) \
+	{ (reg),     ((val) >> 8) & 0xff }, \
+	{ (reg) + 1, ((val) >> 0) & 0xff }
+
+#define REG_SEQUENCE_3(reg, val) \
+	{ (reg),     ((val) >> 16) & 0xff }, \
+	{ (reg) + 1, ((val) >> 8)  & 0xff }, \
+	{ (reg) + 2, ((val) >> 0)  & 0xff }
+
+#define REG_SEQUENCE_3_LE(reg, val) \
+	{ (reg),     ((val) >> 0) & 0xff }, \
+	{ (reg) + 1, ((val) >> 8)  & 0xff }, \
+	{ (reg) + 2, ((val) >> 16)  & 0xff }
+
+#define field_get(mask, val) (((val) & (mask)) >> __ffs(mask))
+#define field_prep(mask, val) (((val) << __ffs(mask)) & (mask))
+
+#define MAX_SERDES_PHYS_MAX		4
+#define MAX_SERDES_STREAMS_NUM		4
+#define MAX_SERDES_VC_ID_NUM		4
+#define MAX_SERDES_TPG_STREAM		0
+
+#define MAX_SERDES_GRAD_INCR		4
+#define MAX_SERDES_CHECKER_COLOR_A	0x00ccfe
+#define MAX_SERDES_CHECKER_COLOR_B	0xa76a00
+#define MAX_SERDES_CHECKER_SIZE		60
+
+extern const char * const max_serdes_tpg_patterns[];
+
+enum max_serdes_gmsl_version {
+	MAX_SERDES_GMSL_MIN,
+	MAX_SERDES_GMSL_2_3GBPS = MAX_SERDES_GMSL_MIN,
+	MAX_SERDES_GMSL_2_6GBPS,
+	MAX_SERDES_GMSL_3,
+	MAX_SERDES_GMSL_MAX = MAX_SERDES_GMSL_3,
+};
+
+enum max_serdes_gmsl_mode {
+	MAX_SERDES_GMSL_PIXEL_MODE,
+	MAX_SERDES_GMSL_TUNNEL_MODE,
+};
+
+enum max_serdes_tpg_pattern {
+	MAX_SERDES_TPG_PATTERN_MIN,
+	MAX_SERDES_TPG_PATTERN_CHECKERBOARD = MAX_SERDES_TPG_PATTERN_MIN,
+	MAX_SERDES_TPG_PATTERN_GRADIENT,
+	MAX_SERDES_TPG_PATTERN_MAX = MAX_SERDES_TPG_PATTERN_GRADIENT,
+};
+
+struct max_serdes_phys_config {
+	unsigned int lanes[MAX_SERDES_PHYS_MAX];
+	unsigned int clock_lane[MAX_SERDES_PHYS_MAX];
+};
+
+struct max_serdes_phys_configs {
+	const struct max_serdes_phys_config *configs;
+	unsigned int num_configs;
+};
+
+struct max_serdes_i2c_xlate {
+	u8 src;
+	u8 dst;
+	bool en;
+};
+
+struct max_serdes_mipi_format {
+	u8 dt;
+	u8 bpp;
+};
+
+struct max_serdes_vc_remap {
+	u8 src;
+	u8 dst;
+};
+
+struct max_serdes_source {
+	struct v4l2_subdev *sd;
+	u16 pad;
+	struct fwnode_handle *ep_fwnode;
+
+	unsigned int index;
+};
+
+struct max_serdes_asc {
+	struct v4l2_async_connection base;
+	struct max_serdes_source *source;
+};
+
+struct max_serdes_tpg_entry {
+	u32 width;
+	u32 height;
+	struct v4l2_fract interval;
+	u32 code;
+	u8 dt;
+	u8 bpp;
+};
+
+#define MAX_TPG_ENTRY_640X480P60_RGB888 \
+	{ 640, 480, { 1, 60 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, 24 }
+
+#define MAX_TPG_ENTRY_1920X1080P30_RGB888 \
+	{ 1920, 1080, { 1, 30 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, 24 }
+
+#define MAX_TPG_ENTRY_1920X1080P60_RGB888 \
+	{ 1920, 1080, { 1, 60 }, MEDIA_BUS_FMT_RGB888_1X24, MIPI_CSI2_DT_RGB888, 24 }
+
+struct max_serdes_tpg_entries {
+	const struct max_serdes_tpg_entry *entries;
+	unsigned int num_entries;
+};
+
+struct max_serdes_tpg_timings {
+	bool gen_vs;
+	bool gen_hs;
+	bool gen_de;
+	bool vs_inv;
+	bool hs_inv;
+	bool de_inv;
+	u32 vs_dly;
+	u32 vs_high;
+	u32 vs_low;
+	u32 v2h;
+	u32 hs_high;
+	u32 hs_low;
+	u32 hs_cnt;
+	u32 v2d;
+	u32 de_high;
+	u32 de_low;
+	u32 de_cnt;
+	u32 clock;
+	u32 fps;
+};
+
+static inline struct max_serdes_asc *asc_to_max(struct v4l2_async_connection *asc)
+{
+	return container_of(asc, struct max_serdes_asc, base);
+}
+
+const char *max_serdes_gmsl_version_str(enum max_serdes_gmsl_version version);
+const char *max_serdes_gmsl_mode_str(enum max_serdes_gmsl_mode mode);
+
+const struct max_serdes_mipi_format *max_serdes_mipi_format_by_dt(u8 dt);
+
+int max_serdes_get_fd_stream_entry(struct v4l2_subdev *sd, u32 pad, u32 stream,
+				   struct v4l2_mbus_frame_desc_entry *entry);
+
+int max_serdes_get_fd_bpp(struct v4l2_mbus_frame_desc_entry *entry,
+			  unsigned int *bpp);
+int max_serdes_process_bpps(struct device *dev, u32 bpps,
+			    u32 allowed_double_bpps, unsigned int *doubled_bpp);
+
+int max_serdes_xlate_enable_disable_streams(struct max_serdes_source *sources,
+					    u32 source_sink_pad_offset,
+					    const struct v4l2_subdev_state *state,
+					    u32 pad, u64 updated_streams_mask,
+					    u32 sink_pad_start, u32 num_sink_pads,
+					    bool enable);
+
+int max_serdes_get_streams_masks(struct device *dev,
+				 const struct v4l2_subdev_state *state,
+				 u32 pad, u64 updated_streams_mask,
+				 u32 num_pads, u64 *old_streams_masks,
+				 u64 **new_streams_masks, bool enable);
+
+int max_serdes_get_tpg_timings(const struct max_serdes_tpg_entry *entry,
+			       struct max_serdes_tpg_timings *timings);
+
+int max_serdes_validate_tpg_routing(struct v4l2_subdev_krouting *routing);
+
+#endif // MAX_SERDES_H
-- 
2.50.0


