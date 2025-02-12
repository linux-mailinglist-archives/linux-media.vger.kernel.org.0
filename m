Return-Path: <linux-media+bounces-26067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 936A7A326B1
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 14:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A33723A89E3
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 13:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064E220E6E1;
	Wed, 12 Feb 2025 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lRCFt0op"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B907F20E039;
	Wed, 12 Feb 2025 13:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739365999; cv=none; b=ZWyJHJxdYVh0Rb6TNXMWCVstFztuNvERl9/o20aKzWyKgRRpWvGLaV8WEm6l8/Y3aZKaWYVtuD3qK9kn63Of3zmXeD4cFbSvRRhb6AVE7SsYUkdgVDRI+GAybdum6OBIyO8g+GKAQr+DQU68vodxSs0cIcKzHEJzQ4nQpUgLwMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739365999; c=relaxed/simple;
	bh=c5kVf6ROqG/zA/loWHZz3zG4vqEzYAocgq4dVrS2kOQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JFmEtSVbFL8XA549L18zBOYUwLE0fEhaPyMnQYrfnYSeyRY2KO0S1ce9V/HqAjNSf4S/pqJEWFMuDgourZ4vckQ9JnKHLAZ82jv9EVO6wzsNvtEernlzyHDytLv+wgrRttcg+fDb5y6Q9l6BdOoy96agd9uFafAPirleftPUdRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lRCFt0op; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51CDD2qZ438191
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Feb 2025 07:13:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739365982;
	bh=y8+KvLaYzKLmWmPQWHCI60sp1mZy/3QI6wBKKBEJO18=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lRCFt0opZVBaWyM2Y4CltxgsHahDGBorD9tqdsb1+GIEvAaCBhCTG+Cdjt4gSg4Fm
	 tR+n263NGwTBbzY57eT09+9M9Qng3HdehQnOOGjm8FEX+iU3GvdpB+rPLjt+g2Tk2k
	 MRducMrJqza0tr6rqeCY+u7jAzp4OH1Lf9jxrchw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CDD2TA090288;
	Wed, 12 Feb 2025 07:13:02 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Feb 2025 07:13:01 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Feb 2025 07:13:01 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51CDCkON050929;
	Wed, 12 Feb 2025 07:12:58 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [RFC PATCH 2/3] media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add support for VIDIOC_LOG_STATUS
Date: Wed, 12 Feb 2025 18:42:43 +0530
Message-ID: <20250212131244.1397722-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
References: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Enable the csi2rx_err_irq interrupt to record any errors during streaming
and also add support for VIDIOC_LOG_STATUS ioctl. The VIDIOC_LOG_STATUS
ioctl can be invoked from user space to retrieve the device status,
including details about any errors.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 104 ++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 4d64df829e75..b3d76f0678fa 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -57,6 +57,28 @@
 #define CSI2RX_LANES_MAX	4
 #define CSI2RX_STREAMS_MAX	4
 
+#define CSI2RX_ERROR_IRQS_REG			0x28
+#define CSI2RX_ERROR_IRQS_MASK_REG		0x2C
+
+#define CSI2RX_STREAM3_FIFO_OVERFLOW_IRQ	BIT(19)
+#define CSI2RX_STREAM2_FIFO_OVERFLOW_IRQ	BIT(18)
+#define CSI2RX_STREAM1_FIFO_OVERFLOW_IRQ	BIT(17)
+#define CSI2RX_STREAM0_FIFO_OVERFLOW_IRQ	BIT(16)
+#define CSI2RX_FRONT_TRUNC_HDR_IRQ		BIT(12)
+#define CSI2RX_PROT_TRUNCATED_PACKET_IRQ	BIT(11)
+#define CSI2RX_FRONT_LP_NO_PAYLOAD_IRQ		BIT(10)
+#define CSI2RX_SP_INVALID_RCVD_IRQ		BIT(9)
+#define CSI2RX_DATA_ID_IRQ			BIT(7)
+#define CSI2RX_HEADER_CORRECTED_ECC_IRQ	BIT(6)
+#define CSI2RX_HEADER_ECC_IRQ			BIT(5)
+#define CSI2RX_PAYLOAD_CRC_IRQ			BIT(4)
+
+#define CSI2RX_ECC_ERRORS		GENMASK(7, 4)
+#define CSI2RX_PACKET_ERRORS		GENMASK(12, 9)
+#define CSI2RX_STREAM_ERRORS		GENMASK(19, 16)
+#define CSI2RX_ERRORS			(CSI2RX_ECC_ERRORS | CSI2RX_PACKET_ERRORS | \
+					CSI2RX_STREAM_ERRORS)
+
 enum csi2rx_pads {
 	CSI2RX_PAD_SINK,
 	CSI2RX_PAD_SOURCE_STREAM0,
@@ -71,6 +93,28 @@ struct csi2rx_fmt {
 	u8				bpp;
 };
 
+struct csi2rx_event {
+	u32 mask;
+	const char *name;
+};
+
+static const struct csi2rx_event csi2rx_events[] = {
+	{ CSI2RX_STREAM3_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 3 FIFO detected" },
+	{ CSI2RX_STREAM2_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 2 FIFO detected" },
+	{ CSI2RX_STREAM1_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 1 FIFO detected" },
+	{ CSI2RX_STREAM0_FIFO_OVERFLOW_IRQ, "Overflow of the Stream 0 FIFO detected" },
+	{ CSI2RX_FRONT_TRUNC_HDR_IRQ, "A truncated header [short or long] has been received" },
+	{ CSI2RX_PROT_TRUNCATED_PACKET_IRQ, "A truncated long packet has been received" },
+	{ CSI2RX_FRONT_LP_NO_PAYLOAD_IRQ, "A truncated long packet has been received. No payload" },
+	{ CSI2RX_SP_INVALID_RCVD_IRQ, "A reserved or invalid short packet has been received" },
+	{ CSI2RX_DATA_ID_IRQ, "Data ID error in the header packet" },
+	{ CSI2RX_HEADER_CORRECTED_ECC_IRQ, "ECC error detected and corrected" },
+	{ CSI2RX_HEADER_ECC_IRQ, "Unrecoverable ECC error" },
+	{ CSI2RX_PAYLOAD_CRC_IRQ, "CRC error" },
+};
+
+#define CSI2RX_NUM_EVENTS		ARRAY_SIZE(csi2rx_events)
+
 struct csi2rx_priv {
 	struct device			*dev;
 	unsigned int			count;
@@ -95,6 +139,7 @@ struct csi2rx_priv {
 	u8				max_lanes;
 	u8				max_streams;
 	bool				has_internal_dphy;
+	u32				events[CSI2RX_NUM_EVENTS];
 
 	struct v4l2_subdev		subdev;
 	struct v4l2_async_notifier	notifier;
@@ -124,6 +169,29 @@ static const struct csi2rx_fmt formats[] = {
 	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, },
 };
 
+static void csi2rx_configure_err_irq_mask(void __iomem *base)
+{
+	writel(CSI2RX_ERRORS, base + CSI2RX_ERROR_IRQS_MASK_REG);
+}
+
+static irqreturn_t csi2rx_irq_handler(int irq, void *dev_id)
+{
+	struct csi2rx_priv *csi2rx = dev_id;
+	int i;
+	u32 error_status;
+
+	error_status = readl(csi2rx->base + CSI2RX_ERROR_IRQS_REG);
+
+	for (i = 0; i < CSI2RX_NUM_EVENTS; i++)
+		if (error_status & csi2rx_events[i].mask)
+			csi2rx->events[i]++;
+
+	writel(CSI2RX_ERRORS & error_status,
+	       csi2rx->base + CSI2RX_ERROR_IRQS_REG);
+
+	return IRQ_HANDLED;
+}
+
 static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
 {
 	unsigned int i;
@@ -209,12 +277,26 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	unsigned int i;
 	unsigned long lanes_used = 0;
 	u32 reg;
-	int ret;
+	int irq, ret;
 
 	ret = clk_prepare_enable(csi2rx->p_clk);
 	if (ret)
 		return ret;
 
+	irq = platform_get_irq_byname_optional(to_platform_device(csi2rx->dev), "error");
+
+	if (irq < 0) {
+		dev_warn(csi2rx->dev, "Optional interrupt not defined, proceeding without it\n");
+	} else {
+		csi2rx_configure_err_irq_mask(csi2rx->base);
+		ret = devm_request_irq(csi2rx->dev, irq, csi2rx_irq_handler, 0,
+					"csi2rx-irq", csi2rx);
+		if (ret) {
+			dev_err(csi2rx->dev, "Unable to request interrupt: %d\n", ret);
+			return ret;
+		}
+	}
+
 	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
@@ -361,6 +443,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	}
 }
 
+static int csi2rx_log_status(struct v4l2_subdev *sd)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(sd);
+	unsigned int i;
+
+	for (i = 0; i < CSI2RX_NUM_EVENTS; i++) {
+		if (csi2rx->events[i])
+			dev_info(csi2rx->dev, "%s events: %d\n",
+				 csi2rx_events[i].name,
+				 csi2rx->events[i]);
+	}
+
+	return 0;
+}
+
 static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
@@ -466,7 +563,12 @@ static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
 	.s_stream	= csi2rx_s_stream,
 };
 
+static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
+	.log_status	= csi2rx_log_status,
+};
+
 static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
+	.core		= &csi2rx_core_ops,
 	.video		= &csi2rx_video_ops,
 	.pad		= &csi2rx_pad_ops,
 };
-- 
2.34.1


