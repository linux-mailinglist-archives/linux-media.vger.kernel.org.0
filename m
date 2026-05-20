Return-Path: <linux-media+bounces-62257-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNMLHJmjDWq10QUAu9opvQ
	(envelope-from <linux-media+bounces-62257-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:05:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC158D419
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D490306CCF9
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9073B3DCDA7;
	Wed, 20 May 2026 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CTIsOAKu"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011005.outbound.protection.outlook.com [40.93.194.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5324293C;
	Wed, 20 May 2026 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278481; cv=fail; b=l2HLsyUCktk8DW2Yiqwd2MEVv/DvTCYkVNSwwZG8T7K0bxlGXmh+hAWTs79VJ8CkqOm5AesunaT6BiTRNEl+dlogk4A0SGGNzlagHlVfuusRseEHP6r87GJyHyhICohJ45g5Q2etVvIPe0QQz35HkG4vufSEhDeMzxu8qCLSTU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278481; c=relaxed/simple;
	bh=5joB4mM5IexuUBSgFs7w8sAdTTn1IM4+kwcdMhcVVZA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=trEK1Mzcvx8/Q2JJIdKDcnmko+Jl3xq8wTIoiC317tweDlK8n1LkM2n0z4bzhqBEipgiRv0bA82pSNejtbkxAwVoUs78XC+yh0TM1TvkW/83ki23WJ/cIrqBCrGTEyUrBxbpajCx02e78dYeIGZ5WLeUZADD2PUTcRC5BWdgFBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CTIsOAKu; arc=fail smtp.client-ip=40.93.194.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwNx0Gods0PgvcV3/Z3sLFd6/oFMHn1jxcC0/6aZIkKsXMm4OU09sjTzuX5IeSnokCElatce9anljXgCYmgHYEcG4xS+JYQfhSMfLJ1xeLsore7f0KSo3tsXbQSRfk4bdYsnF1Z0ywVdOq4W3s7I8DxKwZTJzzUefCYAw66vUsCBtmcpugvX5sgF8eLWNnrcIw1GFq3Ou9WObksR9IbITEDRRI30fosboByICaxn84MTkA58MhX2N+9BTsoeBXfhn8oGYViGBtbRPKLGj6ovRh7yyzBTalJvL6q5kAOTnk7/tO9sxI6XPrdJljkFq3+hm7DUOKR71e6PRr6CGWSX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBo6rlbCfUTrmM7XnziOFTfqI6eSuwr66Mgrc4cS1Vk=;
 b=j/BwpN8w8KXKpNiKCci96vujiRBDTn4hyC7QHJN9aujiTVDbYQ9wjsGGScGWtTxUhZSlY5wp6KtiAcglmVaZa6AZFHSsGiYF7vG+itvK7sITHEld+et5sDWtw2cQ5w8CBU6/ecWYastP876IFE4gFRM9q4/Xyn2IElxtMEvJpkPsfsUyzGr759fWcQ2KvGilB6inOUE5M+OQdVEJXVCFpdoZtiz6mcB3BncdQj2whg6qgwRWi2qSSXkuhE2BlI5hl69+TwNYwoHSPRgco8w875dqPeLv/oyal1ypP9VJM/IjgZKVXYcdzARHBbSBTRm4h3H/Pm7uWWe/adqfPqWtVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBo6rlbCfUTrmM7XnziOFTfqI6eSuwr66Mgrc4cS1Vk=;
 b=CTIsOAKu966hGCexbMnT83z05D1aJWziT/pOxLLExIVzbi+mq1xbzCggdP7G0n6n4AkUbHxmDdiJ/cflaDiMcnJq9O5Zf/GmUJ3pCZOP7HXN1B8f4l8/E9Y3JHy+3Sik6RIB5G2khNflK9tiED+QcRIDXBhwCYNTyAtfmDoKUHc=
Received: from BN0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:408:ec::27)
 by CH3PR10MB6713.namprd10.prod.outlook.com (2603:10b6:610:143::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Wed, 20 May
 2026 12:01:14 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::c) by BN0PR04CA0112.outlook.office365.com
 (2603:10b6:408:ec::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:01:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:01:13 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:13 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:01:13 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3V1914726;
	Wed, 20 May 2026 07:01:06 -0500
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
Subject: [PATCH v13 06/17] media: ti: j721e-csi2rx: add a subdev for the core device
Date: Wed, 20 May 2026 17:30:11 +0530
Message-ID: <20260520120022.539913-7-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520120022.539913-1-r-donadkar@ti.com>
References: <20260520120022.539913-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|CH3PR10MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f610a3-dfa1-4489-587c-08deb6677db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|7416014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	3WI6NITzI64v3+a5CLGi7k0g4X/geJ6GDTiW1lHNbKZUuGJV5DhrxuUtUu8v85Q3UuGGUG1pNtxoI6SRSEf0CAABrLSUX0RxHnLZZk2j3waoX2XmNVyjHp/n1ugy8lS14stvRKL1qgMxEuMiCrt5xyQeOgwkM5oguLa0s4iwbNUXrHOJPDqfTxSzG+ftfgTW0H9fMJRRaTzSU2yxPYfPssUM/CwGGmX8tDm42wj8VcijFN+deiKlCElJ2h9xS5MmQ9xV7ok+um7SKuUl0yyhrWNjz93UopGX8LFwfhEFA/duOqDyLTR0/94oilg/x2nJ8WOXSVqd4daEvZh0N8tTyNmuZx+ufycfP9QWaPFVw3asTTYsqcQFdfC/t+GKUF2hDWH9ameS9OaftDlx752Q/6mrHwXugkseSC8rTh8CjB1XwoZLJeTFVWVN559CHQc+VeKJZGCswtQQeAWm26NCrLiDIXMGreP6TvPz/sG+CK9OVOHFb7uTOrFaJJVrilUlVT6xom3huTBcAR/Zq7T/1zUyYnJn+KLe906S7zR8THv0RZ3MFE0HYiTtSU9AhVbertV469VSt0S3Wtcfl4lha/Aehoc0La2BfawZ2x9w6tleMoRUKu+4JnM9isAnjX0p2aP//EEeIWKflvvkUh3NOUcxFbeOh3NTHi0iHlunT2Ksix97uwSqBOGkkXfSDh4BpVkZTILuBFTqgiMH2E4zuciAYgMnj8hrrBim6ZX4JG4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(7416014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bYjQJ+8yIGSfaLeZ9+lyXIENul+yOlquBHfCRohMxvLfzOF9c4G2ehkUk+jMJe9OSRRgxvg/HAcr5EAHCseT+5dmD9kcsmj46RN9l29V4/3pNHWbYqqheSik0I7OuIEg6VmGbzdW4efrl+NvaX9MVMP48C7hG8LSIBL7miltpVq4XCHZifa7I16hqLh0r7eZMjFSq77XiNMXo728pJETBlqJAEck6IsoE0Ddywrwa8Lnsxw5LJQbRV5fZHpJFUDMSxboCNH6wlrFQJna0UoBQIeWWXPeWjwxdYS4S5yT2tI1IVbd/kOrMIzC0ZoYELFoq1bY3qU3PuhLzrSB3otzQ74R7axA/FqMR/v4CWe2Qv/yKb2gDaymf4SrAFweeDOVlbzz1LyFjUWImU35N8m7tgIBkkIG3YrlRdOn8CzE4gvNXW3O6D38LNQk8PCnPFbH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:01:13.9246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f610a3-dfa1-4489-587c-08deb6677db9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6713
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62257-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:mid,ti.com:dkim,ideasonboard.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 37CC158D419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 288 +++++++++++++++---
 1 file changed, 244 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index c781b312cea8..e01d95eab19c 100644
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
@@ -109,12 +115,14 @@ struct ti_csi2rx_ctx {
 struct ti_csi2rx_dev {
 	struct device			*dev;
 	void __iomem			*shim;
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
@@ -125,6 +133,22 @@ struct ti_csi2rx_dev {
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
@@ -422,6 +446,18 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
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
@@ -429,15 +465,17 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
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
@@ -447,8 +485,10 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 
 unregister_dev:
 	i--;
-	for (; i >= 0; i--)
+	for (; i >= 0; i--) {
+		media_entity_remove_links(&csi->ctx[i].vdev.entity);
 		video_unregister_device(&csi->ctx[i].vdev);
+	}
 	return ret;
 }
 
@@ -493,14 +533,13 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
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
 
@@ -526,7 +565,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	writel(reg, csi->shim + SHIM_CNTL);
 
 	/* Negotiate pixel count from the source */
-	ti_csi2rx_request_max_ppc(ctx);
+	ti_csi2rx_request_max_ppc(csi);
 
 	reg = SHIM_DMACNTX_EN;
 	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
@@ -879,7 +918,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
+	ret = v4l2_subdev_enable_streams(&csi->subdev,
+					 TI_CSI2RX_PAD_FIRST_SOURCE,
+					 BIT_U64(0));
 	if (ret)
 		goto err_dma;
 
@@ -907,7 +948,9 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
-	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+	ret = v4l2_subdev_disable_streams(&csi->subdev,
+					  TI_CSI2RX_PAD_FIRST_SOURCE,
+					  BIT_U64(0));
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
 
@@ -923,8 +966,121 @@ static const struct vb2_ops csi_vb2_qops = {
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
@@ -979,48 +1135,52 @@ static int ti_csi2rx_link_validate(struct media_link *link)
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
+		dev_err(csi->dev,
+			"No format present on \"%s\":%u:0\n",
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
 
@@ -1031,6 +1191,11 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
 	.link_validate = ti_csi2rx_link_validate,
 };
 
+static const struct media_entity_operations ti_csi2rx_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
+};
+
 static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct dma_slave_config cfg = {
@@ -1056,6 +1221,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 {
 	struct media_device *mdev = &csi->mdev;
+	struct v4l2_subdev *sd = &csi->subdev;
 	int ret;
 
 	mdev->dev = csi->dev;
@@ -1068,16 +1234,51 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 
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
@@ -1104,9 +1305,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 
 	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
 
-	csi->pad.flags = MEDIA_PAD_FL_SINK;
+	ctx->pad.flags = MEDIA_PAD_FL_SINK;
 	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
-	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
+	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
 	if (ret)
 		return ret;
 
@@ -1214,7 +1415,6 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 
 	ti_csi2rx_cleanup_notifier(csi);
 	ti_csi2rx_cleanup_v4l2(csi);
-
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
 }
-- 
2.34.1


