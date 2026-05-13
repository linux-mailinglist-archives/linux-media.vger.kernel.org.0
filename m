Return-Path: <linux-media+bounces-61323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNBjAzbOA2p6+wEAu9opvQ
	(envelope-from <linux-media+bounces-61323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 03:04:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6785B52BBB4
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 03:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC933308A699
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 01:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724533451DA;
	Wed, 13 May 2026 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Bi4QVdsz"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023089.outbound.protection.outlook.com [40.107.44.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6D233EAE6;
	Wed, 13 May 2026 01:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778634279; cv=fail; b=tjHkUXWDY0jUwdjOPj1+kbeFTOrh9vRVfPz1zgu9EJfU7+jSW5BujuDqM/wYr3fgbuzbPA5kiwSNwhNwRgkJE8OFSFOCnNVsVhaPI/N70jIujYd722sgtvNnP+OjqbbbiWJymG9/Hd9lgyyyJupiFAAVY4B55vaT0Z9djs8d29Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778634279; c=relaxed/simple;
	bh=7uBD+SKfu5b2BWR2hFje1LO2g6DqGdq79sxuLVvFJX0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bbOsQfcqVh/G6lo4UEaV3G1zbkH+ope2VaAp9KueA7NhIXIv/3Wnuo7TJ1r2q++fqfC1iiEOC3tEb2oGDxORzEL42zzu2E0FNlhA8ZgmeohFhykuAyFcbqPULNuZIDPbKvcvngwp5Vw07WCde+B3PvvVBxp4Fjbyrd7gAfDhFS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Bi4QVdsz; arc=fail smtp.client-ip=40.107.44.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nB3uKFLFd5OIj4xNfnL9uI8Ex9WQ7MWEfPS2ouagRybC+VRbuF44lZ7mv577osWn96yjhOYD5ke9WIlIcOX8kAQ6VeyZPBmS1lnI4sc4VsZgs4j+zfgJpd0+hzVsWd3ED8sGhFXa2fNmK3q2zgEgZGdzg/AFwZvGE0uN3UsCgDs6+0T2xZOkZe8Jwtctt19uJ5JdHpKNSLbAXss/naHfAxz+5S1mpMZdfpmyB/wA3QcjQHhMtuE2eDAv7EzPNhE9buYVqIHpfXF7JO1Qo2rzzDnBXHfFv7D0HxtJYf9SbGXs4OXpZS18Lgv4/CnoL3ocs4rgoa0xeYTnZMNR6RePBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPOp0hSYZUQqOeBTZ7MCBwNnIQtBFMvTcikx7xX32sU=;
 b=DZADi8bQB9cqbFdLZGf84tgGU+3NyC2Vfj7x17ItQHGivLmRvW4NiKCNfK6VKZJY0irgzT06N6Q0iFDyKnWfjiMY9ygcH7Ij55Na9zzzosF0afgXlrN6XHSAret/Eil6VdSfpALJaGJu8bJjj15MR9Y8y7uiy7HioKKfSLdeNbVH2lfngDf0eIcVjkLA62hJ+sBUAF/QYkoxj64eLOI2VIQqjtZlnlJh2+VBLV/I9fNj6ghhsXjWm4KTg4BZEDJ/h68oRRpcBLLzPV5gP9iHiyvuDHhQ/o72NZ3jjcDrT+RRalKhH5xV0wn12mUc/rrdFbG22apE90Y01Od4JMASNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPOp0hSYZUQqOeBTZ7MCBwNnIQtBFMvTcikx7xX32sU=;
 b=Bi4QVdszgo+8E06IWxu39SC011hKhBFHgV4+k1Z4kv2M3Rulcttd2bEpP1NUMbaLG3pc6n0XViKyuX10AtQ9M6QKP9XynCaHiJrN9XMfYR6VYEaVp7b9PFn8MwrKX0IJbQyIU3XrcZDeKMY5Nv5GTBuFCvxthIL1KfqesfInK4Pjrt74n4SYJU+NmdSMbqUu8Kz6Pt5N9nGl6Zs8cgQKYAjPEkovEGTAzIJ76RKUrkd8aJAtMLeLD1HVsNEkJx62WlxCbuiBSsgRWQFjPh5ECG1+OwmJgWOIkDHdz/3gDduG9Tg3e40d1qs+RLbfk0EvFlPiR4QONqhNzt/BHVsMKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB7132.apcprd03.prod.outlook.com (2603:1096:400:337::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.16; Wed, 13 May
 2026 01:04:31 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::bc0e:21e7:ef9e:e77b%4]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 01:04:31 +0000
Message-ID: <b97f4da9-7df7-4bfd-990e-28a23ec7a236@amlogic.com>
Date: Wed, 13 May 2026 09:04:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: v4l2-isp: Add support for extensible
 statistics
To: Antoine Bouyer <antoine.bouyer@nxp.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <777ea8b5-b00a-40e0-b649-59324ff0188a@nxp.com>
 <e1bb04b0-025a-44a6-91ab-edfa6edc1f64@nxp.com>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <e1bb04b0-025a-44a6-91ab-edfa6edc1f64@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a9846b-269a-4a23-adc4-08deb08b96c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|13003099007|56012099003|11063799003|4133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aNUVdTD3i5DVkFc7lTSo8e7OSASmIU0YoroSiKRjtSsW7ps0ejtim8K4B5/AZOCAjXHV+14SOobFH6KIIdLeoMvC8Kkwj5BqTOTCfIg+mo3sujWYEBaqYKeu6W87UgaCfYq/BLnDFTKSzYDA/LtRRGVslWbrziXB3sHTBkEQOmYSlYA81IP+cv0wRV4EypCRc2tPr+AkGdGOI80+/FEKfv28IUHH78y16hR0g862NSrOvjhvfm6/semLayU6AXMiY/84KU9fgfu1bnDsWEr2JuoWKReLL5Xv3NzV82iBpMNMOHUKh5GjDkC/HlZBdS7DXYQjr5caXqo2zH9D5K3CJEiX2oqxNGrbkMpurh38wVrx0NoplBlSDuD0cCybJqsex9Z/amU0NgxksCjam3KPKanCs8a3NDedbA4WSxabwXe2giIHjajRye2zWunN0EL03g6uBrcyJSZbIHKNyktoTFIoP8d+gIX+lOaUD5h8iCjcY86PBJYUT4AEZCOJwwC5gqh6Lw2Qcfcz/6AsqCRHSuDUgCoiSYjG3+fpwGAbus3K95imea2/3qT3TYcqiN9g/3mueuqm8+Q5pzgGDiNPSGsnI4HnR2vgYcL6w5ChYHOYv3ZBVa2FQIpMejsNgTrwzazleDWW/eEu45wSTbb6/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(13003099007)(56012099003)(11063799003)(4133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjB0Nlo0L1IyZ1RLQWhxeDBMMVdVbnhreTFyOGUxWTNkeXpWbFZIQkhueDFM?=
 =?utf-8?B?aC84SkpFS3NrQWQvUW5RTTM1UE9mWTNKNXhHeTZhVG9NdUFOOTd6Z004TEJ4?=
 =?utf-8?B?eUk1TzUwaEZjdUtZNTVocVVmQXpCeVcxNUdIRDhIK0RqdGhUbnlNUlhrRExL?=
 =?utf-8?B?Z2JWQmZyYXhXb3ZwbEZlMUZibjFHaW1pYkpCVDJHY0FlRjJIVElwK0lYMTd6?=
 =?utf-8?B?ejNsQXhNb3JMZFJ1cThxNTFvNlpldHRmbHoyektyQ3pzVVNFVGpjOFZDWTBj?=
 =?utf-8?B?TmV0YTlUTlNtdUtBVFVuL0hoNXF0QUFCMGE2aWFoWGtCQnhPZnltazhydDRs?=
 =?utf-8?B?c1hUWUdsUHAwcjFnTDRZbXZUeEpWZEJ0bEhsRFlZZStNRVIrek1ITUlJYjJJ?=
 =?utf-8?B?VFBLVE5wVVV3aEhtUDN4M0NMVGdqUmFqQURnNEJWVmlaUXozUlBodDdKQlRu?=
 =?utf-8?B?MExUcWZ1a1VBSU5zY2RaK1ZieWhibVBuMW02ZlBZZm4vbjJPWTBGMWs1UTdS?=
 =?utf-8?B?cTR5dkMvSlE4RWVXUVBQMTFpRjZDQzc2cm5kUVZDV0Y2Z3l1N0xMR2pWa3Qr?=
 =?utf-8?B?NFkvdXNKMFpMNktYRDJMVTB0cmYyTmN0QTZkRWd3elNRTWg1MHVJWlFsbEkr?=
 =?utf-8?B?L3p2YkxxSFBDZEYvTFR5RUVCeVl1cU92QS9CbDdaaUpUT3lJSDhiRXV4SXU4?=
 =?utf-8?B?SXFUcks2TTFHWCt2OWowRy9EaEJ5a3Q4UmdvL1lGU2doRXpnYkZqQzZqWjkx?=
 =?utf-8?B?WFZLRUVrYlRWM1pQSjZrUDdSNDdDcklPN3NYRlA0eEFjZmsvVVBTWUhpZFJG?=
 =?utf-8?B?cGJGZG1GbEdmTTZ1djZqTm90dXhmc1BLN09yV3dGcmo4TmtTSHgyY2gvK0pL?=
 =?utf-8?B?UHFXaFJFV3JlS2ZxcEJESENGak1UT1htTVZpR1E4c0Q3ZHhvcy9KaE85MTI4?=
 =?utf-8?B?WE9vMEE2TmFtZ3lIZEVLeWR0RTBtdEdEVlphcytuQVhXc3BCRm5veTVhMTQ3?=
 =?utf-8?B?Y0ROWnNtRVpaVFhEOXJNT01oOGViQjB2aU5aWDhMQ2dCaXpFUmZhVlVtTDM3?=
 =?utf-8?B?U0dlM0tCMlZuZ2Z6M3dpUmZLRkdiclpXeVdOWkdIbEZlYTJMZFhrM05VcTBm?=
 =?utf-8?B?VHpOMlZaSmVlSnZxcm9INjV3d1FkQm1JNW11TkRFZ3M1VEJiYlBKWVpxMUU5?=
 =?utf-8?B?RmQ5eXhpQWVWRXlkL1R5QUNqTFhaZERub2xaTU16akQvUzA1VXE4NmxUNVlO?=
 =?utf-8?B?WFBrTHlXMjMraWFlUEs4RUQvMm1zUTlIWTJaSUpjZUw5TTBtRTJGQVV0dXEw?=
 =?utf-8?B?ZThLVER2d291Vy8yTStFTjJ5NDlHRWhZenVOUTRrTlB0WW5nNTA4T1cxRTIy?=
 =?utf-8?B?RDk2Rm5GTi9PSThOd0s0anJaczU4ZWlSV21xRm02R0gveWJnUzB2WEFPVGJx?=
 =?utf-8?B?OGd4enltMVFJK2IzM3MvZ3d6VnFNS0dYZWFIajl0ZXhURVErYXpvejYzbjFv?=
 =?utf-8?B?VUU1aHhZbHo5Z0hMVHJYbHdYY3o0NmNGb0ZLNXVVM0pkRHdLMTRMOFp1SlRh?=
 =?utf-8?B?Z1ZXbmVPOEFxalpob0FKaEdBdUo5ekhOa2VTZ2ZTWWRsSFV4Sk1wOURCdkpw?=
 =?utf-8?B?enVmSzdhcXNEZk1LNGtPYlBXMEE0S0ZYd2gzK3JmNUorRnhSa0ExYWh0WFJa?=
 =?utf-8?B?ME9JYWl4ZHpnUko0K0MzakQxVzFYeWY5VjM5NTIvbTJxZXBSNVBYbFJiQUtq?=
 =?utf-8?B?Ti9kWTRRaFdJTlAwYjdJR0lJS2xDcnpSb1Y4TURDc3ZFQU1QSzJtZlZ2Tkxt?=
 =?utf-8?B?WDZQWTYxWjZvbmRGWFpsRExtU2JsLzRwSldHRGhQWUdZNTkzUUZhNG5kRUZy?=
 =?utf-8?B?RlJLbjIxVlNxUjBDbElOSVd2OXpmc2JMVWZ4ekV0ckUxV09hUVQ4N2tVNW1L?=
 =?utf-8?B?bVlFT3N0cDVPcXdlV08zNUNKWFh2NEVkNUxVb1FJWXgveEZlU0xZek4vM09K?=
 =?utf-8?B?SkdhYTdMT3FGb0JGdXhuSTNKTVpHWTZ3WUdDclN1aXhRYkZkMm5SVDlreXNN?=
 =?utf-8?B?SFRpOUdpWDRCNEhnNGJJYlI2WTRIOCtiNEZoTzlOR3pPNWo2RmNMKzQ1TXJq?=
 =?utf-8?B?Vnd4SzJoK1dubFcvMmlpLzh0VTdrdkRRa2tYc0xycjNQQThML1FRWWtDSGMz?=
 =?utf-8?B?WEdGRUtGdjJySHZsT1RvNHI2NHlKdE5xK0tTaVJwRk9GMHQ1a2x1NnN6d1Fz?=
 =?utf-8?B?a042Tk81aTJwei9iWVVNcDRZTWFuWUt3NmpNT05KSTdzY3V4NHdxS0NmVkUr?=
 =?utf-8?B?YXVRUHZiMHg5blFBc29IYzV0TE5hVVpURUxKSUhqd0ZZN25ieHNTdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a9846b-269a-4a23-adc4-08deb08b96c5
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 01:04:31.3729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsf8Xu+czh9oFipvgXrDhCsdwA0e7Vp9v2AejHUxkLfE14SyZcdJeo0n5N/EF/D4uhfXyRpcZgjJW2V1iByHkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7132
X-Rspamd-Queue-Id: 6785B52BBB4
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
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-61323-lists,linux-media=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On 5/12/26 17:26, Antoine Bouyer wrote:
> [ EXTERNAL EMAIL ]
>
> Le 05/05/2026 à 18:49, Antoine Bouyer a écrit :
>> On 5/5/26 4:12 PM, Jacopo Mondi wrote:
>>>
>>>
>>> This series breaks out from Antonie's
>>> https://eur01.safelinks.protection.outlook.com/?
>>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
>>> media%2Flist%2F%3Fseries%3D24043&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605732002%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=FXaz7QYQvS3s%2B4l9AFMrGgE7kmXlEil%2FKD6DibB0%2FJY%3D&reserved=0 
>>>
>>> the extensible stats support and adds a few more patches on top to:
>>>
>>> - add support for per-block validation as suggested during the 
>>> review of
>>>    Ricardo's
>>>    https://eur01.safelinks.protection.outlook.com/?
>>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
>>> media%2Fpatch%2F20260504-smatch-7-1-v3-6-
>>> fda125c30058%40chromium.org%2F&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605751612%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=AiRH8MhIbXt3dr%2B2r3I6STE6TJAChylnH%2Fz3tLdS36k%3D&reserved=0 
>>>
>>>
>>> - add two helper functions to v4l2-isp to ease handling of extensible
>>>    statistics for drivers. An early user, based on a preliminary 
>>> version
>>>    of the patches is available here as a reference:
>>>    https://eur01.safelinks.protection.outlook.com/?
>>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
>>> media%2Flist%2F%3Fseries%3D24703&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605763086%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2Fpsb7Z3lb8ingDILxc3LoEWKTojl5BGMbk6FiR%2FcO9I%3D&reserved=0 
>>>
>>>
>>> Antonie: I took the liberty to fold in your patches changes to address
>>> my comments on your v1. I pushed an un-squased version of the patches
>>> here:
>>> https://eur01.safelinks.protection.outlook.com/?
>>> url=https%3A%2F%2Fgitlab.freedesktop.org%2Flinux-
>>> media%2Fusers%2Fjmondi%2F-%2Ftree%2Fb4%2Fextensible-stats-
>>> unsquashed&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605775020%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iF2BE0GZ8HcVPmOJDhbmLsXQDOXV9JvqfMK6DRPPvrg%3D&reserved=0 
>>>
>>> so you can easily get the diff from this and your version. Please feel
>>> free to comment on these as you're the original author.
>>
>> Hi Jacopo
>>
>> Thanks for the rework and the links. I'm fine with your [SQUASH] 
>> commits.
>>
>> If there are no other comments, I assume I can reuse the common patches
>> in my v2 then, and also apply the new helpers to neoisp driver changes.
>> They look very useful (especially to prevent out-of-bounds crashes I
>> observed when data_size was not set before filling stats :( ). I'll
>> check in your user example.
>>
>> BR
>> Antoine
>
> Hi Jacopo
>
> Do you think it would make sense to create a new generic V4L2_META_FMT
> too ? which can be used by all user of v4l2-isp extensible params a/o
> stats. To avoid each driver creating its own meta fmt with same purpose.
>
> Or do you think it could have side effects ?
>
> BR
> Antoine
>
>>
I think this proposal is excellent.
🙂
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>> Antoine Bouyer (2):
>>>        media: uapi: v4l2-isp: Add extensible statistics
>>>        media: Documentation: uapi: Update V4L2 ISP for extensible stats
>>>
>>> Jacopo Mondi (4):
>>>        media: v4l2-isp: Rename v4l2_isp_params_buffer_size
>>>        media: v4l2-isp: Add per-block validation callback
>>>        media: amlogic-c3: Implement per-block validation
>>>        media: v4l2-isp: Add helpers for stats buffer
>>>
>>>   Documentation/userspace-api/media/v4l/v4l2-isp.rst |  45 ++++++--
>>>   .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  42 ++++++-
>>>   .../media/platform/arm/mali-c55/mali-c55-params.c  |  12 +-
>>>   drivers/media/v4l2-core/v4l2-isp.c                 |  56 +++++++++
>>>   include/media/v4l2-isp.h                           |  94 +++++++++++
>>> ++---
>>>   include/uapi/linux/media/v4l2-isp.h                | 125 +++++++++++
>>> ++--------
>>>   6 files changed, 294 insertions(+), 80 deletions(-)
>>> ---
>>> base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
>>> change-id: 20260504-extensible-stats-f2d6befcc1ce
>>>
>>> Best regards,
>>> -- 
>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>
>>
>

