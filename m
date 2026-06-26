Return-Path: <linux-media+bounces-65696-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ypu4IRpLPmouCwkAu9opvQ
	(envelope-from <linux-media+bounces-65696-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 11:49:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CF6CBD1F
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 11:49:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b="A/qu/cu4";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65696-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65696-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 930CA301AA6B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 09:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52693E95A8;
	Fri, 26 Jun 2026 09:49:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC384315F;
	Fri, 26 Jun 2026 09:49:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467343; cv=fail; b=lmxr4RsM0oFt1eXIhiho5Kr9zm6YG/rrSONflrcIZNXvKIRwaNP2CAYx9pV9/Fr4EDA2r/94F+HlGkz6RmSE0lmmlKCfHAGuBB7M/teA9PcU/tTZwl6HKAqKp1TW3gMJCwVKB4t9IC5nykmpkNXXccT6Q6mniY9bQLvoVmDLo7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467343; c=relaxed/simple;
	bh=J/+yxF2USTniOw78IrUVFkiDokD+BqUsvN8dctDszlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bKkXGQkwoKd0uePEY/xrhaAlps9AqLP7EU/HhyXy9Kn412dD10WTTr2Zo1JYUQM2Ym+3ICxhvjBD/wJQAAG2WMdP+RWAEFNXMUeKhgU3NY5xgSXlo2a619vaxVwvcpNthgeTp40vu4nzVscAOgAw8aUVHd+EF+U5cH7qQUxig7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=A/qu/cu4; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d55nDVI3EUC6kQxAmdVBx6msJFx7s51X5ne/gLKY7E0O+BtFDiVkSH875L09ucQSG1RC/VdWcYBZdFiOE/u+c9LLTrAKnb5xOq6l9+jsL0B2x0pmosXXWALbxi58ADCIzVaCxdp9J+QUycRenxFUNOWW5mdbn+9Rw/Sg+8LPXwgXM4fLWrmdB/X0YYR9ULHNyY4Cc8aoWDsMOmqw5HiHhWTr16unZHLrPc5zuZjw8LZ9irPbALWTvOVvbU7E6jnzeX+Z4ZMeDx1MnzApgO1goEt/6ZfA307XDd5ucXDz6MYrDLmPq1D3G2Ac2tt6mdV+SU1oycC1/Ac19B+VKvhxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i34zMvp1/S9mOO7shYwikYlJaStPlhIUoFlLuaKGtP4=;
 b=CooLqDPp1lPDYjUJ7b/GwOuTElYKUUMPHtze9sCctuE4yK7nX7tvjYbh/JFEoof0dkvYFFnMqkfKMN+shq8o4aXYwdUzluuhJIlve/WIFCYrZABLUb6cHfLFbzhSsBnnWQ94XKBPF5eNlOIu39NGFQjoNSlihf+NM3NeiqJ3RDRZggmBf/wE738vyoKvDQ+KMKAnEXWLAj5TRcHtnY9YhsS/fNjKw/cjI1y7NN9nA5qXjpzC88u+Bd9uw7aLamWJ/bwvnXY8YGq5z7lqB0p/AdmeZecM8VMqjR6En1p00s/osIarJGwm8f0K8NI/VViJZUezazZR2Tn9xQm7THujRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i34zMvp1/S9mOO7shYwikYlJaStPlhIUoFlLuaKGtP4=;
 b=A/qu/cu4vsV+0mVA24rcSmLuhN2oqHVJd27OwYV3zXcYhENDT2plWlOzLP84l8ogiWVqMBd35/efIR7C2St/lXjepCX8DHmpMrEzDUpYV/kaQKODFif5qELrz5tkm3eCWq/2IF5ihyXAhXQ4MLoHjSwzFsmMWyqkpwvF6Kc0hcgBWRArpXkXnlwlfTGRzWB37KwCBUkmdKzQai1pIwb8LbcVQOU+dVW8VXp4X07GA56NviJAtL2d4gCte6Osexwjqev2CRkGT8ytWtIs9DHq7Ey/mcWjdahf4LSjwv6eLNXGDQW1jkId3Eray3EtbtRDT5ny24lg8SMg59FSymoLOg==
Received: from CW1P123CA0024.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:292::15)
 by AMBPR10MB9320.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 09:48:59 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:400:292:cafe::1b) by CW1P123CA0024.outlook.office365.com
 (2603:10a6:400:292::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.12 via Frontend Transport; Fri, 26
 Jun 2026 09:48:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 09:48:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 26 Jun
 2026 11:53:12 +0200
Received: from [10.252.24.187] (10.252.24.187) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 26 Jun
 2026 11:48:57 +0200
Message-ID: <3a08a057-b08b-4dbc-9522-b0e94e48773e@foss.st.com>
Date: Fri, 26 Jun 2026 11:48:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: i2c: vd55g1: Fix media bus code initialization
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-1-4f745a83b87e@foss.st.com>
 <ajj90hhNwx7bLkOZ@zed> <f51d5d21-54fb-444a-9ae9-9b60e7a500f1@foss.st.com>
 <aj4u42ppuHSRqLIn@zed>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aj4u42ppuHSRqLIn@zed>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B4:EE_|AMBPR10MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: 861ab1db-6c3c-4825-9cc1-08ded368256c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|7416014|56012099006|6133799003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iSxk/vFionaJ+U2kcdIQY3KS/8+J03Y51WFNp4AkCWVmzpdlz/q8rHMzW1D+oSbqoatC5cYAWXXokQmE45sKmYDbcA2eJGGliU2LdtyQqHb2V0OJPaYiRsKwDaHnLJTVL798ydNuQdEtdKfFy47PEmSIVTdfjPLBk1ETlnASOomAhUTpbWonOepdQmZ3FB27HpvB7nm0kaHCsGwluJJHCHLll2GlqxWOW7nf436vK2lwFdizqnB93RK3IaJ1q5UqHlOYy9GSDkmfwoVHHWxqJIJtz81CVf7GhqjqKLZDFDubAKVqSwUKPPAoRoowX2GOpA0ndmWA/LP4Cha6I11jAC/4R+O8f+Qz+GL0i5uV1WHBYvHFiBAbXjW5wpKBhbCkU7Nfz1YUSnWNZhuGjqcTpkFm0KC88flV1970wC2xyR1o1iatlGWWcHJdVp1v2NkaUXflBtuuqG+hhlRVJWMT/hiySz3WKfT6Wujen0X98577WOdesBCsMhPAuYW8W7p+qHa9hOT0k9vCKczz9ZsZ3hir+V414h8ExLIapjK3i1CP2Lt7gVu22hjISCL3IUGrhsV92fCGD4DUPU4baKDMDEy//t/FvA3IqFJkbCCIfCtPRBaNIaUlyK5TLVh/HM5yO9fxkA7wos02V2h6Cobu/g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(7416014)(56012099006)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/qROFH3JrU3cF+PRAWGawutugc4rjmURxZYdAToJqnrSxoRZfaZC4mSHNeW7MhEMNM4IaM5C9rVkIHRqqw1S/ObTPggscS1/sIGOZuI6+J7hJ7o1ejgsTJymRYgIdF2V0oJR4rJUHVROk5B1GwbUDX8vt+upbkzWW4RRbTiaHxpK+4j5yrhofM7Yf0Pq0e8mEmd1/asBOUYR+ivr/wPBhWs9ALdoGs/mxzCzeir7n1cVfL2STKVCsw6G11XYWPQVLaTW9WaSIVr03+c/z8I4L3vqX+huRqms0n5hmD9yWBFoZgIsdk/4zeAknX/UZHzSEOIXh6hP2w5yIyqiT/WqpT4VzlKF2gyP3ei/Z9uIWP1n00UlqPGJp008hcVulieFmELbiocDGBBxadH/BLq+Dz0B/elUPryVTRNyArXVag953Nmw8fVVTW6k4OvaGCXl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:48:59.0269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 861ab1db-6c3c-4825-9cc1-08ded368256c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9320
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65696-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[foss.st.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD7CF6CBD1F

Hi Jacopo,

Le 26/06/2026 à 09:55, Jacopo Mondi a écrit :
> Hi Benjamin
> 
> On Thu, Jun 25, 2026 at 01:41:48PM +0200, Benjamin Mugnier wrote:
>> Hi Jacopo,
>>
>> Thank you for your review.
>>
>> Le 22/06/2026 à 11:28, Jacopo Mondi a écrit :
>>> Hi Benjamin
>>>
>>> On Tue, Apr 28, 2026 at 10:40:55AM +0200, Benjamin Mugnier wrote:
>>>> In the driver initialization, the index of the default media bus code
>>>> from the supported media bus code array is passed directly to the
>>>> vd55g1_get_fmt_code() function instead of the proper media bus code.
>>>>
>>>> This works correctly as a proper media bus code is set after
>>>> initialization but could not have been the case. This also resulted in
>>>> mutliple "Unsupported mbus format" error messages.
>>>>
>>>> Retrieve the media bus code from the media bus code array, and pass this
>>>> media bus code to vd55g1_get_fmt_code() instead of the code index.
>>>>
>>>> Rename VD55G1_MBUS_CODE_DEF to VD55G1_MBUS_CODE_IDX_DEF and
>>>> VD55G1_MODE_DEF to VD55G1_MODE_IDX_DEF while at it to avoid future
>>>> confusions. Display the guilty error code in warning message.
>>>>
>>>> Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")
>>>>
>>> You should cc stable for fixes
>>>
>>> Cc: stable@vger.kernel.org
>>>
>>
>> We talked about this very recently and somehow I still forgot.
>>
>>>
>>> The CI should have flagged that, but for some reason it didn't run
>>> properly on your series
>>> https://gitlab.freedesktop.org/linux-media/users/patchwork/-/pipelines/1655147
>>>
>>>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>> ---
>>>>  drivers/media/i2c/vd55g1.c | 17 +++++++++++------
>>>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
>>>> index 78d18c028154..1e9db21322e3 100644
>>>> --- a/drivers/media/i2c/vd55g1.c
>>>> +++ b/drivers/media/i2c/vd55g1.c
>>>> @@ -114,9 +114,9 @@
>>>>
>>>>  #define VD55G1_WIDTH					804
>>>>  #define VD55G1_HEIGHT					704
>>>> -#define VD55G1_MODE_DEF					0
>>>> +#define VD55G1_MODE_IDX_DEF				0
>>>>  #define VD55G1_NB_GPIOS					4
>>>> -#define VD55G1_MBUS_CODE_DEF				0
>>>> +#define VD55G1_MBUS_CODE_IDX_DEF			0
>>>>  #define VD55G1_DGAIN_DEF				256
>>>>  #define VD55G1_AGAIN_DEF				19
>>>>  #define VD55G1_EXPO_MAX_TERM				64
>>>> @@ -634,7 +634,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
>>>
>>> Unrelated, but it seems you now have 2 codes for MONO. Does
>>>
>>> 	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
>>> 		return code;
>>>
>>> need an update ?>
>>
>> Not in this patch because it does not add the new MONO sensor, but in
> 
> Not in this patch ofc
> 
>> 4/5 I separated the model ID from the color code. Example for the vd55g4 :
>>
>>   .name  = "vd55g4",
>>   .id    = VD55G1_MODEL_ID_3,
>>   .color = VD55G1_COLOR_VERSION_MONO,
>>
>> So the patch 4/5 updates the previous 'if' you mentioned to check the
>> color member instead of the model :
>>
>>   if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)
>>
>> Which IMO is a good way to handle this problematic. Tell me if you're
>> thinking about something else.
>>
> 
> Yes, I was thinking about the unconditional return of 'code'.
> 
> You know have two mono codes, shouldn't you do the same as you do with
> the bayer ones ?
> 

Ah, got you. You're correct, I thought it was not possible to pass a
code that is not supported by the driver by design. I'll add the same
check for mono codes.

>>>>  				goto adapt_bayer_pattern;
>>>>  		}
>>>>  	}
>>>> -	dev_warn(sensor->dev, "Unsupported mbus format\n");
>>>> +	dev_warn(sensor->dev, "Unsupported mbus format: 0x%x\n", code);
>>>>
>>>>  	return code;
>>>>
>>>> @@ -1347,6 +1347,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>>>>  {
>>>>  	struct vd55g1 *sensor = to_vd55g1(sd);
>>>>  	struct v4l2_subdev_format fmt = { 0 };
>>>> +	int code;
>>>>  	struct v4l2_subdev_route routes[] = {
>>>>  		{ .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE }
>>>>  	};
>>>> @@ -1361,9 +1362,13 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>>>>  	if (ret)
>>>>  		return ret;
>>>>
>>>> -	vd55g1_update_pad_fmt(sensor, &vd55g1_supported_modes[VD55G1_MODE_DEF],
>>>> -			      vd55g1_get_fmt_code(sensor, VD55G1_MBUS_CODE_DEF),
>>>> -			      &fmt.format);
>>>> +	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
>>>> +		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
>>>> +	else
>>>> +		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
>>>
>>> Being this a multi-dimensional array, I don't seem much value in
>>> defining VD55G1_MBUS_CODE_IDX_DEF if this is the only place where it
>>> is used. What's the meaning of VD55G1_MBUS_CODE_IDX_DEF for
>>> vd55g1_mbus_formats_bayer ? Does it represent the bitwidth or does it
>>> represent the bayer pattern ?
>>
>> For vd55g1_mbus_formats_bayer, the first dimension of the array is the
>> bitwidth, and the second one is the bayer pattern.
>>
>>>
>>> I would rather define a
>>> VD55G1_DEF_MBUS_CODE_MONO       MEDIA_BUS_FMT_Y8_1X8
>>> VD55G1_DEF_MBUS_CODE_BAYER      MEDIA_BUS_FMT_SRGGB8_1X8
>>>
>>> Or maybe do
>>>
>>> 		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF]
>>>                                                 [VD55G1_MBUS_CODE_IDX_DEF];
>>>
>>> if easier.
>>>
>>> I understand it's a minor, so up to you.
>>
>> As you mentioned it's only used here. I won't mind removing
>> VD55G1_MBUS_CODE_IDX_DEF entirely and do :
>>
>>   code = vd55g1_mbus_formats_bayer[0][0];
>>
>> Does that sound okay ?
>>
> 
> It does, thanks
> 
>>>
>>>
>>>
>>>> +	vd55g1_update_pad_fmt(sensor,
>>>> +			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
>>>> +			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
>>>>
>>>>  	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
>>>>  }
>>>>
>>>> --
>>>> 2.43.0
>>>>
>>>>
>>
>> --
>> Regards,
>> Benjamin
>>

-- 
Regards,
Benjamin


