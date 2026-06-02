Return-Path: <linux-media+bounces-63385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AfQtFfrZHmrQWAAAu9opvQ
	(envelope-from <linux-media+bounces-63385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:26:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9BA62E75D
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:26:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=Lyk0Aiiu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63385-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63385-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C817306A7A8
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0F73F0745;
	Tue,  2 Jun 2026 13:14:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BBB3ED5B2;
	Tue,  2 Jun 2026 13:14:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406097; cv=fail; b=QgQaYeJzZPZZQHM404PuR5jOH0+ONrLdZ7w2hyKiesMeZ+foeKYA8h/kyImoM4nBWIuJYgkK8/ooHDyFibE2xRDDUAO1tYoj6zs64hDBr0V48pKaNu7+wEstxjWdxqHbArn3TlWYWoq2Y36EARoXOXvGl9EFHRF2AvhkNuFl560=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406097; c=relaxed/simple;
	bh=ivcIHjW6zQNW7fxCalkFJfu23/vtXV3N0mZjgSHHlLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qNUJASGu6k7LKPcP35JTnyLDQrjAmsX1GN7Evuh6k6xfimXwtNJRUCkhOvO8CYqCI0rhok6lHysX8+PAXv7wpIyBCEnIMI0XBM7GGXweSOe2d+vUT5kXMI0/ZMaDUSNtS4TxfB1r2LdsfD95uitsDhu8EM4r9H7myOtt/Lg1PcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Lyk0Aiiu; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LexdW/QVrqJ/c1QTkvPhe648xyHWdbcxT630cLiuKsw15mln92u7/BmIS9vnmzWPkL4TNljdVYNc6++6RgvGOe0eor/gseKSshrdvYp6bHwjYedcClBL1g3Hb4W5qikRay7m1OU3hxZ/MvTySnQORN4Md1ZT7sS4ccVaMeS1+bNn17gtg6c3I0VuinLqJsyAugzE9wHi6KYviQYQrQ2AAD1sYLMQLh/iqOxsGlwEd1TcoFfn91cnmsRi1VGSfsHyp/sB4lOBieuH/paZoJzcyxi4Ug3ocGKcD8jFG/qvJCTYrNr6cRRli2yl3ekh1H+U/M1pFS9YpFXpAY3tV8GI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YEHSsKeJ+iLYJYknXuvY2b7H1viUYft+8GleoWV9hU=;
 b=pCSGyYYTDbe5PwrAwGB5/7Llj0vzq7NhicyDhQm2h6F4ZwZXx8C1zxPqxQcjPxJf9mIUflJ4PQmBCBWXmwU2xae0bcf0HxJHuVWXI51gMIi59KfCQBCBH04Rm5bkc7ZjC1F+1gi29INyU3BEWlmhih5SjEEpUdgZumEHwkvKzmIi1aY2FTcdR8JohPYEGbgvRmQOOEtFaGuY430RQxxoQ6OTgcMiSQrcdmuwfa/jQgn6JVT+sHCbd1kJ3KVrAiUVRGp6sX74+2ahnGjEnKAMbBUf135J7lE9XsKoM4TIF+bt5mQfD9/KSKp+9UkAEiNl1Msk/Y9z8N29mo4FzSDXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YEHSsKeJ+iLYJYknXuvY2b7H1viUYft+8GleoWV9hU=;
 b=Lyk0Aiiu+ea7wiYMPQj+qk6YgLtKPGP4f1Y5J9zv9iOEjo48z6ZySj4iZN7WHTYqhnXOHQrEWR09yqarVReE37+Om9gq3W71x0CeVz4wdcgm3dQ/KyMw7tyDC1dCAR2reF2g2/T3Mpz02RAhfMRKiczYIFKliO25TxQj/afrlv6O3vZLrguSaJppfe4frzZWbjKKnSdqscBYxn06rG99C8DiXGUwWa4BzOtoWBsbLvxbN3jM+Mf4z0GO9yfDH/aB6otr7lWyF0qKojCejhSePM/pbikTdAA2wrX7RBrNqfGnghctPY3ItAdgHcxpGczNd/RW47qkJxdHxwi4axa+GA==
Received: from DB9PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:10:1da::27)
 by DB9PR10MB9885.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:603::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 13:14:45 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::4) by DB9PR05CA0022.outlook.office365.com
 (2603:10a6:10:1da::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:53 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:44 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:09 +0200
Subject: [PATCH v2 12/13] media: stm32: dcmipp: rename bytecap into capture
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-12-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sakari.ailus@linux.intel.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|DB9PR10MB9885:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ad61b7-8f03-486b-9c53-08dec0a8eabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YnvqdDlsKzMduGSMMxYuqyRWTmMuotnQ1jc+45J+QUqnQuHqvdMHVWB9ebZ8QI+wmA8HHtDuxht5EAMKEglMKFq8NiduDFER6QX7QzbEioS3nojz1XGARDePvGFWnDV7+CRns8ByMnQmtB6oPShX/tlZ4J97+9g3RqVbQiFPirct7ZlnoPh45Un30/SLxKf4lREMmOo1BftPCqcpRnyRVQI5M4zF5jOQJxmC529GuTTdHmxSWbVtAuprjcACnCR0B961VumpnjY1a9PaxpEO48YhDg71uC06eyQ2VTkOFwNtlC7zSi61MFSnxYM/S4T+UK331bWjumzk5ZT392aDptHNLMk7K4U08AP3ZkUkLysUwwyWtAs1ikshjMZqUUHWNNrF5zBJVKL9nG8ICNx7Hl706qk7pAE7XHANWjD6SoASlYRLcfzRnMSG1FHhRzOdaEM4vg/yySW/0otyXZCCkryCB/1tHvl3Wozm7EsLuSTnLL9ZiG4Hx2fZw5JBFU3IgCFVZ0xiXCCRj9TsA+4JhoQKMzdMHczCA7dl5jpg2tvaPc/o/0LITfZYJB1nXRqaAooaG4VfCwgADfavPeeYjvBXppdJpxG1XYNjODoH09OUW0aGV8xXeRJ+Did8hP3pWBaYjWwFSdyFtUbzFjUD3CbvdL9BkIEiWnQvMR4UY87FPZM3L0eLPpOvseWI+hQUOGmPITIUWVF6Ly1hwrnCrenbbputb5cEgjG3ZgjgIkM=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ioeBY4BKSYpU94V5KQNOOpXqrbyroY9n3SErw3ncFYj8k2YWXoZcEAlcwO9Dni5eHv8+GIIsQwlSHGjqdbR8tW3EDzSiKuamo7XyR1oL4/2cnSz9FSq7lVAdJaNJ5CV95IlYgVZ/5CBb6oWWs9n7G9Qo5DdIWO4PbYDKiIJtiwyYC17boMp52ptyxVqvRcSzQwQKcKXxAUL7RbMgejntoUV37lG4hdAuXOFjPaIazFsDmRi41Jn/FbuZvR+nZ/Hm06mdA8MNT85dbG6g84P8ugLIXs7fRxGnxW98jqvm5L1IthpUa2Ecdsr0gIL71ZOcIwfFN5plh37ZlWU7spG7zcH0xUB6cKk10nrvM2bKakDjn10VlW9W+ZnikTvzZRkeoLs83T/w7GNi0AQGrWCHYt78+V9b72TeGrHkqVZOnNOSFu8wXPpFyY5zdbn6wivz
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:45.7445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ad61b7-8f03-486b-9c53-08dec0a8eabd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB9885
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63385-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim,st.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D9BA62E75D

Since the bytecap video driver is now handling all
capture (byte & pixel), rename the file and structs
*into capture. This is done by:
  - renaming of dcmipp-bytecap.c into dcmipp-capture.c
  - replace of dcmipp_bytecap strings into dcmipp_capture

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
 .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 186 ++++++++++-----------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   4 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |   8 +-
 4 files changed, 100 insertions(+), 100 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 7178934bb116..e35d45a0aca2 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
+stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-capture.o
 stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o dcmipp-pixelproc.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
similarity index 86%
rename from drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
rename to drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
index d4432a9fa0e2..a51f5b92be5b 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
@@ -94,7 +94,7 @@
 
 #define DCMIPP_PxPPCR_SWAPRB		BIT(4)
 
-struct dcmipp_bytecap_pix_map {
+struct dcmipp_capture_pix_map {
 	unsigned int code;
 	u32 pixelformat;
 	u32 plane_nb;
@@ -108,7 +108,7 @@ struct dcmipp_bytecap_pix_map {
 		.pixelformat = V4L2_PIX_FMT_##fmt	\
 	}
 
-static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_dump_pix_map_list[] = {
+static const struct dcmipp_capture_pix_map dcmipp_capture_dump_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(RGB565_2X8_LE, RGB565),
 	PIXMAP_MBUS_PFMT(RGB565_1X16, RGB565),
 	PIXMAP_MBUS_PFMT(RGB888_1X24, RGB24),
@@ -152,7 +152,7 @@ static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_dump_pix_map_list[] =
 		.swap_uv = swap,			\
 	}
 
-static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pixel_pix_map_list[] = {
+static const struct dcmipp_capture_pix_map dcmipp_capture_pixel_pix_map_list[] = {
 	/* Coplanar formats are supported on main & aux pipe */
 	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, RGB565, 1, DCMIPP_PxPPCR_FORMAT_RGB565, 0),
 	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YUYV, 1, DCMIPP_PxPPCR_FORMAT_YUYV, 0),
@@ -187,7 +187,7 @@ struct dcmipp_buf {
 	struct list_head	list;
 };
 
-struct dcmipp_bytecap_device {
+struct dcmipp_capture_device {
 	struct dcmipp_ent_device ved;
 	struct video_device vdev;
 	struct device *dev;
@@ -219,7 +219,7 @@ struct dcmipp_bytecap_device {
 
 	u32 pipe_id;
 
-	const struct dcmipp_bytecap_pix_map *pix_map;
+	const struct dcmipp_capture_pix_map *pix_map;
 	unsigned int pix_map_array_size;
 
 	u32 cmsr2;
@@ -237,8 +237,8 @@ struct dcmipp_bytecap_device {
 	} count;
 };
 
-static const struct dcmipp_bytecap_pix_map *
-dcmipp_bytecap_pix_map_by_pixelformat(struct dcmipp_bytecap_device *vcap,
+static const struct dcmipp_capture_pix_map *
+dcmipp_capture_pix_map_by_pixelformat(struct dcmipp_capture_device *vcap,
 				      u32 pixelformat)
 {
 	for (unsigned int i = 0; i < vcap->pix_map_array_size; i++) {
@@ -249,11 +249,11 @@ dcmipp_bytecap_pix_map_by_pixelformat(struct dcmipp_bytecap_device *vcap,
 	return NULL;
 }
 
-static bool dcmipp_bytecap_is_format_valid(struct dcmipp_bytecap_device *vcap,
+static bool dcmipp_capture_is_format_valid(struct dcmipp_capture_device *vcap,
 					   unsigned int pixelformat)
 {
-	const struct dcmipp_bytecap_pix_map *vpix =
-		dcmipp_bytecap_pix_map_by_pixelformat(vcap, pixelformat);
+	const struct dcmipp_capture_pix_map *vpix =
+		dcmipp_capture_pix_map_by_pixelformat(vcap, pixelformat);
 
 	if (!vpix || (vpix->plane_nb > 1 && vcap->pipe_id != 1))
 		return false;
@@ -341,7 +341,7 @@ static inline int frame_planes(dma_addr_t base_addr, dma_addr_t addrs[],
 	return 0;
 }
 
-static int dcmipp_bytecap_querycap(struct file *file, void *priv,
+static int dcmipp_capture_querycap(struct file *file, void *priv,
 				   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DCMIPP_PDEV_NAME, sizeof(cap->driver));
@@ -350,20 +350,20 @@ static int dcmipp_bytecap_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_g_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_g_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 
 	f->fmt.pix = vcap->format;
 
 	return 0;
 }
 
-static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_try_fmt_vid_cap(struct file *file, void *priv,
 					  struct v4l2_format *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 	struct v4l2_pix_format *format = &f->fmt.pix;
 	/* Take into consideration the width constraint of the pixel packer */
 	unsigned int walign = (vcap->pipe_id != 0 ?
@@ -371,7 +371,7 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
 	u32 in_w, in_h;
 
 	/* Don't accept a pixelformat that is not on the table */
-	if (!dcmipp_bytecap_is_format_valid(vcap, format->pixelformat))
+	if (!dcmipp_capture_is_format_valid(vcap, format->pixelformat))
 		format->pixelformat = fmt_default.pixelformat;
 
 	/* Adjust width & height */
@@ -401,17 +401,17 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_s_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 	int ret;
 
 	/* Do not change the format while stream is on */
 	if (vb2_is_busy(&vcap->queue))
 		return -EBUSY;
 
-	ret = dcmipp_bytecap_try_fmt_vid_cap(file, priv, f);
+	ret = dcmipp_capture_try_fmt_vid_cap(file, priv, f);
 	if (ret)
 		return ret;
 
@@ -433,10 +433,10 @@ static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_enum_fmt_vid_cap(struct file *file, void *priv,
 					   struct v4l2_fmtdesc *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 	unsigned int index = f->index;
 	unsigned int i, prev_pixelformat = 0;
 
@@ -474,17 +474,17 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
+static int dcmipp_capture_enum_framesizes(struct file *file, void *fh,
 					  struct v4l2_frmsizeenum *fsize)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 
 
 	if (fsize->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table */
-	if (!dcmipp_bytecap_is_format_valid(vcap, fsize->pixel_format))
+	if (!dcmipp_capture_is_format_valid(vcap, fsize->pixel_format))
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
@@ -498,7 +498,7 @@ static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static const struct v4l2_file_operations dcmipp_bytecap_fops = {
+static const struct v4l2_file_operations dcmipp_capture_fops = {
 	.owner		= THIS_MODULE,
 	.open		= v4l2_fh_open,
 	.release	= vb2_fop_release,
@@ -508,14 +508,14 @@ static const struct v4l2_file_operations dcmipp_bytecap_fops = {
 	.mmap           = vb2_fop_mmap,
 };
 
-static const struct v4l2_ioctl_ops dcmipp_bytecap_ioctl_ops = {
-	.vidioc_querycap = dcmipp_bytecap_querycap,
+static const struct v4l2_ioctl_ops dcmipp_capture_ioctl_ops = {
+	.vidioc_querycap = dcmipp_capture_querycap,
 
-	.vidioc_g_fmt_vid_cap = dcmipp_bytecap_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = dcmipp_bytecap_s_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = dcmipp_bytecap_try_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_cap = dcmipp_bytecap_enum_fmt_vid_cap,
-	.vidioc_enum_framesizes = dcmipp_bytecap_enum_framesizes,
+	.vidioc_g_fmt_vid_cap = dcmipp_capture_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = dcmipp_capture_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = dcmipp_capture_try_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap = dcmipp_capture_enum_fmt_vid_cap,
+	.vidioc_enum_framesizes = dcmipp_capture_enum_framesizes,
 
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
@@ -528,7 +528,7 @@ static const struct v4l2_ioctl_ops dcmipp_bytecap_ioctl_ops = {
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 };
 
-static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_start_capture(struct dcmipp_capture_device *vcap,
 				 struct dcmipp_buf *buf)
 {
 	/* Set buffer address */
@@ -555,7 +555,7 @@ static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
 	reg_set(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
 }
 
-static void dcmipp_bytecap_all_buffers_done(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_capture_all_buffers_done(struct dcmipp_capture_device *vcap,
 					    enum vb2_buffer_state state)
 {
 	struct dcmipp_buf *buf, *node;
@@ -566,10 +566,10 @@ static void dcmipp_bytecap_all_buffers_done(struct dcmipp_bytecap_device *vcap,
 	}
 }
 
-static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
+static int dcmipp_capture_start_streaming(struct vb2_queue *vq,
 					  unsigned int count)
 {
-	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_capture_device *vcap = vb2_get_drv_priv(vq);
 	struct media_entity *entity = &vcap->vdev.entity;
 	struct dcmipp_buf *buf;
 	struct media_pad *pad;
@@ -580,7 +580,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 
 	/*
 	 * Get source subdev - since link is IMMUTABLE, pointer is cached
-	 * within the dcmipp_bytecap_device structure
+	 * within the dcmipp_capture_device structure
 	 */
 	if (!vcap->s_subdev) {
 		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
@@ -612,8 +612,8 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	spin_lock_irq(&vcap->irqlock);
 
 	if (vcap->pipe_id != 0) {
-		const struct dcmipp_bytecap_pix_map *vpix =
-			dcmipp_bytecap_pix_map_by_pixelformat(vcap, vcap->format.pixelformat);
+		const struct dcmipp_capture_pix_map *vpix =
+			dcmipp_capture_pix_map_by_pixelformat(vcap, vcap->format.pixelformat);
 		unsigned int ppcr = 0;
 
 		/*
@@ -662,14 +662,14 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	 * Return all buffers to vb2 in QUEUED state.
 	 * This will give ownership back to userspace
 	 */
-	dcmipp_bytecap_all_buffers_done(vcap, VB2_BUF_STATE_QUEUED);
+	dcmipp_capture_all_buffers_done(vcap, VB2_BUF_STATE_QUEUED);
 	vcap->active = NULL;
 	spin_unlock_irq(&vcap->irqlock);
 
 	return ret;
 }
 
-static void dcmipp_dump_status(struct dcmipp_bytecap_device *vcap)
+static void dcmipp_dump_status(struct dcmipp_capture_device *vcap)
 {
 	struct device *dev = vcap->dev;
 
@@ -685,9 +685,9 @@ static void dcmipp_dump_status(struct dcmipp_bytecap_device *vcap)
  * Stop the stream engine. Any remaining buffers in the stream queue are
  * dequeued and passed on to the vb2 framework marked as STATE_ERROR.
  */
-static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
+static void dcmipp_capture_stop_streaming(struct vb2_queue *vq)
 {
-	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_capture_device *vcap = vb2_get_drv_priv(vq);
 	int ret;
 	u32 status;
 
@@ -725,7 +725,7 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	spin_lock_irq(&vcap->irqlock);
 
 	/* Return all queued buffers to vb2 in ERROR state */
-	dcmipp_bytecap_all_buffers_done(vcap, VB2_BUF_STATE_ERROR);
+	dcmipp_capture_all_buffers_done(vcap, VB2_BUF_STATE_ERROR);
 	INIT_LIST_HEAD(&vcap->buffers);
 
 	vcap->active = NULL;
@@ -745,9 +745,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 			 vcap->count.underrun, vcap->count.buffers);
 }
 
-static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
+static int dcmipp_capture_buf_prepare(struct vb2_buffer *vb)
 {
-	struct dcmipp_bytecap_device *vcap =  vb2_get_drv_priv(vb->vb2_queue);
+	struct dcmipp_capture_device *vcap =  vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
 	struct v4l2_pix_format *format = &vcap->format;
@@ -797,9 +797,9 @@ static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void dcmipp_bytecap_buf_queue(struct vb2_buffer *vb2_buf)
+static void dcmipp_capture_buf_queue(struct vb2_buffer *vb2_buf)
 {
-	struct dcmipp_bytecap_device *vcap =
+	struct dcmipp_capture_device *vcap =
 		vb2_get_drv_priv(vb2_buf->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2_buf);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
@@ -823,13 +823,13 @@ static void dcmipp_bytecap_buf_queue(struct vb2_buffer *vb2_buf)
 	spin_unlock_irq(&vcap->irqlock);
 }
 
-static int dcmipp_bytecap_queue_setup(struct vb2_queue *vq,
+static int dcmipp_capture_queue_setup(struct vb2_queue *vq,
 				      unsigned int *nbuffers,
 				      unsigned int *nplanes,
 				      unsigned int sizes[],
 				      struct device *alloc_devs[])
 {
-	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_capture_device *vcap = vb2_get_drv_priv(vq);
 	unsigned int size;
 
 	size = vcap->format.sizeimage;
@@ -847,7 +847,7 @@ static int dcmipp_bytecap_queue_setup(struct vb2_queue *vq,
 	return 0;
 }
 
-static int dcmipp_bytecap_buf_init(struct vb2_buffer *vb)
+static int dcmipp_capture_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
@@ -857,19 +857,19 @@ static int dcmipp_bytecap_buf_init(struct vb2_buffer *vb)
 	return 0;
 }
 
-static const struct vb2_ops dcmipp_bytecap_qops = {
-	.start_streaming	= dcmipp_bytecap_start_streaming,
-	.stop_streaming		= dcmipp_bytecap_stop_streaming,
-	.buf_init		= dcmipp_bytecap_buf_init,
-	.buf_prepare		= dcmipp_bytecap_buf_prepare,
-	.buf_queue		= dcmipp_bytecap_buf_queue,
-	.queue_setup		= dcmipp_bytecap_queue_setup,
+static const struct vb2_ops dcmipp_capture_qops = {
+	.start_streaming	= dcmipp_capture_start_streaming,
+	.stop_streaming		= dcmipp_capture_stop_streaming,
+	.buf_init		= dcmipp_capture_buf_init,
+	.buf_prepare		= dcmipp_capture_buf_prepare,
+	.buf_queue		= dcmipp_capture_buf_queue,
+	.queue_setup		= dcmipp_capture_queue_setup,
 };
 
-static void dcmipp_bytecap_release(struct video_device *vdev)
+static void dcmipp_capture_release(struct video_device *vdev)
 {
-	struct dcmipp_bytecap_device *vcap =
-		container_of(vdev, struct dcmipp_bytecap_device, vdev);
+	struct dcmipp_capture_device *vcap =
+		container_of(vdev, struct dcmipp_capture_device, vdev);
 
 	dcmipp_pads_cleanup(vcap->ved.pads);
 	mutex_destroy(&vcap->lock);
@@ -877,16 +877,16 @@ static void dcmipp_bytecap_release(struct video_device *vdev)
 	kfree(vcap);
 }
 
-void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved)
+void dcmipp_capture_ent_release(struct dcmipp_ent_device *ved)
 {
-	struct dcmipp_bytecap_device *vcap =
-		container_of(ved, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_capture_device *vcap =
+		container_of(ved, struct dcmipp_capture_device, ved);
 
 	media_entity_cleanup(ved->ent);
 	vb2_video_unregister_device(&vcap->vdev);
 }
 
-static void dcmipp_buffer_done(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_buffer_done(struct dcmipp_capture_device *vcap,
 			       struct dcmipp_buf *buf,
 			       size_t bytesused,
 			       int err)
@@ -910,7 +910,7 @@ static void dcmipp_buffer_done(struct dcmipp_bytecap_device *vcap,
 
 /* irqlock must be held */
 static void
-dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
+dcmipp_capture_set_next_frame_or_stop(struct dcmipp_capture_device *vcap)
 {
 	if (!vcap->next && list_is_singular(&vcap->buffers)) {
 		/*
@@ -948,7 +948,7 @@ dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
 }
 
 /* irqlock must be held */
-static void dcmipp_bytecap_process_frame(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_capture_process_frame(struct dcmipp_capture_device *vcap,
 					 size_t bytesused)
 {
 	int err = 0;
@@ -974,10 +974,10 @@ static void dcmipp_bytecap_process_frame(struct dcmipp_bytecap_device *vcap,
 	vcap->active = NULL;
 }
 
-static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
+static irqreturn_t dcmipp_capture_irq_thread(int irq, void *arg)
 {
-	struct dcmipp_bytecap_device *vcap =
-			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_capture_device *vcap =
+			container_of(arg, struct dcmipp_capture_device, ved);
 	u32 cmsr2_pxframef;
 	u32 cmsr2_pxvsyncf;
 	u32 cmsr2_pxovrf;
@@ -1007,7 +1007,7 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 			bytesused = reg_read(vcap, DCMIPP_P0DCCNTR);
 		else
 			bytesused = vcap->format.sizeimage;
-		dcmipp_bytecap_process_frame(vcap, bytesused);
+		dcmipp_capture_process_frame(vcap, bytesused);
 	}
 
 	if (vcap->cmsr2 & cmsr2_pxvsyncf) {
@@ -1027,7 +1027,7 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 		 * active (but not used) buffer and put it back into next.
 		 */
 		swap(vcap->active, vcap->next);
-		dcmipp_bytecap_set_next_frame_or_stop(vcap);
+		dcmipp_capture_set_next_frame_or_stop(vcap);
 	}
 
 out:
@@ -1035,10 +1035,10 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
+static irqreturn_t dcmipp_capture_irq_callback(int irq, void *arg)
 {
-	struct dcmipp_bytecap_device *vcap =
-			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_capture_device *vcap =
+			container_of(arg, struct dcmipp_capture_device, ved);
 	struct dcmipp_ent_device *ved = arg;
 
 	/* Store interrupt status register */
@@ -1053,12 +1053,12 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 	return IRQ_WAKE_THREAD;
 }
 
-static int dcmipp_bytecap_link_validate(struct media_link *link)
+static int dcmipp_capture_link_validate(struct media_link *link)
 {
 	struct media_entity *entity = link->sink->entity;
 	struct video_device *vd = media_entity_to_video_device(entity);
-	struct dcmipp_bytecap_device *vcap = container_of(vd,
-					struct dcmipp_bytecap_device, vdev);
+	struct dcmipp_capture_device *vcap = container_of(vd,
+					struct dcmipp_capture_device, vdev);
 	struct v4l2_subdev *source_sd =
 		media_entity_to_v4l2_subdev(link->source->entity);
 	struct v4l2_subdev_format source_fmt = {
@@ -1114,8 +1114,8 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 	return 0;
 }
 
-static const struct media_entity_operations dcmipp_bytecap_entity_ops = {
-	.link_validate = dcmipp_bytecap_link_validate,
+static const struct media_entity_operations dcmipp_capture_entity_ops = {
+	.link_validate = dcmipp_capture_link_validate,
 };
 
 static int dcmipp_name_to_pipe_id(const char *name)
@@ -1130,10 +1130,10 @@ static int dcmipp_name_to_pipe_id(const char *name)
 		return -EINVAL;
 }
 
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+struct dcmipp_ent_device *dcmipp_capture_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp)
 {
-	struct dcmipp_bytecap_device *vcap;
+	struct dcmipp_capture_device *vcap;
 	struct device *dev = dcmipp->dev;
 	struct video_device *vdev;
 	struct vb2_queue *q;
@@ -1154,11 +1154,11 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 
 	/* Initialize supported format table format */
 	if (vcap->pipe_id == 0) {
-		vcap->pix_map = dcmipp_bytecap_dump_pix_map_list;
-		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_dump_pix_map_list);
+		vcap->pix_map = dcmipp_capture_dump_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_capture_dump_pix_map_list);
 	} else {
-		vcap->pix_map = dcmipp_bytecap_pixel_pix_map_list;
-		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_pixel_pix_map_list);
+		vcap->pix_map = dcmipp_capture_pixel_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_capture_pixel_pix_map_list);
 	}
 
 	/* Allocate the pads */
@@ -1173,7 +1173,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	/* Initialize the media entity */
 	vcap->vdev.entity.name = entity_name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
-	vcap->vdev.entity.ops = &dcmipp_bytecap_entity_ops;
+	vcap->vdev.entity.ops = &dcmipp_capture_entity_ops;
 	ret = media_entity_pads_init(&vcap->vdev.entity, 1, vcap->ved.pads);
 	if (ret)
 		goto err_clean_pads;
@@ -1188,7 +1188,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	q->lock = &vcap->lock;
 	q->drv_priv = vcap;
 	q->buf_struct_size = sizeof(struct dcmipp_buf);
-	q->ops = &dcmipp_bytecap_qops;
+	q->ops = &dcmipp_capture_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->min_queued_buffers = 1;
@@ -1217,8 +1217,8 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 
 	/* Fill the dcmipp_ent_device struct */
 	vcap->ved.ent = &vcap->vdev.entity;
-	vcap->ved.handler = dcmipp_bytecap_irq_callback;
-	vcap->ved.thread_fn = dcmipp_bytecap_irq_thread;
+	vcap->ved.handler = dcmipp_capture_irq_callback;
+	vcap->ved.thread_fn = dcmipp_capture_irq_thread;
 	vcap->dev = dev;
 	vcap->regs = dcmipp->regs;
 
@@ -1226,9 +1226,9 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	vdev = &vcap->vdev;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_IO_MC;
-	vdev->release = dcmipp_bytecap_release;
-	vdev->fops = &dcmipp_bytecap_fops;
-	vdev->ioctl_ops = &dcmipp_bytecap_ioctl_ops;
+	vdev->release = dcmipp_capture_release;
+	vdev->fops = &dcmipp_capture_fops;
+	vdev->ioctl_ops = &dcmipp_capture_ioctl_ops;
 	vdev->lock = &vcap->lock;
 	vdev->queue = q;
 	vdev->v4l2_dev = &dcmipp->v4l2_dev;
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 8f41473605aa..c0f7ed3acbfc 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -279,9 +279,9 @@ struct dcmipp_ent_device *
 dcmipp_byteproc_ent_init(const char *entity_name,
 			 struct dcmipp_device *dcmipp);
 void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved);
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+struct dcmipp_ent_device *dcmipp_capture_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp);
-void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
+void dcmipp_capture_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
 					      struct dcmipp_device *dcmipp);
 void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 9aba16096d28..a52b3b0e3c37 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -50,8 +50,8 @@ static const struct dcmipp_ent_config stm32mp13_ent_config[] = {
 	},
 	{
 		.name = "dcmipp_dump_capture",
-		.init = dcmipp_bytecap_ent_init,
-		.release = dcmipp_bytecap_ent_release,
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
 	},
 };
 
@@ -88,8 +88,8 @@ static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 	},
 	{
 		.name = "dcmipp_dump_capture",
-		.init = dcmipp_bytecap_ent_init,
-		.release = dcmipp_bytecap_ent_release,
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
 	},
 };
 

-- 
2.43.0


