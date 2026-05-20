Return-Path: <linux-media+bounces-62205-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPBiEpdaDWpuwQUAu9opvQ
	(envelope-from <linux-media+bounces-62205-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:54:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B21CA5887DE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3C6B30C8EBA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 06:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEA0355F2A;
	Wed, 20 May 2026 06:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dqYOIDNL"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51383352C4F;
	Wed, 20 May 2026 06:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259518; cv=fail; b=HDw41SRFK+0Ps+zbOZzAhtwdteYooXePkdWO3fGkgblTK0Uyp0X9dGnYDkk8wHh86HoTs+rPR1T+ej/is80JRU/E543MiFjW1UmDkRFzg/ELBumy8TQLmVEQUvF6jHWKC0anqIWp4mt16QKaDFlVQ+vTP8AqnImEmX+460ZzyrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259518; c=relaxed/simple;
	bh=GCnK3wLeTEor/0luUHc789qwRgnmsjbf/pn4tCvRUts=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PlucGUKs6XgMIqqOYX4wNH4P5YdQkq9Nz9S4l5QpAjJta+rmz2K4JgdCgSrihLe310QyMXRnHyiIcm/ta7NC2Sgfdico5KWHTlk5Fw0BhqTsXwn+8cfvTh4+CPn7zUq3Y5onynbvpd2dAaiUosaU1gVXUQ/zt8+zCG5vQfJDqkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dqYOIDNL; arc=fail smtp.client-ip=52.101.52.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9tHHU1T7YuR4ZFAgTEKd0AdP6DiggoWFEOcWpYcX8wnCVhoEzS4QwDiFb4r8yDZcUCjmJUAv7kYJfNyz1mgXO35UYtbfUwAEIPv9dq9N2cs7//aNqQbrArvDVRrM2fKwZTKNIQcOVPB8ZqeloGgrAU6TxcwFM9ENf6UT/LoDL9X6dm80cbWOfPjBRqo30J2XFUBWF82qPdDwHvypZSlLTQP3sxD6VaL4m954np5CefM0h4fjOPi5dhcgyW8HHVkK93JcABvDTClfGiIx3i/tK2q19fvASbQMPmJboGPWkfekdMTmVjdzn3gBQUyGsYopvS5bG3lruSDJ5p+NL2HvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ek+9LI2kkIxi3JU9Fyhtpa7jjLQdcsD5h7g+C4ibka8=;
 b=NibilxKysWtwSMHmfMiVmGiXCWqfEEt/J4MfjLo8qyoLRNE3noQCfuRlkG/5qpeeo1VpH5FpW2uAHFZ9o6yXpINxcnPGUoDZnKngQ/Rl+9soSupPptPBMq0ZHbYXKR5+ToM9GktlG3hOQ9/758XXOxciUTu90/46Cge1Azsjqbdu3kdds1pT4/wbvt8xhASoEspB3i1GLjBgBrxF7zq5PpHhwIzvsP0HfjQmgIfUeeLG3IRmUP/BsgIGnnI2H6QQSy377B/G/hHmVZOFTgFWrOXwqK0LJeZj45gGAJyGwGvQvuie49UlmP+1w1nKfdHhGvp4SLB5SGAaDEdO9+Jc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ek+9LI2kkIxi3JU9Fyhtpa7jjLQdcsD5h7g+C4ibka8=;
 b=dqYOIDNLYzsepc72Nkg7B76YKgJ1tBVoGrg7B8P3qZuuot6y6yoZanH2XtXinYP6cOrXQKx5LhnDYDEMwidAwgFPCMg89SEIK6vDXxqZlBzW77lKlg6lFO2jX7KN00RlW/qTkji9W+Z+aUvotwcwJL94MnY8xSOUBKyYKRZ/zgs=
Received: from MN2PR03CA0012.namprd03.prod.outlook.com (2603:10b6:208:23a::17)
 by DS0PR10MB7480.namprd10.prod.outlook.com (2603:10b6:8:165::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 06:45:13 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:23a:cafe::1a) by MN2PR03CA0012.outlook.office365.com
 (2603:10b6:208:23a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 06:45:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 06:45:11 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 01:44:41 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 01:44:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 01:44:41 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64K6iYYU1442535;
	Wed, 20 May 2026 01:44:35 -0500
Message-ID: <429ae839-6669-4e2f-afee-56d36b19f92d@ti.com>
Date: Wed, 20 May 2026 12:14:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/17] media: cadence: csi2rx: add get_frame_desc
 wrapper
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-10-r-donadkar@ti.com>
 <agxP_eCovgSpdYnZ@kekkonen.localdomain>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <agxP_eCovgSpdYnZ@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|DS0PR10MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: d7f0b2fc-6d6c-47f4-9a81-08deb63b5729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|56012099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7tS2Ylle2ax/EQGLRV+Q53bPdY0K4ysgxVeegXVGX3/bTZsjcIIH/CBIRv1IBtvP2bAPcHrYktBx8K1HUkhGR7eUUfOGJLBFUknX5v5XQg37MxX/qeM4IiXbgsM0K4amKNXX4N1mTKNnxpmjft5bGnF68eYfjbegIatN1i0hYZbl+hm8s+m0HmQ5H4xrzmkuKUkmcphJkWMtTYhodz8pbI18OHiINuQtRXKk2LZAJBja7QyhrUZ/RZyKsYIORgSmALAurAd04C/6wfJY4/XKZzqxlXucLEkNbi9WNXrUuUgBGv2TRHkXKgT5ZWMtv4BrKQESsk84UdqgQJ8HcvyKW3iZmCwH8u4o6jUGa5TOZgPvcCo5tfcywyxYtHxhg9J2lDhq4xsrLxthRiap3IPjnYJeiB6t8eijIBveb2gtvPvq2CxWOkvih/efee6NkyDXxkIo3QA6qbKbS7PCqMt1lkLx97RubzMOtYNA1AVMlzeXqVRkoDX11a1CoRrECQeeAjnOA4iz8k+uUVyEa8XeIl9FjAF0kX42pGvtvMUHk8Eu/wmmO7aLCP0bmeMIJ6dOm86+tG2OEyoV9KQE1G/0oq7LVh48huSZlJaGtxPBcE+rG9WLyIOcyXEf2urGnc+r9Jr/9/4Ai2Xwosj2xf2wxwG2FLyEztNKuFcQtjLsbXOwvmr3U5HHMm5BffKm23a/TZj4JPt/r8u6IfKi6vdWEzsJUXqa5Mve3UpNcN80OdE=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(56012099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BKfCPV7kXixLqJbmPPwH52dk4Chv8XaQ8dY3S6Z9lUlpE2kDPCylmbzIBSJRversBTPtfcBnP9JD1eYCjIltameG91IvzlLCqHtsNGKSBEPYwwj5enPr2Mh7hYehy84FFZgfCYb6xQWqpvMnFG8IT2e+9gVyZ6YuOloEq7O2Y2m5GVIyRqw5kJ9Kd/UgOWPs4+8ppatz1lr+HtR6l/KCv/57Hn2wZc0zuK77pZtGMSYFiHmi7Aco3pQgY+LLLkqIfppiKyjRLVqzb+FX+12dgT+7/ZmWtEIzy5IcGMxaGKd1+zgJ3UFvjkj81LPjaOGhPq4UHVIQqfF1IC5ZzC+ES3BsJyeH8jvMqSXTA89DfNW5PsEP3bxC6UjEtAKyJswe8/FOllRtJ6Um42JDPR7Gt3wu/ZaE6opRDi2lOnFsS65UMUATIuHQCBkApMHUIjoi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:45:11.3717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7f0b2fc-6d6c-47f4-9a81-08deb63b5729
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7480
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62205-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,starfivetech.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ti.com:email,ti.com:mid,ti.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B21CA5887DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 19/05/26 17:26, Sakari Ailus wrote:
> Hi Rishikesh,


Hi Sakari,

Thank you for the review !

>
> On Fri, Mar 13, 2026 at 02:36:53PM +0530, Rishikesh Donadkar wrote:
>> From: Pratyush Yadav <p.yadav@ti.com>
>>
>> J721E wrapper CSI2RX driver needs to get the frame descriptor from the
>> source to find out info about virtual channel. This driver itself does
>> not touch the routing or virtual channels in any way. So simply pass the
>> descriptor through from the source.
>>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 2b25314ba6ab0..52ca940acd7d0 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -229,6 +229,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
>>   	return NULL;
>>   }
>>   
>> +static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
>> +					     struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct media_pad *remote_pad;
>> +
>> +	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
>> +	if (!remote_pad) {
> media_entity_remote_source_pad_unique() returns an error code on error,
> never NULL.


Will fix the error handling


>
> Could you use you use v4l2_subdev_get_frame_desc_passthrough()


Yes, v4l2_subdev_get_frame_desc_passthrough() can be directly used as 
.get_frame_desc helper, but will need the 
csi2rx_get_frame_desc_from_source() in ([PATCH 11/17] media: cadence: 
csi2rx: add multistream support) as we used the VCs in the fd to 
configure the IP.


So, I will drop this patch and add csi2rx_get_frame_desc_from_source() 
with improved error handling in PATCH 11/17


Rishikesh

>
>> +		dev_err(csi2rx->dev, "No remote pad found for sink\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
>> +				remote_pad->index, fd);
>> +}
>> +
>>   static inline
>>   struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
>>   {
>> @@ -611,12 +626,21 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>>   }
>>   EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
>>   
>> +static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
>> +				 struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +
>> +	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
>> +}
>> +
>>   static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>>   	.enum_mbus_code	= csi2rx_enum_mbus_code,
>>   	.get_fmt	= v4l2_subdev_get_fmt,
>>   	.set_fmt	= csi2rx_set_fmt,
>>   	.enable_streams         = csi2rx_enable_streams,
>>   	.disable_streams        = csi2rx_disable_streams,
>> +	.get_frame_desc	= csi2rx_get_frame_desc,
>>   };
>>   
>>   static const struct v4l2_subdev_core_ops csi2rx_core_ops = {

