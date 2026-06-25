Return-Path: <linux-media+bounces-65631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MiPiOBkUPWrXwggAu9opvQ
	(envelope-from <linux-media+bounces-65631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:42:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C956C5366
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 13:42:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=foss.st.com header.s=selector2 header.b=D34pGLpd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65631-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65631-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=foss.st.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9D183017F9D
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 11:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0850D3D7D8F;
	Thu, 25 Jun 2026 11:41:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AEA391827;
	Thu, 25 Jun 2026 11:41:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387717; cv=fail; b=Q7QZ5yzuO7uQLNm+EVH66PRUJmF76sf37AsnXSOkZOSjXqEBQacsTaL+9+MEUGXK5uR/d4wF+taMOhLdEeRKXEye0tt+TsJbRsPOkdSaxn8ndD93mLjuVkwOPVRtocUj4olx1J4Qw36WgbCxiMoPSF73lyaAzw0y7cTjorRELFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387717; c=relaxed/simple;
	bh=IlcOFDVUOKehhdLzVaB/HnRc5o67PSiJ18Ug16CPS8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Nb31fsKcYah2ptGEZQR9jFJRlmTFfuxjabKymi+eTn5HDHDhr3Z6IgTHw9F1MzH9yf0sKcWFlqfz1oedFv1quDp0euVb8SRvhNNjNTK8sUDV/efQlbARtmF+HviC3DFr5/B6rw841Q3VkzMIaHdWL7dI2lFQBVfcdRFfsay1y60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=D34pGLpd; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+aGy/lkdg0aZDSnf6fqUZ8d99czAdQUZS9vJz4Y6AvPiz24bo772L6hgILEyWILtUhzPsnXT5W0xDSQru/HQCz30uK7kMnwNr5vqdiIQfj+hBvLPuRisMstYXzG9VJisjDBX6fNWykh6NDiU1HC5OCSH6sE3mLk4nZpO8agkCp6Y3815yfd2mzYA1BsL/D59dpZG4buQ14hzJdPFJBc8j8TT57BjXCTs3KofoG/cofoh8s7xtfFbSWwlY65NDvHiC8cs0Ws7Z+mvU97ieWWEupnwt22Ra66cLS+XYF+h4Y5VWqi69js6RzsNxrlnDR2dbWsOh2zdS7FkB045Lt45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uklSv63t8JIdZLl86FjXqH1kjfsoZAzkkYSYK28KqQM=;
 b=lvLAC3K5ADJeQf3VEkrlhGnj3+iPlaLOGZefETgj/eiqUD8YRdOlmofI73XXHY7FiaQsywstVMhIiHOg4ABTtf8pCTRFpOl3fhKMcevphTyNKhUMzmdD87+CBdaI0FRfaCu5neu2wslEt1FozwK6G9zNg6ydEY3XG5CPOOplbCHrxnvZxWRmfj4X8/D8o8OzZkw14JuEML0qv0OjJi5JMClSP24qJjjOvuJYtCAPSWnPCNpkPlckzvF0ypT4DquRClfv9/R6HEKhAVfGXONR6UPP3SjjWi0+nQzNPLDYxDk+Rl76ALcayfisQumzsBNuM4KJbutgyd1U7K3CxBuumQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uklSv63t8JIdZLl86FjXqH1kjfsoZAzkkYSYK28KqQM=;
 b=D34pGLpdttGzxS0FVBiPd+lgCbmSxKDCY7ls6EOBM8vAufHGd49Er2y73B29JJ+7MbTETRojpJAQNPcJGpmJJHCV0bZaf8I2NuABDSxoF8ke568lfwDdGoNrp0ML5Yj2s9weEAQoK2c0mH9Ui+SeTYne+a0IoORudnXXEZuXKfgzzh+mSbNubqnyAXr/8NiWgDZCRsONkbmlNGGkqnd8yt1ktf7AjZ7fsNJEKMEGl32QmaZrf9eP8Q7BqVmurUoBNQyCkfPhmLnqgV5E6g/rog7ndOPwkmkLVQZqNvWc82jBenjwNFTODOAGXisttOWSW+Av5ONV7RLHVxrnlCoefw==
Received: from DUZP191CA0063.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::7) by
 VI0PR10MB8401.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:21c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 11:41:52 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::ab) by DUZP191CA0063.outlook.office365.com
 (2603:10a6:10:4fa::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 11:41:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 11:41:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 13:46:31 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 13:41:50 +0200
Message-ID: <a4354168-50c2-474c-902f-fb11ab1aec9a@foss.st.com>
Date: Thu, 25 Jun 2026 13:41:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: i2c: vd55g1: Remove spurious pad format update
 on init_state()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20260428-vd55g4_and_fixes-v1-0-4f745a83b87e@foss.st.com>
 <20260428-vd55g4_and_fixes-v1-2-4f745a83b87e@foss.st.com>
 <ajkAdol1szOK_XPB@zed>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <ajkAdol1szOK_XPB@zed>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9B:EE_|VI0PR10MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 30719967-e922-445e-1446-08ded2aebfaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|7416014|1800799024|18002099003|22082099003|4143699003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Lh8X7VrU393+RybruZcxTbZSHJJd1+BJnwgciV/fcW7I9eJYFRyrhn6VvPQnS5dHfuba1f5DSyMkilfc/NsENpuxrVskmm87IU5ydG9XCUSi9uyeVzaIyK0/3v2jFgtW6lmh/S5gabAX2qXagOTkY5hct7NDqKD2cE8p7lH6sZaI4GrmLfQMoHoCQUJH+CEMp+dyq2m+Y1gqVta9G5LMWem1djeXMwGG4xbpmClZdghQwaGIqM8jrpSIdLoug6YK0WjO1Oz6ErzVcbv1l8a5zNrfWEhkDwltlieqz2sBFq3uKwUxBL2CuaVDHXQwQMJ1RiYmAM2JHeKRxWd7n5s6W0gnT+dtyIZ7lWIR9Qc924l4YgJHoYQtl+CI35JE+fwaLCfeugfb6Y5dCcKRSn3CvlFbypMhcwCPnjaKpEDWPx4nx7m6uPB43Ibe4IuQvCsirhPE75pxf3G3fADPe1k/ofYGzxNKocwpgQ2vrK8Ek0zj9kj4XyIfvFU/GuHbOwNn79na7YA/08NBr9zAhk9cCZNpMwEpzDK3QemEpXlC0jOr6gc0a0f+XWO+mtCSEC84+RkaIV0r1Iy13EyIjAnItOEu/KAK4bRgPOwDqNv7BZ1hTR1jg6njMmIVgtsLoMLpTkq3Zf3tA8JIRZDcrcqAKjrYM9uAOHGf3itMbShQiPnlG6n0w9FlX7pNT5b8Q5Jx37MP6P1dtMqxyWIZP0l07g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(7416014)(1800799024)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zx3fFitofC3febMvELCLloZdVeB84RvA2hjCz54HAVIy8ecGBxm7heuyGl0AF2wjrPKP3mYgKZbUEiCgZd5Ejrwau0SreKEt9ORhMm72HF+32hOSF6KaoMx5/cjY9USUBLGowVIU+4FC9C/efVDP5ACNuFpEcIWTZLdMcISrXTCHxf7hDpwPZFHtQBbaSQZAQRZYuGTSLcZ+XMawXhuyP0Hgbt9QqSqWprI4phDJLeZmCF1H4+tqHaODr2rEEt+6BoSBiGkQsVVsCLIarfuOSwXUO4hJsotm0yAu4+upZd55ud7eDWsjy2N92KrJjjsk4bdCiI5ip7aGsROROkfyB5a4YWe+JEkkzUbbQlciuaKK/xHpLoISndxj0v+QtHNnUwJE1C9/+DOtPp4VDPYKbPIQKleVNaJ6jhq23u4DaBML0K6vVnA+LyyzpOBjL5j0
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 11:41:51.3800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30719967-e922-445e-1446-08ded2aebfaa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8401
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
	TAGGED_FROM(0.00)[bounces-65631-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,foss.st.com:dkim,foss.st.com:mid,foss.st.com:from_mime,st.com:email];
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
X-Rspamd-Queue-Id: 55C956C5366

Hi Jacopo,

Le 22/06/2026 à 11:30, Jacopo Mondi a écrit :
> Hi Benjamin
> 
> On Tue, Apr 28, 2026 at 10:40:56AM +0200, Benjamin Mugnier wrote:
>> vd55g1_update_pad_fmt() is called in vd55g1_init_state(). But
>> vd55g1_set_pad_fmt(), called at the end of vd55g1_init_state(), also
>> calls vd55g1_update_pad_fmt() itself.
>>
>> Enhance readability and clear confusion by only preparing the format in
>> vd55g1_init_state() and let vd55g1_set_pad_fmt() update it instead,
>> effectively calling it only 1 time instead of 2.
>>
>> Fixes: e138e7f00042 ("media: i2c: vd55g1: Add support for vd65g4 RGB variant")
> 
> Does this qualify as a fix ?

That's a good question, indeed this patch does not correct any 'bug' per
se. It's more of a code flow error so I think you're correct. I'm fine
with removing the 'Fixes:' tag.

> 
> I think you could maybe squash it with the previous one if you want
> also this change to be backported as part of a larger fix
> 

I don't know, this patch solves another issue than the previous patch
does. I'd like to keep it this in the git history if you don't mind.

>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>    j
> 
>> ---
>>  drivers/media/i2c/vd55g1.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
>> index 1e9db21322e3..e44174056ace 100644
>> --- a/drivers/media/i2c/vd55g1.c
>> +++ b/drivers/media/i2c/vd55g1.c
>> @@ -1366,9 +1366,9 @@ static int vd55g1_init_state(struct v4l2_subdev *sd,
>>  		code = vd55g1_mbus_formats_mono[VD55G1_MBUS_CODE_IDX_DEF];
>>  	else
>>  		code = vd55g1_mbus_formats_bayer[VD55G1_MBUS_CODE_IDX_DEF][0];
>> -	vd55g1_update_pad_fmt(sensor,
>> -			      &vd55g1_supported_modes[VD55G1_MODE_IDX_DEF],
>> -			      vd55g1_get_fmt_code(sensor, code), &fmt.format);
>> +	fmt.format.code = vd55g1_get_fmt_code(sensor, code);
>> +	fmt.format.width = vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].width;
>> +	fmt.format.height = vd55g1_supported_modes[VD55G1_MODE_IDX_DEF].height;
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


