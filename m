Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4426231D841
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 12:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhBQL1Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 06:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbhBQLZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 06:25:30 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCC3C061A2E
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:13 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id t11so1240189ejx.6
        for <linux-media@vger.kernel.org>; Wed, 17 Feb 2021 03:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GKAsn7c+mWrgn+lNs9oJUQfT0Rjjz0SqrUrscFNnPlA=;
        b=NANJFo39wSqwPN6MO6rbQJBuuVoTw1Q0p4r0m9iiWsypB0VNGqRBxNUzVKXNGKzdGt
         PgHQXhqEZIn5GG+g3TOF8nsdX6QW7i29H1w7AOdf5qF85VYLtDpIs8TkEkuXLP8UXOx/
         VZg4//MaLQPI++v851761wxeb8uiJKV/HnER0GqZsl1SnIrhJVZLtUyJ/mNLswDJX2+9
         0pm4ydzG8YbrYp/11qvGCcn0KNmrztjN7L0Ibt9E2fAd9amZcY+CcnSlyOoC4QxyufEj
         vZqQcF9jD5oE2EDT//YFgIp4OFzhOpLQF9jOGpk4k8fhHLZ/Ppkm5x5p1JKMDi0UxMik
         44pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GKAsn7c+mWrgn+lNs9oJUQfT0Rjjz0SqrUrscFNnPlA=;
        b=gjsQAV5GacH6FQZngv3BEfUk9Drpp4cQT/YiKyBoygHK5WYYrIS8fcAGohAWLPL1a+
         mul2can09Rn4IsyyX/LguaXqYpeLFtK1vR43W/SuhKciPF3agAEkbudLfga/Ap05RpHo
         ietDDqnWK1G15OBGVyxdScXGSHjuWLiLxC7NhP79Z1yM2yEq5/a3zXHZRiD59QvLxyKP
         wfJuhA2s1BsIZi45pSiBYTUmEy5uEYqwA1pGyBtSEN9T8kQPt3PKR2t15xE42uUKTlL4
         hnUdARPPeaLHrizdLy1aJ92nLc+8WkVIEm6WOlF1AXITL5rUu5ZeyWhmvJ7MG/mS2e/W
         IS/w==
X-Gm-Message-State: AOAM533HrYGAx6M77tTgTDJqHSxhLETTuoOnIgf5oC+IsBzl8o8DF3JB
        4gytlVjXuju1vetArvkolZ36WA==
X-Google-Smtp-Source: ABdhPJxbgcaAL/o0FHtAs5djTEfkndau2qEbPKTfzHQC9EZLv9kJTdJedYz6a8u18Kn3ZeNzFTr/1Q==
X-Received: by 2002:a17:906:5902:: with SMTP id h2mr24428247ejq.137.1613560931585;
        Wed, 17 Feb 2021 03:22:11 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:22:11 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 09/22] media: camss: Refactor CSID HW version support
Date:   Wed, 17 Feb 2021 12:21:09 +0100
Message-Id: <20210217112122.424236-10-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to support Qualcomm ISP hardware architectures that diverge
from older architectures, the CSID subdevice drivers needs to be refactored
to better abstract the different ISP hardware architectures.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1
 - kernel test robot: Add missing include, interrupt.h

Changes since v4
 - Andrey: Removed whitespace from some includes
 - Andrey: Removed unused enum


 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-4-1.c      | 330 ++++++++++
 .../platform/qcom/camss/camss-csid-4-7.c      | 406 ++++++++++++
 .../media/platform/qcom/camss/camss-csid.c    | 616 +-----------------
 .../media/platform/qcom/camss/camss-csid.h    | 126 +++-
 5 files changed, 890 insertions(+), 590 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 052c4f405fa3..cff388b653ba 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -4,6 +4,8 @@
 qcom-camss-objs += \
 		camss.o \
 		camss-csid.o \
+		camss-csid-4-1.o \
+		camss-csid-4-7.o \
 		camss-csiphy-2ph-1-0.o \
 		camss-csiphy-3ph-1-0.o \
 		camss-csiphy.o \
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
new file mode 100644
index 000000000000..c92077a7f758
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-csid-4-1.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (C) 2020 Linaro Ltd.
+ */
+
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss-csid.h"
+#include "camss.h"
+
+#define CAMSS_CSID_HW_VERSION		0x0
+#define CAMSS_CSID_CORE_CTRL_0		0x004
+#define CAMSS_CSID_CORE_CTRL_1		0x008
+#define CAMSS_CSID_RST_CMD		0x00c
+#define CAMSS_CSID_CID_LUT_VC_n(n)	(0x010 + 0x4 * (n))
+#define CAMSS_CSID_CID_n_CFG(n)		(0x020 + 0x4 * (n))
+#define CAMSS_CSID_CID_n_CFG_ISPIF_EN	BIT(0)
+#define CAMSS_CSID_CID_n_CFG_RDI_EN	BIT(1)
+#define CAMSS_CSID_CID_n_CFG_DECODE_FORMAT_SHIFT	4
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(0 << 8)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(1 << 8)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_LSB	(0 << 9)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_MSB	(1 << 9)
+#define CAMSS_CSID_CID_n_CFG_RDI_MODE_RAW_DUMP		(0 << 10)
+#define CAMSS_CSID_CID_n_CFG_RDI_MODE_PLAIN_PACKING	(1 << 10)
+#define CAMSS_CSID_IRQ_CLEAR_CMD	0x060
+#define CAMSS_CSID_IRQ_MASK		0x064
+#define CAMSS_CSID_IRQ_STATUS		0x068
+#define CAMSS_CSID_TG_CTRL		0x0a0
+#define CAMSS_CSID_TG_CTRL_DISABLE	0xa06436
+#define CAMSS_CSID_TG_CTRL_ENABLE	0xa06437
+#define CAMSS_CSID_TG_VC_CFG		0x0a4
+#define CAMSS_CSID_TG_VC_CFG_H_BLANKING		0x3ff
+#define CAMSS_CSID_TG_VC_CFG_V_BLANKING		0x7f
+#define CAMSS_CSID_TG_DT_n_CGG_0(n)	(0x0ac + 0xc * (n))
+#define CAMSS_CSID_TG_DT_n_CGG_1(n)	(0x0b0 + 0xc * (n))
+#define CAMSS_CSID_TG_DT_n_CGG_2(n)	(0x0b4 + 0xc * (n))
+
+
+static const struct csid_format csid_formats[] = {
+	{
+		MEDIA_BUS_FMT_UYVY8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_VYUY8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YUYV8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YVYU8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_Y10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+};
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	struct csid_testgen_config *tg = &csid->testgen;
+	u32 val;
+
+	if (enable) {
+		struct v4l2_mbus_framefmt *input_format;
+		const struct csid_format *format;
+		u8 vc = 0; /* Virtual Channel 0 */
+		u8 cid = vc * 4; /* id of Virtual Channel and Data Type set */
+		u8 dt_shift;
+
+		if (tg->enabled) {
+			/* Config Test Generator */
+			u32 num_lines, num_bytes_per_line;
+
+			input_format = &csid->fmt[MSM_CSID_PAD_SRC];
+			format = csid_get_fmt_entry(csid->formats, csid->nformats,
+						    input_format->code);
+			num_bytes_per_line = input_format->width * format->bpp * format->spp / 8;
+			num_lines = input_format->height;
+
+			/* 31:24 V blank, 23:13 H blank, 3:2 num of active DT */
+			/* 1:0 VC */
+			val = ((CAMSS_CSID_TG_VC_CFG_V_BLANKING & 0xff) << 24) |
+				  ((CAMSS_CSID_TG_VC_CFG_H_BLANKING & 0x7ff) << 13);
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_VC_CFG);
+
+			/* 28:16 bytes per lines, 12:0 num of lines */
+			val = ((num_bytes_per_line & 0x1fff) << 16) |
+				  (num_lines & 0x1fff);
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_DT_n_CGG_0(0));
+
+			/* 5:0 data type */
+			val = format->data_type;
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_DT_n_CGG_1(0));
+
+			/* 2:0 output test pattern */
+			val = tg->mode;
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_DT_n_CGG_2(0));
+		} else {
+			struct csid_phy_config *phy = &csid->phy;
+
+			input_format = &csid->fmt[MSM_CSID_PAD_SINK];
+			format = csid_get_fmt_entry(csid->formats, csid->nformats,
+						    input_format->code);
+
+			val = phy->lane_cnt - 1;
+			val |= phy->lane_assign << 4;
+
+			writel_relaxed(val, csid->base + CAMSS_CSID_CORE_CTRL_0);
+
+			val = phy->csiphy_id << 17;
+			val |= 0x9;
+
+			writel_relaxed(val, csid->base + CAMSS_CSID_CORE_CTRL_1);
+		}
+
+		/* Config LUT */
+
+		dt_shift = (cid % 4) * 8;
+		val = readl_relaxed(csid->base + CAMSS_CSID_CID_LUT_VC_n(vc));
+		val &= ~(0xff << dt_shift);
+		val |= format->data_type << dt_shift;
+		writel_relaxed(val, csid->base + CAMSS_CSID_CID_LUT_VC_n(vc));
+
+		val = CAMSS_CSID_CID_n_CFG_ISPIF_EN;
+		val |= CAMSS_CSID_CID_n_CFG_RDI_EN;
+		val |= format->decode_format << CAMSS_CSID_CID_n_CFG_DECODE_FORMAT_SHIFT;
+		val |= CAMSS_CSID_CID_n_CFG_RDI_MODE_RAW_DUMP;
+		writel_relaxed(val, csid->base + CAMSS_CSID_CID_n_CFG(cid));
+
+		if (tg->enabled) {
+			val = CAMSS_CSID_TG_CTRL_ENABLE;
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_CTRL);
+		}
+	} else {
+		if (tg->enabled) {
+			val = CAMSS_CSID_TG_CTRL_DISABLE;
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_CTRL);
+		}
+	}
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	s32 regval = val - 1;
+
+	if (regval > 0 || regval <= CSID_PAYLOAD_MODE_MAX_SUPPORTED_4_1)
+		csid->testgen.mode = regval;
+
+	return 0;
+}
+
+static u32 csid_hw_version(struct csid_device *csid)
+{
+	u32 hw_version = readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
+
+	dev_dbg(csid->camss->dev, "CSID HW Version = 0x%08x\n", hw_version);
+
+	return hw_version;
+}
+
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 value;
+
+	value = readl_relaxed(csid->base + CAMSS_CSID_IRQ_STATUS);
+	writel_relaxed(value, csid->base + CAMSS_CSID_IRQ_CLEAR_CMD);
+
+	if ((value >> 11) & 0x1)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+
+	reinit_completion(&csid->reset_complete);
+
+	writel_relaxed(0x7fff, csid->base + CAMSS_CSID_RST_CMD);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+		msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
+			     unsigned int match_format_idx, u32 match_code)
+{
+	if (match_format_idx > 0)
+		return 0;
+
+	return sink_code;
+}
+
+static void csid_subdev_init(struct csid_device *csid)
+{
+	csid->formats = csid_formats;
+	csid->nformats = ARRAY_SIZE(csid_formats);
+	csid->testgen.modes = csid_testgen_modes;
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_MAX_SUPPORTED_4_1;
+}
+
+const struct csid_hw_ops csid_ops_4_1 = {
+	.configure_stream = csid_configure_stream,
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-7.c b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
new file mode 100644
index 000000000000..16a69b140f4e
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-csid-4-7.c
+ *
+ * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
+ *
+ * Copyright (C) 2020 Linaro Ltd.
+ */
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+
+#include "camss-csid.h"
+#include "camss.h"
+
+#define CAMSS_CSID_HW_VERSION		0x0
+#define CAMSS_CSID_CORE_CTRL_0		0x004
+#define CAMSS_CSID_CORE_CTRL_1		0x008
+#define CAMSS_CSID_RST_CMD		0x010
+#define CAMSS_CSID_CID_LUT_VC_n(n)	(0x014 + 0x4 * (n))
+#define CAMSS_CSID_CID_n_CFG(n)		(0x024 + 0x4 * (n))
+#define CAMSS_CSID_CID_n_CFG_ISPIF_EN	BIT(0)
+#define CAMSS_CSID_CID_n_CFG_RDI_EN	BIT(1)
+#define CAMSS_CSID_CID_n_CFG_DECODE_FORMAT_SHIFT	4
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(0 << 8)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(1 << 8)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_LSB	(0 << 9)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_MSB	(1 << 9)
+#define CAMSS_CSID_CID_n_CFG_RDI_MODE_RAW_DUMP		(0 << 10)
+#define CAMSS_CSID_CID_n_CFG_RDI_MODE_PLAIN_PACKING	(1 << 10)
+#define CAMSS_CSID_IRQ_CLEAR_CMD	0x064
+#define CAMSS_CSID_IRQ_MASK		0x068
+#define CAMSS_CSID_IRQ_STATUS		0x06c
+#define CAMSS_CSID_TG_CTRL		0x0a8
+#define CAMSS_CSID_TG_CTRL_DISABLE	0xa06436
+#define CAMSS_CSID_TG_CTRL_ENABLE	0xa06437
+#define CAMSS_CSID_TG_VC_CFG		0x0ac
+#define CAMSS_CSID_TG_VC_CFG_H_BLANKING		0x3ff
+#define CAMSS_CSID_TG_VC_CFG_V_BLANKING		0x7f
+#define CAMSS_CSID_TG_DT_n_CGG_0(n)	(0x0b4 + 0xc * (n))
+#define CAMSS_CSID_TG_DT_n_CGG_1(n)	(0x0b8 + 0xc * (n))
+#define CAMSS_CSID_TG_DT_n_CGG_2(n)	(0x0bc + 0xc * (n))
+
+
+static const struct csid_format csid_formats[] = {
+	{
+		MEDIA_BUS_FMT_UYVY8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_VYUY8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YUYV8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_YVYU8_2X8,
+		DATA_TYPE_YUV422_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		2,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB12_1X12,
+		DATA_TYPE_RAW_12BIT,
+		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
+		12,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SBGGR14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGBRG14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SGRBG14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_SRGGB14_1X14,
+		DATA_TYPE_RAW_14BIT,
+		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
+		14,
+		1,
+	},
+	{
+		MEDIA_BUS_FMT_Y10_1X10,
+		DATA_TYPE_RAW_10BIT,
+		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
+		10,
+		1,
+	},
+};
+
+static void csid_configure_stream(struct csid_device *csid, u8 enable)
+{
+	struct csid_testgen_config *tg = &csid->testgen;
+	u32 sink_code = csid->fmt[MSM_CSID_PAD_SINK].code;
+	u32 src_code = csid->fmt[MSM_CSID_PAD_SRC].code;
+	u32 val;
+
+	if (enable) {
+		struct v4l2_mbus_framefmt *input_format;
+		const struct csid_format *format;
+		u8 vc = 0; /* Virtual Channel 0 */
+		u8 cid = vc * 4; /* id of Virtual Channel and Data Type set */
+		u8 dt_shift;
+
+		if (tg->enabled) {
+			/* Config Test Generator */
+			u32 num_bytes_per_line, num_lines;
+
+			input_format = &csid->fmt[MSM_CSID_PAD_SRC];
+			format = csid_get_fmt_entry(csid->formats, csid->nformats,
+						    input_format->code);
+			num_bytes_per_line = input_format->width * format->bpp * format->spp / 8;
+			num_lines = input_format->height;
+
+			/* 31:24 V blank, 23:13 H blank, 3:2 num of active DT */
+			/* 1:0 VC */
+			val = ((CAMSS_CSID_TG_VC_CFG_V_BLANKING & 0xff) << 24) |
+				  ((CAMSS_CSID_TG_VC_CFG_H_BLANKING & 0x7ff) << 13);
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_VC_CFG);
+
+			/* 28:16 bytes per lines, 12:0 num of lines */
+			val = ((num_bytes_per_line & 0x1fff) << 16) |
+				  (num_lines & 0x1fff);
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_DT_n_CGG_0(0));
+
+			/* 5:0 data type */
+			val = format->data_type;
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_DT_n_CGG_1(0));
+
+			/* 2:0 output test pattern */
+			val = tg->mode;
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_DT_n_CGG_2(0));
+		} else {
+			struct csid_phy_config *phy = &csid->phy;
+
+			input_format = &csid->fmt[MSM_CSID_PAD_SINK];
+			format = csid_get_fmt_entry(csid->formats, csid->nformats,
+						    input_format->code);
+
+			val = phy->lane_cnt - 1;
+			val |= phy->lane_assign << 4;
+
+			writel_relaxed(val, csid->base + CAMSS_CSID_CORE_CTRL_0);
+
+			val = phy->csiphy_id << 17;
+			val |= 0x9;
+
+			writel_relaxed(val, csid->base + CAMSS_CSID_CORE_CTRL_1);
+		}
+
+		/* Config LUT */
+
+		dt_shift = (cid % 4) * 8;
+
+		val = readl_relaxed(csid->base + CAMSS_CSID_CID_LUT_VC_n(vc));
+		val &= ~(0xff << dt_shift);
+		val |= format->data_type << dt_shift;
+		writel_relaxed(val, csid->base + CAMSS_CSID_CID_LUT_VC_n(vc));
+
+		val = CAMSS_CSID_CID_n_CFG_ISPIF_EN;
+		val |= CAMSS_CSID_CID_n_CFG_RDI_EN;
+		val |= format->decode_format << CAMSS_CSID_CID_n_CFG_DECODE_FORMAT_SHIFT;
+		val |= CAMSS_CSID_CID_n_CFG_RDI_MODE_RAW_DUMP;
+
+		if ((sink_code == MEDIA_BUS_FMT_SBGGR10_1X10 &&
+		     src_code == MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE) ||
+		    (sink_code == MEDIA_BUS_FMT_Y10_1X10 &&
+		     src_code == MEDIA_BUS_FMT_Y10_2X8_PADHI_LE)) {
+			val |= CAMSS_CSID_CID_n_CFG_RDI_MODE_PLAIN_PACKING;
+			val |= CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16;
+			val |= CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_LSB;
+		}
+
+		writel_relaxed(val, csid->base + CAMSS_CSID_CID_n_CFG(cid));
+
+		if (tg->enabled) {
+			val = CAMSS_CSID_TG_CTRL_ENABLE;
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_CTRL);
+		}
+	} else {
+		if (tg->enabled) {
+			val = CAMSS_CSID_TG_CTRL_DISABLE;
+			writel_relaxed(val, csid->base + CAMSS_CSID_TG_CTRL);
+		}
+	}
+}
+
+static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
+{
+	s32 regval = val - 1;
+
+	if (regval > 0 || regval <= CSID_PAYLOAD_MODE_MAX_SUPPORTED_4_7)
+		csid->testgen.mode = regval;
+
+	return 0;
+}
+
+static u32 csid_hw_version(struct csid_device *csid)
+{
+	u32 hw_version = readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
+
+	dev_dbg(csid->camss->dev, "CSID HW Version = 0x%08x\n", hw_version);
+
+	return hw_version;
+}
+
+/*
+ * isr - CSID module interrupt service routine
+ * @irq: Interrupt line
+ * @dev: CSID device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t csid_isr(int irq, void *dev)
+{
+	struct csid_device *csid = dev;
+	u32 value;
+
+	value = readl_relaxed(csid->base + CAMSS_CSID_IRQ_STATUS);
+	writel_relaxed(value, csid->base + CAMSS_CSID_IRQ_CLEAR_CMD);
+
+	if ((value >> 11) & 0x1)
+		complete(&csid->reset_complete);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * csid_reset - Trigger reset on CSID module and wait to complete
+ * @csid: CSID device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csid_reset(struct csid_device *csid)
+{
+	unsigned long time;
+
+	reinit_completion(&csid->reset_complete);
+
+	writel_relaxed(0x7fff, csid->base + CAMSS_CSID_RST_CMD);
+
+	time = wait_for_completion_timeout(&csid->reset_complete,
+		msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
+	if (!time) {
+		dev_err(csid->camss->dev, "CSID reset timeout\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
+			     unsigned int match_format_idx, u32 match_code)
+{
+	switch (sink_code) {
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	{
+		u32 src_code[] = {
+			MEDIA_BUS_FMT_SBGGR10_1X10,
+			MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
+		};
+
+		return csid_find_code(src_code, ARRAY_SIZE(src_code),
+				      match_format_idx, match_code);
+	}
+	case MEDIA_BUS_FMT_Y10_1X10:
+	{
+		u32 src_code[] = {
+			MEDIA_BUS_FMT_Y10_1X10,
+			MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
+		};
+
+		return csid_find_code(src_code, ARRAY_SIZE(src_code),
+				      match_format_idx, match_code);
+	}
+	default:
+		if (match_format_idx > 0)
+			return 0;
+
+		return sink_code;
+	}
+}
+
+static void csid_subdev_init(struct csid_device *csid)
+{
+	csid->formats = csid_formats;
+	csid->nformats = ARRAY_SIZE(csid_formats);
+	csid->testgen.modes = csid_testgen_modes;
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_MAX_SUPPORTED_4_7;
+}
+
+const struct csid_hw_ops csid_ops_4_7 = {
+	.configure_stream = csid_configure_stream,
+	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.hw_version = csid_hw_version,
+	.isr = csid_isr,
+	.reset = csid_reset,
+	.src_pad_code = csid_src_pad_code,
+	.subdev_init = csid_subdev_init,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index be3fe76f3dc3..601bd810f2b0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -26,405 +26,35 @@
 
 #define MSM_CSID_NAME "msm_csid"
 
-#define CAMSS_CSID_HW_VERSION		0x0
-#define CAMSS_CSID_CORE_CTRL_0		0x004
-#define CAMSS_CSID_CORE_CTRL_1		0x008
-#define CAMSS_CSID_RST_CMD(v)		((v) == CAMSS_8x16 ? 0x00c : 0x010)
-#define CAMSS_CSID_CID_LUT_VC_n(v, n)	\
-			(((v) == CAMSS_8x16 ? 0x010 : 0x014) + 0x4 * (n))
-#define CAMSS_CSID_CID_n_CFG(v, n)	\
-			(((v) == CAMSS_8x16 ? 0x020 : 0x024) + 0x4 * (n))
-#define CAMSS_CSID_CID_n_CFG_ISPIF_EN	BIT(0)
-#define CAMSS_CSID_CID_n_CFG_RDI_EN	BIT(1)
-#define CAMSS_CSID_CID_n_CFG_DECODE_FORMAT_SHIFT	4
-#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(0 << 8)
-#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(1 << 8)
-#define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_LSB	(0 << 9)
-#define CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_MSB	(1 << 9)
-#define CAMSS_CSID_CID_n_CFG_RDI_MODE_RAW_DUMP		(0 << 10)
-#define CAMSS_CSID_CID_n_CFG_RDI_MODE_PLAIN_PACKING	(1 << 10)
-#define CAMSS_CSID_IRQ_CLEAR_CMD(v)	((v) == CAMSS_8x16 ? 0x060 : 0x064)
-#define CAMSS_CSID_IRQ_MASK(v)		((v) == CAMSS_8x16 ? 0x064 : 0x068)
-#define CAMSS_CSID_IRQ_STATUS(v)	((v) == CAMSS_8x16 ? 0x068 : 0x06c)
-#define CAMSS_CSID_TG_CTRL(v)		((v) == CAMSS_8x16 ? 0x0a0 : 0x0a8)
-#define CAMSS_CSID_TG_CTRL_DISABLE	0xa06436
-#define CAMSS_CSID_TG_CTRL_ENABLE	0xa06437
-#define CAMSS_CSID_TG_VC_CFG(v)		((v) == CAMSS_8x16 ? 0x0a4 : 0x0ac)
-#define CAMSS_CSID_TG_VC_CFG_H_BLANKING		0x3ff
-#define CAMSS_CSID_TG_VC_CFG_V_BLANKING		0x7f
-#define CAMSS_CSID_TG_DT_n_CGG_0(v, n)	\
-			(((v) == CAMSS_8x16 ? 0x0ac : 0x0b4) + 0xc * (n))
-#define CAMSS_CSID_TG_DT_n_CGG_1(v, n)	\
-			(((v) == CAMSS_8x16 ? 0x0b0 : 0x0b8) + 0xc * (n))
-#define CAMSS_CSID_TG_DT_n_CGG_2(v, n)	\
-			(((v) == CAMSS_8x16 ? 0x0b4 : 0x0bc) + 0xc * (n))
-
-#define DATA_TYPE_EMBEDDED_DATA_8BIT	0x12
-#define DATA_TYPE_YUV422_8BIT		0x1e
-#define DATA_TYPE_RAW_6BIT		0x28
-#define DATA_TYPE_RAW_8BIT		0x2a
-#define DATA_TYPE_RAW_10BIT		0x2b
-#define DATA_TYPE_RAW_12BIT		0x2c
-#define DATA_TYPE_RAW_14BIT		0x2d
-
-#define DECODE_FORMAT_UNCOMPRESSED_6_BIT	0x0
-#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
-#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
-#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
-#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x8
-
-#define CSID_RESET_TIMEOUT_MS 500
-
-struct csid_format {
-	u32 code;
-	u8 data_type;
-	u8 decode_format;
-	u8 bpp;
-	u8 spp; /* bus samples per pixel */
-};
-
-static const struct csid_format csid_formats_8x16[] = {
-	{
-		MEDIA_BUS_FMT_UYVY8_2X8,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_VYUY8_2X8,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YUYV8_2X8,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YVYU8_2X8,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_Y10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-};
-
-static const struct csid_format csid_formats_8x96[] = {
-	{
-		MEDIA_BUS_FMT_UYVY8_2X8,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_VYUY8_2X8,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YUYV8_2X8,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_YVYU8_2X8,
-		DATA_TYPE_YUV422_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		2,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB8_1X8,
-		DATA_TYPE_RAW_8BIT,
-		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
-		8,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB12_1X12,
-		DATA_TYPE_RAW_12BIT,
-		DECODE_FORMAT_UNCOMPRESSED_12_BIT,
-		12,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SBGGR14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGBRG14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SGRBG14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_SRGGB14_1X14,
-		DATA_TYPE_RAW_14BIT,
-		DECODE_FORMAT_UNCOMPRESSED_14_BIT,
-		14,
-		1,
-	},
-	{
-		MEDIA_BUS_FMT_Y10_1X10,
-		DATA_TYPE_RAW_10BIT,
-		DECODE_FORMAT_UNCOMPRESSED_10_BIT,
-		10,
-		1,
-	},
-};
 
-static u32 csid_find_code(u32 *code, unsigned int n_code,
-			  unsigned int index, u32 req_code)
+u32 csid_find_code(u32 *codes, unsigned int ncodes,
+		   unsigned int match_format_idx, u32 match_code)
 {
 	int i;
 
-	if (!req_code && (index >= n_code))
+	if (!match_code && (match_format_idx >= ncodes))
 		return 0;
 
-	for (i = 0; i < n_code; i++)
-		if (req_code) {
-			if (req_code == code[i])
-				return req_code;
+	for (i = 0; i < ncodes; i++)
+		if (match_code) {
+			if (codes[i] == match_code)
+				return match_code;
 		} else {
-			if (i == index)
-				return code[i];
-		}
-
-	return code[0];
-}
-
-static u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
-			     unsigned int index, u32 src_req_code)
-{
-	if (csid->camss->version == CAMSS_8x16) {
-		if (index > 0)
-			return 0;
-
-		return sink_code;
-	} else if (csid->camss->version == CAMSS_8x96 ||
-		   csid->camss->version == CAMSS_660) {
-		switch (sink_code) {
-		case MEDIA_BUS_FMT_SBGGR10_1X10:
-		{
-			u32 src_code[] = {
-				MEDIA_BUS_FMT_SBGGR10_1X10,
-				MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE,
-			};
-
-			return csid_find_code(src_code, ARRAY_SIZE(src_code),
-					      index, src_req_code);
-		}
-		case MEDIA_BUS_FMT_Y10_1X10:
-		{
-			u32 src_code[] = {
-				MEDIA_BUS_FMT_Y10_1X10,
-				MEDIA_BUS_FMT_Y10_2X8_PADHI_LE,
-			};
-
-			return csid_find_code(src_code, ARRAY_SIZE(src_code),
-					      index, src_req_code);
+			if (i == match_format_idx)
+				return codes[i];
 		}
-		default:
-			if (index > 0)
-				return 0;
 
-			return sink_code;
-		}
-	} else {
-		return 0;
-	}
+	return codes[0];
 }
 
-static const struct csid_format *csid_get_fmt_entry(
+const struct csid_format *csid_get_fmt_entry(
 					const struct csid_format *formats,
-					unsigned int nformat,
+					unsigned int nformats,
 					u32 code)
 {
 	unsigned int i;
 
-	for (i = 0; i < nformat; i++)
+	for (i = 0; i < nformats; i++)
 		if (code == formats[i].code)
 			return &formats[i];
 
@@ -433,28 +63,6 @@ static const struct csid_format *csid_get_fmt_entry(
 	return &formats[0];
 }
 
-/*
- * csid_isr - CSID module interrupt handler
- * @irq: Interrupt line
- * @dev: CSID device
- *
- * Return IRQ_HANDLED on success
- */
-static irqreturn_t csid_isr(int irq, void *dev)
-{
-	struct csid_device *csid = dev;
-	enum camss_version ver = csid->camss->version;
-	u32 value;
-
-	value = readl_relaxed(csid->base + CAMSS_CSID_IRQ_STATUS(ver));
-	writel_relaxed(value, csid->base + CAMSS_CSID_IRQ_CLEAR_CMD(ver));
-
-	if ((value >> 11) & 0x1)
-		complete(&csid->reset_complete);
-
-	return IRQ_HANDLED;
-}
-
 /*
  * csid_set_clock_rates - Calculate and set clock rates on CSID module
  * @csiphy: CSID device
@@ -521,31 +129,6 @@ static int csid_set_clock_rates(struct csid_device *csid)
 	return 0;
 }
 
-/*
- * csid_reset - Trigger reset on CSID module and wait to complete
- * @csid: CSID device
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int csid_reset(struct csid_device *csid)
-{
-	unsigned long time;
-
-	reinit_completion(&csid->reset_complete);
-
-	writel_relaxed(0x7fff, csid->base +
-		       CAMSS_CSID_RST_CMD(csid->camss->version));
-
-	time = wait_for_completion_timeout(&csid->reset_complete,
-		msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
-	if (!time) {
-		dev_err(csid->camss->dev, "CSID reset timeout\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
 /*
  * csid_set_power - Power on/off CSID module
  * @sd: CSID V4L2 subdevice
@@ -560,8 +143,6 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	int ret;
 
 	if (on) {
-		u32 hw_version;
-
 		ret = pm_runtime_get_sync(dev);
 		if (ret < 0) {
 			pm_runtime_put_sync(dev);
@@ -590,7 +171,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		enable_irq(csid->irq);
 
-		ret = csid_reset(csid);
+		ret = csid->ops->reset(csid);
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
@@ -599,8 +180,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		hw_version = readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
-		dev_dbg(dev, "CSID HW Version = 0x%08x\n", hw_version);
+		csid->ops->hw_version(csid);
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
@@ -623,16 +203,9 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
-	struct csid_testgen_config *tg = &csid->testgen;
-	enum camss_version ver = csid->camss->version;
-	u32 val;
+	int ret;
 
 	if (enable) {
-		u8 vc = 0; /* Virtual Channel 0 */
-		u8 cid = vc * 4; /* id of Virtual Channel and Data Type set */
-		u8 dt, dt_shift, df;
-		int ret;
-
 		ret = v4l2_ctrl_handler_setup(&csid->ctrls);
 		if (ret < 0) {
 			dev_err(csid->camss->dev,
@@ -640,116 +213,13 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 			return ret;
 		}
 
-		if (!tg->enabled &&
+		if (!csid->testgen.enabled &&
 		    !media_entity_remote_pad(&csid->pads[MSM_CSID_PAD_SINK]))
 			return -ENOLINK;
-
-		if (tg->enabled) {
-			/* Config Test Generator */
-			struct v4l2_mbus_framefmt *f =
-					&csid->fmt[MSM_CSID_PAD_SRC];
-			const struct csid_format *format = csid_get_fmt_entry(
-					csid->formats, csid->nformats, f->code);
-			u32 num_bytes_per_line =
-				f->width * format->bpp * format->spp / 8;
-			u32 num_lines = f->height;
-
-			/* 31:24 V blank, 23:13 H blank, 3:2 num of active DT */
-			/* 1:0 VC */
-			val = ((CAMSS_CSID_TG_VC_CFG_V_BLANKING & 0xff) << 24) |
-			      ((CAMSS_CSID_TG_VC_CFG_H_BLANKING & 0x7ff) << 13);
-			writel_relaxed(val, csid->base +
-				       CAMSS_CSID_TG_VC_CFG(ver));
-
-			/* 28:16 bytes per lines, 12:0 num of lines */
-			val = ((num_bytes_per_line & 0x1fff) << 16) |
-			      (num_lines & 0x1fff);
-			writel_relaxed(val, csid->base +
-				       CAMSS_CSID_TG_DT_n_CGG_0(ver, 0));
-
-			dt = format->data_type;
-
-			/* 5:0 data type */
-			val = dt;
-			writel_relaxed(val, csid->base +
-				       CAMSS_CSID_TG_DT_n_CGG_1(ver, 0));
-
-			/* 2:0 output test pattern */
-			val = tg->payload_mode;
-			writel_relaxed(val, csid->base +
-				       CAMSS_CSID_TG_DT_n_CGG_2(ver, 0));
-
-			df = format->decode_format;
-		} else {
-			struct v4l2_mbus_framefmt *f =
-					&csid->fmt[MSM_CSID_PAD_SINK];
-			const struct csid_format *format = csid_get_fmt_entry(
-					csid->formats, csid->nformats, f->code);
-			struct csid_phy_config *phy = &csid->phy;
-
-			val = phy->lane_cnt - 1;
-			val |= phy->lane_assign << 4;
-
-			writel_relaxed(val,
-				       csid->base + CAMSS_CSID_CORE_CTRL_0);
-
-			val = phy->csiphy_id << 17;
-			val |= 0x9;
-
-			writel_relaxed(val,
-				       csid->base + CAMSS_CSID_CORE_CTRL_1);
-
-			dt = format->data_type;
-			df = format->decode_format;
-		}
-
-		/* Config LUT */
-
-		dt_shift = (cid % 4) * 8;
-
-		val = readl_relaxed(csid->base +
-				    CAMSS_CSID_CID_LUT_VC_n(ver, vc));
-		val &= ~(0xff << dt_shift);
-		val |= dt << dt_shift;
-		writel_relaxed(val, csid->base +
-			       CAMSS_CSID_CID_LUT_VC_n(ver, vc));
-
-		val = CAMSS_CSID_CID_n_CFG_ISPIF_EN;
-		val |= CAMSS_CSID_CID_n_CFG_RDI_EN;
-		val |= df << CAMSS_CSID_CID_n_CFG_DECODE_FORMAT_SHIFT;
-		val |= CAMSS_CSID_CID_n_CFG_RDI_MODE_RAW_DUMP;
-
-		if (csid->camss->version == CAMSS_8x96 ||
-		    csid->camss->version == CAMSS_660) {
-			u32 sink_code = csid->fmt[MSM_CSID_PAD_SINK].code;
-			u32 src_code = csid->fmt[MSM_CSID_PAD_SRC].code;
-
-			if ((sink_code == MEDIA_BUS_FMT_SBGGR10_1X10 &&
-			     src_code == MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE) ||
-			    (sink_code == MEDIA_BUS_FMT_Y10_1X10 &&
-			     src_code == MEDIA_BUS_FMT_Y10_2X8_PADHI_LE)) {
-				val |= CAMSS_CSID_CID_n_CFG_RDI_MODE_PLAIN_PACKING;
-				val |= CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16;
-				val |= CAMSS_CSID_CID_n_CFG_PLAIN_ALIGNMENT_LSB;
-			}
-		}
-
-		writel_relaxed(val, csid->base +
-			       CAMSS_CSID_CID_n_CFG(ver, cid));
-
-		if (tg->enabled) {
-			val = CAMSS_CSID_TG_CTRL_ENABLE;
-			writel_relaxed(val, csid->base +
-				       CAMSS_CSID_TG_CTRL(ver));
-		}
-	} else {
-		if (tg->enabled) {
-			val = CAMSS_CSID_TG_CTRL_DISABLE;
-			writel_relaxed(val, csid->base +
-				       CAMSS_CSID_TG_CTRL(ver));
-		}
 	}
 
+	csid->ops->configure_stream(csid, enable);
+
 	return 0;
 }
 
@@ -818,7 +288,7 @@ static void csid_try_format(struct csid_device *csid,
 
 			*fmt = *__csid_get_format(csid, cfg,
 						      MSM_CSID_PAD_SINK, which);
-			fmt->code = csid_src_pad_code(csid, fmt->code, 0, code);
+			fmt->code = csid->ops->src_pad_code(csid, fmt->code, 0, code);
 		} else {
 			/* Test generator is enabled, set format on source */
 			/* pad to allow test generator usage */
@@ -868,7 +338,7 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
 						     MSM_CSID_PAD_SINK,
 						     code->which);
 
-			code->code = csid_src_pad_code(csid, sink_fmt->code,
+			code->code = csid->ops->src_pad_code(csid, sink_fmt->code,
 						       code->index, 0);
 			if (!code->code)
 				return -EINVAL;
@@ -1004,15 +474,6 @@ static int csid_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	return csid_set_format(sd, fh ? fh->pad : NULL, &format);
 }
 
-static const char * const csid_test_pattern_menu[] = {
-	"Disabled",
-	"Incrementing",
-	"Alternating 0x55/0xAA",
-	"All Zeros 0x00",
-	"All Ones 0xFF",
-	"Pseudo-random Data",
-};
-
 /*
  * csid_set_test_pattern - Set test generator's pattern mode
  * @csid: CSID device
@@ -1030,25 +491,7 @@ static int csid_set_test_pattern(struct csid_device *csid, s32 value)
 
 	tg->enabled = !!value;
 
-	switch (value) {
-	case 1:
-		tg->payload_mode = CSID_PAYLOAD_MODE_INCREMENTING;
-		break;
-	case 2:
-		tg->payload_mode = CSID_PAYLOAD_MODE_ALTERNATING_55_AA;
-		break;
-	case 3:
-		tg->payload_mode = CSID_PAYLOAD_MODE_ALL_ZEROES;
-		break;
-	case 4:
-		tg->payload_mode = CSID_PAYLOAD_MODE_ALL_ONES;
-		break;
-	case 5:
-		tg->payload_mode = CSID_PAYLOAD_MODE_RANDOM;
-		break;
-	}
-
-	return 0;
+	return csid->ops->configure_testgen_pattern(csid, value);
 }
 
 /*
@@ -1097,17 +540,14 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	csid->id = id;
 
 	if (camss->version == CAMSS_8x16) {
-		csid->formats = csid_formats_8x16;
-		csid->nformats =
-				ARRAY_SIZE(csid_formats_8x16);
+		csid->ops = &csid_ops_4_1;
 	} else if (camss->version == CAMSS_8x96 ||
 		   camss->version == CAMSS_660) {
-		csid->formats = csid_formats_8x96;
-		csid->nformats =
-				ARRAY_SIZE(csid_formats_8x96);
+		csid->ops = &csid_ops_4_7;
 	} else {
 		return -EINVAL;
 	}
+	csid->ops->subdev_init(csid);
 
 	/* Memory */
 
@@ -1130,7 +570,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	csid->irq = r->start;
 	snprintf(csid->irq_name, sizeof(csid->irq_name), "%s_%s%d",
 		 dev_name(dev), MSM_CSID_NAME, csid->id);
-	ret = devm_request_irq(dev, csid->irq, csid_isr,
+	ret = devm_request_irq(dev, csid->irq, csid->ops->isr,
 		IRQF_TRIGGER_RISING, csid->irq_name, csid);
 	if (ret < 0) {
 		dev_err(dev, "request_irq failed: %d\n", ret);
@@ -1341,8 +781,8 @@ int msm_csid_register_entity(struct csid_device *csid,
 
 	csid->testgen_mode = v4l2_ctrl_new_std_menu_items(&csid->ctrls,
 				&csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
-				ARRAY_SIZE(csid_test_pattern_menu) - 1, 0, 0,
-				csid_test_pattern_menu);
+				csid->testgen.nmodes, 0, 0,
+				csid->testgen.modes);
 
 	if (csid->ctrls.error) {
 		dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 02fc34ee8a41..d40194e2bed3 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -11,6 +11,7 @@
 #define QC_MSM_CAMSS_CSID_H
 
 #include <linux/clk.h>
+#include <linux/interrupt.h>
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -70,19 +71,50 @@
 #define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
 #define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
 
+#define CSID_RESET_TIMEOUT_MS 500
 
-enum csid_payload_mode {
+
+enum csid_testgen_mode {
 	CSID_PAYLOAD_MODE_INCREMENTING = 0,
 	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
 	CSID_PAYLOAD_MODE_ALL_ZEROES = 2,
 	CSID_PAYLOAD_MODE_ALL_ONES = 3,
 	CSID_PAYLOAD_MODE_RANDOM = 4,
 	CSID_PAYLOAD_MODE_USER_SPECIFIED = 5,
+	CSID_PAYLOAD_MODE_MAX_SUPPORTED_4_1 = 5,
+	CSID_PAYLOAD_MODE_MAX_SUPPORTED_4_7 = 5,
+	CSID_PAYLOAD_MODE_COMPLEX_PATTERN = 6,
+	CSID_PAYLOAD_MODE_COLOR_BOX = 7,
+	CSID_PAYLOAD_MODE_COLOR_BARS = 8,
+	CSID_PAYLOAD_MODE_MAX_SUPPORTED_170 = 8,
+};
+
+static const char * const csid_testgen_modes[] = {
+	"Disabled",
+	"Incrementing",
+	"Alternating 0x55/0xAA",
+	"All Zeros 0x00",
+	"All Ones 0xFF",
+	"Pseudo-random Data",
+	"User Specified",
+	"Complex pattern",
+	"Color box",
+	"Color bars",
+};
+
+struct csid_format {
+	u32 code;
+	u8 data_type;
+	u8 decode_format;
+	u8 bpp;
+	u8 spp; /* bus samples per pixel */
 };
 
 struct csid_testgen_config {
+	enum csid_testgen_mode mode;
+	const char * const*modes;
+	u8 nmodes;
 	u8 enabled;
-	enum csid_payload_mode payload_mode;
 };
 
 struct csid_phy_config {
@@ -91,6 +123,65 @@ struct csid_phy_config {
 	u32 lane_assign;
 };
 
+struct csid_device;
+
+struct csid_hw_ops {
+	/*
+	 * configure_stream - Configures and starts CSID input stream
+	 * @csid: CSID device
+	 */
+	void (*configure_stream)(struct csid_device *csid, u8 enable);
+
+	/*
+	 * configure_testgen_pattern - Validates and configures output pattern mode
+	 * of test pattern generator
+	 * @csid: CSID device
+	 */
+	int (*configure_testgen_pattern)(struct csid_device *csid, s32 val);
+
+	/*
+	 * hw_version - Read hardware version register from hardware
+	 * @csid: CSID device
+	 */
+	u32 (*hw_version)(struct csid_device *csid);
+
+	/*
+	 * isr - CSID module interrupt service routine
+	 * @irq: Interrupt line
+	 * @dev: CSID device
+	 *
+	 * Return IRQ_HANDLED on success
+	 */
+	irqreturn_t (*isr)(int irq, void *dev);
+
+	/*
+	 * reset - Trigger reset on CSID module and wait to complete
+	 * @csid: CSID device
+	 *
+	 * Return 0 on success or a negative error code otherwise
+	 */
+	int (*reset)(struct csid_device *csid);
+
+	/*
+	 * src_pad_code - Pick an output/src format based on the input/sink format
+	 * @csid: CSID device
+	 * @sink_code: The sink format of the input
+	 * @match_format_idx: Request preferred index, as defined by subdevice csid_format.
+	 *	Set @match_code to 0 if used.
+	 * @match_code: Request preferred code, set @match_format_idx to 0 if used
+	 *
+	 * Return 0 on failure or src format code otherwise
+	 */
+	u32 (*src_pad_code)(struct csid_device *csid, u32 sink_code,
+			    unsigned int match_format_idx, u32 match_code);
+
+	/*
+	 * subdev_init - Initialize CSID device according for hardware revision
+	 * @csid: CSID device
+	 */
+	void (*subdev_init)(struct csid_device *csid);
+};
+
 struct csid_device {
 	struct camss *camss;
 	u8 id;
@@ -110,10 +201,37 @@ struct csid_device {
 	struct v4l2_ctrl *testgen_mode;
 	const struct csid_format *formats;
 	unsigned int nformats;
+	const struct csid_hw_ops *ops;
 };
 
 struct resources;
 
+
+/*
+ * csid_find_code - Find a format code in an array using array index or format code
+ * @codes: Array of format codes
+ * @ncodes: Length of @code array
+ * @req_format_idx: Request preferred index, as defined by subdevice csid_format.
+ *	Set @match_code to 0 if used.
+ * @match_code: Request preferred code, set @req_format_idx to 0 if used
+ *
+ * Return 0 on failure or format code otherwise
+ */
+u32 csid_find_code(u32 *codes, unsigned int ncode,
+		   unsigned int match_format_idx, u32 match_code);
+
+/*
+ * csid_get_fmt_entry - Find csid_format entry with matching format code
+ * @formats: Array of format csid_format entries
+ * @nformats: Length of @nformats array
+ * @code: Desired format code
+ *
+ * Return formats[0] on failure to find code
+ */
+const struct csid_format *csid_get_fmt_entry(const struct csid_format *formats,
+					     unsigned int nformats,
+					     u32 code);
+
 int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 			 const struct resources *res, u8 id);
 
@@ -124,4 +242,8 @@ void msm_csid_unregister_entity(struct csid_device *csid);
 
 void msm_csid_get_csid_id(struct media_entity *entity, u8 *id);
 
+
+extern const struct csid_hw_ops csid_ops_4_1;
+extern const struct csid_hw_ops csid_ops_4_7;
+
 #endif /* QC_MSM_CAMSS_CSID_H */
-- 
2.27.0

