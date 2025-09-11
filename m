Return-Path: <linux-media+bounces-42293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C199AB52E73
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2C65A317C
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462C831AF37;
	Thu, 11 Sep 2025 10:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vBzqT9mr"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC43311C3A;
	Thu, 11 Sep 2025 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757586570; cv=none; b=LpYmvT0iQwfqFMa1Hz0JdzEdFUX1zglMoTFsCbTrAxEUnxEg70hTaUgCUxk9rdoikIC7zFXbvgdi0WdIbrUV6CNkyB6Lc7uhfdqx7wPh/s3B4fjzf+2BbXK870Ucxf4RG7B/d/607gNQXk1hyeUw8t/Qx2mdf35WwOG8G9uZ4TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757586570; c=relaxed/simple;
	bh=XnAZE6IeX151MbjFZsOgoOS0+nCuykW6OwA11tZpFec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Poozu9+2z7BFFqd/W5QkV1sL8COKwl/mbzTc7HyoXtGz2kwKfhKJledeCRs0RazIXsUogRC9dXDHfMBsa9CWbRYHyPmN1Vwn/oXZUwsbr1cJVFNW1fhuTEoe5JlmMpCUOedG+cEqYuV2AFUZ/gLLiM5xhe6ZFgBhEGWTsCp5kkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vBzqT9mr; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BAT9YA355630;
	Thu, 11 Sep 2025 05:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757586549;
	bh=hugnmRhbAhe5gKaTh5n7T4s8DmNru4ibMfeL5G2FbAY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vBzqT9mrUt/XCZTEVU8omhbEaMOqkMG9ncjErgD1bYt3J8i7bV0phQjC0FFmWHzBD
	 crc5Rn7ps7Bkdk6xtX6Sl2v+XSZl3/neyoEW5usuE2HNt6WQD8mENmEFws7A4LbFYm
	 Y4f1lZ9cOUH65kcIKitcgVUXhl+ZdFWJDUhesV34=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BAT9Zn1875627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 05:29:09 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 05:29:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 05:29:08 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BASXbi1985821;
	Thu, 11 Sep 2025 05:29:02 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
        <hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 04/16] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
Date: Thu, 11 Sep 2025 15:58:20 +0530
Message-ID: <20250911102832.1583440-5-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911102832.1583440-1-r-donadkar@ti.com>
References: <20250911102832.1583440-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Pratyush Yadav <p.yadav@ti.com>

Currently the SHIM code to configure the context only touches the first
context. Add support for writing to the context's registers based on the
context index.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 25d905be1728..d4e6d6b5b2f7 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -27,7 +27,7 @@
 #define SHIM_CNTL			0x10
 #define SHIM_CNTL_PIX_RST		BIT(0)
 
-#define SHIM_DMACNTX			0x20
+#define SHIM_DMACNTX(i)			(0x20 + ((i) * 0x20))
 #define SHIM_DMACNTX_EN			BIT(31)
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
@@ -38,7 +38,7 @@
 #define SHIM_DMACNTX_SIZE_16		1
 #define SHIM_DMACNTX_SIZE_32		2
 
-#define SHIM_PSI_CFG0			0x24
+#define SHIM_PSI_CFG0(i)		(0x24 + ((i) * 0x20))
 #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
@@ -569,11 +569,13 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 		break;
 	}
 
-	writel(reg, csi->shim + SHIM_DMACNTX);
+	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
+
+	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
 	      FIELD_PREP(SHIM_PSI_CFG0_DST_TAG, 0);
-	writel(reg, csi->shim + SHIM_PSI_CFG0);
+	writel(reg, csi->shim + SHIM_PSI_CFG0(ctx->idx));
 }
 
 static void ti_csi2rx_drain_callback(void *param)
@@ -891,7 +893,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -906,7 +908,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	video_device_pipeline_stop(&ctx->vdev);
 
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
 	if (ret)
-- 
2.34.1


