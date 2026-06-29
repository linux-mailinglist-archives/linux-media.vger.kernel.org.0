Return-Path: <linux-media+bounces-65900-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0KvCCHRPQmpV4gkAu9opvQ
	(envelope-from <linux-media+bounces-65900-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:56:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D06D91CD
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:56:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=RG1jxqO2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65900-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65900-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26DDC303EDB6
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D8536D9F9;
	Mon, 29 Jun 2026 10:55:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41D4369D53;
	Mon, 29 Jun 2026 10:55:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730520; cv=fail; b=se1KbvR10iqYSej3Gs4Gy8O7D1TQHyfHqUT8CZ6ue1wCZyjTAyCnUkJc9YRDNtfXQb1O1wmjN4ehhj6rYGCfLpraSultengf/nNDH5vtawdeDFzBeiE5uR4lwIU2gxkdT8xyXe3OxsENZEc4PSFHF+N4GlbyDONUb0pbwCLmKvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730520; c=relaxed/simple;
	bh=CFi5VwlrEDL5LfEbBDI774LnssztussMj4c4BcBooDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nUFgL6O5b+sv5BJ0DVoOMu6hj2OLsbofAMCWNektQFzz/Owk/HCbj/KtA5eQ4aXOQwg5WPYrzyILbyQf75y42iGtm+0LAecyvaRqje9sBTLy2CAum1Eji9CB1yjJTqb9RABRogTr5qcSSvCZdiMFwYMg1U7eDsGM97/QnbywVyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RG1jxqO2; arc=fail smtp.client-ip=52.101.69.16
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHomE7rcTz3djcFggESh7fMZgBAn4OOyjW+VUGN5zWs19FVFkKxF/IxMy+8C6bPnoWc94ooFTHBq8MxS0Hx3w7uDBTWWAG5Rw+3adBGg5rcCVx1A1bZe0loyajJvBawTdJHKtOAfnHz6O99SFohatw+S5k+WYe5CGxrVmQcxxBFRUtLxNAo7F2MC7A/4qxzNrDlYjDx7vlJbrO0GXmjImh89J63lPuRt0ICxoedrnQz4a5wbMTeZ4GG1e1jCtvRaONaa80kWC32JFqzoc1Vf5spp5aRuDUPAbd6GcwMdIIqj3JMlbxtvOF/g6Pwvj+iIInaLNnQ4gKpNAibsTg3AZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9RmpjTtxxaAOECJryQvKu4+RLzCUUXvFMgQkkiZH8c=;
 b=yLciSjy+nmLuY0p0yHS5surdcsEMYW+OSlPQeZPAMuLLZjPTaCe34EFuU9/usGWLAEjtfkPV9h6O5xcmLJMQ8FW4yAYwMNUv36OCjI+2eA2PkUXY2eMbIwOjdcVdfrbfTy3UpC9bNHpgUz7Lc9dTm0kYI4wTfF8PTp4QxZUVntABI5yQBu6SHNej8OL5k+vP5OWYCSVX1Ayk0bCzAMo+blw/lbcgNOkU153dLKgHs8mb9vlccQlMf3A+xq9JYwPfNiDwBB/mXLOX0XYHzDCxbNgBJkoODIm9FxpO95pOM+JW2nMihlkhF7YWjZzydXAr7VW1ST4DA8VpzoqT5Z29Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9RmpjTtxxaAOECJryQvKu4+RLzCUUXvFMgQkkiZH8c=;
 b=RG1jxqO275EX8yxkahggRvc4rvuLU4XqjB0CGPiKhOESEMJMqPMFdzGpABld0GPLcnd0XIp9HrcwK6JT9fbBuxeNYX0kRyJJF29mui5zcMcBkABz4eBv1lDQRDbflVQ9bElOzyhz74lqtSRyV1gnJwxMUKVB4akHUaoNQHVgoTuaK5xB0fUAJtdoQV0HxMbDYoPlEURwyURPcLuFpSPBh0tlLl8m4dpc3m0pUd/QPfwP26UjAMePb1GpjL9hY6u+sMb4f29hnsIyumSDHzqNBtlF9iBQHt8gErc8hfOx7HSnaJYFRJvdQ4iGP+qieEwW43mcZ7dPR2KXFN6bgcR6cg==
Received: from CWLP265CA0501.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::22)
 by DU0PR10MB6020.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Mon, 29 Jun
 2026 10:55:01 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::18) by CWLP265CA0501.outlook.office365.com
 (2603:10a6:400:18b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 10:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 10:55:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:59:42 +0200
Received: from localhost (10.130.78.67) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 12:54:58 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Date: Mon, 29 Jun 2026 12:51:49 +0200
Subject: [PATCH v2 4/5] media: dt-bindings: vd55g1: Add vd55g4 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260629-vd55g4_and_fixes-v2-4-ea0a7cf3cd66@foss.st.com>
References: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
In-Reply-To: <20260629-vd55g4_and_fixes-v2-0-ea0a7cf3cd66@foss.st.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|DU0PR10MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f9c3fe3-39d7-43ad-b3a2-08ded5ccde1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|7416014|36860700016|56012099006|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	TXzOMUmrflduvZ9kR9S++tuTSFVpN4O75pM//aLEsD833JQQUdGvi4sl4J0+U3+bnpftBup5mDbI6oY1dGvF0I6dhU6atkHMOreYq2X3r85XG8tYrpp95nHR1jER+YD8v99bXuzbWEWKcBKLvvTM9bxyhvBJLjKC1EsgcLiYBGZwUM3OpQGi3FaxnWNrIbBnNw7Vzrvb/ovtjxqA7FpSI445jpNla4w6NjnzPrKeVTbN1XWH5wvC86JqGNeXFGcsYULOEcKkHR/gCyLDeok2HdTyNKExdZwvkUq43e+n9/14uU8h19X2jdD4p7VQD54b0kdWgOzhl91gDDzo92EoMMrNv8TwivlC7q8AgfSo9JfAMQz57vWj5jqPAB19KJV26q3TJhEaZEcSGML8R2m9X7IwZWhr9PanjoFOAT0Vc74A2MqW6SSV21Gx49C0Iq4+mScMXuISKBGMb5XjG4asYr+Fj8Qe45If8q4PAfEWZBiVSgHI03qVSJOfR59japzZSyadrq7FQOvbrr35LD+xjHhJYOeD5yApqF3eMjsBqw0g+8a4XWQzA9gOGldIB6Ob3q8Uwy96j9D4vAX1lZlQZAdCXDiZcJTTMS82FpusGtEEb/MxRtOURRIcyjoHmUSBcfTGgfXTOTvqYZLxpNQ1OocMbYDC0NDVUXYuvyiaj+whDHr9S93usCSie6OCbwqdw4jWmx51dIiR52ustW1LMQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(7416014)(36860700016)(56012099006)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PYtn5tX5cyStPklRHH4NxlJ0AcQUdwCRGbQfYcLuZD4Z4/OMoiJUJW/DtCGkgyNioDxzbH9+xBR0UmdVr1C9nDFcSo2K9K5+SEEJBBYsGc714PaJCQwitedM94SJnHNEyHVPPbjNXgzSvIVbnuKcokTJSjXABb+wCkt3s+EXY+4RAMKqo2jqOK+z3cPnhdS+rt/aswitYSMnuda2zpDVNjBs/WiN0kChoPMGV43O0LD1uZinvP51wAlN2lAh/K9vj/GoafTl3y8oYg7D5I4CFxyyTBaA/Fez0tP/xl3/6lLlLgvGVAEwO/ipKfnjnKknvXkoUBBzZit6mBLVqb8Oi10X74JX8Op17f1gFe5tKR3xrk1vl8Ws0TJq2svuqftipFaIR07VFL46GxczDE4gcw3+x7YePan2Ob1es1nfAr4elvOsHi+445vPgfPWQEwM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 10:55:00.8667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9c3fe3-39d7-43ad-b3a2-08ded5ccde1b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6020
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65900-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:benjamin.mugnier@foss.st.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 902D06D91CD

Define it as a new monochrome variant of vd65g4.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
index 060ac6829b66..58b1f9e85a9d 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -27,9 +27,10 @@ properties:
   compatible:
     enum:
       - st,vd55g1
+      - st,vd55g4
       - st,vd65g4
     description:
-      VD55G1 is the monochrome variant, while VD65G4 is the color one.
+      VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a color one.
 
   reg:
     maxItems: 1

-- 
2.43.0


