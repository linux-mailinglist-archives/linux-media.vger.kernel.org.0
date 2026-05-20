Return-Path: <linux-media+bounces-62264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG5vHYukDWpM0wUAu9opvQ
	(envelope-from <linux-media+bounces-62264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:09:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221458D54C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 967183092BE8
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1A33E1234;
	Wed, 20 May 2026 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rnsKEA7s"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCA63E00A9;
	Wed, 20 May 2026 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278525; cv=fail; b=f9rwPA4k3tsJnsRfLAYnJQmRbT5jRu6msLnIO12dS1vhF9TmZSBTCYupoGEQJXqNRvMM7BV69WOabyY7A1wyf+1yPmwOuvXLrO23GvfS+zzoIxRCktUmmd8CJd5zi9BcVwrJPee/W90rdo2amdA2tfu8XSiS2l/XpHNKqihqJNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278525; c=relaxed/simple;
	bh=9cIK8MP2rvz8SYok/DUxnwSuJ++C963MJ4MhjdJxrPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IhXq2TxYd8x2ZuNNV1ABTTIjOxwytpuKpia1tvpYCN7HZLMAy4Mmi2EclsfUsWhTk7Z+o4HV6PAPyIkBcI9ap86O5cTrrCF5ji3KG3P44yxGKRPPrWD0z7afMbjrwqIUQtNrYd6eSxeiQakmj11Sy/THNj/ogRuo3+TE40bP1iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rnsKEA7s; arc=fail smtp.client-ip=52.101.193.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCfNxjVZS5ACvE0ypaHCxJV20Hm6jqSiqSpPVSQ8uWeHEd15CSJ2bt2cLvlB7Qlr7sAHTtyi9gyVC5aeTten2T3j2UnyOZwsUgMiu3j80MFI0T7z/gcKuNVeufRrQgszeQkDFCZRT57B301SPlmmZGtDlg4sJWtGsCkDVm+55jLilHxzACGPc+D3Cjt2iKGJNOiCPOE0T410EBggzVb/Kd5Uns3AvvBOPXVwtjlmzGl782NaFP5pFgVWQvrikEJrLl8zJyY4si4k0JtBSAypz22PTQrKNI1TxAsG+BZRIN16VM8s/I7I0v2/jqaYl6YflsspmuMpnVb6lCtUtM1caQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1weRraNNSxV5jxI63XlLoJxTZiQAn/eqPAiBAElBv8U=;
 b=i+PWXso1pvd1Jj6c8Kx+iE9arRDNJt3Ib+SXyHwz9KPdI5HINI3lLxDxGvJWUfimuUHeCT3ij7INamn5pxoSJbPQyxZCl9X1KRw2oCuoC6ObWqJ/Sg5Yw3b0qvWFXfvTTUeyy5G/l3UOZt0ESByGAzHuMaCjW3pzf3XFk65ZRIx6EQeOrTEHAAWezDio2kiTkYO/8kBVqlh4nq6kATr3Uocr1Khw5yhw0+dgI1M9veAbMZASGpiYIwTOSqxjg8UvBQP8Yp7bwi3/cRdGL3tB73X4uqfPs0sMoqrylXl9Jwo5qZfhYMG/6f1zaZsdJKCkH0TLt0wA8kdVq1u+4Qn5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1weRraNNSxV5jxI63XlLoJxTZiQAn/eqPAiBAElBv8U=;
 b=rnsKEA7sbmEv8Zjgq9+2GFgaFtQS4olkOqvjhMtmL7B3ud8Q16kuvvsoXDfAtZ2o+9zlAhI7bzrjaNLuUukk8jZzWWRfLHGH73cRwhRA88RZhO3X4EGhF0hsMZrJKKMh9Zwh4IqgoiOVZ/xID9xqSNAi9wvUvPjeZ9BrDGrPlPQ=
Received: from MN2PR20CA0060.namprd20.prod.outlook.com (2603:10b6:208:235::29)
 by PH0PR10MB4757.namprd10.prod.outlook.com (2603:10b6:510:3f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Wed, 20 May
 2026 12:02:00 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:235:cafe::2e) by MN2PR20CA0060.outlook.office365.com
 (2603:10b6:208:235::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:02:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:02:00 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:56 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:01:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:01:55 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3b1914726;
	Wed, 20 May 2026 07:01:49 -0500
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
Subject: [PATCH v13 12/17] media: ti: j721e-csi2rx: add multistream support
Date: Wed, 20 May 2026 17:30:17 +0530
Message-ID: <20260520120022.539913-13-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|PH0PR10MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 51ba1a05-905e-45bd-30d5-08deb667993d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xe9uc1qj303aFFxK90MRiSOKrmcp+AxlXNMWK41WJEIFr+Y9x4AnY50g+y2oLQ0V6hjuQ7+pvLcYcwr/w3XLT+U/YA0Fc/hTCw3dymbczjpOg/3Z8nY5IcMExuEaivv/5vl5/gtzJEE/xKjeYyQ+bU0gvaG+Yhlo/QlF6EYy7u3UXx0Hllu4fDWvwJqChESBBJhbIinoFkLOQK2vBk0f2lfRYNdi0epuuBh+DN9zmOGY+6ssTREG0XVs/t3hKD9rVrtYOPWmR0/QcRkkGvdhRHV+3Um8yycWL4dgp9yHqDOi7D5QBHaIKqeV9PofNdZhlGMnxX1BfmX3hyTTd80MaA7HdeaLc+3B16j3U0nd4ggB9L62C0wP6hYCU/cq5RPphwm8rubKNH4Eq8Y6VnbOkeOA+TjdSQelpcjyW37f68cPTaQrqILWC/+hUjh7SFnwKaM3d2waGZmADUN2ZdPJZj2FEsAvv4uxSCnCKwKGF1c6eR6AGIWqucnbKPaBj2FJrO07VRmMs2GvcZyvjAsUCkh1FyNGDaVSlTVWt47y/zPUNbIAFXTIHDJZt90POWDvaUwk5jHSSql3fnR5vWh/dwRKgmcapTKk0MoqV23I95P32j+SVUU+FlOcJ3d3L7+9Kke2YewSe2rZE4lG2uk/+N3P4hbBCblJ5AP4CmoThObeBtMuaXhHgdixHN0O4CXJXbYnNHJ0PQr2mZKnx+ovgPmH0Cc8FIkV/amZvCPhBNU=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WeH+LNgfp3gwSbA36cTClniP7GgPN8tyKCQ0mtMIP1R67EnYMbhMgcGlWvsVkktX0se0fsrWqYjg3cydmGEHPlX7sdQRTiH+QpYZMWXWMX4jGv4c8zNpjUpJPaPAPJhgf7fjQmM29wPuyN1DJhjdqKpi/FzkuhHTbQbdgwWtzsU7aVJTN9eQ999NTIeP0VzcKRu5GIcdMH6Z2biXcGLJzkFuGtWiM5aZQLxSAFAqGBHQH5cbTJZxZXcLy9hyWFKZs7aeLHhbkrtMtFWEboW1pLbI6kZ0dPq79Z90sN9gyR8E/vaj2/wG20cbDsYN5FMj4PyI7yJtdehFhxn4hY1MQnILrCgfh1UU8UjcANdE/xawXlDo4mRoECV/aOi3OKiwW1GROSBW8FK0l+NkjDeriytlwcK9XspqxuGV/TKUFxje4cC1xuPG9BlBcyewHyBg
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:02:00.0787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ba1a05-905e-45bd-30d5-08deb667993d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4757
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62264-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:email,ti.com:email,ti.com:mid,ti.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0221458D54C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <j-luthra@ti.com>

Each CSI2 stream can be multiplexed into 32 independent streams, each
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 276 ++++++++++++------
 1 file changed, 194 insertions(+), 82 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index d0a681ba78eb..1ec63715baf2 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -143,17 +143,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
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
@@ -565,10 +554,6 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 
 	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
 
-	/* De-assert the pixel interface reset. */
-	reg = SHIM_CNTL_PIX_RST;
-	writel(reg, csi->shim + SHIM_CNTL);
-
 	/* Negotiate pixel count from the source */
 	ti_csi2rx_request_max_ppc(csi);
 
@@ -887,34 +872,82 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
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
+	const struct ti_csi2rx_fmt *fmt;
+	int ret;
+	unsigned int i, j;
 
-	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
-	if (IS_ERR(pad))
-		return PTR_ERR(pad);
+	/* Get the frame desc from source */
+	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (IS_ERR(source_pad))
+		return PTR_ERR(source_pad);
 
-	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
-	if (ret)
+	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
+	if (ret) {
+		if (ret == -ENOIOCTLCMD) {
+			ctx->vc = 0;
+			fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
+			ctx->dt = fmt->csi_dt;
+		}
 		return ret;
+	}
 
 	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
 		return -EINVAL;
 
-	for (i = 0; i < fd.num_entries; i++) {
-		if (ctx->stream == fd.entry[i].stream) {
-			ctx->vc = fd.entry[i].bus.csi2.vc;
-			ctx->dt = fd.entry[i].bus.csi2.dt;
-			break;
-		}
+	for (i = 0; i < csi->num_ctx; i++) {
+		curr_ctx = &csi->ctx[i];
 
-		/* Return error if no matching stream found */
-		if (i == fd.num_entries)
-			return -EINVAL;
+		/* Capture VC 0 by default */
+		curr_ctx->vc = 0;
+
+		ret = ti_csi2rx_get_stream(curr_ctx);
+		if (ret)
+			continue;
+
+		for (j = 0; j < fd.num_entries; j++) {
+			if (curr_ctx->stream == fd.entry[j].stream) {
+				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
+				curr_ctx->dt = fd.entry[j].bus.csi2.dt;
+				break;
+			}
+
+			/* Return error if no matching stream found */
+			if (j == fd.num_entries)
+				return -EINVAL;
+		}
 	}
 
 	return 0;
@@ -925,8 +958,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	struct ti_csi2rx_buffer *buf;
-	const struct ti_csi2rx_fmt *fmt;
 	unsigned long flags;
 	int ret = 0;
 
@@ -941,35 +972,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
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
@@ -978,7 +983,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 err_dma:
 	ti_csi2rx_stop_dma(ctx);
-err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
@@ -995,11 +999,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	video_device_pipeline_stop(&ctx->vdev);
 
-	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
-
 	ret = v4l2_subdev_disable_streams(&csi->subdev,
-					  TI_CSI2RX_PAD_FIRST_SOURCE,
+					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
 					  BIT_U64(0));
 	if (ret)
 		dev_err(csi->dev, "Failed to stop subdev stream\n");
@@ -1046,25 +1047,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
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
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
-	*fmt = ti_csi2rx_default_fmt;
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
 
-	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
-	*fmt = ti_csi2rx_default_fmt;
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
 
-	return 0;
+	if (ret)
+		return ret;
+
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
@@ -1072,15 +1132,56 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 				       u32 pad, u64 streams_mask)
 {
 	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
+	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct media_pad *remote_pad;
+	struct ti_csi2rx_buffer *buf;
+	unsigned long flags;
+	u64 sink_streams;
 	int ret = 0;
+	unsigned int reg;
+
+	ret = ti_csi2rx_get_stream(ctx);
+	if (ret)
+		return ret;
+
+	/* Get the VC and DT for all enabled ctx on first stream start */
+	if (!csi->enable_count) {
+		ret = ti_csi2rx_get_vc_and_dt(ctx);
+		if (ret < 0 && ret != -ENOIOCTLCMD)
+			return ret;
+
+		/* De-assert the pixel interface reset. */
+		reg = SHIM_CNTL_PIX_RST;
+		writel(reg, csi->shim + SHIM_CNTL);
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
 
@@ -1094,18 +1195,28 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
 					u32 pad, u64 streams_mask)
 {
 	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
+	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
 	struct media_pad *remote_pad;
+	u64 sink_streams;
 	int ret = 0;
 
+	WARN_ON(csi->enable_count == 0);
+
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
+
+	/* assert pixel reset to prevent stale data */
+	if (csi->enable_count == 1)
+		writel(0, csi->shim + SHIM_CNTL);
+
 	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
 	if (!remote_pad)
 		return -ENODEV;
-
-	if (csi->enable_count == 0)
-		return -EINVAL;
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       TI_CSI2RX_PAD_SINK,
+						       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
-					  BIT_U64(0));
+					  sink_streams);
 	if (!ret)
 		--csi->enable_count;
 
@@ -1114,6 +1225,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
 
 static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
 	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
+	.set_routing = ti_csi2rx_sd_set_routing,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ti_csi2rx_sd_set_fmt,
 	.enable_streams = ti_csi2rx_sd_enable_streams,
@@ -1293,7 +1405,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
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


