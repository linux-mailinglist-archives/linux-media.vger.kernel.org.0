Return-Path: <linux-media+bounces-49674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FF4CE91A7
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D0243033D47
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFFC307AE9;
	Tue, 30 Dec 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="H2DikIIe"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013016.outbound.protection.outlook.com [40.93.196.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0F025B1C7;
	Tue, 30 Dec 2025 08:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083598; cv=fail; b=sAnuNFKe5u950rFtS8SnRTxTpFexdb9kUV2XLr8eg49Pm+aIOBKqRyWbfZuoo7SGltXnEhfBBrf6Z0sy8TBG+/sgJB1qcDbuwge1tU91wtgo5OeCayuM7NtXJHdkXz0aDu+XVcDZSpMqdFmhHqQks7KHY+T6+c+DL5IftJEDkxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083598; c=relaxed/simple;
	bh=jhDzndpyHQMgTLDFtW0HKH9mEX85H9dn3ptQ36NlWzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZpNkPMIrDpAD636fFLR5XML3w6GHf1rrUdcXV4Tol1q1dhSJoflvAsKHXKGev2WVrMQgffTzM+JyvbxbS6U7JW2RDRNT4FYnTWkzd436VL27cJ8NM6mai0JONLuMZgVnpi3LsJBFF2Se3y9f5M3I2eZfASAXfwowh2d+WEA/vPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=H2DikIIe; arc=fail smtp.client-ip=40.93.196.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmpVOe+aAzUA592QUJsAeK4jklIdGuETeZGXGFwrUeLY/9MyZ2+Cqb9fstN5hYxgZO991ZNJmAPw3m8L6Oo+hK/gFyGKfHpv4rPefcFU0d/unhd+mx5KxUocj0B91f2k6eDb9mvwjmxXaTrrf7xz6KwEUeQMGgoRlRncV4uZNadpAMDid0mYBn7x1pufmiaKUrZiEVawNUozb1aHgeW7zOUS8FDSNhulzvZhz9eE5aOR/S0zJdTWQCgZuA1kwLo5RO90vnOnQ+sTszDOmG7SuLG0/uqjcUDBa8zTzPf54Yp5dndEjon4bPJKVb5afoOxJ/PPCTcQvMuTV+8SIr8MIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gPfap1BFw9Tm8KWLuhaZ52NGVaFCWOIWllv6/oSv9s=;
 b=rm6OGdTCmHs8oxJyJrK3q2uSGaUtvSybKrRz6lR3jj0MBDddUvV8G+unIv3Tz6isvo7xyOigD9gZ1EmGcmcGgEx+2i1rdrTr7MVbWyvuptgAMdIK0XcyN3/guNP+sfjWlGxtqsiItpPZmXMQPj/f5XofS244nudXN/UOesd7NeadlCj17geWbUBbYzPY8chAE0ThJFTx+2QDxYWpx9e5HWWzx33U8emVdtWLfZA6Tb3iJhwiOgTSBhKt7t+9Eced3tkXPgEbxsCzTLn7Fp1kzlQNuNNLICv962yxc8/HL8JowMs/u/tIJTkmm1ly/9kJ1hqCr/M2dEzZoDK/UG5k5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gPfap1BFw9Tm8KWLuhaZ52NGVaFCWOIWllv6/oSv9s=;
 b=H2DikIIeX005vhbS/O99I8rSBnPZqiD4mDoOdXgPwMhwoxRoN3s3hvOZ8qiIzTNKIGXQbVO2xTIKAVcwiLZP9C6P45nrRU+jKd6gjQukWzm3OTn8QGiHOXVy+Xrg/YVsnAd8G32megOXcJEzM9MyhqEd/aRHh2jmQe/r8YBF+WU=
Received: from SJ0PR05CA0201.namprd05.prod.outlook.com (2603:10b6:a03:330::26)
 by BN0PR10MB5112.namprd10.prod.outlook.com (2603:10b6:408:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 08:33:13 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::82) by SJ0PR05CA0201.outlook.office365.com
 (2603:10b6:a03:330::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue,
 30 Dec 2025 08:33:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:33:13 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:08 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:33:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:33:07 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9Z579464;
	Tue, 30 Dec 2025 02:33:01 -0600
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
Subject: [PATCH v9 06/19] media: ti: j721e-csi2rx: add a subdev for the core device
Date: Tue, 30 Dec 2025 14:02:07 +0530
Message-ID: <20251230083220.2405247-7-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|BN0PR10MB5112:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f16843-635f-4f60-a51a-08de477e125d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G5TlxNEkOabUOEjlz60TJIHLQ5hNG2bBOo70+T1PdQ+cE7ai7BjSXsl5OoAE?=
 =?us-ascii?Q?pb85AVuQ3TDuw7SXZaZikGbqnlXc16+HX0HQizqaA4P4Hhd5/opIj6zW1Biz?=
 =?us-ascii?Q?W7xwVjIIa6n9nJoYx2yIHGZFUC/LxgSUpcWf5WI79B9XBf3VCnjOxmBjqjL3?=
 =?us-ascii?Q?8HcsEJCSwZ0fDVdKRUzNwo3ACOOBrOY5LNFf2YIAi5ynBCGohgd2OL7X7+yw?=
 =?us-ascii?Q?VAv9jArTefNBxPq2LOJL4sw3R5rmzYfQb87D2UZN1DIGEP2U0fGdZBFCdNFn?=
 =?us-ascii?Q?HS8mOpaYDEw7gONzh8/I/AaPbkkSODQWHldUqW6r6707NJh2haleMLc0Xtu2?=
 =?us-ascii?Q?XdluSEu9Z5k+/FT49nvgcRlZPyacsypno96e0GITsbW8PlbG7DGOCzRnzEM8?=
 =?us-ascii?Q?0/7iS8k41MpnpHHAs+kaff3xBydP/6fgfwYXOGUzLO1Kz/1x6Phvq7uEZ0CV?=
 =?us-ascii?Q?+jX9CMdNqm5Fy/tVBbevYYlyjCKozuUEzt8A5J0aRC7vc5y8eGjZQsWlKsh7?=
 =?us-ascii?Q?8ApXFM4+ELrERjIRt0e1pT2SjYDUxwSseX8Cvr4iBdS2BWwqUAk/CGezCMlq?=
 =?us-ascii?Q?LAfN3Q4OvfIYfeaD20/KcO19t41wweUqDPv7C3QjPG7D7lXemkQVK8myPyAa?=
 =?us-ascii?Q?OGKAJ+OtCHDRBqtzH6aw5ho5bWwrMr232ivgFB2u2Z81uNunktDCuJsKuAF0?=
 =?us-ascii?Q?6ptRdhvghwPpbeKTwFDk7SQ6wNjVpvb9Mkp8Oc+uBAf04KGhzHHu1pQZNsGN?=
 =?us-ascii?Q?l3spvRkxUN/EIBi8mDx+XCT/qFtmwyyd/dJja6FvQHOqnmFnXKvnWQFtDeqF?=
 =?us-ascii?Q?wI40H+al/iBAyj+12wWBPWWiIf/V1Xr+mcoC0brVmoxHvsgM4lhZXuYPr4Bj?=
 =?us-ascii?Q?fQy4DXHOZ+UkvIlQ2GyPE3jWgKVf2YQtbjw78Z01pprclaX06ICCQhGhjtqU?=
 =?us-ascii?Q?pPzEJaCeT3ES1c2GRV6wIWQGVJ71SXMM9h1iUCxh+BOLVMROmz3VnR/tB/Nu?=
 =?us-ascii?Q?yGAc3Fl3txkMnN0FeigzgTZRtfw/foQ+zsksmIw42ICj0ke5UkAVUC/kd3kt?=
 =?us-ascii?Q?DylCOvkELOYiaxx0JelsOL4hA+pnSgY8HZ7ksamx75Y5G2Vv6mMvcEWl1Bxj?=
 =?us-ascii?Q?CtWOixcSMliDHSpW/BFWhUn6U6CJcbHfaxnY5WfVhKcKxIQReN3/Jz/XwgY2?=
 =?us-ascii?Q?GEaOxBncd/o49VRfRKpQEYyaLy82JH+6tterMdcUpzBbPQVKiWuKvS/ZYhbT?=
 =?us-ascii?Q?VcEnMGfy4T1L+hd/56D7XmwxMm44gPqNoqeMIFh7XsEKCPlBsofTchM9Q6L0?=
 =?us-ascii?Q?bPT5c8YhrA3FuvLXeIT4gzLsIWiHnSyeUq7EHpQkO7wzPsDqLuIGIqKLiQnC?=
 =?us-ascii?Q?t48RcH8UNQg6NFjzVn6HDe/+dCko3z6A7UBNeKuguVudC7UQkB0A8Fh73S6r?=
 =?us-ascii?Q?rCYZX8oIYn4JefhDsYVcH/XMOF1z/pxjOvkbo280znX/FT46HDvl0azIIWEI?=
 =?us-ascii?Q?EdG0fJxjTlWXUlLdCLkjWCIhX8IZB7FURoYFdLgvVD2K+T9+1HHKZwzvUoZI?=
 =?us-ascii?Q?LrElpDteHk1RDLROo5s=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:33:13.1699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f16843-635f-4f60-a51a-08de477e125d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5112

From: Jai Luthra <j-luthra@ti.com>

With single stream capture, it was simpler to use the video device as
the media entity representing the main TI CSI2RX device. Now with multi
stream capture coming into the picture, the model has shifted to each
video device having a link to the main device's subdev. The routing
would then be set on this subdev.

Add this subdev, link each context to this subdev's entity and link the
subdev's entity to the source. Also add an array of media pads. It will
have one sink pad and source pads equal to the number of contexts.

Support the new enable_stream()/disable_stream() APIs in the subdev
instead of s_stream() hook.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 292 +++++++++++++++---
 1 file changed, 248 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index f66d68edcd57a..8f49ea2638585 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -54,6 +54,11 @@
 #define MAX_WIDTH_BYTES			SZ_16K
 #define MAX_HEIGHT_LINES		SZ_16K
 
+#define TI_CSI2RX_PAD_SINK		0
+#define TI_CSI2RX_PAD_FIRST_SOURCE	1
+#define TI_CSI2RX_NUM_SOURCE_PADS	1
+#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
+
 #define DRAIN_TIMEOUT_MS		50
 #define DRAIN_BUFFER_SIZE		SZ_32K
 
@@ -102,6 +107,7 @@ struct ti_csi2rx_ctx {
 	struct mutex			mutex; /* To serialize ioctls. */
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
+	struct media_pad		pad;
 	u32				sequence;
 	u32				idx;
 };
@@ -109,12 +115,15 @@ struct ti_csi2rx_ctx {
 struct ti_csi2rx_dev {
 	struct device			*dev;
 	void __iomem			*shim;
+	struct mutex			mutex; /* To serialize ioctls. */
+	unsigned int			enable_count;
 	struct v4l2_device		v4l2_dev;
 	struct media_device		mdev;
 	struct media_pipeline		pipe;
-	struct media_pad		pad;
+	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*source;
+	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
@@ -125,6 +134,22 @@ struct ti_csi2rx_dev {
 	} drain;
 };
 
+static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct ti_csi2rx_dev, subdev);
+}
+
+static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
+	.width = 640,
+	.height = 480,
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.ycbcr_enc = V4L2_YCBCR_ENC_601,
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+	.xfer_func = V4L2_XFER_FUNC_SRGB,
+};
+
 static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 	{
 		.fourcc			= V4L2_PIX_FMT_YUYV,
@@ -422,6 +447,18 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
 	int ret, i;
 
+	/* Create link from source to subdev */
+	ret = media_create_pad_link(&csi->source->entity,
+				    CSI2RX_BRIDGE_SOURCE_PAD,
+				    &csi->subdev.entity,
+				    TI_CSI2RX_PAD_SINK,
+				    MEDIA_LNK_FL_IMMUTABLE |
+				    MEDIA_LNK_FL_ENABLED);
+
+	if (ret)
+		return ret;
+
+	/* Create and link video nodes for all DMA contexts */
 	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
 		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
 		struct video_device *vdev = &ctx->vdev;
@@ -429,15 +466,17 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 		if (ret)
 			goto unregister_dev;
-	}
 
-	ret = media_create_pad_link(&csi->source->entity,
-				    CSI2RX_BRIDGE_SOURCE_PAD,
-				    &csi->ctx[0].vdev.entity, csi->pad.index,
-				    MEDIA_LNK_FL_IMMUTABLE |
-				    MEDIA_LNK_FL_ENABLED);
-	if (ret)
-		goto unregister_dev;
+		ret = media_create_pad_link(&csi->subdev.entity,
+					    TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+					    &vdev->entity, 0,
+					    MEDIA_LNK_FL_IMMUTABLE |
+					    MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			video_unregister_device(vdev);
+			goto unregister_dev;
+		}
+	}
 
 	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
 	if (ret)
@@ -447,8 +486,10 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 
 unregister_dev:
 	i--;
-	for (; i >= 0; i--)
+	for (; i >= 0; i--) {
+		media_entity_remove_links(&csi->ctx[i].vdev.entity);
 		video_unregister_device(&csi->ctx[i].vdev);
+	}
 	return ret;
 }
 
@@ -493,14 +534,13 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
 }
 
 /* Request maximum possible pixels per clock from the bridge */
-static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_ctx *ctx)
+static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
 {
-	struct ti_csi2rx_dev *csi = ctx->csi;
 	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;
 	struct media_pad *pad;
 	int ret;
 
-	pad = media_entity_remote_source_pad_unique(&ctx->vdev.entity);
+	pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (IS_ERR(pad))
 		return;
 
@@ -526,7 +566,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	writel(reg, csi->shim + SHIM_CNTL);
 
 	/* Negotiate pixel count from the source */
-	ti_csi2rx_request_max_ppc(ctx);
+	ti_csi2rx_request_max_ppc(csi);
 
 	reg = SHIM_DMACNTX_EN;
 	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
@@ -881,7 +921,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(&csi->subdev,
+					 TI_CSI2RX_PAD_FIRST_SOURCE,
+					 BIT_U64(0));
 	if (ret)
 		goto err_dma;
 
@@ -909,7 +951,9 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+	ret = v4l2_subdev_disable_streams(&csi->subdev,
+					  TI_CSI2RX_PAD_FIRST_SOURCE,
+					  BIT_U64(0));
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
@@ -925,8 +969,121 @@ static const struct vb2_ops csi_vb2_qops = {
 	.stop_streaming = ti_csi2rx_stop_streaming,
 };
 
+static int ti_csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_mbus_code_enum *code_enum)
+{
+	if (code_enum->index >= ARRAY_SIZE(ti_csi2rx_formats))
+		return -EINVAL;
+
+	code_enum->code = ti_csi2rx_formats[code_enum->index].code;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	/* No transcoding, don't allow setting source fmt */
+	if (format->pad > TI_CSI2RX_PAD_SINK)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	if (!find_format_by_code(format->format.code))
+		format->format.code = ti_csi2rx_formats[0].code;
+
+	format->format.field = V4L2_FIELD_NONE;
+
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	*fmt = format->format;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
+					   format->stream);
+	*fmt = format->format;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
+	*fmt = ti_csi2rx_default_fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
+	*fmt = ti_csi2rx_default_fmt;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       u32 pad, u64 streams_mask)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct media_pad *remote_pad;
+	int ret = 0;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
+					 BIT_U64(0));
+	if (ret)
+		return ret;
+
+	csi->enable_count++;
+
+	return 0;
+}
+
+static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct media_pad *remote_pad;
+	int ret = 0;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
+	if (!remote_pad)
+		return -ENODEV;
+
+	if (csi->enable_count == 0)
+		return -EINVAL;
+
+	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
+					  BIT_U64(0));
+	if (!ret)
+		--csi->enable_count;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
+	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ti_csi2rx_sd_set_fmt,
+	.enable_streams = ti_csi2rx_sd_enable_streams,
+	.disable_streams = ti_csi2rx_sd_disable_streams,
+};
+
+static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops = {
+	.pad = &ti_csi2rx_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ti_csi2rx_internal_ops = {
+	.init_state = ti_csi2rx_sd_init_state,
+};
+
 static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
 {
+	v4l2_subdev_cleanup(&csi->subdev);
 	media_device_unregister(&csi->mdev);
 	v4l2_device_unregister(&csi->v4l2_dev);
 	media_device_cleanup(&csi->mdev);
@@ -981,48 +1138,52 @@ static int ti_csi2rx_link_validate(struct media_link *link)
 	struct ti_csi2rx_ctx *ctx = container_of(vdev, struct ti_csi2rx_ctx, vdev);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct v4l2_pix_format *csi_fmt = &ctx->v_fmt.fmt.pix;
-	struct v4l2_subdev_format source_fmt = {
-		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad	= link->source->index,
-	};
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_subdev_state *state;
 	const struct ti_csi2rx_fmt *ti_fmt;
-	int ret;
 
-	ret = v4l2_subdev_call_state_active(csi->source, pad,
-					    get_fmt, &source_fmt);
-	if (ret)
-		return ret;
+	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
+	format = v4l2_subdev_state_get_format(state, link->source->index, 0);
+	v4l2_subdev_unlock_state(state);
 
-	if (source_fmt.format.width != csi_fmt->width) {
+	if (!format) {
+		dev_dbg(csi->dev,
+			"Skipping validation as no format present on \"%s\":%u:0\n",
+			link->source->entity->name, link->source->index);
+		return 0;
+	}
+
+	if (format->width != csi_fmt->width) {
 		dev_dbg(csi->dev, "Width does not match (source %u, sink %u)\n",
-			source_fmt.format.width, csi_fmt->width);
+			format->width, csi_fmt->width);
 		return -EPIPE;
 	}
 
-	if (source_fmt.format.height != csi_fmt->height) {
+	if (format->height != csi_fmt->height) {
 		dev_dbg(csi->dev, "Height does not match (source %u, sink %u)\n",
-			source_fmt.format.height, csi_fmt->height);
+			format->height, csi_fmt->height);
 		return -EPIPE;
 	}
 
-	if (source_fmt.format.field != csi_fmt->field &&
+	if (format->field != csi_fmt->field &&
 	    csi_fmt->field != V4L2_FIELD_NONE) {
 		dev_dbg(csi->dev, "Field does not match (source %u, sink %u)\n",
-			source_fmt.format.field, csi_fmt->field);
+			format->field, csi_fmt->field);
 		return -EPIPE;
 	}
 
-	ti_fmt = find_format_by_code(source_fmt.format.code);
+	ti_fmt = find_format_by_code(format->code);
 	if (!ti_fmt) {
 		dev_dbg(csi->dev, "Media bus format 0x%x not supported\n",
-			source_fmt.format.code);
+			format->code);
 		return -EPIPE;
 	}
 
 	if (ti_fmt->fourcc != csi_fmt->pixelformat) {
 		dev_dbg(csi->dev,
-			"Cannot transform source fmt 0x%x to sink fmt 0x%x\n",
-			ti_fmt->fourcc, csi_fmt->pixelformat);
+			"Cannot transform \"%s\":%u format %p4cc to %p4cc\n",
+			link->source->entity->name, link->source->index,
+			&ti_fmt->fourcc, &csi_fmt->pixelformat);
 		return -EPIPE;
 	}
 
@@ -1033,6 +1194,10 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
 	.link_validate = ti_csi2rx_link_validate,
 };
 
+static const struct media_entity_operations ti_csi2rx_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
 static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct dma_slave_config cfg = {
@@ -1058,6 +1223,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 {
 	struct media_device *mdev = &csi->mdev;
+	struct v4l2_subdev *sd = &csi->subdev;
 	int ret;
 
 	mdev->dev = csi->dev;
@@ -1070,16 +1236,51 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 
 	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
 	if (ret)
-		return ret;
+		goto cleanup_media;
 
 	ret = media_device_register(mdev);
-	if (ret) {
-		v4l2_device_unregister(&csi->v4l2_dev);
-		media_device_cleanup(mdev);
-		return ret;
-	}
+	if (ret)
+		goto unregister_v4l2;
+
+	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
+	sd->internal_ops = &ti_csi2rx_internal_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
+	sd->dev = csi->dev;
+	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
+
+	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+
+	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
+	     i < TI_CSI2RX_NUM_PADS; i++)
+		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
+				     csi->pads);
+	if (ret)
+		goto unregister_media;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto unregister_media;
+
+	ret = v4l2_device_register_subdev(&csi->v4l2_dev, sd);
+	if (ret)
+		goto cleanup_subdev;
 
 	return 0;
+
+cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+unregister_media:
+	media_device_unregister(mdev);
+unregister_v4l2:
+	v4l2_device_unregister(&csi->v4l2_dev);
+cleanup_media:
+	media_device_cleanup(mdev);
+
+	return ret;
 }
 
 static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
@@ -1106,9 +1307,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
 
-	csi->pad.flags = MEDIA_PAD_FL_SINK;
+	ctx->pad.flags = MEDIA_PAD_FL_SINK;
 	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
-	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
+	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
 	if (ret)
 		return ret;
 
@@ -1169,6 +1370,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 	if (!csi->drain.vaddr)
 		return -ENOMEM;
 
+	mutex_init(&csi->mutex);
+
 	ret = ti_csi2rx_v4l2_init(csi);
 	if (ret)
 		goto err_v4l2;
@@ -1201,6 +1404,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 	ti_csi2rx_cleanup_v4l2(csi);
 err_v4l2:
+	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 	return ret;
@@ -1216,7 +1420,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 
 	ti_csi2rx_cleanup_notifier(csi);
 	ti_csi2rx_cleanup_v4l2(csi);
-
+	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 }
-- 
2.34.1


