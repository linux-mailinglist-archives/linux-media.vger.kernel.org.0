Return-Path: <linux-media+bounces-62267-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EO5NZWlDWqh0wUAu9opvQ
	(envelope-from <linux-media+bounces-62267-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:14:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 459CC58D6E2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1BF431F0CB2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83163E1D15;
	Wed, 20 May 2026 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bYkakxPO"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021993DD85B;
	Wed, 20 May 2026 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278556; cv=fail; b=NzyGRM8PmSuPFkv5H3xNNs2fLkdAvTB6JGzJToMO3E8s8N9bcSMNH/PR1QPIQ2di6QsAy+JevsgqgNbbqXdYUaXAJah4gwVpwtTGcwaAMgKaA/tWWmoj40/8woU2sW98h5YTo0wghm5jcdvhlVkSZClqjMQQcfUIumG8bn9X6bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278556; c=relaxed/simple;
	bh=iMMTJen14HBr65sT8GyXhteYaomqFLMeANTIPFO1G2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p4rFwxkuNpZxnnEt50Md0w5DuWWa4xcowjzgWlCi4BMnd727UTGyQ5/OjDPa82i9NyS8VIGQsFgD6JUkIv5ajVBUlpkxBbr7il1u26pcqMDd9ASHX5Ch1fr8BDQQ4Ql+E325+Uk6VcBAl+DnnF8wVCt67vVZCfK0h6H3vKIm53I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bYkakxPO; arc=fail smtp.client-ip=40.107.208.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXOv7ur3yvYUocRMunNpxtUP97t23iJ1rg4HKQdK9NTgVqIRKZ8tCdNHRwDL9cjlwDquH6NJr48Rd/RqCTJFHKud0kWjZXziCg9bZ3tEQjyJg0vDhuEaB975dcXTgHQyn1FzgBa+CZQGk61f2m7ZEuLjxv9U0dXPVesLQyWpMNETofF2r4gxQySipc4vXhuS2yrGamAbw59E5AKl/i8cRljnMkTUUKf+urDra5QtkUurmUqy6/s1kWbcbAey4osLwU8RZxyos+G30IlfYpEBlADRTGB2/es+KF6OvfpEOlLxHKoRjTBamp0bFpepUGktXgc0h127nNZLCtrjOwER2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwkBfuNEp4dj+uJz9+7HT4cxyWh8GWF3bNOidqIYJRc=;
 b=k9b9kfkgBZL9SrhaIa2iWaVvFz//QdoGmlLyuG8zJKcNXdLd4OQxhcMnNQ0sZyjwfCjnuRV97qQ0IieeiQWlAl/COOW/Pnw0kS+FlRofPAswRixXNPt/E2qp9lNTjc3515KY11EB51OOkmh8GQDfELIrJarjWzcpSMqjQU/NUzV88QTUL5E/46g2TvB9sg54kGLEarhzR9bdm5EOH6BuZwMfsK7ipWe2yz0K2mbxW+s1evk6J2LiTWIdeQSQH2tjQ8a8d56y3eDrzZMh8322duDB9RE2UcsnjlXx5/H8L5mMCCgNgPqmceldmNYrLHjsj4gE0izT4D2eqNVftt2JHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwkBfuNEp4dj+uJz9+7HT4cxyWh8GWF3bNOidqIYJRc=;
 b=bYkakxPO+3zrROxZHvLb32xCWe0x1NeaU6KvZTyJd/fCYhx1eoa0Fa9qLESEpZY34HpW+cEaCYJStMQC08og1jM7AHlYtdpd40soOpiEhL5nRyagUBL04tTcIMuol5F36dXKaPTnska6zYjX1udvTp9Us3h4SNXa+z+HypCyklQ=
Received: from DM6PR07CA0122.namprd07.prod.outlook.com (2603:10b6:5:330::18)
 by SJ0PR10MB4607.namprd10.prod.outlook.com (2603:10b6:a03:2dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 12:02:33 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::a5) by DM6PR07CA0122.outlook.office365.com
 (2603:10b6:5:330::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:02:31 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:02:03 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:02:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:02:02 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3c1914726;
	Wed, 20 May 2026 07:01:56 -0500
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
Subject: [PATCH v13 13/17] media: ti: j721e-csi2rx: Submit all available buffers
Date: Wed, 20 May 2026 17:30:18 +0530
Message-ID: <20260520120022.539913-14-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520120022.539913-1-r-donadkar@ti.com>
References: <20260520120022.539913-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|SJ0PR10MB4607:EE_
X-MS-Office365-Filtering-Correlation-Id: 1149b87d-b260-49f5-e8a9-08deb667abbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Y2Z7c3VjgQVQp4iEfj3FmjuHMwcy37ZXyHIjxsyC1hjcKUWHAdgYeSAnthojMg8P7VPtfd8ohmCihctKRati9LTPaW2SNdmMqxqjeYjKHg7PsZo6yzS06UxosMNc/f6o3ZnJ4JSkrWBsgJgKb9e3x5GujvN4TOAYDueJqjxJ/G0h0NKGX5OEBel7UE4//KcZk3tYS0Dcuy+O2iK7xF/B8BT6rmUVD30i5nIp3anz/Y3QA6A/X+kMeOx6ReUDw/32KdMYaZsfUHkhKyxWbsn8PasD3B1mfoC1+dcHWlp1JEBPDlaWX7cwkb7mSUsgeqAm0BIFJsJAp/bx5QoUIhWjf/MlqTczkJ3a5WhVf46uSJSdB6CDQRqEx1uODV4P5vtT07ezlDuAJeVNk1yZ2LAebyGRrwbYoc23jYj8lE6AZ5Q0VYadHHgpcZsRa2L7MwPy0SN/Ty+fLjyT6R1pvFezxW3mD1BjIt1NCn8khOTi0i1hNmscO5yxL7qpX2NcTA3B9W5kNBbBetfGN0OIFrrYBVSuUCRTow/J9Jq1k3MGtvO+l3frJWqnDW4gdV3H+fQkh3/6JhkyxEJv6/8apsL/V5KB1MccuuZ5OuyiCZLbVNpLeL4v6OEub7d6GGrVFCS4QB23X5SBJ29ppiMh6C3Jv/GNmbN+DmytJsiAJo3BE3C1Yz13sDhuk6RnmXtxw+Rava3yrHMBrGb2yBnM9vC0JxQzGK5wlT4rfho2XgnBRgY=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LFgIdXziU34It4v7K5Lj3/sTOQGFbfZu65q399mVS0h1FFa/ef77yt1tq6R4PsDIXrmdPY0EHej+XgA5/9qzS6S4t40niAeTOslJ7tsVszTRclAnj9/C9qixaL9zc2OFE2Lnw5T5wc/ec5R+8c52DVhN7ii0z9+XS8WjvxwzECWqn2Z54/j4vIe0+IJ9RHJ1MaT3mm5Zs9E+F6iG3pBi3WCiIJwzAVmxzKhOpFssEQrMMwN9TqeJdHC9pSzt0PmLfH8nomIvbKSJZZMyQA0wVKjdC0PXL6q/CeYGncqyp+onzuFxla0pTPdH0is7gxyxGRPy0EsEvOiYXWjnJngDhohaWnM6YqyXaaSWeIaM+8SCjsM/EuetQRBbzDNNIX+TZJkbPfNDsBb8jBiMfBZifpEuzgzOT8t9ugIYSqgKpYzVHZwB1OZhQ8kbhoouFNLS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:02:31.1449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1149b87d-b260-49f5-e8a9-08deb667abbe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4607
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62267-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ti.com:email,ti.com:mid,ti.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 459CC58D6E2
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
index 1ec63715baf2..071ad969dfa6 100644
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


