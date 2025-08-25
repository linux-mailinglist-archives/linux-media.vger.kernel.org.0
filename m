Return-Path: <linux-media+bounces-41032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 913E5B343E7
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 16:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 395A71882953
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 14:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BF4278771;
	Mon, 25 Aug 2025 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uZVejJZA"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8122FC88C;
	Mon, 25 Aug 2025 14:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132035; cv=none; b=Ym8vYgoQDgS5uwvx4Bk0MH7Lsfk1ClWoemjwPJchHOE6vMzJIgJKB0qcoUBzlpaYL66C3I8c7yBpNFQEQC5Kqd0f0dJ0Nu7qo/ply6jbwQIWm2CVeERo2QLSgewkazmMD1AHcltJ1jUCgLuSHbsn4aHbq9fgqn9Y/+/YVVis+u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132035; c=relaxed/simple;
	bh=wnEwoAwOmaC9EtbLu07y6gkfUzdalMCzS41u8HyyAeQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HN+pK6JL+NU9wFnSGHmLelHS1eQ8Lt0+0Cf2R/sMIIBD5yWcOCPVLC1wFoDekzc1P29/6wFQSffa2zXmq8IrNsMQhof0IyC6GqeFn9/QT55s5Q2RYcN/buiL3dKhgA0fJMa9UvCdMumWs08MzKSeB2p367hBSl39wPAPSbHknSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uZVejJZA; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57PEQuuY1294958;
	Mon, 25 Aug 2025 09:26:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756132016;
	bh=h1zyU1evSKaxO4aYTSyZWEjNsFhfpDLHeNtlMXX9zq4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uZVejJZAuewUM17JPFF3XXEXpfhxX/ahO7M27zMyf9xVLZ8py8ftE3iMQnC+qN89F
	 66gxbjZe1aYjpSTNw/YzCXfC50n8D+r4RDFlCPXdlWOgTvK/cAV69vea6pV1zwf5AS
	 6jnwuV0z8wBDotk+Tkf2j93ByeJpZ2KxmC4IbPis=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57PEQu8n1236002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 25 Aug 2025 09:26:56 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 25
 Aug 2025 09:26:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 25 Aug 2025 09:26:55 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57PEPN433747540;
	Mon, 25 Aug 2025 09:26:50 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <s-jain1@ti.com>, <vigneshr@ti.com>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v5 14/14] media: ti: j721e-csi2rx: Wait for the last drain completion
Date: Mon, 25 Aug 2025 19:55:22 +0530
Message-ID: <20250825142522.1826188-15-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825142522.1826188-1-r-donadkar@ti.com>
References: <20250825142522.1826188-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

dmaengine_terminate_sync() causes all activity for the DMA channel to be
stopped, and may discard data in the DMA FIFO which hasn't been fully
transferred. No callback functions will be called for any
incomplete transfers[1].

In multistream use case, calling dmaengine_terminate_sync() immediately
after issuing the last drain transaction will result in no callback
for the last drain cycle.

Implement complete callback for the last drain cycle to make sure that
the last drain has completed properly, this will ensure that stale data
is not left out in the HW FIFO.

[1] : https://docs.kernel.org/driver-api/dmaengine/client.html

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4ac6a76b9409..520ee05eb5b4 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -62,6 +62,7 @@
 #define TI_CSI2RX_MAX_PADS		(1 + TI_CSI2RX_MAX_SOURCE_PADS)
 
 #define DRAIN_BUFFER_SIZE		SZ_32K
+#define DRAIN_TIMEOUT_MS		50
 
 #define CSI2RX_BRIDGE_SOURCE_PAD	1
 
@@ -137,6 +138,7 @@ struct ti_csi2rx_dev {
 		size_t			len;
 	} drain;
 	bool				vc_cached;
+	struct completion drain_complete;
 };
 
 static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
@@ -624,12 +626,14 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 static void ti_csi2rx_drain_callback(void *param)
 {
 	struct ti_csi2rx_ctx *ctx = param;
+	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	unsigned long flags;
 
 	spin_lock_irqsave(&dma->lock, flags);
 
 	if (dma->state == TI_CSI2RX_DMA_STOPPED) {
+		complete(&csi->drain_complete);
 		spin_unlock_irqrestore(&dma->lock, flags);
 		return;
 	}
@@ -774,6 +778,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dma *dma = &ctx->dma;
+	struct ti_csi2rx_dev *csi = ctx->csi;
 	enum ti_csi2rx_dma_state state;
 	unsigned long flags;
 	int ret;
@@ -783,6 +788,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 	dma->state = TI_CSI2RX_DMA_STOPPED;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
+	init_completion(&csi->drain_complete);
+
 	if (state != TI_CSI2RX_DMA_STOPPED) {
 		/*
 		 * Normal DMA termination does not clean up pending data on
@@ -796,6 +803,10 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 				 "Failed to drain DMA. Next frame might be bogus\n");
 	}
 
+	if (!wait_for_completion_timeout(&csi->drain_complete,
+					 msecs_to_jiffies(DRAIN_TIMEOUT_MS)))
+		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
+
 	ret = dmaengine_terminate_sync(ctx->dma.chan);
 	if (ret)
 		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
-- 
2.34.1


