Return-Path: <linux-media+bounces-47461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6985FC730FC
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 10:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D6AF34E734C
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0670C3128AA;
	Thu, 20 Nov 2025 09:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UP9Vm4AQ"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CE33101B6;
	Thu, 20 Nov 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629861; cv=fail; b=TJxZYaPjQKmT8C0xDG/q2rtj6mmjaCu2b33Pu7VCQ6jhahN3u+mVcdGW8tQEPqX8DL8QGTFEIfJXENRwGwrHfUnheC6N5x9pzIHdO4B61aS0qbkHugLzWbeMiu51hayIgqsqUW4w8zspV4tLOV5GR4ajxDjEzQTbpJYxspk6XhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629861; c=relaxed/simple;
	bh=cVx7atmHtPvg8dKzH3g4atr5NjXtz5VOAFhwQdAsO3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=raBwf0oiukAAr9kB1/xif34s/w+k5SN3XWHXC25UjSrhEt0nF80zDiR/jOgN+8eB/6HKGcoDnjMeDPtpAjbTdDQZn2YXozwwk6jqccZxPpCXK6YCCZvk5ZgJdOHeYlWqkLGzHzwQqwCeinhbakk9C2ScgnrCyGuVfR6Xx9oVCB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UP9Vm4AQ; arc=fail smtp.client-ip=40.93.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXt0PAdVUDsCJtCJpWOfykv5SXzfjSUbKI5EmD0dhN7rNrflM2biFKrk1+0iWGs4J+OWAvIh9UT38afHv1gKklw3+QUq/YGZmied5sv7tNnNWLf8s8k/cuLBI5TjZUda0zRas4x4ZKjICEKFuKddvm0yPnXgq2lL2qeZuMvBXUmvrMEGS1mFQwyS0J+RCBy2NA59rqUUygNRafhWlvUV/P6hCmSyaX1KdoRFmwsnRpzofWIdaSHLT96wE8dnaHemSMPD751W4xR2nwtEoTNd3Z2/vYD1WgOcM4HvlbV3B1WCxRKvkEsCJTZ5hUlNlK2AaNWYJrg0r0KUnSJnTDoTqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYrtYxUv6A51odEg2u6qENZ+oiyy0ej6DjO9vrLDx+0=;
 b=P2ZTKrR5kSNXrkcBnpvMV4cnu2kP+G+VG4yHL3p5zsBLoJuNgUXBFvaz2b64tvATN0veGWsH00eZLfwmf9bER063a0nEqSt6bn2z2AW5ZOCGqVrGADXnrp9DXeeVjwpZt8QkKqLBp2MsGyGTFfrzFOMy4Qx+XL1UMONvkK60By/Nfq03dAlMhcSHeu/uNJsGuGkfCgCa7dmpG5hknrQv5fqX1DumoLJDXHFUj3QvEMgeF1q38xkbM8VZjI3Iw3m/EsF7SVI0NMfQMyBi6+wfGEWEN889piwjv/6fc9bap4vkz6lAPesErEhGJKU4fbR05bPHv2hH61ywGIDXgBW/tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYrtYxUv6A51odEg2u6qENZ+oiyy0ej6DjO9vrLDx+0=;
 b=UP9Vm4AQA8Z3ZJzljpz9DgA5DhGMTyxSx7KCbvgm6aGJWzdu+ts8Fx60IJ5Fb6Hu1bzCr208j12m5abYXW6NARiA5X2NlWgFQPpmQ1q/0S7dwNWH4/39K7jqwAQn2zNcJqe1mcqmWZbRqArtpeCxWrfMSN5/OYc9qjvLDMIFXzA=
Received: from MN2PR08CA0018.namprd08.prod.outlook.com (2603:10b6:208:239::23)
 by DS0PR10MB7174.namprd10.prod.outlook.com (2603:10b6:8:df::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:10:54 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::20) by MN2PR08CA0018.outlook.office365.com
 (2603:10b6:208:239::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 09:10:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:10:53 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:10:49 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:10:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:10:49 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9AXWe3413879;
	Thu, 20 Nov 2025 03:10:45 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH V6 2/4] media: ti: vpe: Export vpdma_load_firmware() function
Date: Thu, 20 Nov 2025 14:40:28 +0530
Message-ID: <20251120091030.2081594-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120091030.2081594-1-y-abhilashchandra@ti.com>
References: <20251120091030.2081594-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|DS0PR10MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 45772ada-6e61-4d8b-093f-08de2814b563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1VnoCwXrTldyPPIeDxOydyfdOFoA65xGKXTDhi2D7/7E1afVUOanVu5gKFm7?=
 =?us-ascii?Q?axUBxyMVjFcFJcR4aHqw683r1aw8LX9FGRE7PpuVwPYQSC9uF2ARbDLglrAk?=
 =?us-ascii?Q?jD7kuheQzfrpBmxwyLx0AbbGcDFisRu7CF0oXk5dUVHQxGapsxBIWw12VZnC?=
 =?us-ascii?Q?SK48jyQ50+Kd6Hr4IL4UXNPooJxFrs04dPgLLaZr+rNFAKFtAnnW2jZySC2V?=
 =?us-ascii?Q?Ku6WkcZB1PkqzJMNaBiP3fhLGQLH3YHyHXxPcQ45dlnm61f0f5nYBEJyd+No?=
 =?us-ascii?Q?FN2wncBEqty8GNEEAzRlt3xwOYnEESBROu9Gl6ys9SoQy0fvPIFyuk2GA8Id?=
 =?us-ascii?Q?ED5xeTyYtkRbMEhDceQuu3xlTYMkXjUmFJ/QvEneOVLTXC/Njh5ai6Ta3xfQ?=
 =?us-ascii?Q?eB0UGU/3ymIGkLp4qDUdrOUDcIl1IQ1mM3h6XeM/GMabzV94DNySAv4GUI/U?=
 =?us-ascii?Q?pXGjH0UhaCrkhWZ4PjJlip/MAskSRgaeCHa/HQuLV05Gim38zbZD4ave2xL/?=
 =?us-ascii?Q?pq4/Km9nEGLh1/X4aM+ejpxQrGOPgm/Lg91SFQfC9vLglenJqg2+0iR2GgmQ?=
 =?us-ascii?Q?moa0fvFAObqJvFwWE2adEgdw0Uu5Vm4Lul6GzMHQJ2XteXNaRDXTYR/7OUIl?=
 =?us-ascii?Q?Arhjq80Pz94EDjyi8e2WiMa6tQ9ifd47xyGfJn/ADAln5i+NYZi7by22T4XV?=
 =?us-ascii?Q?O+T/16PpjAccxEUnAvus+Ib4imdscyBvcxA8knlsfuDSbsxvcgWHzZXFu55U?=
 =?us-ascii?Q?CcWiv3kZIdE12KAdnsifnAikbX4dlOWLJQcX/dTAsxruE/dQjH6T9fE/gpOf?=
 =?us-ascii?Q?nVnCu309VNEUFYNAXXWSJ61qf4HaIGSUX7J7rn/+oXiI1RjCEgdr9OtCyyo0?=
 =?us-ascii?Q?FXx2gfajlRx+KLZQt0WSaw7g2PVvFNitDrt0ouyqBMZK2S1Y1vAP/zZvh/+C?=
 =?us-ascii?Q?Ocmv+107Q6E4xDuGbHsrmEkFnmw35vBZfckSCRYvCLXpOX9NLHLjw2CEVktU?=
 =?us-ascii?Q?LlFKttAV40/Qny6xlTIeE8Vysv6BY9nuboRYfr1l/p5hATqXBybgJd1H2FjJ?=
 =?us-ascii?Q?arHM1+S2nkxDQJyDXCT8jeEPQK2RB7CjW8GSpiMmNVMxLXjY4j3BvpvaZoyu?=
 =?us-ascii?Q?vP5U0UPfYZPnzSb+5mw9y2VLIExATs56NimWU4UJ0fEI9VL1M/ORmMmHFx8z?=
 =?us-ascii?Q?5eVWcjBz4I0Anxs/2rhehFGlzYynCuhr3qNwS7AQgrhplv5SJltF9/DbtQqE?=
 =?us-ascii?Q?0ZjhSSFDUOlz//ZDZHT2gVX6FCoh0cSC1yB0FYevGSDaVJBxcKMgMAr20e9R?=
 =?us-ascii?Q?3mKCBuFwI+b5pKy8XJYmiSVpMr1+gNuwynFjrZA6u70dEnE8uexFEaJmxKke?=
 =?us-ascii?Q?TYLzQuvHR05JFPj4magZN5ZKMbXyolsqMxUMB9H7z5djbL+f+qy9Sp/aileo?=
 =?us-ascii?Q?29x97jv044rQ4KDOL1Qr8tT/FE9I3YH7j7jzHrjydaWhcWlDXu7NXU5+SA2i?=
 =?us-ascii?Q?TeQVjT0fgdd3HLnGo1oT2eUuPZzQ5gJpKYeFsHi79G9sZ/aziAGN6WGy3M7T?=
 =?us-ascii?Q?ecLFHSs2Qerr6Ys6qgk=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:10:53.9643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45772ada-6e61-4d8b-093f-08de2814b563
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7174

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


