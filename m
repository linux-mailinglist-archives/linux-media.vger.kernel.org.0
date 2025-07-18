Return-Path: <linux-media+bounces-38084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B3B0A756
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 17:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 956A25C1ADE
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 15:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C3E2E4262;
	Fri, 18 Jul 2025 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghXQYT/V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366332E3B03;
	Fri, 18 Jul 2025 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852351; cv=none; b=Uh0sduMc8AOjYdzdkOXjjyj1uH2PiOwjzoZuPIc10Iybz0maPiU8WocR+sLd/v+xy4G0v1+nLeyFoNACQ0po32JgU6VqjEjYBxvH4JIA9JghwqAKOZ9mSsCh/TGNDjPd6EZevx8kqx/uk4TYKWyFADNC9WAhSWXX2Mf5OkDXza0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852351; c=relaxed/simple;
	bh=MctPmLLqzZySdwtJ+vWUukoII15UyvlIlaBAiwHkRoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EojEleL8HPrptbMrU0+hK+udMlcuXmVDS8ik/CziCDCXRCPk7IMn4qMpVxghmxRD+x19um5qY8MZZaJ+A55tCvpmOi+agY17SCELRfApi3O7CVCQ3cpDOh30oFUEGizFcIc2FQdF6AGeUTPTT2eGZtRgutopfLNCOdYNe9NhFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghXQYT/V; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-455b00283a5so13661665e9.0;
        Fri, 18 Jul 2025 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852347; x=1753457147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OfWoG9UtXO9KqSynPQ4jh+WpF7yo0pW4fRc0jHrqD8=;
        b=ghXQYT/Va1vBM6UMYXcBQxA4WuzCEqvEjMDFVEddTL3WyVBiv4HKsDwv8G1eTrYPaJ
         rnqFwsUL8YUTW7V49w2Egb3Q6kiiIBvGHlUGe84kp1BM4Zlfy5hmtoLEeio9otJaxFXI
         JOJ5ax2kH/VQYaOs19HjW5LcalyhMV9MFAsN17NQeXwEYpRtsGBPyl5Blq2q2pkexu+Y
         7wjBih42wJQDbYySHO/p30HYyCpoxvdwazSc8BEwIS5YLJ2/coOOcflHUw0hVWPgTqrw
         5+ID1ZvdDu9WhnEJ1yyMPoWww6JF+wprDa+akRDnRb8h9BMvmDAHV/3tZRVb9wPOYH5Z
         s5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852347; x=1753457147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OfWoG9UtXO9KqSynPQ4jh+WpF7yo0pW4fRc0jHrqD8=;
        b=ZKqUXSg0wxabk+ON34NONjIFMJcPlwmNoLSZ1aWa6pC32d/uoX+yqh1eOYRmbsk8PK
         aSWXGlgqtmiNSWU2iCmbE+eWHVL1dlVjpNzNsbR5ZBzTSTnND/tb7HwVSQHne3KszET1
         HffY7BG8xWTWyG0KFyEFNEnrsjvnwcI0EYxJ98MmfLl7/ihpCEBbFa9NZiGu7Am2XYlX
         Rp2tc6MBQiWbNrD0mmvldPv+qnK5jr9JOHP1JulnlH4yAwtzquOqu2Ei8t9bk+Drpvza
         6sP2YSG8HXmo7CYcxpDeYHXKAlya3iw4WwtF4agwGmY/gxtpJX26nSFQMuDqBE54yO4n
         /cJw==
X-Forwarded-Encrypted: i=1; AJvYcCWBFejkQjDUDuphqQgo7xkrS3MFwqP56Itd0yd9nY6CoCKh6X+6m8Sh8SjqYQzAH2zUtrvP2Vj6XgtoAJlI@vger.kernel.org, AJvYcCWKVRQcwues3zls7Tzdrhnn0MiTpk9VFCHU+caX3Sg8lCUC4vw8Y8l6SF8rFaKWoiV9WgVKPB/uIpsT@vger.kernel.org, AJvYcCX2nxQJ+wevzQTyt1wdTXN8czhwMTbEO3aWdHGzjSlQW75EkConzmkWUGdqYCtJnrqMwKjlxfNTqs9DSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+taTZIvgd4oYuC1Yy7YZkFCpf9HHEiQMHDWK+R1jpLF/ruZa
	uUhNe70oV5oWnildXUwBsiM43E6G/GNahhk4Shr2ilbVLi8TLEzQFa3k
X-Gm-Gg: ASbGnctuXxE2cXARV7wSOdSSpfKmL4nVq85lQeHtCuA9Ihuh7ItC4I+fXRpLC0GPH1I
	jTOhpbrbZz82bY+Bda790YAmd52hn6d4R0Ok5TZbNyLnmXeDPBaZU8rGDfqJrLkAlHttKPJLQ+V
	bKCJr3biO8Hpk5oRrGlEVpqNGpIgz1MOMZJduolV45QqpUAWwzJzFkyyZK942EFr3jPmaemjnw3
	YrUup9brpisOsx2WHlEJ+sFtEKBC+IbmaAHlkIH4gf2vGlMcOaso1LxS/gSI7Dx/Iij79N6+4Mj
	OPA9dpBSUQxUKlOdqcY17iIAMYYOGOMb4yEgkpLWccWshaX9W9d4hdwoPkXLmBmB+9WTvpdBpoV
	SBbHzodXWR24ZX9/zRVOklap348ImpfsNPwgWiNOWG06WlQ==
X-Google-Smtp-Source: AGHT+IG9tBq7f5kr0jUWkGSlbTUS1iRJN0nBU68FkJYdRGd3nFD4dZAChJhAtdxH3PA3a03Ljk4vnQ==
X-Received: by 2002:a05:600c:1c03:b0:456:285b:db29 with SMTP id 5b1f17b1804b1-4563b8fc975mr29263355e9.29.1752852346974;
        Fri, 18 Jul 2025 08:25:46 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:46 -0700 (PDT)
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
Subject: [PATCH v7 15/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer framework
Date: Fri, 18 Jul 2025 18:24:51 +0300
Message-ID: <20250718152500.2656391-16-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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
 drivers/media/i2c/maxim-serdes/Kconfig      |  17 +
 drivers/media/i2c/maxim-serdes/Makefile     |   3 +
 drivers/media/i2c/maxim-serdes/max_serdes.c | 413 ++++++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_serdes.h | 183 +++++++++
 7 files changed, 620 insertions(+)
 create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
 create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0eb1729ae1647..0c75a5c195c28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14788,6 +14788,7 @@ M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max9296a.yaml
+F:	drivers/media/i2c/maxim-serdes/
 
 MAXIM MAX11205 DRIVER
 M:	Ramona Bolboaca <ramona.bolboaca@analog.com>
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 6237fe804a5c8..801a712a31808 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1686,6 +1686,8 @@ config VIDEO_MAX96717
 	  To compile this driver as a module, choose M here: the
 	  module will be called max96717.
 
+source "drivers/media/i2c/maxim-serdes/Kconfig"
+
 endmenu
 
 endif # VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee5..25a0093d40ecf 100644
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
index 0000000000000..f5a4ca80a263b
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_MAXIM_SERDES
+	tristate "Maxim GMSL2/3 Serializer and Deserializer support"
+	depends on VIDEO_DEV
+	depends on I2C
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
index 0000000000000..630fbb486bab1
--- /dev/null
+++ b/drivers/media/i2c/maxim-serdes/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+max-serdes-objs := max_serdes.o
+obj-$(CONFIG_VIDEO_MAXIM_SERDES) += max-serdes.o
diff --git a/drivers/media/i2c/maxim-serdes/max_serdes.c b/drivers/media/i2c/maxim-serdes/max_serdes.c
new file mode 100644
index 0000000000000..bed70b8ce99a4
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
+	[MAX_SERDES_GMSL_3_12GBPS] = "GMSL3 12Gbps",
+};
+
+const char *max_serdes_gmsl_version_str(enum max_serdes_gmsl_version version)
+{
+	if (version > MAX_SERDES_GMSL_3_12GBPS)
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
+EXPORT_SYMBOL_NS_GPL(max_serdes_get_tpg_timings, "MAX_SERDES");
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
index 0000000000000..d1d513e464d6c
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
+	MAX_SERDES_GMSL_3_12GBPS,
+	MAX_SERDES_GMSL_MAX = MAX_SERDES_GMSL_3_12GBPS,
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
2.50.1


