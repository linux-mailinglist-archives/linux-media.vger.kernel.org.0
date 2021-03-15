Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95BE433C0DB
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhCOQBI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhCOQAm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:42 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0231C06175F
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:41 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o19so17978393edc.3
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fdt//Zw452q/Iw+gTI4lDKoNiXChCVQgk/Kh1PtB0Aw=;
        b=F4zwcRx1dzm/CBUbaM3eiOUUYPioAdJqIfh7V+6Z9zOxMzxz0x4hQgfSreMhpkW5E1
         R0Zi9eGCZWywAHIX8x+F7noDjWVeLLDR6hmKsLiT+gN5JyqnkgNTNY0CW/UL0C4dMiAv
         5MpqcA9RudWrllHDvlnaUFFNVvPG6q0fSV3LtblGXRx7i6kSts39aPqNSWCOXJpD6nji
         QKYIHPxpWU+p1hInnkpSZydOIE2Ja6aqjXUaeexrOMmR56SabOnHIX1Wh2nKTzMHMCd5
         URahuUnmCtCaxoP5R4MAY5gHO3RMdTgMZluJP+i4DE9yLgqV0fI5Fp7486dj60RDTUxY
         y8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdt//Zw452q/Iw+gTI4lDKoNiXChCVQgk/Kh1PtB0Aw=;
        b=QfpPmVfytty211HBqodvMEylCnGNl9WpPHMVlgxMJQKMKzU4cqxlhpotNDvyZMHWAR
         BRMQPD1o3OCcAAUcjAtM4L4O0F2iPa9XITDLxi1LfM9yrpXmgc+W97C5+GkWz0uvjt5L
         ZE3z1RqDJEqIAA6x+YpbEkEpitr2jfVsngK5Cks77G7JekckGi0fHG3o9fWLqZo8rqkR
         +U7Iw4vzpljPseGl0R6ulJ5y/TePwJhD/+9IfjpRRIOHvX9odUMQXkDe84LDfbCsxZXG
         0rEEss1sYXtZug+b0S8qaWr4cq8NrduIyaR407eOUSag8HlA36aLD8sTyCSSUl87Iehm
         dFWQ==
X-Gm-Message-State: AOAM532SEJnFDxPhUXYkhGiou1dhAfiplBjgF6l64fWxvGIyt802jtnE
        /8wt2PjARoDbaxhxS7+OHyfL9A==
X-Google-Smtp-Source: ABdhPJwzLN7dYQKnd2zgUVapEU9SOHJLgVNhibkvX42XEGUlnqkK6DD+B6JE4ORK7chX5q9Zy8/yKA==
X-Received: by 2002:a05:6402:408:: with SMTP id q8mr30162936edv.201.1615824034471;
        Mon, 15 Mar 2021 09:00:34 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:33 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 09/22] media: camss: Refactor CSID HW version support
Date:   Mon, 15 Mar 2021 16:59:30 +0100
Message-Id: <20210315155942.640889-10-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to support Qualcomm ISP hardware architectures that diverge
from older architectures, the CSID subdevice drivers needs to be refactored
to better abstract the different ISP hardware architectures.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v1:
 - kernel test robot: Add missing include, interrupt.h

Changes since v4:
 - Andrey: Removed whitespace from some includes
 - Andrey: Removed unused enum

Changes since v5:
 - Andrey: Fixed test pattern selection logic
 - Andrey: Align test mode enum values with v4l mode selection return values
 - Andrey: r-b
 - Move Titan 170 test modes to the the Titan 170 commit
 - Fixed test pattern boundary check

Changes since v7:
 - Hans: Fix checkpatch.pl --strict warnings



 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-4-1.c      | 328 ++++++++++
 .../platform/qcom/camss/camss-csid-4-7.c      | 404 ++++++++++++
 .../media/platform/qcom/camss/camss-csid.c    | 608 +-----------------
 .../media/platform/qcom/camss/camss-csid.h    | 129 +++-
 5 files changed, 885 insertions(+), 586 deletions(-)
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
index 000000000000..d2aec0679dfc
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
@@ -0,0 +1,328 @@
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
+#include "camss-csid-gen1.h"
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
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(PLAIN_FORMAT_PLAIN8 << 8)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(PLAIN_FORMAT_PLAIN16 << 8)
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
+			val = tg->mode - 1;
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
+	if (val > 0 && val <= csid->testgen.nmodes)
+		csid->testgen.mode = val;
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
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
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
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
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
index 000000000000..e7436ec6d02b
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
@@ -0,0 +1,404 @@
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
+#include "camss-csid-gen1.h"
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
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(PLAIN_FORMAT_PLAIN8 << 8)
+#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(PLAIN_FORMAT_PLAIN16 << 8)
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
+			val = tg->mode - 1;
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
+	if (val > 0 && val <= csid->testgen.nmodes)
+		csid->testgen.mode = val;
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
+					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
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
+	csid->testgen.nmodes = CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1;
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
index e76c509f3cda..0931867ce291 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -27,391 +27,33 @@
 
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
-#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_8		(PLAIN_FORMAT_PLAIN8 << 8)
-#define CAMSS_CSID_CID_n_CFG_PLAIN_FORMAT_16		(PLAIN_FORMAT_PLAIN16 << 8)
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
-
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
-					const struct csid_format *formats,
-					unsigned int nformat,
-					u32 code)
+const struct csid_format *csid_get_fmt_entry(const struct csid_format *formats,
+					     unsigned int nformats,
+					     u32 code)
 {
 	unsigned int i;
 
-	for (i = 0; i < nformat; i++)
+	for (i = 0; i < nformats; i++)
 		if (code == formats[i].code)
 			return &formats[i];
 
@@ -420,28 +62,6 @@ static const struct csid_format *csid_get_fmt_entry(
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
@@ -506,31 +126,6 @@ static int csid_set_clock_rates(struct csid_device *csid)
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
@@ -545,8 +140,6 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	int ret;
 
 	if (on) {
-		u32 hw_version;
-
 		ret = pm_runtime_get_sync(dev);
 		if (ret < 0) {
 			pm_runtime_put_sync(dev);
@@ -575,7 +168,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		enable_irq(csid->irq);
 
-		ret = csid_reset(csid);
+		ret = csid->ops->reset(csid);
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
@@ -584,8 +177,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 			return ret;
 		}
 
-		hw_version = readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
-		dev_dbg(dev, "CSID HW Version = 0x%08x\n", hw_version);
+		csid->ops->hw_version(csid);
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
@@ -608,16 +200,9 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
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
@@ -625,116 +210,13 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
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
 
@@ -803,7 +285,7 @@ static void csid_try_format(struct csid_device *csid,
 
 			*fmt = *__csid_get_format(csid, cfg,
 						      MSM_CSID_PAD_SINK, which);
-			fmt->code = csid_src_pad_code(csid, fmt->code, 0, code);
+			fmt->code = csid->ops->src_pad_code(csid, fmt->code, 0, code);
 		} else {
 			/* Test generator is enabled, set format on source */
 			/* pad to allow test generator usage */
@@ -853,7 +335,7 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
 						     MSM_CSID_PAD_SINK,
 						     code->which);
 
-			code->code = csid_src_pad_code(csid, sink_fmt->code,
+			code->code = csid->ops->src_pad_code(csid, sink_fmt->code,
 						       code->index, 0);
 			if (!code->code)
 				return -EINVAL;
@@ -989,15 +471,6 @@ static int csid_init_formats(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
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
@@ -1015,25 +488,7 @@ static int csid_set_test_pattern(struct csid_device *csid, s32 value)
 
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
@@ -1082,17 +537,14 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
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
 
@@ -1115,8 +567,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	csid->irq = r->start;
 	snprintf(csid->irq_name, sizeof(csid->irq_name), "%s_%s%d",
 		 dev_name(dev), MSM_CSID_NAME, csid->id);
-	ret = devm_request_irq(dev, csid->irq, csid_isr,
-		IRQF_TRIGGER_RISING, csid->irq_name, csid);
+	ret = devm_request_irq(dev, csid->irq, csid->ops->isr,
+			       IRQF_TRIGGER_RISING, csid->irq_name, csid);
 	if (ret < 0) {
 		dev_err(dev, "request_irq failed: %d\n", ret);
 		return ret;
@@ -1326,8 +778,8 @@ int msm_csid_register_entity(struct csid_device *csid,
 
 	csid->testgen_mode = v4l2_ctrl_new_std_menu_items(&csid->ctrls,
 				&csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
-				ARRAY_SIZE(csid_test_pattern_menu) - 1, 0, 0,
-				csid_test_pattern_menu);
+				csid->testgen.nmodes, 0, 0,
+				csid->testgen.modes);
 
 	if (csid->ctrls.error) {
 		dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 479ac1f83836..613ef377b051 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -11,6 +11,7 @@
 #define QC_MSM_CAMSS_CSID_H
 
 #include <linux/clk.h>
+#include <linux/interrupt.h>
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -44,18 +45,42 @@
 #define DATA_TYPE_RAW_16BIT		0x2e
 #define DATA_TYPE_RAW_20BIT		0x2f
 
-enum csid_payload_mode {
-	CSID_PAYLOAD_MODE_INCREMENTING = 0,
-	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
-	CSID_PAYLOAD_MODE_ALL_ZEROES = 2,
-	CSID_PAYLOAD_MODE_ALL_ONES = 3,
-	CSID_PAYLOAD_MODE_RANDOM = 4,
-	CSID_PAYLOAD_MODE_USER_SPECIFIED = 5,
+#define CSID_RESET_TIMEOUT_MS 500
+
+enum csid_testgen_mode {
+	CSID_PAYLOAD_MODE_DISABLED = 0,
+	CSID_PAYLOAD_MODE_INCREMENTING = 1,
+	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 2,
+	CSID_PAYLOAD_MODE_ALL_ZEROES = 3,
+	CSID_PAYLOAD_MODE_ALL_ONES = 4,
+	CSID_PAYLOAD_MODE_RANDOM = 5,
+	CSID_PAYLOAD_MODE_USER_SPECIFIED = 6,
+	CSID_PAYLOAD_MODE_NUM_SUPPORTED_GEN1 = 6, /* excluding disabled */
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
@@ -64,6 +89,65 @@ struct csid_phy_config {
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
@@ -83,10 +167,36 @@ struct csid_device {
 	struct v4l2_ctrl *testgen_mode;
 	const struct csid_format *formats;
 	unsigned int nformats;
+	const struct csid_hw_ops *ops;
 };
 
 struct resources;
 
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
 
@@ -97,4 +207,7 @@ void msm_csid_unregister_entity(struct csid_device *csid);
 
 void msm_csid_get_csid_id(struct media_entity *entity, u8 *id);
 
+extern const struct csid_hw_ops csid_ops_4_1;
+extern const struct csid_hw_ops csid_ops_4_7;
+
 #endif /* QC_MSM_CAMSS_CSID_H */
-- 
2.27.0

