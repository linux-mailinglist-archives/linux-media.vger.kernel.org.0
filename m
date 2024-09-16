Return-Path: <linux-media+bounces-18305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E4979C38
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 09:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B490283FAF
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 07:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624DB13775E;
	Mon, 16 Sep 2024 07:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TPLuph1d"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABB823A9
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 07:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726472882; cv=fail; b=kp6+ByIMGsakHe94l2dTLcWJwPOciIDZ2LN0UhkaP3AyIa7okVUSS8eBtIJlcDa/pUrhnYEOZXqHcx0fUvT+5kx74ywRrnrF8h/FR37W9L/ukYNBzFp145mgExoltLQdm8J3RCtNeKxdiE3qOcvoYpIvvQ1+9aqbFAeJ5QhYJ0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726472882; c=relaxed/simple;
	bh=zOhrh/e+0BLqxk0h/oe6yVxw7FqCLiXTzBuas2nQU2I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kv7kI6tetc+Ntr1poKY94AfpA9n6Tr2rdskwJjJ1cCrF8UxxafzLCG9kujWWdq0ivpdr/eHS13RUjAMK3cyCNjzrCHP8Gjh08RcxooDnOaAdZeaQjjZAN8/IKsNmglJKqz/Whryu/1jh+FRPRe1kq5sFPMbwWr7F4chUITSzJQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TPLuph1d; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQa4ajKA8vqvDGn3/mECn0bpGKennoTUSmmLr6D9sQsJkylzTUA8Us9uaWZWkQqsJjGU47V5Gw1ujojCZ8TmuXc0cduRPDXTZSgvMkUmwxd82100UIi1Oy1sI9pWkfCDztHTwampcfkFffmLUkZNwMWASfPok691GJ6KQmEXz8/MBcoEJt7+0+c8dUXd2/oIQKkvcE9nVVZfu7icQJFQkM22uJxWNbsCVPWLpWNIqYzBh8lSyof2haWlV8p0i+hs+1S/++bCit5+5aPmuwdu99AcAYrTKEz43RqeoubECdL50NyiJLVgz8s5VAjOMkU7/BfH4clHVJVYUHH6Kpl0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIFEPYbKRyJYYKOvOiK90VlicHctbN5ysOBEdc21pZs=;
 b=ApeN4iyHPTy06QV+iFeSa7PQyYhNmzTKH5H21ejFe1CJlcN+VXUi+ANMWCYVdFmuH5zB3LGMO4ZizYS5WEUQcdF04G6sVlMOdJQ//8mw00nDATyY+4pnxwMx5mD1ExcMhei9GVs9TAtrxvdcdgfQ91dWDi4z28uTejReVJQpxEHMbZYse78M7fDKEUtCIp499u/ElCFeCXP98/pVJwqKs1pv1SHnNdzXNm3luFUAgiE/6U2t5ydWc6HQdd6Ywgqku4hhLW1y9u4G5rg6pCCzeLleArW4OKo3HHA9IBFQ7vstiFhAZ3cwQQRBFKxUzKwJyXAhzwzhNjrWot/1PBMBAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIFEPYbKRyJYYKOvOiK90VlicHctbN5ysOBEdc21pZs=;
 b=TPLuph1dx1XWNZ/+5mCjyOa51bYQQGoDzfNX1vvFypuj9MPSgfuV4KZLnIu0j0OVsj70Jb/UaIaur1MGMpo50xvYam39BNMFAM9dmjkP07wvAgcB3rRkywc0zlkZdIaP5V7o9Ta494RETuFUWUcpnKU6joKgyvukPIjInQBhFNwaGMSxR/NP7hXJ5sbGBJ1akge2WuyglDTvncuLykU6kUUZpjFLeF/Dilx3nNA6yfHT9p1dIzvDAjmgWvi1wMd/dWhBGCM/XUSvVcZLsTIGjBeUIPv78EH2hsJmQRDEfAt9clRSOsIeUHqT2pozkmfYXaJlv/oJDkAnivRNseDO+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB9057.eurprd04.prod.outlook.com (2603:10a6:102:230::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 07:47:54 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::eeac:ae8a:b567:e3b3]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::eeac:ae8a:b567:e3b3%4]) with mapi id 15.20.7918.024; Mon, 16 Sep 2024
 07:47:54 +0000
Message-ID: <cd387675-f0b0-496e-8873-cac38f9b5435@oss.nxp.com>
Date: Mon, 16 Sep 2024 09:47:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dw100: Rectify debug log
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240914142928.17215-1-umang.jain@ideasonboard.com>
 <172632483367.3771860.18357256911961312611@ping.linuxembedded.co.uk>
From: "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <172632483367.3771860.18357256911961312611@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8703:EE_|PAXPR04MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: c763c241-db06-4e30-3315-08dcd623df63
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmVqL2pyZWNRRGdxV1RHVzBlVzRoMHM4VkNXNEJvUFNBd21lbVBwQ3JUWDVJ?=
 =?utf-8?B?U0VuUWVIUVErSGpjVW83M1g2N1dDall6TDlxQVFNQXk0d0doMWNQbDFZUSt3?=
 =?utf-8?B?NitSVzFjZzIwRDlRTld1Wm82Z0Yzd3RNelVVaFNoMXJaaytGYUh4OE84cG94?=
 =?utf-8?B?eWJaSEV5azduTStxWGhNUVM0TGRtV2tLQ0JPa2FMVENXYWVQZEtzd1I4YXpL?=
 =?utf-8?B?eE40YUdWblVmVlpiMWJHTXV4aGwxYUFrRGFNQVVWeHRrME5UT1pmbWMyWTFz?=
 =?utf-8?B?U1RpcXJxdEVGMHVJYmQ3S3RrUUpucCtZbXk5TUEwK09ucjJadThEZld5Rjk4?=
 =?utf-8?B?cDFVcWN5aTBSTzNWV3hFY21CVlh3bnBnSElIcUJGMkdud1c3SFRPT2RZN1pq?=
 =?utf-8?B?Q0k4Vi8wK1hWczM4RDRVSU5pd3RueDcyOXlmS1hKcFRwY29TVGNvM251TlV3?=
 =?utf-8?B?K3UwSS93N1NwT1ZBaWw3czBtMGwyUUY3M2NHWVhLUk1KT2hPVDg5UWZOdDNp?=
 =?utf-8?B?VlMraW1DSVA2OC9vN09nMjZPUjZ0TSt3V0RHUHN2UEtlMTlSNFBYYnMxUGtQ?=
 =?utf-8?B?MFBhck1TR2pCM21QVjJOd045WXJnaTdqd0RLR1NpYTNPZU5HNGtIWEdIRi8y?=
 =?utf-8?B?ZHd1SzNvZCtYRmRoUEg5Mzl6KzVXK3p1SkZDMG16MXZ1aE9oZ1JDeFMyeHlN?=
 =?utf-8?B?c1JjU3FJRWJFLzl5OWcvNkZFSGgvRm9tc3NqYnJsV29LRldqbnJYZXZSWXNV?=
 =?utf-8?B?bUc4dHJweCtTdEU1cEVyMjVMN2xlTEZxSksrdi90bzhpc09uUFg5bDY4NXVI?=
 =?utf-8?B?WkFMVmo4VDJyTG5WTEdobk1nejZwYi9xdDNtbmhRM2FBbTErZm9DZzU2WEN5?=
 =?utf-8?B?Qis0S3RHTVZPNmRyb3ZSRjFpclloSWtYazc1YXFJelF0VkJUWUNYUnlldTkw?=
 =?utf-8?B?OUFlTWdBOVNBQS85N3llRlJkVXN2L3JoUFFJUndFYUoxbUtja3FTcFR1Vytn?=
 =?utf-8?B?NC96Y0ZHS0JpUkFLRTV4S20rdWpud2JtWkVHRVJ5SjJxVVVnVml2TDFnQjF5?=
 =?utf-8?B?ekpVTE1TOUk1ZnhUOEk5eVV6Z0pRQmpmbVljQjFNZ2FEeGt1YVo2UWdwbTQ1?=
 =?utf-8?B?M3hDTlZreEhXY0lVSkdZTnBkUmZUeVJBQXJsVFVTWDdyZ1Y0czE0YnVsN0ZF?=
 =?utf-8?B?V0tKVU4zamZ4R21ua0RUYS9zNWpoZEZDU1lnSGNoZy8yWHl3L1F0MUE0SWRK?=
 =?utf-8?B?OUlETU5XSDBQZCs1RDE5WDYrNlY3ZVZRdUt2eEVvNU00MGRtUlcvdmhKdGNq?=
 =?utf-8?B?MXFzdk4rWGdTZVJORjVRaE5HNTdrZGlkcDUyY2NFQk85Z2ZXbWZWc1JzZ0FP?=
 =?utf-8?B?MWk0dGZFdkJISVNWUnZKRTl0ZWl6cjVZbmxkUFBUVy9TWjV4MjhCVmFXbGl5?=
 =?utf-8?B?UjdzekxhL3JhUSttbnlSQTNmNUYvOVBPN09aSHlTcm45aUtndnl6UW44bGZz?=
 =?utf-8?B?dk1GNHV2Y2ZHdkRHU1NNVUYyWGN4VUJTTEZadGlpT3E4ZzFPVjRrdlVFYmV1?=
 =?utf-8?B?VVdEdklIUnBXaHhUMzExZ0FncjA2Ymp0SEpkV1pZaFpmVEFWVXZGNzJMTXFn?=
 =?utf-8?B?bE9XVHNNVFhpOCtNRHZ4aVJ6K2JYY1VieVdZSjFmVHN1aWNyTUZjNFh4Q3lL?=
 =?utf-8?B?WFlOUVR3R1IwZ080UFc0czFrK0xleXJYUUhFaHZtdCtaTUd4WTJ3WVBZbUY5?=
 =?utf-8?B?Nm81L1J2OE9SWnZ4YkJ3bExOREx0bzQ1MmZIaWsvbjJIRk1HV1RRMzNaWkVJ?=
 =?utf-8?B?NVI1K3RFWlE0cndjbm1JZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amVvTk4zcU5oOElaWlVsdUNuM0Z3U1FQdzZ0MEUycUJ3eXZhaUpUeVAwK3Iy?=
 =?utf-8?B?Skg0WmR0S0llL2JBWjhuMkNFdDh1cDdWU3R6dnRZdzVqWGpTaDVaZTd3a3JC?=
 =?utf-8?B?eDE4VzBjT0NDMjg0dWdsRmc2QStZVjlsR3N6TXFmZEdlYWM5WGJMSWtWK0tn?=
 =?utf-8?B?T2trS0cwcVJYUEovbUtvd3lHYVFpaCtFZGJ2L2poK1E4QWp4VGxvZnJvRjRJ?=
 =?utf-8?B?aTZJZ0Z3UmllbkF4dDlZVzRpamlhb1dBS1ZraENFVWFIWjdsM0x4NnFKOUxy?=
 =?utf-8?B?cHlwazNLWGptejAwNnUyRmUzcVFIdk1aMXpHSys4NWt0Q1FXM0JLYmVFdmF2?=
 =?utf-8?B?RHpoU3h4TkY5dGZML0IwNFVqR0hUYjVSR0FhZ2V4UnYrUzZXSlp5amJNUGFx?=
 =?utf-8?B?L0t4WGNTNXA3V2lHendTbXNmNFhuQytqZXQrY1hJbGFQUENQaGk4UDc1dzB3?=
 =?utf-8?B?dWlrelk4SytKcEN5ekFlYmdwNVRYZGZ3MTdGQUd3dkUva1FjR2o1SEcxYmkr?=
 =?utf-8?B?UHlrRklKN3pCdWxINUZ1ZnVPWUZRSTNwYndSYkU2cVNmbWxGN3ZidE1lRXVy?=
 =?utf-8?B?SnphQ1RvZ3NlalpyQkFSSDlrZlVGUUUxQUxEUCtYRjgvYUFJL1cySWtOY3Vp?=
 =?utf-8?B?LzBHSjMvL2VNaDQ5Vm5ZTWYwRVJoaWhlZWk4T0x6cjVqcGczU2tsSVpYbFoz?=
 =?utf-8?B?WFBxQ0o0Zkh3L3ArcEUwMjQrVGZwNVZJRU1YUDRaRTM3NzRnYTBITVJYMFIz?=
 =?utf-8?B?UWFRUWVMUW5xL1RabnBTSlhJcFdTSDZ6enlSRjNDaEVXbHpNWlNHUmtxTWk2?=
 =?utf-8?B?a2V1TVhnb2xzUzBSR0lFSXB4djB6ZkliMWJ6dUwrclY5d242WlRMWHlyaUI5?=
 =?utf-8?B?L1UzL0dlOFc1eVFwT2J6elA4WG9QOVovdVNvQUg0MmUrZVI4czdJYUtDcGkz?=
 =?utf-8?B?OUtRMVdsWXZqWUs2bUUwbXY0cEpHNVJqeTcrdWVRWjN0ejFmSUJKY1E0eFBh?=
 =?utf-8?B?RElKOWJ5ZU1QVnNRK2x1Skl5bUpPcnl5aTBFSE9OYi8xQm10MXg4Ymx6REFw?=
 =?utf-8?B?Z1V5T3VyOGtISDB4SkRoQ2R3UFA5aG9ET29aaVNEY2F0SjF1SkRPWEppQU5Q?=
 =?utf-8?B?ZENPa3VvYW9CTmNFOFZjb3pWZXF2cCt3dlp4UE5uSmlTTzRMUkVUdUxMQlVT?=
 =?utf-8?B?RkJ2NERIeW9uK0E0L2FWZXpmdnl0WDd5QkV2QkxUU2cyL0J4dWhncWVzT0F0?=
 =?utf-8?B?SmRDVHQ3TCtobXF6azRidyt0dUY4UlZ2dEVFdURJMzIzWTlpbCswTnEzZVNv?=
 =?utf-8?B?Wm91SDdxVkRvMHNzamplaVhZN0wzZWtPRjkxTUpxZ2cvWmZrU0tFUFE0cnZN?=
 =?utf-8?B?NDh6WHB1Ny9BWG9IOEtqMGxjQUdzYkl4VlQzYnNqVVJrNi9PSlBHVERTT2Nh?=
 =?utf-8?B?Z0lFdytlY2ttUW5ISWYvYi9jdnFlUG1oWnhUWEh1VkJVeUNrditpaDI5N0Ux?=
 =?utf-8?B?SWtRT1lEZDV1MHVudUNudEZIT3E4T1J2eWYvWXA5M2xDYVBEUGY3NFVQQW8v?=
 =?utf-8?B?eVM0eFZSR3dtYUY1M1g4V0h2SElwbFROcXZ4eE9jRHcvdU92VnJqekhoSm1u?=
 =?utf-8?B?MVpWM0liYVI4aFpJeUVoVEJ2ZlFOakhmRW5YaituM2I5SVBxcUhRY1hnK3Jm?=
 =?utf-8?B?ZnlZR2kzeVNhUlNzZE9VUXVZUjkwVkRIS3lUWFB2OHdIa2k2Vit0TDBWZUJh?=
 =?utf-8?B?R0dDYzZ5QnpITy9iWFBJaXREeXhVS3h0OTZ4anh3VS9qdkdzL2VGcVJwS0tG?=
 =?utf-8?B?VE5zYnMrL3BUMkdKdi9KMmRGenNJTW4wTWwwUlJHRHNLYk5jaU0xZmVaVk5s?=
 =?utf-8?B?eXVOdmQrdy9kdTBxajhMVlBtUlI3YlA0bVJ1eGxYTTBlZ2NaVzNJd1hkR1k0?=
 =?utf-8?B?Q0VrblRsUllzTVFOeW5xRTBqTDVGd0NMRFc3YWJ3UTU2S0pkZG1VblUremJB?=
 =?utf-8?B?RytJWVg2ekxscnJLSHhxVFNQbDQ4NkFxdHNSbWFjMGRqSGdqM25rMmNBRWRm?=
 =?utf-8?B?cWl5M3ZXZlo2SHJlVTVRczIzaW9tUzlrWDBaTU5xdm5pOEdoVVNkeVBKR1NS?=
 =?utf-8?B?TzFSQ3Q3RklNTnoxNmtXL1U2YjErT0xMWndvZmt1VDFuR2ZzbHZLMEdMb1Bo?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c763c241-db06-4e30-3315-08dcd623df63
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 07:47:54.6459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7pLm8yoUFguRdBDyWiIXLedLAeslTjzIcdz9JzSNgqVenFJRjFdBiIRt6Rzir3k4k+jdLwtXzj8IP4cxIKtGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9057

Hi Umang,

On 9/14/24 4:40 PM, Kieran Bingham wrote:
> Quoting Umang Jain (2024-09-14 15:29:28)
>> Rectify dev_dbg() log of dw100_hw_set_destination() from
>> "Set HW source registers" to "Set HW destination registers".
>>
> 
> Yes, that looks pretty clear to be a copy/paste error when the function
> was duplicated, and would make reading the logs confusing.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>> ---
>>   drivers/media/platform/nxp/dw100/dw100.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
>> index 0024d6175ad9..394f1f6129e3 100644
>> --- a/drivers/media/platform/nxp/dw100/dw100.c
>> +++ b/drivers/media/platform/nxp/dw100/dw100.c
>> @@ -1311,7 +1311,7 @@ static void dw100_hw_set_destination(struct dw100_device *dw_dev,
>>          }
>>   
>>          dev_dbg(&dw_dev->pdev->dev,
>> -               "Set HW source registers for %ux%u - stride %u, pixfmt: %p4cc, dma:%pad\n",
>> +               "Set HW destination registers for %ux%u - stride %u, pixfmt: %p4cc, dma:%pad\n",
>>                  width, height, stride, &fourcc, &addr_y);
>>   
>>          /* Pixel Format */
>> -- 
>> 2.45.2
>>
Thanks for your patch. Indeed..

Reviewed-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>


