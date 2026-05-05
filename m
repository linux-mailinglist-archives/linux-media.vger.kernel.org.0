Return-Path: <linux-media+bounces-60467-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TDU3MVkg+mkyKAMAu9opvQ
	(envelope-from <linux-media+bounces-60467-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:52:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A1F4D1A95
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 18:52:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BA7B302EF70
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 16:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BBA3EAC98;
	Tue,  5 May 2026 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jt579J7x"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82FF492519;
	Tue,  5 May 2026 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999780; cv=fail; b=A2lM9BN8lLdbIqveU+Vx9V5Tejqt1faWstLUibgNxXuIx658IQfkyx8OBj7KDF8sT0r/tq21rwF6dyG12eSoAZAI+SXFYaWjoGPzIWYJ/fB3j4pM/e7bfD2DbtDFfsDns0GxfnXEbBXSI4NVK00K2bGoFBfsZxIGJbJGNAhsgv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999780; c=relaxed/simple;
	bh=xGLUIMGqO0PzTWfQ5/pnhcAD1LfZat0KobW+wnDqBBg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SX321WgrYNX0G+om89Gt1fqbSYM+N7wgBhL5tTVba7CQqTbLzr9w3Jm8qoQVsmtqMMBARLpFuxcurE+4X7jOT3MQgZogeZsgT23EQgQSrmg1VE3icnIoqQ7OBXKCaWDvMzg6A8OeOU5vWtoltlDq0BX/3B20YtJMlizS6nPVBCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jt579J7x; arc=fail smtp.client-ip=52.101.69.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFbmabVa5hTId0eGpOlawDDwNdQsJLc0f7k8OWW+0ceNt6xj4Lv6l2JkvfuNDwdm/9vTaAqSw0ac4WeqSHrPnr5pVIv3qH2VOvYoIH9v8h7wJHUox5HwQEOPmHzO79xNHo6K39K343d3NCnVlC6jwI4dHgzDek/TYyRqZ+4qg0gBm2T15xR1XVRI8Tf6cvPitcNzI9+KUr9q6r4ARNOOQSpDkIZxQjXJbvoLSoIfFY98w/sL6/QKDxM7lu/S7IIZiVT0FmkSTbddGFGKvB6WLT6di/zOc9YtA8HzKwMboUyh5ojnQtP1SOgw+c3G17pT+FMVuE6Urfc0cLuqd9dlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhZQrei/0zvC5XP3aRb8Q/vC6aqqqNSAMYswf3zCjN4=;
 b=LBQ0J39w2/P6Z+LMbhKbkcngf/Mtj8830ZfM2MuHkcszOamYNGH9jrgGTILIEAmHt+FOP5aDK4fWybX5oUhHMUF4oodV5LSnQXnkUxqE37BBv3lFalcU84Wtua54f5DVXYro5wwZb4cEim4Y4Y9DJruy/Cn4DEGst/XdruzbPoANJpS6N4XHHXpgAOP6aA04DYj4wPwF4K6MtU791LEWiLtpZwaA7V/GnwqL71hoTB+3+wZsXLeoNESmQRTWmy2LheeHFGTcDbhVy4NDqPBPyfuU1M4kmSGkhifkz2xOye6QIv3hGGszo7b6pT2c/0bNZTTl+UFP82OB7n7OTJ6c7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhZQrei/0zvC5XP3aRb8Q/vC6aqqqNSAMYswf3zCjN4=;
 b=Jt579J7xxIyAxxSrjW1oAud1uAh2SHLfeAVZB5aA+gmocJud897qlukd3HBde9yCv6qAuZrZpl8kE+MIkqIp87kXkDW7SdAxLYF67lAEhchwgFHULeXUcFI43fteagEHB5RpjO3UM6yQduzbPG/98LEwkok6eJQybZd4CEfMCK6ograqyeGWB9ZdvYDaiwNo5XgSqk6RybVUVtxH1pn1GOt2TDDKpyA7lHc9Fv8ySpOVx+K6e4rYqHcbLlHlW/S+EBABRK44huj3hw+uInxDLSKoecEzGanCxja143cKIQOxDnZ5PKBi7QD/SUMitnO197qg+cX3HATC5X2GYzzMKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM7PR04MB6839.eurprd04.prod.outlook.com
 (2603:10a6:20b:103::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:49:32 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 16:49:32 +0000
Message-ID: <777ea8b5-b00a-40e0-b649-59324ff0188a@nxp.com>
Date: Tue, 5 May 2026 18:49:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: v4l2-isp: Add support for extensible
 statistics
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AM7PR04MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: d51c6d07-a076-4182-d668-08deaac647fe
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 qIKWbo8Dx7UYo83JpKUWlVZeE/OiUE9oDfHsD0YsGV89+axS6dL8dTL7Q401qgnN0Ldc99LzMSZ8Ms0VXv7qtaMKAxTqle6rDdrvjsXwscA8sDkFyOExLvg1ue8hz5oxxMZGweaKmz8jMlA53XxOXzWQhxkSdqhbCInEFUqWkgQWi9vuYisLWveEAcUDRpfzXbKuHmRoC2RUuBlpJwfg6+lo4cM3amSivUUeR3BRjmr9aEGi5hO5PMPhWBQbi+OnkYJ9q9ACV3YRGTlsi73usJ9a3tYYFV096FupnCjhNSkSNfhMIiJ8QWsmPAZaBW/o2YbVcCW9NzHKuCz6rx3F+1vmFBRF1Mb4qGnCvHwIgvwZaSBGRiRuYh/by8a5pBhTfTiGAsJ7vu/EjsMsvecW/icEVSlS9+QqcradamTF/3BJbYRP1S+XNBV6bJfwTU26WvKyrQU/8QfECLGuLT8139V/DXv1M9jUxNpks7M0sH/iZKnKBOxUSkEuip175BzJLQbBLh/LHX6Ict7Y+Gq2PVZXe+gDOYex3Mx+l7wmh9IPWufpgbM07KZX26DuoNDfnmkMiNHmGMZO9n3pi421u0G3ahLOSvwuiJIqA2yAFzhhTkxeZ6RjSxbjx/g9h6Tdzzvh99anim8CMZSzC6ahtg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZVpZeWlpL0tKaG5uU1FVQ2daMjRFZmkzMzllbzcreTBZTDVRYW5TTS8vTm5z?=
 =?utf-8?B?RFlVZFdSeHpwQUY2Mm8zd3ZTWU5IUzN0SE9OYWVsYlk1OXhXcWpNUWVlK2dQ?=
 =?utf-8?B?RURpRStMeS9QTVYyOCtqS0pjaHJZaHQ0YUJ1endzenl2Ky9MQm9tc3E4OTFo?=
 =?utf-8?B?dS9DNm1FRmFDSVNEOWJXLzR5dTJJamhvYnZObjFYRnd5dEd6eklvMmFpU3p0?=
 =?utf-8?B?VzNnekNSTEJGV3lOT1pzMzFzSTlrK2JKK3pLTVJsakFYMzlhSzlveDFLcUE3?=
 =?utf-8?B?Ni9TYm8ydnRWYTdWMzNXVVUraDdLNGs4eTFMQVFTWVdQU3hLT0Z2d3ZVTzZr?=
 =?utf-8?B?ZGQvcHphL2Q3NEZnTlRIWlpnTmc2QklPVzd6TldWb0tualozeUFPbkl1cm9l?=
 =?utf-8?B?WWNrbnhBY3BqREgzRkFKUWVodmo3SnAwZkhGd29PRUpsRWxwZVBUaDh4eUJr?=
 =?utf-8?B?RStGQ0pWbUMvMkJaaisvdWY4UWEyK2ZRaWs1WUJXTm91RkZaY04rekJHeU10?=
 =?utf-8?B?b2xxeUdUZjlUSkpnNkZQUDhiMzlycDFRTW5SVi9JTFU0T0tvczVkZUZ4aFMx?=
 =?utf-8?B?WmRsRUVDaDdQYkZEcll5WHJDelI1VHlRazRCa2lKaTZtWkw1Q0pZK2hCZnA1?=
 =?utf-8?B?QWo5OVppa1dZam5qYmRad0ZTMWJZSy94R0JpUlIwMndmT1J4RDJPOFk5YTJ2?=
 =?utf-8?B?ZTJWcXZTS0JkaStkZUNpeUV1aHc5S29tc29TbTJST0Rsd1Z4QVdkQTlEb3FP?=
 =?utf-8?B?cDQwejBvWElJR3VzMkg3dXFzdzNBc1JuZGpRRGVBZ3F2UGxnVVpDWXZoQUFz?=
 =?utf-8?B?MFhmUnF1QytyU201M005WUxlbWsrN0o3R3Jna3oxT2RVRVZBVDVBQTNmVXdY?=
 =?utf-8?B?cDFYTzgrNTBMeFVkZnRaWTZtU1lZamFvM0YyK0V4QTQ2OTlCaDhRYXltL2VC?=
 =?utf-8?B?VGVXOXJrSjZ0ei9vSldyemRyak1iMldLakZ3V2FKbm9HUEgzOE4wbndZRlNk?=
 =?utf-8?B?bzZNMENFcTRNRTBDM3U5NGdXRndBbDQ3QVFlOEtOS2xzK1VFbVA2VGl6bmpr?=
 =?utf-8?B?Q1BFdExyTGFXZUVSRE8vdEZHZXlKOW5KQThudlhEcFJmOVBMNkpKR1JDTzBi?=
 =?utf-8?B?RzgzMXB3ZFFULy9VZlJFWTVLMTgycEVqdnpBdFB3NmNnSTVuZmdmRG95dlJ6?=
 =?utf-8?B?cjRQSlpJOFBqNzF0c2tsSi9nczNmM1pqZDN0MUd1RFJrMy9GNFdYQnZYR3px?=
 =?utf-8?B?UUI2SkFwZ21Fb0ZKR1Jocy8yS3B5R3A1UE1lU1RMMG1TMUtWalpqYjhxTlhU?=
 =?utf-8?B?SjR5TXNyc3AvTTgvbzNpR1h3UXB4aThTQlE2TlNqa3ZCK0s2dDZkejV4aUhD?=
 =?utf-8?B?eEg2ZGhQeS9XQlZkQy9RcVhNZ01iUFR6ZjZoTExPb1NMYUNYYm5WYlBYVzlG?=
 =?utf-8?B?SUhKRXpxRUd3T3RidmlIRjNoNlZ2RG4yODdnR0k2RzlFeWV4S0gxVG5nVTBU?=
 =?utf-8?B?dVNGUEFvdTc0OXgwcklXbWE4eXJaTUVUZjN0bjg3UzVqclRiQ3Q2blFsamJR?=
 =?utf-8?B?QWVVSkdTKytkN1lldDRCR0QxM2ZrbzRaZEw3MUVQdno5RHhLTXJYckJ6UDNW?=
 =?utf-8?B?Z3pjSlIvYXQvR0xPeWZaYlVnbkhZZGlFaDA4OEhoUzl6QXAwbCtVakcwUGlj?=
 =?utf-8?B?a2xFei8yMW9sRFpmQ0V4MkVOWU5aWmxDQkxqdnFSVTZ2dkJiZUlSNE8xK2Ny?=
 =?utf-8?B?ZWxiZ2VzQWRJSnlDUVFvaEhQcjFqUWNmVUJqdUJZMi9wVDhWWnVhdVRRMEFz?=
 =?utf-8?B?SjhTYmIvZmZ5ZTB2dFV6TUpHeWYwSWlLeDgrM0hXOHJlMkpMRHV3ZkhndXha?=
 =?utf-8?B?YllIRklaOHdpUVRyV3Jsa1FQVWV1R3N5Q1JJa2lpUFk2Q2lNU1Q5WU5kRGJE?=
 =?utf-8?B?MCtNTFl1RHdERFdYVDd5elBXL0Vrbm1nVEh4Q0ozamJTSXBNcUpzWG5mdWsx?=
 =?utf-8?B?cElvV1B4R1k3YjJ5K0xoRXBBODBSS3dpbGk5bHJCN3czYVBaYU5pYXh1Y3ZJ?=
 =?utf-8?B?eTVMSFJNWXd1NUtlVnZLOHZGbDBUWFFKMURPS2xHUzFLcnM5a0c5YmVXMlJi?=
 =?utf-8?B?ZFV3RlpvMGFCNTVoL2IxYnlETEFUVlRsaXJBaEs4ZzExbWV0UUJ3d2xxVitT?=
 =?utf-8?B?c01Fdkx0cC9YZGprd21JNitqaWZvK2NqK1pPK0JkbStITGcrbnB2Z3d4QmpG?=
 =?utf-8?B?T0plOXlwVFROMUNXaVJwT0p1M0R2aWtjWVUrblpmSURNLzhjVUlKd1JTbnFV?=
 =?utf-8?B?VElFdURmSHBQOFNtTXR5WHh1NDdUV1JZZExWdkFCa24wQXM5RTFhUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51c6d07-a076-4182-d668-08deaac647fe
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:49:32.3273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/Yu530tx5vG/l8dhRtKjBJ3FsYRrMJLRusi8IW5VvtbcuzF8BHeawpvVkVvPAhuzEs5JnsrtVGzb+JTsKEJFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6839
X-Rspamd-Queue-Id: 59A1F4D1A95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-60467-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,linuxtv.org:url,gitlab.freedesktop.org:url]

On 5/5/26 4:12 PM, Jacopo Mondi wrote:
> 
> 
> This series breaks out from Antonie's
> https://patchwork.linuxtv.org/project/linux-media/list/?series=24043
> the extensible stats support and adds a few more patches on top to:
> 
> - add support for per-block validation as suggested during the review of
>    Ricardo's
>    https://patchwork.linuxtv.org/project/linux-media/patch/20260504-smatch-7-1-v3-6-fda125c30058@chromium.org/
> 
> - add two helper functions to v4l2-isp to ease handling of extensible
>    statistics for drivers. An early user, based on a preliminary version
>    of the patches is available here as a reference:
>    https://patchwork.linuxtv.org/project/linux-media/list/?series=24703
> 
> Antonie: I took the liberty to fold in your patches changes to address
> my comments on your v1. I pushed an un-squased version of the patches
> here:
> https://gitlab.freedesktop.org/linux-media/users/jmondi/-/tree/b4/extensible-stats-unsquashed
> so you can easily get the diff from this and your version. Please feel
> free to comment on these as you're the original author.

Hi Jacopo

Thanks for the rework and the links. I'm fine with your [SQUASH] commits.

If there are no other comments, I assume I can reuse the common patches 
in my v2 then, and also apply the new helpers to neoisp driver changes. 
They look very useful (especially to prevent out-of-bounds crashes I 
observed when data_size was not set before filling stats :( ). I'll 
check in your user example.

BR
Antoine

> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
> Antoine Bouyer (2):
>        media: uapi: v4l2-isp: Add extensible statistics
>        media: Documentation: uapi: Update V4L2 ISP for extensible stats
> 
> Jacopo Mondi (4):
>        media: v4l2-isp: Rename v4l2_isp_params_buffer_size
>        media: v4l2-isp: Add per-block validation callback
>        media: amlogic-c3: Implement per-block validation
>        media: v4l2-isp: Add helpers for stats buffer
> 
>   Documentation/userspace-api/media/v4l/v4l2-isp.rst |  45 ++++++--
>   .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  42 ++++++-
>   .../media/platform/arm/mali-c55/mali-c55-params.c  |  12 +-
>   drivers/media/v4l2-core/v4l2-isp.c                 |  56 +++++++++
>   include/media/v4l2-isp.h                           |  94 +++++++++++++---
>   include/uapi/linux/media/v4l2-isp.h                | 125 +++++++++++++--------
>   6 files changed, 294 insertions(+), 80 deletions(-)
> ---
> base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
> change-id: 20260504-extensible-stats-f2d6befcc1ce
> 
> Best regards,
> --
> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 


