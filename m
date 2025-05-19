Return-Path: <linux-media+bounces-32800-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D9FABC0B8
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D08B17F1BA
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E46628369F;
	Mon, 19 May 2025 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hoaWG6C7"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D14826980F
	for <linux-media@vger.kernel.org>; Mon, 19 May 2025 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665161; cv=fail; b=EqwZxqwi8xRh2DI8iaGKag2bIb8LbdLuM6Tr4AjqSyYbUWWvjCo42T+OWa9UGo/nM/he58rZJeGW1Lt3PwLY+1X9eRzE3LcZAx5qpWZOa6sZqh+nLEW34axU0Fi58PKFLVEFYdDyCf8KSmSVknDqQ17uyulfzGVTU/sNW6Soep0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665161; c=relaxed/simple;
	bh=f0qUpTMdvD1+kug7Y6Gvm6zzQ12UtSQMNqU2dC9vIeQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tL6KRYbZLimxiEFtoAKsrEZxdEoWAsinyZsx/MGEFgaDRacvRqFEvoyfuU5mKCo4XCkmDbJXuxPmpxTA3wbFgxk1/HtrvjI9uB32Xifpfnftb/lim/+mI7amAV76+HBM/c/A2tz9lYuJEi3HPCPVnVe0hLJxyfnnSeTLoumQ9zw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hoaWG6C7; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbjfrbPsx0ibrE3v0IauJVvldjTDD/FMVBoGadoP0fmKr438vf3HzyRg2yH6yxpQYU5WYIFQ6sq9+6oNQ6/RnNJnK+oVDLRwuvhRETP8c7+8Om3I9c19Jw1doLdRzu6ewNCMcRqZp5Kr5LAzKdhc5vCTnjNzeDzgx3Nbjcnk2GJVbHIwI+XNpF8Pdh/EpP/yZ9I7m3ap1UP4ESH32pnso40KX3FhirlKg6m3DOqU3MRyJjJNij9MnwFnVGllaAOMvu8fQCNfpPKxXnUndRAmCd/TYnGloRP6BWY0zPipR7zeu+JyXPB/J7Q+PD1jEVnqVx0v1jV544C4+Greo5nn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkN5W0DopgYQYayjHrPfpGkjq9yxO4zRiwKo0UxssdA=;
 b=UYcqT4ONGY1bp0oddf/MfqH1uBlpzIFg9rJuwzOzwN5hcP1Ae/tBVUK04nHG6YuH726mz9VqK/A2rRN8zkgj2VDTolR/BsN71o4gkVs6WkO29IEYYUXxAv8kd8O0xxuMDXWHuMb9WkyYLg3OmYYRlHVU0Or8Fc0+/72k1LfpWcD0DpiJXwel/1yeh1gwh02FP3RuVyNGix3kjcYbNU8oOICRxKQr3SQO6KP1jMl4uu4+m6vru0hIanTur/qnxEuVcVsCYQ4C1aqpUQNmB//RsXGfTfIu8rjHKD3kjXw4IjHqIa+oVrtp1uRZg1A7OqUREHsqnOuiUla5cbl8OWxkRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkN5W0DopgYQYayjHrPfpGkjq9yxO4zRiwKo0UxssdA=;
 b=hoaWG6C7ODIFM/K8gcNMxhA8wIC7kIYLQFEopLTknMzAtwwFxoGYA78UU23Z/t4PVzSTDhheEXZgjJoVu3A9/a1Op6az1ljK10EOmcu5TkvZk8qu9zbCym2jOWIImK0NCIyMeCWOqf3fWFvPQKWATNhG2oXpvMdrUb7EVuCXh1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS9PR01MB13962.jpnprd01.prod.outlook.com (2603:1096:604:35e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 14:32:33 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 14:32:33 +0000
Message-ID: <0fa552e9-36b0-4a6b-a2aa-e786d4540f1a@bp.renesas.com>
Date: Mon, 19 May 2025 16:32:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: platform: rzg2l-cru: Use
 v4l2_get_link_freq()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dan Scally <dan.scally@ideasonboard.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20250506125015.567746-1-dan.scally@ideasonboard.com>
 <20250506125015.567746-4-dan.scally@ideasonboard.com>
 <aB4OfjTGktdu7Yos@tom-desktop>
 <i4g722z6a3i4xnre6b3ne76w7acxcjy2j3ztww4ndvabungeuw@ovecz2bqewr6>
 <3eb69cea-b511-412e-a126-ce246c2491df@bp.renesas.com>
 <CA+V-a8v4rw9dD04obCT+gs1Npas3nopeC+xjU0bcBYCNwrqzhA@mail.gmail.com>
 <dad4c6dd-b3d6-4a2e-a418-fe311cf871c4@ideasonboard.com>
 <ol3hnn5e4srxx37cdxc4lutnwpu2u3i6bjzczz6zyinxwaq7o7@7rlp7dfhys3i>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <ol3hnn5e4srxx37cdxc4lutnwpu2u3i6bjzczz6zyinxwaq7o7@7rlp7dfhys3i>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::16) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS9PR01MB13962:EE_
X-MS-Office365-Filtering-Correlation-Id: 09159b9c-90c9-43e1-0088-08dd96e1fe29
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZjdRV1cxejQrY2c0cW8wM3AxUElmWkFQYVh1Y2dFSDFiTGd3T2FOU2p1SE85?=
 =?utf-8?B?TGxCSm5EaXFiTDczU0xUZUh4SlRBVkxiK0dMRG5GSXpsTnlmS1NEV1VHUmdP?=
 =?utf-8?B?WmpOeDlHZ3lHOEswRlQ3RGsyZVBPMlV1STU3allzVU9Bb2RtT2RIVlJIcFpn?=
 =?utf-8?B?Q1RpQ1FBQ3owS3FvMk8rSHhCYTNUNFYvbDlBVlVDY21DR0VSbVYwNVN6T29o?=
 =?utf-8?B?UTBtYnBOZGpsNEJHOXVveUU3bVBlMmpVQ2FYR2tydGxwTGJoRTNqeVNmUm5E?=
 =?utf-8?B?ZHVxbGRGWUNhK3BBczYzUW5MRE5ZYlROT29EVzFCT1BCVkl4YWJXNU5WTy9H?=
 =?utf-8?B?c3dZV2dxdEFJaVFONEY2QndGcDliRXJtV3Rhd1hvcEJSaERyYUtxVlQvbXRj?=
 =?utf-8?B?VEV4MEV2dndYMU0wczVuazNtc0pFU0pVcE1EanpQSis2d2hMTFJZVng0aHUx?=
 =?utf-8?B?THRJR1pDdVlGRjFscFFkRk1UM0dhd0JPb21iVGFaOUVHZVBvQU93S3NXSXRy?=
 =?utf-8?B?R1d5bzdYdzhlZE4wbVM4c0Z2VzY5RVJVdW5LdlhUL3ZIcFNpelpHMGYwbnM1?=
 =?utf-8?B?TFNqRGs1QWVnTGV6MSs5WFZsNEJNN2o5SGZ6UXE0U2VNS1RzeHpnOVhkTXN2?=
 =?utf-8?B?QzVwVHFOaUkreWx6K2JiOGdTTTB1NlpDKzk0U2UyeUkxdTN4UlYyZUkwNENN?=
 =?utf-8?B?S3J2R0lhNC9lUjI4aDNMU2ZrWDN5VjRSY0ZyRS9mMTAwY1grQktvRFpUenl1?=
 =?utf-8?B?WFRUTkpYVWRHKzFwL1JrdEh0NFlISnU4VzdzMElScG4vMk5zOFZJZzdNMjYz?=
 =?utf-8?B?Wk5oRlpsRUNoOG50T1poNnhqam84andHQ3dqOGpvYm5adHp0Qkt1UnhzZ285?=
 =?utf-8?B?cnp4R0hOcHhXMWhyeW96alVBQUw2c2FiSVRlc3dZSE84RlBiVjdPYkgzWk9Q?=
 =?utf-8?B?YUVVSmxyL3RHNkhJbzh1M1pSbW5JSFdUU1FOTmhVREV0RC9oejFoVzdyek5H?=
 =?utf-8?B?Q0xpWHl5SE0rSzBDeTI5elN3N2xvNlB4NVRhY0RxMUk1TUZLbDczb0szKzZJ?=
 =?utf-8?B?d3VuUHdZU1dDcDJNaXpYaEwzOFA2MUQyZ0dBVWVNQmpsMk1QSlc1ODRWUFRn?=
 =?utf-8?B?ODcyMUgxK0Q0N2FxZ1BrdXpydjBtT2xLMVpMNFlLSnVpYXNuZDVDM05zdXYy?=
 =?utf-8?B?RUFtdU9wQVdiZUdicFRGR3grTmJuOVRjSEhjUmNlcVVoZGEvOTZwUnkydmky?=
 =?utf-8?B?S2JjY1hEQTRQZmV5VGxxQWlhWmRTTDRUSkR4OHNtWVE2aTB1MWIvMU85dGg1?=
 =?utf-8?B?REVMWDZTa3h0VVVQREVzK2xRbXFlcERTSTlwWkpNMXNFbXloNVRHcUFrQTM3?=
 =?utf-8?B?dWVvazkrUUxPcU84bVRHaXJLZmIwaFY2YVFad0JzNGp1UHFhbkR4THRqTm52?=
 =?utf-8?B?WURRZFRKcFVCVWNBSHBuR0dLdnlkTHMyNnk1M3pRdHZKNmdINVhDK1hnQ1Nm?=
 =?utf-8?B?OTdUTzZoVkE3TEpnVTk5U0FZanNBRTNCMkhGUkxpcEJra1BhOFNYZzlDdSta?=
 =?utf-8?B?d1FjUGM1STAxN0QvK2FSSU5wODZVWDlYTlNEL2hjNmlPVkNvbGl2dUdCUm5u?=
 =?utf-8?B?cFlHZzgvRGVCSDBiUHJDUFpUdXY2L0R3ZmkxcWxHSFhudnhaRzdhd3VqQ01T?=
 =?utf-8?B?c3JGWkJMV2RRZnYvQTBNVEp6bUUyVnlQK3V6eDRuQmhKaThWakJQMjRxTGJn?=
 =?utf-8?B?K1B0T2dEaVc5MFUvd2pOeDN5dmMva1ZJOWpaaDREQTRWQ0trcEJNSmJ0bmc5?=
 =?utf-8?B?ZFZuR1BnVjBTelNOQ0ptcWpueGU4NFptVnl5aFlOcjBzZVlyVHI2UHhMWWZH?=
 =?utf-8?B?bWpOMUZjY3doR1prckQ0Wnk2ZWRkNXpQd3pmeEZ5bEkvVTdFKzR4NEdwQ2U2?=
 =?utf-8?Q?h8hHdB5d/Uo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?elhtTkhtUjJJQzdyZTVyZUNhNWF5bHU0MzBMUm42dmYvcEp6VUJuK1VJWUhP?=
 =?utf-8?B?WDMxalVEU2hLQnhud0MvRnpMQWo5ei93NWFRTytWOU0vK0dGSDkwZDZoa1kx?=
 =?utf-8?B?djlXcENzazdmY0t5RHJQZjJFTUM5OG9haWdPelBmNWJkR2VBKzY2cGVNVnRB?=
 =?utf-8?B?ckF6MSt6SEJiQTFqVGxsWk5hUEJPaWpEQnFvbkZQWlJ2VXZVTnMycnc1ei8z?=
 =?utf-8?B?OExZQm5qc09oZ29Dd09raW1NLzM2QVB6cGlrc3JXYnpkUFdMOWZST1NHMk41?=
 =?utf-8?B?YUVvNVBmU3hnaldoUitad2hqc2JwcE9mL1hoY041dGlhTU1oOThxdi9PS2x1?=
 =?utf-8?B?ZWFtL2FEcG9keFBLdEphS0VCMDNrYVFod1NkSEl3c0lER3RkdUU3a0JmSmJ0?=
 =?utf-8?B?Yk9yUC9zU21FUUNyZlc2U3gxanI3ZTVSL2d5V00wL2xJSEk3aitDM1FoTzBm?=
 =?utf-8?B?Mm1HcE84QzdpWWZnVGV4eEhWRENjY2Vqenc3ZkVmSmlkWHp4YStHek5aMVBv?=
 =?utf-8?B?b2FIZjlNbWh0Yk4zTW5PaytlSzV2U0xWZFF4OFhGaXpCSWZwOEhFTzR6WWJC?=
 =?utf-8?B?MkZnNzZWUTJuYU9kR1U5UHZJRis4YXlaelBDR1ArYndjcXFEWmxsOEJqNDBS?=
 =?utf-8?B?MVUzU0Z2Rml6MzFqSXdROGY3QmhlMVJMOHN6WTNQZjJuRFZ0d254N2FlSzhU?=
 =?utf-8?B?akpDMFM0bXR4b1NDb0VDWUJ2SUFXakk3M2FwaEJka2lqSzJkTHk0VzBERURS?=
 =?utf-8?B?K2xNL1YxS25KNkJnalUwYm9tMFN5dFhML1loMUNzZmpUVWZyU1M3S2ZTQWdx?=
 =?utf-8?B?aTVqakYzbERPSFpZZ1NnRmkxdnJ2V1kzTHlhWUk0SFBlMU9pYzJCOVdEOEFz?=
 =?utf-8?B?MDlnYzIvWU5STnZtU1B4OUNUS2NKcEpJK1RIelJJYU1tbzBvRGhwYndzNmk1?=
 =?utf-8?B?UmdBTW4vdFVwOXBUWTBpNVl4dnZCa0c2UlMwTUMxN2hkMnF2WDBMNzNwUjZj?=
 =?utf-8?B?bUhkUXpXTEEvY0pYUk9XdmRENnJuc01JcGhMaWdFWFIrMURzekYyeUZZZmR2?=
 =?utf-8?B?eS9WNndQd1JqR1ZqN0N1VXhJbU53czNFeDRmeUpicnBrMTBrZEF2VElsclFs?=
 =?utf-8?B?UXhCeElZQ3RsTHRSZkx6aHEzY3dYRDE0VWh6VjJpVGJLa2JUaVNaRUE5ak1q?=
 =?utf-8?B?bGYzaVRDNnZhYW41TURLaUNMVnFaKzVZUU91QXdjYmR2MlY3Mm4rdUsvWHJT?=
 =?utf-8?B?UjJZQTBsU1NpeElYYlR6N1lIdGUzQVBWMUFqS2Y4SUl5VmZ4cTR2T2UrSUNL?=
 =?utf-8?B?anhOaGE2Z3J5OTQ1b3NsbFYxZjNVa2VORThPd0ZGWHdrWjJQdXVGYlVJMHJU?=
 =?utf-8?B?a0pkb0QyK3E4ZHFtVDEwOTdsaTYxSUJ4TVRsemQ4RjNQaHVid2l3dENyYXdY?=
 =?utf-8?B?ZEdnS2NKczdmMWhlU2M1dDMyYncvbWg3Uk9rUFUzMitqR2FuTU5Ed2FJcmFO?=
 =?utf-8?B?bWUzWmErTk1ScUZWUDgvM0UweGFsc0d3Y3E0N0xLQmxFVXZWNkFjWERiZFVZ?=
 =?utf-8?B?R1ZLbHBVZ0c2RnBYTElyYmJuZVBtaThZQVo3V0F5NkpqdDZzcVp5L2prc3dL?=
 =?utf-8?B?UXhoVU8xV3RPV3FsUEc0Yk5BQjhhK1M2cldMWTg4M3FYSjJWSHhsTURtQ2Zk?=
 =?utf-8?B?SzliLzB3Rjk3ZHlQYlkrSXY1UnF0VzlsUEpVNU5hbERQZi9nTzhZKzJiYlJy?=
 =?utf-8?B?aEVDQVFGcys5U2tjdXlvT1JQOUtQZEhBQVdCMm56UkNFMW5aUzg0L09vTlNR?=
 =?utf-8?B?K0xHTnhKejlIYjYrMjhUazcwT2wyWlVNZzk1R01naWV0VkFaMHBSWjYySkZJ?=
 =?utf-8?B?NlFkMjlISUFIenk5Q2JTTmQ1TTVIdjBFUFM3UVVUN0dkUkNXdkVzOFNhZTQx?=
 =?utf-8?B?aGlJaHphVmhKSU9RTTluaDBXMDMxZnJxNnFBTEs0ay9oUnZkbDl2MFVRaTdG?=
 =?utf-8?B?bFJEdElKV0FkWStpUmhzSXY0clp0RFV0Z1NRUUVrWm8veVhociswU3U2dXBl?=
 =?utf-8?B?R21jcnlDaERaVk5iMU5UeVN2RnZ6T0NwQTVZN3VBbEVDaXNTN2VadGZOTDF2?=
 =?utf-8?B?Q2Vpd253Q2wrVU9IVmZVa01ZQ2NpVzlGUlZRNCswNngyQmU3NHpTK1lZQWk2?=
 =?utf-8?Q?acfy7xFeQysLBFRK1idSYtM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09159b9c-90c9-43e1-0088-08dd96e1fe29
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 14:32:33.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ahjXNjiwV1z75hTgiNQOBnunzcCfEDuXMiPtL55hZffPysPTcKWXUJbZGFIIKCIb/Z6qzaPEFb6Jka2N2zncg3HVH3xTN5xAizerbDWwK6n6KvJdEbPkRHmcb3rx80X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13962

Hi Jacopo, Dan,
Thanks for your comments! :)

On 19/05/25 16:09, Jacopo Mondi wrote:
> Hi Dan
> 
> On Mon, May 19, 2025 at 02:07:04PM +0100, Dan Scally wrote:
>> Hi again
>>
>> On 15/05/2025 12:59, Lad, Prabhakar wrote:
>>> Hi Tommaso,
>>>
>>> On Fri, May 9, 2025 at 4:41 PM Tommaso Merciai
>>> <tommaso.merciai.xr@bp.renesas.com> wrote:
>>>> Hi Jacopo,
>>>> Thanks for your comment.
>>>>
>>>> On 09/05/25 16:50, Jacopo Mondi wrote:
>>>>> Hi Tommaso
>>>>>
>>>>> On Fri, May 09, 2025 at 04:17:34PM +0200, Tommaso Merciai wrote:
>>>>>> Hi Daniel,
>>>>>> Thanks for your patch.
>>>>>>
>>>>>> On Tue, May 06, 2025 at 01:50:12PM +0100, Daniel Scally wrote:
>>>>>>> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>>>>>>
>>>>>>> The rzg2l_csi2_calc_mbps() function currently tries to calculate the
>>>>>>> link frequency for a CSI2 bus using the V4L2_CID_PIXEL_RATE control
>>>>>>> of the remote subdevice. Switch the function to v4l2_get_link_freq()
>>>>>>> which correctly targets V4L2_CID_LINK_FREQ before falling back on
>>>>>>> V4L2_CID_PIXEL_RATE if the former is unavailable.
>>>>>>>
>>>>>>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>>>>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>>>>> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>>>>> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
>>>>>>> ---
>>>>>>> Changes in v4:
>>>>>>>
>>>>>>>       - Used separate s64 variable as return value for v4l2_get_link_freq()
>>>>>>>         and as the mbps variable for do_div() to avoid compilation warnings.
>>>>>>>
>>>>>>> Changes in v3:
>>>>>>>
>>>>>>>       - Fixed mbps sign
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>>
>>>>>>>       - None
>>>>>>>
>>>>>>>     .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 27 +++++++++----------
>>>>>>>     1 file changed, 12 insertions(+), 15 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>>>>>> index 9243306e2aa9..8870c2cb8104 100644
>>>>>>> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>>>>>> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
>>>>>>> @@ -282,28 +282,25 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
>>>>>>>       const struct rzg2l_csi2_format *format;
>>>>>>>       const struct v4l2_mbus_framefmt *fmt;
>>>>>>>       struct v4l2_subdev_state *state;
>>>>>>> -   struct v4l2_ctrl *ctrl;
>>>>>>>       u64 mbps;
>>>>>>> -
>>>>>>> -   /* Read the pixel rate control from remote. */
>>>>>>> -   ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
>>>>>>> -   if (!ctrl) {
>>>>>>> -           dev_err(csi2->dev, "no pixel rate control in subdev %s\n",
>>>>>>> -                   source->name);
>>>>>>> -           return -EINVAL;
>>>>>>> -   }
>>>>>>> +   s64 ret;
>>>>>>>
>>>>>>>       state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
>>>>>>>       fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
>>>>>>>       format = rzg2l_csi2_code_to_fmt(fmt->code);
>>>>>>>       v4l2_subdev_unlock_state(state);
>>>>>>>
>>>>>>> -   /*
>>>>>>> -    * Calculate hsfreq in Mbps
>>>>>>> -    * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>>>>>> -    */
>>>>>>> -   mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
>>>>>>> -   do_div(mbps, csi2->lanes * 1000000);
>>>>>>> +   /* Read the link frequency from remote subdevice. */
>>>>>>> +   ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
>>>>>>> +                            csi2->lanes);
>>> div needs to be updated in v4l2_get_link_freq() as below so that when
>>> subdev has only V4L2_CID_PIXEL_RATE we get the correct value.
>>>
>>>           ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
>>> -                                csi2->lanes);
>>> +                                csi2->lanes * 2);
>>>
>>>>>>> +   if (ret < 0) {
>>>>>>> +           dev_err(csi2->dev, "can't retrieve link freq from subdev %s\n",
>>>>>>> +                   source->name);
>>>>>>> +           return -EINVAL;
>>>>>>> +   }
>>>>>>> +
>>>>>>> +   mbps = ret;
>>>>>>> +   do_div(mbps, 1000000);
>>>>>>>
>>>>>>>       return mbps;
>>>>>>>     }
>>>>>> I tested this series with an imx219 image sensor connected to the CSI-2
>>>>>> RX IP of RZ/G3E:
>>>>>>
>>>>>> Some notes:
>>>>>>
>>>>>>     - pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample
>>>>>>     - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>>>>>
>>>>>> Then hsfreq should be:
>>>>> The old code seems to call 'hsfreq' the per-lane bandwidth
>>>>>
>>>>> -      * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
>>>>>
>>>>> And not the per-lane frequency as the variable name and the commit message
>>>>> suggest
>>>>>
>>>>>>     - hsfreq = link_freq * 2
>>>>> if that's the intention, due to CSI-2 DDR, then you're correct I
>>>>> think ?
>>>>>
>>>>> Seeing that also Laurent has reviewed it, and Prabhakar tested it, I wonder
>>>>> if we all have missed that the original code didn't have a / 2
>>> I agree the orignal code missed a / 2. I think we need a fixup patch
>>> (so that this can be backported) and then this change to use
>>> v4l2_get_link_freq().
>>>
>>>>> Dan, did you ever notice issues during your testing ?
>>>>>
>>>>> Also, with the introduction of 15f0035bfd0a ("media: v4l: Support
>>>>> passing media pad argument to v4l2_get_link_freq()") it's probably now
>>>>> better to pass the source's pad to v4l2_get_link_freq() ?
>>>>>
>>>>>> Please correct me if I'm wrong.
>>>>>>
>>>>>>
>>>>>> After applying this series. I'm getting the following issue testing the
>>>>>> imx219 sensor with SRGGB8_1X8 and SGRBG10_1X10 color format.
>>>>> Does the error go away if you multiply the link_freq by 2 ?
>>>> Yes the error goes away on my side using:
>>>>
>>>> mbps = ret * 2;
>>>>
>>> I tested the above with an OV5645 sensor and see no issues.
>>
>>
>> Actually, I'm missing something here. Tommaso, you're using an imx219? So

Yes, tested with an imx219 image sensor.

>> V4L2_CID_LINK_FREQ should be 456000000 and V4L2_CID_PIXEL_RATE should be
>> 182400000. The original calculation (assuming a 10-bit format and 2 lanes)
>> is 182400000 * 10 / (2 * 1000000) = 912. That's double the link frequency in
>> Mbps (456) so I understand that the / 2 was missing...but the function with
>> this patch applied should return 456 already...so if that's the correct
>> value then I'm confused as to why you'd be seeing errors and why multiplying
>> the return by 2 would fix them. What am I missing?
> 
> It's the other way around actually.
> 
> The function needs to calculate the lane bandwidth not the linke frequency (*),
> and as you confirmed the original code returned 912 Mbps.
> 
> -	/*
> -	 * Calculate hsfreq in Mbps
> -	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
> -	 */
> -	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
> -	do_div(mbps, csi2->lanes * 1000000);
> 
> 
> The new code returns the link frequency instead
> 
> +	/* Read the link frequency from remote subdevice. */
> +	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> +				 csi2->lanes);
> +
> +	mbps = ret;
> +	do_div(mbps, 1000000);
> 
> Maybe I confused you when I've said "the original code didn't have a
> / 2" but what I meant is that the original code should have had a / 2
> to behave like the new version (but what we actually want is the new
> code to behave like the old one, not the other way around :)
> 
> so the new code should do
> 
>          mbps = ret * 2;
> 
> if it uses
> 
> 	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
> 				 csi2->lanes * 2);
> 
> Does it make sense ?

Thanks Jacopo. Agree.

Some formulas:
(please correct me if I'm wrong :) )


We have the following formula:

    vclk * bpp = hsclk * 8 * lanes
    hsclk(bit) = hsclk(byte) * 8 = hsfreq

Then:

  - hsfreq = (vclk * bpp) / lanes
  - hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes

Formula for link_freq:

     hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
     pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample

Rewriting the pixel_rate formula as:

     (pixel_rate * bits_per_sample) / nr_of_lanes = link_freq * 2

Then:
     hsfreq = link_freq * 2
---

Old code:

-	/*
-	 * Calculate hsfreq in Mbps
-	 * hsfreq = (pixel_rate * bits_per_sample) / number_of_lanes
-	 */
-	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
-	do_div(mbps, csi2->lanes * 1000000);

⁠mbps =   (182400000 * 10) / 2 = 912000000 --> 912000000 / 1000000 = 912
---

New code:

+	/* Read the link frequency from remote subdevice. */
+	ret = v4l2_get_link_freq(source->ctrl_handler, format->bpp,
+				 csi2->lanes);
+
+	mbps = ret;
+	do_div(mbps, 1000000);

⁠mbps =   (456000000 / 1000000) = 456 (I think is wrong missing *2 based 
on the formula)

Please let me know if I'm missing somenthing.
Thanks in advance.

Thanks & Regards,
Tommaso

> 
> 
> 
> (*) Table 35.7 of the RZ/G2LC datasheet doesn't actually specify that,
> but given that all values are in Mbps and not in MHz, and the old code
> calculaates the bandwidth and not link frequency, it's fair to assume this
> I guess...
> 
>>
>>
>> Thanks
>>
>> Dan
>>
>>> Cheers,
>>> Prabhakar


