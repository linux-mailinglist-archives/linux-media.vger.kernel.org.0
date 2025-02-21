Return-Path: <linux-media+bounces-26574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3C9A3F3C3
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 13:07:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2B037ADA1D
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F2E20E6E3;
	Fri, 21 Feb 2025 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HUwxAZmW"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3952020A5D2;
	Fri, 21 Feb 2025 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740139442; cv=none; b=RTzl8dXtouZcqElhUVP9fI2RaY6uNx4AIYY23uQTb9bmfhDtJZJh/6djA9IlJDZuOpP/JL26FT/KlR7wzYa6ZPT3vReCAlq48N9KIm1B/ggVglkILdEuzM7tsQunbTSgYrYEg+P11/4ZAOIGuZcpaThrYiqwF4gKCaSFPYuItFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740139442; c=relaxed/simple;
	bh=mbe8Fnz1rafg+y8G7bwPHSnV4vmc5rfV17O3HXs1JlY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DC1BvtIr8CSAAH4aZGNuutiyY+F15xrdvMRjHkSbV5nTxGcTC3uhA0c3onPe2Lk5EmK8KTmwUK3nc/T8hah/HyVkZD+w0/TFIAI6rQEza5xLh2UyeUGCNuEMl1IpvvkKMt6uJjmMS3d/d7bfqTCJ5Vkaz4mInGlkUjQEwkUDAFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HUwxAZmW; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LC3t9s292131
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Feb 2025 06:03:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740139435;
	bh=/Hhk2zXabDVjq1g9zFrPtdn7b/cjxEoRSmu4UDiatO4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HUwxAZmW19ypy6DHrbAsrIVjw4pzCg32KKG+iZxzhgNRe34MM/qFfYpdI7YQJ2NG7
	 deD4P7aAzJMPC5FgCwpVaPiO5rCdAAKWXJV03TQgO8f1GCkp8fjYs3qyVJiIdi+SC3
	 nfj/1N4uCwgHeplaf2bOdXg4EpkSb9fuQI377Pqw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51LC3tfv094010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Feb 2025 06:03:55 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 06:03:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 06:03:54 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LC3d4p046967;
	Fri, 21 Feb 2025 06:03:51 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v3 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add support for VIDIOC_LOG_STATUS
Date: Fri, 21 Feb 2025 17:33:37 +0530
Message-ID: <20250221120337.3920874-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
References: <20250221120337.3920874-1-y-abhilashchandra@ti.com>
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

Changes in v3:
- Address Jai's review comment to enable FIFO overflow bits in the mask
  only for the source pads that have an active remote.
- Drop TI-specific interrupt and have support for only two interrupts
  that are common across all vendors.
- Address Changhuang's review to use pdev directly to get the interrupt.
- Set the interrupt mask register only if the interrupt is defined in the DT.


 drivers/media/platform/cadence/cdns-csi2rx.c | 125 +++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index cebcae196eec..81375f11a32f 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -57,6 +57,25 @@
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
+
 enum csi2rx_pads {
 	CSI2RX_PAD_SINK,
 	CSI2RX_PAD_SOURCE_STREAM0,
@@ -71,9 +90,32 @@ struct csi2rx_fmt {
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
+	int				error_irq;
 
 	/*
 	 * Used to prevent race conditions between multiple,
@@ -95,6 +137,7 @@ struct csi2rx_priv {
 	u8				max_lanes;
 	u8				max_streams;
 	bool				has_internal_dphy;
+	u32				events[CSI2RX_NUM_EVENTS];
 
 	struct v4l2_subdev		subdev;
 	struct v4l2_async_notifier	notifier;
@@ -124,6 +167,50 @@ static const struct csi2rx_fmt formats[] = {
 	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, },
 };
 
+static void csi2rx_configure_error_irq_mask(void __iomem *base, struct csi2rx_priv *csi2rx)
+{
+	u32 error_irq_mask = 0;
+
+	error_irq_mask |= CSI2RX_ECC_ERRORS;
+	error_irq_mask |= CSI2RX_PACKET_ERRORS;
+
+	/*
+	 * iterate through all source pads and check if they are linked
+	 * to an active remote pad. If an active remote pad is found,
+	 * calculate the corresponding bit position and set it in
+	 * mask, enabling the stream overflow error in the mask.
+	 */
+
+	for (int i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
+		struct media_pad *remote_pad = media_pad_remote_pad_first(&csi2rx->pads[i]);
+
+		if (remote_pad) {
+			int bit_position = 16 + (i - CSI2RX_PAD_SOURCE_STREAM0);
+
+			error_irq_mask |= (1 << bit_position);
+		}
+	}
+
+	writel(error_irq_mask, base + CSI2RX_ERROR_IRQS_MASK_REG);
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
+	writel(error_status, csi2rx->base + CSI2RX_ERROR_IRQS_REG);
+
+	return IRQ_HANDLED;
+}
+
 static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
 {
 	unsigned int i;
@@ -220,6 +307,9 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
+	if (csi2rx->error_irq >= 0)
+		csi2rx_configure_error_irq_mask(csi2rx->base, csi2rx);
+
 	reg = csi2rx->num_lanes << 8;
 	for (i = 0; i < csi2rx->num_lanes; i++) {
 		reg |= CSI2RX_STATIC_CFG_DLANE_MAP(i, csi2rx->lanes[i]);
@@ -332,6 +422,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	reset_control_assert(csi2rx->sys_rst);
 	clk_disable_unprepare(csi2rx->sys_clk);
 
+	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
+
 	for (i = 0; i < csi2rx->max_streams; i++) {
 		writel(CSI2RX_STREAM_CTRL_STOP,
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
@@ -363,6 +455,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
@@ -468,7 +575,12 @@ static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
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
@@ -705,6 +817,19 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	csi2rx->error_irq = platform_get_irq_byname_optional(pdev, "error_irq");
+
+	if (csi2rx->error_irq < 0) {
+		dev_dbg(csi2rx->dev, "Optional interrupt not defined, proceeding without it\n");
+	} else {
+		ret = devm_request_irq(csi2rx->dev, csi2rx->error_irq, csi2rx_irq_handler, 0,
+					"csi2rx-error-irq", csi2rx);
+		if (ret) {
+			dev_err(csi2rx->dev, "Unable to request interrupt: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = v4l2_subdev_init_finalize(&csi2rx->subdev);
 	if (ret)
 		goto err_cleanup;
-- 
2.34.1


