Return-Path: <linux-media+bounces-55620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPbRBGDUs2l5bQAAu9opvQ
	(envelope-from <linux-media+bounces-55620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:09:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA99C2803BF
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 10:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9C16304B120
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA1038B7D5;
	Fri, 13 Mar 2026 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jfpi/kQ3"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4804B3890F8;
	Fri, 13 Mar 2026 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392941; cv=fail; b=lPU3zURmEhH90782E3eJYGiDaC42Kg3r3jA6P5O+M19mzFSxsQjvYkyxD6OgmitpmP0nCg3YfkPC/x3yK77Omy3yudYWvK4eTgL0yEsU+82oj0sCI6DCog2WzTiFOsfcly3SLniYTbrO7t4DMmRLMKn9jygobzQqin3ZoQioq2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392941; c=relaxed/simple;
	bh=TaMtA0uWv+ARBVMO09p/7bI95bv4qUdPXbVtO/3p1ME=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTgzFfyNSV8YJJ0hushUkantqEo/QvphXDUtiq9niCIYEN65rfnHuTDDaJhs5Uu/uKF6t+jSK4FjEoQVVy8nu9R7w6vjPWSPXWOhDTAz+xXnDTOZwHniy/RZRuZF3IXwluyLQrwxWDP7IWFKVOTHwFyGyOEKYxxRrGHHhGukz80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jfpi/kQ3; arc=fail smtp.client-ip=52.101.46.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoDu2CUxtMBxqnLl5s+qwjtJzWyXNyPMOyVYBI6MWRJ3yplL+qkTWOcmMaXo2M3fkePwefCBGEE5fxReTHMk6uYKNQPpj2DjBN9Ihu93gEHmzx431262Yez8Qc79oOeNUJ6yOg8GyVjrxSppmC9VOh1crxFi6fOBXVFIzKOaQZh1svwrlmL3Ohw5lLULn6nCEW6ADW4xna2ZLbEBwzWjEyf5yBmxrvKxlXyv14+mzpqpUAY0f728sDSZuw0yo7UVb7stItPVascBXsv+DjfREePuDNBlsB7Ff0VaN3p967ay7Ba94In4GlIj/xLuGPa1SPVEQn+chT5xHzo76uH6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkhSYwn9eg8h2HWwdtoIBfiPXnfG3F8Aa/HSbMHuTis=;
 b=kVehsDLV6JHgrFHW+5WVRSPZjzZUHSwm0lu5wkQLqwGG+fUfolb/Eoz7kJVjbLTB1dvgSj+7vOnJTkhI1npELu7LJ903p3elxzKXPeJDP8QJ9pnNq0vz9kOOSnznHrK6npL8+xotYg8/p1T+Kt83MdCJDwHV6PywLyAT4rEAJX1Ib7L5gWECgo2RqHSfN98BiFzHL6LBTYLNpg8u0/tK0zIWAgfP9JIA/WoGZyWeW9waI/IB16C24CMryvMiAX47tcFoJuMQphHWefYf1ToN0aYQt4e1tRIzqG+jhZkhc6Dhh9bxIfqyiwfluyTc75wdkyZtoetLJlBQvKaMlC8GVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkhSYwn9eg8h2HWwdtoIBfiPXnfG3F8Aa/HSbMHuTis=;
 b=jfpi/kQ39auzB5k0iqV0dB9PkZAmLtIGVX0y1X8JuA9F9lpG5LrEcwV6uEi0JMXl74WcIEtwnytt664k3B0ybuOaA0JxHfcAuJpPRQNIWxhfIWGuSJqTGfZUZcPusPOONwhDtzqnNM6xZf2Ql2X6Vte09oP2s1KJX6vRYj6vxp0=
Received: from BY3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:254::29)
 by SJ5PPF1DE1C92F7.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::792) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 09:08:57 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::6f) by BY3PR05CA0024.outlook.office365.com
 (2603:10b6:a03:254::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 09:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 09:08:56 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:28 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 04:08:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 04:08:28 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D972bg274611;
	Fri, 13 Mar 2026 04:08:21 -0500
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
Subject: [PATCH v12 12/17] media: ti: j721e-csi2rx: add multistream support
Date: Fri, 13 Mar 2026 14:36:56 +0530
Message-ID: <20260313090701.646534-13-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|SJ5PPF1DE1C92F7:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b7223b-d18e-46f9-c95a-08de80e027d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zKG6QyVF2qgyzM5/icx9BnLBP+eGOX+S4T7zB3FbWZsmSi/m4FuMFKDX9vjKJM17AWvy9JPgq7Tf7+fIrvI8ZyPKVPlPk4oWmJcaN8Biq/FxBRSEkr127IsYlWx6zXJJam+odIuhYaHRein7QA1Rr5AG0pynrb/ZKi1FRqbtGdWyUWkpj1Pxn+vRF5lzOytJr04wKXZRKAa7WKPV7AvAOqRWjdi2IHfkQ0KPtBW+C+xh9xf+UpkEI/7fPcX4E9Io6zLunBBZVLc8WiARNwP3InZW0C3eK+KK+x/gOxrc7rHqLcFjJw1b1875ZpB3qmnX5TTvJJ8thEzfaxOZEB0I2fiJjkp/iBiymtJv6DFGbTjHPil3q3lvTvSgYPIxszS/25cRZAjv7mfDFO4vSBuTFHW99n844qtNcNEKa15GJdgQt4vYYnRBs9ti1yBpVQsnigq6JStToxpB4XR/3zPuAm/V0Rh2lMoQnOU7AeVCdYDZdU6YQBqa01te+FoKGwtCnMFc0oNC+ZyuZm+B0z32hmODFkGGvkKXxxY4T1O07gE38EhQHPqZhgysVBf/jeEEK0ng2JC2Y0tAm/7TrODZYc8JD5Cl8pv6JkBSGSjBXwcolq68e+2CsNRlMxKst//GghFyxOd2WeCFJcBkBmIZc0CFHtaZBwl770lGeJzjCSABDJDPalg3k/4KdBOzU/EejDkTKJ/gk0CUHZvq2SMqpi/oVSLdGoqZuZ2t4xbMUf79rcBMBrTwWLmwNfToSh22t33FP7YQU7gJTM/sGO5TcQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k6MPOobyzTioft3InFx80Oqr1jbH9sj5QDKBkLuWZ4gYv+snRH4kb8scWqbh8Oa5T60Y8vuK5+xFEmCUoXP4F8CYmQO6x9ynR4EsbyHzL+tawE6oBZ3fZDsQ1JIsMSMcFz6yKeLJCcnED/6uJ9sPttbM8592NqnWRWv143nH8G5ed37PF547/rtov1QhIYzFFknxNjBLgJPTPrQYqbIE6FJfBIo0y+5UmEyBqbP4DHN0IKQ+6BYct3Hn3o3IeA2pUVw5KhkxTlGzjjJAv/CDNvwTTf/Y2LlFKinlmBYauKVhEASMUEETUs6trn+EsjZbKJiel2OYMRDtPszsQhFhKJMJpDjq2Vzwe1WPBO0PKb+zBTuQWksOtee1I+vVI+Cq/FX3Fm9ikDJIocXEay9Pg8ftirZcBMZQQygutDWB8AlQn74iHRj/x79sMyvEp2bE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 09:08:56.1481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b7223b-d18e-46f9-c95a-08de80e027d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1DE1C92F7
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-55620-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,ti.com:dkim,ti.com:email,ti.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DA99C2803BF
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
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 274 ++++++++++++------
 1 file changed, 193 insertions(+), 81 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 24b687b4ea32a..5f4627f8c4921 100644
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
-	if (!pad)
+	/* Get the frame desc from source */
+	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (!source_pad)
 		return -ENODEV;
 
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


