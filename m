Return-Path: <linux-media+bounces-29868-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C022CA839DA
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 639877B184D
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B1220B208;
	Thu, 10 Apr 2025 06:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UR+56h7r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F84A20468C;
	Thu, 10 Apr 2025 06:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267811; cv=none; b=jgin0lyJXcQ7vadbZTy8rE19naolKSlapww26iqSGbmim0OsIwcIbnNOmjFsjIHdHntvMe74fa2E3OulDSon51p/tAxxqMCaXH0OhUQf6eld7+DQiGGFGTR0A8L69mFmYw4mJ57bXcyBQLKpq2F+Q2us3tZW/RHSDrlEEuIdxfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267811; c=relaxed/simple;
	bh=7CSFEhqIHstgVCRXuQHhQ+VWZRZj5jqLoBJkK2Okah8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSEo+o0yBlrya6yd+im/gye4jk1bgS+kZdm2iVJ3s6sbbxBxUXRm/7Vr4/In1texQoPWy0zg3bsTfOH2XBIjDR4BhtgmQvJ9BaeKu9/smVAvjLrat/uTa06uD30RWdMJvyXiTiScDMrKekchNBxE+dqce7G5G/UvwpyACibGrQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UR+56h7r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:389d:1fcb:c0f8:ff7c:208d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73C03EE4;
	Thu, 10 Apr 2025 08:48:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744267690;
	bh=7CSFEhqIHstgVCRXuQHhQ+VWZRZj5jqLoBJkK2Okah8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UR+56h7rhH8+fhJhEPkLqIODKYRxxYgW6SZb5IdZoPT/Kaj8CaRdbfwtB0crQqZZk
	 qnAdYUBmDl5JO1L89QhvTlD1Uw7hWHVjlJ4l+SOiYjx0aF12ZpxmEju7ogV9Sufuo6
	 L4e1Co/8SJI6d8PdiO4ZPWsHys5S3uegY3XxRRGc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 10 Apr 2025 12:19:04 +0530
Subject: [PATCH v2 6/6] media: ti: j721e-csi2rx: Support multiple pixels
 per clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-probe_fixes-v2-6-801bc6eebdea@ideasonboard.com>
References: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
In-Reply-To: <20250410-probe_fixes-v2-0-801bc6eebdea@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
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
 bh=7CSFEhqIHstgVCRXuQHhQ+VWZRZj5jqLoBJkK2Okah8=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBn92n4e+A2woCaYzS+8DXrNCUMIX+adStKKofAU
 oOAZmp0AV2JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ/dp+AAKCRBD3pH5JJpx
 RRwID/9l5jxEg97SGAnZgGLD1cphoYNc7Jgsj5vOzmJ9bKAumn9sobr7Ty7cNttm6951TmeDDUf
 5RSoZGpNNA+T+pV11VQWjVdRJYmUv3oXZ6jdhRNKsN/pkBZETrL+sncpFyV4a+9aMWdyBwR7CED
 CEfr+lbH2d+Q0oQIlNEYGZ9GrTGxTBcYIBJ9Kp7Y0nK28yZx9gire816DK1x1VKZL1Z5NjleWqo
 MbePTqwveWK1vYOwNgz7cQEcxaajQ90nvXVTgX6FVJ4Lk77tHBoaUVjLaQeHG0zO7jKAcXcN52o
 snQaxpQ8eoxlkASOsrqfG3fcBBW3JI6LWUco7at/rbawO3hw00MSd6HD/hCVeYaS3bAezYpNM8y
 KYjZjhEd2JJD6+RQS1vjPYSzXhvzBAvKuCEY0b094eNGIZWnCHPBIrmoI0swWavfFmXvYuknD04
 i5oaeYb0hyaWbkYpT3TmE8O82UENr4KfUMI1Vmc3pRFViAWVcAGvQBoVlq0epkYNtlATSyRCuLb
 HKetun0QD2UMrRSyOL6Mh+frMJ2tCBRJ6ZCFdI2uYJ8UQi7fuS9/qkPnmcgUYQrnArC4PkCKsR1
 NG2ZxeNEboj1HgHtn2seZ8EZCo4Z3YDd/IwwBm8D5IC/tIt15r/QN1E5BsZ65wgptg4mqh6A9WW
 IWuD5FUgKZZ5Vog==
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
2.49.0


