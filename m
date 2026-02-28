Return-Path: <linux-media+bounces-53830-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0H9dAjWtomln4wQAu9opvQ
	(envelope-from <linux-media+bounces-53830-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:54:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 653091C182D
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CDD130557D0
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 08:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D193ED109;
	Sat, 28 Feb 2026 08:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4T3z3gK0"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BEE3D7D96;
	Sat, 28 Feb 2026 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772268739; cv=fail; b=FTY9l6OtNOO2XEQoVKYvAKozv85ltfF+RomJaPdjxeE3jf5YRr3M+0BUXzM9TDEMxQguPTo+ZHJsFk97PRQ4sy0CU7BYd1VtTL55zZA+dTsc6U+Rf2zjv/jCKaYUO9As/T9AbwDm4To4FTC44tugIlJj98UPQAwsYRwA8Pg7oDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772268739; c=relaxed/simple;
	bh=qglTPIUR9HadvXSzw8URzACsnZfS1vJ//ZuyBbL3i7Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A+X6+Q50F7/+2zKNdYknPC8ahKeniv795XG58Ses4C0REX7FwqnpjlAqWmDSb8hk6heb37OOVWXXa+P9Davvij9ff3B7dzSl8O0tA/9FQgCHT4bjcBs5w33+pmhcCX8bbdIDxz7Myw25Cr3Rp1pm3+RoIZbdm3CSH+U2cuU/R38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4T3z3gK0; arc=fail smtp.client-ip=52.101.53.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jflZ1lPFRnmQR8lS9fzKmM+jbUlNdcibJOIiC8b/sjdkU9JgtyaMZCOSHRyEzgUsIW00mFoh3QObKBLbEwxfzU+p4SAnRwsSKOT60H++0NXqEhZ7WcK0EGzzdh7LWqEDqTMplMY3Bs3q0RhXNk1RbbRM68O+O6pcYgmDthappTl9x6kcaSUmbPWiyFpDycX+dxIdNs9LX1cWAfrNFTSI72QRGZ+8sQsHcGIbVrj12rSEVFuynphkhumH8NFj291zH7RE72sY6pPIDQJSY6aQPSxDc6qqyjlhDL8ztRNl3yGcEs+uhOIaIwT4bmCR+z21Tg4tArnw3qY6ggmCVERjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmsycvD5DTAuz166W5uu4JzkxXKrlc96/YZ1HnoCPDc=;
 b=OrxTINEr/1/+Nki2yRZ+8tFPuM+YyYArO830pNnqk7by/VrdOnEt88qBaUQxypagMlclk6o0jT0KWXwSMmIcQteeJWomXIkqiqK/F7sV4mCtYxMlByskMp6aDeknKaZSZ5DSvR3CtxCBjREDGofEk8NTHxuu22H9IO5K8TDZqYLmBt/LpSAIOnWWQB7pJIugJ+66lMjHc4/P3Ph92KNIv+RpBOrVnYaM0d7evDs8mBusnZi8QZimmcecflJuZdoMeHGZfKMeQC8GEWIdNimW3COPX0RxIMC9WhWVJIgoHTtJrm6GGlq9ilnJ/ebyaNmklCcEP+rKQ9Y0ShaTMhCqQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmsycvD5DTAuz166W5uu4JzkxXKrlc96/YZ1HnoCPDc=;
 b=4T3z3gK0RQ+RTzYWFrnl/KR6AULhKzJhO2mxGFKvhH0eC4DEF9Qi/Gj9dYueiy2U2T6IPlD1Ws8FDns/Sbz2QTuQXstF3+PHb3Nvo4/u5vzLcM3At3tmKQcBI6YiLnesDtpu6Whp7TUa7cAtA1ZchXAh4YZ8hLw1CXZx+iz3uKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by MN2PR12MB4047.namprd12.prod.outlook.com (2603:10b6:208:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Sat, 28 Feb
 2026 08:52:13 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 08:52:13 +0000
Message-ID: <a97eb423-1791-4097-9f7c-cde82a9ea2af@amd.com>
Date: Sat, 28 Feb 2026 16:52:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] media: platform: amd: Add isp4 fw and hw interface
To: Hans Anda <hansa@airmail.cc>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com
References: <20260212083426.216430-1-Bin.Du@amd.com>
 <20260212083426.216430-4-Bin.Du@amd.com>
 <4555b8c8f174b5953d5b24a3a101127f9858d910.camel@airmail.cc>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <4555b8c8f174b5953d5b24a3a101127f9858d910.camel@airmail.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0047.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::13) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|MN2PR12MB4047:EE_
X-MS-Office365-Filtering-Correlation-Id: acef0d3f-3d02-425b-e5f7-08de76a6aaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	p0HlsSlSQ0golQnlJtPaV4eaIySChJrrRV0a0PVAaL7NdNEjMelWK+GZuzeYUSro5CXMb0L30+vFx3xThUqEXGGjEnMVGqGrP6zqNbKpDRVQyVZOOsKLXFdHs4XBXKHBe0QmbEGKZitZY69JEHcVncOheX3MYwwc76mvomf1MeYGqtDaJcVjiSn1nDa8m9mDsjC70xUqTdlzuboB4wtoue3x6K2caFgk1ymVD682SCRinM/JlPY5Ou7G95FMAOrbcqOXJlbpHZY7yBYsVSujmBGd/NLCG/MhZoZ7cSBfXwEvVhXOOgI1mtAs5q/nneCOfySUL79kjEWUdmitB5cXnj59IXx5Z/JosYrTtDum7NZJwM++MO3bOMcUZOUCTkQYxABpCbWFZl7QScDes8gVZT31cJJpr4kLFhC/SAK//D5z6EKZtshs67HzcNFaAD2wSCi6MeqLK4wPxIhQDUbuntWAQiO0+1/R9KMQeobUj6LVYYUQNcS4VuViS+BSEgISAZ6rpE/BvaQI8DRMgVUg6mRcPJiaArw/VESOBfZVKSI+O6Y3jTh6+YpxVQAPjV94uXmavbSacyvo7K8onss7eELmNVv2cz19JX5jZspn4bmMMgWNDiAAQIXtH+D8UWTBTVaLNaU6lX71rfy5+IFuqFqA8fQ1t5vO6gHPTkeXWmeFvwBimj/mkG86rDKWGiYPV3LBXY2DPT353Qo6/P543NMN93VP90SsEyYstwZABnuLUDV3JJ5M7yyBgzYVnKgg9S0vYt1Inwa2JpZWUXDA6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnFyeEJ0TUJMY3N3SUlIU0RaNlhXYnBBQm5nSnlRTDM3K3lTRmV0QjVkVnk1?=
 =?utf-8?B?TVQwNWxVVEFJcHhoOTQ5bnplUDlEQjFzV09BNG02ejhBd3JCVE5YU3daa0Nj?=
 =?utf-8?B?UjNBYmMySnFJVEc1K1g2VHVTaUcrS3pKUUF3V0dWeWgwYTlPT0xZbzJ0azA0?=
 =?utf-8?B?NXp0WnlTWVFQZmkrUkplSmJaQlZDbjFFYzBQR1JnWFhqdndxNUsvN25Jby9w?=
 =?utf-8?B?anhrRDJ2YnFtM0NDM2FEL2JNRmVIaFoyUTNKRDhFY01sVCtvM3B4OGhYZ2k3?=
 =?utf-8?B?cFJKa1A3VG4xLzdoYTdVYVpGZnM4TGlWbVdJV2JKbWFwc3BwWDFkMXJRRG9x?=
 =?utf-8?B?ZW9JcURpVmlwcHg0MW1mRFVlQjAxcUVtc0xtQkJrVzI4dGFkMXlqWFdxZzN5?=
 =?utf-8?B?V3Myd2RUNEozOW55VlFkZEFMVTBHZk9BQTUvVzR3WWRFVEVUMWxpT09UQWZ0?=
 =?utf-8?B?UURHOS9YQ1RxbDdzZzNlSU90NGF5L0VYUFlnSWNWRUpXYnFZa1g0YlZjNitT?=
 =?utf-8?B?cjRUazd0d3BGaGI0OXFKaVRKTDl1bDRQNnd3V1pJMkFBMDFnY1kvTE9NcWVa?=
 =?utf-8?B?QXMyNWp2MFQzVnlyWmJDR1k5NE9VOUlsaWdpM0xhQUNVRHl6TTdraHFXZ2g0?=
 =?utf-8?B?QUprd012ak5jK0R6VXZJV1ZsTVdURFArK1NNTkluMWQzZXR4OVpFNnNORnJs?=
 =?utf-8?B?TlRWamI5MHdpYy9VM3VJS1hCUGVTM0tBTzFGaXRQVjdKU20wSkh4LzhXMXN5?=
 =?utf-8?B?UG9tZzZEL1NjQ2xKdFFvQjFoR3hOWkRDTW0yOGhPdjNkY0VyelRONFpXSWNy?=
 =?utf-8?B?SEl3cjNHSEJvNWdyT0tSOHJEdStjNmx5Tlp1K0dBaFBvVWtoZFNCYjdVL2xn?=
 =?utf-8?B?UEoxKy9oam5zWGNqSWxzN0FibU5rMkY1a1VjZnlDcUI2bzJxRW5TdkRqYmk1?=
 =?utf-8?B?MVhGajcxeUtSTzRTWjFybHRSWUR5ajhxZEpkN1BMeXBWaWthenROYmxpNTFo?=
 =?utf-8?B?UTZEaUwzQ05ERWljNGIxbmlPRStkMUQrR1JqZ0FTdHdoMlRVWUIzTnozNm5m?=
 =?utf-8?B?WU5YdVl0bnJ1K1lRM2pqeCtVRlcyMVNZSzNnRFAwWEFKTlpQcGpQMXFvTkZ3?=
 =?utf-8?B?NkxoUGlacnFsZlFoM2VmSjAzWnZ3YWJScXRVUVBBV0ZzQVdKRVZwai9tSlBH?=
 =?utf-8?B?S1BCSDJ2amhydmFteEZUYThySmZrMm91cXAxay9rRWhpZGRseDBPOTRpVE5o?=
 =?utf-8?B?YXZKTVQ4UDI2K3FYL2FSUnJKd3JDeXIyZ3ZUK2NGQ3JpbE5KSmxqYXFrUnlV?=
 =?utf-8?B?aSswOThLVjlGbXpjMCt6alZrOHZnQ0RtOXBFczNRRlJrZ3M0N3NudFJ4SmJS?=
 =?utf-8?B?KzlkSE85c1k5UlFBOGpPdVA2L21rUEpVRGFXd3lUWHYwSFBZVG5WQi81OHFU?=
 =?utf-8?B?Z1A1aVB3cmNnOWVLdkFQbjJYWmx5ZFZrME5pd1Zjd25XT1RlRkZYUWUyVDFO?=
 =?utf-8?B?SmYrSEs3bmczRVg5RHk0ZFFSVUJncTJQWVBKd1pnWVFOTkNudlRONlRiR1l4?=
 =?utf-8?B?MDVTVVRVWmZzTk9TcktKZjVaMW9KRXFrRzYrV1crNG9LOWJDMytlYTVoOW9I?=
 =?utf-8?B?THRMZ2JCejRNOWRCY3JZRXlodXlBTlVkZnc4TFpNY1ZkVjNoelJlRHdxRUEx?=
 =?utf-8?B?M0FJdVM3RW50Y0xYdU9pdEQ1TjRZUFlXTi9sVDBCaWgvc3Z5Y1VZcDF0K21q?=
 =?utf-8?B?YVZTZ1ZybERTbVVhdmkvWXNkejk1dlhMUVpGWHA2TUZFMFJ6OUVsMlhvRkda?=
 =?utf-8?B?S2UrUitSc1N5Rm1aZUNkeWlyRGp3TnVTQjlUeHFaSEd3QnBIS2x3Z3RvaUJY?=
 =?utf-8?B?R2ZOejZuS0ZkWVpJemRMb2p4d0k0NGltRGJFWk1IbFdiRzI2MHF4cGh0RDda?=
 =?utf-8?B?cm1SOXdHSGcxaitWdW00cUREMDVrVlRiSVhocFVxb1BTclVoR2xuZUJESDJT?=
 =?utf-8?B?Yk52N29jV0hWNDdscFBEenJPUDlPc1dWVW14bnpSN1J3RThOREpveDZhWGdm?=
 =?utf-8?B?c29uQzJJMUJMSDNNUFVXYng0ZFVVYWZBYzcwcENXVkhwZWJlYzRSbHZ2NlZt?=
 =?utf-8?B?ZzdOa0xGdFBWN3JwLzNWdml4bklGU0ppeHYvdHlqQ3pxTldIYmJPaUhCdDFX?=
 =?utf-8?B?ZHlJMm5mQTZJYWhEWXdZRkJIeFEvcWU3cEZTZzBhYUIxMzNKTzhtWkV0ZnVP?=
 =?utf-8?B?TGlSaUFzZ0wreFlyRzQ5MlVTRWZCZTNRZEZodUZqQ0o5SkQvWWVBVk5FM1Yz?=
 =?utf-8?Q?DuBAZEc89kUxX1Rkus?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acef0d3f-3d02-425b-e5f7-08de76a6aaae
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 08:52:13.5971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DUTvNfaMpQQzMgoFW9n7DTO5WwiUOBvsTuPLC5uLVxii8Wvd+glSLhCv3VUm/FbU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53830-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[airmail.cc,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bin.du@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 653091C182D
X-Rspamd-Action: no action

Thanks, Hans, for your comments.

On 2/24/2026 8:21 PM, Hans Anda wrote:
> Hi Bin,
> 
> I have just read your patch and have a minor issues and a few style suggestions.
> 
>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
>> called ccpu. The communication between ISP FW and driver is using commands
>> and response messages sent through the ring buffer. Command buffers support
>> either global setting that is not specific to the steam and support stream
> 
> One last typo of steam -> stream
> 
> 

Thanks for catching that. Will correct it.

>> +/* [...]
>> + * @brief Host and Firmware command & response channel.
>> + *        Two types of command/response channel.
>> + *          Type Global Command has one command/response channel.
>> + *          Type Stream Command has one command/response channel.
>> + *-----------                                        ------------
>> + *|         |       ---------------------------      |          |
>> + *|         |  ---->|  Global Command         |----> |          |
>> + *|         |       ---------------------------      |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |       ---------------------------      |          |
>> + *|         |  ---->|   Stream Command        |----> |          |
>> + *|         |       ---------------------------      |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|  HOST   |                                        | Firmware |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |       --------------------------       |          |
>> + *|         |  <----|  Global Response       |<----  |          |
>> + *|         |       --------------------------       |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |       --------------------------       |          |
>> + *|         |  <----|  Stream Response       |<----  |          |
>> + *|         |       --------------------------       |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *-----------                                        ------------
>> + */
> 
> + *        Two types of command/response channel.
> + *          Type Global Command has one command/response channel.
> + *          Type Stream Command has one command/response channel.
> + *-----------                                        ------------
> + *|         |                                        |          |
> + *|         |       ---------------------------      |          |
> + *|         |  ---->|     Global Command      |----> |          |
> + *|         |       ---------------------------      |          |
> + *|         |       ---------------------------      |          |
> + *|         |  <----|     Global Response     |<---- |          |
> + *|         |       ---------------------------      |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|  HOST   |                                        | Firmware |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *|         |       ---------------------------      |          |
> + *|         |  ---->|     Stream Command      |----> |          |
> + *|         |       ---------------------------      |          |
> + *|         |       ---------------------------      |          |
> + *|         |  <----|     Stream Response     |<---- |          |
> + *|         |       ---------------------------      |          |
> + *|         |                                        |          |
> + *|         |                                        |          |
> + *-----------                                        ------------
> + */
> 
> This way the order of the text comment is structured the same as the visual
> comment. i made some adjustments for symmetry.  It's no error, it's a style
> suggestion.	
> 
> 

I think both are acceptable, my original order has been structured in 
accordance with the register definition from an engineering standpoint, 
all command registers first, then followed by all response registers.

>> +/*
>> + * @brief command ID format
>> + *        cmd_id is in the format of following type:
>> + *        type: indicate command type, global/stream commands.
>> + *        group: indicate the command group.
>> + *        id: A unique command identification in one type and group.
>> + *        |<-Bit31 ~ Bit24->|<-Bit23 ~ Bit16->|<-Bit15 ~ Bit0->|
>> + *        |      type       |      group      |       id       |
> 
> + *        id: A unique command identification in one type and group.
> + *        |<-Bit31~24->|<-Bit23~16->|<-  Bit15   ~   Bit0  ->|
> + *        |    type    |   group    |           id           |
> 
> So the width of the parts would co relate to the number of bits (8,8,16).
> Again, a suggestion
> 

Since this is about the bits layout, matching width with bit count isn't 
mandatory.

> + *        id: A unique command identification in one type and group.
> + *        |<-  Bit0   ~   Bit15  ->|<-Bit16~23->|<-Bit24~31->|
> + *        |           id           |   group    |    type    |
> + */
> 
> If there is no technical reason for numbering Right to Left you could flip it.
> Left to Right is simpler to read.
> I guess there is a technical reason for your way.
> 

I believe my original style is more common to describe bits layout, 
e.g., drivers/gpu/drm/imagination/pvr_device.h at line 466
It matches how:
- Humans read: left to right = most significant to least significant
- Hex values are written: 0x02010001, type=0x02, group=0x01, id=0x0001
- Register documentation from hardware vendors is formatted

>> +	/*
>> +	 * A check num for debug usage, host can set the buf_tags
>> +	 * to different number
> 
> +	 * to different numbers
> or
> +	 * to a different number
> 
> Both versions work grammatically.
> 
> 

Yes, will fix it.

>> + [...]
>> +};
>> +
>> +/* FW cmd ring buffer configuration */
> 
>> + [...]
>> +};
>> +
>> +/* FW resp ring buffer configuration */
>> +static struct isp4if_rb_config isp4if_resp_rb_config[ISP4IF_STREAM_ID_MAX] = {
>>   [...]
>> +/* FW log ring buffer configuration */
>> +static struct isp4if_rb_config isp4if_log_rb_config = {
>> +	.name = "LOG_RB",
>>
>> +
>> +	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
>> +	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
>> +
>> +	/* Read and write pointers are equal, indicating the ringbuf is empty
>> */
> 
>>   [...]
>> +	/*
>> +	 * Ignore one byte from the bytes free to prevent rd_ptr from equaling
>> +	 * wr_ptr when the ringbuf is full, because rd_ptr == wr_ptr is
>> +	 * supposed to indicate that the ringbuf is empty.
> 
> ringbuf -> ringbuffer or ring buffer, it's best to stick to one.
> just in case someone greps for. That is a suggestion as well.
> 

Yes, will change it to ring buffer.

> Good Work.
> I'm just getting to know c - That's why I only found grammar/ style issues.
> But maybe this way i will get into programming
> 

Welcome to this field.

> Greeting Hans

-- 
Regards,
Bin


