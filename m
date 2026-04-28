Return-Path: <linux-media+bounces-59779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DnBFsNy8GldTgEAu9opvQ
	(envelope-from <linux-media+bounces-59779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:41:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F12A480529
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 10:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0A3E30157D8
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 08:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC213D47A9;
	Tue, 28 Apr 2026 08:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GWZ7UOYP"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A56AD24;
	Tue, 28 Apr 2026 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365665; cv=fail; b=OJBTh8U/vZWUDbrNPX4o9nywaL7JZaHajHwps8kMWvEBvX7BZgfmiEBJZ/ylwg2rVBfwuho8QjFEtSh2ea4QbOGPwkmxqK/6P8AWMWfRqNFYWob0gauvQCHtgiRIUkhVxlAhgv9zsAYxbAEsdSmVaAlktYvKTzL+Lz4uXaPYU3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365665; c=relaxed/simple;
	bh=TtHV4JozkEOAbTSb+XgXPHsj7blKoy+zCVQgTG9rEjk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uRSwgGzB5f9sE2SKLBDS6ls8ic+tpClEGkh9Igcp5Atx4stkjLR+NuuO4wtOTN8SBy83lpV2wO19mVyoYZDGl9hxJ6ELotk3tnYGdZo9a//9sxS3clcVTcNpXc/Yhhi5FE3JIVQce1l3p4QFBRibL6Fw2ot7/42CCZMAa1q2wB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GWZ7UOYP; arc=fail smtp.client-ip=52.101.84.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM/FaCecMYcyYObudq7fgALCvpPWfSLftGbRSMvQem6JehWi7br1lrtx4dOlSSAvsjFXcpKGKNSElsDvxy1vHxkW/HUr34Lv0zeWwt6n8frLAJ3vKjIVeOoWdEHvFwcFratZc67P8U5ghaIw9KPBpU8DFMTSWz2m+Q+hAmDMz0HsL5x//3UQKZxbne0qL2+cTST/n4MB4eAS8cgMAxdMf4bhiJl2GtFFy1ouxVINEDMoBndtD0nyYJWGJ6HtVRkRq3EPHUZddPLtexNOAb6ll3eZn499yYdN0GdN48y3MODqUqyfQwSKhQBC3USSzTsUVKa81NVc8xy/9BwBhMidyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiPlte0x8kyHO2sjHpDO2qCHHt76ileAEvtgDp4UyAA=;
 b=Vw4PqjHlRYoRvm+FLHZnQ4R24UurdnMA2D39d+g8buMPlx+xb7nqQZbX9As7MahVAZJU+plJKmSmdsLuSLXfCj2Mo3AFwikezBTE+E7WPuv6sYIbslMBhw/KWQAGBJF7qd/C6gbkrRIl2ZwaOaeb8TqEOIecif/JWyzi+cqY6WUK8Kq8YM4nXq3ETmEJ9sedULR1OCLY3vRXpEUFoxPYbENjrkJmKAL+N4gzX+qrY6qPXXfl8cwPtiLadFqWH2JLNlkO2QvsNc0QtPnRr7Lnn4c7jVZkAgRun1/FAQU+rHw4QWzkrrNPkbBT95uafGwqVNVYR7OhogwE1d2VjXwalg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiPlte0x8kyHO2sjHpDO2qCHHt76ileAEvtgDp4UyAA=;
 b=GWZ7UOYPBaS6tHzmJufuwZX+bkUGW4fhOaVxpZ49mKZN5fXdRGm0r+fTpjr5efq+DiIRfgnP6Ek47t3Q4VdcmDPlQhwBmsDvQqZ1Ih1q9tyua2b+wQZAv5Ursrc7//JxXcuzgX2lvKFZ7ENdZSypZpLCkdpZ/wiCS1PuuG6e9Uwv89fvzWukdRrBxV0AYFAxu2CSWV1Z+r/BCk9EU3pGiVb1v0Z12JTkmy7/qMcYSIpbha3Hdr4m/bcpz8hcO/HO2UIJrYtW/E9yLTr7q0rNFqmFbAlSplnWOTEcncUI5X7P5+hAs2l+QRMJv327ZT5fS9itdvGynowj9JMtCygtww==
Received: from AM0P309CA0011.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::33)
 by DU2PR10MB7646.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:492::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:40:58 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::80) by AM0P309CA0011.outlook.office365.com
 (2603:10a6:20b:28f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.12 via Frontend Transport; Tue,
 28 Apr 2026 08:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 08:40:57 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:44:28 +0200
Received: from localhost (10.252.13.121) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Apr
 2026 10:40:56 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 0/5] media: i2c: vd55g1: Add vd55g4 support and various
 fixes
Date: Tue, 28 Apr 2026 10:40:54 +0200
Message-ID: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZy8GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3bIUU9N0k/jEvJT4tMyK1GJdS/OUZCPjJLM0IzMzJaC2gqJUsAR
 QV3QshF9cmpSVmlwCMkepthYA4CXhLHQAAAA=
X-Change-ID: 20260428-vd55g4_and_fixes-97dc23b6f266
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|DU2PR10MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: df85e11a-ad0e-47dc-b6bd-08dea501de63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rWb/+GyOXsWQkSAFZ3GIku4gRKq811AIKQlN6+FBES82AmGPQH+M40BVyq1tKozj9dr0s5Z+UGFdxAwujwBu8V0Rt8MZT07UEBc1UvzpOknakXB1xCii+qTk8icqRx1Mp7rzEXOluCiE5PGOimw4Ww8FX8EZRzxI9M6MyY/HCJR+1ZfZH3RFgXSQ6tYDxSf4UBa2flvDqfQQxzhdZUyqItNRjdcle5szKZd5Jqy1/z8mf5FfpyQ2ZMngFm2CDOhoDI4d+Q9jrG7c4rT446MWNzjk6bN+9yJ6hf85sN0j5KM0Bxtj9DHWq67wAFn0Z0VJHfnER6K+8sw1BYHqdGjJaKy3xfazMxArFBwfz3SdUcNYJJNX4Z1/xfZAOAtO0J9fB2N1083YrfDnYEoMgKwVuhtArNMTdWK5tzpghbFfSA/0c2KtOM9coMqZwm929ttSOkYzIx5hz25FUUJT2V2an2LyC95dZYJnRmlUnMWARVB6xOAghsp+/8d1X8o0Vi513U/+ffQRUzVR2BZgryzNrFBk85uuh5c63D31IlGRmXY/AsLqDt5B82cAr0ukTMMu/j6KzKXUnwWnXDkNqXB4bN4xGmpWouNtQWEa4A0e/fo3TY6C1eInsFtPHfE45yjZdDhrSru6OeNp5sI/ePQp9wFxmeFOdDKJw5p1cKGN9vhp/Ggwbn0axbiAoYvHBgSDUqpBNXdylW5WZ3Uxzhse02VOgLVNILbLDz7NPK7U7wqgfC8p1ekGSg/MiwC5g96xvpp3yPoB1CQx90LX1EFzDA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wvoyj/9Ve6bYiZzMC6X06+zLKZViTTdKt7lodVU62BKbDN+QRmC4Q/sTfpLyqZsZC3P6GELCjUSf634jFbPMBQyMPa/xJrVQ8aDl56rWHtAXKGWQ4Y0dcJLvODhRs1EvHx0pVG4ooHKnL8CHQaUsMXxHvpiVB83BilKsk4Wl+2lIeqK/JVV07gBnnx/eN0KjHiL/5Sit6Qc5t/ecE6+CpwI5QTue5BXTeXAq0YEUTCUshvSAy/dYc7Y3LYEN/KyN4y+XMU1/8Wb88fCg/E/7OMSn1iH5+lAhM7f026ADbURc0QqHDfclgvfbpQu+IIQigntVwoYE2QKP1xBn1Q7VP8i8i1VzHkQ8u1zX2y7TYW8OjNywmu0n0nsLzs9v1nNA4mLVMLBOzeGK26YFYog4KvikdHXLFCLgFSqAkOpw5ReOpo5A+MSH2LG1v3S5BhWR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:40:57.6932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df85e11a-ad0e-47dc-b6bd-08dea501de63
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7646
X-Rspamd-Queue-Id: 0F12A480529
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59779-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:dkim,foss.st.com:mid,st.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]

The vd55g4 is the monochrome variant of the vd56g4. This series adds the
necessary code in the driver to probe and stream from the sensor
in the correct format, and a new compatible in device tree bindings.

This series also fixes some issues I encountered while developing.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
Benjamin Mugnier (5):
      media: i2c: vd55g1: Fix media bus code initialization
      media: i2c: vd55g1: Remove spurious pad format update on init_state()
      media: i2c: vd55g1: Fix manual digital gain on color variant
      media: i2c: vd55g1: Add support for vd55g4
      media: dt-bindings: vd55g1: Add vd55g4 compatible

 .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |   3 +-
 drivers/media/i2c/vd55g1.c                         | 141 ++++++++++++++-------
 2 files changed, 99 insertions(+), 45 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260428-vd55g4_and_fixes-97dc23b6f266

Best regards,
--  
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


