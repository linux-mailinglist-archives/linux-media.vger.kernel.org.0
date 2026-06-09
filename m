Return-Path: <linux-media+bounces-64308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UOqsLQwwKGo2/wIAu9opvQ
	(envelope-from <linux-media+bounces-64308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 17:23:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C6661B31
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 17:23:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=mHvWoCnR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64308-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64308-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3605E3025F9B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 14:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCED35DA6F;
	Tue,  9 Jun 2026 14:54:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8B53D333E;
	Tue,  9 Jun 2026 14:54:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016880; cv=fail; b=F11fE5eO9jhOpvGb6xu44do+cuf94RnEOZB9nxN+oH70GhiuYT9CqAO0Y758Q2jguVTLIcE84uhO5vQwE/N7z/VNY6LVBdT8YY2LzxcKe5lfjRBeUydzZw5Pplfbqez4Y3s8XnRBAAorp4z0Pr/l7eW5E6gDzjq03U3vcPb08xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016880; c=relaxed/simple;
	bh=TlTTq1rjuVtZLS8rqLC5GLBfsxzMzjjWXQ6LUqBTFBM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=epwgqlhw0BGCqyX4tJ3Z4l/wDep2dZLDkqxKsTkb78WCEAXNw/TPzhnYjRvB1XOP25gNo4uoAcNyYlR0/mQ4AG+p4qyluOw4m1vIV09nsngnD2obtm9xUwLizQ9BIrSTyWZLqGZFiQlLCN53JD3THAOeFm2c05pUBi86Nc4X0k8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mHvWoCnR; arc=fail smtp.client-ip=52.101.72.48
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdzzZ9te+0vVUStBvJXZgAiuqlkJfg8pQ9IcaOl7qE7cnRPYLcnv/d7y9nXwGpo82GJi2uljPavmBsPEdt60xrkKCrnSGqwuLWrm+Ql8CcG+6Nc9vg4SyxWHWHK0D4ZWOQmMLue24P4p5jBv0IIumUmAu6C4Ec2pBKigAvqQLOdNfZTeoiMMwgpM0uyOuZ6uH4w9KIAyPlLePRRF5d3h7s/ikhy5JZC+qeC4Zor2HKukNa8pHwBvnpsuJPbXTJymaN48tVCkc1mb7U0vFOiwAwsh2o1OnsehU7mhgcHSxyl4Ksmrh5CoQKyOoiPcZjlVWg3S/6Mkuq75JYbE3XxVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmtr3pmg+kNhKR8h+zUIslc23AL9v8UVDJYGb962i/c=;
 b=ScxEOgiercOzufaiMnTrNV8pirFUnE6kVAU+56RbCfRU9UC2OZjG5JgEA5MmMkmi8UIdLMITj09ltOHR6tE7/VVF4s6YTlPFIct5QaX/OuseQE7oS9BomeQOfSldIO6brvb4dZkBZrgWnDd/RjkCBa5Y8fsAwSkCopXPeBBmAWu8X+TSMgDQsKEogOFVFjkF30iMMzrXU6xm9SXXPYna/KhDtFufhgQVTXkheCt+VTcMQX7jB/Q36BzkiYNDfAwkotPhXTNo1shkoAWOr0Sutf/+k+CjHdy0lV59tYQxDxfhV/WmhJ1Q34GECkkWa7newh3Ze+Oi4EicVChbw68T3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmtr3pmg+kNhKR8h+zUIslc23AL9v8UVDJYGb962i/c=;
 b=mHvWoCnRWxL0AT3UupnZacevS5dmTd91xv4WIjVEuy2GZq1iu3i20Tz8+huHWXlIRvYFYEUkpVWPCKTCD3JyPFVvyQJPrahdn4sTwNcu7WBmwxVJuwtiPqoWprA4QHcSxcXmKia9Vi2AW65hKOtGfq9/ZrZlqLO1lwIQK3wqqvxaXhJApnnhkvhVUvDy6ZX3fJg9TEXibSOYW1Yan+GffW7E+Cv0wISvcY+2vB+lNKjbRLHJFVp0YnhlCIbBhWkNA2fMXhPNuMX7DwKKgwATJ6JIwrIyicKf3N0CayuZ1TPL2GwDI53bslw10sczgQIE3krL4L9m3oMkhlXXCNxAwQ==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DUZPR04MB9899.eurprd04.prod.outlook.com
 (2603:10a6:10:4de::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 14:54:32 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:54:32 +0000
Message-ID: <cb1b9fc5-1227-41b6-9ca4-6a99d3204019@nxp.com>
Date: Tue, 9 Jun 2026 16:54:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: v4l2-isp: Add support for extensible
 statistics
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <777ea8b5-b00a-40e0-b649-59324ff0188a@nxp.com>
 <e1bb04b0-025a-44a6-91ab-edfa6edc1f64@nxp.com>
 <b97f4da9-7df7-4bfd-990e-28a23ec7a236@amlogic.com> <agcaSwdqauzuQSl5@zed>
 <ahbeR6-noMhnU_l5@zed> <9557605d-ac07-404f-b53f-63357898f2e2@nxp.com>
 <ah_iVT1d5U4-9g-0@zed> <5778ba10-22a8-42fd-b2a8-6b69c78e6d52@kernel.org>
 <aiA-jERhh0xgW2K3@zed>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <aiA-jERhh0xgW2K3@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0339.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::13) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DUZPR04MB9899:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba4ede8-6bb6-4e73-17d2-08dec63703fa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|3023799007|4133799003|18002099003|22082099003|11063799006|56012099006|6133799003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
 VIq4d6jNqDqPq90ksVWalaPHtTWeUTAd74YBvIZeytaUd33bJMncE9r80rCqRrZmE0LHiFT6r01Mejuj/VRUnWAAZi8WNO7AwNwf+bNnxRNZl1JqTmYlOOWPan0uFY3dfA8HJZPUCGgdd6BzTnUsexcUocWssQ8lm49JPg4SJFVUi7tZipyvs80SxA1lYGPXTa5Oay//klFBOPW56olxV9/kbFSmBYJRTHGk5pLypsHdmR7hhXDWsKJr67JSJ2U8c7SPTTJjPDpnkgwDigj1VpcdEfQ7DeHBZSw5ZYGiEztuiCGLMMEtzwUqNcKGZRcKt4L5Bl3kO45/Ln3QDITdK6wHv59624FdEu60qHVyh0TxnywvgMRLySPFn5fahT1lukPykBnUun11Tc4LueiZEpviC/hxfVMBX6+PzsCCYi1ugvxEWoC2DsOF5QUS8haYzinxlkNSNHGhQ9FlxSsoZfBj9T/Uf4AVtRrOAvls3fdJlh3tMHIjeeUIltOOc2Gyt+jQ8usXui+EV833sCkoJ7SFO+KUtCfHKp04QNuPX6MOkMgULJDLG0BAWjMIsiRBFNzyN8HpBAiNBi23QCqe8lmXjE5RuGmnbAqDnvp9a+N1H9OpEGxIOhZAZP/mU4V/Ssem7VYwO88tE4q0Tn+UKw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(3023799007)(4133799003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WjV0MFZYYzlZbGJUdHI2VUVRTjA5NVlqZ05KRWlEb3FUbDMrMnBERHFCTDdu?=
 =?utf-8?B?Q1dwYmpUZzJJOENYSytROGl0OHJSSDZVNXlQSzVGdlNlMlpFWHZjZjNmSGhP?=
 =?utf-8?B?OWdsaFdRNmtkMVdUalZFS2E3TS9keGFkcGVEM3ZjSklDZENvRXpSRDJBRVRk?=
 =?utf-8?B?QUZpV1lodHpLbXJSaENaeUVxUW1kT281NUQwaytWSVp6YlZDV0hkRm1PRjRF?=
 =?utf-8?B?ZGVZLzRlUjNjYjBxKzVpZzFjcHdsZUg1ODRLZHZpTS90NWRvR1FseFc5R0U0?=
 =?utf-8?B?aERmY2lSNE5BUWw4d1B6K3Z6cHBSaUFmMzZaYjg3UEFKT0tZZkkxdHZZd21x?=
 =?utf-8?B?WFJhNjBSZUZIQ3ZGMDY4cGU4a1VtVlBuSWtrRDRJaytRbnpTRFNReitrb0J2?=
 =?utf-8?B?cWlTUEdpR3hBR1dEUkwrK2xxaDlYYmlhK2syU0Y0OFNLa2RsWFhqZU83NjJT?=
 =?utf-8?B?TFE5eEdReC9HMnRlR08wSFBYcExqdlVRcmJyZHlndGZEZ3NGYXZhN1JSUFh6?=
 =?utf-8?B?WTJXZ1ZMb3U3MGZSN0E4S0hURXg1NXBEbVk2em1kcHhNMDFQcks3VTBPeGY5?=
 =?utf-8?B?THBnSE1jU0NIM3VMUDVMZDFPa3VodGh0bVZ6L29WWXNlQmtpRjU2ajhzZVFn?=
 =?utf-8?B?M1l4TnJmWWJlN2RneTZ3RE1aZlBuQ0gxVFpmU0lBMjgzYUs2MC9QVlR0ZmxK?=
 =?utf-8?B?UTV5eFh2b0VNdEMyeXJyd0o1Mkx6M3BWSzlXOXh1elUwUGcrQ1BrWEhOanFI?=
 =?utf-8?B?VGZ0UUVpQ0lqdVJBV29GVVVpZVFIV3JzL0I1OTZocW53R0piSzF6N29NakxD?=
 =?utf-8?B?akhrN1JIMStNZjNzTTkyMlgyS25xZElLWnhPUFFxUVFmNnZQN052bXcwQWo3?=
 =?utf-8?B?NElsTzluS01adjFjMURjR1YvTFFuSU8xam5sZlJyZ1hhRzFGRlQrYng5cUZ5?=
 =?utf-8?B?N3RFNzhheGJxb3JhNURQcDluSVVFVUt5SU9PLzk3dmJOS01tRzlwRVNDRDFs?=
 =?utf-8?B?aEFTMjZtOFd6aW92NjhBdVg3Q2hoeTVWeUV0T0FTVnZuQ2QzTlNEQk5JeDhR?=
 =?utf-8?B?MWZ4aEd2azlFaXY1KzcvM1NqYUd3YjZOQVpRZlI0RENFdE5CaUJ1K0Q0QTA1?=
 =?utf-8?B?U25ibjRmRE5pRVdVVC9MbGVjbmVGK1c3a05RUFYxd1dJekhWVENScTFONUJG?=
 =?utf-8?B?L0JWbFpXOXVKc0R3ZHhtVHVKN3NlRzlNc1RrVER4dG5xOU1WM0lDU3pBM0Yw?=
 =?utf-8?B?VTlXVStWcDB6YlovSnlZMDZ2TlN4NzdYOHhJVC94YzUxZG95MU1KVXJWckZz?=
 =?utf-8?B?Nzg1bDFZNlQ0NGFlRHl1LzcxMFB4emowVnR6MVoreDRwOTE2aElQdWxpWUNC?=
 =?utf-8?B?THFFZGw0R1NxZHlSM3dBTWZVY1h1WWtlOHVrMjRSR2c5a3FXSjNYYjFWWGND?=
 =?utf-8?B?MVlJc0crT1NFMWpWNWZsTXdneTRKam1VamVMRllCOHBFeVlhQlhEZlFLU2VT?=
 =?utf-8?B?cjRGWkhadDljYjFHS0lGSFVDRk5xOHVyeExpN29ySUFRNnlnRStuQkdSbmNT?=
 =?utf-8?B?WVV5NElkYXJueWV3VU9GcWlCbXo2RExCKzFaa0FEbngyVHhneWJ6NHV2WHpv?=
 =?utf-8?B?YlNFSTU4aE1INTB4NHJxMm5pSnQyMkNROGNvY3pTMXNZL2s1aUo2S3VvS3lj?=
 =?utf-8?B?a2M0WlcraGloSnFBWkdLMFV0TGhITEVNaXpOWmxyUjdkSUFTV0c4TW5yL0lt?=
 =?utf-8?B?VHBPekR0cnBKblF5N1VLSEJ4Q1BBbTEyRHVsUjJWckhndkZZK2tGT2srRDJ1?=
 =?utf-8?B?QmFEaGxYMmFmdDRod0Z0cTFlOVd2bGhNTlhweUVpb2ZFYkcxVEo4dDczekN3?=
 =?utf-8?B?VUsxMDkvSlRsU2tvVnlPT0FLellodDlKemt1am0rSnliL0VBaU93c1I3R2Zi?=
 =?utf-8?B?ZXZHNnFqN24xWEV6WklsTVY3dmpnMCsyQmQrS3YvTkZMZUxYT254Q252dGth?=
 =?utf-8?B?K1hXbWhmaW45TzFlRDcyNmlXTTRSeGJocnJTM3lYRnkzbHFybFdGR1ZlWDhq?=
 =?utf-8?B?ZTJ5Zkk3Y1hlL004RmpGRUtHYkVBSW9vaThPUzQrSkYzdjRxREFoVUpRZi84?=
 =?utf-8?B?WGVkLzV0L3kxTVUxSXhkZWFaTk9BV2VZRU5VNy84aHlpbzZmelo0aTl1Y0dU?=
 =?utf-8?B?MTQ2V011ZnpvQnRWaEEvQzkzSXNkOXZsOGNqQ3plSjRnZmxqRTJwbG96Y2Zt?=
 =?utf-8?B?MFF1R1BMSGFjV3I4eENGakZ1aGdVQ2VOWFZReTd0VVF4WFRxMFJtcGdWRVVo?=
 =?utf-8?B?eWptcUtvMmNQYUxjUlFycjFvRFVJU1ljT3E3aTJaeVozM0xheXQrUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba4ede8-6bb6-4e73-17d2-08dec63703fa
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:54:32.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVbNwEgvDODu9yajizdSCSbtB688qrmgyPPM1tcRipgNwzSWyMUCZ2jw9HLQtzixYvSROUDHgpWllI/5r/JxsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9899
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-64308-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:keke.li@amlogic.com,m:mchehab@kernel.org,m:dan.scally@ideasonboard.com,m:jai.luthra@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:ribalda@chromium.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nxp.com:dkim,nxp.com:mid,nxp.com:from_mime,outlook.com:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B66C6661B31

On 6/3/26 4:53 PM, Jacopo Mondi wrote:
> 
> Hi Hans
> 
> On Wed, Jun 03, 2026 at 10:41:09AM +0200, Hans Verkuil wrote:
>> On 6/3/26 10:17, Jacopo Mondi wrote:
>>> Hi Antoine
>>>
>>> On Mon, Jun 01, 2026 at 03:29:54PM +0200, Antoine Bouyer wrote:
>>>> On 5/27/26 2:09 PM, Jacopo Mondi wrote:
>>>>>
>>>>>
>>>>> Hi Sakari,
>>>>>
>>>>> On Fri, May 15, 2026 at 03:11:18PM +0200, Jacopo Mondi wrote:
>>>>>> Hi Antoine, Keke
>>>>>>
>>>>>> On Wed, May 13, 2026 at 09:04:27AM +0800, Keke Li wrote:
>>>>>>>
>>>>>>> On 5/12/26 17:26, Antoine Bouyer wrote:
>>>>>>>> [ EXTERNAL EMAIL ]
>>>>>>>>
>>>>>>>> Le 05/05/2026 à 18:49, Antoine Bouyer a écrit :
>>>>>>>>> On 5/5/26 4:12 PM, Jacopo Mondi wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> This series breaks out from Antonie's
>>>>>>>>>> https://eur01.safelinks.protection.outlook.com/?
>>>>>>>>>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
>>>>>>>>>> media%2Flist%2F%3Fseries%3D24043&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605732002%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=FXaz7QYQvS3s%2B4l9AFMrGgE7kmXlEil%2FKD6DibB0%2FJY%3D&reserved=0
>>>>>>>>>>
>>>>>>>>>> the extensible stats support and adds a few more patches on top to:
>>>>>>>>>>
>>>>>>>>>> - add support for per-block validation as suggested during the
>>>>>>>>>> review of
>>>>>>>>>>      Ricardo's
>>>>>>>>>>      https://eur01.safelinks.protection.outlook.com/?
>>>>>>>>>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
>>>>>>>>>> media%2Fpatch%2F20260504-smatch-7-1-v3-6-
>>>>>>>>>> fda125c30058%40chromium.org%2F&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605751612%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=AiRH8MhIbXt3dr%2B2r3I6STE6TJAChylnH%2Fz3tLdS36k%3D&reserved=0
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> - add two helper functions to v4l2-isp to ease handling of extensible
>>>>>>>>>>      statistics for drivers. An early user, based on a preliminary
>>>>>>>>>> version
>>>>>>>>>>      of the patches is available here as a reference:
>>>>>>>>>>      https://eur01.safelinks.protection.outlook.com/?
>>>>>>>>>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
>>>>>>>>>> media%2Flist%2F%3Fseries%3D24703&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605763086%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2Fpsb7Z3lb8ingDILxc3LoEWKTojl5BGMbk6FiR%2FcO9I%3D&reserved=0
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Antonie: I took the liberty to fold in your patches changes to address
>>>>>>>>>> my comments on your v1. I pushed an un-squased version of the patches
>>>>>>>>>> here:
>>>>>>>>>> https://eur01.safelinks.protection.outlook.com/?
>>>>>>>>>> url=https%3A%2F%2Fgitlab.freedesktop.org%2Flinux-
>>>>>>>>>> media%2Fusers%2Fjmondi%2F-%2Ftree%2Fb4%2Fextensible-stats-
>>>>>>>>>> unsquashed&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605775020%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iF2BE0GZ8HcVPmOJDhbmLsXQDOXV9JvqfMK6DRPPvrg%3D&reserved=0
>>>>>>>>>>
>>>>>>>>>> so you can easily get the diff from this and your version. Please feel
>>>>>>>>>> free to comment on these as you're the original author.
>>>>>>>>>
>>>>>>>>> Hi Jacopo
>>>>>>>>>
>>>>>>>>> Thanks for the rework and the links. I'm fine with your [SQUASH]
>>>>>>>>> commits.
>>>>>>>>>
>>>>>>>>> If there are no other comments, I assume I can reuse the common patches
>>>>>>>>> in my v2 then, and also apply the new helpers to neoisp driver changes.
>>>>>>>>> They look very useful (especially to prevent out-of-bounds crashes I
>>>>>>>>> observed when data_size was not set before filling stats :( ). I'll
>>>>>>>>> check in your user example.
>>>>>>>>>
>>>>>>>>> BR
>>>>>>>>> Antoine
>>>>>>>>
>>>>>>>> Hi Jacopo
>>>>>>>>
>>>>>>>> Do you think it would make sense to create a new generic V4L2_META_FMT
>>>>>>>> too ? which can be used by all user of v4l2-isp extensible params a/o
>>>>>>>> stats. To avoid each driver creating its own meta fmt with same purpose.
>>>>>>>>
>>>>>>>> Or do you think it could have side effects ?
>>>>>>>>
>>>>>>>> BR
>>>>>>>> Antoine
>>>>>>>>
>>>>>>>>>
>>>>>>> I think this proposal is excellent.
>>>>>>> 🙂
>>>>>>
>>>>>> To me, platform-specific formats mostly serve for documenting the ISP blocks.
>>>>>> In example
>>>>>> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/metafmt-rkisp1.html
>>>>>>
>>>>>> There might be ways to handle it without defining a dedicated format
>>>>>> indeed.
>>>>>>
>>>>>> Sakari Laurent and Hans are in cc, what do they think ?
>>>>>>
>>>>>
>>>>> We briefly discussed it on irc and a few days ago again.
>>>>>
>>>>> Am I correct you think this is a good idea ?
>>>>>
>>>>> Antonie, do you plan to include the two new generic formts in your new
>>>>> version ? Should we have a single format for STATS and PARAMS too ? I
>>>>> see merit in both ways, to be hones two formats sound better to me as
>>>>> they apply to two different queue types (output for params and capture
>>>>> for stats)
>>>>
>>>> Hi Jacopo
>>>>
>>>> I would personally prefer using a single format for both params and stats.
>>>>
>>>> In my view, the format describes how the meta buffer is structured (header,
>>>> size, version, flags, etc.), and it should not depend on the queue type.
>>>> Since both stats and params will use the exact same structure, then it makes
>>>> sense to me to share a single format. Similar to how a pixel format applies
>>>> to both source and sink queues.
>>>
>>> You certainly have a point here!
>>
>> Even though how the content is structured in the buffer is the same for both
>> parameters and statistics, the actual content is quite different. So the format
>> description in v4l2_fmtdesc is also different. When you list available formats
>> for a video device it is nice if you can see what the format actually contains.
>>
>> A V4L2 format has always specified both the structure of the data and what the
>> content is (with the odd exception like V4L2_META_FMT_GENERIC_8), and I think
>> that should be done here as well.
>>
>> Interpreting the content of the buffers is quite different for parameters and
>> statistics, so just because the high-level structure is the same does IMHO not
>> make this a good enough reason to use a single pixelformat. So I recommend
>> sticking with two formats.
>>
>> Unless I'm missing something?
> 
> To summarize the day-long discussions on irc (quoting here your
> messages)
> 
> -------------------------------------------------------------------------------
>   1) I think we should have separate pixelformats for parameters and
>   statistics (and whatever else we will need in the future). I think
>   that makes sense. That way you can also give a sane pixelformat
>   description.
> 
>   2) If we go for a generic pixelformat rather than a per-platform one,
>   then it has to be documented how the application discovers which
>   driver it is. It is one of those things that I don't think is
>   explicitly stated anywhere. Taking it from the media controller makes
>   sense, but it needs to be documented. It also means that the media
>   device driver name is part of the ABI. Changing it would break lots
>   of things. That too must be documented.
> -------------------------------------------------------------------------------
> 
> This seems to suggest we're fine with  V4L2_META_FMT_ISP_PARAMS and
> one V4L2_META_FTM_ISP_STATS formats, provided we clearly tell
> userspace how to identify which platforms it is running on.

Hi Jacopo, Hans

Thanks for your inputs.

Then I will prepare a v3 of my series with these 2 meta formats, as 
separated patches. Actually, I feel like main update is about 
Documentation. So I created dedicated doc for these formats, but 
MAINTAINER is impacted too. Please feel free to review/comment, or 
cherry pick the patches in your own series with extended stats if you 
prefer. I will always rebase anyway.

Best regards
Antoine

> 
> I suggested that libcamera matches on the media device driver's name
> and from there we know on which platform we're on.
> 
> However you made a good point on the fact we discussed about allowing
> multiple drivers to register in a single media graphs to support
> complex topologies. In this case we should clarify how this would
> work. If I'm not mistaken Ricardo had a similar point when talking
> about media device names ?
> 
>>
>> Regards,
>>
>>        Hans
>>
>>>
>>>>
>>>> That said, if there is a consensus in favor of defining 2 separate formats,
>>>> I am fine with following that direction.
>>>
>>> Let's see if we can get feedback from Sakari/Hans/Laurent.
>>> I'll re-ping them!
>>>
>>>>
>>>> For now, I don't plan to integrate the new generic format in my patch
>>>> series. I would prefer to wait for converging on a solution (1 or 2 formats)
>>>> first. Then, depending on timeline, yes I can integrate it.
>>>
>>> If you want to re-send a new version out quickly feel free to use any
>>> format. I hope we can sort this out quickly so you can rebase on
>>> easily.
>>>
>>> Thanks
>>>    j
>>>
>>>>
>>>> BR
>>>> Antoine
>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>>>>>> ---
>>>>>>>>>> Antoine Bouyer (2):
>>>>>>>>>>          media: uapi: v4l2-isp: Add extensible statistics
>>>>>>>>>>          media: Documentation: uapi: Update V4L2 ISP for extensible stats
>>>>>>>>>>
>>>>>>>>>> Jacopo Mondi (4):
>>>>>>>>>>          media: v4l2-isp: Rename v4l2_isp_params_buffer_size
>>>>>>>>>>          media: v4l2-isp: Add per-block validation callback
>>>>>>>>>>          media: amlogic-c3: Implement per-block validation
>>>>>>>>>>          media: v4l2-isp: Add helpers for stats buffer
>>>>>>>>>>
>>>>>>>>>>     Documentation/userspace-api/media/v4l/v4l2-isp.rst |  45 ++++++--
>>>>>>>>>>     .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  42 ++++++-
>>>>>>>>>>     .../media/platform/arm/mali-c55/mali-c55-params.c  |  12 +-
>>>>>>>>>>     drivers/media/v4l2-core/v4l2-isp.c                 |  56 +++++++++
>>>>>>>>>>     include/media/v4l2-isp.h                           |  94 +++++++++++
>>>>>>>>>> ++---
>>>>>>>>>>     include/uapi/linux/media/v4l2-isp.h                | 125 +++++++++++
>>>>>>>>>> ++--------
>>>>>>>>>>     6 files changed, 294 insertions(+), 80 deletions(-)
>>>>>>>>>> ---
>>>>>>>>>> base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
>>>>>>>>>> change-id: 20260504-extensible-stats-f2d6befcc1ce
>>>>>>>>>>
>>>>>>>>>> Best regards,
>>>>>>>>>> --
>>>>>>>>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>
>>>
>>


