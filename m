Return-Path: <linux-media+bounces-28634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8CEA6D9C6
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 13:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DC8B3B3D02
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A87B25F79D;
	Mon, 24 Mar 2025 12:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GXz63yTZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5423325F792;
	Mon, 24 Mar 2025 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742817753; cv=none; b=ZYvyDzChsNUYVa9ZKI2BrSOcMMhNeMIn6484Y2ktiGzOAseVfk37RX1GLi9LmxCWuJXe21CpZo4LJkqcnkVP9PQjZe93AWKjzpJIZ/M0OxwRr6EUCN8F2Ub3aIMSE6+OYmpOlDDRHAStKj4ADtODxplAMpxP/ig/eWYcmzrRqaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742817753; c=relaxed/simple;
	bh=nO06MvROhvIV3lyFBXov2VZJkg+K/7hCEqnCnTBzYNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfzpgfuaLn0IcI1p63IIKN5W0xrk8toNXgMyUveo6JclCYPaT3vNpQ/qwnMkbaXSyMrrmgHmhLizFM/6EBQUe2kakgVCV3ZQ4ZtB8obm719D+sflFdhmcposPorud+qNPr0cJHTeCYZheE55DzH9kGHc5/G0BTlnmcxtjGMHpjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GXz63yTZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:904a:b2d:8d57:4705:738e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41FBC455;
	Mon, 24 Mar 2025 13:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742817643;
	bh=nO06MvROhvIV3lyFBXov2VZJkg+K/7hCEqnCnTBzYNs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GXz63yTZXs8/RmudswsztHLBHZ6k+F/IZ6bnpRyvGP+YpPtCs9jCyiLFHntN9v87Z
	 ADJCN4PLaJ34zrlSIIvUYaBcDgxz9RWefGTJDr20UccRnKyMN/sggki7kxnH2iUPwD
	 1D4fqBtBKEjKIWbTS6BOVUdirVs5jCRE+ZX0zMas=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 24 Mar 2025 17:31:42 +0530
Subject: [PATCH 6/6] media: ti: j721e-csi2rx: Support multiple pixels per
 clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-probe_fixes-v1-6-5cd5b9e1cfac@ideasonboard.com>
References: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
In-Reply-To: <20250324-probe_fixes-v1-0-5cd5b9e1cfac@ideasonboard.com>
To: Jai Luthra <jai.luthra@linux.dev>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4663;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=nO06MvROhvIV3lyFBXov2VZJkg+K/7hCEqnCnTBzYNs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn4UmxLsOaLPaSUUSuhk7UqYZayUE5U28kB1LgO
 SMEyARVhSKJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ+FJsQAKCRBD3pH5JJpx
 RTggEADFqq7N5lTqSTGKpKCTkaPDfWwUqwUD05/SnJkGDOchOGoX3kh4wAgywf3W5GzH/chSeDt
 mBUlRNp7hERCtUs3DgjsET6an9ZLI06hzdk6twtn+EYEaf6DFEHTu2u8orNU+EbTpdg9nTaKZod
 8eo9HrA582Cs8Cs+OgawXeEAtZSiaFnRTJldlPe3li2VnkGXvuvMYdlIOGRLHfuC6OZEP/Zfw9Q
 g6xFgDPcjM9ojST10cOgNPsidAeL6SmfarH+1CSEYJpbMLN+hXSV9MriFN7P7Papf5q2sk+ALZA
 SP52o6Dws1BBUzQlo68kysNiyGO2mDS0tvjT62whp5jryfu4s+8zvZMlC6bY4R81M1qjP+glxuc
 /t2vR/tgvQp99rlx6oJlQ3nn4Hqqcz0689BzUXawgynMQ5hzPzNtGdOygros6OLfuLkNJKKU3Ss
 kdovkYBUUrHAkkP5qCBXoE2P3w1wVNvkbtm9b18OdGQYC2RiXrS9Hkfsst4MQ+c4ssVg0Lk7k02
 H2RedjRZRf3u34Cudx444ALSzKf7VWdwJs5fLqDpjBgRpKeTosLksIVyfF60euwaiIP0aSbZGH6
 UqxFPMrR5pL1zGo5v4Zn+hevvAA9o9jIj49/le4lfiSf0F6I+u9ZV6xWiQQpubDdfk1aDhya6yY
 OUDKWLOygVZDnSQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add support for negotiating the highest possible pixel mode (from
single, dual, quad) with the Cadence CSI2RX bridge. This is required to
drain the Cadence stream FIFOs without overflowing when the source is
operating at a high link-frequency [1].

Also, update the Kconfig as this introduces a hard build-time dependency
on the Cadence CSI2RX driver, even for a COMPILE_TEST.

[1] Section 12.6.1.4.8.14 CSI_RX_IF Programming Restrictions of AM62 TRM

Link: https://www.ti.com/lit/pdf/spruj16
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/Kconfig                  |  3 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 38 ++++++++++++++++++++--
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index bab998c4179aca3b07372782b9be7de340cb8d45..3bc4aa35887e6edc9fa8749d9956a67714c59001 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -67,7 +67,8 @@ config VIDEO_TI_J721E_CSI2RX
 	tristate "TI J721E CSI2RX wrapper layer driver"
 	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
 	depends on MEDIA_SUPPORT && MEDIA_CONTROLLER
-	depends on (PHY_CADENCE_DPHY_RX && VIDEO_CADENCE_CSI2RX) || COMPILE_TEST
+	depends on VIDEO_CADENCE_CSI2RX
+	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
 	depends on ARCH_K3 || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index ad51d033b6725426550578bdac1bae8443458f13..425324c3d6802cfda79d116d3967b61a2e7a015a 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -21,6 +21,8 @@
 #include <media/v4l2-mc.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "../../cadence/cdns-csi2rx.h"
+
 #define TI_CSI2RX_MODULE_NAME		"j721e-csi2rx"
 
 #define SHIM_CNTL			0x10
@@ -29,6 +31,7 @@
 #define SHIM_DMACNTX			0x20
 #define SHIM_DMACNTX_EN			BIT(31)
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
+#define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
 #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
 #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
 #define SHIM_DMACNTX_YUV422_MODE_11	3
@@ -40,6 +43,7 @@
 #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
+#define TI_CSI2RX_MAX_PIX_PER_CLK	4
 #define PSIL_WORD_SIZE_BYTES		16
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
@@ -110,6 +114,7 @@ struct ti_csi2rx_dev {
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
 	u32				sequence;
+	u8				pix_per_clk;
 };
 
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
@@ -485,6 +490,26 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
 	return 0;
 }
 
+/* Request maximum possible pixels per clock from the bridge */
+static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
+{
+	struct media_pad *pad;
+	int ret;
+	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;
+
+	pad = media_entity_remote_source_pad_unique(&csi->vdev.entity);
+	if (!pad)
+		return;
+
+	ret = cdns_csi2rx_negotiate_ppc(csi->source, pad->index, &ppc);
+	if (ret) {
+		dev_warn(csi->dev, "NUM_PIXELS negotiation failed: %d\n", ret);
+		csi->pix_per_clk = 1;
+	} else {
+		csi->pix_per_clk = ppc;
+	}
+}
+
 static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
 {
 	const struct ti_csi2rx_fmt *fmt;
@@ -496,6 +521,9 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
 	reg = SHIM_CNTL_PIX_RST;
 	writel(reg, csi->shim + SHIM_CNTL);
 
+	/* Negotiate pixel count from the source */
+	ti_csi2rx_request_max_ppc(csi);
+
 	reg = SHIM_DMACNTX_EN;
 	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
 
@@ -524,14 +552,18 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
 	case V4L2_PIX_FMT_YVYU:
 		reg |= FIELD_PREP(SHIM_DMACNTX_YUV422,
 				  SHIM_DMACNTX_YUV422_MODE_11);
+		/* Multiple pixels are handled differently for packed YUV */
+		if (csi->pix_per_clk == 2)
+			reg |= SHIM_DMACNTX_DUAL_PCK_CFG;
+		reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
 		break;
 	default:
-		/* Ignore if not YUV 4:2:2 */
+		/* By default we change the shift size for multiple pixels */
+		reg |= FIELD_PREP(SHIM_DMACNTX_SIZE,
+				  fmt->size + (csi->pix_per_clk >> 1));
 		break;
 	}
 
-	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
-
 	writel(reg, csi->shim + SHIM_DMACNTX);
 
 	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |

-- 
2.48.1


