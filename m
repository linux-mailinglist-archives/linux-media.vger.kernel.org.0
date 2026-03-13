Return-Path: <linux-media+bounces-55618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJxaH5rVs2mzbgAAu9opvQ
	(envelope-from <linux-media+bounces-55618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:15:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9511E2804F5
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC589322EF79
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC10389103;
	Fri, 13 Mar 2026 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B2QrDlkL"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13065388E5F;
	Fri, 13 Mar 2026 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392928; cv=fail; b=Mxi3J1TkCSzsR6toSnQbZ6HkjIvrCdrUtwefqkVnlMfW6xftc2rBDGOnLd9TYfSEUVX/bJVuifQ1AX3mXzKZLKY/+2jpFbKFuSIc7bdp3BcBAkAMLuJtBf93Our2WhBmurRcq+hYUbPpxa53nd1d8hch9kRLoRChWHNoaY+3sYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392928; c=relaxed/simple;
	bh=TGJ6Sa3k+qKtyd6lXDqRckwu7d9za2d5mrxbgojcaqo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WjyLjBOhW57q2awiG8oUyvVEYwYgTx4WJFBskN+2EJwQ8rpYpAxiENngIZ+IbTF0pbMY2EN7HHLI1Wx6mFbiNajfccLs1tifzD3cCysKPbDMkb1lI60GB8QGJEnjs/oJ/PC4PiJ8rav2hHnXkZSUDrJONUKtV14L6fHEg2DwzDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=B2QrDlkL; arc=fail smtp.client-ip=52.101.56.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn0NZR9C3osM464BQoSn0mlvGahAn/Hoog2AnbhEWHnr19AbX2o7L0EN6Zh4ujDV9cfPoURKiS6T4MZh88X1pJ2cf3+OjkE3goOiCcpsFKkU2XiP3QgiKikkJAIWuebVSv1lf02X8YJHJdR6ydvqAxRcH3iGxfQYtMoXuu9QyjU7sjDdUF6o5XuttOgpF8vGIZVQAKtusZXHRsRd2pWoCI9ckJUjG7Z/LauALZaXNj6CQ1gn0x7sDoueND2Ftz3X/CYZeGQVk7zxJzah75a2XzVTjJAZl3cQZq7fNvJgjaRdyrdIlsJhVZmO+G1iwOAWniZHjz9+MldroSv5BlEGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOPXr4dEcnEF7VCDSGTY/P5lRCQdMKPwInDTt53HDpw=;
 b=chTdzY+7fU8edHR5MeJBVd02hoGe/6NG1VgG8p0i8Af7//UYlygXol0gYjjcM97LNfAWFbnAgfV0rv9+Pt20fGe3ts5raSAVJg6SSWSC6UCzpYlSlFHCf7MscY4v7iBrJDBSAQE6B4g2MpLsJbIzG/Yq+hjxVBLAW90e0DT8UQlrPy0/ur6QeKWJhdNylPwIRQybldSnCkp59WYZEFS6m6y+/kJ4BJMbWP+MvEtbMyXeLzNNDTikyA+G1mEn5qL7ZnOJrpwrALW9aiTqgDuFghesPobU0Yhq9i/NxGAXJDyuPdrmiAxe0OnCH9jCNhxAH4BYj61HadybTCvDVfE7Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOPXr4dEcnEF7VCDSGTY/P5lRCQdMKPwInDTt53HDpw=;
 b=B2QrDlkLsY6vXAFxq+lARCFE6aD2VGVdQfibT+AXJzgwJUIYUOW/ol3QeXZ7GAiAFzjOM9L3tjOZmSBXFrBRCSy8GMs7PfCktUC4nIhJvCa+bS2OL4gqH57a91iT7OCZRcUyeA2kkcctLVHS5Pl0D7YUTmYkZu9avq3gR6sL5dU=
Received: from SJ0PR05CA0198.namprd05.prod.outlook.com (2603:10b6:a03:330::23)
 by SA2PR10MB4682.namprd10.prod.outlook.com (2603:10b6:806:110::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 09:08:44 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::7f) by SJ0PR05CA0198.outlook.office365.com
 (2603:10b6:a03:330::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Fri,
 13 Mar 2026 09:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 09:08:43 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:15 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:08:14 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972be274611;
	Fri, 13 Mar 2026 04:08:08 -0500
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
Subject: [PATCH v12 10/17] media: ti: j721e-csi2rx: add support for processing virtual channels
Date: Fri, 13 Mar 2026 14:36:54 +0530
Message-ID: <20260313090701.646534-11-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|SA2PR10MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: 040b53aa-c337-4f1a-ac8a-08de80e02057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dfI9sMz0zSA5bAXdLUHYyG1qpxVgO5wR1xOJwKzq4rc30rXTQ9Q/K+SwSuv5GMPQf7cRoVtBJjUXI3STcJXwwvtB+lbQYtjErErbvddTv6+0qXbUE0kJhRFUEVFF55vwiYY4rgeh0jC3sCP1OkdLzfZ5qdO0YV1SSTAjZKPJxV+1Zg1Ilw/ppB2E4MybWzvCMoB7ZX1w23Snm11wtwkgrNSzFbDs3BYquErWePjSWCzaovlr9o/EX8y+bbqukBGFLkhzlJIGU8V2mz4uQy3ItF3JnZAJxOxEd8XalM5evt3u9bcfFG8D5C2VJMyD81xkOYAx2GFZeVAcd1njj6sAxZexUxAqhmK4sY065UaK/w++Uln0G5xD4/aWjvBzspaEj7jfJ20K6Y1qExSCoQDxQ3i6BqIJmXZ7ngXyS8xrIvigzj9jF+0AX9RZzb9JlqmFK7AX4TEPW7C5OV88NpW6J3/c9vGQfkT1CeEg3M+E8PG5L6JDHrfGx6Wa38gaX/Mf2ymTFCbva8nc+DYlS9OxMy8jdPU/RlX06lsyYqynBbDO9whburqwyt5u+W1dKu+oE3NCBmdA3RhpPEGFlQ8FXvuA/Ey1ZUoUxQhyuY/FndyLkM0UVWLTwUyihC4yG5JNebOG8XdgGNbct79jeverm/4nrzx6ljsukp6QTP/86f5v/GOZxdBA4xNBN9kZt/Qd1Ft4g53LYilopPqLPuA/IKlUktzPrlK8OjggkItNpDsO0vHdDca7QFXW3Pa1PAr7umukckbgQJZ8ejkDPjAavQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jYZDLTllo1isulJMHF2Art1ujkYags08Efti3/l5oO2WxpQf95yBbcY6jacK0+UpaN4Aqq7ZjXS846uDRiOEKzrLKS48wc0gNQDyOwAkobQTa3/6mkMHB1YkPURXrMnFIvreqZhFhAFWwR1RscWZVJW0M9a0+LZeQnkBZJMDvNEP71dWFLKOpFQLqAd7GHsX0qMyXH5AARlvFbU+lHGMVFEEm7FRPKQLxiU/hhP3I4paSKfrROBAD7qh3x/UfpE/cfMY0rInKR2WpPl+mMfjrPkcYne1X0T5qsVFe/dgTjRmdhwIcv89osnABesx/3YiKBoxDGwCuQqeEvxxlnfr8bmNfLVBjrzFNXGDLcucsZTb5jWApl1azR6Dx0JvuF1XZ0RjbNCka7vaOeZnJfu9/j+44gvw0USQRQ8csLCpzUNi+HwWT71C7Rb8hSkITKGU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:08:43.5451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 040b53aa-c337-4f1a-ac8a-08de80e02057
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4682
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
	TAGGED_FROM(0.00)[bounces-55618-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:mid,ideasonboard.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9511E2804F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <j-luthra@ti.com>

Use get_frame_desc() to get the frame desc from the connected source,
and use the provided virtual channel and DT instead of defaults.

As we don't support multiple streams yet, we will just always use
stream 0. If the source doesn't support get_frame_desc(), fall back
to the previous method of always capturing virtual channel 0.

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 51 ++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 26a8eaa98b3da..24b687b4ea32a 100644
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
@@ -569,7 +573,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	ti_csi2rx_request_max_ppc(csi);
 
 	reg = SHIM_DMACNTX_EN;
-	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
+	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, ctx->dt);
 
 	/*
 	 * The hardware assumes incoming YUV422 8-bit data on MIPI CSI2 bus
@@ -608,6 +612,8 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 		break;
 	}
 
+	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
+
 	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
@@ -881,12 +887,46 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
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
+			break;
+		}
+
+		/* Return error if no matching stream found */
+		if (i == fd.num_entries)
+			return -EINVAL;
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
 
@@ -901,6 +941,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
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


