Return-Path: <linux-media+bounces-55622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALqLN4fUs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:10:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCAB2803CF
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D31A23046A86
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829BB38C42C;
	Fri, 13 Mar 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sxMbTRkm"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013025.outbound.protection.outlook.com [40.107.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0095638C2BC;
	Fri, 13 Mar 2026 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392945; cv=fail; b=jp+vhJAaR0QIu0H/VGBg7WIHP5QSl/UH50GIRYfRswvzulAP9429MPC3mTSrHPkpaZ+IqJb1nuLSyBqwfty0MiGShg3/CM7N/I+9dHiJGmMQI8wlApm/GWmLl3pYhBgYjlacdeFxlPSXRcdZYY9b9eX5FEoJ2XXO+W6/OphBUb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392945; c=relaxed/simple;
	bh=1tzNzfBm8e6qIeRLNkml++peGeZ73hJHQbHmSmsssOI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwF8xaFjZ980c0onwIOovM9/kpKe1zA6C1qcLafG9PmgIdWm5dmsrrJL133CnHwvnDRM44CuEZmEsPwKxgotF1/JpVFFKrylp6seJB4Sg1N9a9D4gnIJ1xeIoWByK620HrT2GbiMrHU9LGuj05vT874JH9XLE7dccmE5/WJA6+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sxMbTRkm; arc=fail smtp.client-ip=40.107.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNOsekRiyquVS8dXu4NQO9kDLAvi3fQoQVhTB2LNFr5fRn6ClCp3bZtvKGDhMewTDgN54tFrMEmixKGK+Z6HEvBASsCvJEdssMBuVp/cFFwVzyLKEVRGy17/pK9TuRcdsAiTMvyPNsamZpJ89HNDhfvc5RlC8vsxu+R9H4Gqw12p+dAO6leEA+JRDy99qInovxyJK+BJcwJhmK2No0jyhwB5EBbFD+TIC75ERejbCtR4bAsWfROWneDDgWhUPSEB/QeS1aXyfF8y1d+s+E+VD//9OmPvMqXJGxcUz9yWxX2PFSJs36TUede/NgoGM/A5OlPZKcamVtepcyJJVSi5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gvmpaxa4uV0Psh11yhogoj0Mo9G0OE+4GbZZBHbowwE=;
 b=liHm2yPMzKMKk+wPq6a9/FWwNNAujaF6x63wqvM2trynR5lG/i5mfKSadIG8SVouiZBm9a2WM+gvp3IZK7KJS2bDnPBQ5YXFe0xf4htMA7NXhkfgc8u256h9UdiHvaw52HrRvpJFKCrSo6qgmVW0j9bQpoyMIzew+4QsSOgwqA6bQHuWRGO7adCUPEd/o3jhfUV9JGO3Lks50ko/fEcj32Ht13zjQ6vcPThlmRbA5dAlVNdr5+Es+5hhhvSIKCX2A3Ck1xx+SWAN/NRnX+FbPbvFGF5t3da1UhQQ1ed3YPyC73gfq9QxLbAJsaAkYZNGvCjs3UvZVdgyRaspC83kDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gvmpaxa4uV0Psh11yhogoj0Mo9G0OE+4GbZZBHbowwE=;
 b=sxMbTRkmtVmasGEXyGNK1bqEJXuNTePvaF4ChKlYBYqWBPlummtfUIzFUkWy8EEDom+LRa82ywClnUdu4wNDc7BV+JIUKI4NEZ+AJetggFWq5aOOO3/SxiJizdMdGCuwD27IwObu8tN7PgDzX8TeTNp504Pt2HJhHvjxmxaKK0o=
Received: from BY3PR05CA0011.namprd05.prod.outlook.com (2603:10b6:a03:254::16)
 by DS0PR10MB7270.namprd10.prod.outlook.com (2603:10b6:8:f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 09:08:59 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::4b) by BY3PR05CA0011.outlook.office365.com
 (2603:10b6:a03:254::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Fri,
 13 Mar 2026 09:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 09:08:57 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:35 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:08:34 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bh274611;
	Fri, 13 Mar 2026 04:08:28 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v12 13/17] media: ti: j721e-csi2rx: Submit all available buffers
Date: Fri, 13 Mar 2026 14:36:57 +0530
Message-ID: <20260313090701.646534-14-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313090701.646534-1-r-donadkar@ti.com>
References: <20260313090701.646534-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|DS0PR10MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: fed9c009-dd07-48da-4c4e-08de80e028e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	BUvBYtVY0xOGiTDG8Y5pZedh/9YIoln08S3MJmK3AkNOHE2UGgMFEppuOXeN3iEeiw/NY3jFO3YaTTrv+E4pPJ56dLyUsB5QLF/JRF++x0WFuBHoHFd3uTB4P1Gukwu457LNb0DRsBcvA5JIc4tN54bedyciGkK11heAXO/F1rd2cKSMLPOriDyaNdaaSq4co6bXQts12tkMn97XDvqBe0Gucwbhtm8hqLLkbFNjdcrqC1EMPdaLjYVJEz1SLo+nZVaGiuUiGbxePsry74qINvxA4S/STy5RcUBMpGlfUTPccadT6E9H0Z1sruAg/oRZWyUk7GOxi0NV+I5cBWr7q27Gxg7kN1Qh7tncY9jhlSiQ3Ww7em5vPewfeZR/zYSruAQxhCnreA9Y70/IJ6mCOBbl03emZ4MF0FMSk0DRtJ+/ldql1qS3Gu/TXw9N2EN3h4m8KO8oKr6ZPno/GCLa7Aquce7H3iITtOiCNCbyISjHz2FKRqjZ+Qe7UX2UCsMw6TrVWncTlqTHOCqkgTcxcjn1ZkninPefOYnpo7c7Rh3gvWBN4NifKMKCexoy1zEsCbeq6ikkhSDJ5DbUu0JKC7z3YI+mQgcQZEseX3OqdpBSa2WPH+BKvmzxBQSJDGBsUDGP0LPNu9dPILQlbOvY+bENKK2PXN4RJWTP5FwD5i0BoWat2Yb4LNwUe9wI6rzhIOl1zya002w7eVHzmAQXqBYkiC+TJOTjzvMif9cFbcLNg64K1H/+MDRkO/8vWhYC4vuB9grubVCoIZ+XSAbPsw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LscYsnfyIedNJ7dqZ01CccDPOiKmW38+c1gBg1TdcxMC+XRXsNP/P+hM9dzGyCrQSfqQxta6JVbV1qB5DvIx/ihnzRCBjKato8aP9D94pOWPQB4vL8tpa1Y8uHuPLekwqUpXAuor5MF/RqAKzwZR4W/EwcGvkvXHores8/eDV9gcKpIU283cqLsD8aEDVxXSlWWKP8MOEGSFlr/m6d1Lx+mau4+ZlBvomEj5v0UqfMN860HFbiloStbvxDB0DaGhFSnZ18iOR2BqlAlrRL7zr7RDlS5vuXjrhqIpJOad60rLNV9KUwWpj97oKt0CsKNMqK4utpx/yxjdXH4WH/tjPPSpGNeoV5mkZlfaORLhiMkerex8gMWNcNV5li97pwnhWqBNG40MccFK//vym54+1481IY6YdAgZBvshiSGjTt3WNlXkG9U0QEvfQZZ0aT2U
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:08:57.9825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fed9c009-dd07-48da-4c4e-08de80e028e7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7270
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-55622-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,ti.com:dkim,ti.com:email,ti.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9FCAB2803CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <j-luthra@ti.com>

We already make sure to submit all available buffers to DMA in each DMA
completion callback.

Move that logic in a separate function, and use it during stream start
as well, as most application queue all their buffers before stream on.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 42 +++++++++++--------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 5f4627f8c4921..7d50b8dd8a6a4 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -663,11 +663,32 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 	return ret;
 }
 
+static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dma *dma = &ctx->dma;
+	struct ti_csi2rx_buffer *buf;
+	int ret = 0;
+
+	/* If there are more buffers to process then start their transfer. */
+	while (!list_empty(&dma->queue)) {
+		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
+		ret = ti_csi2rx_start_dma(ctx, buf);
+		if (ret) {
+			dev_err(ctx->csi->dev,
+				"Failed to queue the next buffer for DMA\n");
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+			list_del(&buf->list);
+		} else {
+			list_move_tail(&buf->list, &dma->submitted);
+		}
+	}
+	return ret;
+}
+
 static void ti_csi2rx_dma_callback(void *param)
 {
 	struct ti_csi2rx_buffer *buf = param;
 	struct ti_csi2rx_ctx *ctx = buf->ctx;
-	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	unsigned long flags;
 
@@ -684,18 +705,7 @@ static void ti_csi2rx_dma_callback(void *param)
 	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	list_del(&buf->list);
 
-	/* If there are more buffers to process then start their transfer. */
-	while (!list_empty(&dma->queue)) {
-		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
-
-		if (ti_csi2rx_start_dma(ctx, buf)) {
-			dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
-			list_del(&buf->list);
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		} else {
-			list_move_tail(&buf->list, &dma->submitted);
-		}
-	}
+	ti_csi2rx_dma_submit_pending(ctx);
 
 	if (list_empty(&dma->submitted))
 		dma->state = TI_CSI2RX_DMA_IDLE;
@@ -1135,7 +1145,6 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct media_pad *remote_pad;
-	struct ti_csi2rx_buffer *buf;
 	unsigned long flags;
 	u64 sink_streams;
 	int ret = 0;
@@ -1160,16 +1169,13 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	ctx->sequence = 0;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
 
-	ret = ti_csi2rx_start_dma(ctx, buf);
+	ret = ti_csi2rx_dma_submit_pending(ctx);
 	if (ret) {
-		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
 		spin_unlock_irqrestore(&dma->lock, flags);
 		return ret;
 	}
 
-	list_move_tail(&buf->list, &dma->submitted);
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-- 
2.34.1


