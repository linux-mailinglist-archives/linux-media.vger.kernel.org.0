Return-Path: <linux-media+bounces-44601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7BBDF340
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 16:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61C253AF64B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 14:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A8F2E0407;
	Wed, 15 Oct 2025 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzqrVosi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6009D2D8762;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540188; cv=none; b=AApxWEvl1sMr9slymTry9mmE9LQFxa8VTOXryD8j2sOa7h4xICyDB9ADw5tImm2it/WsPbYLjZ5z9gjA8e0JRvMpOWPd3zC7aljZvFhWquq/d9/CYCLVp8qRDz/Ke4nT7yMbgiRbL2tR7QPRwW1RP4oNPDNrknVLVmCTOBE47gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540188; c=relaxed/simple;
	bh=GHnxTRuw22MR4qtuwF9W2TDh3o/kXnhIvkimy2U9IeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aui/1B17t3N1Hub0mk6s2xeloD5ox6QaQlqjT4V7XLlc9avChYAfbCZ2juqxq9pLhopbtHxHnvyb5/+6ckkJi0ZaBF2kOoogzSWUUPiJRRn0w3vqqUT0oQWC2NzFusF6tXekLMxAzeWEPtJIup1q3ZFEk5yyYgznIFGMEG0lkps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzqrVosi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19B03C16AAE;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760540188;
	bh=GHnxTRuw22MR4qtuwF9W2TDh3o/kXnhIvkimy2U9IeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bzqrVosid7o0OIxe4/rp59WKdhE45f4cIgww64JbOMAAuGpvcy2LUEYWhbOqRE39i
	 +DH502no7KCjUOxgSbQoHMcE80viBs995Wb7ALrCdy6Z6PyrJtlzew8fx2vDALo8qN
	 YuD5MVeoi3tVUedv95HWWx7qKYHMcPCedYNtV/4MlqjhxEkBjhOcPEJBoyGRGWO9WP
	 hnXMPnWpm5Iup9aUbY6U97e5mM5fP08v2K7HyQ1lDxwiFjkNKr3UenSEqhwQEu94WX
	 +4kUHZI/gNM2wxco09w/yl3WM08/5e+kjO6knDGt2XSRQmyl8HKg0O0iKqfEiZ9lkI
	 X27chGATkm9gw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097D6CCD199;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 15 Oct 2025 16:56:33 +0200
Subject: [PATCH v13 10/18] media: rockchip: rkcif: add support for px30 vip
 dvp capture
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v13-10-da164b4918fe@collabora.com>
References: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760540185; l=27257;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=4bio6dhNI8REHClVwTSJls2FCV0NnymBkYJ/imUqP68=;
 b=umo4qlAUK7v1S/cn5znbdHJZAWmxH3/Uz5i/QmRcl22oAsw/+mfAnuzClWntZZRkjqeIiRzk1
 btlSpydrIwcB+IU7hDFE681aY4aNEHrByUBSFtAr97Jwl4ggLpMwow4
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The PX30 Video Input Processor (VIP) unit features a Digital Video
Port (DVP). Add support for the DVP in general and for the PX30
VIP DVP in particular.

Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 589 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |  28 +
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  15 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 131 +++++
 6 files changed, 788 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
index 256335d95050..a36e294d569d 100644
--- a/drivers/media/platform/rockchip/rkcif/Makefile
+++ b/drivers/media/platform/rockchip/rkcif/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
 
+rockchip-cif-objs += rkcif-capture-dvp.o
 rockchip-cif-objs += rkcif-dev.o
 rockchip-cif-objs += rkcif-interface.o
 rockchip-cif-objs += rkcif-stream.o
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
new file mode 100644
index 000000000000..b40135035ab8
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
@@ -0,0 +1,589 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2020 Maxime Chevallier <maxime.chevallier@bootlin.com>
+ * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ * Copyright (C) 2025 Collabora, Ltd.
+ */
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#include "rkcif-capture-dvp.h"
+#include "rkcif-common.h"
+#include "rkcif-interface.h"
+#include "rkcif-regs.h"
+#include "rkcif-stream.h"
+
+static const struct rkcif_output_fmt dvp_out_fmts[] = {
+	{
+		.fourcc = V4L2_PIX_FMT_NV16,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
+			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
+		.cplanes = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV16M,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
+			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
+		.cplanes = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV61,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
+			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
+		.cplanes = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV61M,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_422 |
+			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
+		.cplanes = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
+			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
+		.cplanes = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
+			       RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV,
+		.cplanes = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
+			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
+		.cplanes = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_OUTPUT_420 |
+			       RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU,
+		.cplanes = 2,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGB565,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGR666,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR16,
+		.cplanes = 1,
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_Y16,
+		.cplanes = 1,
+	},
+};
+
+static const struct rkcif_input_fmt px30_dvp_in_fmts[] = {
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	}
+};
+
+const struct rkcif_dvp_match_data rkcif_px30_vip_dvp_match_data = {
+	.in_fmts = px30_dvp_in_fmts,
+	.in_fmts_num = ARRAY_SIZE(px30_dvp_in_fmts),
+	.out_fmts = dvp_out_fmts,
+	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
+	.has_scaler = true,
+	.regs = {
+		[RKCIF_DVP_CTRL] = 0x00,
+		[RKCIF_DVP_INTEN] = 0x04,
+		[RKCIF_DVP_INTSTAT] = 0x08,
+		[RKCIF_DVP_FOR] = 0x0c,
+		[RKCIF_DVP_LINE_NUM_ADDR] = 0x10,
+		[RKCIF_DVP_FRM0_ADDR_Y] = 0x14,
+		[RKCIF_DVP_FRM0_ADDR_UV] = 0x18,
+		[RKCIF_DVP_FRM1_ADDR_Y] = 0x1c,
+		[RKCIF_DVP_FRM1_ADDR_UV] = 0x20,
+		[RKCIF_DVP_VIR_LINE_WIDTH] = 0x24,
+		[RKCIF_DVP_SET_SIZE] = 0x28,
+		[RKCIF_DVP_SCL_CTRL] = 0x48,
+		[RKCIF_DVP_FRAME_STATUS] = 0x60,
+		[RKCIF_DVP_LAST_LINE] = 0x68,
+		[RKCIF_DVP_LAST_PIX] = 0x6c,
+	},
+};
+
+static inline unsigned int rkcif_dvp_get_addr(struct rkcif_device *rkcif,
+					      unsigned int index)
+{
+	if (WARN_ON_ONCE(index >= RKCIF_DVP_REGISTER_MAX))
+		return RKCIF_REGISTER_NOTSUPPORTED;
+
+	return rkcif->match_data->dvp->regs[index];
+}
+
+static inline __maybe_unused void rkcif_dvp_write(struct rkcif_device *rkcif,
+						  unsigned int index, u32 val)
+{
+	unsigned int addr = rkcif_dvp_get_addr(rkcif, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return;
+
+	writel(val, rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused u32 rkcif_dvp_read(struct rkcif_device *rkcif,
+						unsigned int index)
+{
+	unsigned int addr = rkcif_dvp_get_addr(rkcif, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return 0;
+
+	return readl(rkcif->base_addr + addr);
+}
+
+static void rkcif_dvp_queue_buffer(struct rkcif_stream *stream,
+				   unsigned int index)
+{
+	struct rkcif_device *rkcif = stream->rkcif;
+	struct rkcif_buffer *buffer = stream->buffers[index];
+	u32 frm_addr_y, frm_addr_uv;
+
+	frm_addr_y = index ? RKCIF_DVP_FRM1_ADDR_Y : RKCIF_DVP_FRM0_ADDR_Y;
+	frm_addr_uv = index ? RKCIF_DVP_FRM1_ADDR_UV : RKCIF_DVP_FRM0_ADDR_UV;
+
+	rkcif_dvp_write(rkcif, frm_addr_y, buffer->buff_addr[RKCIF_PLANE_Y]);
+	rkcif_dvp_write(rkcif, frm_addr_uv, buffer->buff_addr[RKCIF_PLANE_UV]);
+}
+
+static int rkcif_dvp_start_streaming(struct rkcif_stream *stream)
+{
+	struct rkcif_device *rkcif = stream->rkcif;
+	struct rkcif_interface *interface = stream->interface;
+	struct v4l2_mbus_config_parallel *parallel;
+	struct v4l2_mbus_framefmt *source_fmt;
+	struct v4l2_subdev_state *state;
+	const struct rkcif_input_fmt *active_in_fmt;
+	const struct rkcif_output_fmt *active_out_fmt;
+	u32 val = 0;
+	int ret = -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
+	source_fmt = v4l2_subdev_state_get_format(state, RKCIF_IF_PAD_SRC,
+						  stream->id);
+	if (!source_fmt)
+		goto out;
+
+	active_in_fmt = rkcif_interface_find_input_fmt(interface, false,
+						       source_fmt->code);
+	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
+						      stream->pix.pixelformat);
+	if (!active_in_fmt || !active_out_fmt)
+		goto out;
+
+	parallel = &interface->vep.bus.parallel;
+	if (parallel->bus_width == 16 &&
+	    (parallel->flags & V4L2_MBUS_PCLK_SAMPLE_DUALEDGE))
+		val |= RKCIF_FORMAT_BT1120_CLOCK_DOUBLE_EDGES;
+	val |= active_in_fmt->dvp_fmt_val;
+	val |= active_out_fmt->dvp_fmt_val;
+	rkcif_dvp_write(rkcif, RKCIF_DVP_FOR, val);
+
+	val = stream->pix.width;
+	if (active_in_fmt->fmt_type == RKCIF_FMT_TYPE_RAW)
+		val = stream->pix.width * 2;
+	rkcif_dvp_write(rkcif, RKCIF_DVP_VIR_LINE_WIDTH, val);
+
+	val = RKCIF_XY_COORD(stream->pix.width, stream->pix.height);
+	rkcif_dvp_write(rkcif, RKCIF_DVP_SET_SIZE, val);
+
+	rkcif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, RKCIF_FRAME_STAT_CLS);
+	rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, RKCIF_INTSTAT_CLS);
+	if (rkcif->match_data->dvp->has_scaler) {
+		val = active_in_fmt->fmt_type == RKCIF_FMT_TYPE_YUV ?
+			      RKCIF_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS :
+			      RKCIF_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS;
+		rkcif_dvp_write(rkcif, RKCIF_DVP_SCL_CTRL, val);
+	}
+
+	rkcif_dvp_write(rkcif, RKCIF_DVP_INTEN,
+			RKCIF_INTEN_FRAME_END_EN |
+			RKCIF_INTEN_PST_INF_FRAME_END_EN);
+
+	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
+			RKCIF_CTRL_AXI_BURST_16 | RKCIF_CTRL_MODE_PINGPONG |
+			RKCIF_CTRL_ENABLE_CAPTURE);
+
+	ret = 0;
+
+out:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static void rkcif_dvp_stop_streaming(struct rkcif_stream *stream)
+{
+	struct rkcif_device *rkcif = stream->rkcif;
+	u32 val;
+
+	val = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
+	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
+			val & (~RKCIF_CTRL_ENABLE_CAPTURE));
+	rkcif_dvp_write(rkcif, RKCIF_DVP_INTEN, 0x0);
+	rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT, 0x3ff);
+	rkcif_dvp_write(rkcif, RKCIF_DVP_FRAME_STATUS, 0x0);
+
+	stream->stopping = false;
+}
+
+static void rkcif_dvp_reset_stream(struct rkcif_device *rkcif)
+{
+	u32 ctl = rkcif_dvp_read(rkcif, RKCIF_DVP_CTRL);
+
+	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL,
+			ctl & (~RKCIF_CTRL_ENABLE_CAPTURE));
+	rkcif_dvp_write(rkcif, RKCIF_DVP_CTRL, ctl | RKCIF_CTRL_ENABLE_CAPTURE);
+}
+
+static void rkcif_dvp_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
+{
+	struct rkcif_device *rkcif = stream->rkcif;
+	u32 val;
+
+	val = RKCIF_XY_COORD(left, top);
+	rkcif_dvp_write(rkcif, RKCIF_DVP_CROP, val);
+}
+
+irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
+{
+	struct device *dev = ctx;
+	struct rkcif_device *rkcif = dev_get_drvdata(dev);
+	struct rkcif_stream *stream;
+	u32 intstat, lastline, lastpix, cif_frmst;
+	irqreturn_t ret = IRQ_NONE;
+
+	if (!rkcif->match_data->dvp)
+		return ret;
+
+	intstat = rkcif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
+	cif_frmst = rkcif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
+	lastline = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
+	lastpix = RKCIF_FETCH_Y(rkcif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
+
+	if (intstat & RKCIF_INTSTAT_FRAME_END) {
+		rkcif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
+				RKCIF_INTSTAT_FRAME_END_CLR |
+				RKCIF_INTSTAT_LINE_END_CLR);
+
+		stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
+
+		if (stream->stopping) {
+			rkcif_dvp_stop_streaming(stream);
+			wake_up(&stream->wq_stopped);
+			ret = IRQ_HANDLED;
+			goto out;
+		}
+
+		if (lastline != stream->pix.height) {
+			v4l2_err(&rkcif->v4l2_dev,
+				 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
+				 intstat, cif_frmst, lastpix, lastline);
+
+			rkcif_dvp_reset_stream(rkcif);
+		}
+
+		rkcif_stream_pingpong(stream);
+
+		ret = IRQ_HANDLED;
+	}
+out:
+	return ret;
+}
+
+int rkcif_dvp_register(struct rkcif_device *rkcif)
+{
+	struct rkcif_interface *interface;
+	unsigned int streams_num;
+	int ret;
+
+	if (!rkcif->match_data->dvp)
+		return 0;
+
+	interface = &rkcif->interfaces[RKCIF_DVP];
+	interface->index = RKCIF_DVP;
+	interface->type = RKCIF_IF_DVP;
+	interface->in_fmts = rkcif->match_data->dvp->in_fmts;
+	interface->in_fmts_num = rkcif->match_data->dvp->in_fmts_num;
+	interface->set_crop = rkcif_dvp_set_crop;
+	ret = rkcif_interface_register(rkcif, interface);
+	if (ret)
+		return ret;
+
+	if (rkcif->match_data->dvp->setup)
+		rkcif->match_data->dvp->setup(rkcif);
+
+	streams_num = rkcif->match_data->dvp->has_ids ? 4 : 1;
+	for (unsigned int i = 0; i < streams_num; i++) {
+		struct rkcif_stream *stream = &interface->streams[i];
+
+		stream->id = i;
+		stream->interface = interface;
+		stream->out_fmts = rkcif->match_data->dvp->out_fmts;
+		stream->out_fmts_num = rkcif->match_data->dvp->out_fmts_num;
+		stream->queue_buffer = rkcif_dvp_queue_buffer;
+		stream->start_streaming = rkcif_dvp_start_streaming;
+		stream->stop_streaming = rkcif_dvp_stop_streaming;
+
+		ret = rkcif_stream_register(rkcif, stream);
+		if (ret)
+			goto err_streams_unregister;
+
+		interface->streams_num++;
+	}
+
+	return 0;
+
+err_streams_unregister:
+	for (unsigned int i = 0; i < interface->streams_num; i++)
+		rkcif_stream_unregister(&interface->streams[i]);
+
+	rkcif_interface_unregister(interface);
+
+	return ret;
+}
+
+void rkcif_dvp_unregister(struct rkcif_device *rkcif)
+{
+	struct rkcif_interface *interface;
+
+	if (!rkcif->match_data->dvp)
+		return;
+
+	interface = &rkcif->interfaces[RKCIF_DVP];
+
+	for (unsigned int i = 0; i < interface->streams_num; i++)
+		rkcif_stream_unregister(&interface->streams[i]);
+
+	rkcif_interface_unregister(interface);
+}
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
new file mode 100644
index 000000000000..7b2da11497c3
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ * Copyright (C) 2025 Collabora, Ltd.
+ */
+
+#ifndef _RKCIF_CAPTURE_DVP_H
+#define _RKCIF_CAPTURE_DVP_H
+
+#include "rkcif-common.h"
+
+extern const struct rkcif_dvp_match_data rkcif_px30_vip_dvp_match_data;
+
+int rkcif_dvp_register(struct rkcif_device *rkcif);
+
+void rkcif_dvp_unregister(struct rkcif_device *rkcif);
+
+irqreturn_t rkcif_dvp_isr(int irq, void *ctx);
+
+#endif
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 63d5b45c7afe..c6ec578e1049 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -24,6 +24,8 @@
 #include <media/v4l2-subdev.h>
 #include <media/videobuf2-v4l2.h>
 
+#include "rkcif-regs.h"
+
 #define RKCIF_DRIVER_NAME "rockchip-cif"
 #define RKCIF_CLK_MAX	  4
 
@@ -84,17 +86,31 @@ struct rkcif_dummy_buffer {
 	u32 size;
 };
 
+enum rkcif_plane_index {
+	RKCIF_PLANE_Y,
+	RKCIF_PLANE_UV,
+	RKCIF_PLANE_MAX
+};
+
 struct rkcif_input_fmt {
 	u32 mbus_code;
 
 	enum rkcif_format_type fmt_type;
 	enum v4l2_field field;
+
+	union {
+		u32 dvp_fmt_val;
+	};
 };
 
 struct rkcif_output_fmt {
 	u32 fourcc;
 	u32 mbus_code;
 	u8 cplanes;
+
+	union {
+		u32 dvp_fmt_val;
+	};
 };
 
 struct rkcif_interface;
@@ -168,9 +184,21 @@ struct rkcif_interface {
 	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
 };
 
+struct rkcif_dvp_match_data {
+	const struct rkcif_input_fmt *in_fmts;
+	unsigned int in_fmts_num;
+	const struct rkcif_output_fmt *out_fmts;
+	unsigned int out_fmts_num;
+	void (*setup)(struct rkcif_device *rkcif);
+	bool has_scaler;
+	bool has_ids;
+	unsigned int regs[RKCIF_DVP_REGISTER_MAX];
+};
+
 struct rkcif_match_data {
 	const char *const *clks;
 	unsigned int clks_num;
+	const struct rkcif_dvp_match_data *dvp;
 };
 
 struct rkcif_device {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index 49e53f70715c..207802073fd3 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -23,6 +23,7 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
 
+#include "rkcif-capture-dvp.h"
 #include "rkcif-common.h"
 
 static const char *const px30_vip_clks[] = {
@@ -34,6 +35,7 @@ static const char *const px30_vip_clks[] = {
 static const struct rkcif_match_data px30_vip_match_data = {
 	.clks = px30_vip_clks,
 	.clks_num = ARRAY_SIZE(px30_vip_clks),
+	.dvp = &rkcif_px30_vip_dvp_match_data,
 };
 
 static const char *const rk3568_vicap_clks[] = {
@@ -63,11 +65,21 @@ MODULE_DEVICE_TABLE(of, rkcif_plat_of_match);
 
 static int rkcif_register(struct rkcif_device *rkcif)
 {
+	int ret;
+
+	ret = rkcif_dvp_register(rkcif);
+	if (ret && ret != -ENODEV)
+		goto err;
+
 	return 0;
+
+err:
+	return ret;
 }
 
 static void rkcif_unregister(struct rkcif_device *rkcif)
 {
+	rkcif_dvp_unregister(rkcif);
 }
 
 static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
@@ -112,6 +124,9 @@ static irqreturn_t rkcif_isr(int irq, void *ctx)
 {
 	irqreturn_t ret = IRQ_NONE;
 
+	if (rkcif_dvp_isr(irq, ctx) == IRQ_HANDLED)
+		ret = IRQ_HANDLED;
+
 	return ret;
 }
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
new file mode 100644
index 000000000000..91d42d31fd10
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2023 Mehdi Djait <mehdi.djait@bootlin.com>
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ */
+
+#ifndef _RKCIF_REGS_H
+#define _RKCIF_REGS_H
+
+#define RKCIF_REGISTER_NOTSUPPORTED		0x420000
+#define RKCIF_FETCH_Y(VAL)			((VAL) & 0x1fff)
+#define RKCIF_XY_COORD(x, y)			(((y) << 16) | (x))
+
+/* DVP register contents */
+#define RKCIF_CTRL_ENABLE_CAPTURE		BIT(0)
+#define RKCIF_CTRL_MODE_PINGPONG		BIT(1)
+#define RKCIF_CTRL_MODE_LINELOOP		BIT(2)
+#define RKCIF_CTRL_AXI_BURST_16			(0xf << 12)
+
+#define RKCIF_INTEN_FRAME_END_EN		BIT(0)
+#define RKCIF_INTEN_LINE_ERR_EN			BIT(2)
+#define RKCIF_INTEN_BUS_ERR_EN			BIT(6)
+#define RKCIF_INTEN_SCL_ERR_EN			BIT(7)
+#define RKCIF_INTEN_PST_INF_FRAME_END_EN	BIT(9)
+
+#define RKCIF_INTSTAT_CLS			0x3ff
+#define RKCIF_INTSTAT_FRAME_END			BIT(0)
+#define RKCIF_INTSTAT_LINE_END			BIT(1)
+#define RKCIF_INTSTAT_LINE_ERR			BIT(2)
+#define RKCIF_INTSTAT_PIX_ERR			BIT(3)
+#define RKCIF_INTSTAT_DFIFO_OF			BIT(5)
+#define RKCIF_INTSTAT_BUS_ERR			BIT(6)
+#define RKCIF_INTSTAT_PRE_INF_FRAME_END		BIT(8)
+#define RKCIF_INTSTAT_PST_INF_FRAME_END		BIT(9)
+#define RKCIF_INTSTAT_FRAME_END_CLR		BIT(0)
+#define RKCIF_INTSTAT_LINE_END_CLR		BIT(1)
+#define RKCIF_INTSTAT_LINE_ERR_CLR		BIT(2)
+#define RKCIF_INTSTAT_PST_INF_FRAME_END_CLR	BIT(9)
+#define RKCIF_INTSTAT_ERR			0xfc
+
+#define RKCIF_FRAME_STAT_CLS			0x00
+#define RKCIF_FRAME_FRM0_STAT_CLS		0x20
+
+#define RKCIF_FORMAT_VSY_HIGH_ACTIVE		BIT(0)
+#define RKCIF_FORMAT_HSY_LOW_ACTIVE		BIT(1)
+
+#define RKCIF_FORMAT_INPUT_MODE_YUV		(0x00 << 2)
+#define RKCIF_FORMAT_INPUT_MODE_PAL		(0x02 << 2)
+#define RKCIF_FORMAT_INPUT_MODE_NTSC		(0x03 << 2)
+#define RKCIF_FORMAT_INPUT_MODE_BT1120		(0x07 << 2)
+#define RKCIF_FORMAT_INPUT_MODE_RAW		(0x04 << 2)
+#define RKCIF_FORMAT_INPUT_MODE_JPEG		(0x05 << 2)
+#define RKCIF_FORMAT_INPUT_MODE_MIPI		(0x06 << 2)
+
+#define RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY	(0x00 << 5)
+#define RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU	(0x01 << 5)
+#define RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY	(0x02 << 5)
+#define RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV	(0x03 << 5)
+#define RKCIF_FORMAT_YUV_INPUT_422		(0x00 << 7)
+#define RKCIF_FORMAT_YUV_INPUT_420		BIT(7)
+
+#define RKCIF_FORMAT_INPUT_420_ORDER_ODD	BIT(8)
+
+#define RKCIF_FORMAT_CCIR_INPUT_ORDER_EVEN	BIT(9)
+
+#define RKCIF_FORMAT_RAW_DATA_WIDTH_8		(0x00 << 11)
+#define RKCIF_FORMAT_RAW_DATA_WIDTH_10		(0x01 << 11)
+#define RKCIF_FORMAT_RAW_DATA_WIDTH_12		(0x02 << 11)
+
+#define RKCIF_FORMAT_YUV_OUTPUT_422		(0x00 << 16)
+#define RKCIF_FORMAT_YUV_OUTPUT_420		BIT(16)
+
+#define RKCIF_FORMAT_OUTPUT_420_ORDER_EVEN	(0x00 << 17)
+#define RKCIF_FORMAT_OUTPUT_420_ORDER_ODD	BIT(17)
+
+#define RKCIF_FORMAT_RAWD_DATA_LITTLE_ENDIAN	(0x00 << 18)
+#define RKCIF_FORMAT_RAWD_DATA_BIG_ENDIAN	BIT(18)
+
+#define RKCIF_FORMAT_UV_STORAGE_ORDER_UVUV	(0x00 << 19)
+#define RKCIF_FORMAT_UV_STORAGE_ORDER_VUVU	BIT(19)
+
+#define RKCIF_FORMAT_BT1120_CLOCK_SINGLE_EDGES	(0x00 << 24)
+#define RKCIF_FORMAT_BT1120_CLOCK_DOUBLE_EDGES	BIT(24)
+#define RKCIF_FORMAT_BT1120_TRANSMIT_INTERFACE	(0x00 << 25)
+#define RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS	BIT(25)
+#define RKCIF_FORMAT_BT1120_YC_SWAP		BIT(26)
+
+#define RKCIF_SCL_CTRL_ENABLE_SCL_DOWN		BIT(0)
+#define RKCIF_SCL_CTRL_ENABLE_SCL_UP		BIT(1)
+#define RKCIF_SCL_CTRL_ENABLE_YUV_16BIT_BYPASS	BIT(4)
+#define RKCIF_SCL_CTRL_ENABLE_RAW_16BIT_BYPASS	BIT(5)
+#define RKCIF_SCL_CTRL_ENABLE_32BIT_BYPASS	BIT(6)
+#define RKCIF_SCL_CTRL_DISABLE_32BIT_BYPASS	(0x00 << 6)
+
+#define RKCIF_INTSTAT_F0_READY			BIT(0)
+#define RKCIF_INTSTAT_F1_READY			BIT(1)
+
+/* GRF register offsets and contents */
+#define RK3568_GRF_VI_CON0			0x340
+#define RK3568_GRF_VI_CON1			0x344
+#define RK3568_GRF_VI_STATUS0			0x348
+
+#define RK3568_GRF_VI_CON1_CIF_DATAPATH		BIT(9)
+#define RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM	GENMASK(6, 0)
+
+#define RK3568_GRF_WRITE_ENABLE(x)		((x) << 16)
+
+enum rkcif_dvp_register_index {
+	RKCIF_DVP_CTRL,
+	RKCIF_DVP_INTEN,
+	RKCIF_DVP_INTSTAT,
+	RKCIF_DVP_FOR,
+	RKCIF_DVP_LINE_NUM_ADDR,
+	RKCIF_DVP_FRM0_ADDR_Y,
+	RKCIF_DVP_FRM0_ADDR_UV,
+	RKCIF_DVP_FRM1_ADDR_Y,
+	RKCIF_DVP_FRM1_ADDR_UV,
+	RKCIF_DVP_VIR_LINE_WIDTH,
+	RKCIF_DVP_SET_SIZE,
+	RKCIF_DVP_SCL_CTRL,
+	RKCIF_DVP_CROP,
+	RKCIF_DVP_FRAME_STATUS,
+	RKCIF_DVP_LAST_LINE,
+	RKCIF_DVP_LAST_PIX,
+	RKCIF_DVP_REGISTER_MAX
+};
+
+#endif

-- 
2.39.5



