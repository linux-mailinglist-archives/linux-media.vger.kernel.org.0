Return-Path: <linux-media+bounces-26211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F2A383C5
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:03:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A338918981A8
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 13:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9E4220684;
	Mon, 17 Feb 2025 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mTC7HLHF"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6F21CC56;
	Mon, 17 Feb 2025 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797245; cv=none; b=RaXHB5TdP2ApJFhNnAvEO+McwpoXjvDyqsvt/yZN4g5CoNirbBCN07jrHod0yS3Laqg50NCnjR39xWDorkYcHWmY2xkEMkFaka7uxgy1GsVwkD+vhCfDlV9ohmkCdF8fyIK0UTfnqpq1KKrQZVCUs9PrkJpYE7+rzKBsEPsGK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797245; c=relaxed/simple;
	bh=NMGSFpvbLVobJUD1e13M0ql45DWMtAKg69Jm7hViyQg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipS3xGhXwgxULUnhDrjHl3tSuSFU7nGEeeXS0L6hXvIluGQwOLFiNXlEdjUK1sBvbMZCtTSfIphQ3B10WAokEZ+D8AwytMxkORhaTgvwV+8GTm7Dw9b2ueRVxgTB+Nj6oZ2bQ46fF7qpR/M1qvivuwJbACmRzIU/fJkD2KouDoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mTC7HLHF; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51HD0X4N660316
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Feb 2025 07:00:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739797233;
	bh=cxjl24+pAY0WWi9V/mRb2dPReER7i3xQHXTEEuQpAaI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mTC7HLHFzUs4zWQTw62UOThqShsee94aSviZNOKjFF7DSszfBl3mn0ZvujQUTKe3A
	 QB3KWRs+cev27BBnwv053kFE2z/cNxtjGE1wVdFNsKm1tYB7QZFwrO/Uv0vU9wlLmK
	 SMcwq/hgTvpDaiekP/txx+Y/tUSHD0GVr8S2Ex1I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HD0X16056195;
	Mon, 17 Feb 2025 07:00:33 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Feb 2025 07:00:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Feb 2025 07:00:32 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51HD0Fft072350;
	Mon, 17 Feb 2025 07:00:28 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v2 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add support for VIDIOC_LOG_STATUS
Date: Mon, 17 Feb 2025 18:30:13 +0530
Message-ID: <20250217130013.2802293-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
References: <20250217130013.2802293-1-y-abhilashchandra@ti.com>
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

Changes in v2:
- Address Jai's review comment to get interrupt at probe instead of
  start_stream.
- Address Jai's review comment to change dev_warn to dev_dbg when there
  is no interrupt defined in DT.

 drivers/media/platform/cadence/cdns-csi2rx.c | 102 ++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 4d64df829e75..79f0c31eaf50 100644
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
@@ -124,6 +169,24 @@ static const struct csi2rx_fmt formats[] = {
 	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, },
 };
 
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
@@ -218,6 +281,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
+	writel(CSI2RX_ERRORS, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
+
 	reg = csi2rx->num_lanes << 8;
 	for (i = 0; i < csi2rx->num_lanes; i++) {
 		reg |= CSI2RX_STATIC_CFG_DLANE_MAP(i, csi2rx->lanes[i]);
@@ -330,6 +395,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	reset_control_assert(csi2rx->sys_rst);
 	clk_disable_unprepare(csi2rx->sys_clk);
 
+	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
+
 	for (i = 0; i < csi2rx->max_streams; i++) {
 		writel(CSI2RX_STREAM_CTRL_STOP,
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
@@ -361,6 +428,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
@@ -466,7 +548,12 @@ static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
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
@@ -665,7 +752,7 @@ static int csi2rx_probe(struct platform_device *pdev)
 {
 	struct csi2rx_priv *csi2rx;
 	unsigned int i;
-	int ret;
+	int irq, ret;
 
 	csi2rx = kzalloc(sizeof(*csi2rx), GFP_KERNEL);
 	if (!csi2rx)
@@ -703,6 +790,19 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	irq = platform_get_irq_byname_optional(to_platform_device(csi2rx->dev), "error");
+
+	if (irq < 0) {
+		dev_dbg(csi2rx->dev, "Optional interrupt not defined, proceeding without it\n");
+	} else {
+		ret = devm_request_irq(csi2rx->dev, irq, csi2rx_irq_handler, 0,
+					"csi2rx-irq", csi2rx);
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


