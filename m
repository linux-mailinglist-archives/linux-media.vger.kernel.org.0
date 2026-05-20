Return-Path: <linux-media+bounces-62262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHwWNU6lDWrp0wUAu9opvQ
	(envelope-from <linux-media+bounces-62262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:13:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BFA58D669
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2589F31B9199
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBB43DD85B;
	Wed, 20 May 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VZEu28Ws"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578DD3DBD49;
	Wed, 20 May 2026 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278517; cv=fail; b=mbA+S6KnMajbJqHfdFPaBfJV+GiUWrr2GCoe6NBZ7VL1i1ER24YFyAthdlyH3O9i+mPohN431SUEhyJ6zyqMSsMRRRNI5KN6Hv7w74BTHus7qUqqVXvlB923bCCxxvbiweA1KbL80X5mmN5DxK7rh/v3xJZxWpEQou6yhiAd+u8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278517; c=relaxed/simple;
	bh=KCdFwT3YR7e4v6zwTBMadnDGPyIxajttgdyfQjFaNA8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CwCFJB7Vcil1iDdzBDcyeDAw/w0v2JtSJhHE+pVUg1LUUQamDFk7TD3ohZ8ohYaJGSSiTlwH/1IF+tv7ofwG1tN9+n+q6dMCCCM4pTwbmdBw6wkKczspP2h4d0/QhKInimwocFWpfpvFhYEG/SlcuIU/XE3fbCoI2vQBS8boovY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VZEu28Ws; arc=fail smtp.client-ip=40.93.194.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRUld9WSOaK72RSsJO4F3eTLPJtmTOiSmqL8628XJRfFTnhTYJijifeNqh1zo2/TAFvPhz/QaFt7Gfp3FDTYpa5bVXpQfD0ICtj6Hassw2cX7fuAKCHpiTSqDm6X2GnhQVrU47StvPvUkeWeSVUj4igc2zKyi6L/5Cvbmj45hMjagmJcsrb0c6KZFUUp/WaB+TsM4RpgVKsIFGu/2giEdzhCh2A5OE/NMURtggqcPkNTWGPkGbzljhkgxFFu5YOOnPgvpLDt6rgSkJwhmIfY+qrpjjmOeCHVjU9RKvAMV3GWIZSc6Qg7zEQ34jyK4plQNlh10mNN4GHAuTJRTo+wuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaaQFe+IvvIScaVhzm8tUxOepom43v40akOUkztY0WY=;
 b=Gjr+AANnnEYkrVIps9ARiyIG2rV0haDJrtgEiJS+306w9ckTkSlFTwftj1hnwDvPUNtC7ILOKKgPY+4HVoJc3cTioEvVIr0dnQ0eqqCv1sEsh+fRgjntDbg1JYM/RrbB3iLaf7tP43nTK/jE2siHkUkFwn4qt+utl/MTCXqfleGV7EQPF3cybBsskAcYLBrIaQEgXhZ1LLtpvWW2JQ+YOOXdvN39qvFIy7wuHUTq7U6PwVdOw9Fk5bjkJ2pAdWTDU7/3272LXVanoKRxn8mhmyJlN6CskO4JWNKw8uzC0KPQiNFMaymwMTxONIE0p8U25mr+jVOfp3lVQrObtuTK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaaQFe+IvvIScaVhzm8tUxOepom43v40akOUkztY0WY=;
 b=VZEu28WsPfTnT7J+CnWtmGGHSRoAv6eVRj+02dBbT4LynIXWaXbdPiVDIJawVe7SFKXKJesRTf7ZWHp6902WXgWkPhKO/U7WEL3RFbvWlgQ5UEtItmdvZnIp6NYnaOUQSYqQroloZ3k+64BWKwtX2ufB+vDdVn7vgNYDeeXUWM4=
Received: from CH0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:610:b1::22)
 by PH0PR10MB4613.namprd10.prod.outlook.com (2603:10b6:510:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 12:01:53 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::49) by CH0PR13CA0017.outlook.office365.com
 (2603:10b6:610:b1::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:01:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:01:53 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:42 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:01:41 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3Z1914726;
	Wed, 20 May 2026 07:01:35 -0500
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
Subject: [PATCH v13 10/17] media: ti: j721e-csi2rx: add support for processing virtual channels
Date: Wed, 20 May 2026 17:30:15 +0530
Message-ID: <20260520120022.539913-11-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|PH0PR10MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: f61454ab-f0f7-4a9d-b161-08deb6679525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/ICAO6BQHDAS4qoQlGQN8m2/h/vl2/HdBLsJFsTgFIsLyYGiB1ndxKnQmIWetadGhrGV5q5bwRCnDYALMvu7Vgo3KYO1/hqXS4kz+kbnv0CYgYycu9c/1b1yiTVSwy/GDuQ4gYv1JMOrXNjsl7rWu68ILgQs/qH6orov0IfRd2OohgMWZsyd8X9RK9eBPEAZkrBf2KStUoZoVJWPyAgQhtalCQWvXBHc5rnQEnMlvYYKrAkQYhf0Q1P4y7MzHavIuWdaJFR1VyIj+2os+oBcY/saVd4x0G3Y4yDs1+wTAf0wHUYQdeV2ddNmg5Udx3EA6lwWU4S2ZCvC+ReWqrEBFaWDW1K2X9nLCLYueDGOVQx6iZs6fLP+7tCpWbbzIFcY/7Q8k2H0/vDp7Ytku0QPgeKDXUN+y/PBwhxZOcN/7ZIYqNxdXfzmvd/f+Xc+CvZlIwH0MNLWlntE9IJPwDc9CmNGW2DgGLQDg39s/GknZsJvguJZbGAfe4OET26pKEzyj+JwORKvdUNdMQlI0Z/yqECMguj8STTe+jbxqiv057nEPqcfAkfim72nh2YHAp9FeshShr7LlQ2P3NPWw/TEPtEKp9royFEJWlJ8fc3fAJ3A3YXyDC8sbQQ/tckN69xeKXN52dVqQMTZEkHLes4/c1nfIszYDcjNWtvxAfsWdUHX4k4LEIrcDpdXGBk3657E4QHX5j4rbaYAgxcLpGCSmWe5BJL6gQRftgV/bUbRQlk=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZXMwwhxizbQL86bXEnY02C0DoIJU5ZG8eUCuCKlYs8D706iorfEO3LOSO3zvyQQsi5Ybyf0fyuboy8ZdTIOoN4cbOoYYK5btrEASHnOjwGcRXqNZO1WVMYEpvYdcHa9ENmEJT0QplmkiaWgFhFsbNgwbZZYh01Lx4RUplA2lIyjw3IC7TOX5+oZMMxzUulwrvN5gBqfQax+ZTbDILs+xo9yYX0HlX8CALzj0sSUCEUg4Khw/nWJ7BIi+0ZUNL3a1r4hIfhSmznhJI/Y7tj4iA7mBMMlnwwgNoB08zGi0lU/XQdw6DhflWfRG9KIJoFDhbVkWbte8nfHZ0FXGzK1DlwgXzr9OaGeJMGO8kXI3/9vnRT58MRroAKfrwQIn49JhaLPKmSxK2xzhHvIufRJNta19Nd40r954G/zNFB9KSbjVK4WG64/4jkrUbImilNiK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:01:53.2338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f61454ab-f0f7-4a9d-b161-08deb6679525
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4613
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62262-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:mid,ti.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 42BFA58D669
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
index 26a8eaa98b3d..d0a681ba78eb 100644
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
+	if (IS_ERR(pad))
+		return PTR_ERR(pad);
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


