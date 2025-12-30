Return-Path: <linux-media+bounces-49678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B83CE90E7
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 149D63018322
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B3430E846;
	Tue, 30 Dec 2025 08:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C5F/pwM2"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011058.outbound.protection.outlook.com [40.93.194.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB3230E0C3;
	Tue, 30 Dec 2025 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083624; cv=fail; b=i8Ub0ZvuOLTLWizOKto2b9Is6T4rxGrMfclDCeIQ34aYE0N2UFTduW+v0N+z4C7fKLp8DjKLMeYQ+DzEueLY4OyWjlcD2dLfSzwljp/lGSQchachbNJMezKSTivgJBo6I447s8QFXsjxbMjukSpfTl0mA+RH14hVwUkPLuHXUPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083624; c=relaxed/simple;
	bh=IH3F7G+w5fetQiIALjKxf847cLClmOHyl7UDjNgl4Ss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S/yl+b4qtE+RTp8Jlf9FuraAOXZiJlmkias4sbWHix7yn65ewUxvYm1xHqEXHkr6wMKijaUF/FDFol+gPj4KoYq/YbsZ39TIhz76RoiW6PW2ijOtyR844tgPv9Aszv/PUCSFWg1mMpegiiofdO8+tpkFZYH7FXh0a2CV/kK+np8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C5F/pwM2; arc=fail smtp.client-ip=40.93.194.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C58krWUIYodA/tFyX2zdEGPsN7KMnte4X9xTfRfUOmRCny5z+qVCKD06C95p1xXdZFN7HNSfndLH+uyccffoe8o1MdasV6A1WfZUoV/kYdVLDeC2Q59OOuVlGjIZJf1qDUEA6WuV5Wr3KG0N4QVwBDgDOCZc2zMFtKmzePLtKJI+PwwOB1y0iDWHDVKxgX+/jxn/fnZPnAOhfoAigT/XMaT6CcFLi0NaB2Jz89lqjULeM4fjLZ8P5waCr4DHvdK6HOas+BaDVBpdqSOmLpyZclvQDw0DqOBTbaGJajIN1eTPiqWe+gSzwf4XU+oFVeYCHhgPqqX+F2HSbpDuuPjp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQ9vYNcNXMmrBjisIAL1F3J5QBDB51ZpGQQJNhw5C3M=;
 b=ohIbPT9ByQbLN+P7opJjQTBrUEvJni0F1wjv4Rl4tdMXsSWs2WtZR3pFgePmRErP5oUd02VySEbLOf6BtpYbWRZ7poiwhrvA2fKOfo6q/6T9qiKJBdjTVm1FoVkgex0ZsEZy/tpH3pfYcUaozzCCFffpnGR3LCos2yMZPyISJGJUDCXuyywerjRvoI2SmTFBa65Nj61nsej6yuKol3/gCILp6VjLK9G53HQrOhdfZFlnFOmSBi+ODOsDRlVp/mGkxProal6d6dyWWPIu8Mo66VOreMYsqC2C7KRunb4pUWOCgKDkekSaXkOiShRuAbjKGkEJAW6At/m55rOX1qw/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQ9vYNcNXMmrBjisIAL1F3J5QBDB51ZpGQQJNhw5C3M=;
 b=C5F/pwM271WbrG0is/SnwGuBZoE1T+8+yujRvqzCX+NrRU+hkmgkxhLyOmzNzVzEfvuzk7GODvfd9t3h7+hZ3VWBYrnXPppL/F2SBn+vEgUgeAuUSmqXpNwxVGTj0ItSVM29S7TwE4OFHxnfDmLTHzXqzkz3ixt/OANUClIkuRA=
Received: from SJ0PR03CA0049.namprd03.prod.outlook.com (2603:10b6:a03:33e::24)
 by MN6PR10MB8192.namprd10.prod.outlook.com (2603:10b6:208:4fd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:33:40 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::6c) by SJ0PR03CA0049.outlook.office365.com
 (2603:10b6:a03:33e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:33:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:33:37 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:34 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:33:34 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9d579464;
	Tue, 30 Dec 2025 02:33:27 -0600
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
Subject: [PATCH v9 10/19] media: cadence: csi2rx: add get_frame_desc wrapper
Date: Tue, 30 Dec 2025 14:02:11 +0530
Message-ID: <20251230083220.2405247-11-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|MN6PR10MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: d6b0bab7-3fa1-48c3-e1e7-08de477e2118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8L5k5erEQFVJYrGGOiAwp85nULDPdr/dCxvvYY+YvEgDDPh62OoS41otgMjy?=
 =?us-ascii?Q?2Gnh+wSvCduXk2f0CbZE3sTxlsrr4TvIvTtA/z7jziPwUREw1+tuFa+T3te2?=
 =?us-ascii?Q?flqdq2npQO4pm82AFbiLyDQhMYVcid4XFw4n15Rr6pKhtz8IarfH7o/nSzbm?=
 =?us-ascii?Q?csEsfiQnp6GxMuO0orsbXovq+u675a5ylieu2+QXB5T+fV4kumUMdLJwDSKH?=
 =?us-ascii?Q?2/dWSSgYBK6eopby1SFkxRuxRPkL+6D0C/+ktxMygUMD5nHnEZaGrxPsH5ux?=
 =?us-ascii?Q?+uf5sUKUbZQ9ktEL7GuARDO6d4KowXcw2GlSkR4Ly2s6QQKV9eYCJI3O1u3J?=
 =?us-ascii?Q?1AKVTVfkg1PmgvpMTZqD6x7ITs/72hV4MGEt0bFCpgaR605atk4s1N/LX7WR?=
 =?us-ascii?Q?ywTdyNgzb9teAOIqDz6w7pknb4rog7Kt1gpFf2W7Vre94nhArZKcTaT3X9kY?=
 =?us-ascii?Q?8CBnNsWB+qqyRp+oR/21XjkLHr6St5wP907PZleANagx6KstxmHIEULV46s1?=
 =?us-ascii?Q?qoFWKTfhqYlk2pC7wXOZEHAtXXCTgb7u3nthIB5yVr4zSUC4VA1krkaz2A/P?=
 =?us-ascii?Q?mtrkhIVNHXXtGbhOK9pzS/gvaIplh0lskQulSJtTwTnlkP2vQPFKDJXy+ozK?=
 =?us-ascii?Q?sGXlDOpNatYU5F0rBKbhq/JGPCPyi0zBkNur+Z0oF1BaY2QsStRmGmzKeE9S?=
 =?us-ascii?Q?RYWDskJYTZjsyMB5rrjXp8kc+KdxwaIt6rc5sVQ9BFBYfLI9LA4BuNov08Yv?=
 =?us-ascii?Q?mPAEK0kCU4sjg52Ry7+aQL+3wLxK9lg+sIlpmDKorhb5cKS5vLiAXXoAAIeS?=
 =?us-ascii?Q?mREvJCkOxGjY962srdrqKQQdVsuXXdBKCRRBwc7i+Z/R4OXZa+Ig8EfqMHL4?=
 =?us-ascii?Q?rC1byhtXugsuiCrI7GNOZoo1G52kwl4j3hDpxknXx946dEKLFZ0XyFBcocue?=
 =?us-ascii?Q?mEE2xEsWk9uLLBrTrSuKwBu/9Pcc4BsZ2cQtmXf0EyRNns0Mv7qI/FhcNzkY?=
 =?us-ascii?Q?cgtDAN41MNI93NX5AAeD82ElRUXXAsKMrXiWLZzczbU6VkKm2C9HTQ3xv4wC?=
 =?us-ascii?Q?dhLNCfbByJksOIglkQplVUL/spwjda0e5p5Wr4E41+h6jyOTviTwZgTSpFAD?=
 =?us-ascii?Q?4bIhpmr7sPvwxeMnan7gQehurKA2y2JpwpxJ5Qv94UdxAOoC8W64zL4byGLL?=
 =?us-ascii?Q?r7kw6YJTlL0tsZsOuv9XzgNmPfsC9jAkMrr30odMfHzbKjqZsGsbrJkNShjE?=
 =?us-ascii?Q?KkI84KVDrCagSQ0ook/vKTtWQX5yFOQWA2+9I6V65DZQ7oMblTddZ+47DHD8?=
 =?us-ascii?Q?yMMqZFIh8Vo4nXsmkTVQyRS16wercODHNody06xdMD6Pzw7S3J43q20x5D2Q?=
 =?us-ascii?Q?yUUvB2lRpaO2ouGKhw+t1bR2SnwPsrov1aDgQ3gNL2zWBTBJik6PKQM43Jdg?=
 =?us-ascii?Q?WfEaIKaJ3GZCDw77Q0f5wN+ZfqD5T/X7kCh4US70EeruPBEAkDMqunFIaUjI?=
 =?us-ascii?Q?E9lbkB7QlB9SdSiJb0+fPvxlTIONoxBezx6SCpl8lErXvFRS8RRDSXWAmzFD?=
 =?us-ascii?Q?DJ+njRuwgfpcgWo6EPs=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:33:37.9187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6b0bab7-3fa1-48c3-e1e7-08de477e2118
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8192

From: Pratyush Yadav <p.yadav@ti.com>

J721E wrapper CSI2RX driver needs to get the frame descriptor from the
source to find out info about virtual channel. This driver itself does
not touch the routing or virtual channels in any way. So simply pass the
descriptor through from the source.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 8e7af2da62262..65c6acb02f85b 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -229,6 +229,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
 	return NULL;
 }
 
+static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
+					     struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *remote_pad;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
+	if (!remote_pad) {
+		dev_err(csi2rx->dev, "No remote pad found for sink\n");
+		return -ENODEV;
+	}
+
+	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static inline
 struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
 {
@@ -611,12 +626,21 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
 }
 EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
 
+static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+
+	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
+}
+
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code	= csi2rx_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= csi2rx_set_fmt,
 	.enable_streams         = csi2rx_enable_streams,
 	.disable_streams        = csi2rx_disable_streams,
+	.get_frame_desc	= csi2rx_get_frame_desc,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
-- 
2.34.1


