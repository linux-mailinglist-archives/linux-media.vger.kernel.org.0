Return-Path: <linux-media+bounces-30335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63625A8B8C8
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 14:20:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D4087AAC03
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 12:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0C624BBEF;
	Wed, 16 Apr 2025 12:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="T723YLho"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B724A06F;
	Wed, 16 Apr 2025 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806013; cv=none; b=M0/F0FjjjvbR7qqQ1q04YJCeK8ZpO3B2lIceasoz/Wdc0uTuZXYUj2ciyMLYtPQ/jD5fe0BMboc3ssnqFiwVS16GXXZQuq5eRFhlxc9xyUjZFh5d6ydk1yCQBlDLwJ0QzRpsmejBpR9hz1ystsGxF5m9viZzJ6DUpiNVPV424vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806013; c=relaxed/simple;
	bh=ue3VHKCvkR/zW/jD49Rx0pdV9YiltLbzHNBQrq26gU8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h+GjvyYJkBVp6PGNxhZgP1XRvrFYPU6ORL3Op3l1h2dDgWHDkg1kVB7yRrJKig6yffyCo2WtLboMoBlyKRCjhLnmN1YFmQMxWoaimJk2KxIUJ6KIX5HcmXaoGce+FkhG11FSOUuFlhS/7g3kz3nrQho9cqTrFRcbr3BcQnImnc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=T723YLho; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GCJxwR309282
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744805999;
	bh=nP8BvfpS5LgVFKWcBIYQM+XtffAJggpynUqtFdmrluM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=T723YLhoffglPXGXcJ4f8LBBMsEslBb7km5vWS8NFiQ0ZsaGpZS8Iak/WR8wLhvZ6
	 PE7tnI2u065xUDFzUqEqHDBX1jXHf1SEZyqZGtvSnazEzZhgiARCF7Y97ymcWZFQOB
	 sWwhkX/9BGNiZ5kqTOdWsLpBPYMGS9wF9UquPrgE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GCJxum064056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 07:19:59 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 07:19:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 07:19:58 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GCJiEu016254;
	Wed, 16 Apr 2025 07:19:55 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC: <mripard@kernel.org>, <mchehab@kernel.org>, <jai.luthra@linux.dev>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devarsht@ti.com>, <vaishnav.a@ti.com>, <r-donadkar@ti.com>,
        <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH v6 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add support for VIDIOC_LOG_STATUS
Date: Wed, 16 Apr 2025 17:49:38 +0530
Message-ID: <20250416121938.346435-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416121938.346435-1-y-abhilashchandra@ti.com>
References: <20250416121938.346435-1-y-abhilashchandra@ti.com>
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
and also add support for VIDIOC_LOG_STATUS ioctl. This allows users to
retrieve detailed error information during streaming, including FIFO
overflow, packet errors, and ECC errors.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 131 +++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index cebcae196eec..7f1ce95cdc3f 100644
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
@@ -124,6 +167,54 @@ static const struct csi2rx_fmt formats[] = {
 	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, },
 };
 
+static void csi2rx_configure_error_irq_mask(void __iomem *base,
+					    struct csi2rx_priv *csi2rx)
+{
+	u32 error_irq_mask = 0;
+
+	error_irq_mask |= CSI2RX_ECC_ERRORS;
+	error_irq_mask |= CSI2RX_PACKET_ERRORS;
+
+	/*
+	 * Iterate through all source pads and check if they are linked
+	 * to an active remote pad. If an active remote pad is found,
+	 * calculate the corresponding bit position and set it in
+	 * mask, enabling the stream overflow error in the mask.
+	 */
+	for (int i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
+		struct media_pad *remote_pad;
+
+		remote_pad = media_pad_remote_pad_first(&csi2rx->pads[i]);
+		if (remote_pad) {
+			int pad = i - CSI2RX_PAD_SOURCE_STREAM0;
+			u32 bit_mask = CSI2RX_STREAM0_FIFO_OVERFLOW_IRQ << pad;
+
+			error_irq_mask |= bit_mask;
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
+	u32 error_status, error_mask;
+
+	error_status = readl(csi2rx->base + CSI2RX_ERROR_IRQS_REG);
+	error_mask = readl(csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
+
+	for (i = 0; i < CSI2RX_NUM_EVENTS; i++)
+		if ((error_status & csi2rx_events[i].mask) &&
+		    (error_mask & csi2rx_events[i].mask))
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
@@ -220,6 +311,9 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 	reset_control_deassert(csi2rx->p_rst);
 	csi2rx_reset(csi2rx);
 
+	if (csi2rx->error_irq >= 0)
+		csi2rx_configure_error_irq_mask(csi2rx->base, csi2rx);
+
 	reg = csi2rx->num_lanes << 8;
 	for (i = 0; i < csi2rx->num_lanes; i++) {
 		reg |= CSI2RX_STATIC_CFG_DLANE_MAP(i, csi2rx->lanes[i]);
@@ -332,6 +426,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
 	reset_control_assert(csi2rx->sys_rst);
 	clk_disable_unprepare(csi2rx->sys_clk);
 
+	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
+
 	for (i = 0; i < csi2rx->max_streams; i++) {
 		writel(CSI2RX_STREAM_CTRL_STOP,
 		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
@@ -363,6 +459,21 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
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
@@ -468,7 +579,12 @@ static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
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
@@ -705,6 +821,21 @@ static int csi2rx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup;
 
+	csi2rx->error_irq = platform_get_irq_byname_optional(pdev, "error_irq");
+
+	if (csi2rx->error_irq < 0) {
+		dev_dbg(csi2rx->dev, "Optional interrupt not defined, proceeding without it\n");
+	} else {
+		ret = devm_request_irq(csi2rx->dev, csi2rx->error_irq,
+				       csi2rx_irq_handler, 0,
+				       dev_name(&pdev->dev), csi2rx);
+		if (ret) {
+			dev_err(csi2rx->dev,
+				"Unable to request interrupt: %d\n", ret);
+			goto err_cleanup;
+		}
+	}
+
 	ret = v4l2_subdev_init_finalize(&csi2rx->subdev);
 	if (ret)
 		goto err_cleanup;
-- 
2.34.1


