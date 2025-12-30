Return-Path: <linux-media+bounces-49681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6BCE910E
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:43:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE0FA3038F52
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C8A3126D8;
	Tue, 30 Dec 2025 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bIbhCtCT"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA32C311C2F;
	Tue, 30 Dec 2025 08:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083645; cv=fail; b=uOJ3X8GlW7cqjxUTXE1kqNUEbHQgHpbiGvNGxRFv+GlVqq3alUXOgnoygJgDECic/uY3BH0rp0pQ3L95vUqbdPOmKO9IZr+eTxLscdxj9ZHh13tLq5EAglBfsgsdTnLSmKJiGlRhuS95HMoYrPpO8l4HIAO4cFCdM/Lnz30q5Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083645; c=relaxed/simple;
	bh=uffp+9uB6pFcPrd0H+lnVpRwF7ZWsUmS2mKNtN49KNQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1zzxuTxiHv5r125FpPylGW2mzzIZEydGSIU43BM9KqlDFSUAiyYI82qxlFfXDNFviX4GeH5+q9YHzDeGoLFHqhtM0Fg6e1dFvVx/KCs5TIq/kWG+e9TS0HVeumy9RxxrVygJRYB/9UW3vQZuYynmZfMacpEVpGWroXsvEQybAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bIbhCtCT; arc=fail smtp.client-ip=52.101.46.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySxLoirGElX9PWGRow1KkmF+NazuuF56ykt1WKWykzkmp4ocw6wfKxWPeMEURIqShCT8JKNkUvzlSTDLV4pV42W0kBFZNzDw1KyxLCB2VZahmS02FHjvp0AUacH8JmSxEU2e4THHJh4EH5ct7rra90bLbUeNYbkNF3wzHdq1Wq05xQpwHqU1Z40LmlM/+tnGyKzpS0Gm5cAMXlD0CDX5ikNmuqbv2wh290HCxlObtviGZ+fASFlSfyG42NJqAb3FUcSJUKKJLelBi6lIF0hUSBSR1/Z2eJVWaSJsSvRA2ufbM/1sah/2QAZsWWL1Vo30IYkzAQXYIQeYO0uVAvf8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kflOiFBwml23WvQoevx9jsm45zeRcs2so4v7aPX1GwM=;
 b=k2pZ4BgITWxmqhfTw2gfduFqvPnI1Go47f5C4/rTqqODOKWrfHdLJnaToEaxbKThPZRwT06kzbqWNAi0xnVS2SzPgtSHy3/74xNzdJtPrLCgbhyeqk/GVTL98LmoK9K9buxZFIhfizGqAFInTOR2rDpdD/UC+SN10LLdIA8rA5PVUN+DMRIFXfCPY9rGPNxEg3lhMRqd9VFlfoBZr3kLJIkznuXw1jxC/+g6TEvgbx+7XrA9FcH1oR/68xk5kKtWRIe0tV09//8BFXM4MKlTqN5QEgPcwDRbM414XHfUzgQbd0T1iMKymsVeijYtnrUXyeZhychKcKqmpNx9uxzhSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kflOiFBwml23WvQoevx9jsm45zeRcs2so4v7aPX1GwM=;
 b=bIbhCtCT+pO0HiA6GVIYc2kQXommIiyR/ixaVHxoDxkdutWOIpna7o3aSBes17lXG2Pbef1JNqWG/p9EpJ9LWCG2imFAbJFZpx9FvemX3ZEX4Aq8nQnNXZtgSDvv4YgpBMRRs1ApBaGLy5MflcC6avFW90y7qdk/XfSbeqOdZJM=
Received: from SN7PR04CA0220.namprd04.prod.outlook.com (2603:10b6:806:127::15)
 by DS7PR10MB5120.namprd10.prod.outlook.com (2603:10b6:5:3a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:33:59 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:127:cafe::17) by SN7PR04CA0220.outlook.office365.com
 (2603:10b6:806:127::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:33:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:33:59 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:54 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:53 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:33:53 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9g579464;
	Tue, 30 Dec 2025 02:33:47 -0600
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
Subject: [PATCH v9 13/19] media: ti: j721e-csi2rx: add multistream support
Date: Tue, 30 Dec 2025 14:02:14 +0530
Message-ID: <20251230083220.2405247-14-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|DS7PR10MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 7969cad7-9983-48d1-10ae-08de477e2dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wVauWRz2/TdJ5Jdsh07wBjUT9mtcbKMGeNDurVp6CpnKa5OnX32foCCJBHCF?=
 =?us-ascii?Q?HxJ+QfMhaOVexJUebdQPL6QEQcTYV/iwjSL97IZmKMNuaAP6yD9HgSWu/F6k?=
 =?us-ascii?Q?C0TZu9DwWXXlDwSVXZsxhRJH+u8+wcM6q+WQpnC/n2xVXz2i+smGX4ceEJvV?=
 =?us-ascii?Q?4yFGPDuNrVH/PCQc2dDqb5D7uQN9ujqEukC0wnfAuZmUkZzUovNpGWYuqj3+?=
 =?us-ascii?Q?UJFbfZpKyeCl6gUsH7pnsm1aWGfMK19wDLcaB4xp9O1PBoEThDIIOcRCZ0Nr?=
 =?us-ascii?Q?X+jmEn0kLTlptZ6kadpw1JHNJ8F5XNqKk2AJKG+6RBjkRVcV04B/GqgxPVLQ?=
 =?us-ascii?Q?TJ7NDAOmt7o2GlvOeOZpvWctvyAOVsihSp5qUCLNygVMHdMGF/gSRW7/ilns?=
 =?us-ascii?Q?o72WGCN329kAxJ0S/O0DpoLgBmuFCAwyxTaBbhmu7BGzj/N+rHHxybhTwmsS?=
 =?us-ascii?Q?9rzHT7nfEIvoYAFgTKVAFOjSN+aeqDwKeCiOFv6ChlSmFj6Mb09bsBBZX9MA?=
 =?us-ascii?Q?GfgFMdTHKjH2CPbCJbY25xQcINiZ10CUhaO/1rSgyYlho8CfdfkXpcwUFXtF?=
 =?us-ascii?Q?Psl6s64k7yXomWHpVM4lUxOn3Aas++JWACK/b1pgskvRZUTtQgjMeWKw8X/S?=
 =?us-ascii?Q?DkPpCur8wpdACsBkOXUYG6PakpJH3AOBa14TGUDDRD1pB+p14f+LpyFlt9rA?=
 =?us-ascii?Q?eYamjBcgSHN6VSHJbZUWpEFepvXypBHY42heBc+hYHRbRnlu70cP0iJBFsVI?=
 =?us-ascii?Q?FNjxGsfuhi8IxDKhc33crrQPIqXI7RlRwTL+YpfSoK64ITKVPNX3k+0WRbzW?=
 =?us-ascii?Q?N6t2Fi/EqmqLL8MG9F5EoQ3roaXvpxt/QMG0f9g1voivA3O1rXP5rWfXAvuF?=
 =?us-ascii?Q?QbECxhaYL3duqBcrunQ9Cql6theTVBUVCrZ/SUbFcnMD91xRjZyqTK0Wrwm4?=
 =?us-ascii?Q?9WZM//pxv3RA+iO1M3/AvJML6A4LxFjRTZwPRda3+jE3FCIoCV31tid5gKOm?=
 =?us-ascii?Q?lgSrlM0WMhP6vs7BZOehfnky3rcNiL7finb9ftJOgXZIEZYnmW7EDx1PfUfh?=
 =?us-ascii?Q?oHR5cHEUihyqKKSQAhzCsTcVnxIuNXHAv2PHiFJcIXFanAsYG/Q0GYhW0NiJ?=
 =?us-ascii?Q?xcAOFnSDSS/lmNCulVuvmjo/LAvfeREKnmaCvgtWlaqIvoR/k4HCSr68hsx0?=
 =?us-ascii?Q?5dBMuPkJJM7lVkuiMbKdrtYA44m1lb8RsGfcr4mdWAkc0TkoMzbDqNkTfaeC?=
 =?us-ascii?Q?SQXS0ny9G2hXOfMYi1sVpZYwghu9LM+2kzeqwx5A2Qhr+hrbfQGj+Om53njq?=
 =?us-ascii?Q?TNlEMfMvr7LDG3dzioGbFUX5wUWf13fezr1qfdy9RvfxqLl/GpdtH9v7Xqi+?=
 =?us-ascii?Q?i66V2RTW1GqHTSlEgiOQwKylCCb7Ans/myaaNyWrdlYzNo7BP3UVe8oxOYjQ?=
 =?us-ascii?Q?wltP9KmmqmKBk0Ra9U3hg2pEu2Dk66WD6NljzL28KvB3wdot2+C/EjwkNI64?=
 =?us-ascii?Q?7q7wMB+6E8Np1bSpNWxAaWpsYOidShHYwJHIvyfpUaWtcteRVa4vCZrgWMT3?=
 =?us-ascii?Q?/tMwzTTw/UB6U2yeyeM=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:33:59.5881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7969cad7-9983-48d1-10ae-08de477e2dff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5120

From: Jai Luthra <j-luthra@ti.com>

Each CSI2 stream can be multiplexed into 4 independent streams, each
identified by its virtual channel number and data type. The incoming
data from these streams can be filtered on the basis of either the
virtual channel or the data type.

To capture this multiplexed stream, the application needs to tell
the driver how it wants to route the data. It needs to specify
which context should process which stream. This is done via the
new routing APIs.

Add ioctls to accept routing information from the application and save
that in the driver. This can be used when starting streaming on a
context to determine which route and consequently which virtual channel
it should process.

De-assert the pixel interface reset on first start_streaming() and assert
it on the last stop_streaming().

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 259 +++++++++++++-----
 1 file changed, 189 insertions(+), 70 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6f9f34aa26f1b..4a063364f893e 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -137,6 +137,7 @@ struct ti_csi2rx_dev {
 		dma_addr_t		paddr;
 		size_t			len;
 	} drain;
+	bool                            vc_cached;
 };
 
 static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
@@ -144,17 +145,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
 	return container_of(sd, struct ti_csi2rx_dev, subdev);
 }
 
-static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
-	.width = 640,
-	.height = 480,
-	.code = MEDIA_BUS_FMT_UYVY8_1X16,
-	.field = V4L2_FIELD_NONE,
-	.colorspace = V4L2_COLORSPACE_SRGB,
-	.ycbcr_enc = V4L2_YCBCR_ENC_601,
-	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-	.xfer_func = V4L2_XFER_FUNC_SRGB,
-};
-
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 	{
 		.fourcc			= V4L2_PIX_FMT_YUYV,
@@ -567,8 +557,10 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
 
 	/* De-assert the pixel interface reset. */
-	reg = SHIM_CNTL_PIX_RST;
-	writel(reg, csi->shim + SHIM_CNTL);
+	if (!csi->enable_count) {
+		reg = SHIM_CNTL_PIX_RST;
+		writel(reg, csi->shim + SHIM_CNTL);
+	}
 
 	/* Negotiate pixel count from the source */
 	ti_csi2rx_request_max_ppc(csi);
@@ -889,29 +881,69 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	}
 }
 
+static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct media_pad *pad;
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *r;
+
+	/* Get the source pad connected to this ctx */
+	pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
+	if (!pad) {
+		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
+		return -ENODEV;
+	}
+
+	state = v4l2_subdev_get_locked_active_state(&csi->subdev);
+
+	for_each_active_route(&state->routing, r) {
+		if (r->source_pad == pad->index) {
+			ctx->stream = r->sink_stream;
+			return 0;
+		}
+	}
+
+	/* No route found for this ctx */
+	return -ENODEV;
+}
+
 static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct ti_csi2rx_ctx *curr_ctx;
 	struct v4l2_mbus_frame_desc fd;
-	struct media_pad *pad;
-	int ret, i;
+	struct media_pad *source_pad;
+	int ret;
+	unsigned int i, j;
 
-	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
-	if (!pad)
+	/* Get the frame desc form source */
+	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (!source_pad)
 		return -ENODEV;
 
-	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
+	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
 	if (ret)
 		return ret;
 
 	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
 		return -EINVAL;
 
-	for (i = 0; i < fd.num_entries; i++) {
-		if (ctx->stream == fd.entry[i].stream) {
-			ctx->vc = fd.entry[i].bus.csi2.vc;
-			ctx->dt = fd.entry[i].bus.csi2.dt;
-		}
+	for (i = 0; i < csi->num_ctx; i++) {
+		curr_ctx = &csi->ctx[i];
+
+		/* Capture VC 0 by default */
+		curr_ctx->vc = 0;
+
+		ret = ti_csi2rx_get_stream(curr_ctx);
+		if (ret)
+			continue;
+
+		for (j = 0; j < fd.num_entries; j++)
+			if (curr_ctx->stream == fd.entry[j].stream) {
+				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
+				curr_ctx->dt = fd.entry[j].bus.csi2.dt;
+			}
 	}
 
 	return 0;
@@ -922,8 +954,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	struct ti_csi2rx_buffer *buf;
-	const struct ti_csi2rx_fmt *fmt;
 	unsigned long flags;
 	int ret = 0;
 
@@ -938,35 +968,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
-	ret = ti_csi2rx_get_vc_and_dt(ctx);
-	if (ret == -ENOIOCTLCMD) {
-		ctx->vc = 0;
-		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
-		ctx->dt = fmt->csi_dt;
-	} else if (ret < 0) {
-		goto err;
-	}
-
-	ti_csi2rx_setup_shim(ctx);
-
-	ctx->sequence = 0;
-
-	spin_lock_irqsave(&dma->lock, flags);
-	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
-
-	ret = ti_csi2rx_start_dma(ctx, buf);
-	if (ret) {
-		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
-		spin_unlock_irqrestore(&dma->lock, flags);
-		goto err_pipeline;
-	}
-
-	list_move_tail(&buf->list, &dma->submitted);
-	dma->state = TI_CSI2RX_DMA_ACTIVE;
-	spin_unlock_irqrestore(&dma->lock, flags);
-
+	/* Start stream 0, we don't allow multiple streams on the source pad */
 	ret = v4l2_subdev_enable_streams(&csi->subdev,
-					 TI_CSI2RX_PAD_FIRST_SOURCE,
+					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
 					 BIT_U64(0));
 	if (ret)
 		goto err_dma;
@@ -975,7 +979,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_dma:
 	ti_csi2rx_stop_dma(ctx);
-err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
@@ -990,17 +993,26 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	int ret;
 
-	video_device_pipeline_stop(&ctx->vdev);
+	mutex_lock(&csi->mutex);
 
-	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
+	/* assert pixel reset to prevent stale data */
+	if (csi->enable_count == 1) {
+		writel(0, csi->shim + SHIM_CNTL);
+		csi->vc_cached = false;
+	}
+
+	video_device_pipeline_stop(&ctx->vdev);
+
 	ret = v4l2_subdev_disable_streams(&csi->subdev,
-					  TI_CSI2RX_PAD_FIRST_SOURCE,
+					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
 					  BIT_U64(0));
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
+	mutex_unlock(&csi->mutex);
+
 	ti_csi2rx_stop_dma(ctx);
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
 }
@@ -1043,25 +1055,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
 	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	*fmt = format->format;
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
-					   format->stream);
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
 	*fmt = format->format;
 
 	return 0;
 }
 
-static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *state)
+static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_krouting *routing)
 {
-	struct v4l2_mbus_framefmt *fmt;
+	int ret;
+
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
-	*fmt = ti_csi2rx_default_fmt;
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
-	*fmt = ti_csi2rx_default_fmt;
+	if (ret)
+		return ret;
 
-	return 0;
+	/* Only stream ID 0 allowed on source pads */
+	for (unsigned int i = 0; i < routing->num_routes; ++i) {
+		const struct v4l2_subdev_route *route = &routing->routes[i];
+
+		if (route->source_stream != 0)
+			return -EINVAL;
+	}
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
+
+	return ret;
+}
+
+static int ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+
+	if (csi->enable_count > 0)
+		return -EBUSY;
+
+	return _ti_csi2rx_sd_set_routing(sd, state, routing);
+}
+
+static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = { {
+		.sink_pad = 0,
+		.sink_stream = 0,
+		.source_pad = TI_CSI2RX_PAD_FIRST_SOURCE,
+		.source_stream = 0,
+		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+	} };
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = 1,
+		.routes = routes,
+	};
+
+	/* Initialize routing to single route to the fist source pad */
+	return _ti_csi2rx_sd_set_routing(sd, state, &routing);
 }
 
 static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
@@ -1069,15 +1140,58 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 				       u32 pad, u64 streams_mask)
 {
 	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
+	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct media_pad *remote_pad;
+	struct ti_csi2rx_buffer *buf;
+	const struct ti_csi2rx_fmt *fmt;
+	unsigned long flags;
+	u64 sink_streams;
 	int ret = 0;
 
+	ret = ti_csi2rx_get_stream(ctx);
+	if (ret)
+		return ret;
+
+	/* Get the VC and DT for all enabled ctx on first stream start */
+	if (!csi->vc_cached) {
+		ret = ti_csi2rx_get_vc_and_dt(ctx);
+		if (ret == -ENOIOCTLCMD) {
+			ctx->vc = 0;
+			fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
+			ctx->dt = fmt->csi_dt;
+		} else if (ret < 0) {
+			return ret;
+		}
+		csi->vc_cached = true;
+	}
+
+	ti_csi2rx_setup_shim(ctx);
+	ctx->sequence = 0;
+
+	spin_lock_irqsave(&dma->lock, flags);
+	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
+
+	ret = ti_csi2rx_start_dma(ctx, buf);
+	if (ret) {
+		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
+		spin_unlock_irqrestore(&dma->lock, flags);
+		return ret;
+	}
+
+	list_move_tail(&buf->list, &dma->submitted);
+	dma->state = TI_CSI2RX_DMA_ACTIVE;
+	spin_unlock_irqrestore(&dma->lock, flags);
+
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (!remote_pad)
 		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
 	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
-					 BIT_U64(0));
+					 sink_streams);
 	if (ret)
 		return ret;
 
@@ -1092,17 +1206,21 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
 {
 	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
 	struct media_pad *remote_pad;
+	u64 sink_streams;
 	int ret = 0;
 
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (!remote_pad)
 		return -ENODEV;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
 	if (csi->enable_count == 0)
 		return -EINVAL;
 
 	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
-					  BIT_U64(0));
+					  sink_streams);
 	if (!ret)
 		--csi->enable_count;
 
@@ -1111,6 +1229,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
 	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
+	.set_routing = ti_csi2rx_sd_set_routing,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ti_csi2rx_sd_set_fmt,
 	.enable_streams = ti_csi2rx_sd_enable_streams,
@@ -1289,7 +1408,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
 	sd->internal_ops = &ti_csi2rx_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
-	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
 	sd->dev = csi->dev;
 	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
-- 
2.34.1


