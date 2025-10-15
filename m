Return-Path: <linux-media+bounces-44603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E94EBDF341
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 16:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05D4F3AC536
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 14:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AC42E62C8;
	Wed, 15 Oct 2025 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0/Mw9jR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767762D8788;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540188; cv=none; b=RzungZka7EYchXeOto7ti98e+5VoNeZrO5syJSgbq8E4AVsAYMVUDBfx5TiFLPahGDAtTrsk8QwvSHnJChWrYDi3zGuOOuunSnGTvhXo3/aQsuOyykUsICSoNGVRUgbDelerncKuXi4tmr1dRhK84IaVReRDcHEreRkPWhhsVsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540188; c=relaxed/simple;
	bh=uI2gmuk6W6jKS5lvrE6qYjVwf9T0D5Cwegzz088e3Fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1bVTPd2/Hj2mn1Jbp7nD5F0hwHTHwQk5Ii8eG92vAWOVd/1/LAQ+FD7asiZkq6jMypalBHE4iQ8sTAwBRiPDcNeqPHb1VurbWFYI7paJjh7T2w9JayW74uR5qiMr1IJJMJDZwH3SoctaKe/nlCKK57I2x3DodK3WzreZ4Ej0Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0/Mw9jR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BA05C4AF10;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760540188;
	bh=uI2gmuk6W6jKS5lvrE6qYjVwf9T0D5Cwegzz088e3Fs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g0/Mw9jRGeFizbEIDauPHY5dmGAUYeN8t2T134RFP/PtPdc1nMVwLQskWo0CDMp0h
	 sYbPKqPmcLBkGCUnrpZmtfEvd18UdRWmWdVkstGazTc4C9WHR65JgQTtRKhT5e0Drp
	 64L14FulndCIKAHZp/XNwQqBoHo8EP+1GOcmJvCLYBnLYRnMLCCj4KRl7pV37rbCw3
	 exdw/wVLhDqwqqo53Hfeg42AITkzecN8rNWFfcZdnSWi+Zc/X5B7PD0lI95Ihr7tr0
	 Dm8B6oQsiSZl3BOh2rRVFwAVFZjp5F7Xk7t+NlK20ttLByq9pooxuFVwFqFzfaoWC2
	 ndo+SVseI2g5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CC7CCD19A;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 15 Oct 2025 16:56:35 +0200
Subject: [PATCH v13 12/18] media: rockchip: rkcif: add support for rk3568
 vicap mipi capture
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v13-12-da164b4918fe@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760540185; l=27198;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=V/SSFlqvsbMLOMKOYqjTmzEpKtCu2afX7wqm/Jhnx5Q=;
 b=TAbsUp47/eCADOJ3+fkkqhrmQ83uzZA0M+MTZ/lFcbxn9yIV1UIsUfd856It0H+HxoWds5zCT
 pODu0bgq3JDCOzv1L/VRJgZ7qAC7bx0cPR1joZQTnf+Cu7yyRvdSA85
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 capture
interface. Add support for the MIPI capture interface in general
and for the RK3568 VICAP MIPI capture in particular.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 777 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  23 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |  29 +
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  12 +
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h |  22 +
 6 files changed, 864 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
index a36e294d569d..dca2bf45159f 100644
--- a/drivers/media/platform/rockchip/rkcif/Makefile
+++ b/drivers/media/platform/rockchip/rkcif/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
 
 rockchip-cif-objs += rkcif-capture-dvp.o
+rockchip-cif-objs += rkcif-capture-mipi.o
 rockchip-cif-objs += rkcif-dev.o
 rockchip-cif-objs += rkcif-interface.o
 rockchip-cif-objs += rkcif-stream.o
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
new file mode 100644
index 000000000000..1b81bcc067ef
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -0,0 +1,777 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ * Copyright (C) 2025 Collabora, Ltd.
+ */
+
+#include <linux/interrupt.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#include "rkcif-capture-mipi.h"
+#include "rkcif-common.h"
+#include "rkcif-interface.h"
+#include "rkcif-regs.h"
+#include "rkcif-stream.h"
+
+#define RK3568_MIPI_CTRL0_HIGH_ALIGN  BIT(31)
+#define RK3568_MIPI_CTRL0_UV_SWAP_EN  BIT(7)
+#define RK3568_MIPI_CTRL0_COMPACT_EN  BIT(6)
+#define RK3568_MIPI_CTRL0_CROP_EN     BIT(5)
+#define RK3568_MIPI_CTRL0_WRDDR(type) ((type) << 1)
+
+#define RKCIF_MIPI_CTRL0_DT_ID(id)    ((id) << 10)
+#define RKCIF_MIPI_CTRL0_VC_ID(id)    ((id) << 8)
+#define RKCIF_MIPI_CTRL0_CAP_EN	      BIT(0)
+
+#define RKCIF_MIPI_INT_FRAME0_END(id) BIT(8 + (id) * 2 + 0)
+#define RKCIF_MIPI_INT_FRAME1_END(id) BIT(8 + (id) * 2 + 1)
+
+static const struct rkcif_output_fmt mipi_out_fmts[] = {
+	/* YUV formats */
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	/* RGB formats */
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
+		.depth = 24,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RGB888,
+			.type = RKCIF_MIPI_TYPE_RGB888,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,
+		.mbus_code = MEDIA_BUS_FMT_BGR888_1X24,
+		.depth = 24,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RGB888,
+			.type = RKCIF_MIPI_TYPE_RGB888,
+		},
+	},
+	/* Bayer formats */
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.type = RKCIF_MIPI_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR10P,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.compact = true,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG10P,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.compact = true,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG10P,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.compact = true,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB10P,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.compact = true,
+			.type = RKCIF_MIPI_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.type = RKCIF_MIPI_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR12P,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.compact = true,
+			.type = RKCIF_MIPI_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.type = RKCIF_MIPI_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG12P,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.compact = true,
+			.type = RKCIF_MIPI_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.type = RKCIF_MIPI_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG12P,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.compact = true,
+			.type = RKCIF_MIPI_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.type = RKCIF_MIPI_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB12P,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.compact = true,
+			.type = RKCIF_MIPI_TYPE_RAW12,
+		},
+	},
+};
+
+static const struct rkcif_input_fmt mipi_in_fmts[] = {
+	/* YUV formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+	},
+	/* RGB formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_BGR888_1X24,
+	},
+	/* Bayer formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+	},
+};
+
+static u32
+rkcif_rk3568_mipi_ctrl0(struct rkcif_stream *stream,
+			const struct rkcif_output_fmt *active_out_fmt)
+{
+	u32 ctrl0 = 0;
+
+	ctrl0 |= RKCIF_MIPI_CTRL0_DT_ID(active_out_fmt->mipi.dt);
+	ctrl0 |= RKCIF_MIPI_CTRL0_CAP_EN;
+	ctrl0 |= RK3568_MIPI_CTRL0_CROP_EN;
+
+	if (active_out_fmt->mipi.compact)
+		ctrl0 |= RK3568_MIPI_CTRL0_COMPACT_EN;
+
+	switch (active_out_fmt->mipi.type) {
+	case RKCIF_MIPI_TYPE_RAW8:
+		break;
+	case RKCIF_MIPI_TYPE_RAW10:
+		ctrl0 |= RK3568_MIPI_CTRL0_WRDDR(0x1);
+		break;
+	case RKCIF_MIPI_TYPE_RAW12:
+		ctrl0 |= RK3568_MIPI_CTRL0_WRDDR(0x2);
+		break;
+	case RKCIF_MIPI_TYPE_RGB888:
+		ctrl0 |= RK3568_MIPI_CTRL0_WRDDR(0x3);
+		break;
+	case RKCIF_MIPI_TYPE_YUV422SP:
+		ctrl0 |= RK3568_MIPI_CTRL0_WRDDR(0x4);
+		break;
+	case RKCIF_MIPI_TYPE_YUV420SP:
+		ctrl0 |= RK3568_MIPI_CTRL0_WRDDR(0x5);
+		break;
+	case RKCIF_MIPI_TYPE_YUV400:
+		ctrl0 |= RK3568_MIPI_CTRL0_WRDDR(0x6);
+		break;
+	default:
+		break;
+	}
+
+	return ctrl0;
+}
+
+const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
+	.mipi_num = 1,
+	.mipi_ctrl0 = rkcif_rk3568_mipi_ctrl0,
+	.regs = {
+		[RKCIF_MIPI_CTRL] = 0x20,
+		[RKCIF_MIPI_INTEN] = 0xa4,
+		[RKCIF_MIPI_INTSTAT] = 0xa8,
+	},
+	.regs_id = {
+		[RKCIF_ID0] = {
+			[RKCIF_MIPI_CTRL0] = 0x00,
+			[RKCIF_MIPI_CTRL1] = 0x04,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x24,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x2c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x34,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x3c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x28,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x30,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x38,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x40,
+			[RKCIF_MIPI_CROP_START] = 0xbc,
+		},
+		[RKCIF_ID1] = {
+			[RKCIF_MIPI_CTRL0] = 0x08,
+			[RKCIF_MIPI_CTRL1] = 0x0c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x44,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x4c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x54,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x5c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x48,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x50,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x58,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x60,
+			[RKCIF_MIPI_CROP_START] = 0xc0,
+		},
+		[RKCIF_ID2] = {
+			[RKCIF_MIPI_CTRL0] = 0x10,
+			[RKCIF_MIPI_CTRL1] = 0x14,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x64,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x6c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x74,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x7c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x68,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x70,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x78,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x80,
+			[RKCIF_MIPI_CROP_START] = 0xc4,
+		},
+		[RKCIF_ID3] = {
+			[RKCIF_MIPI_CTRL0] = 0x18,
+			[RKCIF_MIPI_CTRL1] = 0x1c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x84,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x8c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x94,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x9c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x88,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x90,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x98,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0xa0,
+			[RKCIF_MIPI_CROP_START] = 0xc8,
+		},
+	},
+	.blocks = {
+		{
+			.offset = 0x80,
+		},
+	},
+};
+
+static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
+					      unsigned int index)
+{
+	struct rkcif_device *rkcif = interface->rkcif;
+	unsigned int block, offset, reg;
+
+	block = interface->index - RKCIF_MIPI_BASE;
+
+	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(index > RKCIF_MIPI_REGISTER_MAX))
+		return RKCIF_REGISTER_NOTSUPPORTED;
+
+	offset = rkcif->match_data->mipi->blocks[block].offset;
+	reg = rkcif->match_data->mipi->regs[index];
+	if (reg == RKCIF_REGISTER_NOTSUPPORTED)
+		return reg;
+
+	return offset + reg;
+}
+
+static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
+						 unsigned int index)
+{
+	struct rkcif_device *rkcif = stream->rkcif;
+	unsigned int block, id, offset, reg;
+
+	block = stream->interface->index - RKCIF_MIPI_BASE;
+	id = stream->id;
+
+	if (WARN_ON_ONCE(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON_ONCE(id > RKCIF_ID_MAX) ||
+	    WARN_ON_ONCE(index > RKCIF_MIPI_ID_REGISTER_MAX))
+		return RKCIF_REGISTER_NOTSUPPORTED;
+
+	offset = rkcif->match_data->mipi->blocks[block].offset;
+	reg = rkcif->match_data->mipi->regs_id[id][index];
+	if (reg == RKCIF_REGISTER_NOTSUPPORTED)
+		return reg;
+
+	return offset + reg;
+}
+
+static inline __maybe_unused void
+rkcif_mipi_write(struct rkcif_interface *interface, unsigned int index, u32 val)
+{
+	unsigned int addr = rkcif_mipi_get_reg(interface, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return;
+
+	writel(val, interface->rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused void
+rkcif_mipi_stream_write(struct rkcif_stream *stream, unsigned int index,
+			u32 val)
+{
+	unsigned int addr = rkcif_mipi_id_get_reg(stream, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return;
+
+	writel(val, stream->rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+rkcif_mipi_read(struct rkcif_interface *interface, unsigned int index)
+{
+	unsigned int addr = rkcif_mipi_get_reg(interface, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return 0;
+
+	return readl(interface->rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+rkcif_mipi_stream_read(struct rkcif_stream *stream, unsigned int index)
+{
+	unsigned int addr = rkcif_mipi_id_get_reg(stream, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return 0;
+
+	return readl(stream->rkcif->base_addr + addr);
+}
+
+static void rkcif_mipi_queue_buffer(struct rkcif_stream *stream,
+				    unsigned int index)
+{
+	struct rkcif_buffer *buffer = stream->buffers[index];
+	u32 frm_addr_y, frm_addr_uv;
+
+	frm_addr_y = index ? RKCIF_MIPI_FRAME1_ADDR_Y :
+			     RKCIF_MIPI_FRAME0_ADDR_Y;
+	frm_addr_uv = index ? RKCIF_MIPI_FRAME1_ADDR_UV :
+			      RKCIF_MIPI_FRAME0_ADDR_UV;
+
+	rkcif_mipi_stream_write(stream, frm_addr_y,
+				buffer->buff_addr[RKCIF_PLANE_Y]);
+	rkcif_mipi_stream_write(stream, frm_addr_uv,
+				buffer->buff_addr[RKCIF_PLANE_UV]);
+}
+
+static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
+{
+	struct rkcif_interface *interface = stream->interface;
+	const struct rkcif_output_fmt *active_out_fmt;
+	const struct rkcif_mipi_match_data *match_data;
+	struct v4l2_subdev_state *state;
+	u32 ctrl0 = 0, ctrl1 = 0, int_temp = 0, int_mask = 0, vlw = 0;
+	u16 height, width;
+	int ret = -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
+
+	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
+						      stream->pix.pixelformat);
+	if (!active_out_fmt)
+		goto out;
+
+	height = stream->pix.height;
+	width = stream->pix.width;
+	vlw = stream->pix.plane_fmt[0].bytesperline;
+
+	match_data = stream->rkcif->match_data->mipi;
+	if (match_data->mipi_ctrl0)
+		ctrl0 = match_data->mipi_ctrl0(stream, active_out_fmt);
+
+	ctrl1 = RKCIF_XY_COORD(width, height);
+
+	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
+	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
+	int_temp |= int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
+	int_temp &= ~int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_Y, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_Y, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_UV, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_UV, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, 0x0);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
+
+	ret = 0;
+
+out:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
+{
+	struct rkcif_interface *interface = stream->interface;
+	struct v4l2_subdev_state *state;
+	u32 int_temp = 0, int_mask = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
+
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, 0);
+
+	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
+	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
+	int_temp &= ~int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
+	int_temp &= ~int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+
+	stream->stopping = false;
+
+	v4l2_subdev_unlock_state(state);
+}
+
+static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
+{
+	u32 val;
+
+	val = RKCIF_XY_COORD(left, top);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, val);
+}
+
+irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
+{
+	struct device *dev = ctx;
+	struct rkcif_device *rkcif = dev_get_drvdata(dev);
+	irqreturn_t ret = IRQ_NONE;
+	u32 intstat;
+
+	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
+		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
+
+		for (unsigned int j = 0; j < interface->streams_num; j++) {
+			struct rkcif_stream *stream = &interface->streams[j];
+
+			if (intstat & RKCIF_MIPI_INT_FRAME0_END(stream->id) ||
+			    intstat & RKCIF_MIPI_INT_FRAME1_END(stream->id)) {
+				ret = IRQ_HANDLED;
+
+				if (stream->stopping) {
+					rkcif_mipi_stop_streaming(stream);
+					wake_up(&stream->wq_stopped);
+					continue;
+				}
+
+				rkcif_stream_pingpong(stream);
+			}
+		}
+	}
+
+	return ret;
+}
+
+int rkcif_mipi_register(struct rkcif_device *rkcif)
+{
+	int ret;
+
+	if (!rkcif->match_data->mipi)
+		return 0;
+
+	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		interface->index = index;
+		interface->type = RKCIF_IF_MIPI;
+		interface->in_fmts = mipi_in_fmts;
+		interface->in_fmts_num = ARRAY_SIZE(mipi_in_fmts);
+		interface->set_crop = rkcif_mipi_set_crop;
+		interface->streams_num = 0;
+		ret = rkcif_interface_register(rkcif, interface);
+		if (ret)
+			continue;
+
+		for (unsigned int j = 0; j < RKCIF_ID_MAX; j++) {
+			struct rkcif_stream *stream = &interface->streams[j];
+
+			stream->id = j;
+			stream->interface = interface;
+			stream->out_fmts = mipi_out_fmts;
+			stream->out_fmts_num = ARRAY_SIZE(mipi_out_fmts);
+			stream->queue_buffer = rkcif_mipi_queue_buffer;
+			stream->start_streaming = rkcif_mipi_start_streaming;
+			stream->stop_streaming = rkcif_mipi_stop_streaming;
+			ret = rkcif_stream_register(rkcif, stream);
+			if (ret)
+				goto err;
+			interface->streams_num++;
+		}
+	}
+
+	return 0;
+
+err:
+	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		for (unsigned int j = 0; j < interface->streams_num; j++)
+			rkcif_stream_unregister(&interface->streams[j]);
+
+		rkcif_interface_unregister(interface);
+	}
+	return ret;
+}
+
+void rkcif_mipi_unregister(struct rkcif_device *rkcif)
+{
+	if (!rkcif->match_data->mipi)
+		return;
+
+	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		for (unsigned int j = 0; j < interface->streams_num; j++)
+			rkcif_stream_unregister(&interface->streams[j]);
+
+		rkcif_interface_unregister(interface);
+	}
+}
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
new file mode 100644
index 000000000000..7f16eadc474c
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip Camera Interface (CIF) Driver
+ *
+ * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ * Copyright (C) 2025 Collabora, Ltd.
+ */
+
+#ifndef _RKCIF_CAPTURE_MIPI_H
+#define _RKCIF_CAPTURE_MIPI_H
+
+#include "rkcif-common.h"
+
+extern const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data;
+
+int rkcif_mipi_register(struct rkcif_device *rkcif);
+
+void rkcif_mipi_unregister(struct rkcif_device *rkcif);
+
+irqreturn_t rkcif_mipi_isr(int irq, void *ctx);
+
+#endif
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index c6ec578e1049..dd92cfbc879f 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -73,6 +73,17 @@ enum rkcif_interface_type {
 	RKCIF_IF_MIPI,
 };
 
+enum rkcif_mipi_format_type {
+	RKCIF_MIPI_TYPE_INVALID,
+	RKCIF_MIPI_TYPE_RAW8,
+	RKCIF_MIPI_TYPE_RAW10,
+	RKCIF_MIPI_TYPE_RAW12,
+	RKCIF_MIPI_TYPE_RGB888,
+	RKCIF_MIPI_TYPE_YUV422SP,
+	RKCIF_MIPI_TYPE_YUV420SP,
+	RKCIF_MIPI_TYPE_YUV400,
+};
+
 struct rkcif_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head queue;
@@ -107,9 +118,15 @@ struct rkcif_output_fmt {
 	u32 fourcc;
 	u32 mbus_code;
 	u8 cplanes;
+	u8 depth;
 
 	union {
 		u32 dvp_fmt_val;
+		struct {
+			u8 dt;
+			bool compact;
+			enum rkcif_mipi_format_type type;
+		} mipi;
 	};
 };
 
@@ -184,6 +201,17 @@ struct rkcif_interface {
 	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
 };
 
+struct rkcif_mipi_match_data {
+	unsigned int mipi_num;
+	unsigned int regs[RKCIF_MIPI_REGISTER_MAX];
+	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
+	u32 (*mipi_ctrl0)(struct rkcif_stream *stream,
+			  const struct rkcif_output_fmt *active_out_fmt);
+	struct {
+		unsigned int offset;
+	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];
+};
+
 struct rkcif_dvp_match_data {
 	const struct rkcif_input_fmt *in_fmts;
 	unsigned int in_fmts_num;
@@ -199,6 +227,7 @@ struct rkcif_match_data {
 	const char *const *clks;
 	unsigned int clks_num;
 	const struct rkcif_dvp_match_data *dvp;
+	const struct rkcif_mipi_match_data *mipi;
 };
 
 struct rkcif_device {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index addc118ff8bf..b4cf1146f131 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -24,6 +24,7 @@
 #include <media/v4l2-mc.h>
 
 #include "rkcif-capture-dvp.h"
+#include "rkcif-capture-mipi.h"
 #include "rkcif-common.h"
 
 static const char *const px30_vip_clks[] = {
@@ -49,6 +50,7 @@ static const struct rkcif_match_data rk3568_vicap_match_data = {
 	.clks = rk3568_vicap_clks,
 	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
 	.dvp = &rkcif_rk3568_vicap_dvp_match_data,
+	.mipi = &rkcif_rk3568_vicap_mipi_match_data,
 };
 
 static const struct of_device_id rkcif_plat_of_match[] = {
@@ -72,14 +74,21 @@ static int rkcif_register(struct rkcif_device *rkcif)
 	if (ret && ret != -ENODEV)
 		goto err;
 
+	ret = rkcif_mipi_register(rkcif);
+	if (ret && ret != -ENODEV)
+		goto err_dvp_unregister;
+
 	return 0;
 
+err_dvp_unregister:
+	rkcif_dvp_unregister(rkcif);
 err:
 	return ret;
 }
 
 static void rkcif_unregister(struct rkcif_device *rkcif)
 {
+	rkcif_mipi_unregister(rkcif);
 	rkcif_dvp_unregister(rkcif);
 }
 
@@ -128,6 +137,9 @@ static irqreturn_t rkcif_isr(int irq, void *ctx)
 	if (rkcif_dvp_isr(irq, ctx) == IRQ_HANDLED)
 		ret = IRQ_HANDLED;
 
+	if (rkcif_mipi_isr(irq, ctx) == IRQ_HANDLED)
+		ret = IRQ_HANDLED;
+
 	return ret;
 }
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
index 91d42d31fd10..3cf7ee19de30 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -128,4 +128,26 @@ enum rkcif_dvp_register_index {
 	RKCIF_DVP_REGISTER_MAX
 };
 
+enum rkcif_mipi_register_index {
+	RKCIF_MIPI_CTRL,
+	RKCIF_MIPI_INTEN,
+	RKCIF_MIPI_INTSTAT,
+	RKCIF_MIPI_REGISTER_MAX
+};
+
+enum rkcif_mipi_id_register_index {
+	RKCIF_MIPI_CTRL0,
+	RKCIF_MIPI_CTRL1,
+	RKCIF_MIPI_FRAME0_ADDR_Y,
+	RKCIF_MIPI_FRAME0_ADDR_UV,
+	RKCIF_MIPI_FRAME0_VLW_Y,
+	RKCIF_MIPI_FRAME0_VLW_UV,
+	RKCIF_MIPI_FRAME1_ADDR_Y,
+	RKCIF_MIPI_FRAME1_ADDR_UV,
+	RKCIF_MIPI_FRAME1_VLW_Y,
+	RKCIF_MIPI_FRAME1_VLW_UV,
+	RKCIF_MIPI_CROP_START,
+	RKCIF_MIPI_ID_REGISTER_MAX
+};
+
 #endif

-- 
2.39.5



