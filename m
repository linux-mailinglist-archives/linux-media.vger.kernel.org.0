Return-Path: <linux-media+bounces-49683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4D0CE9108
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4A30304973F
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DEB3148DC;
	Tue, 30 Dec 2025 08:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sGUu/6sz"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D093148B8;
	Tue, 30 Dec 2025 08:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083665; cv=fail; b=UzjgJqRmEH8ZgHENDYtYIUzMhv7KOMPWKEpTZUWoGylAGe1hOr3EN3FLONrZZ1wCh+ezsu21/t7DmrVLG+7GfuF1tCFUY9U7rhNdZ0H8NIvml2Z5nBa0wKf99TblsM87q19ttEFU2wqG6z/tmRZTsS1jT7CoYph8yvQkIKRvXvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083665; c=relaxed/simple;
	bh=xUkLE8OpN726Xk18FTsBJKCAT4Y8h4si0CXUAoyu5BU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pp7AtkJOtHWN63v4FqpiBQDs8DcxA+dpu/r0cfSzYBCk4z3m2E9bD96Nf7b+th96R+qvJkLd6sNHsW8WNUqVK0mu965GckW7v7PAo0EE9s0JofBEMb3Qlr7QsN0fm0lbr+lriiRuvpUfi15yalAlqaGmSkH574Zoe0bs93oSXtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sGUu/6sz; arc=fail smtp.client-ip=52.101.62.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gqpl9Nj6OJUdFMIcYSeNmpNE/DD8byDqqCctgS2P1CfRzC1cSDzORhnfKOEokhMhC6H4NoMPEwdaYRJKxDHMjngmrrLDwDZLcWRwhc3zCsUG7TJmv3HHJfXoa2b2a8+a9DxT8ICmct/9qIitz1pB8Feuv3cT0r6A5VZtnLXYfgkDOkR79PybbRZESJCz0OPFiWYmrmtZ+1uU97jEYRhIQW86C+DfmmYm5bBPZ7yGP6wUyyTizPAmPZV+fhDIgJemxXBCgpeDgldU7By4A7C4SAcKKTavyz7zYRdv8SC/q3rGtNUshfYMOHX/2k2s0TR84cknQIGMJ+o3nscZUKlMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJ9aQOoZWC1Sc226FIvWXvAuY7Y5DVWrqi52y55U5rs=;
 b=oBqNVtx/Z4oXjuo3DgEykSgBGXDqfOCLuIBN7OFg7LYfI1cbqq5rmN1V2/Y0a+fXUpYUPd3cyaAYRrwsEsdZqudjYPh3EVdIO4yODXcDJlaxIo+CUNRrUb60r4RgFwcQXP9R2Mhjthf2zShAR5KS23gV7kjfn2LeTUK3ZXcwqYgUa+AZHJ6N8HvhzWuo7Yi4aQyPdmN0UH/eqA71gdbshftnW0zSnBrY1vrP82f4O27RWLwL08yAorHtA/DoV3wGcaRS4/eeXoWKKRhbbPbdxkXhgNx0VkxTOyipmsijIVF672K63uK4OMGoksYUAfa+NrJC5+CstnvIzj/Apgw98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJ9aQOoZWC1Sc226FIvWXvAuY7Y5DVWrqi52y55U5rs=;
 b=sGUu/6szqnp48ISEQ2P56eUqUy2bFHM/tXgnC+IEEuCRDjq237zDZNHMU5d5pa+D0hghyP89Q5nkope8MA6/NMvj6F6qimMkY74Dj/tT3N8Z3DfGU4BV0fdEzlyd8BSOQOAgJQNih75za5GhANf9O9TXx3yAziWiL0skJi5pDWA=
Received: from MN0P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::19)
 by DS0PR10MB7364.namprd10.prod.outlook.com (2603:10b6:8:fe::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.14; Tue, 30 Dec 2025 08:34:21 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:52b:cafe::e0) by MN0P223CA0001.outlook.office365.com
 (2603:10b6:208:52b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 08:34:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:34:20 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:14 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:34:13 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9j579464;
	Tue, 30 Dec 2025 02:34:07 -0600
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v9 16/19] media: ti: j721e-csi2rx: Return the partial frame as error
Date: Tue, 30 Dec 2025 14:02:17 +0530
Message-ID: <20251230083220.2405247-17-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230083220.2405247-1-r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|DS0PR10MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: 717251a2-75af-4648-8e36-08de477e3a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7J07UVytIyQVDuRQK/LbWcdgAfe/gQjz4wmLT50qgZtnjHNpwS9u/jpATYAr?=
 =?us-ascii?Q?vl+eGXrIqvfK/9hd34tIx1t0JP4S39O1icyzPc4aCpC7yhY+gBPvrLhjYSZA?=
 =?us-ascii?Q?+zZzUUrw2MKtjXaRlhLVyCj0uQ9bPpLkWRxDo4gmuYFpxfVWbnOqtB0uJzea?=
 =?us-ascii?Q?7BifTr6HPUvZ4/RpnpBri5QFC3jz/plTvPIBHYkflM911Nvw3np+Eq5vaEQu?=
 =?us-ascii?Q?haUg7P8Q1jYS/MIaYwrJBQvLIyupWcbO5KP2wefRPTSWSqsb40yjIhpRV8fS?=
 =?us-ascii?Q?4qrQkrGE0Tp2PwjibLrjVtUr4vOGYXUu0TEha5qs/0jwoMi1kqSnYMLyhAXf?=
 =?us-ascii?Q?diE9gFRwNxIrYsqxig3V+/Bq2Sot52pXCw6rZ1hmp0HXJ/R62rXSq73sTCEP?=
 =?us-ascii?Q?ypugp48iWbRJDb5eJMkQ6MwFrjfx4LTBbBk444SXw+rbsspjJ/TRnL4ozn4j?=
 =?us-ascii?Q?BuGBOtJH6rM0KghWBK9S7Qa9zRKk4L6Pcu8ipPEjmMBkmGnL6AUijtB77XCm?=
 =?us-ascii?Q?yR+jRqWjPcaAnxTT91fMZH9cLXUQ8IAu/Il2c1yXkw+KmGtpHy3q4AINy3hm?=
 =?us-ascii?Q?L8GwW4VJvnA666yAkQ4sAOgfUojBM38aEJAaNm8TJU5yyu/yUGPoxWCpUTOv?=
 =?us-ascii?Q?aXzHSLGkAD4gDw2VF33JaR1sySuySG2Vht2rAdfWGHdAMcYAQsFF6mT6Ia5v?=
 =?us-ascii?Q?yP1jQQutgoOeTcbiT4dSGkaDJyqmi7r7YkxAjw6dFsiEXs93JLI5+832nwls?=
 =?us-ascii?Q?7X5bqwGztXf1KLwofuPFcjSMsEJnGGYnVco77IYz/85tHpKPJIw9xO8DhmuD?=
 =?us-ascii?Q?R1xeY+Tobrqlh+b78/elDpDK0i8q5R2Ih9cIu6d1omic/XiO5GH1giw5Di6J?=
 =?us-ascii?Q?z00LNfu/+1GnIt7eiv09i9kUsMUYyrcFTfRSSXXadkc+IN0RMiZI2umOeA7Z?=
 =?us-ascii?Q?6fJXU8MB2npEvevmq0ylWLU97GsGzzCVZZMMetVjhm30NAKpqdWHy3fX0RiK?=
 =?us-ascii?Q?y5doIB+6/vj/s1sO4WQDd23B80vLeyyWJYpUEP0qhvVgC8IUaC3OxV1l6TSy?=
 =?us-ascii?Q?VwDuJosuCocjNTtFOo0lhNFke8MBITA7FchlBx7ecdPd0SFGIBUuEAvLhCFg?=
 =?us-ascii?Q?scga2J435J9XJgbeW7yKy16/JQCjeCyLMQhYEdu6IDlwMTZqgOM67QCjFuHr?=
 =?us-ascii?Q?LQnyvwoAymDMrIfnSRNVVBJ9LyyiK8eMcxdSkM8R2bR+yHQhkamsiQ7qdwqb?=
 =?us-ascii?Q?wZXZ4v8qllEFuxAGB5M6wIiYb/WrlUWRIxKBcV7OMba2y2X3z8UO0glzUD0J?=
 =?us-ascii?Q?bFk5C/05/PAKVFmr/11ghaw0RCXpBc8mVBU+1XcfjjpwL+PAsqmkDaHWHgts?=
 =?us-ascii?Q?U2g4nP7uzfilmPwwA2VqABUomfQOaVCvVGXn8khEgIDTkYv+AIMYCqQsyhRh?=
 =?us-ascii?Q?gtlmTb3Joo4Fg+Nc8SLW67JGdN4WUUh5/jnKJ7ohxLC9LnBXaFNPJ4HKua9a?=
 =?us-ascii?Q?n1mAcUDhYd4fiS+X9aTZHrLSPIypmOq0WRUlXtR7wXYdkKVxHpDXDDz3zTxP?=
 =?us-ascii?Q?1mohK1P+NRblvEKrjqw=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:34:20.2144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 717251a2-75af-4648-8e36-08de477e3a55
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7364

After draining, when a buffer is queued to the driver, ti will fill out
the buffer with a partial frame as some part of the frame is drained.
Return the partial frame with VB2_BUF_STATE_ERROR.

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index e713293696eb1..3922bd67e78da 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -83,6 +83,7 @@ struct ti_csi2rx_buffer {
 enum ti_csi2rx_dma_state {
 	TI_CSI2RX_DMA_STOPPED,	/* Streaming not started yet. */
 	TI_CSI2RX_DMA_ACTIVE,	/* Streaming and pending DMA operation. */
+	TI_CSI2RX_DMA_DRAINING, /* Dumping all the data in drain buffer */
 };
 
 struct ti_csi2rx_dma {
@@ -728,12 +729,20 @@ static void ti_csi2rx_dma_callback(void *param)
 	spin_lock_irqsave(&dma->lock, flags);
 
 	WARN_ON(!list_is_first(&buf->list, &dma->submitted));
-	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	if (dma->state == TI_CSI2RX_DMA_DRAINING) {
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		dma->state = TI_CSI2RX_DMA_ACTIVE;
+	} else {
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
 	list_del(&buf->list);
 
 	ti_csi2rx_dma_submit_pending(ctx);
 
 	if (list_empty(&dma->submitted)) {
+		dma->state = TI_CSI2RX_DMA_DRAINING;
 		if (ti_csi2rx_drain_dma(ctx))
 			dev_warn(ctx->csi->dev,
 				 "DMA drain failed on one of the transactions\n");
-- 
2.34.1


