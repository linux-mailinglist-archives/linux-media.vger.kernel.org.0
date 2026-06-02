Return-Path: <linux-media+bounces-63383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7zDPGBLYHmqdVwAAu9opvQ
	(envelope-from <linux-media+bounces-63383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F038262E672
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 15:18:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=Yu7czRy7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63383-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63383-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 006CF3049F83
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 13:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD8933A711;
	Tue,  2 Jun 2026 13:14:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80E93E9F9E;
	Tue,  2 Jun 2026 13:14:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406095; cv=fail; b=sjiGW00e/lzEP+pRsewqlunSqjMY+tcgfGxRYAtj40Tg+K1gTgsLOPhkKrPR/KJuR8/O5uDqOLwIZG3YY85g4KXXap/aFu1R8YKuixb3tUQqQdsWCCb3wpy10UtBmNJsz9k87W1aHJ+zFsDeD+fym1PRdD5LTXbYVS8DBrCMCKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406095; c=relaxed/simple;
	bh=JYx0Fh85mnOJuiO4W/fy6CjDYu1SG1aoinRsAmCcPe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ksse4p/Penn/xuqJHJ72GZvUX25DKeUpRa4NknF/nYVvZgMxIxp6FS+qbLuQKFWV8Ap3v5AWbrYcBe8R/DoiiX86XIiWc4/IRaDG+Zd0O8HQOmyLOL+abWY9Rld1ZDsy/wyeWVbHMfaIbFQjT3NqXfroN80LrBZPWLCcNxInma0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Yu7czRy7; arc=fail smtp.client-ip=52.101.66.19
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrRuParjFcbRkqvtxZf/wQf9uQqgACtADRd9FrT89T3OSdw0pGD6NouGTnYrP3dWUh11JCvEJITwqCOiM57i3F2Gll0Pc0VRbE0bzYFVNp4SVOEoBaG8vz4+hXRpinHYGd+GgXSN+iKdW1ThCPeXzYA7oCMYaXe2lGIjf+ETwY0Gu+Bet5Xk+wmWVuWU1j1FylpYaXDH3TpVX99lWtVNQaYy93CLYxph+cmb1XiIPPU6uUCMdZv96qEU7KZIYVdfBxnaAeTJ1pqkldR43pp9JCwXQWBysDYyH6ZLbNh4A4z2ineFHl5b2N7wAdizRrFHWeAa9tT0EcnqMgfAvJhkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1GFWQOYljmYkC2m2sFw3KuNIJh4IFq3RjGSseKCEYw=;
 b=P3s9qjWX03j7kzqhAI1S60oANqFyAJ3Y39lI+sfW9k5kC11QBGieOGMHT7H6PWABj2l/AWA1eSrURrQaSwOsyWSDGlwxRq+8SMlgA/5x9APagLZl5WdjeejvkFEajb+U625Q3hBNPKIbcsFf/We9RhgFyk8lu3Lnv+zzZJfNpCDkfjVHru+aoL5AbH6Ct47+MZkG1brO+TKZxBS9X2Kd/Kk/OGoFZDnBRd+p+HcbQLE17rNj9Mz9ylz6yYD86BW5N7YYZSq3mfXkqtbKhjwC3KfJS5ftfrz6IpR7vFQ4FoXGSSxfHja9zFG3ssGxMHsoMBgzWC3qzCwZFXcrAwUlHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1GFWQOYljmYkC2m2sFw3KuNIJh4IFq3RjGSseKCEYw=;
 b=Yu7czRy7OTybVf28hftnnpgrH/nRwfCIWaHF3BRJB1ekie56dVboYcAKOVs4IgsP7zTUD5uh7LFRbqyjeqtmh7UCoDTI9UKRv8Y32zn7WqqLhalu7DGh4W2tON2TtX+HJOMvfq0NxmRmV/abAfBTbAbqI3dam00EiXz/TcqyYz/xBRmHHaG34PBglXRnJgGq1KuVhTlFyklrXSogqMb8Zi/X3lfDUg/4gDLYBfwSYGIHCMsfg7e9KldeetR8VP/EpuNKlC/vCTE49kfAtMk9W2wwmVO3HFVWfj9Xrom23FUsPAwUcWTe3QqmQezryGBNWyIWf5OJbnNYWW1EUp15Sw==
Received: from AS4P192CA0010.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::17)
 by AM0PR10MB3620.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:151::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 13:14:44 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::97) by AS4P192CA0010.outlook.office365.com
 (2603:10a6:20b:5da::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 13:14:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:28 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:43 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:08 +0200
Subject: [PATCH v2 11/13] media: stm32: dcmipp: add pixel-pipe support in
 bytecap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-11-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|AM0PR10MB3620:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ff5c9e-f07b-4cca-eb10-08dec0a8e9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|22082099003|18002099003|6133799003|11063799006|5023799004|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	7ZgZN6XoLKPr8rvXf39+YsmBGKZDBTHaoW3R3oKDTrx93S9tM46f5Nu3dWxEk16WAdI/+dLoJ4d/77RpLFBoOcYODdlzsnCZnXOz2bGMj6ucMruvNjEA1qz4WBdt0+mJngeAJUGBuXFLcHKaBz6xRgZ400m9ciYVZ3aA/rioC+L72pbRnrsQLzATFthlCtqsi2/ZmuwVuRdT3K0LPKk+FbjEp7k0h3i1cppKc548apMvHLDEkCnlMswhPnNKLNR8+/5MSKNMf3shuKeM/5/ejhSf/7WnpF4pXHpYhLOv5iL+pyZrEtvlqSLxW+xGOBNb8kx1ceh+8ml7guwevG4rnAAaztBzF387AlH2R1YrcL7hH9duCTL1I9IadifJ7QuTaJdeGU20deACCqAq61+EqXrXRuhWib9kxn6YXuCm85R0+K30ZBnp6YTr0gboecWNVZNBd/oMwbezMRH/EiOFwN/rtGo1i0KVno+DFeGkbq1VheUES/1Z4FpXI9SQSEE1zYrj+Ni6WTowCqKUmumwqxcSlSeChP57oKGwnj7wJDMFsy2dJDtqkQ8ldkmj6ebI6YnlwqgzhRc2HQ4abkhsTO3Wp2p0mBR8n1UeDLTF5lVpb+PUECTTaTwWbRorsbGQX9xTpgsDKxV6tq48Dwnc7fh5kpLsBu/dwVG1fnRVbxRESociSkDSx0D5zt59yGRzJlUEHoR1hiWvvMFzpHqPYr6NrBKdhzTEKAxxy13Bv7g=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(6133799003)(11063799006)(5023799004)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VJDFuhWzLlcN6wLHzsaTIX2T7/yHLY+VSqap/ozbLDh0N1yAE1c7bYZbWsSreVP4dUVqi06JuXRdf5+E2nbsCCYuHejWwGwONk/py03YiQWBv1DOEADldvUskjrx6TmGxEbTyOBH72fwykQm+DqqsbXzNjdmHkTGYk2BQwVlkRkrpZWf5nmlnSs+2Sfjn7/WAsKoofYx5N+Q3WSokjsUJIbdYk451YzdvOHEjx7mkp/Jia3BmXJcmQr9Kehd9MtI1R5q8um3gMQ6k+6axRNicLTuiZxw8VN7LoOmb9nu6TgrjdEsnnGykAo/7ysQHqKQpVuH0XiXsEYJphiXTjgZ2EmzOV0FBQge3z50kw4oCLiESh/xW1JUaIpLl3FYRLMAQFAGxB5zxI4XAd/t/GsVxRkBoH0DHuWUh9IPcUkXxfvB9SMcoTii+gL+AjUSignn
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:44.3688
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ff5c9e-f07b-4cca-eb10-08dec0a8e9e8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3620
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63383-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-media@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,st.com:email,foss.st.com:mid,foss.st.com:from_mime,foss.st.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F038262E672

The dump pipe and pixel pipes capture part (tail of each pipe)
is different in that pixel pipes have a pixel packer capable
of generating various output format while the on dump pipe no
such manipulation is possible.
Still, all the buffer handling, format related manipulations
are all same hence both dump and pixel pipe capture part are
put together to avoid having large duplication of code.

This patch adds the pixel pipe capture within bytecap hence
name isn't modified and a further commit should rename the
file and probably function name to not only highlight byte
capture (aka dump pipe).

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 413 ++++++++++++++++++---
 1 file changed, 352 insertions(+), 61 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index bd6f2d68df80..d4432a9fa0e2 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -25,27 +25,81 @@
 #define DCMIPP_CMIER_P0ALL	(DCMIPP_CMIER_P0VSYNCIE |\
 				 DCMIPP_CMIER_P0FRAMEIE |\
 				 DCMIPP_CMIER_P0OVRIE)
+#define DCMIPP_CMIER_P1FRAMEIE	BIT(17)
+#define DCMIPP_CMIER_P1VSYNCIE	BIT(18)
+#define DCMIPP_CMIER_P1OVRIE	BIT(23)
+#define DCMIPP_CMIER_P1ALL	(DCMIPP_CMIER_P1VSYNCIE |\
+				 DCMIPP_CMIER_P1FRAMEIE |\
+				 DCMIPP_CMIER_P1OVRIE)
+#define DCMIPP_CMIER_P2FRAMEIE	BIT(25)
+#define DCMIPP_CMIER_P2VSYNCIE	BIT(26)
+#define DCMIPP_CMIER_P2OVRIE	BIT(31)
+#define DCMIPP_CMIER_P2ALL	(DCMIPP_CMIER_P2VSYNCIE |\
+				 DCMIPP_CMIER_P2FRAMEIE |\
+				 DCMIPP_CMIER_P2OVRIE)
+#define DCMIPP_CMIER_PxALL(id)	(((id) == 0) ? DCMIPP_CMIER_P0ALL :	\
+				 (((id) == 1) ? DCMIPP_CMIER_P1ALL :	\
+						DCMIPP_CMIER_P2ALL))
 #define DCMIPP_CMSR1		0x3f4
 #define DCMIPP_CMSR2		0x3f8
 #define DCMIPP_CMSR2_P0FRAMEF	BIT(9)
 #define DCMIPP_CMSR2_P0VSYNCF	BIT(10)
 #define DCMIPP_CMSR2_P0OVRF	BIT(15)
+#define DCMIPP_CMSR2_P1FRAMEF	BIT(17)
+#define DCMIPP_CMSR2_P1VSYNCF	BIT(18)
+#define DCMIPP_CMSR2_P1OVRF	BIT(23)
+#define DCMIPP_CMSR2_P2FRAMEF	BIT(25)
+#define DCMIPP_CMSR2_P2VSYNCF	BIT(26)
+#define DCMIPP_CMSR2_P2OVRF	BIT(31)
+#define DCMIPP_CMSR2_PxFRAMEF(id)	(((id) == 0) ? DCMIPP_CMSR2_P0FRAMEF :\
+					 (((id) == 1) ? DCMIPP_CMSR2_P1FRAMEF :\
+						       DCMIPP_CMSR2_P2FRAMEF))
+#define DCMIPP_CMSR2_PxVSYNCF(id)	(((id) == 0) ? DCMIPP_CMSR2_P0VSYNCF :\
+					 (((id) == 1) ? DCMIPP_CMSR2_P1VSYNCF :\
+						       DCMIPP_CMSR2_P2VSYNCF))
+#define DCMIPP_CMSR2_PxOVRF(id)	(((id) == 0) ? DCMIPP_CMSR2_P0OVRF :\
+				 (((id) == 1) ? DCMIPP_CMSR2_P1OVRF :\
+					       DCMIPP_CMSR2_P2OVRF))
 #define DCMIPP_CMFCR		0x3fc
-#define DCMIPP_P0FSCR		0x404
-#define DCMIPP_P0FSCR_PIPEN	BIT(31)
-#define DCMIPP_P0FCTCR		0x500
-#define DCMIPP_P0FCTCR_CPTREQ	BIT(3)
+#define DCMIPP_PxFSCR(id)	(0x404 + ((id) * 0x400))
+#define DCMIPP_PxFSCR_PIPEN	BIT(31)
+#define DCMIPP_PxFCTCR(id)	(0x500 + ((id) * 0x400))
+#define DCMIPP_PxFCTCR_CPTREQ	BIT(3)
 #define DCMIPP_P0DCCNTR		0x5b0
 #define DCMIPP_P0DCLMTR		0x5b4
 #define DCMIPP_P0DCLMTR_ENABLE	BIT(31)
 #define DCMIPP_P0DCLMTR_LIMIT_MASK	GENMASK(23, 0)
-#define DCMIPP_P0PPM0AR1	0x5c4
-#define DCMIPP_P0SR		0x5f8
-#define DCMIPP_P0SR_CPTACT	BIT(23)
+
+#define DCMIPP_PxPPM0AR1(id)	(0x5c4 + ((id) * 0x400))
+#define DCMIPP_PxPPM0PR(id)	(0x9cc + (((id) - 1) * 0x400))
+#define DCMIPP_P1PPM1AR1	0x9d4
+#define DCMIPP_P1PPM1PR		0x9dc
+#define DCMIPP_P1PPM2AR1	0x9e4
+
+#define DCMIPP_PxSR(id)		(0x5f8 + ((id) * 0x400))
+#define DCMIPP_PxSR_CPTACT	BIT(23)
+
+#define DCMIPP_PxPPCR(id)	(0x9c0 + (((id) - 1) * 0x400))
+#define DCMIPP_PxPPCR_FORMAT_RGB888	0x0
+#define DCMIPP_PxPPCR_FORMAT_RGB565	0x1
+#define DCMIPP_PxPPCR_FORMAT_ARGB8888	0x2
+#define DCMIPP_PxPPCR_FORMAT_RGBA8888	0x3
+#define DCMIPP_PxPPCR_FORMAT_Y8		0x4
+#define DCMIPP_PxPPCR_FORMAT_YUV444	0x5
+#define DCMIPP_PxPPCR_FORMAT_YUYV	0x6
+#define DCMIPP_P1PPCR_FORMAT_NV61	0x7
+#define DCMIPP_P1PPCR_FORMAT_NV21	0x8
+#define DCMIPP_P1PPCR_FORMAT_YV12	0x9
+#define DCMIPP_PxPPCR_FORMAT_UYVY	0xa
+
+#define DCMIPP_PxPPCR_SWAPRB		BIT(4)
 
 struct dcmipp_bytecap_pix_map {
 	unsigned int code;
 	u32 pixelformat;
+	u32 plane_nb;
+	unsigned int ppcr_fmt;
+	unsigned int swap_uv;
 };
 
 #define PIXMAP_MBUS_PFMT(mbus, fmt)			\
@@ -54,7 +108,7 @@ struct dcmipp_bytecap_pix_map {
 		.pixelformat = V4L2_PIX_FMT_##fmt	\
 	}
 
-static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
+static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_dump_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(RGB565_2X8_LE, RGB565),
 	PIXMAP_MBUS_PFMT(RGB565_1X16, RGB565),
 	PIXMAP_MBUS_PFMT(RGB888_1X24, RGB24),
@@ -89,24 +143,47 @@ static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(JPEG_1X8, JPEG),
 };
 
-static const struct dcmipp_bytecap_pix_map *
-dcmipp_bytecap_pix_map_by_pixelformat(u32 pixelformat)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
-		if (dcmipp_bytecap_pix_map_list[i].pixelformat == pixelformat)
-			return &dcmipp_bytecap_pix_map_list[i];
+#define PIXMAP_MBUS_PIXEL_PFMT(mbus, fmt, nb_plane, pp_code, swap)		\
+	{						\
+		.code = MEDIA_BUS_FMT_##mbus,		\
+		.pixelformat = V4L2_PIX_FMT_##fmt,	\
+		.plane_nb = nb_plane,			\
+		.ppcr_fmt = pp_code,			\
+		.swap_uv = swap,			\
 	}
 
-	return NULL;
-}
+static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pixel_pix_map_list[] = {
+	/* Coplanar formats are supported on main & aux pipe */
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, RGB565, 1, DCMIPP_PxPPCR_FORMAT_RGB565, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YUYV, 1, DCMIPP_PxPPCR_FORMAT_YUYV, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YVYU, 1, DCMIPP_PxPPCR_FORMAT_YUYV, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, UYVY, 1, DCMIPP_PxPPCR_FORMAT_UYVY, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, VYUY, 1, DCMIPP_PxPPCR_FORMAT_UYVY, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, GREY, 1, DCMIPP_PxPPCR_FORMAT_Y8, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, RGB24, 1, DCMIPP_PxPPCR_FORMAT_RGB888, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, BGR24, 1, DCMIPP_PxPPCR_FORMAT_RGB888, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, ARGB32, 1, DCMIPP_PxPPCR_FORMAT_RGBA8888, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, ABGR32, 1, DCMIPP_PxPPCR_FORMAT_ARGB8888, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, RGBA32, 1, DCMIPP_PxPPCR_FORMAT_ARGB8888, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, BGRA32, 1, DCMIPP_PxPPCR_FORMAT_RGBA8888, 0),
+
+	/* Semiplanar & planar formats (plane_nb > 1) are only supported on main pipe */
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, NV12, 2, DCMIPP_P1PPCR_FORMAT_NV21, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, NV21, 2, DCMIPP_P1PPCR_FORMAT_NV21, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, NV16, 2, DCMIPP_P1PPCR_FORMAT_NV61, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, NV61, 2, DCMIPP_P1PPCR_FORMAT_NV61, 1),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YUV420, 3, DCMIPP_P1PPCR_FORMAT_YV12, 0),
+	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YVU420, 3, DCMIPP_P1PPCR_FORMAT_YV12, 1),
+};
 
 struct dcmipp_buf {
 	struct vb2_v4l2_buffer	vb;
 	bool			prepared;
 	dma_addr_t		addr;
 	size_t			size;
+	dma_addr_t		addrs[3];
+	u32			strides[3];
+	u64			sizes[3];
 	struct list_head	list;
 };
 
@@ -140,6 +217,11 @@ struct dcmipp_bytecap_device {
 
 	void __iomem *regs;
 
+	u32 pipe_id;
+
+	const struct dcmipp_bytecap_pix_map *pix_map;
+	unsigned int pix_map_array_size;
+
 	u32 cmsr2;
 
 	struct {
@@ -155,6 +237,30 @@ struct dcmipp_bytecap_device {
 	} count;
 };
 
+static const struct dcmipp_bytecap_pix_map *
+dcmipp_bytecap_pix_map_by_pixelformat(struct dcmipp_bytecap_device *vcap,
+				      u32 pixelformat)
+{
+	for (unsigned int i = 0; i < vcap->pix_map_array_size; i++) {
+		if (vcap->pix_map[i].pixelformat == pixelformat)
+			return &vcap->pix_map[i];
+	}
+
+	return NULL;
+}
+
+static bool dcmipp_bytecap_is_format_valid(struct dcmipp_bytecap_device *vcap,
+					   unsigned int pixelformat)
+{
+	const struct dcmipp_bytecap_pix_map *vpix =
+		dcmipp_bytecap_pix_map_by_pixelformat(vcap, pixelformat);
+
+	if (!vpix || (vpix->plane_nb > 1 && vcap->pipe_id != 1))
+		return false;
+
+	return true;
+}
+
 static const struct v4l2_pix_format fmt_default = {
 	.width = DCMIPP_FMT_WIDTH_DEFAULT,
 	.height = DCMIPP_FMT_HEIGHT_DEFAULT,
@@ -168,6 +274,73 @@ static const struct v4l2_pix_format fmt_default = {
 	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
 };
 
+static inline int hdw_pixel_alignment(u32 format)
+{
+	/* 16 bytes alignment required by hardware */
+	switch (format) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YVU420:
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+	case V4L2_PIX_FMT_GREY:
+		return 4;/* 2^4 = 16 pixels = 16 bytes */
+	case V4L2_PIX_FMT_RGB565:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+		return 3;/* 2^3  = 8 pixels = 16 bytes */
+	case V4L2_PIX_FMT_RGB24:
+	case V4L2_PIX_FMT_BGR24:
+		return 4;/* 2^4 = 16 pixels = 48 bytes */
+	case V4L2_PIX_FMT_ARGB32:
+	case V4L2_PIX_FMT_ABGR32:
+	case V4L2_PIX_FMT_RGBA32:
+	case V4L2_PIX_FMT_BGRA32:
+		return 2;/* 2^2  = 4 pixels = 16 bytes */
+	default:
+		return 0;
+	}
+}
+
+static inline int frame_planes(dma_addr_t base_addr, dma_addr_t addrs[],
+			       u32 strides[], u64 sizes[],
+			       u32 width, u32 height, u32 format)
+{
+	const struct v4l2_format_info *info;
+
+	/* Only used by dump pipe hence addrs[0] is enough */
+	if (format == V4L2_PIX_FMT_JPEG) {
+		addrs[0] = base_addr;
+		return 0;
+	}
+
+	info = v4l2_format_info(format);
+	if (!info)
+		return -EINVAL;
+
+	/* Fill-in each plane information */
+	addrs[0] = base_addr;
+	strides[0] = width * info->bpp[0];
+	sizes[0] = strides[0] * height;
+
+	if (info->comp_planes > 1) {
+		addrs[1] = addrs[0] + sizes[0];
+		strides[1] = width * info->bpp[1] / info->hdiv;
+		sizes[1] = strides[1] * height / info->vdiv;
+	}
+
+	if (info->comp_planes > 2) {
+		addrs[2] = addrs[1] + sizes[1];
+		strides[2] = width * info->bpp[2] / info->hdiv;
+		sizes[2] = strides[2] * height / info->vdiv;
+	}
+
+	return 0;
+}
+
 static int dcmipp_bytecap_querycap(struct file *file, void *priv,
 				   struct v4l2_capability *cap)
 {
@@ -192,19 +365,20 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
 	struct v4l2_pix_format *format = &f->fmt.pix;
-	const struct dcmipp_bytecap_pix_map *vpix;
+	/* Take into consideration the width constraint of the pixel packer */
+	unsigned int walign = (vcap->pipe_id != 0 ?
+			       hdw_pixel_alignment(format->pixelformat) : 0);
 	u32 in_w, in_h;
 
 	/* Don't accept a pixelformat that is not on the table */
-	vpix = dcmipp_bytecap_pix_map_by_pixelformat(format->pixelformat);
-	if (!vpix)
+	if (!dcmipp_bytecap_is_format_valid(vcap, format->pixelformat))
 		format->pixelformat = fmt_default.pixelformat;
 
 	/* Adjust width & height */
 	in_w = format->width;
 	in_h = format->height;
 	v4l_bound_align_image(&format->width, DCMIPP_FRAME_MIN_WIDTH,
-			      DCMIPP_FRAME_MAX_WIDTH, 0, &format->height,
+			      DCMIPP_FRAME_MAX_WIDTH, walign, &format->height,
 			      DCMIPP_FRAME_MIN_HEIGHT, DCMIPP_FRAME_MAX_HEIGHT,
 			      0, 0);
 	if (format->width != in_w || format->height != in_h)
@@ -262,7 +436,7 @@ static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
 static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 					   struct v4l2_fmtdesc *f)
 {
-	const struct dcmipp_bytecap_pix_map *vpix;
+	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
 	unsigned int index = f->index;
 	unsigned int i, prev_pixelformat = 0;
 
@@ -271,17 +445,20 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 	 * care of removing duplicated entries (due to support of both
 	 * parallel & csi 16 bits formats
 	 */
-	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
-		vpix = &dcmipp_bytecap_pix_map_list[i];
+	for (i = 0; i < vcap->pix_map_array_size; i++) {
+		/* Only main pipe supports (Semi)-planar formats */
+		if (vcap->pipe_id != 1 && vcap->pix_map[i].plane_nb > 1)
+			continue;
+
 		/* Skip formats not matching requested mbus code */
-		if (f->mbus_code && vpix->code != f->mbus_code)
+		if (f->mbus_code && vcap->pix_map[i].code != f->mbus_code)
 			continue;
 
 		/* Skip duplicated pixelformat */
-		if (vpix->pixelformat == prev_pixelformat)
+		if (vcap->pix_map[i].pixelformat == prev_pixelformat)
 			continue;
 
-		prev_pixelformat = vpix->pixelformat;
+		prev_pixelformat = vcap->pix_map[i].pixelformat;
 
 		if (index == 0)
 			break;
@@ -289,10 +466,10 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 		index--;
 	}
 
-	if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list))
+	if (i == vcap->pix_map_array_size)
 		return -EINVAL;
 
-	f->pixelformat = vpix->pixelformat;
+	f->pixelformat = vcap->pix_map[i].pixelformat;
 
 	return 0;
 }
@@ -300,14 +477,14 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
 					  struct v4l2_frmsizeenum *fsize)
 {
-	const struct dcmipp_bytecap_pix_map *vpix;
+	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+
 
 	if (fsize->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table */
-	vpix = dcmipp_bytecap_pix_map_by_pixelformat(fsize->pixel_format);
-	if (!vpix)
+	if (!dcmipp_bytecap_is_format_valid(vcap, fsize->pixel_format))
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
@@ -355,14 +532,27 @@ static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
 				 struct dcmipp_buf *buf)
 {
 	/* Set buffer address */
-	reg_write(vcap, DCMIPP_P0PPM0AR1, buf->addr);
+	reg_write(vcap, DCMIPP_PxPPM0AR1(vcap->pipe_id), buf->addrs[0]);
 
-	/* Set buffer size */
-	reg_write(vcap, DCMIPP_P0DCLMTR, DCMIPP_P0DCLMTR_ENABLE |
-		  ((buf->size / 4) & DCMIPP_P0DCLMTR_LIMIT_MASK));
+	if (vcap->pipe_id == 0) {
+		/* Set buffer size */
+		reg_write(vcap, DCMIPP_P0DCLMTR, DCMIPP_P0DCLMTR_ENABLE |
+			  ((buf->size / 4) & DCMIPP_P0DCLMTR_LIMIT_MASK));
+	} else {
+		reg_write(vcap, DCMIPP_PxPPM0PR(vcap->pipe_id),
+			  buf->strides[0]);
+
+		if (buf->addrs[1]) {
+			reg_write(vcap, DCMIPP_P1PPM1AR1, buf->addrs[1]);
+			reg_write(vcap, DCMIPP_P1PPM1PR, buf->strides[1]);
+		}
+
+		if (buf->addrs[2])
+			reg_write(vcap, DCMIPP_P1PPM2AR1, buf->addrs[2]);
+	}
 
 	/* Capture request */
-	reg_set(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
+	reg_set(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
 }
 
 static void dcmipp_bytecap_all_buffers_done(struct dcmipp_bytecap_device *vcap,
@@ -421,8 +611,25 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 
 	spin_lock_irq(&vcap->irqlock);
 
+	if (vcap->pipe_id != 0) {
+		const struct dcmipp_bytecap_pix_map *vpix =
+			dcmipp_bytecap_pix_map_by_pixelformat(vcap, vcap->format.pixelformat);
+		unsigned int ppcr = 0;
+
+		/*
+		 * Configure the Pixel Packer
+		 * vpix is guaranteed to be valid since pixelformat is validated
+		 * in dcmipp_pixelcap_s_fmt_vid_cap function before
+		 */
+		ppcr = vpix->ppcr_fmt;
+		if (vpix->swap_uv)
+			ppcr |= DCMIPP_PxPPCR_SWAPRB;
+
+		reg_write(vcap, DCMIPP_PxPPCR(vcap->pipe_id), ppcr);
+	}
+
 	/* Enable pipe at the end of programming */
-	reg_set(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
+	reg_set(vcap, DCMIPP_PxFSCR(vcap->pipe_id), DCMIPP_PxFSCR_PIPEN);
 
 	/*
 	 * vb2 framework guarantee that we have at least 'min_queued_buffers'
@@ -436,7 +643,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 
 	/* Enable interruptions */
 	spin_lock(&vcap->vdev.v4l2_dev->lock);
-	reg_set(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	reg_set(vcap, DCMIPP_CMIER, DCMIPP_CMIER_PxALL(vcap->pipe_id));
 	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	vcap->state = DCMIPP_RUNNING;
@@ -467,7 +674,7 @@ static void dcmipp_dump_status(struct dcmipp_bytecap_device *vcap)
 	struct device *dev = vcap->dev;
 
 	dev_dbg(dev, "[DCMIPP_PRSR]  =%#10.8x\n", reg_read(vcap, DCMIPP_PRSR));
-	dev_dbg(dev, "[DCMIPP_P0SR] =%#10.8x\n", reg_read(vcap, DCMIPP_P0SR));
+	dev_dbg(dev, "[DCMIPP_P0SR] =%#10.8x\n", reg_read(vcap, DCMIPP_PxSR(0)));
 	dev_dbg(dev, "[DCMIPP_P0DCCNTR]=%#10.8x\n",
 		reg_read(vcap, DCMIPP_P0DCCNTR));
 	dev_dbg(dev, "[DCMIPP_CMSR1] =%#10.8x\n", reg_read(vcap, DCMIPP_CMSR1));
@@ -494,25 +701,26 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 
 	/* Disable interruptions */
 	spin_lock(&vcap->vdev.v4l2_dev->lock);
-	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_P0ALL);
+	reg_clear(vcap, DCMIPP_CMIER, DCMIPP_CMIER_PxALL(vcap->pipe_id));
 	spin_unlock(&vcap->vdev.v4l2_dev->lock);
 
 	/* Stop capture */
-	reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
+	reg_clear(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
 
 	/* Wait until CPTACT become 0 */
-	ret = readl_relaxed_poll_timeout(vcap->regs + DCMIPP_P0SR, status,
-					 !(status & DCMIPP_P0SR_CPTACT),
+	ret = readl_relaxed_poll_timeout(vcap->regs + DCMIPP_PxSR(vcap->pipe_id),
+					 status,
+					 !(status & DCMIPP_PxSR_CPTACT),
 					 20 * USEC_PER_MSEC,
 					 1000 * USEC_PER_MSEC);
 	if (ret)
 		dev_warn(vcap->dev, "Timeout when stopping\n");
 
 	/* Disable pipe */
-	reg_clear(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
+	reg_clear(vcap, DCMIPP_PxFSCR(vcap->pipe_id), DCMIPP_PxFSCR_PIPEN);
 
 	/* Clear any pending interrupts */
-	reg_write(vcap, DCMIPP_CMFCR, DCMIPP_CMIER_P0ALL);
+	reg_write(vcap, DCMIPP_CMFCR, DCMIPP_CMIER_PxALL(vcap->pipe_id));
 
 	spin_lock_irq(&vcap->irqlock);
 
@@ -525,7 +733,8 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 
 	spin_unlock_irq(&vcap->irqlock);
 
-	dcmipp_dump_status(vcap);
+	if (vcap->pipe_id == 0)
+		dcmipp_dump_status(vcap);
 
 	pm_runtime_put(vcap->dev);
 
@@ -541,7 +750,9 @@ static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
 	struct dcmipp_bytecap_device *vcap =  vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
+	struct v4l2_pix_format *format = &vcap->format;
 	unsigned long size;
+	int ret;
 
 	size = vcap->format.sizeimage;
 
@@ -557,6 +768,24 @@ static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
 		/* Get memory addresses */
 		buf->addr = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 		buf->size = vb2_plane_size(&buf->vb.vb2_buf, 0);
+
+		ret = frame_planes(buf->addr,
+				   buf->addrs, buf->strides, buf->sizes,
+				   format->width, format->height,
+				   format->pixelformat);
+		if (ret) {
+			dev_err(vcap->dev, "%s: Unsupported pixel format (%x)\n",
+				__func__, format->pixelformat);
+			return ret;
+		}
+
+		/* Check for 16 bytes alignment required by hardware */
+		WARN_ON(buf->addrs[0] & 15);
+		WARN_ON(buf->strides[0] & 15);
+		WARN_ON(buf->addrs[1] & 15);
+		WARN_ON(buf->strides[1] & 15);
+		WARN_ON(buf->addrs[2] & 15);
+
 		buf->prepared = true;
 
 		vb2_set_plane_payload(&buf->vb.vb2_buf, 0, buf->size);
@@ -690,7 +919,7 @@ dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
 		 * for next frame). On-going frame capture will continue until
 		 * FRAME END but no further capture will be done.
 		 */
-		reg_clear(vcap, DCMIPP_P0FCTCR, DCMIPP_P0FCTCR_CPTREQ);
+		reg_clear(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
 
 		dev_dbg(vcap->dev, "Capture restart is deferred to next buffer queueing\n");
 		vcap->next = NULL;
@@ -707,7 +936,13 @@ dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
 	 * This register is shadowed and will be taken into
 	 * account on next VSYNC (start of next frame)
 	 */
-	reg_write(vcap, DCMIPP_P0PPM0AR1, vcap->next->addr);
+	reg_write(vcap, DCMIPP_PxPPM0AR1(vcap->pipe_id), vcap->next->addrs[0]);
+	if (vcap->pipe_id == 1) {
+		if (vcap->next->addrs[1])
+			reg_write(vcap, DCMIPP_P1PPM1AR1, vcap->next->addrs[1]);
+		if (vcap->next->addrs[2])
+			reg_write(vcap, DCMIPP_P1PPM2AR1, vcap->next->addrs[2]);
+	}
 	dev_dbg(vcap->dev, "Write [%d] %p phy=%pad\n",
 		vcap->next->vb.vb2_buf.index, vcap->next, &vcap->next->addr);
 }
@@ -743,29 +978,39 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 {
 	struct dcmipp_bytecap_device *vcap =
 			container_of(arg, struct dcmipp_bytecap_device, ved);
+	u32 cmsr2_pxframef;
+	u32 cmsr2_pxvsyncf;
+	u32 cmsr2_pxovrf;
 	size_t bytesused = 0;
 
 	spin_lock_irq(&vcap->irqlock);
 
+	cmsr2_pxovrf = DCMIPP_CMSR2_PxOVRF(vcap->pipe_id);
+	cmsr2_pxvsyncf = DCMIPP_CMSR2_PxVSYNCF(vcap->pipe_id);
+	cmsr2_pxframef = DCMIPP_CMSR2_PxFRAMEF(vcap->pipe_id);
+
 	/*
 	 * If we have an overrun, a frame-end will probably not be generated,
 	 * in that case the active buffer will be recycled as next buffer by
 	 * the VSYNC handler
 	 */
-	if (vcap->cmsr2 & DCMIPP_CMSR2_P0OVRF) {
+	if (vcap->cmsr2 & cmsr2_pxovrf) {
 		vcap->count.errors++;
 		vcap->count.overrun++;
 	}
 
-	if (vcap->cmsr2 & DCMIPP_CMSR2_P0FRAMEF) {
+	if (vcap->cmsr2 & cmsr2_pxframef) {
 		vcap->count.frame++;
 
 		/* Read captured buffer size */
-		bytesused = reg_read(vcap, DCMIPP_P0DCCNTR);
+		if (vcap->pipe_id == 0)
+			bytesused = reg_read(vcap, DCMIPP_P0DCCNTR);
+		else
+			bytesused = vcap->format.sizeimage;
 		dcmipp_bytecap_process_frame(vcap, bytesused);
 	}
 
-	if (vcap->cmsr2 & DCMIPP_CMSR2_P0VSYNCF) {
+	if (vcap->cmsr2 & cmsr2_pxvsyncf) {
 		vcap->count.vsync++;
 		if (vcap->state == DCMIPP_WAIT_FOR_BUFFER) {
 			vcap->count.underrun++;
@@ -797,7 +1042,7 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 	struct dcmipp_ent_device *ved = arg;
 
 	/* Store interrupt status register */
-	vcap->cmsr2 = ved->cmsr2 & DCMIPP_CMIER_P0ALL;
+	vcap->cmsr2 = ved->cmsr2 & DCMIPP_CMIER_PxALL(vcap->pipe_id);
 	if (!vcap->cmsr2)
 		return IRQ_HANDLED;
 	vcap->count.it++;
@@ -826,6 +1071,26 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 	if (ret < 0)
 		return 0;
 
+	/* On pixel pipes there can be alignment constraints */
+	if (vcap->pipe_id != 0) {
+		u32 width_aligned;
+		/*
+		 * Depending on the format & pixelpacker constraints, vcap width is
+		 * different from mbus width.  Compute expected vcap width based on
+		 * mbus width
+		 */
+		width_aligned = round_up(source_fmt.format.width,
+					 1 << hdw_pixel_alignment(vcap->format.pixelformat));
+
+		if (width_aligned != vcap->format.width ||
+		    source_fmt.format.height != vcap->format.height) {
+			dev_err(vcap->dev, "Wrong width or height %ux%u (%ux%u expected)\n",
+				vcap->format.width, vcap->format.height,
+				width_aligned, source_fmt.format.height);
+			return -EINVAL;
+		}
+	}
+
 	if (source_fmt.format.width != vcap->format.width ||
 	    source_fmt.format.height != vcap->format.height) {
 		dev_err(vcap->dev, "Wrong width or height %ux%u (%ux%u expected)\n",
@@ -834,15 +1099,13 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 		return -EINVAL;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(dcmipp_bytecap_pix_map_list); i++) {
-		if (dcmipp_bytecap_pix_map_list[i].pixelformat ==
-			vcap->format.pixelformat &&
-		    dcmipp_bytecap_pix_map_list[i].code ==
-			source_fmt.format.code)
+	for (i = 0; i < vcap->pix_map_array_size; i++) {
+		if (vcap->pix_map[i].pixelformat == vcap->format.pixelformat &&
+		    vcap->pix_map[i].code == source_fmt.format.code)
 			break;
 	}
 
-	if (i == ARRAY_SIZE(dcmipp_bytecap_pix_map_list)) {
+	if (i == vcap->pix_map_array_size) {
 		dev_err(vcap->dev, "mbus code 0x%x do not match capture device format (0x%x)\n",
 			vcap->format.pixelformat, source_fmt.format.code);
 		return -EINVAL;
@@ -855,6 +1118,18 @@ static const struct media_entity_operations dcmipp_bytecap_entity_ops = {
 	.link_validate = dcmipp_bytecap_link_validate,
 };
 
+static int dcmipp_name_to_pipe_id(const char *name)
+{
+	if (strstr(name, "dump"))
+		return 0;
+	else if (strstr(name, "main"))
+		return 1;
+	else if (strstr(name, "aux"))
+		return 2;
+	else
+		return -EINVAL;
+}
+
 struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp)
 {
@@ -870,6 +1145,22 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	if (!vcap)
 		return ERR_PTR(-ENOMEM);
 
+	/* Retrieve the pipe_id */
+	vcap->pipe_id = dcmipp_name_to_pipe_id(entity_name);
+	if (vcap->pipe_id < 0) {
+		dev_err(dev, "failed to retrieve pipe_id\n");
+		goto err_free_vcap;
+	}
+
+	/* Initialize supported format table format */
+	if (vcap->pipe_id == 0) {
+		vcap->pix_map = dcmipp_bytecap_dump_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_dump_pix_map_list);
+	} else {
+		vcap->pix_map = dcmipp_bytecap_pixel_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_pixel_pix_map_list);
+	}
+
 	/* Allocate the pads */
 	vcap->ved.pads = dcmipp_pads_init(1, &pad_flag);
 	if (IS_ERR(vcap->ved.pads)) {

-- 
2.43.0


