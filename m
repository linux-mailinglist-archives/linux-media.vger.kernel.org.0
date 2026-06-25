Return-Path: <linux-media+bounces-65632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FlduNR8UPWrYwggAu9opvQ
	(envelope-from <linux-media+bounces-65632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:42:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC146C5369
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:42:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=hDWdmlld;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65632-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65632-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 130353040691
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 11:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8605B3DCD92;
	Thu, 25 Jun 2026 11:41:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EE92FA0DF;
	Thu, 25 Jun 2026 11:41:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387718; cv=fail; b=ruYwdqHM4GdPMzWJT2eEbCP6fLHd03FOu5Z1UzamcZvC4y0EDeSOorrjs2Mce8kij2Xvnvjd/zjIIjorXSwzOz8TavxXBdfVpaYmxEqw5ImsEE8abfHlzk5gsufJPjdF5u78NOjxEnTAA+DW7cLom/sV1ZcAWs44Ulfk3ypgcmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387718; c=relaxed/simple;
	bh=RVz3C8e8VReoQzwgzUlBnRsmQZICvpH47y/iAO/aFwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ia/uNsQ7DrxEAYHUYjU+bPQfBXHpeM5dvMQSeNVCVZ+1ZL+H/qTz1nW6yQb9Kz57Xvc9sq42AAFHPdlTuNMpTDS3AsSDZ/ki3CDnwffr4OaPv+za6hJtR7q6e0QExHC2J8x5fmn+mzxDKOrRQIEYjV7wB3pP6l9F+uscInIMSXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hDWdmlld; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TA34OiKjGHKpZ6kKV/uew9+B5zg/swK/ytGCeq+SMwv84fj4DCw6OdwUFOyPMTcl0Mw1Mr8SJDThtkq367vCXQuGzwLZNuNsN4vfsChBgZV8yD8acqSb/LVwp7J6gyjk882p1gpYdnCnWTwDdlJvT/unoq5imim9ZpvHC0Mol5FUlt6YzWZuKhtvMuzejjy1bxCn0kUeLN4Qy0HmH3q4OUW5h+b3IrhqfgltppQYCVNv72hYxjDDNkmbjlSD5gXFYSZuThGuKfhE/djPST+c3dvHHW8nf9cgsGdPO9TIAHRjqZdWXPg5H20ajyOgtEWQcEqqvPoTY6u5/u22UQelgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTsWmzBeDG4lSr6tE85cXEc2udThmcWRStw2seQj9bY=;
 b=HmIPYAFhAzur5ZlGQSPJdQinZHaVyMym2XwOwFmWKBFTu7MKkWOTTxklKWtP6oDNke51nGPrCs71GWLZ8AcDR91iKftiSci42o4wnFsPkBGnUvyX8KS3EwvNGiWuTj5ddXd+5dqxlOjr5GMTSnFbA/QuBzLiiiO1sv521vQRJjBvE6Ojn1tp0yDhIksz75uGkmV9+xjZX6qDQaMn7Nbh8a/QD/utIOwSDuvrPGxwmR6VG1LMi/jts+sryE6DfBVSVySaM4ORRLaWaTt73TsyjujFxDj1MQyXEuqZQ+nAAzBi1EbEP1aC4/ozu32Z0mv9RGHHUaDUc/lTMkb0F32y9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTsWmzBeDG4lSr6tE85cXEc2udThmcWRStw2seQj9bY=;
 b=hDWdmlld4uTGr485JxhsizZrZZak8Twx/4bNrfoScyK6VZVjPvxwcRoQrk9QtRM4LvycZLHoIJAByMcp92gcLt51XXS5OV0DEq7SS34KhlFvYiBXCbdgouTX7KiDsHTBltDqesnpIC1ZCXyLXyegwvFeZl1bnoqgdh9JBfpcGiMCSdnIZwHmhNeASwoyFZs4nWOr0ugU/6tWGtSXBGvsWQA8vTECSPwt+SS45wQUM9IcKKG2Yel80Q+R20Yfv8+vi7mraq5uRte/LVuvLRlP5VxsB2wkuXLwDJ5p1BEgBhNg1A0h+zEREaeG0V/5899utzKeTlZFEjp6jyxNT4/T6g==
Received: from DU7P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::33)
 by VI0PR10MB9720.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:33c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Thu, 25 Jun
 2026 11:41:49 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::18) by DU7P191CA0019.outlook.office365.com
 (2603:10a6:10:54e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 11:41:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 11:41:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 13:45:59 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 13:41:45 +0200
Message-ID: <f51d5d21-54fb-444a-9ae9-9b60e7a500f1@foss.st.com>
Date: Thu, 25 Jun 2026 13:41:48 +0200
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
 <ajj90hhNwx7bLkOZ@zed>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <ajj90hhNwx7bLkOZ@zed>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|VI0PR10MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a48303d-14ca-4516-c358-08ded2aebd07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|7416014|1800799024|36860700016|13003099007|6133799003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TN9LZnsCgw7s+BenRMfx/yavf2XI/HZga0B1csr9dHJ404ySbc1OsAxVYKsSe+DMN5nlXZ4d/T7bwkrRxy0kFnQPpGPDKqoNsMu2HniZTj6yNysSOuhwsl10wR8SwdD1Rj7Fntpxur2iZpaQrSTcL7IR0dTY3o8BGdlqvbs1FKCsOTMYOsAWM3IbTe2WD+k7bklJxb2rkw/WJs8dlJZlgF8R5JxBwID9QlZyfGmDH6SGOP8vcZtwjUezpwYAsg50dmiBFsXSyc34BFm+lsiABScmx7u0fCWTiGEW3VV7GkQroAfGEUByA7kIpCcxx2xyczv86JXkdIFGKJpG1FmyM8BAvIqMnpi/nHVzsGXpDIi1w2UNyvcuBU7q2PbOJQ+/iRmmY7+RlDt4wAmqnN5ME+7mCoTI9tnX9ySAATO0zxD0sk+CkZzyyKZD7UTIDJnlmsev9YgZ65yWN5bKW/ePUwB6+rTxCamE9Og0L8syoqmp7diAlAiFfThZlL/GEvLzVo/B6nIbVlFfS2/eosEnfJ/PZawDT9V6YWGfiPD1EnscKYUslTzaPepK/0x3fr0Wx9EBb9tMFnBebVn2vmmnbSDU0ZTzS8cYuGm6KglU9CyI3BKvHnuVrb5a7q7HXes30QlJKCGMzY9Pc9nt0VVccQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(7416014)(1800799024)(36860700016)(13003099007)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LuiS++/fMN/vksSl290b716i+Z9SRVfY/nkD6NENZLEfzNECpbruS5mFr78PvfmZJP7uAOfxQh5Tz3smOVZxdmBF5ASQpmhDpAc9RbysiyoI1wkHsbtvy+226iUQkSd/wd4ocSg1phVKuCbiM8hXP7zIu17AnWLcg+5ng9lSnHxVkaHZT6vKhNnbt+9p4FBfr8t4G4Oskfldv5I1kFy8gaXY852pP4OHCehqt7QAjigta0hHIYb7aQ6UfzJNuKW9AJeK011UIRycq4o4vDUmQyRdAOCNPtbczGC69CU5RvRJOInE5Vd/+Ny24u9qRXxun6sccenFOAK8QkCpGtfy4QYiArtYBIk+AcSJUIYN1crZI64JfickfZjSLolsorAk7GLz5Q28t5x6ttk6lXy/qbKYyE+jpvOCR/fYtUZwkfPG5RHwc2XGKtDbzI1CKwnQ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 11:41:46.9524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a48303d-14ca-4516-c358-08ded2aebd07
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9720
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65632-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime,st.com:email];
	FORGED_SENDER(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:sylvain.petinot@foss.st.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DC146C5369

Hi Jacopo,

Thank you for your review.

Le 22/06/2026 à 11:28, Jacopo Mondi a écrit :
> Hi Benjamin
> 
> On Tue, Apr 28, 2026 at 10:40:55AM +0200, Benjamin Mugnier wrote:
>> In the driver initialization, the index of the default media bus code
>> from the supported media bus code array is passed directly to the
>> vd55g1_get_fmt_code() function instead of the proper media bus code.
>>
>> This works correctly as a proper media bus code is set after
>> initialization but could not have been the case. This also resulted in
>> mutliple "Unsupported mbus format" error messages.
>>
>> Retrieve the media bus code from the media bus code array, and pass this
>> media bus code to vd55g1_get_fmt_code() instead of the code index.
>>
>> Rename VD55G1_MBUS_CODE_DEF to VD55G1_MBUS_CODE_IDX_DEF and
>> VD55G1_MODE_DEF to VD55G1_MODE_IDX_DEF while at it to avoid future
>> confusions. Display the guilty error code in warning message.
>>
>> Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")
>>
> You should cc stable for fixes
> 
> Cc: stable@vger.kernel.org
> 

We talked about this very recently and somehow I still forgot.

> 
> The CI should have flagged that, but for some reason it didn't run
> properly on your series
> https://gitlab.freedesktop.org/linux-media/users/patchwork/-/pipelines/1655147
> 
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  drivers/media/i2c/vd55g1.c | 17 +++++++++++------
>>  1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
>> index 78d18c028154..1e9db21322e3 100644
>> --- a/drivers/media/i2c/vd55g1.c
>> +++ b/drivers/media/i2c/vd55g1.c
>> @@ -114,9 +114,9 @@
>>
>>  #define VD55G1_WIDTH					804
>>  #define VD55G1_HEIGHT					704
>> -#define VD55G1_MODE_DEF					0
>> +#define VD55G1_MODE_IDX_DEF				0
>>  #define VD55G1_NB_GPIOS					4
>> -#define VD55G1_MBUS_CODE_DEF				0
>> +#define VD55G1_MBUS_CODE_IDX_DEF			0
>>  #define VD55G1_DGAIN_DEF				256
>>  #define VD55G1_AGAIN_DEF				19
>>  #define VD55G1_EXPO_MAX_TERM				64
>> @@ -634,7 +634,7 @@ static u32 vd55g1_get_fmt_code(struct vd55g1 *sensor, u32 code)
> 
> Unrelated, but it seems you now have 2 codes for MONO. Does
> 
> 	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
> 		return code;
> 
> need an update ?>

Not in this patch because it does not add the new MONO sensor, but in
4/5 I separated the model ID from the color code. Example for the vd55g4 :

  .name  = "vd55g4",
  .id    = VD55G1_MODEL_ID_3,
  .color = VD55G1_COLOR_VERSION_MONO,

So the patch 4/5 updates the previous 'if' you mentioned to check the
color member instead of the model :

  if (sensor->version->color != VD55G1_COLOR_VERSION_BAYER)

Which IMO is a good way to handle this problematic. Tell me if you're
thinking about something else.

>>  				goto adapt_bayer_pattern;
>>  		}
>>  	}
>> -	dev_warn(sensor->dev, "Unsupported mbus format\n");
>> +	dev_warn(sensor->dev, "Unsupported mbus format: 0x%x\n", code);
>>
>>  	return code;
>>
>> @@ -1347,6 +1347,7 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>>  {
>>  	struct vd55g1 *sensor = to_vd55g1(sd);
>>  	struct v4l2_subdev_format fmt = { 0 };
>> +	int code;
>>  	struct v4l2_subdev_route routes[] = {
>>  		{ .flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE }
>>  	};
>> @@ -1361,9 +1362,13 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>>  	if (ret)
>>  		return ret;
>>
>> -	vd55g1_update_pad_fmt(sensor, &vd55g1_supported_modes[VD55G1_MODE_DEF],
>> -			      vd55g1_get_fmt_code(sensor, VD55G1_MBUS_CODE_DEF),
>> -			      &fmt.format);
>> +	if (sensor->id == VD55G1_MODEL_ID_VD55G1)
>> +		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
>> +	else
>> +		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
> 
> Being this a multi-dimensional array, I don't seem much value in
> defining VD55G1_MBUS_CODE_IDX_DEF if this is the only place where it
> is used. What's the meaning of VD55G1_MBUS_CODE_IDX_DEF for
> vd55g1_mbus_formats_bayer ? Does it represent the bitwidth or does it
> represent the bayer pattern ?

For vd55g1_mbus_formats_bayer, the first dimension of the array is the
bitwidth, and the second one is the bayer pattern.

> 
> I would rather define a
> VD55G1_DEF_MBUS_CODE_MONO       MEDIA_BUS_FMT_Y8_1X8
> VD55G1_DEF_MBUS_CODE_BAYER      MEDIA_BUS_FMT_SRGGB8_1X8
> 
> Or maybe do
> 
> 		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF]
>                                                 [VD55G1_MBUS_CODE_IDX_DEF];
> 
> if easier.
> 
> I understand it's a minor, so up to you.

As you mentioned it's only used here. I won't mind removing
VD55G1_MBUS_CODE_IDX_DEF entirely and do :

  code = vd55g1_mbus_formats_bayer[0][0];

Does that sound okay ?

> 
> 
> 
>> +	vd55g1_update_pad_fmt(sensor,
>> +			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
>> +			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
>>
>>  	return vd55g1_set_pad_fmt(sd, sd_state, &fmt);
>>  }
>>
>> --
>> 2.43.0
>>
>>

-- 
Regards,
Benjamin


