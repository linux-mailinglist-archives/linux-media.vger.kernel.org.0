Return-Path: <linux-media+bounces-62252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MA9CZimDWpr1AUAu9opvQ
	(envelope-from <linux-media+bounces-62252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:18:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DC858D7DE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23596317686E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB453DBD49;
	Wed, 20 May 2026 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WqxG7ko+"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9083769FA;
	Wed, 20 May 2026 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278443; cv=fail; b=iBVZQEfdfUE77PHeLxZ8ZhRnZgfY5HSG15RKK1LbAv0yTsmri77Mpv9BNNe/C9kF+YapxQkorS2PQ0d90y2QSFCi02zRyc4JzBJNv89/qY7Ag3Dq+sGtQC0LiFiR713T7gyocE1y/gsrcMvr+Kxy+K/vB5aaZugVAwsWi8vFMY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278443; c=relaxed/simple;
	bh=9zuYfKMKUQAIkUHiKnAuGuwInEmmoLGAkSg2XuxWCPE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AxB1Ncfw2dOq/c2Ufj6VCeT9/l6H5B/v6TGVy4/usAYST5wtF6xn4hewiptZA9/Qealyp3aSUieBEDWBJmRTrCdDT3edFMJwgBwsB99FKXJyD2Y00UUrpCRe9kRyLgyYLY2sqcaX27zv2YNhWdvPYA4W8TcZosJW7tzQtcNd5c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WqxG7ko+; arc=fail smtp.client-ip=52.101.43.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ouss4RFKw71mdwVI9SxKsCB1/2QYZ4Rg9ACXD3auHp9Pqubm/EO5vpbiU9YG5P4JXqN7M6lNlJEZEs8gXnp13XfYJuo2/2VS4qLYMZnjd0SYzIAC7QZQof1F3fywMbKT+lTS6xCXR852Y7rZMPB6iTA21+dH+BYUOclEU657PcZ5+jZNg6FaWk0R6AZPuGk7Ob/nGXb8Yct/Mq0ytKyy0omySI3ssdmlCPImhV3h5Z1L7222yKFd0es1zKpQb9kVEItuqasjsiuImGOVSg/Xt3XykKjrKphp/6vOQhmUtFtL83asujLwbYQfj/4oYVe9t65XMQJvw4nybOMcWSIQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjqfsTEOMWJK2SrGFK9x3R5baiXW1jnhYLvz9RtBO88=;
 b=eN3Rn0y/8qoxBDxy3L4haAEcHTeoSUU3SiKeXJN83mkKIWzKKfZsLrFlQj0jT/6JF3KsI2W5gmPuYUSgErNl5zTdlliz47PRlimxLJpm+dyF1Njj5cvct5rfO3oEim+b20pRq4a1tMUNrYrrf8D1Ldoj3O5cFe0+tHfaq70zzFlFv+IOKFnoUi2BLZ5QntxMWrZwVgRnh6P/r8CNCYXiUKAgy5ToXxIs1El9Ax9GoU86m4UdWdzbRO4/6M9+z42ZEJcQpbALpC+HPWyq9BojkozP49qsgP0ESXHS8Z3P0GTNljYQcyimw5aFfvqIQlHX+3CaZrMwCXoBpchoOGpY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjqfsTEOMWJK2SrGFK9x3R5baiXW1jnhYLvz9RtBO88=;
 b=WqxG7ko+m7fYiVUA5AsJEwfo8bks7yy/2uusR/DUn2JuuHbOYSuySBdIz5/BuSxMhA0NVbEoN3EmjqIU76QA1/goYNthxzC64SAyshyKeUBmCNJOgWmssqBm/z36LhvM4DrNpovCgjKjVQunUvJmUrjsx9miyQC6HXPqKLqZAxs=
Received: from CY8P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:930:6b::6) by
 CH4PR10MB8028.namprd10.prod.outlook.com (2603:10b6:610:23d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 12:00:38 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:930:6b:cafe::70) by CY8P222CA0013.outlook.office365.com
 (2603:10b6:930:6b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:00:38 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:00:37 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:00:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:00:37 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3Q1914726;
	Wed, 20 May 2026 07:00:30 -0500
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
Subject: [PATCH v13 01/17] media: ti: j721e-csi2rx: Remove word size alignment on frame width
Date: Wed, 20 May 2026 17:30:06 +0530
Message-ID: <20260520120022.539913-2-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|CH4PR10MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ee9fc9-4e21-49c3-aa03-08deb667686e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	oC+9LFZQlO/yDa9wZGSNISZbdTqaf+V8vxq+PAXSQc6WXmer24Y8kFwVAjsD6Y2azQ83V2e/MpLd6ZomIw6QRBxU96QOhPlylN8TAHe1qVyWaGD8B7rxDxXDAVDbYoXmvQDkoCIgYv8G5YBr7RMrBmmTc3TkjSVtTjxNiihelfSoM5sNRafXDvcBFEe/Ltas8QqTBm79zJfCROv6756jRDL9EN58o692kY3LSWHxyyagmlFnlI7scbNj1aWUdOHPSLEmmcEYDASrk5EI6I3yKbOaoriYR1MEeg/jo6tx7di4ljZWjclxOE7SbGgTqKtufJ5xYNj0b77VlXsDG/UCMlG2bK5tAVO9SSsLlM03xg1YP8OvIVUnGhM8Qnz7TJ84fzQtAnHSPntC16MNb7WNtKuBzOfSqKyhfwFYv2cAcfid230VRRRqth3aToTS/yC/cwrqpgoALLFmO83aA8Mtfne3ltmRcxgdZ1te/pdUNNolei9SWv13Hbhh0YLeHE6HDUTUnjDIsuwG+sRitalv8V3aXMbaYKd104JiJfbt9YrcZfAHmjoTSf+BMI3sRJJateQ914zhEWWCAtfpAmBPCvgoEldAeg9m6830IB815TQDrxLam0awqGsko0MkNQcVXnwcHxEwK+N/JamupCNlrGKbNWbjt0yuBlWoMnGkMPzRlXgf481ID9Y+QbZQjGiVuooNE4McG7rUVMVaGOSKc8lbIP/yDJ/RBaag7K2Nw58=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KalXBeDkpb+Su6HxSKEu7o3AIiaEE0BsS2x4Q3NwHXyVvr51uNJnCYvSY4i835YlhTYlEnrUf0MgHVa4CewMgZ8rJNX2XmTkawAmPmHF/Z1pyconEx+zIlebRN2GEicF40LuQl91hxmjiBHgTK3U5hepQnc4LIt+s1dU4PprEBU2QcKsLtSv4o0LOhRpg2I8xutySJIoFyyxPQg8h0ErnDRKVUadv5vb2ZHfhcqULXmefZdQVK/AUD3zdos0SdbNI0IG4Mckh428WcwqTsocf5hlx3Iskc6Z21P6ApTfRm8okO7DbSz8onLM/JSwIJ2k4m/ieF8SwABvlolYbzgk9RiPoM3jsjn7k4X6Rk9XMV72N/qu5Dbf7m/aJUKAej7fVUTAtmld1Tx7ixpCKkyqjtwSaWcJrllaAuGKhpj1/6KJ9G/5ReOCvZTz8YQuoaGP
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:00:38.2240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ee9fc9-4e21-49c3-aa03-08deb667686e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8028
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
	TAGGED_FROM(0.00)[bounces-62252-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ti.com:url,ti.com:email,ti.com:mid,ti.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 74DC858D7DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

j721e-csi2rx driver has a limitation of frame width being a multiple
word size. However, there is no such limitation imposed by the
hardware [1].

Remove this limitation from the driver.

Link: https://www.ti.com/lit/pdf/spruj16
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 24 ++++---------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b75aa363d1bf..710d05a05353 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -43,7 +43,6 @@
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
 #define TI_CSI2RX_MAX_PIX_PER_CLK	4
-#define PSIL_WORD_SIZE_BYTES		16
 /*
  * There are no hard limits on the width or height. The DMA engine can handle
  * all sizes. The max width and height are arbitrary numbers for this driver.
@@ -250,19 +249,12 @@ static void ti_csi2rx_fill_fmt(const struct ti_csi2rx_fmt *csi_fmt,
 			       struct v4l2_format *v4l2_fmt)
 {
 	struct v4l2_pix_format *pix = &v4l2_fmt->fmt.pix;
-	unsigned int pixels_in_word;
-
-	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / csi_fmt->bpp;
 
 	/* Clamp width and height to sensible maximums (16K x 16K) */
 	pix->width = clamp_t(unsigned int, pix->width,
-			     pixels_in_word,
-			     MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
+			     1, MAX_WIDTH_BYTES * 8 / csi_fmt->bpp);
 	pix->height = clamp_t(unsigned int, pix->height, 1, MAX_HEIGHT_LINES);
 
-	/* Width should be a multiple of transfer word-size */
-	pix->width = rounddown(pix->width, pixels_in_word);
-
 	v4l2_fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	pix->pixelformat = csi_fmt->fourcc;
 	pix->bytesperline = pix->width * (csi_fmt->bpp / 8);
@@ -360,23 +352,15 @@ static int ti_csi2rx_enum_framesizes(struct file *file, void *fh,
 				     struct v4l2_frmsizeenum *fsize)
 {
 	const struct ti_csi2rx_fmt *fmt;
-	unsigned int pixels_in_word;
 
 	fmt = find_format_by_fourcc(fsize->pixel_format);
 	if (!fmt || fsize->index != 0)
 		return -EINVAL;
 
-	/*
-	 * Number of pixels in one PSI-L word. The transfer happens in multiples
-	 * of PSI-L word sizes.
-	 */
-	pixels_in_word = PSIL_WORD_SIZE_BYTES * 8 / fmt->bpp;
-
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-	fsize->stepwise.min_width = pixels_in_word;
-	fsize->stepwise.max_width = rounddown(MAX_WIDTH_BYTES * 8 / fmt->bpp,
-					      pixels_in_word);
-	fsize->stepwise.step_width = pixels_in_word;
+	fsize->stepwise.min_width = 1;
+	fsize->stepwise.max_width = MAX_WIDTH_BYTES * 8 / fmt->bpp;
+	fsize->stepwise.step_width = 1;
 	fsize->stepwise.min_height = 1;
 	fsize->stepwise.max_height = MAX_HEIGHT_LINES;
 	fsize->stepwise.step_height = 1;
-- 
2.34.1


