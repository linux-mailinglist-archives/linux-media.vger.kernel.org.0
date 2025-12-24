Return-Path: <linux-media+bounces-49459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95096CDBFCD
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 11:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A1A630D10FB
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 10:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E4A318120;
	Wed, 24 Dec 2025 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C4U22uUM"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55AB313E1B;
	Wed, 24 Dec 2025 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571676; cv=fail; b=YzHubpviEhlHW9owoCgTjlRGa0COe5jLG0xHBerXnaPGh4Bcg6Qqb6MtmNVavNIE9qMN2xOzkd5HaieI1XeryGqHoHnMWQ/u9htoniVK89OcP5Y+W2xhX5/CmmtcbZWkTxAcYqN31zSRlmlVXgNi9ePcVzbhjcmd/xH/FxLKmOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571676; c=relaxed/simple;
	bh=cVx7atmHtPvg8dKzH3g4atr5NjXtz5VOAFhwQdAsO3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/qW/RvfYiFdgvjMXYRhfzYuomO6SDYQtkMN+s3lNgNg4d0i7jkwE/Fdt2Ktm4j/afqam8hOTLuSvTMjU48yoGPGd17dblKxxvCQOXluViH5z2q6HUZd65nx27pTJzfyApxtCumieuU4SntXFw9CN3MTgWQreUxK9hm/R7Mddko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C4U22uUM; arc=fail smtp.client-ip=40.93.195.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM7rgV/VZwo4Z7pc2KLFNGpxOVyMvVUDAdDQpp30rlDTYWpmgPYXtcOsIN3D4/DfWYchROuH55GdBEbmCdMP3rdqVEOQVru0HaXNqLoqpLPfu4PrY1W2jD5QgAgKFhZTEuZaVz3IZRz5Cj1pFCU8rqqNuJqDFSPiTwGPkyRspVpjZw+rkforO0wQ/U4WAeLEFpCrWZJXjleiCj/Cor7y3FYa4zUXZ1/UCEF9y67HiSWhjnkUWlcGGfHZARIluZwfwY4l9KenCRsH8rbHDoWMQzWmFJQ/+cPY6Dq1BHgb+pMo/lrIpIYOB86AmZLfL54S8Y+mTgiKIhpOv9L2mZr2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYrtYxUv6A51odEg2u6qENZ+oiyy0ej6DjO9vrLDx+0=;
 b=hikpnMYtXkm9CQ2z+1Q5eXKHVjOI5gT3QBiabb9je4XYD4hiW2q06vxs4aDlKK/rVTpcFu4ymaXuyAaFyPZpRajv9GF+ko6T4ctQLX0PxDuBwlzOJd3/H4fiyLQRTKSN1cdDQGPBQkaXeWq0cNzIp9nSeyqTHLfbKjq4bUlHsPGUbBm8gr2oF8qh2ojEKMPzc3XjMr2/HFGKlP0/KrOPjAHBLrDeSuxKybhJc6xenZ9shrC9lzPvx0ba5P1YFUXIS1cBvAHJ7y0i8ihhm8Vdg1PFuQafacBbx5eXj6ynO+eKy6MzfW8DsocQCQmUAGBvARuWUCbYZtOKlVYnyJLgnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYrtYxUv6A51odEg2u6qENZ+oiyy0ej6DjO9vrLDx+0=;
 b=C4U22uUMHcts+RrHmFPQYsQpeuo5X2vlEXVRDgvGAXLxkpSs3YRrxx+iaCUa/aUpvBUUloKnQEr8kBArdbnyC1CabQNUsGRAFhSy4yZpPZedzFro2ycTXmkW4tAJtEXFMMOkVZ++MfANZDGzURI2nDw6VzgP4+IPCoo28cKx7Tc=
Received: from SA9PR11CA0011.namprd11.prod.outlook.com (2603:10b6:806:6e::16)
 by CY8PR10MB7378.namprd10.prod.outlook.com (2603:10b6:930:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 10:21:02 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:6e:cafe::a9) by SA9PR11CA0011.outlook.office365.com
 (2603:10b6:806:6e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Wed,
 24 Dec 2025 10:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 10:21:02 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 04:21:00 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 04:21:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Dec 2025 04:21:00 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BOAKk8g412110;
	Wed, 24 Dec 2025 04:20:56 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<sbellary@baylibre.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH V7 2/4] media: ti: vpe: Export vpdma_load_firmware() function
Date: Wed, 24 Dec 2025 15:50:25 +0530
Message-ID: <20251224102027.3343361-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251224102027.3343361-1-y-abhilashchandra@ti.com>
References: <20251224102027.3343361-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|CY8PR10MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 226434d0-6889-4ff4-1b3b-08de42d623c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3TGQKOA1x7mY8yqVnOCsBLZcVxDEXivNXCvDR/UofqMfdLEE9EjaQhLounXY?=
 =?us-ascii?Q?nq1Pkbq2rj5SVyRZpPVMFVeXkwtZIEyHPuKhtzjdHLs5eyu5yvEn/XKqABTW?=
 =?us-ascii?Q?kk0lZZlIQJG1UWshhJIrexU+EPbYSKeE8FIUHY+llUxD9J387z2TsTqevec4?=
 =?us-ascii?Q?Bzg99SUMQcZ5lYaMF1iRA5TZrENq8R0gP9mJ2xRaf5Mx7nKNsYsmjwDrKnlM?=
 =?us-ascii?Q?4NjhKFf4NoEUUPXvwkiBqvEmtnPGlyPs2va/sSoP/dRgrK2a14zxZwy8EV+O?=
 =?us-ascii?Q?ztvrp0HBw/St6nqIRszOP7kGuoEpvGEyWpg1fw0WDSHvzMDSgxiquZYOGZx4?=
 =?us-ascii?Q?DKVyRBXoAQWUFX0HtdM9CCwp+tm87pK3JkWNhely8qB0Chf8JM0wCC8exCVH?=
 =?us-ascii?Q?LcA92evBdOq7elbMNUxxFIIKIv+xYcXQ4pnA+nAN9xiGakknHyOSUOmdiA9Y?=
 =?us-ascii?Q?0fUK2zRCZ8j10I6nS5OTDhXhdXTGtwqVpTUzc/XQkhbdCTEXLsND/DGqjaau?=
 =?us-ascii?Q?CRS0WdeYVLPAaxHuzxHDMyeknr662qLFbUFTuizrXT5Tg6lCzxKkXtZJgXZH?=
 =?us-ascii?Q?4AWjx+GaA/ZhYmgWu0n7VuEjQ9rJzA+OTsZGHdx4ZcFumNeYRX9v/ebknrOt?=
 =?us-ascii?Q?XSDlHzCt0S5cfAY8nSHS6XHbfnFnXdj6esaVMdloL3K1PR5372iIXBFtP/Lq?=
 =?us-ascii?Q?VRL+dnW7JrEHh1PduKETE313ki07gt+Mt2EN+DvHVeE3H0qzVaeJb5zRtRA6?=
 =?us-ascii?Q?To1u/RiW6Mf+kZeLPsi+MwGgZ5oVVO+bZypBcfZduxq1lj+e7Ho9emLYaPrr?=
 =?us-ascii?Q?e5jYi5b6/WIfXOJ04bmZqztEcsvAoUL1t97CVLy+QktEcjDFHfe8SkJQt6Ij?=
 =?us-ascii?Q?xcNDxgDzmMZNmmovuH74YPEPJ0ieytyuVVrVoMhmrUWRxV+5Bxem/dE/g7nI?=
 =?us-ascii?Q?/+4/BVS8ktgxgwMAs3Zy1EF1C/15dGgYw2u2gi2cfGJQtDz0dGozjIrZFad6?=
 =?us-ascii?Q?23kXsjvqs5MPd3o5Rtmx6TNLD2yt0oVe0IS9XPNPsMnGZrVJmmkJm95aVHK0?=
 =?us-ascii?Q?7DUgjx9y3ss7EBBNq3CP4uKPiBK7hewRyG0Ngofyu+Vy1DtTjjouE89FhHie?=
 =?us-ascii?Q?1VQsvPNP5Cw1GggycinjLcxltWyR4l40f8J2g6Fduiimy/OpdihSvCDUjPix?=
 =?us-ascii?Q?PSgvnIkUvdxGQM1ETHIteLtJnhIK7ulkBmblSuVFg4SAG5CuqdABL9O7IOi/?=
 =?us-ascii?Q?FDdyjNxCVlGmMXWDMvvEL2kp6f23IxbTgtwoCLMtO9TzlCmpjHtbSUvrDy9i?=
 =?us-ascii?Q?/WNZ+EMPLzZosxzblO7KYmOl6RMVzOI1U7lC3ks0LWO69PaPrQHxQDvSjwla?=
 =?us-ascii?Q?GkhUmZb5JNVj0XITAuewImDyNxc/rXSdIN+qu6NdEBhDgQ4CRQEJ5AOzmHLJ?=
 =?us-ascii?Q?ANS14KufME0vyPJ2yfbcU1Ck8yLHv6qpiInlQo7tVo/et8lgvw0ZbpgJPb1x?=
 =?us-ascii?Q?dVxyxeJ7YQT94UXrk2OVIjBBIVzUC3LvJ23RhjwhzQ9YjmPr83fQrh7WwGob?=
 =?us-ascii?Q?hezYHpHiCAGUplSNEy8=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 10:21:02.3267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 226434d0-6889-4ff4-1b3b-08de42d623c4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7378

Export vpdma_load_firmware() function which is needed by TI VIP to load
the VPDMA firmware.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/ti/vpe/vpdma.c | 3 ++-
 drivers/media/platform/ti/vpe/vpdma.h | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index 29ee1918bc1c..573aa83f62eb 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -1135,7 +1135,7 @@ static void vpdma_firmware_cb(const struct firmware *f, void *context)
 	release_firmware(f);
 }
 
-static int vpdma_load_firmware(struct vpdma_data *vpdma)
+int vpdma_load_firmware(struct vpdma_data *vpdma)
 {
 	int r;
 	struct device *dev = &vpdma->pdev->dev;
@@ -1152,6 +1152,7 @@ static int vpdma_load_firmware(struct vpdma_data *vpdma)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(vpdma_load_firmware);
 
 int vpdma_create(struct platform_device *pdev, struct vpdma_data *vpdma,
 		void (*cb)(struct platform_device *pdev))
diff --git a/drivers/media/platform/ti/vpe/vpdma.h b/drivers/media/platform/ti/vpe/vpdma.h
index 5b3a0cd49a3c..1fc53fb33497 100644
--- a/drivers/media/platform/ti/vpe/vpdma.h
+++ b/drivers/media/platform/ti/vpe/vpdma.h
@@ -281,4 +281,7 @@ void vpdma_dump_regs(struct vpdma_data *vpdma);
 int vpdma_create(struct platform_device *pdev, struct vpdma_data *vpdma,
 		void (*cb)(struct platform_device *pdev));
 
+/* load vpdma firmware*/
+int vpdma_load_firmware(struct vpdma_data *vpdma);
+
 #endif
-- 
2.34.1


