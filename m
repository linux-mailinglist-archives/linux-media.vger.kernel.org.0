Return-Path: <linux-media+bounces-34535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4EAD5D0F
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 19:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDE4117C4A0
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 17:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2808C22425E;
	Wed, 11 Jun 2025 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdosYpyg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65895221DB9;
	Wed, 11 Jun 2025 17:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749662358; cv=none; b=UvPc/eU54UYK0VuRWQ9IIX5okATDUHMbAn9AtAU3k5ss90stVMfOst4TOG9eyM8bXC2JQpsDfBzWZ3Kol1LKFfr8zDYUnQJNu/uixu7WV6+2Ljx7GrAfSaUc6EdW2T+JOg4uPHwT8s9FOmbUva/0QNfQ1mCH8cekOFgm16oQLEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749662358; c=relaxed/simple;
	bh=Gh8dB3oKj65Dy3w7NyRp7azTDgtJFUAyWAywsMI3v+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tOAYXCVzAP89J8HeBUlr/DpMpskJ5L5kkWDv8gvIMsVMqAOLGTre/X2tw0uZw+FZ1/U048ArRprx52pluLvR/xfkoezE7ynwe/xaVb9fCasoTqEMSlpBWBZKjNQSGFHKXEOFETYUw2qcgwcJ0mKQvAHy31qpRoyM+TDN63LStbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdosYpyg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F6BDC116D0;
	Wed, 11 Jun 2025 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749662357;
	bh=Gh8dB3oKj65Dy3w7NyRp7azTDgtJFUAyWAywsMI3v+4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IdosYpygiEM1CZJo4odpdlA9+6cJcbzfrUDgsUKjfrE4zGldcdrPFya7ZZCjCiKND
	 2Lljd3TuzNdF0VJl3FXjIN5TyWuue/N+1genima/DkRfwnvAQ5AAV9xcOt/s03oOG3
	 XnI9N4DMpk5weBGng9DX048DDFe3YF8WdXVJjvSMtKnHUSoBcxUW/Yxflt90yljEJM
	 eOvYky7jWPREYscmFmUjuq6qMlc14IIEtRizgRX33gMHi7P1rxvfgRL0GKRZSq/pB5
	 EZDPc+tfL4bRGEOuPyrmOglDiBQMUNNONJelmMpnjQW3tPV2H8oE+jjQ/1jXqIMKyz
	 jjprLtTVqQm1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CF5C71136;
	Wed, 11 Jun 2025 17:19:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 11 Jun 2025 19:06:53 +0200
Subject: [PATCH v8 08/13] media: rockchip: rkcif: add support for mipi
 csi-2 capture
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v8-8-9d9cbc4b524d@collabora.com>
References: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749661609; l=25065;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=TzkjpGw91YhDosffz/jUj5lV6LQv4SvOMPNj04E0+Xc=;
 b=0TN674joQsqb9nEdk0nFzfIOctkSN4tbpifJh9aHb3LA5OIYnict0O0XgK0Rh7sGHfQkHC7X0
 zMCL2YAijYoAJ211VaHilaQxWPBQpLHcxS43GG27+Xq4/U3loaL82tM
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 capture
interface that can receive video data and write it into system memory
using the ping-pong scheme. Add support for it.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 695 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   2 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |  16 +
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |   1 +
 .../platform/rockchip/rkcif/rkcif-interface.c      |   6 +-
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h |  24 +-
 6 files changed, 741 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 0c3f7b8cfa18..9b569fded99a 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -6,22 +6,717 @@
  * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
  */
 
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
 #include "rkcif-capture-mipi.h"
 #include "rkcif-common.h"
+#include "rkcif-interface.h"
+#include "rkcif-regs.h"
 #include "rkcif-stream.h"
 
+#define RKCIF_MIPI_CTRL0_COMPACT_EN    BIT(6)
+#define RKCIF_MIPI_CTRL0_CROP_EN       BIT(5)
+#define RKCIF_MIPI_CTRL0_TYPE(type)    ((type) << 1)
+#define RKCIF_MIPI_CTRL0_TYPE_RAW8     RKCIF_MIPI_CTRL0_TYPE(0x0)
+#define RKCIF_MIPI_CTRL0_TYPE_RAW10    RKCIF_MIPI_CTRL0_TYPE(0x1)
+#define RKCIF_MIPI_CTRL0_TYPE_RAW12    RKCIF_MIPI_CTRL0_TYPE(0x2)
+#define RKCIF_MIPI_CTRL0_TYPE_RGB888   RKCIF_MIPI_CTRL0_TYPE(0x3)
+#define RKCIF_MIPI_CTRL0_TYPE_YUV422SP RKCIF_MIPI_CTRL0_TYPE(0x4)
+#define RKCIF_MIPI_CTRL0_TYPE_YUV420SP RKCIF_MIPI_CTRL0_TYPE(0x5)
+#define RKCIF_MIPI_CTRL0_TYPE_YUV400   RKCIF_MIPI_CTRL0_TYPE(0x6)
+#define RKCIF_MIPI_CTRL0_CAP_EN	       BIT(0)
+
+#define RKCIF_MIPI_INT_FRAME0_END(id)  BIT(8 + (id) * 2 + 0)
+#define RKCIF_MIPI_INT_FRAME1_END(id)  BIT(8 + (id) * 2 + 1)
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
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
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
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RGB888,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,
+		.mbus_code = MEDIA_BUS_FMT_BGR888_1X24,
+		.depth = 24,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RGB888,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RGB888,
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
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR10P,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG10P,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG10P,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB10P,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR12P,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG12P,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG12P,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB12P,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
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
+const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
+	.mipi_num = 1,
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
+	/* TODO there may be different factors and/or alignment constraints */
+	vlw = ALIGN(width * 2, 8);
+
+	ctrl0 |= active_out_fmt->mipi.dt << 10;
+	ctrl0 |= active_out_fmt->mipi.ctrl0_val;
+	ctrl0 |= RKCIF_MIPI_CTRL0_CROP_EN;
+	ctrl0 |= RKCIF_MIPI_CTRL0_CAP_EN;
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
 irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 {
+	struct device *dev = ctx;
+	struct rkcif_device *rkcif = dev_get_drvdata(dev);
 	irqreturn_t ret = IRQ_NONE;
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
+				rkcif_stream_pingpong(stream);
+				ret = IRQ_HANDLED;
+			}
+		}
+	}
 
 	return ret;
 }
 
 int rkcif_mipi_register(struct rkcif_device *rkcif)
 {
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
 	return 0;
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
 }
 
 void rkcif_mipi_unregister(struct rkcif_device *rkcif)
 {
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
 }
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
index ee1a50a59505..1248af70bdab 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
@@ -11,6 +11,8 @@
 
 #include "rkcif-common.h"
 
+extern const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data;
+
 int rkcif_mipi_register(struct rkcif_device *rkcif);
 
 void rkcif_mipi_unregister(struct rkcif_device *rkcif);
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 5e7bff585bca..3184aae8bc11 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -93,9 +93,14 @@ struct rkcif_output_fmt {
 	u32 fourcc;
 	u32 mbus_code;
 	u8 cplanes;
+	u8 depth;
 
 	union {
 		u32 dvp_fmt_val;
+		struct {
+			u8 dt;
+			u32 ctrl0_val;
+		} mipi;
 	};
 };
 
@@ -183,6 +188,16 @@ struct rkcif_interface {
 	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
 };
 
+struct rkcif_mipi_match_data {
+	unsigned int mipi_num;
+	unsigned int regs[RKCIF_MIPI_REGISTER_MAX];
+	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
+
+	struct {
+		unsigned int offset;
+	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];
+};
+
 struct rkcif_dvp_match_data {
 	const struct rkcif_input_fmt *in_fmts;
 	unsigned int in_fmts_num;
@@ -198,6 +213,7 @@ struct rkcif_match_data {
 	const char *const *clks;
 	unsigned int clks_num;
 	const struct rkcif_dvp_match_data *dvp;
+	const struct rkcif_mipi_match_data *mipi;
 };
 
 struct rkcif_device {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index b9463d135451..d857c4a5b5db 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -49,6 +49,7 @@ static const struct rkcif_match_data rk3568_vicap_match_data = {
 	.clks = rk3568_vicap_clks,
 	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
 	.dvp = &rkcif_rk3568_vicap_dvp_match_data,
+	.mipi = &rkcif_rk3568_vicap_mipi_match_data,
 };
 
 static const struct of_device_id rkcif_plat_of_match[] = {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index 45a232ea96e3..ef07759604a7 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -188,8 +188,10 @@ static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
 		stream = &interface->streams[RKCIF_ID0];
 		rkcif_interface_apply_crop(stream, state);
 	} else {
-		/* TODO implement for MIPI */
-		return -EOPNOTSUPP;
+		for_each_active_route(&state->routing, route) {
+			stream = &interface->streams[route->sink_stream];
+			rkcif_interface_apply_crop(stream, state);
+		}
 	}
 
 	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
index 07fd64174e80..3d1f0c45c638 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -30,7 +30,29 @@ enum rkcif_dvp_register_index {
 	RKCIF_DVP_REGISTER_MAX
 };
 
-#define RKCIF_REGISTER_NOTSUPPORTED           0x420000
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
+#define RKCIF_REGISTER_NOTSUPPORTED	       0x420000
 
 #define RKCIF_FETCH_Y(VAL)		       ((VAL) & 0x1fff)
 

-- 
2.39.5



