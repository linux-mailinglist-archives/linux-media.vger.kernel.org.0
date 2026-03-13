Return-Path: <linux-media+bounces-55611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCd4LADVs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:12:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18F280433
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B2553205DFB
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76752F6188;
	Fri, 13 Mar 2026 09:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PxckXI33"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E77192B75;
	Fri, 13 Mar 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392869; cv=fail; b=FP8OuAH5IUDR2g4B/mfsrAKfywsxHqJ2GZ4WmkiLy8vHFkAcFAFreCW7IOQcjyXRDY1M83NyDtAUzifpxwwsvgYYGpwrpdHrtgbfXylN2RhfbqyjfHhLFDoDkXW0XkE3HtGCtPl66kZTuktPX7zLjpapNN9zrfuwVpTKZ9RGiCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392869; c=relaxed/simple;
	bh=qF2A83H4fo9K/1+ksb8uCXW6bgG3KPEz30g2DFtGrt0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0CFHU/TqiGbqBG4yJa/OEyNOcUoMZLFmqPHhKr26OWCNKlle4gjn34D/AlY8eDnVwVL/eYdneYb0ZSlj3bbnrbxSxiNqV3Rvk8t0Qhx/kn9tNa+ZAZvNSN5E/2EpPCVAGqnOyzlgy+k2iuLov3zDFik9dE+pWkWoW1YiBUafE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PxckXI33; arc=fail smtp.client-ip=52.101.61.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3UJl2MhVXtu4UFyd6RRrPWy0dYFYWY0c8lIDfRzie12F7/T8PGP8zccKdcBdRFJq7wld9NTWxs4oDzFsdc7HkkXUJ4zjq76lC2qgy6G19fyjK8ZuLoMUzGzJZtM52bgZYtIvJ5HgZ6FlBGXDmz1sVXpSZhRZW3ihaGeT4t10t3bf2S2Nt0DPgoOcT7fEqMzGfKs75U1pB4mBTveSz7wF0w4N04JVhryxPf6X8kgB8H6xAwgwguTxhtVU/DD+kz7UVmm5CS0R1syuzB5iCNkFRoHXdhQLe4fvtVSbTJRgyXZcr6FYKlX2KyxLWI6fuBo00ipSWWNWpoTFzVPmd+HAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCDwgkNDFF8XHj5UxRrRs2Nb4tse2yapt+b6Y4UFNFM=;
 b=jKD82fqS/oEaVRxCxfcCzw5BllcRRs3PsahOflPvuYdiHNzNMYgvEk404whcO1qRHWQ1jsm/WOXZ/3Y69WLjpXpN2yFLOtQYBLcuucbO71zVM282zaGCwleoYFebNygw02yfjvEtY79oF7LMtrMVAK0+HNcoe8Fd3jtzIP7moe8pYDSlpcUnE4I5CB+NbnHmPScje/raNoFf6oTd2ntxp2lwkRDg93VTVjkTYVnALBjW6uQy7QmhvUmLIgGXhJYxrrZXcH0P5F85TtZ2gYKefwNiwKsjHlA31+mvTpq2xJX/14gsEuFcL6BOomzyVGXfkeJuXT3iJBHnpbJKsYRBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCDwgkNDFF8XHj5UxRrRs2Nb4tse2yapt+b6Y4UFNFM=;
 b=PxckXI33a/tgPEYxjzBUNUzSPqAmjHM0E7jBQ/X1M4DlPj5mXHFR+oGVwldRgl0roiaOx7WyotijNAQI9yCBBgjtEOQHot/8uNI4cb7j+kmq2Nc9XEeqz8iJj3czGDB1fHKDtv4K7aJaXDHT41F6JwgsjzH7VVYbnxBLI/hsVAs=
Received: from CH0PR03CA0227.namprd03.prod.outlook.com (2603:10b6:610:e7::22)
 by IA0PR10MB6793.namprd10.prod.outlook.com (2603:10b6:208:43b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 09:07:42 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:e7:cafe::b6) by CH0PR03CA0227.outlook.office365.com
 (2603:10b6:610:e7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 09:07:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Fri, 13 Mar 2026 09:07:42 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:42 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:07:41 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bZ274611;
	Fri, 13 Mar 2026 04:07:35 -0500
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
Subject: [PATCH v12 05/17] media: ti: j721e-csi2rx: allocate DMA channel based on context index
Date: Fri, 13 Mar 2026 14:36:49 +0530
Message-ID: <20260313090701.646534-6-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|IA0PR10MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e3b0c1-3716-4277-d77a-08de80dffc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LHa3FHROKqmBgPAPrqAITqXE32Ig+pHMJkqTnuPx5BDmjl2s9b8ZECIsMCeIbr17tjA4VMLrN2pORbZGPvn9/pRS/5gbxIveqfNIt/7yKhimQMCXnlAtUf53ZiS3ykeSqPhjx9lzyQsOkbkUXJVdkwYSOcgv07t86nNrVBUS6md4XT8uqcKMLfMLBNAR319fLFb7ztbex5cX/kTs3xo1S1yMeLn0eJQE1yzjLi+5q69cHhn6GZg/eXBLahB82AyhtYNYJ3H7zAGcG7KYcRYckENOVDCSNdHt2cZjCoWbz9H0ULN/jpVBDcNkJ0jS1ZcFmyfiqf3AmJvBQoWj+rVw7snD7cNl3TjN5n1IqZae7ycMie8ch1g3+WW64NlCE/0xt+aw7jiAjhao3Y/VuN6qIYNMrSqXl0uUMcyQWdU9W5v53ATIDPwhRx+pZEm4OOJ85MVNxjr1bA14HrkuwRVWZ3SlntgXDlLy9jvhY33GbBPm9trGBosxKLTjCdOSybGuyAZ0kt3mSKXsdiVXj26+WqTOioifA84lOYvLnUlOQc7MfOy3z66sLlext6dG13hB6sTdDQaMloMhnsg3Pg9tqEdpDQ5Ff+DZXgHHvEwVhYP9NyUohUwyVLxrjYQ01GIepwCWVt9WwrFduZ78iKrJFlUGH4Vf6pdfb2J7mUF6KXVESPxtKEFS+y3um5bKRidtHZPKroOfv+1hJl6U+CFW3mmLnoEPy5VQqf1egPkgfKnauad4oFeSQV/ATJFM6BiyJFttMZ9vY8wRLqYU5siS+Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3Q8QOomS5GuOlQBI26k8cQBIk6cXirOD7wbvKFc97CMAcV7kdwx8pTHzPL2TXhpJS7nRBbGkZTAJ7PipypceI04TtE2DtnrAiUmYqYGErirS8o0oRsQBcJMrVMd4lzam0toGhyBfUYkHQ9/8/45b1Z6967mR/pxblHFN+TnVUBGlW8PJx4DRvyz8iEv3cFsJAVpQHTqcFW9lLS2MjmE2zHKAkCSlbTe8X3hO8csjPEZS6iGmFNGbzGlrbWiylts0jeav8D+wwNwXRVw2F/OHHNtAqq3gaso2Lj0RhaGU9E+G3ezNNgtpl9FDcDBpUejfqldoFv3mxo5JablOD2vNfs2DelAUVzVenusyrYSu+pc1HF6VOBLd15QM8cCpqLlNIecxSyeb65E2y+uLFPu+CZYielvumR/393G0snZJFD/eOw6/IzSQC97KN0BHH4Zc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:07:42.6603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e3b0c1-3716-4277-d77a-08de80dffc07
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6793
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
	TAGGED_FROM(0.00)[bounces-55611-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2E18F280433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pratyush Yadav <p.yadav@ti.com>

With multiple contexts, there needs to be a different DMA channel for
each context. Earlier, the DMA channel name was hard coded to "rx0" for
the sake of simplicity. Generate the DMA channel name based on its index
and get the channel corresponding to the context.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4adfae425f192..c781b312cea82 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1036,9 +1036,11 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 	struct dma_slave_config cfg = {
 		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
 	};
+	char name[5];
 	int ret;
 
-	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
+	snprintf(name, sizeof(name), "rx%u", ctx->idx);
+	ctx->dma.chan = dma_request_chan(ctx->csi->dev, name);
 	if (IS_ERR(ctx->dma.chan))
 		return PTR_ERR(ctx->dma.chan);
 
-- 
2.34.1


