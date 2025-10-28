Return-Path: <linux-media+bounces-45801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 60259C1455D
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 135DC4E6A7B
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 11:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13654306B3D;
	Tue, 28 Oct 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="r4YwicC3"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022086.outbound.protection.outlook.com [40.107.75.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C021B1BC;
	Tue, 28 Oct 2025 11:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761650561; cv=fail; b=ubQ46QTOJwlkhEgVRFSOrfDZzufWLUd34MmRHTaiImur3FJiECGe4rOdhAn1Q0lnPFMlM8jkUsXi13qAsBBgt0Q0Syt76P7te6JD7aVEf0pE0Bn7pyOjnP29gmaGOQjGyFGj0haX1Kld5zMw4UYYYJa5ygmmVKW/wyP1IDvjsaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761650561; c=relaxed/simple;
	bh=HmaYzJk/CnBVfZ0pRh1HRf9NDb7K9FOFUvgDkEO2W5o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W4U0Rw2OxqKClm8wKdXZG+FjZqk/p0EiuAlOj2kRuCctbusFIiE4yvPFMauN0+K8U+bNuWDlP9DG2ebEneDOL8AizzlhnIGZArho1/aZeGmC++YbDVOWk9YleKfPOtATf3tBUbunmpxQSNtMwAZxEpk/hiFcBBQx6Fpc7t2CiYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=r4YwicC3; arc=fail smtp.client-ip=40.107.75.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjvgjfW32nGvZS9PcOuq9mB5qoZZdpFXZuSrowQYx679zmMt8ntNJ/I2r7DlRivw1s9lt+1gzH0H6PTWOlE+UENPb14JrTrzjhX09jjajg3U183Ley6pRon0lGdYLxg2LyOmRCI/y7O1UGB6KR9idTSWH6awjFHRG+K7QZQg8rZMCFeXK0E+Ll4oFHPLoZCwEsQTREYBIlv89YLreWBhU3cOluXj0/MJFBYJguFpha1ZEYSGnoSx0UZjWS0f/s6BTYSCT+8WyUxkk0405B9J1RPAZv4X7PrjR6JlKJYNKlIKNbzlZrc5EUQ2WrO07Dd1A3FbeJ7BZrxZGpRzfG9aqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7KgR3hfWgVSFhXuUZKZkHEd57Tx3jAE76yw2o0zWzY=;
 b=NJTw01rQXGLbF29/uD38AbCLfqKtuoJQVqL43sN27lsX7NjcTSUZtJKQYeCnSDe/keuA4I2qI3S/7cPk/7t9ptQyP78VSWAylpfGXieQttB+1Loe6HMLwJ1gH6nceIwLSuu29Bddg3QVsy2k4wgj5/tE7j/+jc3hYojj+WbJAwT/2DwG8tBJHOCu2R1mJ7g5DvjMshMVaRYPffyWIa4/eqo/y30nSv0ufpVYkSZ82KPXOq7KPCDQtocYnRGHKWG10yx0aMAdFVzC+bcJaG+gyjainRj/yC6fUEdQKXaKhiCdXpJ/igeS7FR5o1PDDO/lBGideS8v7qrVb6hpqgNjHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7KgR3hfWgVSFhXuUZKZkHEd57Tx3jAE76yw2o0zWzY=;
 b=r4YwicC33aZUf9mBtT1ElIpKTdc1rG/oGRf1ZztoATuvhiGG1nRtMxY8KVqMKETw9X6+xd0Zdej19dE4P4wMpeEhVu40AMC7C7TYmA/O/0weV1Bd0OA7NDSdD/921eFdQ5KB4fiAsn18MYNVYpDMpLXwoImcP3aKI4PYc7tl82e4XuKuRexjyCJkX2bIVALq8804xY3x5ThAWtJh4ENjO3orjihQInYWXqs1FEyAuaGLPFAAAFCB5qU3lYJJdsVgd3UY76iLjktCbpOvFaCyLvp/bf3ZBzxjEIeqQqR+sDriIq+NHA1gdk+BakKlIYtx6tEhGwUhWlWQhJ3lvNKfzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com (2603:1096:400:5e::9)
 by TYSPR03MB7784.apcprd03.prod.outlook.com (2603:1096:400:42a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Tue, 28 Oct
 2025 11:22:36 +0000
Received: from TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e]) by TYZPR03MB5536.apcprd03.prod.outlook.com
 ([fe80::9a50:1a8:fa6a:579e%7]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:22:36 +0000
Message-ID: <c1de12a1-a9ee-4d8f-957c-811b4eb33890@amlogic.com>
Date: Tue, 28 Oct 2025 19:22:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] decoder: Add V4L2 stateless H.264 decoder driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <20251027-b4-s4-vdec-upstream-v1-3-620401813b5d@amlogic.com>
 <a2ec6794-1131-421e-848b-3fddd39191e2@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <a2ec6794-1131-421e-848b-3fddd39191e2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0116.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::20) To TYZPR03MB5536.apcprd03.prod.outlook.com
 (2603:1096:400:5e::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5536:EE_|TYSPR03MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 074bea4f-bdde-4731-90c9-08de16144b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTJDT0NMTDU4S1JqUkFQK3R2S3pySWNaNmZuK2NKYm12MGR0TWRsbUo2elR0?=
 =?utf-8?B?N3BUREdLLy9SRnU0NTUrUytvQXBOWmtZOUZoRmdDYlR4ZTcvV2ZsZjdCNEdO?=
 =?utf-8?B?NHRCYzE5RjQxSWg0Mnd1Tm04OTE3YXlZK1NCQ05YdjBrcDk1R050UXFaa3Bt?=
 =?utf-8?B?UGpmQXlDRm56TXlUaktRREpBRFN3RlBzelpFaDNUVHlpb2tPUFFaS3ZUQjhh?=
 =?utf-8?B?MFVVWkhMTm9kb0drTzU1QW5WOUg1QytkajdlYlozWXQyYWljWGxKUEY4UDF1?=
 =?utf-8?B?SVdqVTRQbnVwWDZMMk0vRnpWSC9HQU1wdmRXMG5uc0ZsczBIYjdFSmpDdVUw?=
 =?utf-8?B?R3QyRG85ZGlvMmc3OTR0MzYxMDMyT09Wc1FrK1VFdEVwVUpsV2pPazQ5NCtS?=
 =?utf-8?B?clBGaWc2TVBFc1doOHRabkEyK2dhREt1UFNmNkttTW91dTJXSG16cVBXWU8y?=
 =?utf-8?B?UVU0VkdNbVFXR0dQRFRaWUxIOWhsR1grM2cybTQ0REVHdE1mczlseW5JM1pK?=
 =?utf-8?B?Yk1LRkZhYnZtR1FvTkRRNXpDcHBubG1LanRzOFkvUDJUMXMzVit5cWVYQUNW?=
 =?utf-8?B?MHJqSUpRTHlFa0xQOWxZYk4rWTRhdmUxNTVTWDFTdEhSbWVZRDIxNlhETWxo?=
 =?utf-8?B?QW8rSG5MQVBRNEVhZjYvMVZsbjhxcG03WWNQRlpLbmhPdTEzTEV4SjF0RGdV?=
 =?utf-8?B?Y2p1T1JUNUp0L1IyRWtDMHVoQlllZXFUTHlYbHhFblkyTHF6RVN3a3pLMnZl?=
 =?utf-8?B?VFNSQkVKbldVb3Q5MVlBYUJ4L2h3cHpoUFhoeCtBL09Oc0E1cGRLS1VzQy81?=
 =?utf-8?B?RWlYQUlEWE1XdTc2Rytwb1QzM3gydnlWcENvbTE2Z3oyOVFpTjVyU1NZNWI5?=
 =?utf-8?B?RXRvK2NZS1h6bis4TkNqSXlsL2szQUJBN2dFTTJ4STZmdWlseFB2ZEpYOFF4?=
 =?utf-8?B?QWNyQ3BXTVBON0tJdlYvWlFZSTlNc0VmT09GSjNXWDBJdkx5RW04T2lqU0lz?=
 =?utf-8?B?WGc0Rm51NmdJcFFHVzVOVTN4L1VlTGFEMWtPb3Y4MWNSN0V4M1dUVW9oRkZv?=
 =?utf-8?B?YVRrOXZvQ201QW1Tc1RpaHg5cElEYldsZnB0VjVnQnJKRVQwZktsUHlGdjEz?=
 =?utf-8?B?VXJsWWNCWUZLWk5Ld1VGSkJrZ0R4TEYrcnhPdzMrbGpxc3VIaUcxdkVmY2NG?=
 =?utf-8?B?K21yUzJZSU92UXpNRjQwTmRVWCtzSDRMQnczV2RVWUYxMzM1MnVDRXJ4bnVZ?=
 =?utf-8?B?dlVxVnZxNHVyNE1wMGJycGJjVVp6cVhMVEsrTWUyai9zRlIxYlI1cU8vQUk1?=
 =?utf-8?B?VGQ5WEpiUjZ4WmlsTXo3UnpBd2w1M095b1FOQ0t4aml3citOMU9JbE1DdzRl?=
 =?utf-8?B?b2RaN2xXSG9PNnA5V3NKOTNQang2VWpMU3liUnQwYlNDQUdrNm9kUDV3UlhX?=
 =?utf-8?B?ZjA3ZUJldnROQk4vYWtaTmFQd29xeUY0TWZ5U3VTRk5WU1VDUVhiZEpad3I3?=
 =?utf-8?B?L1o2QWxJN0poOTNTTCt6TDdLNDFteTZSM25aN3hPN0ozalQ4aUdLY1NnRUhT?=
 =?utf-8?B?N05TOVkwbzI5VzZMeXVyMHdYOVlPM0EwbUsrQThWTldoOEhoQkJMYTVEV1Fs?=
 =?utf-8?B?bDJwTUhvSnJqK1YzVUVwbUI4Q2ZCRXpxUXM3OUFGWGx6aW4rQkxMTHk1MFdx?=
 =?utf-8?B?cDF3cEtCVGR3OHNXK2VidDBBdEJnaVhkaytlU2dQaVBLMUJHR2pJQVlhV3Iv?=
 =?utf-8?B?anRuMG0vNEpkclMraitFcE13YmxXSGpQb2hpa2s4OGlCRlZyOEE2NU5LOE5Y?=
 =?utf-8?B?VURsZGtVZlFpV2NHZWU3K1NyNUJIMHVBaEwwMDBaUlhYYmQzenQxTWpsYWtO?=
 =?utf-8?B?NFNmZVdqV3VKQ0NoUTJ2dXlvcjd6amFrcm9BQ1BFenRwb2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5536.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUZEOVI1dUd2M1pNY1FxcVMyK0RuRDhHT2FiZkZrT3ZLbHZuMno3Wldremg4?=
 =?utf-8?B?UmtIaFlEaEQzOGVBZVZNSDV2RElpenZJV3p2dnA0dmgxa2QwRC9LVU5nZ3Nu?=
 =?utf-8?B?UW5ralc3aThhNHBHSElPdG5VVDlVNTVqUU9rckgvajUza3dsYWErWVVrS1Az?=
 =?utf-8?B?cnBwaFJSRDVSdURKbEc1Z3M3QkVoVWVUTzJqdmZsdVRSRHFVaWlxUU9WQ2pP?=
 =?utf-8?B?VjJRcVFXMVNTTG1uZGpwUGFna2VDT1JmY3JkN05FNkJLYTRmZzE5UlJWd2Ft?=
 =?utf-8?B?dDlkVFMwV1E0M3AzUTVEaDlOU2NTMUlhdS9MUnhlSnpYY0VnM2Jrb0RjeTJU?=
 =?utf-8?B?dWhFOFBxMWlacGc1OUgzMWlxeXBGVmpFR0xCOHNDdU5raU4xL2dtRFlMTWR5?=
 =?utf-8?B?cTNHZThGOVVBTW5IWmtmRWZuNnlkTHpYSzBMMWN2enFhbE9HeDdKK1c2UDNa?=
 =?utf-8?B?Z096cm9BOU8zZDd2WUxvb0lUV1pYWmZTSVJDOEpBLy9WelYzelloSVh5TS9J?=
 =?utf-8?B?UllkMkVpU0FTd0lqMzNKUlBBQ0hDUFQ2djhXWEpVOENXU05Nbk5MQ0xqVE1W?=
 =?utf-8?B?UzZvUG9xSGxpUStaV2xxY0VMNGRqUUhzdHVtaUovd0ZoZEwzdGRJTmJ6dHhY?=
 =?utf-8?B?NTFJWG1DUWIrL2pJbnlSU3pkLy9RVWJQK0dUSnh2M1Vya1ZQV1Fhd25TNFR6?=
 =?utf-8?B?SWlrU3BiUXlZZWFWOXFCdlY4RWczVGJZQkVLV3Q0SXFRK2VVSkg0L1gwbHlp?=
 =?utf-8?B?UFBWZzZ1R1gxY1dRck9nbnRQcFlQNld4N0pnOTBYa1k4QTMya05ESEdKZmt2?=
 =?utf-8?B?Y3BwVkkra0RPMG91SjhNL3I0NU42OFF0d2NucnFibWhsUTlFQmVDK1FnMk9V?=
 =?utf-8?B?TFJ5RnhoUjYxT3NaZm1udkxWeEt6QlBsODVIZ25jaTFlMGNYemhWbEhYaDM4?=
 =?utf-8?B?ZTdXNTdrTHl4Ly9uWlcxK1d5RTlnWWNkcHRhYWV4M1l2V0xwSmQwRFY4eXBu?=
 =?utf-8?B?MWpOUmFTOGtTWUxyTHpVb21Jam93V3c3U1lHMENLK0pjRnFPVlMyMFBXRng2?=
 =?utf-8?B?cFRuUHBrc3hYR20yQ2hSZS9kRHVvRHdObjVTK0ZLK05WYlhHYkhxRXVFaEtT?=
 =?utf-8?B?ZTY0MHZ2Q2NBelhzVnpkRWxVYVM2N1Zja1hhcG1KclZBSlVJZUh3Vk5IMkxK?=
 =?utf-8?B?REllM09Md1UyVWdtc3lNNUp4ZFRBa2JkREZOTTJRMXZYSVV4RGJZZUYvbEoy?=
 =?utf-8?B?aUFFSFRXRjBwR0VvTmFjL1p6S0RmMHR6b25MejhpemdxT2ZaRmNTM3VscTJM?=
 =?utf-8?B?cG9kRGlqTmJ3RGk5d05yZ1lMaUhOdFRadzJpSUpGUGM1T29OL1NKUC91Mk16?=
 =?utf-8?B?T2NGSUNDa3ZGU1QyNXBNc0tkWWUvRXMwakluME50SEIxVjJkRnNXVitvREx2?=
 =?utf-8?B?SWZoSjl4cUlHeHQ3U1F6eHl3V2pkMWdTbDRhdC8wNlVkb2NXMU1rMlg0Q1NT?=
 =?utf-8?B?VnZ3bk5qY0pRNHpuN2dmWTd3YXFSR291ZFcwVXVjUkRGQmhyYy82NWFlc09n?=
 =?utf-8?B?T3JidjBqRWR6U1NHVXFzZCswVmtzU0ExVjNCMFdRTzVjUDUxbHFOc1dNRG54?=
 =?utf-8?B?Y1pOMjZWd1FhOG14VCswN3ZEYTdLN3FQN1JBU1VFWndhcEFtU1JaRUVndzJi?=
 =?utf-8?B?alVCWHY1WGh2TUpoMWhFTXlPK3RDdlFBNFI2TWNpNlF2czJGOXkvY1BHUjk4?=
 =?utf-8?B?NGw5V2FsY0pncEZxOC9JWlZsckx6UVhHeGcvdjlTajZnbTh1cnZ0ZmVXdTV5?=
 =?utf-8?B?aXNnNXowbUNER1Q5YWp3QzAzdGxWSlBvSkM1ekVHaTU4dzdVRnJoSlY2L2JX?=
 =?utf-8?B?YXJGZmpXWDhwcjJIa1JWbytZZVpYQzBXRFFJRzRsN1YwUDQrdkJaK256anFN?=
 =?utf-8?B?eG5qTnVOZ25JMkRqSC9sWDZacUY4NDRkTmRpS1JJMTErOVpQUWFDeUh0YS9P?=
 =?utf-8?B?MFBvaDF4Qjd0WWh5cXpBd2ZBUmthSEoxRGFhelBzZWNsMXpFZHQ2b2N6U2Jk?=
 =?utf-8?B?NmNxMWJ5UjZTRDVtbldrck1vNGxSWmlZalFaMENXcTFHb3VZaTVJaHFleXJo?=
 =?utf-8?B?Skdnd25sSXRsNXUzVGdPQmZDdkxkekZpQld0NTJDOW1sZkRRUGY5Y0FxNmtU?=
 =?utf-8?B?UFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074bea4f-bdde-4731-90c9-08de16144b98
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5536.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:22:36.1338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drt2VtH3ijnjry/G36BIX+gBeK/bnr96SuMpQFyzEEFHa1+sCOt4J64Toqjua8pgLSV/jAjfaObGy/bI+FGPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7784


在 2025/10/27 21:10, Krzysztof Kozlowski 写道:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On 27/10/2025 06:42, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> This patch introduces initial driver support for Amlogic's new
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94
Got it, I'll refer to the document and revise the commit message.
>
>> video acceleration hardware architecture, designed for video
>> stream decoding. The driver is designed to support the
>> V4L2 M2M stateless decoder API. In phase 1, it supports H.264
>> bitstreams decoding.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ...
>
>
>> +
>> +static int aml_vdec_drv_probe(struct platform_device *pdev)
>> +{
>> +     struct aml_vdec_dev *dev;
>> +     struct video_device *vfd_dec;
>> +     struct aml_vdec_hw *hw;
>> +     int ret = 0;
>> +
>> +     dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>> +     if (!dev)
>> +             return -ENOMEM;
>> +
>> +     dev->plat_dev = pdev;
>> +     mutex_init(&dev->dev_mutex);
>> +
>> +     ret = v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>> +     if (ret)
>> +             return dev_err_probe(&pdev->dev, ret, "v4l2_device_register err\n");
>> +
>> +     vfd_dec = video_device_alloc();
>> +     if (!vfd_dec) {
>> +             v4l2_err(&dev->v4l2_dev, "Failed to allocate video device\n");
>> +             ret = -ENOMEM;
>> +             goto err_device_alloc;
>> +     }
>> +     *vfd_dec = dec_dev;
>> +     vfd_dec->v4l2_dev = &dev->v4l2_dev;
>> +     vfd_dec->lock = &dev->dev_mutex;
>> +     video_set_drvdata(vfd_dec, dev);
>> +     dev->vfd = vfd_dec;
>> +     platform_set_drvdata(pdev, dev);
>> +
>> +     hw = kzalloc(sizeof(*hw), GFP_KERNEL);
> Why aren't you using devm interfaces?
Thanks for the reminder, It would be better to use the devm interfaces here,
I'll fix this.
>> +     if (!hw) {
>> +             ret = -ENOMEM;
>> +             goto err_dec_mem_init;
>> +     }
>> +     dev->dec_hw = hw;
>> +
>> +     dev->pvdec_data = of_device_get_match_data(&pdev->dev);
>> +     ret = dev->pvdec_data->req_hw_resource(dev);
>> +     if (ret < 0)
>> +             goto err_hw_init;
>> +
>> +     dev->m2m_dev_dec = v4l2_m2m_init(&aml_vdec_m2m_ops);
>> +     if (IS_ERR((__force void *)dev->m2m_dev_dec)) {
> Huh? Why the cast?
The cast seems superfluous here, I'll remove it.
>> +             v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem dec device\n");
>> +             ret = PTR_ERR((__force void *)dev->m2m_dev_dec);
>> +             goto err_hw_init;
>> +     }
>> +
>> +     ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
>> +     if (ret) {
>> +             v4l2_err(&dev->v4l2_dev, "Failed to register video device");
>> +             goto err_vid_dev_register;
>> +     }
>> +
>> +     v4l2_info(&dev->v4l2_dev, "Registered %s as /dev/%s\n",
>> +               vfd_dec->name, video_device_node_name(vfd_dec));
> This does not look like useful printk message. Drivers should be silent
> on success:
> https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
> https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79
Got it, I'll get rid of it.
>
>> +
>> +     dev->mdev.dev = &pdev->dev;
>> +     strscpy(dev->mdev.model, AML_VDEC_DRV_NAME, sizeof(dev->mdev.model));
>> +     media_device_init(&dev->mdev);
>> +     dev->mdev.ops = &aml_m2m_media_ops;
>> +     dev->v4l2_dev.mdev = &dev->mdev;
>> +
>> +     ret = v4l2_m2m_register_media_controller(dev->m2m_dev_dec, vfd_dec,
>> +                                              MEDIA_ENT_F_PROC_VIDEO_DECODER);
>> +     if (ret) {
>> +             v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem media controller\n");
>> +             goto error_m2m_mc_register;
>> +     }
>> +
>> +     ret = media_device_register(&dev->mdev);
>> +     if (ret) {
>> +             v4l2_err(&dev->v4l2_dev, "Failed to register media device");
>> +             goto err_media_dev_register;
>> +     }
>> +     vdec_enable(dev->dec_hw);
>> +     return 0;
>> +
>> +err_media_dev_register:
>> +     v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
>> +error_m2m_mc_register:
>> +     media_device_cleanup(&dev->mdev);
>> +err_vid_dev_register:
>> +     v4l2_m2m_release(dev->m2m_dev_dec);
>> +err_hw_init:
>> +     kfree(hw);
>> +     dev->dec_hw = NULL;
>> +err_dec_mem_init:
>> +     video_device_release(vfd_dec);
>> +err_device_alloc:
>> +     v4l2_device_unregister(&dev->v4l2_dev);
>> +     return ret;
>> +}
>> +
>> +static void aml_vdec_drv_remove(struct platform_device *pdev)
>> +{
>> +     struct aml_vdec_dev *dev = platform_get_drvdata(pdev);
>> +
>> +     vdec_disable(dev->dec_hw);
>> +
>> +     if (media_devnode_is_registered(dev->mdev.devnode)) {
>> +             media_device_unregister(&dev->mdev);
>> +             media_device_cleanup(&dev->mdev);
>> +     }
>> +
>> +     if (dev->m2m_dev_dec)
>> +             v4l2_m2m_release(dev->m2m_dev_dec);
>> +     if (dev->vfd)
>> +             video_unregister_device(dev->vfd);
>> +     if (dev->dec_hw)
>> +             dev->pvdec_data->destroy_hw_resource(dev);
>> +
>> +     v4l2_device_unregister(&dev->v4l2_dev);
>> +
>> +     pr_debug("aml v4l2 decoder driver remove\n");
>
> This does not look like useful printk message. Drivers should be silent
> on success:
> https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
> https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79
I'll remove this message.
>
>> +}
>> +
>> +static const struct of_device_id aml_vdec_match[] = {
>> +     {.compatible = "amlogic,s4-vcodec-dec", .data = &aml_vdec_s4_pdata},
>> +     {},
>> +};
>> +
>> +static struct platform_driver aml_vcodec_dec_driver = {
>> +     .probe    = aml_vdec_drv_probe,
>> +     .remove    = aml_vdec_drv_remove,
>> +     .driver    = {
>> +             .name    = AML_VDEC_DRV_NAME,
>> +             .of_match_table = aml_vdec_match,
>> +     },
>> +};
>> +
>> +static int __init aml_vdec_init(void)
>> +{
>> +     pr_debug("aml v4l2 decoder module init\n");
>> +
>> +     if (platform_driver_register(&aml_vcodec_dec_driver)) {
>> +             pr_err("failed to register aml v4l2 decoder\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static void __exit aml_vdec_exit(void)
>> +{
>> +     pr_debug("aml v4l2 decoder module exit\n");
>> +     platform_driver_unregister(&aml_vcodec_dec_driver);
> No, drop entire init/exit. This is some really odd code, probably
> copy-paste from poor downstream. Please look at upstream drivers - do
> you see anything like that anywhere?
Yes, it should be dropped. I reviewed some other upstream drivers, nobody
add this.
>> +}
>> +
>> +module_init(aml_vdec_init);
>> +module_exit(aml_vdec_exit);
>> +
> Best regards,
> Krzysztof

Thank you

Zhentao


