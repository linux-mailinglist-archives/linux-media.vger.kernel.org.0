Return-Path: <linux-media+bounces-38206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC511B0D4E4
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 10:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14C2716EB56
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 08:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F38028A3E2;
	Tue, 22 Jul 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hyhFTuSs"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C7E7482;
	Tue, 22 Jul 2025 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753173985; cv=fail; b=TQF9cMgMkScNTeWFZpbUsw2ecbJV/x60PkLKbbhFIeD/tBIXdSDxwjfnTYgdH9FgmTWrON4thFowJ9atfhZ2PQ8H3PkmaioTSEZEda7Tpliop5KBl/uU+zbTZUFpYG5qhOIKmkPdOhDz1Y3z+pNN6Dn088uRul4AM6Q2JVQI7Dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753173985; c=relaxed/simple;
	bh=ypIVSbMfWJ7QXn50SNHoM2MWOpgqMW7ra3XCyWnN9V4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IG+qU5PVirhxOQF8a19GNxSntt30Gn/AZoI70gTIlrqRGNZTfMtomCSu9Zi6NC+o9gVwdc7eAXUAIB3j5an5shtbzU8HVFAl42MV2oIELOuIrN1agf2+cnNFuzd6qNPC3zmuc2uhe7w4e3+KhTJwM7DTXa6PUj+wXHa38sqAS4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hyhFTuSs; arc=fail smtp.client-ip=52.101.69.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+a7EbGbQTPeL0UCelOCfANVMLJm1esJeequOiyngGrJJ7H3QGpDVFdNZrDEAUsub0oUwJwFmVQwQSa90c8F83AwCW2OZlMGd97p7h1IfkNr8sov46TGzLDOop1XRVXwqHK+vQdkhmX2VyQi+sJJuS5zvgKuavraK6jr8Sweev/0JfBqShmw5z2F1mLdDSuXmV1cIa24Zv+8GyQSJFyAo8LbHjAqBIEciI6Rq/saTyJCWQo/amDvuhKSxW8krjPjhAJbU/7YYv8kKauZG14K6cmuVl0rymqrN86AOK9/EFNKcasqRycjFVW1Ey//XwEp7HUXOPFS7D89AfPvvknSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWeKGrfhFrJV30e21A+Dh5M2MzUz8z7U4nsik1mx/YY=;
 b=MuUeX85TCgzhh75DuIIaLHx7s6Uatzy7zyUot0Qo8FoN76NRpCAtM0DgyTOdPhC39p6J21Hisf0uQoA4DtYx+Mp08IEctCuyO1YnvZ3gAw8tcusYFkctYZ9teOhrCpLKBuubUGEw7KTHFvx1NVj5RxtCU+/zUuJM2BRc1gG00fIfB1ZPL1gfFtMXb/cVGxU+kpQXOtJ7jpVhJLdn8P0mXHaGAr8hTeG99HGnhQW3nYyYxo4yblCBkRgFVph8TqKRxxZqZT1m39aZGhqxzVMdRtvs8o2zRxqIfxPJIjYIKH3zQO5txPlpZOtYMCXSblyI9CAyBlwa0r5k8tImtMS3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWeKGrfhFrJV30e21A+Dh5M2MzUz8z7U4nsik1mx/YY=;
 b=hyhFTuSsfFM144FNmW2s0WZ0910wu1hwKKrijEMw4JpSd8I29NBnNUm89jH9jWIx7hDk5tM8SZBWELRiVKt+0OWd/Zpwq+HsoZn9yhvE1hJYnNG3YVV6Uz0Gx+GeQNXZQrTGTrQjGgOPUZJ1R6ShhEd0T13KXcgp4O1n3yiJGDKPBXceBX6CsnJkZmAdA0sSbWT4NZfv8wnCgw/KTYUpYZDDMRmltkxQX/Gc8stolWNGh49vpoRtF+yuldChKyHJOcBh1S8Xkhbo71hy1g41bFw9MYcWZ5OvMOBKjSdqoBPzUV8LfKAbBsdWhLJKMpILYRz4Ic5fKJQdAeLKYYCbnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8147.eurprd04.prod.outlook.com (2603:10a6:20b:3e0::22)
 by GV1PR04MB10989.eurprd04.prod.outlook.com (2603:10a6:150:200::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 08:46:19 +0000
Received: from AM9PR04MB8147.eurprd04.prod.outlook.com
 ([fe80::eace:e980:28a4:ef8a]) by AM9PR04MB8147.eurprd04.prod.outlook.com
 ([fe80::eace:e980:28a4:ef8a%6]) with mapi id 15.20.8964.019; Tue, 22 Jul 2025
 08:46:19 +0000
Message-ID: <ebff73fd-292d-459a-9ebe-cbbc6ef2b39b@nxp.com>
Date: Tue, 22 Jul 2025 10:46:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/2] Add standard exposure and gain controls for multiple
 captures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, ribalda@chromium.org, jai.luthra@ideasonboard.com,
 laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com, celine.laurencin@nxp.com
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250715235952.GE19299@pendragon.ideasonboard.com>
 <20250716001205.GG19299@pendragon.ideasonboard.com>
Content-Language: en-US
From: Julien Vuillaumier <julien.vuillaumier@nxp.com>
In-Reply-To: <20250716001205.GG19299@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0360.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::13) To AM9PR04MB8147.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e0::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8147:EE_|GV1PR04MB10989:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a4a2170-eade-4056-25c1-08ddc8fc39d5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dWN0V1RZRjNyLzZteWwvRVZwVE52aVZQdDZqK0hYL28wdkJ2TWtRSC9PUlMy?=
 =?utf-8?B?VzVKeG1BOHV2OFI1R2JTVENwV0lpaG9Wc09sMGVsWG8vMEN2MmxQTklERlJV?=
 =?utf-8?B?dnhKcHQxNTlhaTBDTlNEOEowRU9VODE5WlMxWndBQStMdXA0eUJUZ1pGVElZ?=
 =?utf-8?B?Smp6VG0rYzMyOGYxeGNURjYzRHFhc2pPZDIvMStCM2tDQjZSM3ZDenZUM0Fh?=
 =?utf-8?B?K0ZHNnIzcElnSGpRQko1ZlRjYUJXalNnSW80d3phL05YQlZhdDcrK2JQbE5V?=
 =?utf-8?B?blgzcW1pR1BxYlBMaFlrenYwaXN2b3NDQ2ZVc3VOaWgwUHdqQkFuOG90UEsr?=
 =?utf-8?B?TXQ5T00zQWNQYWhiVGJ4bUh0TkZzVjk5TUlyNHc3WGJuOHVrYnUwbW1NS3FV?=
 =?utf-8?B?THZMQjQrbnAzeko3MTRKSWxENHVZU3NINVd6amkzT3VyamdBZ1ZXeHZoSzdv?=
 =?utf-8?B?UWtxMzl5MHc1cklrVTJ3Njk4WmZQWTJPRmdVTW54Y3JLejBud1l0Zm96U1NG?=
 =?utf-8?B?bi9pd01oa2JLbEdoM0lIdmtXTW9GV2dzUkRIYThpWEJrejZGSm0vb3RYTWdq?=
 =?utf-8?B?OEppS1dkakhTZ1ZqZ21VU01jTFgvVWp5dnl2ZndCS21LSlNDV3JMdkkvVGhV?=
 =?utf-8?B?TFBHSjQ0Y2t4dG5rbmZ2V3RId1VBUUR4bUFLajNwRlY4L3ZNcXpSUFZUcU5V?=
 =?utf-8?B?clh4ZzhKdDdRdWIzRjVrVkYwSUF6RHkrZzZqYUNVd0tnSzlUQ3hHU2FEZFhv?=
 =?utf-8?B?ajhVSElONHUvUkcvalpTT29CcG1NQkZjMEtXRjNWN2VYem81ckdtUXBzcXFR?=
 =?utf-8?B?NlZpYS8rckNhQW5EUU5LYUMxcXI5ZlRYd2MzZlNKVjlJaTFIb05hWkx4N01M?=
 =?utf-8?B?Vk9Fa1I4UlNqTEZ6a2NxcFRFRGQ4ZVo3bUhCa3JHSHhRVjEwaWNTTmU3MVlI?=
 =?utf-8?B?bUo1MmQ1KzZ0aXVhNUExZmZKMVVwa0UzK3Z4WWRleVlJU2F3S05MRG9sVHR2?=
 =?utf-8?B?VXFOWDhRMWhxRUNDL1lueVdPTmh5eEVQTFBlYnlnYTJhdnBGa3hxZzZnaW1v?=
 =?utf-8?B?RlJ2eEhJRlBNcjEzWjhCVjB3V0ZXMTUvL0J6NGc4aGZrREVLeWM1Qmtqb3lr?=
 =?utf-8?B?UUxnRXRKRWx5b1Q5WGtKbmJkQlZhVmtGSDVZMVNsSVF6Q3lKWHZvZ1ZWeDBu?=
 =?utf-8?B?aG81cWpNNkQ0eWRudzRiWlJDS2lLUjY2RkxiVHR3TnRuZWJmSFo3UUFGQncr?=
 =?utf-8?B?aDRpTnltWlh6TmRYNCtqeDQrUllEMnc4b0FJc3VZTTVVNjRvaGxZZ3FJSGp5?=
 =?utf-8?B?MURtcmhLTC9WTis4cGMrS3JiRUFQbnMySUh4aU93bjkvQXAyWTVKKzI2enBD?=
 =?utf-8?B?Ujc2MEQyL2w2TGxZOHpwK0h5MUcrTzlTNzNVMysvNkg1Nm9HTHgzV1dPaUpT?=
 =?utf-8?B?YjRlSXhsTTREbFhvYmFwZWFjMzlFWDFWd3NrU2syZldXbTNNZGUybDdMZ1Jo?=
 =?utf-8?B?a3FPQ1pUMFRrOVNTOERxTk5XVy9rcXVNRkpxUmJZQzdzZ1FYT0E3VmYxaVY5?=
 =?utf-8?B?bjhKdXN5OUxwM3hVY3BybjhnUjMzVFdlbVVqQ2R4ZnA2WmhSNElTTG5BQWUy?=
 =?utf-8?B?UG1tTHVjY2h5Nk1UL2N0UWRlTStRUzVvRk5WVTBhWW9tc0M4dE1RdGZuWXNZ?=
 =?utf-8?B?L1poT2tFdEsxWFNYaHF4OU5WYTNtd3ptdzJUdWF4ZHFSaTdWSWJvNm53MXgz?=
 =?utf-8?B?OW1Td0R6WU5YemkxekhNbE1LMncrTndvSjVzczlqUGdUcnljemRIQlk2WDZm?=
 =?utf-8?B?NjQ0OFlWZWk3SGNwdGZab24vcXVzTlc4RFAwSXdubVdIUmVtN0RRMGhMdEI0?=
 =?utf-8?B?SDVpVFY0bGFVc2NiNmRUWkVmSkFxNmc4akRORXg2Vkd2NEdFMUx4UkdNMDNM?=
 =?utf-8?Q?fOVlZ4qWh6E=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TlZZS0xGVUFmbmhmYXl0dmpoek9ZK3FSUVhiK1NPSUpUV0ZCR0pFaDNJVUpz?=
 =?utf-8?B?WUoyamdnenpLZmVUOEkzMitoOTc1cGQxLzZKT1h5OTAyUjhvbEROaG90cVR1?=
 =?utf-8?B?elJYVHBTa0Fyd04vRTNTWWlZOGdWamt3SVA4RVJUaE41TFY3Y3JJMDgrY095?=
 =?utf-8?B?a2luYnVGSWMvM3NYd0h1U1lFWjB0MG1IZ0FQaVJ3bEpvcXREK2wwcTB5bkV4?=
 =?utf-8?B?bzFvSU5LREcwSE9ObytjelBibWpVSTFFclFVd0JwTnNnZGIrNDRXQ3NzZnRj?=
 =?utf-8?B?amRPa0R5c1pEQk1mRmtTZS82Mmdkc2RxOFVOZFJhUVFVL0ozRUwyUUhURERV?=
 =?utf-8?B?cjc4Sk1VTFBHQmRqSE10RnN5T1lKNnRERDl4YTFQcmRVNzZXM0tHUTVFVFg0?=
 =?utf-8?B?NWk3RXY4UWxubk9PNFluYllpTnF6KzUxU3pIWVhhdWRvZ3A5MUhMbXBCckQy?=
 =?utf-8?B?QVlaaTBtbFAxYzRtQlZxMSs2V3VYQUVacDVwRzBCdWllL3cxVlRScGRnQnkz?=
 =?utf-8?B?b2gwNWhXQmozeEIyUTIrYVdwRHRkOUFUZGFKaW5yb1lPVlVyOHBvYUhRK2Nj?=
 =?utf-8?B?QWdIS20veWFqUUx0QkQ3MDBVZ1BMZFhJejhPc0hXSWV5NXBBZVRxRjIvYlgy?=
 =?utf-8?B?cHdiVFRxK1NQd1JuMVg2S3pTNHdnNzFYYUMwa09XdlV0MmF4WnpzRzZtb1Nh?=
 =?utf-8?B?UFdtMWI1M1FkMHdHYnNSRk5saFJKSXdrcm4vczEzdUNnTnlaK1FjMzRUWDRj?=
 =?utf-8?B?cVQwejBjRzF1TlRtVTBrWUpNRmd6SkEySDUvbDJnb21XUHQ5V1hGQXlETUxl?=
 =?utf-8?B?WWE4dXUwN1NTZGc1UEI2REcySjRBSlJCQ2g1SkJSbmpmOUkvejZSRlRqbUhn?=
 =?utf-8?B?QXg2dTF5M0tQQU9PL29ZR1FobHBuM2ZtdXpwbWdlTlZRaWZmdkRnSUZweVMy?=
 =?utf-8?B?ZjNZVXBHSXF0cTU2VFR6Q2lLRzJQOGNqNFBmWUltTmFYSmUyeFJST21Sa3Fp?=
 =?utf-8?B?Y0dPVmVSZXhCdHdJY2Y5dW1mN0lQZkZsSTVaR1VhWDYvazlLaDRhR0JuYThz?=
 =?utf-8?B?dVRlaHhHWVFiTWloWDNobnNiS09hUWU5WENvcmFFeE5oaTVQMXpzdWZScVZJ?=
 =?utf-8?B?S2tCS01kU1dnVzhiekpuNGpNaEtPWFVjbUlPMlZtVEx4S2dSUWVaYUdGSHJ6?=
 =?utf-8?B?RVVGcXNTYjMzbFo3dVlodkNHQ2ZJOW1idFdndWxpRkVSTWxjbmtraitGRnFY?=
 =?utf-8?B?UVRaTk1jbVBycHcyVGJmV0JISzhzekhmWVdiZDQ4dHFGZjFzT0Zic0FZSk9D?=
 =?utf-8?B?QmtJT3VJRnIyZ2s4NzZIZVk4eE1hR04yam8xODlhS1RpQldkbm5tL0lDYll1?=
 =?utf-8?B?TGR4dnFuSlVGdXUvQ1BGR3NnRm9Ra2dGSFphNXZFK2FseTZsUG81OWtQVWJ3?=
 =?utf-8?B?MEIzYnpZS1BCTmp5M05JV1gvalJ0Y1BURGtQOXBxMnZoSVF3SXprVlFUWXpi?=
 =?utf-8?B?ODIrV0hLMU4yYmZicDdJanZRTnBNZVJqS25VZmE2WjM3cjJXOGg1UFRkMHly?=
 =?utf-8?B?KzlwM1lvbmI0WGk5RGJ2RFkxQ3A5ZUxGZWVuRVI1WVRtemg5MTdRdUdnb3NV?=
 =?utf-8?B?bmRjMXAwNGc4bkh3SWwzSndyNm1kbVh4UVNLWnR0ZHZJc0VrRFpBbTRkdGVo?=
 =?utf-8?B?NHRKakozZ2p0TlJiZnVwOGoxVHROWDdYc1kzVy9zMjROKzJZN3pPcVhDdlBC?=
 =?utf-8?B?eU5aRkNiWlpscnJQK0FlZlptdHhpZ3pEb3gwN0twZmhRK1k3bVA1OEcxazJY?=
 =?utf-8?B?Mkp1VFlnWWNYUEIwOExoYlNCRWxFYXJHYzBybkQyR2NFT0NHdFIyeTNFbEc5?=
 =?utf-8?B?KytROGxnUlBMdWw4clR1djVpRkc3Rld5cks2RWU5dnp4TEtlUVg2YXY1ZW8x?=
 =?utf-8?B?cUIyN09ZSUJuWWE0UzRJby9lUkJ1K2FTYkV2L1J1NDlhV2VieUttRGtJTjBP?=
 =?utf-8?B?ZlBhM2taazU5S2xBR2VWakgrbzZ6Yk91ai8zNU44dlE5LzRTYXRPL0lESGJV?=
 =?utf-8?B?OEhINm9CK2p3Yk5YTk83TEJENmlTTHY2clhZelA2TUhSRmJGWGdwQjNqcTdk?=
 =?utf-8?B?SDRIWDdrRk1wdUgxUVFZTmV4U08rUWxyOXhDK0d3emlXSU5NMTlUVU9scXVs?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a4a2170-eade-4056-25c1-08ddc8fc39d5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 08:46:18.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqhwHiG1T53Zh3vTpFXGmO8HmZiAbJChzlJ6Qb+vdV02eUJ354vxkWMbkdvuZ3o9An1rgf8pLdznD1DcsP7uarU2HH5ip/iHtZZ34kSIILI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10989

Hi Laurent,

On 16/07/2025 02:12, Laurent Pinchart wrote:
> On Wed, Jul 16, 2025 at 02:59:54AM +0300, Laurent Pinchart wrote:
>> On Fri, Jul 11, 2025 at 01:05:42AM +0300, Mirela Rabulea wrote:
>>> Add new standard controls as U32 arrays, for sensors with multiple
>>> captures: V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
>>> V4L2_CID_DGAIN_MULTI. These will be particularly useful for sensors
>>> that have multiple captures, but the HDR merge is done inside the sensor,
>>> in the end exposing a single stream, but still requiring AEC control
>>> for all captures.
>>
>> It's also useful for sensors supporting DOL or DCG with HDR merge being
>> performed outside of the sensor.
> 
> Regarless of where HDR merge is implemented, we will also need controls
> to select the HDR mode. We have V4L2_CID_HDR_SENSOR_MODE, which doesn't
> standardize the values, and that's not good enough. At least for DOL and
> DCG with HDR merge implemented outside of the sensor, we need to
> standardize the modes.

For the HDR-capable sensors with the HDR merge implemented outside, the 
short capture(s) are likely implemented as separate streams, in order to 
match the raw camera sensor model.
In that case, the SDR/HDR mode switch, when supported, can be done by 
configuring the sensor device internal route for the short capture stream.

You mentioned the need to be able to select the HDR mode in a standard 
way. Could you elaborate on the foreseen usage: would it be to select 
SDR/HDR operation, to select between different HDR sub-modes, to inform 
user space about HDR capability... ?

> 
> Can you tell which sensor(s) you're working with ?
> 
>>> All controls are in the same class, so they could all be set
>>> atomically via VIDIOC_S_EXT_CTRLS, this could turn out to be
>>> useful in case of sensors with context switching.
>>
>> Agreed, we should be able to set them all. Are we still unable to set
>> controls from multiple classes atomatically ? I thought that limitation
>> has been lifted.
>>
>>> Each element of the array will hold an u32 value (exposure or gain)
>>> for one capture. The size of the array is up to the sensor driver which
>>> will implement the controls and initialize them via v4l2_ctrl_new_custom().
>>> With this approach, the user-space will have to set valid values
>>> for all the captures represented in the array.
>>
>> I'll comment on the controls themselves in patch 2/2.
>>
>>> The v4l2-core only supports one scalar min/max/step value for the
>>> entire array, and each element is validated and adjusted to be within
>>> these bounds in v4l2_ctrl_type_op_validate(). The significance for the
>>> maximum value for the exposure control could be "the max value for the
>>> long exposure" or "the max value for the sum of all exposures". If none
>>> of these is ok, the sensor driver can adjust the values as supported and
>>> the user space can use the TRY operation to query the sensor for the
>>> minimum or maximum values.
>>
>> Hmmmm... I wonder if we would need the ability to report different
>> limits for different array elements. There may be over-engineering
>> though, my experience with libcamera is that userspace really needs
>> detailed information about those controls, and attempting to convey the
>> precise information through the kernel-userspace API is bound to fail.
>> That's why we implement a sensor database in libcamera, with information
>> about how to convert control values to real gain and exposure time.
>> Exposing (close to) raw register values and letting userspace handle the
>> rest may be better.
>>
>>> Mirela Rabulea (2):
>>>    LF-15161-6: media: Add exposure and gain controls for multiple
>>>      captures
>>>    LF-15161-7: Documentation: media: Describe exposure and gain controls
>>>      for multiple captures
>>
>> Did you forget to remove the LF-* identifiers ? :-)
>>
>>>
>>>   .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
>>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  8 ++++++++
>>>   include/uapi/linux/v4l2-controls.h                   |  3 +++
>>>   3 files changed, 23 insertions(+)
> 
> --
> Regards,
> 
> Laurent Pinchart

Thanks,
Julien


