Return-Path: <linux-media+bounces-65293-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HquVIZdQNWpxsgYAu9opvQ
	(envelope-from <linux-media+bounces-65293-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:22:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB336A6622
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 16:22:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=YHXwa86F;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65293-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65293-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32D723083000
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 14:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDA13382CB;
	Fri, 19 Jun 2026 14:20:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AD8337B81;
	Fri, 19 Jun 2026 14:20:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781878851; cv=fail; b=W6OczenzPa1TuNHyISFS2s8QsKbdKpjpRyevJaCMqMPmnPgRxPPRCTwusLb3jccO5rnmoxnGFzc62SvdV4xjh8J4hPxPt7IjWqhKhGxyhD1WY4NG9zH/Rf3sb0O3/HKaIFjQYA6nQ03FrXRWSegFl7LzpgCFMq0++x07BGmkmeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781878851; c=relaxed/simple;
	bh=n+JNPyooet+myogZIsxIfet2UQ1EVk8BnFf19GK39tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kr2U7nFjI/nbYRDZ1hVZN216q+euhJtPbTvYMqwrdYvJgZeCQwFqij4ddpHZrpbJHa6wU3bdJrwioatyQxc+1+qpbnL4aw6DDWD/bSRd1O2g64DcFEM7fePGoIvAc3RkLTqJYMLJST53y0GW3uedq0fMmhoEHCsJyCkqWtPG6Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YHXwa86F; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMfksfsI3n8DBm3y2UDHwgUVFK78J3r9TPS5gdxQxam6FkORUL7OTTUE7BcPa6r/d9hubVE8cyffTpb0p/6eoEt2p2ODXZVakkfP96MfuaYB4P/WHgVqd3j8tfkRerHBt/CWbkZUkjL/qlOwz+Gf8NlrYtd7db+h9/ao4yYYCLLcknptLOJzZd+NdSPrpG1PMxo/uEQxv1VvsnqqI7c4SIfs1r7CnxvjhL0AaXYIQJAmk015yASv6uI6vo0ABwv+H5plmwj96HoRb1hvDkR5jEWDtxAuU5BdYyrjkfRUi0vZMfRUPai/TEVZVhjrk3ycrof3Jt5F2HdJNbW312PYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIPHHULlNEKIcH7cSlFLAnkO8TQhULfoKXdEMBRrJQA=;
 b=QKOC0RYM36yyDInMspOPwb9dAM7YoXcqkfMqGjcEMRJfAmiehgc41jagncCqqpjfJ/18zCmv0p3Lno4hVQIxM+ahB5WGLSw/5OiEOzIb9SlAYDjb+BphAJ2mtLwin83bqyVn9ZEASAxnwdJY9zU+UhHNwq2qFvHk2uVygk8pfrUjzxXQSgkiUOiD3B5nWtFZG1MfFtfuO0jIxUXR1lLuPkw+M3rW6GPIUFJ63IGtKdyB9fQx8c4MVEF7Rdx1RPo70U6ecyRKj76SILSB66mkK7X3dIOg7VwBslip9PGXnOozLcBzdM9128PAoQwo0q2ATpu5bkiGcWDsBrQusiS/7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIPHHULlNEKIcH7cSlFLAnkO8TQhULfoKXdEMBRrJQA=;
 b=YHXwa86FnKLBs/IDErKP0/myexgnPHHP3TEQMRvCQJyhwGX4Zs4oHz3eoK9zPV/h+gGSuFUQdCcbThdBFdbL3lo6VYFZdD6p2dHkZlfJXx60dgrlglXxJI3TIX/J0btKwDoAerS7N8B/NzyhKL1lbL2C6/MyAXjRsTEFC73QlQVC34CBvCT1Gd/b6/O4QuRTXPfRm6irApOIfaDGXIqRnFI2U1baTOi976BgW8QyxpcAZj67afmtNzrIb9rzdnO/xsfKjJ3LN8Uy++6s/bRTCU6m/rejRO+BlQZ8Iz7qnVkYxFNhU3I9jvwM/R86lmvDbeiI8qwVStVAvokg5koskQ==
Received: from DB8PR06CA0063.eurprd06.prod.outlook.com (2603:10a6:10:120::37)
 by FRZPR10MB9918.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:1c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 14:20:47 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::48) by DB8PR06CA0063.outlook.office365.com
 (2603:10a6:10:120::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.15 via Frontend Transport; Fri,
 19 Jun 2026 14:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 14:20:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 19 Jun
 2026 16:24:49 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 19 Jun
 2026 16:20:43 +0200
Message-ID: <00851f14-1ac4-4faa-bfb3-b5b7341fe530@foss.st.com>
Date: Fri, 19 Jun 2026 16:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] media: i2c: vd55g1: Add vd55g4 support and various
 fixes
To: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|FRZPR10MB9918:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c810af7-e832-4b07-5fa5-08dece0df3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	y5IYUS9wJzeoNyrYeEmeMtuhdB9e4+IdlUGUg/ZUI+m1yHWaBINx8LH639E22IaZmMh06wOoFLab/xs+jdtnTzOmww4kuJYUd7/fZpaT+2GSnFK+6j7peZHZ72Dcbfg16yTxJnbYerc6aHNCgI57zopZpSbQb2bSf+IEmmbtUv6W4t0zUik+ydghnBPIv/BYpWbHNNIWHlcZfPun+mA+2GIjvjwLVBJ+8yMKXyGDd9RCSdW1PSh1WX7yUOrLge/oHfQjjMpZ23N8o2ljBt+M2oAG6JywUH43dJ6NcFZGKPiTkkLwrnoE3Kc1Kbx78hZBcmo0P2Dw3OjArqMARvmxOu+w4YMAKq6SIw6VoMOdkl6sWpVKt6xgMhvmtf5N+03p1bHR5xqqzyasAr5QYoPehaCD+t0vQzFgzvW3qUEHR2JZCBWKrgW+N+UtttKib6eMRuOYo+tLInY2VH1kSNKMhC99AD6RYY4/hsMsN5L1LpPYx4lLL3hZnstp0vlSiygbAXUdip0bsUOl0QF3vMPeS+U3a/iKYZE3woPfxmExhgcrYQWXp4i2FbLzVrZBzZnvBzbV1AiRiQRkCKYjMbz92l+iPLeooCjSDEjJokMQt6eQrZPoIhVmoMyKr1loHMDHWQp0XkoZqEG7/Ts4+8hxd6G9+dgGgLLWaQrNyKzOr9PklidjpcrLK7hOkNNe7kmXv+XvZz6pFD+6PppycTzwMg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R/y2ggzAjBHazM1/ihXMdUQ3M8w+RBh22Yamet2XcdM1LFUx3IJRmiubX6w71AXHhhRE+kyomb8DnFx0cZepo0z/RwKG39rZjL2XarbbmosRLFBOEhIoLllXG3hkRhj90bqeC+VcGf0jqKmmft3dpWCXuyRIt/Ri23tszIkBWIP8/FFL/M+KgW4x63r3ekYsUuS05xSQ3IaUFBLnU2WpWil3DlPKKdELccdA9T9/OqE2wksb3Hv3eZIkiH0tWUuDmYtqMjA4GGrcR3kx7ts6HkXPiiYDrX8HSz+OhAxFT7JGUpKiOjHpZT0bofNrEtJMXXa4tc2IgZMm1Myxl7y8iHFNHB2tX2iYetgSTJAshIZiSRYUvmR86TZfPrsTIqb92MwP7YffY5hSBuwTdzEcqRvYu7+wRW3rCF1QRjJARnz4TrtJbScRLuMMl5puoS6R
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:20:44.9995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c810af7-e832-4b07-5fa5-08dece0df3ab
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR10MB9918
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65293-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,st.com:email,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAB336A6622

Hi,

Gentle ping so it doesn’t get lost in limbo :)

Le 28/04/2026 à 10:40, Benjamin Mugnier a écrit :
> The vd55g4 is the monochrome variant of the vd56g4. This series adds the
> necessary code in the driver to probe and stream from the sensor
> in the correct format, and a new compatible in device tree bindings.
> 
> This series also fixes some issues I encountered while developing.
> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
> Benjamin Mugnier (5):
>       media: i2c: vd55g1: Fix media bus code initialization
>       media: i2c: vd55g1: Remove spurious pad format update on init_state()
>       media: i2c: vd55g1: Fix manual digital gain on color variant
>       media: i2c: vd55g1: Add support for vd55g4
>       media: dt-bindings: vd55g1: Add vd55g4 compatible
> 
>  .../devicetree/bindings/media/i2c/st,vd55g1.yaml   |   3 +-
>  drivers/media/i2c/vd55g1.c                         | 141 ++++++++++++++-------
>  2 files changed, 99 insertions(+), 45 deletions(-)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260428-vd55g4_and_fixes-97dc23b6f266
> 
> Best regards,
> --  
> Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> 

-- 
Regards,
Benjamin


