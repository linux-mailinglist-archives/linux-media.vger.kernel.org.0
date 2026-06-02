Return-Path: <linux-media+bounces-63382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n6XFBpLZHmqIWAAAu9opvQ
	(envelope-from <linux-media+bounces-63382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:24:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0B162E728
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:24:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=FhMJsVUn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63382-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63382-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77A733060614
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E2F3EDE67;
	Tue,  2 Jun 2026 13:14:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C163EA963;
	Tue,  2 Jun 2026 13:14:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406094; cv=fail; b=B0mXWyhfnPCtBEnaMd1Q/3s2Huy8R21XrxHyCFVEJdkKrLrDStVEDNZSIqSWAB4xDw88zmBamnIjstS5LRzTdxeqZlWVLYHgJ2W4XEoNaoQODchELaxbe3nx7bdvLTA8iqaAesyJcoSGgXKVgJ2vFit5ZSKx8uka1/4WXO5Qyyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406094; c=relaxed/simple;
	bh=XdIHwZhwUNU6WAJ7z2XvUC3QvhPFxH1fM7rny20ASWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aNKrM7wdjVcjc5+pU55Xeu5yuDNtgarpuZK/6cN5MAsnohxslsbTJn9UidhzjK2X1s0u6EKwpVadetZomC5KSBbl/iQ2AObIiDezZeJv/F9Gn1bGfzcPLzy6TpAYcGNXzCixmfj8WoQVaD2fkUh8NMw4wJzcR2ykVWnAcunDn80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=FhMJsVUn; arc=fail smtp.client-ip=52.101.72.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVehXWBGC0BsT82G5Gp+5tLmi03MoONuvlmE3syiYa6dih89Jwo71DtFGxgDWvcOSVjbcBGP9eCO+4OZZ2p7wBxjucjkcaEn+7m3nZfD5K5Dte8v+hBPYUyXUtlj1xLn34fQTtYHZ+olkmCchRcIFLMwlRWewLnHPUqsGWYAflaLLBnOCejmNVuVyj7QjSbBPGqOBNJNpB+paie5etLnNUk0YJ20kKgi1WiW7PtP9zCfo+JQHM2a888wsgi9MEvrvZmccvopUyiQZwwN1YAiTx8Qak3Ytxyc3SnAgwslwtbIIGRmox6b8FpKypw0HUA/XTcUsRerMtXNMKC4NCkHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tiES/GbyB4fWos+Pgblp+C1jXwj9g+q/ZWaN/wgUNQ=;
 b=IofHPFlFmCJJBJWpLU8vmlqGuggC8Low1twWEFd4JQFeab6671UDsoPF+cMgN2DbJOJUUEP6uElTaBdClzcBBi8HZmc/tR5j/Iu5hVwJyxnLc/jkosEHiFeqk1c6YBQM9/RJEdFIgVmfvBfeKmpOg0b+0E0Q+9uFLTbxiZp5+MQDy/8hMEFbCrxBnAcXbI9ow7RlJ7QN6SXKVuMwf4WcbdGDjOx2RbS052Nz3bd2y8w7Hdi/HZX0u5yDOY2Tv7+oa36fvKE3OSoyAj8MT6jzPbF7x1zY5+TDQrF5YcLy/rxTXeSZshrYsCL427Qgin0whRxp8a6ghGyb9eBwR/yhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tiES/GbyB4fWos+Pgblp+C1jXwj9g+q/ZWaN/wgUNQ=;
 b=FhMJsVUnUi64OrB0t1VrNkI9HKUxi9q27GgD05x/HmwmHecUmxEfOHm7xnRcJsc7YQQ3qAE7QUFh/UWOEi2zRtgzBLBvPRUYx2OkO7NL7SQ6yH0Rk1mRU4EjRxJRCfWRACZEvqYNqz3N7jzs0jtSVszpWBEMba5oeA/3b8eIwdGz8Y/2ZBuaTGATeRN2ZWSUkZQ1fztgH2pWgSwHDIiUWRQd7rvUCcCQKDbU0NClJWfp0V3Wy8rRev/iUYJuxrKteFTLPVsmNGRyq2s0nAaEzecU7Jse9y5JmvbcMyHctBW9gEFcoLgqgIqxaym436WKiMP9bQwEcmXLf9ndq7WZhQ==
Received: from CWLP265CA0462.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::8)
 by DU4PR10MB9047.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:55f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:14:45 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::60) by CWLP265CA0462.outlook.office365.com
 (2603:10a6:400:1d4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:29 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:44 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:10 +0200
Subject: [PATCH v2 13/13] media: stm32: dcmipp: instantiate & link
 stm32mp25 subdevs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-13-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|DU4PR10MB9047:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e2159d-3c26-4b35-6c77-08dec0a8eaa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eomKL01yGca4y3V+9n5FZlfQKeucA/xu8zSKQlySJtvKpVnfGIuFG5X7xTrmkqJiUZqUFLG4frYH+7OIjuDfv/78x5+XX9vOh9dm9M4bBwMo6gys1Qrnzumgy60fjdFk4EwWyMYFs5LvY9kSvq4BAVVlsMlZ+vQiYcfQe1x8cCOkV7fULnCEMXR0P7nLpqnFCgpEpEDm3QHYnmscOO1XkJyK9Wbx7V/OSvDZlmZauj/OF1WNGHhKoRByNMi9ntqHTpRq8YVmV3kUfcOAOAiTILMYWzjAcVrk8WTg3lHvArIX8ZpriXeDd7u/SS0xGtWKmaUKsip+AtL343PDoj/TORHqM5yj5BvLjVk2ndj8D1HTS58X2gfycOoKBlqpIwVqemvml3Ma1Kbdx6CkzX//4EYnlDmGCB71W9m4MK6Vo27cf4aJlJkfbll59TEVMWm58mRzCcK4rTIKNgFkaIu6X0hEERJ3pM2a8Ej1ZHhi9YfPzss/VrS+hn/8795mn9yzOLnj+Q2Y0fZ4nUskac/sDFm0OHPDtRItdJ0uREnJjfhTDYuyLtfJqh/v42kXZ+JUwKmAfZ3zdU2PTmEIprbNSYoZzW/AEFhK60k9R3RdAEPnuvsQsiN/vSJipZ9iEhC16e93SRK5YulgQ9y0HbbOrfHa5l2m2kUfbUZzWk5xRwuBIke6jzLgY6WrsOUIsUP38lPNgwjwzvD2QyYhsD4VMeJ8dlyuNPcFbt3gWAgfRIM=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1Kd9gLYyszXZLCicgpYitrdgTo9B86jL7/lzNg3tMTU66OYoYvjL+XRbF2AS0XBcvyvOukcnAhH4VGHWavfsALlln6+7PiPJ56tfvPGh1newy/G4O1wyUqodQhU8ais0/s7JGJQ/bw9tYnCgm9i2zFf7wZo8KSppIh1MMpvYErL1GA56B51DW7pnzM0wftRb3+o2u2GhBP1JOqxY50PRFb2vC15uvZseEtXb/zYgnRvCWRiOWbUyxHVmiZotQT7w8Pg/2cmnowlXaiSeqDwEp2vsqeEW98BiL+jsqvxvoJ9Bdt44HpzItPzlMfoFmtlH8/DfLAq4oMxDkF2kKHexnf/WXWBsEdDzqgW4owPmYxVDmS6hBNTS/1AxkNq07A8QbUHSilUsotsyISGAeZQgvUi357+QGhtB3ZxZN8LVaPhmGhgx2Ck+fHLLB0k8Snvn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:45.5711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e2159d-3c26-4b35-6c77-08dec0a8eaa0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63382-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E0B162E728

Add topology of the two pixel pipes (main & aux) of the stm32mp25.
Do not make the link from dcmipp_input immutable and enabled by
default since not all pipes are always used together so when a pipeline
is not being used its link should be disconnected to allow proper
pipeline check.
Not doing this would most probably lead to pipeline start failure due
to incompatible pads configurations on the unused pipe.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 42 ++++++++++++++++++++--
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index a52b3b0e3c37..44440f8ea9f5 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -75,6 +75,11 @@ static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
 	.hw_revision	= DCMIPP_STM32MP13_VERR
 };
 
+#define	ID_MAIN_ISP 3
+#define	ID_MAIN_POSTPROC 4
+#define	ID_MAIN_CAPTURE	5
+#define	ID_AUX_POSTPROC 6
+#define	ID_AUX_CAPTURE 7
 static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 	{
 		.name = "dcmipp_input",
@@ -91,13 +96,46 @@ static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 		.init = dcmipp_capture_ent_init,
 		.release = dcmipp_capture_ent_release,
 	},
+	{
+		.name = "dcmipp_main_isp",
+		.init = dcmipp_isp_ent_init,
+		.release = dcmipp_isp_ent_release,
+	},
+	{
+		.name = "dcmipp_main_postproc",
+		.init = dcmipp_pixelproc_ent_init,
+		.release = dcmipp_pixelproc_ent_release,
+	},
+	{
+		.name = "dcmipp_main_capture",
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
+	},
+	{
+		.name = "dcmipp_aux_postproc",
+		.init = dcmipp_pixelproc_ent_init,
+		.release = dcmipp_pixelproc_ent_release,
+	},
+	{
+		.name = "dcmipp_aux_capture",
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
+	},
 };
 
 static const struct dcmipp_ent_link stm32mp25_ent_links[] = {
-	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
-			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0, 0),
 	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
 			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT,	2, ID_MAIN_ISP,  0, 0),
+	DCMIPP_ENT_LINK(ID_MAIN_ISP,	1, ID_MAIN_POSTPROC,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_MAIN_ISP,	2, ID_AUX_POSTPROC,  0, 0),
+	DCMIPP_ENT_LINK(ID_MAIN_POSTPROC,	1, ID_MAIN_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
+	DCMIPP_ENT_LINK(ID_INPUT,	3, ID_AUX_POSTPROC,  0, 0),
+	DCMIPP_ENT_LINK(ID_AUX_POSTPROC,	1, ID_AUX_CAPTURE,  0,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
 };
 
 #define DCMIPP_STM32MP25_VERR  0x30

-- 
2.43.0


