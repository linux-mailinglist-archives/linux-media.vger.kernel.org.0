Return-Path: <linux-media+bounces-51262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAY1AOvicGkhawAAu9opvQ
	(envelope-from <linux-media+bounces-51262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:30:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB805870F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C57F0685E6C
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 14:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9E44A33E1;
	Wed, 21 Jan 2026 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HqGrO+IY"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013018.outbound.protection.outlook.com [40.107.201.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120593382D3;
	Wed, 21 Jan 2026 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003788; cv=fail; b=h5nT99YOZYhJAKJ8ro7i3ciB+R+ji7qZi4G8O0LhAgNh2YuArYb169AkrXnR4IcwKmRcPpQDgopyXDR3frqu+RYrTASW/pwlRL8AOiByxRTe9KDnB6TQtzo5WhVdHDFslyrNTSJj8x5jujI5KGDHph6CIWOUho2LF6l+349BNfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003788; c=relaxed/simple;
	bh=hQvA8JOq+hevoIB7Kz6CIus4GXGqiv0GAvp8vz21DUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a792cpjNu84TZ30XiPv2T/jnafG5afdgI8uI+wMXDKFjYAdHoeNGMb0GJacX1grNjPxMEzG+HwzzG6pGtc/c1Vp/kLzo914k5n5GarR685m2tyc+Mwa9aEqc5Rb8WuWFW1LgaHLo0Mg/RjY+M7iK/AKvERFVOCuspfuG9yFV724=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HqGrO+IY; arc=fail smtp.client-ip=40.107.201.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3lAOB1AW5LheqVcvlkGLTxqDdKNu3rsXXYwLCJEdXNQNUPiWEvhuAhNZEn+QeJu4bPfnXmaF1I64m++t2EX7gK/qIssDpmnsLlmGM+kks3C1XVGNj+Xy2IsmPxIaOembxpI9/MMMOd8pn/7hsg2BTIDR5jwkf2CegmnObDREEwG8RPvlf5m8CwwgetTcOPhSJWKAxeUm+4t9dBtPIiajx0uOZs5VrW/AwVFUzjThxv7rIOv6JIKOwPfmnOdSUSEn1+L+QxqaoShZS+tIyiSsPOySC4HtqyKpEbTHtzJK7J4pAvK5XWBD/8j3hFXr58qnLKJWDZT5xCxYDbCb8HFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns5eTUTpwDrs7kw6PBr2u2XaBK7aGGr4asl8ORPZTPU=;
 b=HWRmGk9qVAq4GMXAB3RuI8cZlGeAVPaRnlwS7qPHTxleaOC2iq0lmMKh2HtsKps+rlvwfferhKcFomtVeZVBVT8XgSu0UxTvmmx8mGEqzhenNyABgj/Kl6BiHuX5YtYlQgreQqZxZx2bZqP6T34qMkTt7YiO2eoJIsgyTQixI2VSkvW01609XVFBSli5ZPs2zpC8ejevR85k0GZc2hvQuFkzMcxrc2Tvuq7V8alt1N+N9D3gqLzBTX8jqIbwFD+vbLCMTrjl5+rma90Cg2sjB8sK+Gz+d/iV9hwPmINvhJ/bLdpDz5ykIbIR6L5kJFDdAQcePrycUQGueNwyBmwmWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ns5eTUTpwDrs7kw6PBr2u2XaBK7aGGr4asl8ORPZTPU=;
 b=HqGrO+IYMp2j2TsKr3jauIf+rNdHjoP/Dqxb2AkXHXHZhAaOJ6wJHiBWijfrLzMhGDa2+ENnh4BSnOAgUL6uhlQ5e/rST1vHQ9WtZpyP8yKVDg1H9i7vCdnBdpLtJjuq8X196MkyJh/p91sW4/iPwgnGz2lvupBJH3+Aue/huDM=
Received: from SJ0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:a03:331::33)
 by DS7PR10MB7374.namprd10.prod.outlook.com (2603:10b6:8:eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 13:56:19 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::ed) by SJ0PR03CA0088.outlook.office365.com
 (2603:10b6:a03:331::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 13:56:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 13:56:18 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:12 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:56:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:56:11 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LDsPIK3104105;
	Wed, 21 Jan 2026 07:56:05 -0600
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
Subject: [PATCH v10 14/18] media: ti: j721e-csi2rx: Submit all available buffers
Date: Wed, 21 Jan 2026 19:24:20 +0530
Message-ID: <20260121135424.1185710-15-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121135424.1185710-1-r-donadkar@ti.com>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DS7PR10MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: eb04c9ce-d659-44bc-8cd9-08de58f4d9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FoOzMKdLQLNjMEfYv5ndnJ+x3SbEB8VpFqF2yXyd27n1JZnSyZasqwGfDX8k?=
 =?us-ascii?Q?1pFeUQsRS96Z9vqZnZQke/TePdJ8bb3oFa7Y1HhMfeOLoxX8GHFPTFKJB8cq?=
 =?us-ascii?Q?XSSWLQ24IyeomFdmS6QjkiASuzueLhBAux0SRmno9bDqOlbNtUNyRBdB8xdc?=
 =?us-ascii?Q?2aPECy/9eVpRL7K5gnS3CeUpnZFuqVISt/wsqUll7Zu1wrVWCyO3MjVNPIvQ?=
 =?us-ascii?Q?JCbJcfgNWWd8IzFcEEkC48X1gBCsrvVF+xzYFPCsmYWI2Rio4HqrfcbKvQ0s?=
 =?us-ascii?Q?S6cohIItNbubXZVK6sy/qSDIicp7AmAoCs8105XwHVJtFzLsUL1n8OiHU9v8?=
 =?us-ascii?Q?qBmOs+0DUBqNqqmnxymIJmR192OBj6z7nUZS0d5gjegjo281zwisSNsjdhhS?=
 =?us-ascii?Q?4s2gfDBIOIUY5AZNGPXBcBvXxgjNCVMxnbaqcpKJeIYgrH+gP07MtnBmC/yY?=
 =?us-ascii?Q?USYhcojbS5ugg6piQzOWwlQisLHvNB+cY0w3wQR6E69xTmn2/00EJM2xbZVp?=
 =?us-ascii?Q?1mmrkCbgqtWyKIgI4DVNqkWBNxoJy812u4xcWv3mRhfAkD3UACIpgmZR4few?=
 =?us-ascii?Q?Mz/nT6jm9X0g3zGjdXHmHmSoCNAWMFvdPC8M7r6la15p6JIY2E5L3W4LOD6j?=
 =?us-ascii?Q?eshD0z5LYCBGQg8aj1C5QZwtYGRdQfSPL7lLSdmKWmUeqvOd7YcncmyK05Cn?=
 =?us-ascii?Q?+Kq4viB/CSIIJEDm8yteVVnxqBmhgsUUHa9S5UEpWzzCvP25PQ+ayt8U5yF1?=
 =?us-ascii?Q?CemNDunJ4B2vp+NyWjdssZA6lGTyGeggLxVaVgdhbGttdOCsbkq9V6iI8QL3?=
 =?us-ascii?Q?RbG7+rBf+qpDlrbotrO69NgnDq0KjNTMOsIafyOIFwoEQmd0lSfbTfM8Iq7F?=
 =?us-ascii?Q?Sz7ftsOdL7OfC0P6ti4c5VjODjSt4bipmZFcVKNAuZsdjIRLi814cw96VP45?=
 =?us-ascii?Q?9nypDHSfuuczC2Fr0GExi5DEDL+yPX9C2JRfeZbGHA6ZGou2evmRr/S37AYH?=
 =?us-ascii?Q?kD5IuPMubwVDpha96faGYMVgF257nGOE1FV6IhQL+yPIYG/dytlNNpYYLMlk?=
 =?us-ascii?Q?DQXd17EUD5fedkQNHHaK3cTY2e2JyOfFNEco6p4lx2pDbip13LEgi6C7XNsA?=
 =?us-ascii?Q?yPTWoQCzQK544qHG3tqGdPFmwhmaJY6iIDlK5aIN9EeTOSIvO1dNBMdhVP+C?=
 =?us-ascii?Q?KndWxy6qnS0CW+hg35ceSDIQYLRFyVADxIe9010BqJv44VPK5B4BW+rwhAg5?=
 =?us-ascii?Q?b8eJHMTMeTjPBkBpTxUXhFJ/j5dV6whKj34a7c0pejd4mya7HDaiSaGuzrln?=
 =?us-ascii?Q?xFlVAgsMyE4pFgWqfHi6W8ulwLdTI/Fy5C+aort7Fj+fAWXzzNpZTRZvgQhX?=
 =?us-ascii?Q?sxFHuOh9KzksTxTsc+5UyEtWyOXXsWUTQLh4kRtMSrkM7sqstqkghdhqfhtO?=
 =?us-ascii?Q?rH0Xjdbxm8ICMmJKdSbsnjcn1gFtv2Ej/RhKII+gp2RuBjj0t7wGAtaBxiRU?=
 =?us-ascii?Q?C4YLaOxxodgozGNMYxIgj0eSC6qH6rl2eGsHu3+e8rfxNh1BPWbZx1YNAN8v?=
 =?us-ascii?Q?PdXS3iRhp8BtyZij/yA0a7LKvqb0lWPsFC/vk/wwg1kEJQ30/QXtLwePIU4K?=
 =?us-ascii?Q?MklJgSWMjpmYtFkYhQPcvAVaZ5cMsTR3MpdK4CPXxce6DIXRNcRNco/FiDt3?=
 =?us-ascii?Q?j7E6DA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 13:56:18.1372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb04c9ce-d659-44bc-8cd9-08de58f4d9c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7374
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-51262-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ti.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ti.com:email,ti.com:dkim,ti.com:mid,ideasonboard.com:email];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BAB805870F
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
index 4dabb99792d44..5bb726f7d4f44 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -664,11 +664,32 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
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
 
@@ -685,18 +706,7 @@ static void ti_csi2rx_dma_callback(void *param)
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
@@ -1129,7 +1139,6 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct media_pad *remote_pad;
-	struct ti_csi2rx_buffer *buf;
 	const struct ti_csi2rx_fmt *fmt;
 	unsigned long flags;
 	u64 sink_streams;
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


