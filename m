Return-Path: <linux-media+bounces-60891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCAnN4SC/WlOfQAAu9opvQ
	(envelope-from <linux-media+bounces-60891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 08:28:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE34F2773
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 08:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 801503044F20
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 06:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B2936D9FA;
	Fri,  8 May 2026 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="VJbh2y6t"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022112.outbound.protection.outlook.com [40.107.75.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4F36E466;
	Fri,  8 May 2026 06:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221643; cv=fail; b=nysX724bkM30wQxBrWXeBqCyLOS0wK08ffUlBb8vIjpSQaEHFs73nVghWbTZlL/T/gcTDik3wKn6aZYLHLsQz3UUKVGkK1ViuaAA/d1otvxmNptAgWs/VDLiqChYe35ESHVYXzeDW6i7xqRmVFuFV69wYAbeHneOr92BG5SF3Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221643; c=relaxed/simple;
	bh=3Za7xtLVr6bE72LLs8N5NkM34XDRE5TyCrFQkbJ5yNo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U9AsAcGAyikpTiVzB12EScwu4Nmn8MlZ7VKsRnMDClZzgWe3FtgYpyx3y7JlcxiTerDhAK67sjB/Ir+lJljt3xrzM9XLSD0H85UOWZxVlCyqsXEKbGGuFoWqAz+WuO5Ln4pEvD7o2Jb3/3VF86ZZycFudp/mAZT1aYJL5/XTNbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=VJbh2y6t; arc=fail smtp.client-ip=40.107.75.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNr74y9tlOzDYcnax3A7VN/5WaOFt0LMf8au8az0gFJkcgohJQqmakr/LQ0hidz1wgtNB3YsfWrHhu/UfO0PBMbzs1P4TIJeBlxybnXzrDQPiqkKhuBDpbXzQ/OblYWzYb+UlyzyBs9NFhtjNnftUwyyotNTZRLxZj3dizhf4c9Do5dOVsXswvCXXrRV8IKeNcaOBLbJd0CuQeyYyvEr9/N9GA57r4X1esVf05745rmW3/YRgIjVvjIrrnSYosq00IdcHsM7gu2OnHvYtiJKC/ntHTiBQAJ/MTiKwiwsS22Cqz6pYHFz91daSGxh+7cGe2JkufV1arsUnXBxaS4/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qs4EArZEGTn4P2twmWNjso8LuMmTG2RoaDSHaTzbetY=;
 b=Zu8BY0zWbxKZm3+tfs3G/wOAxGme8u2JF03r6knOudRqmC+h3mjJAvg9b9YLUUcGilmjoCIidsh94GObSedZGokvCBsMMImTXvp+L4RAs1CXvTsz/OWwS8AhisWVoRf8G7keTqCdKmig4N6bgsT6SDBC9oLwgufU6F/xmNZ6EMZ7wDDwVYZYdBsZn/nj0gTxWFAwSncO1OiRWHaA5IWwELHagw/uq3h+W84qaOC9WI2/tSL5DNXVP1GRVtNJ26UJq542JClydsVr6y6fc/EB2b+uoJspYOgqpIYTKv1lX3x/QcdsYf2ApwCa64wpZF5/fJRUN1YU8WruUPfUC5uFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qs4EArZEGTn4P2twmWNjso8LuMmTG2RoaDSHaTzbetY=;
 b=VJbh2y6tZCAd+3iK1rH7YLBvsX4yVU3YmMthZLRZtMKBDNBXXqMrCn2DlbZhYJGQ03AT4mk2PzuzodZ1bF7wysCd1123kz5s+lgv0Ghh/NcNw4uuHMA+64FeLFsTcTI9GuinWXC9KC6FShXKit+ubHVGtJgWoMec2dyPFzQtHEGq8fOs1uHIRRPx5yqQblwX4rsGQfQ51tlCmlPE/sGQ7i3QCIcnRbU3FlSI4pxPcZtnWQEjXRh8s1N8QaOCWDAk1MNFB+7Ivpx8LbieIGF9icm6juN9mjQp3IqWQboN/XS4Z6OXF0UkPZbcJtIOx9+djkAJGl1yixquQHSiYdsbkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TY0PR03MB8298.apcprd03.prod.outlook.com (2603:1096:405:10::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.10; Fri, 8 May 2026
 06:27:06 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b%4]) with mapi id 15.20.9913.006; Fri, 8 May 2026
 06:27:06 +0000
Message-ID: <964aa668-89aa-4c97-b6e5-51c23cdae266@amlogic.com>
Date: Fri, 8 May 2026 14:27:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] media: amlogic-c3: Add validations for ae and awb
 config
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>,
 Jackson Lee <jackson.lee@chipsnmedia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yong Zhi <yong.zhi@intel.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, stable@vger.kernel.org
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
 <20260507-smatch-7-1-v4-6-cc195f142167@chromium.org>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <20260507-smatch-7-1-v4-6-cc195f142167@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TY0PR03MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c4ac25-c742-4f08-81d1-08deaccad34e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|22082099003|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	lnqDRQf2+ne5MDdWq7bVF+IEYUVKp0YqjpTYwWr9VuMgyFgtiPvB0jH5+G9JOxF3mXrRRqAlLI9eoZJ5lJy7T3OJcveWUIfnaCpOPsoXlLnApC1KL5B5GmshFUQHfmb60ELCLz34NJiut+oJREde4QK5hIcQbp0cjIqeULqUtsu0w820/so79g9lAOygpFyQXfbbE3y8JNERGDfb9AcO91aAwaVxwB3dvCA/17nuipVdpGqUeap+0pShJZqZbyNHwurm5QQ6BLPqTErNuIX5PQT1Icb2f8s3cLqsHtrGuUIsJcHWx9H4zSnse3U3K6XYXyAxdzjPxmf5951PnmTuJDwle9F2QW0a5u87rwF8yvAyGD8UdgBIoXEaJtPHr/U7pON/Uz/5H8BHWgyZlTYwfUpIqfjRdDcSNbm113kFSMZSSg3TVk6CVM+KfIsAWnox1vC0pLYuWf9uLDSNGS9+H0IkZXi8kOa2vOJfMAzhKJTcEB8CYtyMIXUXKuBoMuTdfYwWAnokYu7R0MNihjN8rioppJXpfUNwjPVoWsg5SF/VIcFI/TE44FfJwMz49yDscXXLt9c23sEVn+9VJS5foS8YUhkqDON/6vMDnJLf3bGOnnASJy1bXW6lQ8ebE26QldLg062nVoopjfZvX21XOzl0ebRqIzgi9FWbJPJ79FCQ0WekLo+HZxn0vM4kwENwYBpCraS7pFVetAcuxbG3NTAzo1dkrlGw5zqfxKHhiT19GxYBIm/2JRcVxLHJH4cR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVVUamlld2trOHFvZWoxaWJrdFAvQmhxMWFjOUljV0pERUIzQmh0U1U5UnhX?=
 =?utf-8?B?UDI3MnlrdXM3TTFROVhTMWFkQ2pGSzl5UVllL0VDanFWaHJGdHVDQWozaEJp?=
 =?utf-8?B?NnNrcUVmbFEzSWVOeWczVGJXaFBXZkErTTE3bENheEhPZ0p1RXBxQ0xwQVRK?=
 =?utf-8?B?SmJMT1UxTWF2Y2FuVklPUzJ3U3dYVlFIeXdyVDIwakNkUWVtNTB5bFpOZy9l?=
 =?utf-8?B?NTRCNy9YUlpDUW40MGVTY3JyS09tVFFBaVNaM21QLytiNExlVllpSW85UUR1?=
 =?utf-8?B?TEovVjhSQWZ5WUo4bUdaOFZPNnhKU1hrSnFLUkJtMUIyb2pneS84c2Q5WURn?=
 =?utf-8?B?N1VwaWFKSEJtWnFPNHdWTkNCZ2lva3JVZGY0U3QxVW5ycmxBanUycjdRNmhi?=
 =?utf-8?B?ci95dzMva3Zjbm1LdVdlUGE2OG5SaWhvUVg2UkFZUHhwaHpHYktLczBKVy93?=
 =?utf-8?B?clBBcEk0MGZ3UTljN04xc0lSU1JQWC9iNndOdld6ZFBFNHRSd1N3UXBqWVhm?=
 =?utf-8?B?dFd3c1FpdmJMa2RoSzhUUm1DNVkyLzV1NjFDNXZQVlFRM1FidWIwY3llQjIr?=
 =?utf-8?B?VlViUHlib3cwWlZCamUwZVNWa1ZlVURMRVJscnVpR284MUcyUDBESnVod1FI?=
 =?utf-8?B?VU5LS1g1N29rYzJoRkVhNVFXNVI1a0VYZDZheDZhb2RvcWU3L0gzTGlCSW1S?=
 =?utf-8?B?UklWS2JlR1lmVDEyckdQejJIRVlQYzd0V3JCYmpBNVNISG1FMm92Q2hkVU91?=
 =?utf-8?B?NDh5bytFcndRRnBwUVdEcUdSYVpCWDN3K0syWFRQY1BhSnJnTjg3S25zT2d0?=
 =?utf-8?B?VGR0OXU2b1UzeUZEVXc3M2luNWVhdHg5K2xxbHp6UHhUZ3JBRW1HSzhWRGps?=
 =?utf-8?B?THRRWit2dG40N1NRV1k5RFRKVkZWbTR4MHBxYUtFYmw1S1pIYm9CTURIdklV?=
 =?utf-8?B?cmJFclNxOWRiTFBYQ2R3a0JPUzY1YjU4WjFpRWZQbFhHV1BDcTdEdUhnZ1ZZ?=
 =?utf-8?B?MFdhMTZDSU03aFlLdTFhdFN5dngzWmlmYUF3UDZ5dm01aDFDS2lJajJsK1B6?=
 =?utf-8?B?MXFhb1hHd1dBTUE4cVJkSFVjU1IwWWhvdmN0ZldvVkJEdHpPbGpDcHprWFp3?=
 =?utf-8?B?SnNiUmd3VWZXT3RlcmQvWk1nV0FyYTRNbTNpRXlwSUtZVnZoMjUvNWRjamNj?=
 =?utf-8?B?M21IYjJuUDZGSnNRcTNVdmx1Wm9raDZoY1M2cGdrNXhQbUhqYlBBL2RiV2VB?=
 =?utf-8?B?N05nOXR6NTMxeFRXTTNEcXJmSUNXSm9UTTVpeEFOejNYQzk3RnBJMWI5RDlO?=
 =?utf-8?B?LzRaRlBmZFBBQVUvMFl1MjhhMTVZUFdKUUxQdEQ2V1ZOMHBBTVF2RGR6NFR6?=
 =?utf-8?B?RjJlajlhRlF5d1lWOExtc21KaGd4UEVoMVRyN2w4T1hyZk9pLzhYYUZIWHFP?=
 =?utf-8?B?ZDJnQis3b052SzByS1NOS0pTNC9FL0NCSGg1RkVrY04wMUpTWC9tNjY5ZmFk?=
 =?utf-8?B?eVpzRHpzd3NSbXpueEJGRmNOeWpLRWFUUGtpVSswMExhN2EwVW5LWmdGQ3do?=
 =?utf-8?B?ZlJ6d3dhZW9BTFFDRmdvRDZFNnNMayt1UWdFNnJ3Tm5ZSnA5V0FnOWV1UUVi?=
 =?utf-8?B?cHFZWmF0bWtMUzRlaUc5dXJYVDkvWjQyNkcvTENpbDlMU1l1cWFHZTVsZDdQ?=
 =?utf-8?B?MVcwd2ZyUTVGZVczbkVqa1YydDFSL3k3amVkbXdnbDNNSnM4L1piUVdCVkJP?=
 =?utf-8?B?TVRkTnVidU45djBCdHBEc2xQazRmbVR6RlQzMUFzVHNNSHZMNEdwVC9PWlJK?=
 =?utf-8?B?RWUvRmJwcUlxUWFvU2ZuSlNzenpEUERJZE5GL1lSUURFaW1SUkdCWFdBUnVq?=
 =?utf-8?B?T2hMSW8xMWxVVEJFMFpUaXIwOGxNREJ4MzlrTGFOa3BhMEJkS3gyemladnNH?=
 =?utf-8?B?YnZ1aVNYNk1yK1Q1VW9GdU85TWVJWFBHcGloZ0plaDcyc3cyQ2Jta2ZjQXNN?=
 =?utf-8?B?dHNSdzUvRVFkaGgrbXBERzI2eGMvc2NtVXJYZGxYRHVCZWZSV2VjMXRiOFJJ?=
 =?utf-8?B?RlZ3Q3BmTFNQRVNGK0JPTlZtUDlTczV6dXpWSEZkNGhmVWZmRDI1cUdESlA3?=
 =?utf-8?B?OVNKY2c0V0xKZVhUT3RHY1Z2UEdaUHY4VHVoaVJsRXg5S0RrNFY0RFJnVktm?=
 =?utf-8?B?N2dSVWgxMnpxaFZsSWRZZWhETTdkN1MwTXA5YThVcUVrc0xSWlAwUy9oTXZU?=
 =?utf-8?B?QkhOL2kvREtRVk16K0VzNDl3eTF5VEJEOE9LSHRhM0FxQXVEU3FJMHBBdjha?=
 =?utf-8?B?Y1JLaE9qdXczVm5sNmFHakR5OHBOVDgvK1RvN051dWM3dlppL3dMZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c4ac25-c742-4f08-81d1-08deaccad34e
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 06:27:06.3384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7hKma6MvBq3Y59Xuh2ucFs+DDwhKV1DpofYs1n7dmmQxf5Kn6rs4Mqg8b11h9E8NRKeUCWchMt7gzJSkyR4RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8298
X-Rspamd-Queue-Id: 3BEE34F2773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-60891-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[keke.li@amlogic.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,amlogic.com:email,amlogic.com:mid,amlogic.com:dkim,chromium.org:email]
X-Rspamd-Action: no action

Hi Ricardo

Thanks for your patches.

On 5/8/26 04:58, Ricardo Ribalda wrote:
> [ EXTERNAL EMAIL ]
>
> Avoid invalid memory access if the zones_num is bigger than
> zone_weight.
>
> This patch fixes the following smatch errors:
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
> drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
>
> Cc: stable@vger.kernel.org
> Fixes: fb2e135208f3 ("media: platform: Add C3 ISP driver")
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> index 6f9ca7a7dd88..aec3eed0e443 100644
> --- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> +++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
> @@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
>          c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
>
>          zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> +       if (zones_num > C3_ISP_AWB_MAX_ZONES)
> +               zones_num = C3_ISP_AWB_MAX_ZONES;
>
>          /* Need to write 8 weights at once */
>          for (i = 0; i < zones_num / 8; i++) {
> @@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
>          c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
>
>          zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
> +       if (zones_num > C3_ISP_AE_MAX_ZONES)
> +               zones_num = C3_ISP_AE_MAX_ZONES;
>
>          /* Need to write 8 weights at once */
>          for (i = 0; i < zones_num / 8; i++) {

These two if statements are acceptable.

Reviewed-by: Keke Li <keke.li@amlogic.com>


Thanks!

> --
> 2.54.0.563.g4f69b47b94-goog
>

