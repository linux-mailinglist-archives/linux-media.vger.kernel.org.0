Return-Path: <linux-media+bounces-60630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGsULR5S+2n+ZQMAu9opvQ
	(envelope-from <linux-media+bounces-60630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:37:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CAF4DC545
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 16:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87B4D3070212
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B7B48032C;
	Wed,  6 May 2026 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="YdMFCWvO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B4446AF0F;
	Wed,  6 May 2026 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077842; cv=fail; b=rZNSPY0Pbp8FEpa9jTNZ5oTKSB23/GOcvQw6lBlJc37EccqZzD3rlZv6inf16gnCVCSCOl9tcy2TqNwQfTCufzVYp87c0exD4Afk9ELXPj3rz0INskShGRX56eJaGnZ97it6Z8HrvU42emCc4R+cW+As/NprVtM1AuqZJijww0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077842; c=relaxed/simple;
	bh=qwanXmIm2UI6dQJShuxpTlfHAF5RRkVKoJT0xMP9iHA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lpWGf2a5I055Yr5xPXfdRLgeci57Spl7QDN012LkUUnMcXrwVI+K1+SkSJ5iBbMI36Fe7SbdBG0X8TW2ddYcoNOr2aJ72yn8HvTwpen9QLxZ2m1McYmWe4dm1TWT9KYaMIcifFQxMabFKLCAJVhWA/r/kVBlcZAmC4cVQTuC+Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=YdMFCWvO; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6464SjjU839905;
	Wed, 6 May 2026 07:30:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=hKG5+EPm4nWlBOizzK6V9NtHEbhDR4iIQ3nW728+2zk=; b=
	YdMFCWvOV/yvKS67DV2fLcXaSza6wuWG3wDtjNaP9cmOsdYnVSV/+543LyOWok8k
	ud26HvEFwCLfRptaT0pFE/RXCqE+vbcNJ1tQwoTkpDo7Mx3vjxcKZgahRr+EKFE0
	WWoZd5hJCiQwv+ZADb5wAfh+p6T4FOdqMLFgOtE5rvw1Tb62YMjykzuQavMQg+/j
	M0pVg/BH5QPZdlCxcyN1KIHFGGKFomnjoUA0R2ZvRHVpvVtiUWvd4cJ31mAHiL63
	8cqSwd+R7lBHt3ZtvfT0IhDYyQXvBBXfuV72fkAdixd5KxHduWatomoEMExyXKyN
	Hx5W1JfgC7X0EtRAOrRxOw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsdct80-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 07:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSKulB10EOcgUkWqdkPokTZfRgVkFMllo09US8T/mKJsOSow26B9iJXyPWWNoIZgd7XnEQYtsGWqJLvRdWwbeVi/6g+HY3yuFlfl6oiFAx/kAF2QPxuMTybmquvlzZ1BP9breJlprVgaLOW2tGCYSM455G4uAcb64N9Xt/UvJLzbeMRsgqnRHmy0IFhB8zBdT1J2o82S4XS/0YMGqKuyclywwsOFTDC7tHkKphWQ6MDseBDYeAMrnO8PRjfihSwYFU/aXU8TysTIwMF+8cuEfGesw2bKoc7Dw+5IdNpxCfLvb2KIc8fT3abZy9YAj6GP8QGMqtIB83btAvB3qeaApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKG5+EPm4nWlBOizzK6V9NtHEbhDR4iIQ3nW728+2zk=;
 b=HFgC7g5QAxBhFmLPgq0+fF3d7oqwm58vBESkgEOLf1v5K6cFE0vA3rsETp4GX278d9V/HYyQGhXOKs1JKyt3xohDfMLUNdA+sNUANeUwALdeHLmw1K262AkHjUQ7H6WGKjTTc90V2cCA+aS4JHOG8rDwJcmUWSXdr6aQ8nuBHOR525PjE2MYJobe5Tq95Lm0iu+7L/L3yHjHbqpX21yi97ZhEx+ORPL+uk0Q5zwey0aQXA02KTlIAKMgUSg1Tv3cOeVT0Vr+Upcjb08hfvSjeSwPtDrhdRd3AIb5R8/5uJpoRlsdUoqtJLFTcGEH67WbRn36NZ4V/meYg5BRWkxpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:30:07 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 14:30:07 +0000
Message-ID: <f1450911-849f-4216-a92f-b301fabd7e37@windriver.com>
Date: Wed, 6 May 2026 22:29:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: imx8-isi: fix isi->pipes memory leak in
 probe and remove
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-4-xiaolei.wang@windriver.com>
 <20260506124109.GP1598374@killaraus.ideasonboard.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20260506124109.GP1598374@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To SN7PR11MB7017.namprd11.prod.outlook.com
 (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: e29decc5-6440-4226-8977-08deab7bf83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o65jc3KKQb/Htxp3H+xEdBbSoZPWPCO7adreEvRpU97oB9OBlYEZLyMo1pD/JTMZcR3zfMkUSQul1sX4zzCwb6r73PzybJ6xJ5OPWGV+EDOZDrVB5zehpSrRXZCwNWnBRHA6a+mM0qn9g/0nl/iqAqRuzPw0Gh+gfmXp7+ZZEWOddOrxRpzK7oDCra61YxbcOqDFmLQQ9VuyZ/sAlB+pJB5+WvPkSt/Zi2K3PoNTM/P2biWQ3pXclFVj0ZxVQCZioQi1Dd693T5/lqXAd7vSmB7Bl/wD/Ji6q5BlYoMVKcFC0JlXmclAoBML/9Z33CYssCYUUmWlzmGkg+8w5v86XfVGObh3l2kHWXssDOmtZ0+DN0b7/nEhiYks7xFfji0VDJFU0o8kO7AJqJ+x9bHE1sPOBiIE39Ogl3XkRVJ404BE8kGCEvzrKSrqlcAKZ4QFXPNMTpLPyHxLKAV/CWS27s8SKtTWYKWCZVBrq//S4gZ+F7c2nt0/KtTdR3huFexzMaF4hnSjyDbe47pT3s3lPLgDcBy/KjMFFMTi63ITgTJFV0Alf810CIjyZ9CY1jMWCxNNo3D2adIVOWlfFN/69A3egWgNN8NFaRTdp9altmNOsO+KTjyICHpalVhRCBD2YQeb3VhdtCgMRrf4tGEEpCtBFB03pvq/iLzXZ11YjqvREqHJE3Ns2pIqHqfp5Lzi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1FHYUkrT3FOdU9ad0tJRHY4OXBJRUFITlhZVjZ5Mlhhcm5aK2MrYmpCbUZs?=
 =?utf-8?B?eGtRNTVaaXN4ajU4Y3REVGFsZDA4U0EwZFE0bVFTa1JvSzRuVzZZOFpsQVhh?=
 =?utf-8?B?eTJjOTB5eTlHdUYzY05BV2N3YXNyeXNPcGx3dXNMLzdXckR4eU92VXU3Vms0?=
 =?utf-8?B?MUZPaEFRdGJITnVZVXRBdW44MElYY2xTb283Y3hSQTdEUDFhbnNBcThPT1c3?=
 =?utf-8?B?b3VkQWpDQzhvTEtIWFZPYmRYV2w5aGpVWWxQRmkwOGptaWNEdEdlOVNIY3kv?=
 =?utf-8?B?L2hOK0xTL25TRks3NnMzVUR6Q1dvMzVSZ2hURXRVL0dUYnEvMmlEYUVzbnJn?=
 =?utf-8?B?Si83dEFBQXArRHpQZGFXV1BFTGdUMEZpRVZLbnArbUkzVTFVeTlYeE9nUk5m?=
 =?utf-8?B?Z201UkllcFN0emF3QllpVFJVM2tHZGlyaEtOa3N1MjNkRVBkclIzYW0vZHBQ?=
 =?utf-8?B?V3pqamtmVk50ZTRhdUkrNVQ3Ym5zRS9RWEI0dXc0cUwrc21BUWpCK21SWVVY?=
 =?utf-8?B?bkhVWU5DVjNydjNmaG1SWjgxV3hlSnBGbTQvZ0ZyUDg0bWFlVnlyY3NubzhQ?=
 =?utf-8?B?Ti8wRlI3SFNMQU9MZHFEZmdNNDhpdTk1clRndU5VRWZ0Ymp6NWNrV1ZRcFRT?=
 =?utf-8?B?WFJaekw4Umc1TTJ2c2dKUlNId1pyRWFlMGRxeFFsUysxUGlzQXJWSWl6RjRR?=
 =?utf-8?B?NzN6UUNYSUNpOTcwKzEwbVJxY29oWlFTS3R1ZjQxRm1VVUdxOFZVVWdib2V6?=
 =?utf-8?B?WEhIbXRGOHBidk92UVRuazd1ZFUwZWxXLzNQOWdpeDFnRUM0eDVZTVhISklm?=
 =?utf-8?B?TDQ2MDl5WG1raHlNS0tUWkVQbGoxWmdaUkpOUE4yL3hUUWl6N3pCeTEzczly?=
 =?utf-8?B?a1k0azRUVE10UkR1ZUdPN0hHdlh0SW84eFBqTGZubjV5WEtpUTQ1YkxSaW5U?=
 =?utf-8?B?cVVCZysvNWlFODN6WnBYbjUzdFBOYmlhMWp4aXF5V3dldnk0QW1yVkZyaHhH?=
 =?utf-8?B?RVZPKzVmenBwZ3VxYVJMNUpYV3A0UnZjODYzaFl3MERKSUcvNjB6Um9SaUJr?=
 =?utf-8?B?bE5pRzNtYU54bGZkaU9RSGlnd2xYeDBlOExkSHJocTlzOHlLTjc3TktQWlJB?=
 =?utf-8?B?N2tqZURNQ3hwbUpyUmx4K2JrNWQ3TUdVM2JTcTg5eXZDclpwYkxaRTVHdXR3?=
 =?utf-8?B?bEVhQkU4NkRsUWxqSXVOUHNoaWlYdGZLWmpWbG9xcmFYdGs5MWs1MFRGNEdQ?=
 =?utf-8?B?MW41U0tvN1lpZnlXNUF2UDRTcWdFbkh6ekp6MEZ5M0UvODVNNkF5YVQ4MnBo?=
 =?utf-8?B?WVBwZDBpV1ZPZ1hYZ2V3eVhrMFloT2JFMVFKemp0OVdmdlhSbkg3NjVUOVRj?=
 =?utf-8?B?K0dxVkhaK0dCL2YwbmVWTGRDYlpRNWF4VHNoUkNabUFzZlNsU2xWcmtQOXkx?=
 =?utf-8?B?TExLQzQzTm5KYXcwdUFndmNsQkNoUkpHNUNHYnp1YVJuUHFxTVFiTTVqbm9R?=
 =?utf-8?B?eHdIVGY2NFcrQnRZdU9weGI4eWFZaVJyclRrRHBQQlYwS1RGZEQ2dW54Mmhj?=
 =?utf-8?B?SFJUVUJ5ZEFqeGZyckZrcDhXbkxpV1QvUFhVYW5hVzBYQ21XOFFOS2dLTjlV?=
 =?utf-8?B?b2FPQWRiVEJHUFgxSE9CeGpxdzZOSkhmZGJFdlRVNVlVcFB3WXJwNHZ6N0Jq?=
 =?utf-8?B?czV6YmFJVHhKazVWS285RVYyRTB1OTJYOG5KZVV4Yndnb3llckQ0NG1GZldq?=
 =?utf-8?B?MDl0Wk1mbWNwK2o1Q1prUzFic1c1ZU52TVRock91ck5QY3FYR1UvYlE2THFX?=
 =?utf-8?B?cGZGL2tUckxGOFJQRkJPU09FNlkwY3UrWTAzbnJ3UzloTjFxdWx0eHZSamdn?=
 =?utf-8?B?SWdreGRUWVkzMkxxbU1QUS9LS2J5UlN2WkQrcmVvWk53ZFRCKzlYdGxqZEhk?=
 =?utf-8?B?TlBDcTdWaWdKUGg2Z2JxSHlHWjZNM2RXTHhVVGRiSStMeFN2WTgzbTRULzVV?=
 =?utf-8?B?UWlxT2ZJTjJDanhvQTJqWkdIdFQvaTl3bHl1YzNENzY4Y2FlcWxacDRoM1pv?=
 =?utf-8?B?aUEzUXpycUR2ZUVteHgwWnkwczNLakdkR01vQjc4MUU2SVJqWXRNbE9GcGxU?=
 =?utf-8?B?eklQMk5CaW1TK3AvSHc1QlpvTGl3VFpDYWZuL1JoekEzVURvbEVOTndpcnVk?=
 =?utf-8?B?WXdIOVovQTZxcUN2akh0T3RrSE1vdkYxNGUyYlA2cDJRUVJ2WGhjeUQ2dXRw?=
 =?utf-8?B?NSsrdVRZd3BZUFU0TGZSZ3Q5U2x4ejdYM2VMaVZIckE0VEthWlhtVE1TSUtG?=
 =?utf-8?B?TkxXNlBHclQ5Y25zSjJMTzk4bkRIVGtmQ0tvREhBYXNVV3c1ZXJma0NZeU05?=
 =?utf-8?Q?fii2dkXKgHPF7GXUqbV+rNotaAqMaT0/NWaTsD+M4G+1s?=
X-MS-Exchange-AntiSpam-MessageData-1: HezACwuBROxf/7gUl9nEv5V7Pf1XhYhvrq0=
X-Exchange-RoutingPolicyChecked:
	HbHDaETiRasybkG4NLosHx3pMHQCiD163WrfWgylmR2aFQMekPhnBOWbT2gB7rZg72YMmQbUsRlz4ABJf37WSkna6XH/RzCBQobLaygtBKzKZ8YveHGB2V7EaXN1mcL5d+LVcQsdq22HrNTKoUSgCRp5xM5ZqLr+axVCe5OjDF2N+ZEp05pa+Bmvw85PQMuw9DAEywLBtb41aDy8j990lzL4D+eOUbDkW6FQp6RoBjbMvBpY9rjVyTiCS4H8yObNzr8Z9SH4iIgwUHFIo6h1L74WcnDZ4gcprk4fXLl1YVzH8BD9i93l4kbQ3c2dQE9qk0bA89jP5fywB/RC81Rigg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29decc5-6440-4226-8977-08deab7bf83e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:30:07.3378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/aZYTsfGUWg7eVTYrx9QRrO0wWPapfh/E2QbyMqTXL4PgTFiBIcCh7lplif1O0+9f14RQ2v7PQwoZDvGyQE0EBXb0iiOctNPp/Nwr37oig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-GUID: 0TseZaDbsDtEb-B09_VYtPdHAlZcpQLT
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fb5073 cx=c_pps
 a=33ZETTsaPBFHggYVnTYjDg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=t7CeM3EgAAAA:8 a=pSGOEcN3OSo_1E4YF8MA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 0TseZaDbsDtEb-B09_VYtPdHAlZcpQLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0MiBTYWx0ZWRfX1teWfrp+j6WI
 5De+rjWrGI8GZKflgqiPunexu4965dm3RSlX3vcj8zzyDVGQKYj3cJjLuxhk0JpRdcmI55BJXHd
 33UHi4T1bghxCG2r+/FwFFE7PtOsGQf7EcKzjK3CfqKCXXbFRS++FRFgAJmui/Il44vFshF462U
 JX2K5HvhAQ4IxpGKn25ZUt3VOXGc3MN3gE03IFUiMOmgA5r8GwGSvuEx//gtE4kkROeGb6oFhgh
 srKBXzvdgy1N3r8kT9ujQ91OC39DxscsLlcdlVWErtmwbi0n8R+kTPqrQz7aC/mLOGIihDKga6z
 baBdxQ/BQPJP3ynQJcazHuFU19y8ot4IeQDjtTxQhDKgLg+D66cLQGPN4Jhmh90rYHZLK42MbzS
 sH8EevacLGpAf16BwlINzURaF7HpxBqEqbulM84qOQJKyJ84sQrBm6FQ3h26OmaETGhB0duNlLo
 WrEVgPuUnpGMam/z/Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060142
X-Rspamd-Queue-Id: 27CAF4DC545
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-60630-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:email,windriver.com:dkim,windriver.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Laurent,

Thanks for the review

On 5/6/26 20:41, Laurent Pinchart wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hello Xiaolei,
>
> Thank you for the patch.
>
> On Wed, May 06, 2026 at 11:12:09AM +0800, Xiaolei Wang wrote:
>> mxc_isi_probe() allocates isi->pipes with kzalloc_objs() but never
>> frees it on any probe failure path or in mxc_isi_remove(), leaking
>> the allocation on every failed probe and every normal unbind.
>>
>> Fix this by switching from kzalloc_objs() to devm_kcalloc(), which
>> ties the allocation lifetime to the device and eliminates the need
>> for explicit kfree() in all error paths and in mxc_isi_remove().
> There's ongoing work to add a devm_kzalloc_objs(), to I'd rather not
> revert to kcalloc. If you want to fix this leak now without waiting for
> devm_kzalloc_objs(), I would prefer adding kfree() in error paths and in
> mxc_isi_remove().

Thanks for the suggestion. I agree that waiting for devm_kzalloc_objs()

is the reasonable approach.

thanks

xiaolei

>
>> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>> index 2d639b789910..2b76fb9c18f6 100644
>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
>> @@ -485,7 +485,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
>>
>>        isi->pdata = of_device_get_match_data(dev);
>>
>> -     isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
>> +     isi->pipes = devm_kcalloc(dev, isi->pdata->num_channels,
>> +                               sizeof(*isi->pipes), GFP_KERNEL);
>>        if (!isi->pipes)
>>                return -ENOMEM;
>>
> --
> Regards,
>
> Laurent Pinchart

