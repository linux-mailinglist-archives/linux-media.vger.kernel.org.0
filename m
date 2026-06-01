Return-Path: <linux-media+bounces-63261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMdEB8iJHWrAbQkAu9opvQ
	(envelope-from <linux-media+bounces-63261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:31:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60478620107
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 15:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DE44303EF77
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 13:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A114B3A7D6F;
	Mon,  1 Jun 2026 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F+8s80m3"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013056.outbound.protection.outlook.com [52.101.83.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D13A5E9E;
	Mon,  1 Jun 2026 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320603; cv=fail; b=gJGnhvb7n/tpfBKC9zDJQjeKYx+MBBseQXMa3ycjhKzYI0laPPLEdv79GT9T37Sd6DHUshUBNIFJXmgfCG9YJhoNSc9dSfLDg8Ea0+nhLgZAQhz5IC1mJ2GedT1ctgHIzuivOl0AGs9x54lw8shgG9tKkWwK4GKjJmvGxBWVSzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320603; c=relaxed/simple;
	bh=VShuKga6C3Z7AT2CkrHDDmGKpdQLW2AP1oevKfVj98c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g8KHvTMyLkqWURvo399ywzMgXr+a274o+460kq8oFYpnUstiosb4gn9A05yAjsPOZ69G71hDmcKRjTw3Sf95BejeyKCiF9Cs79Tp2tTgQ4k3uc8eyVnMdnq4CN/9Gz/7UZr+0/iBUYAgMANvA8EuXXoW/zpAfAplgggBhzYAVWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F+8s80m3; arc=fail smtp.client-ip=52.101.83.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAkVUnxLqjwMHR3F4admDiqbk8AKZV2o6rtzzuvA0GNVEmAZ+t9brntyWxV1DBk/HbJk+eyy7h1/iEuezBLTpU1gvzbZwW08qZhtrNITdE+VGPxXPhFTY/MYSfx14KyLJ7GC377UPL1MIsbCKz11btnMsjDl2gvgskx9NBorbZuZrSDIINBSu95Yf64WuoCPwzykd+jOVIu0xHfsAk1hqbaKirhpPg0ZvlrhnYaMf2GAK3hx+9UPhFzKxKHd9Qf2TFhC1w+A6KeBA8FDx9HP9KmcBZccz7CUBXzXcEeVWOam6SKK/n6cq30N0eM/6D8InIo/LIXPCpM+k5MELRF32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naGnPgtUUOpD51SGVM0xlrhKfkBxTGnzftFcZlO9SSw=;
 b=rQOeTOEZeASEB5WAxnzeB/TzdzHARXU1w8jIScbowG4Vhps+FhL/wv2uUW5NLuTXTDYHm+N+NVlIli/FFrqa4P2Lj4K0asVesSHbBQmrK5MMLPTx+how6PUA+A9EaZ6i1O5Yus5ins3OT//8D4RfB9M6hyNTe3bI0OmW5vMqQgnaZ8cYPcTCuLS+eyGUICuM7A8bv01UOcAM4WH6earJCMVxadeeD7K9rF/jXihgEh+GLfzsJCAXzjflT7P4aQGq9bkXTx1aHmkkuVcftKRSYKk2QVa+wM7guxpMlII5c0A2C9NuDhYEV2I3SJRDDei/iPt4GmxNXII1rXN9GT3ugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=naGnPgtUUOpD51SGVM0xlrhKfkBxTGnzftFcZlO9SSw=;
 b=F+8s80m33JVSfP+Z6fc0Vtd5Vik4UWTOSzP/2aRM7hz6ok/E873tTAnCVWw3LVR3iTvBDI+5JR8U8FzEMRAedSsKy3jnnw49THtB0suFGfCtYCEJZJ1FH7ODXMaVo08yny+mXMtGm+5CwaJvfIrvfdIRnYQogXgtZo1YNkPdUPkEAeODd0LyNgwJEnN3j2tg3JE2wn70QlbAqiJEVJD0tu/7WDLFiPVF6i2fqOuClBzZozFAQEHbo++qP4P7P6xCu6H5D3YDYsg5nD1jqKNss9UAYFb2VrRQngKFa816hG9RhOtMvzc1gEbV5q1+qYSO1uOOTgnBPRFle2upmw5AQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AS8PR04MB7605.eurprd04.prod.outlook.com
 (2603:10a6:20b:292::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 13:29:56 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 13:29:56 +0000
Message-ID: <9557605d-ac07-404f-b53f-63357898f2e2@nxp.com>
Date: Mon, 1 Jun 2026 15:29:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: v4l2-isp: Add support for extensible
 statistics
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <777ea8b5-b00a-40e0-b649-59324ff0188a@nxp.com>
 <e1bb04b0-025a-44a6-91ab-edfa6edc1f64@nxp.com>
 <b97f4da9-7df7-4bfd-990e-28a23ec7a236@amlogic.com> <agcaSwdqauzuQSl5@zed>
 <ahbeR6-noMhnU_l5@zed>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <ahbeR6-noMhnU_l5@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0300.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::11) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AS8PR04MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: bc0d90d4-cd4f-42b8-134b-08debfe1ded9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|19092799006|376014|366016|13003099007|22082099003|18002099003|4133799003|4143699003|56012099006|6133799003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
 aM0Y2UpUuUIbb9DufC9zRNbEFwfVB3nXGmmcURqAZDpSpvYkeVciDz/IQzShe3FNBBuHsZlKdy0zKNemv2wFCQQbBu+qKr3puyHT+USOAzYDzWwzma7qsnzzPSPz106ZyBsrlFFUGzM+cvA+PLGqNcoUAML06/zouNbHvC2P6kGRUBgQ7XSnU0fH4INzL5KU/i/jUvwX1JeoMbB2BfPGbb3oKGvo947I8SFyfj9dZt4tlq18tqSH2fY8S4GdEQc9GVbhk2bdoRIqn49zn7NpWpb5h/amWtDAyFX9UNdJUVzpDEunoJBF3Av/lSgIkJXwRdd5bgOl1mfuwFQUgV49RvslxXr1q3pzflPzhL1V8IlNxCYfty0xMQVuIRBMNv3vxT0EGcdnnJ/5EAh9D4XcIEnle+u8yDxCFF/Qf352wh288McCAR373g7LwT7Cyq1vol7pFnmE1yD5t/S2WjiTT81JnDAe1Ok1y2nu9NTB8xe2077kw1//z255nJiy19yvMA4yi6Sip+wbCGcNo9tEC5U7fJrJF2T94XaJrMCULqr6WgAbuyQmmY4mInoy3CvAez5+lJwf+5y80dQWkkOLPP8qMt4xBb1P6oQ5Gg/68elEKei7m3OHUh1xLN6DAAiV5kYPU5nZEHii7xqfkKL1eg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(376014)(366016)(13003099007)(22082099003)(18002099003)(4133799003)(4143699003)(56012099006)(6133799003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cXZXMkhva1BUd1BtNElKa0x6eEM5SDJZTE1LK0VONDVRTHQwa2ljRFZSSWNS?=
 =?utf-8?B?VlVoK2lUTFpTcUZQU3VoVmU3YVVEUVNOVUN0SEJEVFVhUUZvYlVYbnZaMFhB?=
 =?utf-8?B?dS85a3ZEbDkxUnh4TWtpZUhnMzdZeStoTFYvUjBicXcrdGtiaXNVbE9yY3BD?=
 =?utf-8?B?VGFYM3BpOFp6ZVZGdU5RNmNGZ3RxMDJpNnhoRWh0WWx0NkRuczAvZVpzT1JW?=
 =?utf-8?B?T0diKzBOUjFvOG1lRWhOMkVZaXA1T0NadTY0bjFqYjArZU9WeVNFNFdhYkU1?=
 =?utf-8?B?ZXltQWl3blFpbTYyZk8yTU9iUnBybjNYZVFrcmJZSFVhN2lwZ3Z3RkpjVFda?=
 =?utf-8?B?N3c3NzdtUFowS0ZCVTh6YkpicjIvKzM1MkdPS0hjUWlqbUFkaXRqVzNmZldX?=
 =?utf-8?B?bHdwNVdSa0I1NHc5QjZoVzZWVmVwOUU5dkI5QWVWdE5uQm1hRlhPN1Uwa09z?=
 =?utf-8?B?cmIyMU1URDN0THR1K2V5ZXNzaEVFb2F6VEhMdEhEZGVKeDU4UFIzZWlKcStV?=
 =?utf-8?B?bE5BVVVYRXBsakYza0tLd3J2SEIyeFUwMTBKWllzc1VQNW04U00xNVhteVJP?=
 =?utf-8?B?cDNLSkRERGRtZXNZVEZKRm9QOHFjT2ZiYVdEVCtLVFZkOHphVnBIejk5aUwx?=
 =?utf-8?B?VUM1WkQ3WjYreGJyWmR0THUrZzRIallTYktiUzM4ZURieWlDK2VWWEh2bi9q?=
 =?utf-8?B?b2MxMFV2M3ZUdjNnakJ2TUswbDFod3VkaDdkeWdCQUEwUVVkQ2R6Qlh6UEZi?=
 =?utf-8?B?eGxRbHJjc1Q0Y1duenJNK3Q2VDdCc0MveDZ4ZVUxK284Z3pUVUxyNjZYZnVN?=
 =?utf-8?B?NDZOUXNSa3pCelRyaEVjNGVHbkI4Z1JZaXNLUDZRRGtqbk95REo3Z1NRTHhX?=
 =?utf-8?B?YjhJR3plRW1uN1AxL2J6YVFPREV0NWJXZzNDVWVBS1d4RmxEemEwTXNnMUwx?=
 =?utf-8?B?N0M2c3dYQTlDQjFkOHBrS2FUZkhDNkFWMjVOUG51SUxCeXF0TXRuNi9MeXNs?=
 =?utf-8?B?Zmd0VmZCRzRtdmMvNU1LaXQySlhJemc2bjBIMXZkWUZEdjdWNVowUXpPKzQr?=
 =?utf-8?B?cjFGM0hxODI4MlhEZzc3Umw2UGRxci9YVzQ4VldrRDE5M0NGb2NyOFc5aVBn?=
 =?utf-8?B?WmE1SERISi82enc5THpNOWNnUFdxZ1E1RW9IUkRGMFlFVkRLZURDZktUc2VD?=
 =?utf-8?B?WWhuQnJQSk52NzJjZWQ0Vk1EeEVNWTV1K01ZQ256YW9HUEJRdG9mOXdzSnJs?=
 =?utf-8?B?S3VXWVp1L0syVEQ0QlQrWEFmMk4zaWUvd1NxaDUrekV3VzFsUmpMREZvOE1D?=
 =?utf-8?B?dS9JcEFab0tkdjQ5emRxR1UrVGFySTUyTmVvOCtpdmJCNUpMd0IzQjRsTW1Z?=
 =?utf-8?B?Zmtud0RkNDYvZXVQT2dVNE8wZjVMTkp3YXhrNW82TnZTR1Z2YlRmL2FMKy82?=
 =?utf-8?B?ZVB2cjVodmN2SllrQVRVVE5iVFlpeTRtRjBvSUJ1dFFZK2hUSjJiV0ZJNE84?=
 =?utf-8?B?bVB0WDhrYm1HUTV3eVpmRDBGSU1YUUwvMFFCbThaSlloc1FlaksyMlJBbTRX?=
 =?utf-8?B?ei9PUGo1N083NW5jSWVabU1lK3JXSVVPQm5pZjhkY1hobWd5b29FZktIVXVK?=
 =?utf-8?B?bEt5cmYxOThEYlluSFB0dDBtRURDdVlmckZvNGdyY2gzWXVLVmRiTzMweW5V?=
 =?utf-8?B?c1pPWitWWEVrTmlqY1FxUGltWUw2QTdmMjFPQ0pkeDNlaXJzdjBnTmlJeWND?=
 =?utf-8?B?TEYwTkJEc0R1cEp6OTVQZDJzaURYSDllcnM5d0x5eGcxWEt0bGpQOUtJNkto?=
 =?utf-8?B?ZXVUQmg1L0pyTTJvMDNNOFpBNUtTTmI4ZU5OL3pTN3NvYkZwN3RqeDRXQzNZ?=
 =?utf-8?B?K21PZlZUM1VZQWJNWW9MMDlTT1huNEliUUozK3JZOHFLdjR0YkpWaGpITHFJ?=
 =?utf-8?B?NUg0ME5iTGt4UVp5UVEzeThlb202VnFUM0hRdGo1Z3BXUzVGMXNZalU3dmxz?=
 =?utf-8?B?dE9odmppNEswKy9BOHRWNzZsSWRHQXROL3poNFMzN0U3WW9UZk9QTm9hYVg2?=
 =?utf-8?B?Y21RbndhdGhVOHd4K2l0ZnRzUGdyTkVTTDNVTWtRQkNtYVV3SGZCY3VBSzV1?=
 =?utf-8?B?NmhoVTZPRzZWYVlsbFB5TGxuTVh4T1NZbENRdGM5MVgwanlKWnJjNzZDN1hP?=
 =?utf-8?B?blArZ01rUi9xZ3JMZWhhVDlUajRJUEFpTXZpenBjQjZzUXlDMGt4TUw2Mm9a?=
 =?utf-8?B?RE5hcUMxeFFTYTkwNTEycmVoNG5QSWhQZFd2eHlpVzFBLzc3MGxqZC9CWnRi?=
 =?utf-8?B?K2dlcHpyVGpHMng4VS9xMm5xeVlFbkFzMGhoNnVVSHhyamJDWC9RQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0d90d4-cd4f-42b8-134b-08debfe1ded9
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 13:29:56.1621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VlxQGLtCn7sAtwU/hVtdRkxb2MvmfRBgcJgIBgeePyXzDa054k/JGzq4fLSijdVQUytDE3t/kO+EJHxFWA2RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7605
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-63261-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 60478620107
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/27/26 2:09 PM, Jacopo Mondi wrote:
> 
> 
> Hi Sakari,
> 
> On Fri, May 15, 2026 at 03:11:18PM +0200, Jacopo Mondi wrote:
>> Hi Antoine, Keke
>>
>> On Wed, May 13, 2026 at 09:04:27AM +0800, Keke Li wrote:
>>>
>>> On 5/12/26 17:26, Antoine Bouyer wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> Le 05/05/2026 à 18:49, Antoine Bouyer a écrit :
>>>>> On 5/5/26 4:12 PM, Jacopo Mondi wrote:
>>>>>>
>>>>>>
>>>>>> This series breaks out from Antonie's
>>>>>> https://eur01.safelinks.protection.outlook.com/?
>>>>>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
>>>>>> media%2Flist%2F%3Fseries%3D24043&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605732002%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=FXaz7QYQvS3s%2B4l9AFMrGgE7kmXlEil%2FKD6DibB0%2FJY%3D&reserved=0
>>>>>>
>>>>>> the extensible stats support and adds a few more patches on top to:
>>>>>>
>>>>>> - add support for per-block validation as suggested during the
>>>>>> review of
>>>>>>     Ricardo's
>>>>>>     https://eur01.safelinks.protection.outlook.com/?
>>>>>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
>>>>>> media%2Fpatch%2F20260504-smatch-7-1-v3-6-
>>>>>> fda125c30058%40chromium.org%2F&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605751612%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=AiRH8MhIbXt3dr%2B2r3I6STE6TJAChylnH%2Fz3tLdS36k%3D&reserved=0
>>>>>>
>>>>>>
>>>>>> - add two helper functions to v4l2-isp to ease handling of extensible
>>>>>>     statistics for drivers. An early user, based on a preliminary
>>>>>> version
>>>>>>     of the patches is available here as a reference:
>>>>>>     https://eur01.safelinks.protection.outlook.com/?
>>>>>> url=https%3A%2F%2Fpatchwork.linuxtv.org%2Fproject%2Flinux-
>>>>>> media%2Flist%2F%3Fseries%3D24703&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605763086%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2Fpsb7Z3lb8ingDILxc3LoEWKTojl5BGMbk6FiR%2FcO9I%3D&reserved=0
>>>>>>
>>>>>>
>>>>>> Antonie: I took the liberty to fold in your patches changes to address
>>>>>> my comments on your v1. I pushed an un-squased version of the patches
>>>>>> here:
>>>>>> https://eur01.safelinks.protection.outlook.com/?
>>>>>> url=https%3A%2F%2Fgitlab.freedesktop.org%2Flinux-
>>>>>> media%2Fusers%2Fjmondi%2F-%2Ftree%2Fb4%2Fextensible-stats-
>>>>>> unsquashed&data=05%7C02%7Cantoine.bouyer%40nxp.com%7Cd0e9f403856c4146996308deaab05cd1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639135871605775020%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=iF2BE0GZ8HcVPmOJDhbmLsXQDOXV9JvqfMK6DRPPvrg%3D&reserved=0
>>>>>>
>>>>>> so you can easily get the diff from this and your version. Please feel
>>>>>> free to comment on these as you're the original author.
>>>>>
>>>>> Hi Jacopo
>>>>>
>>>>> Thanks for the rework and the links. I'm fine with your [SQUASH]
>>>>> commits.
>>>>>
>>>>> If there are no other comments, I assume I can reuse the common patches
>>>>> in my v2 then, and also apply the new helpers to neoisp driver changes.
>>>>> They look very useful (especially to prevent out-of-bounds crashes I
>>>>> observed when data_size was not set before filling stats :( ). I'll
>>>>> check in your user example.
>>>>>
>>>>> BR
>>>>> Antoine
>>>>
>>>> Hi Jacopo
>>>>
>>>> Do you think it would make sense to create a new generic V4L2_META_FMT
>>>> too ? which can be used by all user of v4l2-isp extensible params a/o
>>>> stats. To avoid each driver creating its own meta fmt with same purpose.
>>>>
>>>> Or do you think it could have side effects ?
>>>>
>>>> BR
>>>> Antoine
>>>>
>>>>>
>>> I think this proposal is excellent.
>>> 🙂
>>
>> To me, platform-specific formats mostly serve for documenting the ISP blocks.
>> In example
>> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/metafmt-rkisp1.html
>>
>> There might be ways to handle it without defining a dedicated format
>> indeed.
>>
>> Sakari Laurent and Hans are in cc, what do they think ?
>>
> 
> We briefly discussed it on irc and a few days ago again.
> 
> Am I correct you think this is a good idea ?
> 
> Antonie, do you plan to include the two new generic formts in your new
> version ? Should we have a single format for STATS and PARAMS too ? I
> see merit in both ways, to be hones two formats sound better to me as
> they apply to two different queue types (output for params and capture
> for stats)

Hi Jacopo

I would personally prefer using a single format for both params and stats.

In my view, the format describes how the meta buffer is structured 
(header, size, version, flags, etc.), and it should not depend on the 
queue type. Since both stats and params will use the exact same 
structure, then it makes sense to me to share a single format. Similar 
to how a pixel format applies to both source and sink queues.

That said, if there is a consensus in favor of defining 2 separate 
formats, I am fine with following that direction.

For now, I don't plan to integrate the new generic format in my patch 
series. I would prefer to wait for converging on a solution (1 or 2 
formats) first. Then, depending on timeline, yes I can integrate it.

BR
Antoine

> 
>>
>>
>>>>>>
>>>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>> ---
>>>>>> Antoine Bouyer (2):
>>>>>>         media: uapi: v4l2-isp: Add extensible statistics
>>>>>>         media: Documentation: uapi: Update V4L2 ISP for extensible stats
>>>>>>
>>>>>> Jacopo Mondi (4):
>>>>>>         media: v4l2-isp: Rename v4l2_isp_params_buffer_size
>>>>>>         media: v4l2-isp: Add per-block validation callback
>>>>>>         media: amlogic-c3: Implement per-block validation
>>>>>>         media: v4l2-isp: Add helpers for stats buffer
>>>>>>
>>>>>>    Documentation/userspace-api/media/v4l/v4l2-isp.rst |  45 ++++++--
>>>>>>    .../media/platform/amlogic/c3/isp/c3-isp-params.c  |  42 ++++++-
>>>>>>    .../media/platform/arm/mali-c55/mali-c55-params.c  |  12 +-
>>>>>>    drivers/media/v4l2-core/v4l2-isp.c                 |  56 +++++++++
>>>>>>    include/media/v4l2-isp.h                           |  94 +++++++++++
>>>>>> ++---
>>>>>>    include/uapi/linux/media/v4l2-isp.h                | 125 +++++++++++
>>>>>> ++--------
>>>>>>    6 files changed, 294 insertions(+), 80 deletions(-)
>>>>>> ---
>>>>>> base-commit: d9c8c4adf23d17549c0ec9c85b99d85a0ee6cf18
>>>>>> change-id: 20260504-extensible-stats-f2d6befcc1ce
>>>>>>
>>>>>> Best regards,
>>>>>> --
>>>>>> Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>>
>>>>>
>>>>
>>>


