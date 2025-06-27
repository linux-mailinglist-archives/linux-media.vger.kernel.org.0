Return-Path: <linux-media+bounces-36061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5020EAEAC3A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 03:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38DD61BC2D9A
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 01:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965401A23AC;
	Fri, 27 Jun 2025 01:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="auejeBC3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6946D19EEC2;
	Fri, 27 Jun 2025 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750986442; cv=none; b=uVqvzsLfvFRJIytrEtJy0piyM06tPVbrrCMxqimiX2I7cI/0q3mY/icJxEefu9r2sProje9FAGquGumr0lcWrRUCRG18qzt1X7RLPMJZYS6zkSQcXIML8y4efi6c/7SwAwmV0NVuQCLA0tSjs3K1RjqXasRVbqYk3jRdpV1dTQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750986442; c=relaxed/simple;
	bh=4R5N0PI9UZQ+i5uRNE5ZyANWHo+7XVAg9OA23ozkzKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlWvdyeqTTJsZjnkyqIeZXx0aM+Z2GIRJqtWVHTmOItKyTuCFK1C6hOe60pAlKOFJhh6I6vZseUGfAMV7yqWD9OIZLmIIFNUsYVzKjDISqkT51humOU1/60015Q53sfgYZDgA4TtmNd7c8cHn2rRG6jnnIl5QWy4B9Pyd501LDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=auejeBC3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2601:602:8100:c320::cf66])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8429F73B;
	Fri, 27 Jun 2025 03:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750986420;
	bh=4R5N0PI9UZQ+i5uRNE5ZyANWHo+7XVAg9OA23ozkzKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=auejeBC3u36fR/u0LkcvYWtPZTG444ezhupvCjyCj1MyUsrD0XWHnyigdXbK9twQN
	 vPe+rUPFe4IGtCMB+xiMCsvfzyGRHTHftAPHz8czlgP3wP4EO9awhL6f9HvZducqsO
	 mp4GfIlQ8O3kTtCtCy2IqkJRC00ITOLZ6R9pa2L8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 26 Jun 2025 18:06:11 -0700
Subject: [PATCH v3 6/6] media: ti: j721e-csi2rx: Support multiple pixels
 per clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-probe_fixes-v3-6-83e735ae466e@ideasonboard.com>
References: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
In-Reply-To: <20250626-probe_fixes-v3-0-83e735ae466e@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, Vaishnav Achath <vaishnav.a@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4928;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=4R5N0PI9UZQ+i5uRNE5ZyANWHo+7XVAg9OA23ozkzKo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBoXe6nJj1oSx/xQSv/wwhSJ+up+dnzR5GoQgGea
 pJCkFLtr5+JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaF3upwAKCRBD3pH5JJpx
 RdbFD/98cQ60vXxhfilhRUXSw6SCz0tl+TPyWRJtN3NRPVLi08FRdq+wWhp2xChmRqoDedp5HyH
 yV+WpkdgvMmIy/9m652AeZk3bKOBKWaFf8/iO8bgisQpC1CCFj3Se9GEcKd7oTOO2IPhDNbIpXA
 ovxKufnZnrFY+k9icBaYFiCcW23ca6tlKttAAMHbCbxUFs1b//rNlo9uxPQTEeOkN+Dlh65eol5
 QaiIUNSF15j551IbSPAbSZp6fPsZaZTEmxjP/7NpAT8XoLEGKMZk4vuHO5PFwioarvXZIUPVDX7
 oVFag/6hbACkHIp972ZG3WSle3xcRoL6xabDlaCmm+98MBWthw6h4nJp5SwZQ1JTxCgED1IjGtN
 /ENTB5pbN/zUQxefGfVQWG72VtJo42xhamavOYFvAaZQrR5gBpXv0JtgyFskNk8WJnYvlK1lIxD
 1+tSnb59f+UEW84LGlGP+8Xje/b49HtBqnWxnfaNaR+wCGRzMi6bp91xBoWMwQcCN+oN2r49NN8
 DHl2ALUVWgUsZWaVq3WwCq8H+kWmL8D14rUFirg+SQANlW7LzGT8V09wx7jO7OA9ORkbpd0oAHP
 /h12W+EhP9zUvvcES62YOpj8azW6Y3voHfXNyS7Ei6/leIUaFjVFCfbuLOGe2HnB/XM6ObTtIJN
 WXNb+94t71mPqPw==
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
index ad51d033b6725426550578bdac1bae8443458f13..c710c8c5ca2fd6b296443612af96f8640a37c552 100644
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
2.49.0


