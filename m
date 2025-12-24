Return-Path: <linux-media+bounces-49458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7170ECDBF52
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 11:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71C583007D9A
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 10:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC79314B86;
	Wed, 24 Dec 2025 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e8JzsQBy"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013046.outbound.protection.outlook.com [40.107.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB8F2D3A89;
	Wed, 24 Dec 2025 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571664; cv=fail; b=ewHLxTYQMG2YpLCB6VdUHorDLmvj+mF8EQeJZgFwqGjWR4WpYtxCHII7Iua+TMhTEn3LZ1LS1CJCoblDjPssaikXvOAAOER1SZrWhCng1PMsrtPYVm5ZYkVJegSqGKvmHPoUOT/FixBf812rIWgpmKXxidN7hKLwD8qUEARRSp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571664; c=relaxed/simple;
	bh=AVnm9OgQSS23Py9t5bMjg8D/EIp64K0NhOg4nsoXH6s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QwiBbABaWmAXHLSLESLodZ/D7QURraIoS6zSv8epd450JkVEt3exkbAeQikJ6hNcnWruDmCh5N+VOkOtiLMheeifROxQ95ic35FA34Hh/sLOfEbObcY0Yob1tvbeMYcw+hwurgxnKufRwsEiv3yc1q8iPzeY2vMAUrCV5dkkuUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=e8JzsQBy; arc=fail smtp.client-ip=40.107.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FCnPGzKvWUAv+vSuetkK7fmMyWZUUAukF3ndmUhVTXiG2oAB+O4Krp5aWpuwe8Zn8tS9nm7KveicMJjZcMOyEZjxK0xpJxQswEyPJv8PqZnnfUFYXI4SBpQ4cj7VHN6sy8nxGseuHlw51sX2+dvOd72FGFIMHHBI241PAYmhOr7GllVQVnPLgONPcXoklDXnOESqJWn+y5quSLQ9hmxy5NK7IDNIQsDMuSJrxWwLtEwcPvaa4c2YGlS3MCfs8C/U6wiYkdkyauoWkVp3K5R6KgrVXyd5lNkNNyFvwX+Gu4MHX1pgeF8nLFLtvw1zH0hJpYSbYnnbfYKt7h1CbQdGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/mkxM99aQPInPdyi7+eKqBWHtoPS0AiDVRlKGOReRs=;
 b=Ju+mdcPdtAY+nahGRqlewpwFaxp48GB4d/DphHTxm5NrAgeQl4Jb7o4YA9+ykFlWKKWBO5X/cUsTOZP9PTD8Vja6P7EiztGMl9vTXY/PO4ZQrpqXOxcR7WaVfuztTFziaRhUWsxodhE+gamvr5t0K2rft1lTjy6Cn0gnoNoGrkmLD8zLGObq826lyMc1kb2/iePmuZu9IPs/ywgiQ2PfQQD5kaS4sMPM5mF7rtilDaQxnxPrUAnfaquMUQAbrnzon7x+HHlT1kMB6YWgJyi7UhzdnUXxsel/zcUEZf154Jv2+2s2uyBl7vUQsQMx9P6KZs4DhCpK3NKR00rU762BfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/mkxM99aQPInPdyi7+eKqBWHtoPS0AiDVRlKGOReRs=;
 b=e8JzsQByeWNRRsjnnF6DyHAaP/ojR8GI92yraR3cWscIchPEu3j3xM5ZnQTvjynoh4LQ8Cp1TuLluAekpkcHiIseYBLdeZ6pICswRA8bYElxz9HMn96ssApUire3g7H5BF8VcJw4p8shLWQPn8Q6scUvEEVqbyfpWLvjSzWRCA0=
Received: from BLAPR03CA0031.namprd03.prod.outlook.com (2603:10b6:208:32d::6)
 by IA1PR10MB6145.namprd10.prod.outlook.com (2603:10b6:208:3ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 10:20:59 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::18) by BLAPR03CA0031.outlook.office365.com
 (2603:10b6:208:32d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.11 via Frontend Transport; Wed,
 24 Dec 2025 10:20:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.0 via Frontend Transport; Wed, 24 Dec 2025 10:20:59 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 04:20:55 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 04:20:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Dec 2025 04:20:55 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BOAKk8f412110;
	Wed, 24 Dec 2025 04:20:51 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<sbellary@baylibre.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH V7 1/4] media: ti: vpe: Re-introduce multi-instance and multi-client support
Date: Wed, 24 Dec 2025 15:50:24 +0530
Message-ID: <20251224102027.3343361-2-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|IA1PR10MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb22ab5-0c2e-4566-08be-08de42d621f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8R2PH4FmsvFomfMtpSO11xNj3WHmeMexQFce/BRxagZsfTtjPgrb++CR8Ckq?=
 =?us-ascii?Q?joDC4qPqr2ZXlUKSpWhsxys2KhusVoUMiVfHd/1VcYeCPgukQ9HvEWpJaxiB?=
 =?us-ascii?Q?BQ3BOmeF2aNHFKbpuTnAON3dklrDN9KI4m3MA0fw9v1JskHG4SioINON09/W?=
 =?us-ascii?Q?8DKKhiA2hZ5+5o8nDowcKpdxJkiCjaqnznTL66Xq6mh51Cr0Si6b5DRDs+Zd?=
 =?us-ascii?Q?gUJylVHjcLpGwjsGJPpmV6pyRkFZYSYeWvX7oXybDrH4ZaB2V6SIGKCVrsgh?=
 =?us-ascii?Q?/NVF5xlhE/6SUu+6aJPrj9Ejraa/k0D9JaskzWi08ra+ADQykzmOzvqO2agq?=
 =?us-ascii?Q?c4HiDRlqC3+UqHpZ9WmVaagbmZHhRL6OTfPy9lr12Ts/qNSJRm/YJiAzD7cN?=
 =?us-ascii?Q?zW2AUzcMZnLVLCn+T3qyZs3z5tPzuE6lOl0/Qw54SxNYAdNlnpwgwQ3dGPy8?=
 =?us-ascii?Q?LGuwWnlGGXjD1UX7JLq4BXg9OupYQhplQ6WwZohva/JoRqTmCR5Sl87OrodW?=
 =?us-ascii?Q?cjLN6ghzvt2TAkH5RANFVcp/QV6MEdKjCOx6AxB+D9SjyQGFT/QOh7Zp5XjW?=
 =?us-ascii?Q?1R98jZScnf5s6xPwZ6aJGOY3Y9xBTOsw+z324nXjuDtpx0bvPLdrhc/RiBw2?=
 =?us-ascii?Q?AgzxlkNNo1/pOoGcrU2xsyHrinbgdB9q8NL8AL8LtEokT6DHJZATtXNSFv8q?=
 =?us-ascii?Q?ENv+nD+D9kvpSVQdw8uKF80iu8ahJB9QjYVXUG8k4fS4Z/AOKeYI/elIXbYJ?=
 =?us-ascii?Q?VbGyhMAm96TrdsYwZQZB/p4jeotaUIRoLLMmaIttKK93OicbqVDOe56tsH8n?=
 =?us-ascii?Q?M6UipvkeUpGO087uk30LvYojcKsQDAJLWmVcb/F9mkBCJ1katzAx83D6u4qh?=
 =?us-ascii?Q?TVLN6kiF1yKHjzXPbmDLo5U+vXbTKOFUrOVd8PUdBMWflm8OQe/L1a5Qkzrj?=
 =?us-ascii?Q?8x6YfXZX9PZ/jBzj/fo8YsC2biAHEzHCCKANFv8y1suwza4SCOizZWifhg0c?=
 =?us-ascii?Q?6qDZln9gCqmPqlzuiiyLon7HHozdyJlifAogBdpJurSj5OtoNP6MdUw2G2Gg?=
 =?us-ascii?Q?ull1a5E/N88OM6bSg+y+bEIaL+uGvw1T02ut6UXn16Nzgm8i1TLs0wzzolj9?=
 =?us-ascii?Q?Yx91cECNQGTOwexxv7XeZ02BJOj/+ipMtp7N328vkTvVJcmwoadpFnnjp4Rq?=
 =?us-ascii?Q?t6CexdyldYM40KxQMOQXmNwuoM07sy0AXt8KbuzN5Oa61eL+j9lqgAi6iv2y?=
 =?us-ascii?Q?L6Bys/QhmCJUHgJlOxVj3JNSQu5B1QLB/HA3W5Qzxm8pa1H3q2ERKx/SfbpO?=
 =?us-ascii?Q?m58Mqj/I758pfoycgi1o5V2C4jvaBlEXR0mAc5k3V+ItwfQM8SbOZrfzyZei?=
 =?us-ascii?Q?t0/jS5lSo25ciJZ2xfRkPpbORx6sjbIXPMnQYwJ/i9y7wIC8spGkQZXfrmuP?=
 =?us-ascii?Q?HdhygX1eFzJ+6JRx2EjoIuI9U7NcNpWw871b0S3VVvGyjuDFj5wbVRRCASCg?=
 =?us-ascii?Q?8Ej87I/6+vA+dmbmmTcUAcFtzF2bwP9ExfP9DAt/yg5FwNjZ+PEbhVRsu+fp?=
 =?us-ascii?Q?0+ReiO1RfKcZXmsRlrg=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 10:20:59.2457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb22ab5-0c2e-4566-08be-08de42d621f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6145

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


