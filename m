Return-Path: <linux-media+bounces-47460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F5C7308E
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 10:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 63BA12FC54
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF97310774;
	Thu, 20 Nov 2025 09:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TQ4UOyVw"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431C3101AD;
	Thu, 20 Nov 2025 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629859; cv=fail; b=a0kAV2i0kJFepg4AduuP1OPchuVN8mfY0kg/nhI2llnxy6hhECHHCVaif4IutBClP/24th42FPp1IhQHu1CntscbJqP8OaSWzyvpaRwtXbz90s3lPX+eD7ZffNaegdCwd0MaGoOC10gEuW85ocm3sqbA7bTNAkVFSTr02Q4vDRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629859; c=relaxed/simple;
	bh=AVnm9OgQSS23Py9t5bMjg8D/EIp64K0NhOg4nsoXH6s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SHSNqAiExwe5yWTkzJjebTt/vzceuOQfii8oqtPjoahj/hjU0Kbe7/43Zw+2cLPl5NuFjOEP5LUOvV4BH8MwqG+xZ60DFCd+Sx/8BuxpsUjvHyQdGcHrqWJGuyNfwH9at7sPIhhxtUWW0pPchFbjUoGxKQf8mFgpQXpZVMWA5jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TQ4UOyVw; arc=fail smtp.client-ip=40.93.196.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEDtiPbrkVz9MP4NVmwSRdNSQrriWfHge2MSwQwkRwjUfHNIG7pCTfsPnEMIEwh1nVdasRMf/H7NRdWEFgS12WlNr2CR4Z3bS6ACtRDBDEjAG4riS1rm/FTwe9K+XT5b1cvSZKoGakPsa1ZZHi+Ie78RipKnOk+JCtfAykCP3bAOg98jPQucQz0UL7KAWFDgpPaYZZr/bgF5fJ0cDBbax0JqgUqE2aCRuanBd9SrUCVHhC9IayOo6j1spPCubbKf1eZ1FL4CHfwreAc/OcjHF1KZy6I/IdezjJHy3t0Pi1GbYf7OwiDl3x1PT2t6LIoezapwTwixt2Itbz/o1M/r6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/mkxM99aQPInPdyi7+eKqBWHtoPS0AiDVRlKGOReRs=;
 b=bBt4GPLFjiRcZwq/VtH9zpAy9oUJmyiAIf5EsR009gHVNE8Nao2ZayOAQ4dmz5viYlqI4ptozc962pgb5P5G3bqoEI9HdPTDuhUKMd9120hpax8xZsYxLATXomsNS3nRyLcTL5AkDf+jG2txMyw8oR0NHa9ri7MWmAAq3sgGAH6K4XqUdMymCEewsrAR0JOmL3NuVfI9+KQlnujJzdIudPJAwheg9bRMUtU1fUDxgJLPGv6RxrcwB08B2xoEVodrFzpI39vWnugz8vkdyEAQl3logZXzJ3xUfRs5APOagQdr6XK0yyN7wYCS1IJJ1iCw8ZaTU2s6HxNV/MyK4ONxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/mkxM99aQPInPdyi7+eKqBWHtoPS0AiDVRlKGOReRs=;
 b=TQ4UOyVw2PxfM9pjnfBH301kmf8xTmN9kPzEA/7z6EUvGRFNDdalpalX/vO805oYVNoekXdpB4UfLRI2r4+eGPBsNr9n3Pjab+EjKutb2dDn4MPlTOumYO/fDviKECt5yw8wVjkakOH7AGHjkA6OSeiAgoZN/fNifQz7uF4Di4M=
Received: from MN2PR08CA0003.namprd08.prod.outlook.com (2603:10b6:208:239::8)
 by PH3PPF558EA2A2C.namprd10.prod.outlook.com (2603:10b6:518:1::7a2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 09:10:47 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::b5) by MN2PR08CA0003.outlook.office365.com
 (2603:10b6:208:239::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:10:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:10:47 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:10:44 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:10:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:10:43 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9AXWd3413879;
	Thu, 20 Nov 2025 03:10:40 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH V6 1/4] media: ti: vpe: Re-introduce multi-instance and multi-client support
Date: Thu, 20 Nov 2025 14:40:27 +0530
Message-ID: <20251120091030.2081594-2-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|PH3PPF558EA2A2C:EE_
X-MS-Office365-Filtering-Correlation-Id: c212be2b-11a2-46eb-c31a-08de2814b15c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KD8Ah0hH5HacZVsbEsgzk7I5BLU/AP/3UdGj7hKOsJsYtPkwTjZpc8lW3ttw?=
 =?us-ascii?Q?AKxi6kGLokqY8q+e+zqylEDDRbGzU5ele4Zjo+qMnPMeQEEwJlvC0pwnEiuG?=
 =?us-ascii?Q?PFf4f46t6QBtxAJ4NgXK44ecuT4nSFx1nNPQW5C1bOySKchqDN8YiNcozskY?=
 =?us-ascii?Q?fho1KqSQs5LbMN2CTpK00OY/R9MS3HUspKOqmRK90Dh16wTWkYy2S7ix4d/t?=
 =?us-ascii?Q?2t6HpiUxyRvwCRBf14Wtta5AWVm2zuvfZTZso9pIAV1Ll8YXsz5HSdAoZJ2w?=
 =?us-ascii?Q?AVPB2Tv04+AvRndnhl52RY/LkKtLgCvQjrUU53pyjfpFTsNd2VLSNzK/0Z8y?=
 =?us-ascii?Q?bxnQNolrDqbhke91wO7F+8MmP4cSHuOJCC6ka79wTtKDoVrinyaBiWIMVfQE?=
 =?us-ascii?Q?wSFlXqm4sp1l3tKnaEx7mpQs55ppp/qEwJIyeSMpsSN9qmk4662O3n7F6SjL?=
 =?us-ascii?Q?GDUbQX6KywhtHjK4Wi9IuNlhkeUc4yLsW/7CGXHXcdnF4J7u35ZbFcnKEMTe?=
 =?us-ascii?Q?SkH2w34bvkr3s12JUWr6LXdk0tkfu4ID1Bas1z3GCXmB9WLylmyzW1Wq9KAc?=
 =?us-ascii?Q?XnCDgID/njGQCp3U5jmgszjClrcPu3cmrcE9U1kNkB2onDOq8RO3ibtUEfsP?=
 =?us-ascii?Q?sFOxSNIPwMkOf2cGKiKn83zaxjVBapk5HnqHKiRm7SBDJ5osKe9TwYRpiGCv?=
 =?us-ascii?Q?7puZOejpTMQg2jCEixu2ehxtJhUohkL2fwr9S525gqFJdeBHkQ+alt9CoWHZ?=
 =?us-ascii?Q?GjulFLyPcx7Li52wpwohm5LwF7CqFCIE9zgZp2Y0Fa/E5x2GpSbiqnw4qvBC?=
 =?us-ascii?Q?geMydpFZ74wDG7YHZqNBu5v9I9YY/EXrM5/s2JRFuyILJRGxQI5d6sKK7frK?=
 =?us-ascii?Q?pBrkduvsGWzSNqpliOS1wzEj0VaO5z87Uc+U3XNAk2TWfPATGcREWskJhJiF?=
 =?us-ascii?Q?PwE9Oob4CYAiSVfEtzFDHGTquG5y6FUtlPoQ5rriYYwenWSmIr9I4ngPTbMb?=
 =?us-ascii?Q?JEkVzHymRHaRo0aNoSV+qvjKWCHRa0+zJTrvClDLnTmsMCdYQAng4HgOZKOr?=
 =?us-ascii?Q?enhn1X4CPyxrMKuZvG9DWgx0QSoi+gKsXApSZ4t35Wa1jJY3jnHBvbTLdpdh?=
 =?us-ascii?Q?IwJpBZ6EwRFk2MbWjvzyJcxZ92xzBwLSDLqBSSkTVAEoq1W2JCA92bLuzcBf?=
 =?us-ascii?Q?48sbxCvHm3n3GLc+vdOiohZmdkvNuPDkrOjwSwszP7ZAezbN41DHqPjXYu1X?=
 =?us-ascii?Q?6/rxjVHK0HfD/IqTveUIxjhXgCGpF4EI3JEUugDeZz9E1Xp3o8hDgljoFEmk?=
 =?us-ascii?Q?uZCyCZiR2I78ipiaZirdaPFjvG1tP4Z4WW7cENjDGxy+xUYxpW9nT/4fY65G?=
 =?us-ascii?Q?18V4AzMug9twwP/3rI6kiomhAf+8uVRMZV5bhKcouiLWL7kur5+3VYiFRhoc?=
 =?us-ascii?Q?K91ETw7UcuRjNWEAL9Te0R/dJTIOMZK6npaKfjb6ZEjsZWC7cL5rwcFXuSCn?=
 =?us-ascii?Q?k8BAENHhx+5VzDEgUDlvE1t+UMRHhiJtl3lHSh3gY8HyZzX22ZSt1YkdYa0F?=
 =?us-ascii?Q?LEkpuF1odmNXP+b5cPI=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:10:47.2225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c212be2b-11a2-46eb-c31a-08de2814b15c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF558EA2A2C

vpdma_update_dma_addr() was originally added to support multi-instance and
multi-client in vpdma. However it was dropped as it was unused.

We are adding support for TI VIP. Some devices may have multiple VIP
instances each with its own VPDMA engine. Within VIP, two slices can use a
single VPDMA engine simultaneously. So support for multi instances and
multiple clients is needed. Hence reintroduce multi-instance and
multi-client support. Also add kernel doc and switch to GPL version of
EXPORT_SYMBOL.

This reverts commit 9314891df119442a6ec1518b3d872c330e2bf1a1.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/ti/vpe/vpdma.c | 48 +++++++++++++++++++++++++++
 drivers/media/platform/ti/vpe/vpdma.h |  3 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
index bb8a8bd7980c..29ee1918bc1c 100644
--- a/drivers/media/platform/ti/vpe/vpdma.c
+++ b/drivers/media/platform/ti/vpe/vpdma.c
@@ -552,6 +552,54 @@ EXPORT_SYMBOL(vpdma_submit_descs);
 
 static void dump_dtd(struct vpdma_dtd *dtd);
 
+/**
+ * vpdma_update_dma_addr() - update DMA address in a descriptor
+ * @vpdma: VPDMA device context
+ * @list: vpdma desc list to which we add this descriptor
+ * @dma_addr: new DMA address to program into the descriptor
+ * @write_dtd: descriptor pointer used to compute write-back address
+ * @drop: if true, set the drop bit in the write descriptor
+ * @idx: index of the descriptor in the list to update
+ *
+ * Updates dma addresses of the descriptor at @idx in @list.
+ * This allows reusing an existing descriptor list with a new buffer
+ * address, instead of rebuilding the list, which is needed when
+ * multiple clients share the same VPDMA engine. The list buffer is
+ * unmapped before the update and remapped after.
+ */
+void vpdma_update_dma_addr(struct vpdma_data *vpdma,
+			   struct vpdma_desc_list *list,
+			   dma_addr_t dma_addr,
+			   void *write_dtd, int drop, int idx)
+{
+	struct vpdma_dtd *dtd = list->buf.addr;
+	dma_addr_t write_desc_addr;
+	int offset;
+
+	dtd += idx;
+	vpdma_unmap_desc_buf(vpdma, &list->buf);
+
+	dtd->start_addr = dma_addr;
+
+	/* Calculate write address from the offset of write_dtd from start
+	 * of the list->buf
+	 */
+	offset = (void *)write_dtd - list->buf.addr;
+	write_desc_addr = list->buf.dma_addr + offset;
+
+	if (drop)
+		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
+							   1, 1, 0);
+	else
+		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
+							   1, 0, 0);
+
+	vpdma_map_desc_buf(vpdma, &list->buf);
+
+	dump_dtd(dtd);
+}
+EXPORT_SYMBOL_GPL(vpdma_update_dma_addr);
+
 void vpdma_set_max_size(struct vpdma_data *vpdma, int reg_addr,
 			u32 width, u32 height)
 {
diff --git a/drivers/media/platform/ti/vpe/vpdma.h b/drivers/media/platform/ti/vpe/vpdma.h
index e4d7941c6207..5b3a0cd49a3c 100644
--- a/drivers/media/platform/ti/vpe/vpdma.h
+++ b/drivers/media/platform/ti/vpe/vpdma.h
@@ -222,6 +222,9 @@ void vpdma_free_desc_list(struct vpdma_desc_list *list);
 int vpdma_submit_descs(struct vpdma_data *vpdma, struct vpdma_desc_list *list,
 		       int list_num);
 bool vpdma_list_busy(struct vpdma_data *vpdma, int list_num);
+void vpdma_update_dma_addr(struct vpdma_data *vpdma,
+			   struct vpdma_desc_list *list, dma_addr_t dma_addr,
+			   void *write_dtd, int drop, int idx);
 
 /* VPDMA hardware list funcs */
 int vpdma_hwlist_alloc(struct vpdma_data *vpdma, void *priv);
-- 
2.34.1


