Return-Path: <linux-media+bounces-55609-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBbTKrzUs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55609-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:11:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F0428040D
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7772531CF5F9
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0835C3890FF;
	Fri, 13 Mar 2026 09:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Cwqlh4HT"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAF42F6188;
	Fri, 13 Mar 2026 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392861; cv=fail; b=Bx1VsiQpPbQs5EYICpallBWxxXyzDeYXNaPgADyAwcPawKMVqj0RSVlORiEiv8b6n8OeMB0V7Ch95RtgzetySrMqpoNpZBKdVCYDrk7n0m5cJRwOfgLRP9ypb3qe7MvVVjcApKCid0Q6eszOA7YIEw/XLonhcQ+e8ZYabOEjZ9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392861; c=relaxed/simple;
	bh=YGLRySKEOPDzPvmV+Ivvnff93ecgOVZzSGWbu7uM5F8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHAmEnNTVMIFb+ABMwYST5HHVTUfWRQtQohX74D4agnmn5kci+RsKvVS17WNrkbznNKmBe1c/wu6Y0gFb4vgGPFqeOMue/sdaCJYX552Ln7+ewyKIYdSxHaHfdpPZaJvRp9Zgm/TV27NtH3PlRdRWXp3tgJOf88rDQSoe79gKQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Cwqlh4HT; arc=fail smtp.client-ip=52.101.48.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmMwThc00xqQ9tGP2JXnDpsqLhiWZJUq9Ct8P3LYOecQ3oX9gBZR+0a+VeVsVnOHj57p2hwde/0HgQM3OevPcKuYuMZzDOd8kx1toJb4mwXJapAJWNBnJqVLYUdhIvIFlqu/litmvhw5zmSk3hoxt2J2VGJfZvieFN5edqPl0hB3Klo03wziMyqYlXLYIXYXNsa7BbkvKlDfQ2Ctw1G6dLi5aiLMCon8LzzU+G1S/+aJPk78pfy7kjAMV+5RyscE5pNr2L4Lp/zlU2+764vm+xPcryWseHVXIfvT+OgacPYwqZo997KKj8IS/byTSd8KC7E5jylnZnX2tkYpUt1cpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw7AsUt2zzwHbIz+Jl8l3lQ55E/X3uVD9mYVlyL2+6M=;
 b=SCR6bz/HjWVTHHnrpfOmbVtZtKCXLlv66NpJidjAoNwm9NaAub4nyHpa/h+ky97MTkGves7Coe+rQoScEIFu0tj5x/N1dYUxGwfqnFs7ilTM2b657j6g+mMOGF1CI5beNlBDBiXmtQlAoEtDWLi0WC3uMZy3lOqd3etlICt71oaFBuJ3++yaD8M7LGp9Oyeu4jzkTp6RL2GZx33Y76xSTmc4r8085VMgp1ZkS8ek4at1DvZAGbMYnYTNWcjmSR75LfFqafaBIys81pMHqfUQrLU4TG25MODqCaQhOYUoh6DXUB5a6vfiMZgJVwLM/OZTn1CqDqXze7OUrAn4qXaZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw7AsUt2zzwHbIz+Jl8l3lQ55E/X3uVD9mYVlyL2+6M=;
 b=Cwqlh4HTev7xvm46PlF8XLTF+4VuN1mJ6Tx57heAmGHD53DgtmwkEya+R9CoDRFzLmYdNIXAbEfxzyw3Q0b8jLUBOHdZHloA2bmeaIo7j/X+B5CM7Ai7JNh9bS/7XtU3vA4RKC3sQYhTqq51SuPXczOqyP4WIm9FaplyylTvmSg=
Received: from BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::13)
 by IA0PR10MB6697.namprd10.prod.outlook.com (2603:10b6:208:443::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 09:07:37 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::96) by BY1P220CA0007.outlook.office365.com
 (2603:10b6:a03:59d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 09:07:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 09:07:37 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:35 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:07:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:07:35 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bY274611;
	Fri, 13 Mar 2026 04:07:29 -0500
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
Subject: [PATCH v12 04/17] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
Date: Fri, 13 Mar 2026 14:36:48 +0530
Message-ID: <20260313090701.646534-5-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|IA0PR10MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: f0c9f7d5-3a86-4dee-1591-08de80dff905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wss3P5sLMy8ocuXHR8fJLXlqxbh2ahPeRSDWYayYbxmkiwdzbJsFVBFk7NP+1dInoKBfYHTYq3zar2L2RkQhexxH9tZDy0b9iH++Jd2pb9H9N+g64pM1f+NRKT1GaazC8TJ3jWeCzfpKQSttYEOwEj8KeRsLaok6xYz2S0Udf+NQj6T16yUbOTf4TguB7F3CTKF6I26TladKqkNfPv8tvB/L/pC7KXSawkCk+wxQWFwsn3MfDi6OQ8psm3HjNm1tnoIroxcCbwMpn+g/wNjl5U9qqg/6R/f16tMGVEf13TTcccUpdRp1wCmA92xMqVc61G03MY7gh/rgsxtYhNEqln2nMupCpu2C+ytB64J0PyEpXiZjoffb9TEwk6jlr2m7ybMAthGM3wbVvGA2/AoCZ7BeKEmW6FiP1ltjx/lSWkXAn2udz7zFhoem/TK6WSgoqVxLfeYysHoOJJvqqx63uIVbNL1rw3z5tp6fmmZ2wbsbVBARyywRvDva64LB7WKhwY98jLKBL3d5cBZy7da/bK/ps+l7uPFnDg25JbQ62RG8hNb7/WVVBDXmpE0fS08RfPjf9/M/p3ww6RrfveCapQxVar3t9qicB2MalO3aTA5/rwELMqiqTJonxMYZSo9ZDN4wcbkfMK/dUCzzl94riMkTVXW5pncNxwkowkfbz4GQEv7uWgUwK+Cn5IK9pn0Xvq8kIVmwnqUWIKkLH2BqOB66v1lI3Gk0YQdiw5D/cSP5uPIJjlObQOXiJ1PmP02CojrmTVkfd6AS8PPEpQ44AQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bgB3qSSDyi3IZvJ7Hje7JoGDHxhXIgW9zP9zuKLq/vNH08ot7cwskQ3FBDnnuLhRDtxV3ocQK6Wi7P3ztXp63psd9V9u1YutaaYj6W2TjoXrpXWMeA1tMfaexEtLtw3siuerzvCnWgyL1Nyx1xB65vNiifFLhvt5DzqFFEKdEhhYCGmNe4238ZPcgky1/klr6WdwEbRjfv2yHh/nsvqqRA103sL4UnICH3PPY+RIY6WUI/1BGs6qLF0GoxAqtQlpr84LzGuDw5Xkh55Dr8xWrmSirZxQmQhWZiW5C6hLETw5agahWZcQ9JZY9tbxBSEuEFf6jaoyKn/4UEBoN42huvPGcu4wzIfeGuVi0MBtXropHUSluYGLIzJoqFG/2VxdiSDg4ihrX98vXqcTyE8e97wcBtOD0pKqP0IakpdKwRRGDZijuqET6DxHapOfWGED
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:07:37.5747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c9f7d5-3a86-4dee-1591-08de80dff905
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6697
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
	TAGGED_FROM(0.00)[bounces-55609-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 10F0428040D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pratyush Yadav <p.yadav@ti.com>

Currently the SHIM code to configure the context only touches the first
context. Add support for writing to the context's registers based on the
context index.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 23717a3b6c4cf..4adfae425f192 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -27,7 +27,7 @@
 #define SHIM_CNTL			0x10
 #define SHIM_CNTL_PIX_RST		BIT(0)
 
-#define SHIM_DMACNTX			0x20
+#define SHIM_DMACNTX(i)			(0x20 + ((i) * 0x20))
 #define SHIM_DMACNTX_EN			BIT(31)
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
@@ -38,7 +38,7 @@
 #define SHIM_DMACNTX_SIZE_16		1
 #define SHIM_DMACNTX_SIZE_32		2
 
-#define SHIM_PSI_CFG0			0x24
+#define SHIM_PSI_CFG0(i)		(0x24 + ((i) * 0x20))
 #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
@@ -568,11 +568,11 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 		break;
 	}
 
-	writel(reg, csi->shim + SHIM_DMACNTX);
+	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
 	      FIELD_PREP(SHIM_PSI_CFG0_DST_TAG, 0);
-	writel(reg, csi->shim + SHIM_PSI_CFG0);
+	writel(reg, csi->shim + SHIM_PSI_CFG0(ctx->idx));
 }
 
 static void ti_csi2rx_drain_callback(void *param)
@@ -890,7 +890,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -905,7 +905,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	video_device_pipeline_stop(&ctx->vdev);
 
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
 	if (ret)
-- 
2.34.1


