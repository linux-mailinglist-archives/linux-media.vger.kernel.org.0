Return-Path: <linux-media+bounces-39413-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54627B201B4
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FE591672BC
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541112DCBE2;
	Mon, 11 Aug 2025 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LrwlnojY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E592DAFDE;
	Mon, 11 Aug 2025 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900540; cv=none; b=CbhTb2dcDEKUq9YtJ3VF/5kvoG5Jfadg6jg2n6s8BRlOoFnW6QKl5wpB1jpvo430V1WfCXc2A97yJi1WiTFLLCKM1nttwFjYsg4SiTO3AvwzqOvtZAOE2anaw4ItsNKTmIO4gqVRebvxQS5DROwqCTqNnqfAwK+Cgt/cQaJZIG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900540; c=relaxed/simple;
	bh=hGcQZ2d756xgNKBAlc/ruGO39a1ClaXWjzXopLbReqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2HyWZkarohK1AUbJmPSnObZJ67CEQuANSPB4K/hmH5sOLz9X5ZyssCSTbL+SIRaYWflVKz39/Xjx9C/fSRaU8WtGtQ3Pgd+b2ccWTAT+L47NkvhZTIZIYqFDNUeRew6OjXHPNScxwnLjerYv9BTwTyzjUuS/x5lQjqoH/E2dZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LrwlnojY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.143])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADD6E82A;
	Mon, 11 Aug 2025 10:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754900483;
	bh=hGcQZ2d756xgNKBAlc/ruGO39a1ClaXWjzXopLbReqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LrwlnojYOFQR6GkJKAYOU86vUdSLKq3zzvqrtWuUzDHpJVf1gcraSrz++ye0Or93u
	 D1y2s0mBJKtIdxDpSsSrQWzQkSBii/Vdj9kDeK2SkOqksbFn1ujixmyW1UzL6RUgsO
	 SOjXMRkwYJ6nB5/mqGVEwchO4yHiiBR03bTvaMWw=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 11 Aug 2025 13:50:18 +0530
Subject: [PATCH v4 6/6] media: ti: j721e-csi2rx: Support multiple pixels
 per clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-probe_fixes-v4-6-aae22290f1d0@ideasonboard.com>
References: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
In-Reply-To: <20250811-probe_fixes-v4-0-aae22290f1d0@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4928;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=hGcQZ2d756xgNKBAlc/ruGO39a1ClaXWjzXopLbReqI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBomafWbvrY9DaZDB00CbqZd4w6C4bz8FeZrPEJQ
 j90iDyj2JGJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaJmn1gAKCRBD3pH5JJpx
 RW70D/wJa5scURKc0l2ViG82LbGhdfW0kup74dKWlzmwkri2QgTIdRL2KMTWjT5ScASfCYUktYK
 4GRQ63bFwYjCA2mhqXMKFIhUfQ2xb2TPWzEf2NljVT99Q4cAiVidSjA0BzoRFuvAiEU0cBcfq/0
 XYIXtBmmsHobpNr0hCAP8zF3j4KsBu2gx1LjYqFxREpexYN9G3JYCZyHHuruIV1uO01xtAiYg/3
 Y7Ocii/1SjWXK36Jv11Au+091vZuWc0L7/ex04quk+pl2LApi2CVse83UchN3wSG96YC5fVCcLO
 Hf4YFR5jmvAPg3w2I2KcL3YAuBj56hhAOB03lmjrD7+kOe8U+8uwKmO+ccUtpkoWA0nSLmb3tG0
 20YwLdyK30F0zWw4EQstwBLrfVArmvndLP/7+2+CJN7A2wI7+nsbIG09kDsq4XVBDC8g7Gclx8Y
 QZQRNQQNxQE8QWJp0cNCQbjM09T5KaPvjWK9FerWJ5ueuMvGQUuutFeQb06Sarzcfrs9pDvBiJv
 Cz4GY2EMGCw/jelp+16MXqz6xz9UtYL8l5svbQEq5ZTCanqGatSvkvXsQ/V32sIMLij296b6yVy
 CzwBqXI4ehiBUrx1d0f9R6sklVvG8q7eKxGBk0zjwQGqugJsAjvN7FP37QFPzaMYcBRxEny6DiR
 G067sk0mm1NyNcw==
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
Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com> (on SK-AM68)
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Reorder declarations in ti_csi2rx_request_max_ppc to be reverse
  christmas tree
- Include cdns-csi2rx.h from its new location at include/media/cadence
---
 drivers/media/platform/ti/Kconfig                  |  3 +-
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 37 ++++++++++++++++++++--
 2 files changed, 36 insertions(+), 4 deletions(-)

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
index 09e5618de7dd0cdd5bf42083804ff7ca53f0973b..b5980778183944217a03d23075a0bcef4c424f90 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
+#include <media/cadence/cdns-csi2rx.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -29,6 +30,7 @@
 #define SHIM_DMACNTX			0x20
 #define SHIM_DMACNTX_EN			BIT(31)
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
+#define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
 #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
 #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
 #define SHIM_DMACNTX_YUV422_MODE_11	3
@@ -40,6 +42,7 @@
 #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
+#define TI_CSI2RX_MAX_PIX_PER_CLK	4
 #define PSIL_WORD_SIZE_BYTES		16
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
@@ -110,6 +113,7 @@ struct ti_csi2rx_dev {
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
 	u32				sequence;
+	u8				pix_per_clk;
 };
 
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
@@ -485,6 +489,26 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
 	return 0;
 }
 
+/* Request maximum possible pixels per clock from the bridge */
+static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
+{
+	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;
+	struct media_pad *pad;
+	int ret;
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
@@ -496,6 +520,9 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
 	reg = SHIM_CNTL_PIX_RST;
 	writel(reg, csi->shim + SHIM_CNTL);
 
+	/* Negotiate pixel count from the source */
+	ti_csi2rx_request_max_ppc(csi);
+
 	reg = SHIM_DMACNTX_EN;
 	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
 
@@ -524,14 +551,18 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_dev *csi)
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
2.50.1


