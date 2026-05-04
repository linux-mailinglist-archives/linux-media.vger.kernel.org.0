Return-Path: <linux-media+bounces-60310-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GmYJ1G2+Gn1zAIAu9opvQ
	(envelope-from <linux-media+bounces-60310-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 17:08:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF254C06CE
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 17:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F50C3066BDF
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 15:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D983DE44E;
	Mon,  4 May 2026 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="f0kny16e"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04E23A63EF;
	Mon,  4 May 2026 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906984; cv=fail; b=eohxz9GZA3TQYSWxUCQ3CZCc41s7iPn5drCJcvmAWIJR4NMZbVLqaxH7vNnElIqK231+gecfIli2G+BYII4nuFD16O/p7eVmuLcpZGJ36FQ4WzUz4x++ZDlUOj7+1AAB03Jrf6pCspVMUD4ogPEUaV0XyFQ1AqqXJg5uQy53aBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906984; c=relaxed/simple;
	bh=naDV2D0xSavQ1wT43+Oxi993VUbpS1SVtOZO6yswK5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZhiwDBVis/yXSThjiPmNfM5LeQEW2fUzk21Bp3zhkMKVtcTAGXNYjb2XibtmGITf/dg2Hvsm5OOiR4dyxMhSrXHNtuSMf9608gj//MGcDg0SXZeaAksb3PPa5DiSnMsPJZUxnJz2HvsLGWLs/jO8CI2KDwrJ+GPJxQQ/6bRm1yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=f0kny16e; arc=fail smtp.client-ip=40.107.159.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MEP5aU9hxAbfcMMgZf28IYhJwmjzbWCXO8/dkMVGe/1zp/vHMHK20V/HNGLNgrqGNl2ewHpLTTTHwDrVABXfnsPDYkdHIS+4Po/lC6VbCFGCx1O0ykIRRefVKW1iqFuj2wlBA7/7n2FF2jaaVR7HJFBu2SoXJ0ED7wcc7siN2Y5q1uDXmoAoa56kGvDBvhamHmuw1bRGLWEaMlJifVjbVQpGDxIX4v8VkPvDXu3+swFKobNl+YHqblJHZdOn84cy6Vgc6hNkuX3kUyV2nSry6E4LlU/IwruqmE6pJ1ZGmOeAApJ6VsjhItd5wtexG+oYmtVKwp20hwGXj9n65hWjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJDj/+xYaxMpgjn5KPKB5rSWnzcJEzLZ94PfcjxcvZM=;
 b=jTjv6j/NsN3qlDrUpn+a5zdKLH4s98AW0gy5JaYg6AtKBcvOD8TEUGLZOUlIWxMChSBfEANKnImx3NFCxqp0rBsHmRhJWutErIoGzih48lo1ZSt9WHmG63m5Wod+L3EmHYH4gSn3s0TyRmDX2frO7BgpeEEzSwLDfaNTiQdHf22QnDera5SEQc48Sik4SDB+qg3t6RlG7v9qEARw3a1yQ7z5VRQ9scLAn5CVOfpYfxUWXNezxMNtcHOKbg+beTqWy5WySrsI913JGYvVIPwdj5wbrh+Tc4g6faXoHjPoup5SMmwwG/+MqEigJo3crYEXfWnw6Ln2vSwgurQ4asWIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJDj/+xYaxMpgjn5KPKB5rSWnzcJEzLZ94PfcjxcvZM=;
 b=f0kny16eurFytZ4iGOqyqSHIC24ibVeRmIFT+hd4b6TmTGP7o9B//DKgE7vdUHcE9DSLh1zbGHfoiq8KffRJcUsPNSY/UnP7Odr6Z/gDErb8zQOM6OqMFg5jCqTP+sF9Dmc5QtK6iciMZ2LVfUYEMbj1i+D8xBIjCJ4BQQHyV9u4vtMVVkiTPzqHkzBEDM5APQWFrBxiiz+E/D7lRGqjV6wAA1ghf1ZQojM1Pwo09Nv+LVwp94msh68/EAvRZ8xRgOd7Gz337HTlrKOxlwQzm4hK2xOgnqI2967NyeTOTwEGNi/ebKyXMUH92l4H4+M2VLm1ZZ0GKTmdg3pXYoNUHg==
Received: from CWLP123CA0209.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::6)
 by DB9PR10MB7169.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:459::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 15:02:59 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:400:19d:cafe::14) by CWLP123CA0209.outlook.office365.com
 (2603:10a6:400:19d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 15:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 15:02:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 4 May
 2026 17:06:30 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 4 May
 2026 17:02:54 +0200
Message-ID: <b7341d7c-c2e1-40dd-97bf-e5df7fe3132e@foss.st.com>
Date: Mon, 4 May 2026 17:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] media: dt-bindings: vd55g1: Add vd55g4 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-5-4f745a83b87e@foss.st.com>
 <20260430-friendly-athletic-lemur-0ce874@quoll>
Content-Language: fr
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260430-friendly-athletic-lemur-0ce874@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C713:EE_|DB9PR10MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c12d1ee-b1c7-464a-0362-08dea9ee3ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|22082099003|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	zvSjkA9HzdztCzJRRaqvWPpj3ErtxGIctR083VT15UjBEkWOHVTV3imClBL02wIPrGm7bIQZzTfnMQr2QZz8fTfl0Jxq+Zmo/g9ApHnHlBuHMQbcbV42Bw/uZrbQADIM59i5XwNX9ywqcKvXFp13EKNIbW4AnDWE0cRcZ3u0s8/cICT3sCoUlE80g+A4n4eEOhzfHY+kLbU4OHjH+MhOS1103zfG9mUbwBCoOvXBa/NG34CHTLOSVqvGNJZIhicMXdZ4JXKJZxdkPaTeOeoo3SlKg/wZA4INDSUC6ClwV9UeERBGsxKNfWaYK3qH92e7YCi1vj5IgV1gHQO2I/5GECbqhNDcOfTjhdNk3RsLVyn7ual2dQSHw8jZtO5PtQ40OV/gIyt5QiRkHAmYbLXrcGsEhaEIee1AEhxdGS+20ZLVsnWAl3Ubq65ZrMnjR7wzX/nfUoQUN2epPmlGv9LlRdj2q6Hqb+m0tTXtyx97zh7IbDB05pMN5KSihrLH6A8DrhX/zFsWV3QTN20ViGDKiX+5Q6yIyRmEJtvao3iZTxzcixAfU46C7oB2cvlA4aVDkdKBIYekJyMZs9kjxwdjby1beGzKZ8aQLjRdsaaJ3sO8dQSA2OeaEqq7SaRRvy/uUaPS/akQJTKJTHTqbNkVTKgbK1f0+D5w3kpdwcHAEphE0lq6J8rGoKiUuozCEoS9
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(22082099003)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zip8hSSB0gcM+yYtQwloZnsAxfW6Z5Atd2X0g86q3rqiqJED6fJS7b5D9cM6WYPSxq4Mgrdci0Q5GJfwov1V1Pbz6sBXyPKdaZ6fHrs9v3lGNWBNtLCt9zxgDFq4w975lbay96aARE88xa5mWt1nGcdqjEwpuvXYhZWI2QUFGhxrRrxvdIWPExwv5IGCVV2GXh4ZD+qZVZwi/01qp/lUJy3QdKEWN6cmz6GsV/y+KpBFvvACqONNoueWriPiEkQTdJXVfHuouoFOplHVDYnJcfYp3BGs5TmTjnOStVk8Y5hLtEiiDTRQNSrflh7vOy1IqqTNyLJuULoXl8mZeh0GiiujdNVKfu95e7iwa0qbf2Crfz2vUZBBAx4aDmGuNClkOgjxSH9ZM7fGJkqdYhjuSwyYhfFxu1UvEa+b5tVUMdbiRMhqSrhxAYO39nicUvVs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 15:02:58.5289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c12d1ee-b1c7-464a-0362-08dea9ee3ac0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7169
X-Rspamd-Queue-Id: 4DF254C06CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60310-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:dkim,foss.st.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,bootlin.com:url,st.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[foss.st.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]

Hi Krzysztof,

Le 30/04/2026 à 11:37, Krzysztof Kozlowski a écrit :
> On Tue, Apr 28, 2026 at 10:40:59AM +0200, Benjamin Mugnier wrote:
>> Define it as a new monochrome variant of vd65g4.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> Please organize the patch documenting the compatible (DT bindings)
> before the patch using that compatible.
> See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Thanks. Sakari if you merge this serie could you reorder the commits
please ?

If this serie requires more changes than the reordering I'll do it in V2.

> 
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Benjamin


