Return-Path: <linux-media+bounces-49679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6ACCE91BF
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E960E304794D
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F7D630F80B;
	Tue, 30 Dec 2025 08:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WPtMlG1A"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010055.outbound.protection.outlook.com [52.101.56.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76F30EF91;
	Tue, 30 Dec 2025 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083629; cv=fail; b=SeOpi86kwbY8CT7vqImlOQJw92qb280VyH8MbfkxkgsgCF3ES1Qaadhx78GGph+Fqm1mxLzmecxmMIvT8irss7W6beGL2ZlhZoejE+2h3HOCXN46Iuf5VTCnCXLNFAgJktVtnEQtboYzMnPrVbPbYZD0So8rYa7/cNJ1W36zjU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083629; c=relaxed/simple;
	bh=MH0T2Ax+E4hgeum5HN9RidA62H6Jlty9IrFpzbaovqw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7AkYHnA5kkauccZU0YJDrjRG7qdAMvukHomeTgWV9Tzemh5DtCaGL65kp0FzwkT9KB4QcbQMKiORAQqQ8BUg41EtdIfVUEknramjnnFidQK3FYJO6Z4LEVSg5DKSTBuaFQS0fCbdLYLt6TThWP64Dt6c5e8phjxARVajNpIACM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WPtMlG1A; arc=fail smtp.client-ip=52.101.56.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ds1MAhy4Zew5xn8vNLldAAxRZz6quPM+WaoG8JLzh3yrmsrvOXfVlo7MV4OExtfe1WbdAvjHpecXOYjBv5xgM3lYg2xj6K+FIOC7bsnrEUZWn6M5p1yx6Twh39KwojkOW0ghmIBjyorzNmOC0z7XJ00Q3ymyX4FAC6H8h7rp/ru2svtZJlgEGnXMy6CC/zpEQ6i61nbqC6sL11SeNKY1PyJk6EHVtEpn80YZtjydokTh3WjGZXpp1JCzAREUdjoS4MBf6OnGxjIbYkemhkPTuOLZWSnq6ZvPmZifrJhK7dblDpXUfzYFOJ3Pn8v1UH1PREQFJZB/1v/5OhvnHek8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7ikNIT4MR8L+cLaBK3OTlXuLy8oz0kNt5IXGZKfR2Y=;
 b=lstM0zjDuKl4W6T37Rg2mtLvByjdP2d+m/eMJP4buV4DCHfwYYrzpGiwsh45fw5uOvg5cxanwBS8/JPI/uaazc5sa6AEdCe2BPXxdIrsme/GQdphrfqT0v+cdwjlENmsUcyMtT/1sQJJWCE9oYHk4vJmnYDsTl1j4gW7JTvoQdPlFmvbGyDMqs9p+7Hj+T7+sHOCUOnlzfpNghYlx/liThFZYNA8sbp5xZ4TRct7DyEtTM5OiTV6q/CmhifBkozeWpj0zyJeJ4FNhq8PtZADJbwOTg/EAkrbDgDqny+VQixPyTfHskL5eoj66KXmBFZ3/waJP1RhcAMgNzm0Ez6CyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7ikNIT4MR8L+cLaBK3OTlXuLy8oz0kNt5IXGZKfR2Y=;
 b=WPtMlG1APNRUMo+gf/TBXoEGoC0Osi4HJIZRm5WHRARXpkW6Wp4QZAqHacEqzaHI6ltlDnDf5Jx9pXAdVY7lXa9kKj1yO/zk1tTQLy2WF1kXmgUIdjI3zR0jW7lU66/R5gVdDaAL9GMf7n9L/1q0sSAKY8rDaHA7YH1pDA4jbpY=
Received: from BYAPR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:e0::40)
 by IA3PR10MB7996.namprd10.prod.outlook.com (2603:10b6:208:506::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:33:45 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::72) by BYAPR05CA0099.outlook.office365.com
 (2603:10b6:a03:e0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 08:33:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:33:44 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:41 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:40 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:33:40 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9e579464;
	Tue, 30 Dec 2025 02:33:34 -0600
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
Subject: [PATCH v9 11/19] media: ti: j721e-csi2rx: add support for processing virtual channels
Date: Tue, 30 Dec 2025 14:02:12 +0530
Message-ID: <20251230083220.2405247-12-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|IA3PR10MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: e7abb038-e8ca-4c77-3b87-08de477e2544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UlzEkJjswo/DDYrxpwojO3KrU9fBV2cFEUlfv/4ZDhjtGlehJf7nBdfCD3if?=
 =?us-ascii?Q?HyCS5jPCVjSChsLGJUUDgkL66TKK5Pr2OB3jyLesgNbvsClppe6l694Qxzi3?=
 =?us-ascii?Q?Nw5zOimWAmzUryUyvc/7IzuU677LU1jc7K8SAECqzfq3cSum+haysG3Zz1rF?=
 =?us-ascii?Q?SmcmUjO6X+X/QpIrmfXaHWrgopmfHEG26ESn1EB3RqJxWte6J4Zgsq1xryJK?=
 =?us-ascii?Q?Vs43QPd/kAt1s86TCBlhhAHBRfthh42ojb/NlPrfYgH3RuaMKj16ayU0sChf?=
 =?us-ascii?Q?1q4rnrk9ehpMf6rxOyEVv5v6m3qFtQIcLBgsB6iUtGaPZjZ9/wvagy53i/A7?=
 =?us-ascii?Q?v26T+vd48fkYB1+fr1W+nly6pu0nTckaPKjjvrJtPYNPpH5kpbGNf4KYYajr?=
 =?us-ascii?Q?CMAtkOciF0eWxScZuN+50RiLoyCXxUsR/+3ANTqj2x7aliOvjzNsr7PrWAmW?=
 =?us-ascii?Q?vvg7rWTKwfRpBF+3U7k5v/ZuFc5ydzUK54WGjuriqyDNzyoXVONdbQLBNkOL?=
 =?us-ascii?Q?Ta5lR8K7t37Sl3Py5OnkOl4eE9zQHSsvn0+ntFm56woyICxGfVWXEGtRt5aW?=
 =?us-ascii?Q?CwNX8SFDw5yMVOF/TDwxbtPW/MVzN8VXUAjrHMWACHmKGUrqBjFrkgBLfNg6?=
 =?us-ascii?Q?OlS4WHQf2gcq+Q9Qn+7TxZps+qB3mPPAGiEUggaY3h8c6BDmyxStyweXiJE1?=
 =?us-ascii?Q?uWdTLOUtsIWfqxLliWkyOMlwB3t+96VTiush9hrZjNaTGTZK7uh9RU0o84Vj?=
 =?us-ascii?Q?4tRUPG+QMcEYhZj+4oE31yhwKSpeyCF2EPBIuPIF5aghVWugpEyZubC1SN2Z?=
 =?us-ascii?Q?vXnsyzIGsJ6KeUyZG+j12PFLXwp8KQBHfQse9Iu+aT3oE6pkZoUeW5gPGUVN?=
 =?us-ascii?Q?NICNnB/Mx83CNd6X2qqj615inIfOPLK9SQna8jHIwuPzs1829pjRgLUrruSV?=
 =?us-ascii?Q?RalT3i8Bunb2QN9ZyYKsYFVRU8AlC6c/bGi7BF8znob2NdTntRCTjWJ3+jH/?=
 =?us-ascii?Q?wDXKA/MugtFuvMiTz/pueKedl+itCGgvwtz3Xx8n5Yl2V2cP3OCglJB1n6i/?=
 =?us-ascii?Q?6cxFlLn4/zAK07WM4+QUEq9xxvCliv4XShj/g6Nc93O76PzzuX5AYYbMyxAc?=
 =?us-ascii?Q?P8QJCvhAaLgSSPsa3PPJL80/fg/rPjG3UfWJcNAKJ9TEddYKXYAdUnt/lrAn?=
 =?us-ascii?Q?Jd6Kv6KgYwMZYhtHeGK327mdjwpHgBb7mylrV+L5oqSw0QUK2HJyFQGX2rGZ?=
 =?us-ascii?Q?URO10sTa1Tx63zP1PJSSO3UEuhS/P0KNvsTswsBiW8rWPQ24huovYarc64Jk?=
 =?us-ascii?Q?RXL0uwcdV5kcyhgEzLl/HubrEMci7QXkAEL36iH96IYq8eOkLqdlO+bOvjT3?=
 =?us-ascii?Q?rC+tg0ofy2iSIDeNyzYYSGsbj+rAN6IDg2lNsZDMv5hbahtoTZGe0vlfPQ1I?=
 =?us-ascii?Q?hxIW6+HgkVl/IlpvjH+zSKNPCTrN195RSa9OsukoJJ+38zq27aqqyeWPbew5?=
 =?us-ascii?Q?U40tbjeKOoOxfOVWAqdRAELLEk7B+vNsH9J/evQOTTWejFDiBe7uWsrpDJGK?=
 =?us-ascii?Q?STgGP9w1p+F1L4xc6qA=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:33:44.9053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7abb038-e8ca-4c77-3b87-08de477e2544
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7996

From: Jai Luthra <j-luthra@ti.com>

Use get_frame_desc() to get the frame desc from the connected source,
and use the provided virtual channel instead of VC 0.

get_frame_desc() works for single stream case, but as we don't
support multiple streams yet, we will just always use stream 0.
If the source doesn't support get_frame_desc(), fall back to
the previous method of always capturing virtual channel 0.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 45 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index f54ad67ff3f9d..6f9f34aa26f1b 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -32,6 +32,7 @@
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
 #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
+#define SHIM_DMACNTX_VC			GENMASK(9, 6)
 #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
 #define SHIM_DMACNTX_YUV422_MODE_11	3
 #define SHIM_DMACNTX_SIZE_8		0
@@ -110,6 +111,9 @@ struct ti_csi2rx_ctx {
 	struct media_pad		pad;
 	u32				sequence;
 	u32				idx;
+	u32				vc;
+	u32				dt;
+	u32				stream;
 };
 
 struct ti_csi2rx_dev {
@@ -570,7 +574,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	ti_csi2rx_request_max_ppc(csi);
 
 	reg = SHIM_DMACNTX_EN;
-	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
+	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, ctx->dt);
 
 	/*
 	 * The hardware assumes incoming YUV422 8-bit data on MIPI CSI2 bus
@@ -610,6 +614,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	}
 
 	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
+	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
 
 	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
@@ -884,12 +889,41 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	}
 }
 
+static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct v4l2_mbus_frame_desc fd;
+	struct media_pad *pad;
+	int ret, i;
+
+	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (!pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
+	if (ret)
+		return ret;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EINVAL;
+
+	for (i = 0; i < fd.num_entries; i++) {
+		if (ctx->stream == fd.entry[i].stream) {
+			ctx->vc = fd.entry[i].bus.csi2.vc;
+			ctx->dt = fd.entry[i].bus.csi2.dt;
+		}
+	}
+
+	return 0;
+}
+
 static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct ti_csi2rx_buffer *buf;
+	const struct ti_csi2rx_fmt *fmt;
 	unsigned long flags;
 	int ret = 0;
 
@@ -904,6 +938,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	ret = ti_csi2rx_get_vc_and_dt(ctx);
+	if (ret == -ENOIOCTLCMD) {
+		ctx->vc = 0;
+		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
+		ctx->dt = fmt->csi_dt;
+	} else if (ret < 0) {
+		goto err;
+	}
+
 	ti_csi2rx_setup_shim(ctx);
 
 	ctx->sequence = 0;
-- 
2.34.1


