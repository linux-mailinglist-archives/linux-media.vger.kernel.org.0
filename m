Return-Path: <linux-media+bounces-22406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC729DFBC5
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 09:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89403B211F4
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 08:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FC31F9EAA;
	Mon,  2 Dec 2024 08:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="SK5IkKyy"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2091.outbound.protection.outlook.com [40.107.249.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DB91F8EED;
	Mon,  2 Dec 2024 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733127547; cv=fail; b=R6w/qZQi8PEFHhyeapRYmQ8bZ/u5bPmF/30smjf+EW32Vn532x1iJBuPi61e9WB5bZNxcOpoqPENbVJwR2di/GJeVF1uRxVLjWJLKtAPYbHh97bJjvjGXMMKOTed29xnKI7PZ9zfx82djTRnmW6ZJLOx8wHq8zsUaAY/eMPods8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733127547; c=relaxed/simple;
	bh=uMLeDHk1RCJPhgoOA3kcy426xsETDtLxaq0PmJjlECo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OAw6w1EoZmD8n1A4Mn21aOcfPPGWc2iLJbsqSSlSdodQEXYSKaIhB9QjeCRG9ZHdXcJcuaWm9cyLjxMaPL0J0dtViVRQ54kwo1OCi7dY7cq/Ad+EtZcjTOETUt6cB8LOSHmirzb3XgTi/TJrilKg9T8n6glwfBwHaIlJv9x/KIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=SK5IkKyy; arc=fail smtp.client-ip=40.107.249.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhXPDXpL3Q80N7hL/AT1ep68Go0SYm0V8SFlto7HP0iwQXlB1IJlUpUIYUQTlk18OHT27JRi9fAWvNu7qUsM4hQhpNgu7rswGLjO3JS9BFLQYIHog+0whBu3umB5s/COo3J+LIzgziA2i9G8soKh3r/So7Pvh5KNAQXhcfcNx6wyf4XsT4zzv4pQuNTDGYhJD+52QbfgJVFz3MfbkppIN4h8OIGCSuyohUJ1Sjk9slUSoMdZ/ziQ0xelyNJyGTLslFKY6CGk84ydxhakdLsGdE+y1X9iquFTQLmrSlmiSE8JkOYW/+hbGW7bnFnfqvl4Qrh6bq0av8J+Qp4h6Qf1Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHQShjAAcyJJueiB6z5eTGNUfyOmZ41jDqhiTrfxuUc=;
 b=ywM1paOEAjuc1p9bok5e8g8C3VP9B5RKc0B/jm02LLsmYgkAgFPtE35n2vuFz9RoCz4JezbuPQwKnNtBKXciasq0cMqDMsXgBrqz4hWWWej1L1JAHII1eWz163Lfb+HG8wxrO4DS+P1bvEiBbVs697GE6fYr7dL8kI54Pi8p7/nVpB80ty/UhAyx439h+KbAcvtMbOSryXaGO2hPE3XzVg6R1NzSAbePpjr/bYUApxFp2A5iA8sUVeG/m4InUs1uaxP6RnUmZ13x2Jdhs5PtF2c2fk11Asfoc6UAiqUkRM4vtV286xJzl5Wnx55kzJZnGVZ49o5IzuNr1DXA8nnCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHQShjAAcyJJueiB6z5eTGNUfyOmZ41jDqhiTrfxuUc=;
 b=SK5IkKyywNpS0O+tvD51h0RQnWJD82uSPc0qg0YW9yRbfg5ZJtOCgdS1NUe82J8CXXB4U/iCd4oDEFVKztXWFNhRZQITttyuBnx4lkmQBNFRSXG9qINtz6Kx/wYz20tb962G/eWqGToUVVvQ2BvuvOMGEQqi7RXzG9jtWJn6UAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DBAPR08MB5656.eurprd08.prod.outlook.com (2603:10a6:10:1a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 08:19:00 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 08:19:00 +0000
Message-ID: <f088a247-8049-49a7-bab3-5b517cb0c531@wolfvision.net>
Date: Mon, 2 Dec 2024 09:18:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: sony,imx415: add required clock-names
 property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241130141716.1007115-1-matthias.fend@emfend.at>
 <bh3obpt6bcklejdvrk4r6ienraz5zmhrdyotijhvlwexussqgj@hicmx34vi27w>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <bh3obpt6bcklejdvrk4r6ienraz5zmhrdyotijhvlwexussqgj@hicmx34vi27w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::30) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DBAPR08MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: dea0b453-2068-43a5-79f7-08dd12a9f955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L29KdVh6dFJUNG5QVTFkSHBhMHdpcDZYZkFtN25CdEhIaktzYWh6V2dYd0RD?=
 =?utf-8?B?bEU0dWo5UStqaTJmWnBCYnp4M1p6cmRNR2tkOVczVGU3R0pBc1o2eGxib2pE?=
 =?utf-8?B?NEdmSlVVRnBLZVVIYmRiSlcyTlJlNE1CbnJlMmRtNGVkMW91U3F6WjVJU0I3?=
 =?utf-8?B?SE5VSFRKNE9yaFNkaVdUQ2R1cGp2TDg4NUlhODRIdmRCZDdpME83Z0swVHgw?=
 =?utf-8?B?TEVod0JHMFpjdDZUcjhtNXgwSnBIcmxqc2o5dWV3UHN5NXNYSXBoMTcvNlB4?=
 =?utf-8?B?NTExTk81VVZaSWFmWlBxZU5qYzM2NkhuUWtoSGNzTjZMR01GVmxzTERXZFBL?=
 =?utf-8?B?QmI4RTZlMkUvcG9OczJXRkFnVDhKUjFNT1NOZFVSZEY4azI2RzgwWGttZmUw?=
 =?utf-8?B?Y0JCdUNaaFVMdlNHL1R1K2NjeFZOVEVncllMVjJncTNrRHMwakxUd1owdFNy?=
 =?utf-8?B?cjVlelFVazF0NlBYR1ZIR3FQVFhldjZLWWFJaWNmNDNTTGc1M2JLbDJxdEJ2?=
 =?utf-8?B?SnVLVkNjL0dFQVM0N0pFVkRhem5JTlBwcjJMcGVGbHlUaDRwNjVkOVlNa25V?=
 =?utf-8?B?TksveTRwczF0b0xkQWl4S3V3enljM0p2U1JicklNZlZmV29pRkZZa2pnUHYx?=
 =?utf-8?B?RW9YRWRENDZSY0cxQ1hHcWFGS0tHUU01MXVCNEdJaWVCdHdHVGFaWUhZcFNE?=
 =?utf-8?B?dGJXZ25ZbDRKUjVacFE0V09aOVdMOFpueHNlZjkrVGc2Zk1teGFsM0h1L3FM?=
 =?utf-8?B?NDV4RmZMRTlTMnk2ZjZwbGNwbDhSTDlMOEh2TnZOdU9zYzJvY1RoNC9QSWw3?=
 =?utf-8?B?aHQzemk4V3FGQU9TUS9lNHFJYkc0RHN6bGx2QTlrd1ZRTDBtS2FiYjE3M1JY?=
 =?utf-8?B?dnNMWXNBR3l1K0RwcW85cVFEc0tGQ0NTZklBYXZZVXgzU2VMRFZtQVZ0N0c3?=
 =?utf-8?B?T3ZUUCtaTU0zdmYzM3hEbm1uRExxaHdhNVpIaVFiMmhlT1FRRjFqN3FTb0F1?=
 =?utf-8?B?VnNJL1A3dlQ0Vll2YVB5cTZmTExCdlFRcXJwcFgrQzVONDNmUjA4RlRLRDBI?=
 =?utf-8?B?VlplQjU3WkZqTzFSY1hEVWVPRjd5VU9JbDlSR1hvSUxXVVo0T3VJZnRXeUl5?=
 =?utf-8?B?NjE0SmhDK2VPc3N5TlBpQ1lHVk0rSklQZkVLQVgra2VIVHVyMXBNN3QxeXNj?=
 =?utf-8?B?VkUvTTZZMHNTcXhCcXU2NkRucFV3NUo1UGpaMUJRNlJ3L2tiVndHNEhQYVFY?=
 =?utf-8?B?dnBDbU1NWnc1UzBwMFNldDFXajFUeks1OWh4bGlGNjMrVVBLdUFER2I0bjJ2?=
 =?utf-8?B?bWkvTWFJNW1WMjlFV3M5SjZSV1VEVE4zc1hrRzZpVXlKWjhxUTRJeXlyYWwx?=
 =?utf-8?B?OXRrUlpaeGoxTERtelExMFhOVXNVMzdjSERMMUlWamhaNGRTbHdKS2R1dWdL?=
 =?utf-8?B?bys1SWdaZnd1M29zV0hkWGNlUDZmNDRxSVAxQnhueDlnOEthSmJKOWZGNWRl?=
 =?utf-8?B?V3BWN0dkbVRjTzhtMDUvZktVa202cEsvQjBvMk5YRGVEQXVnM3FpTXVqVDEv?=
 =?utf-8?B?cWJDaVVlUFMraWF5WFI5ZUR6NmpIcS9Qc3NlWndEWTYrQU1xdk9BZFY5MkVF?=
 =?utf-8?B?K3ErWDZ5T1g1Ym92V2JSRlhid01hNEU1bGpzR2tnN1NLUjVPVXhHaVlMTlh6?=
 =?utf-8?B?cVI1akh3UGNsWG9ZS2NNV1cvQllIV1drS0tzSHJRYU10RFdTSnhUdkM0VDA1?=
 =?utf-8?B?RzJyY1BBcTRvNzBhNmh5c25kaUtkRUdRK1U0OGxmbVNReWRUc0JIUGp1SGcy?=
 =?utf-8?B?dEZvOGgvaTFHTU85ZGNxUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVpCZSs5YjdLSWFRQWNXRENVcFBFYmlNQVorbWQxWVlpWUZDYnZkVTlsQkNw?=
 =?utf-8?B?VDk4M3kyYmQ1VlJwdmc1T2NDdmFzdEhOSXk4VzQyK0FiN3VsV2RtRHM2aTBH?=
 =?utf-8?B?ZERSKzFmVks1MzB3bXJjaDJPc2xZSkFjUHdsdklqYXMza0MzdlVyREU5c1Jh?=
 =?utf-8?B?QVRrcHBTLzFuOGlsVERZZmJKeXB4cEJyS3AwUWNwdzRzT2xLdXBLd3F1NWs3?=
 =?utf-8?B?RndURlZDT0tFM1NmNTZlZnhpdXE4ZmdMTGU0NkpWNytQaWZETllKWncreldv?=
 =?utf-8?B?Wkt5NC9uQ2pXQjRSbGlUajJZalI0ZkNvNGVIWURjMzNyaE1vSTJHYktlWTFx?=
 =?utf-8?B?R3JPaUFDTXFNZWUxVmVpZ0hCdTNuNnF1SVh2alJiOXBqWVltT0w2UU50a1dG?=
 =?utf-8?B?K1orcytERTB0UTQzTWNMNFQzcmRvbFd4aThLUUNsSTB6cG1ORW93cldtT2FM?=
 =?utf-8?B?VUswcURVQzh6Q09hWW50Ym55U1QrTmwzdGN0akhCdDNXK1lkZmFOMi9abHVU?=
 =?utf-8?B?UE1GWHJRMTM1c3E1NzlSek44N1pJc3VpbzMrWnhpU3hwbXkzWm9ZbXY2QjFU?=
 =?utf-8?B?RzB5NW1RZkJKeUZnWjVRaTB2Yk1jSVhPNEpvL1g4Mkpvbkdld3JUNENqaHlS?=
 =?utf-8?B?MGg5eXh1b0lqN2labjdoMWRGczZ1UElRSGk0K1kyTEhPeFI3SFNYNkdpV29T?=
 =?utf-8?B?VzcwenFmak5VSlppZWhUTmgxRFJEUGRXSHBjaTBybGovdlMxRTVtQlM2QjY0?=
 =?utf-8?B?RTk1b1l2bCs5b05oWHJIVGFpdHM4eEUrT0w4QTJkdUl2OERmS25OZFQwTFBN?=
 =?utf-8?B?NkJqbFYvRHU2ZG1UUjlLSUh3WFZYS0dTcFJCVW9aaGd5NDhnM3NBTHVQVWE1?=
 =?utf-8?B?ZDFMamZld293S2ZyOGkvWEE0dnNZM1V1ZjlaSlV3UmNWS2Q0ajI5VnJNYlhj?=
 =?utf-8?B?ajNnRCt2cUh1QVY4WVV1VkJRbm95aTVVUFRDbXhtaTlxOXUvSkpRV0U0ckpE?=
 =?utf-8?B?YzZlRnoxSFhpZHgzWk1VVWhpZzNLdDRBR3dWSjFvU0tXenFGckFSWDRQK0Jr?=
 =?utf-8?B?eFR2UnFSZzdKeWc5cHVwU2hyUXIrYlY3Z1REOFMvSkJDWkVmTjdpRVpvbzNX?=
 =?utf-8?B?QXo0VDE0S05GZG1xZjdDQVIvUU0vWmZ3WFh5MmxqRW5RNExPdHhudzV5RnhX?=
 =?utf-8?B?cHB5d09YK0kveXNpdmhtSStTN0NZT0tyQlJKK1loUXluWXVUdFpCZitLNSta?=
 =?utf-8?B?bEoxUnlxU2NwRVRjRFh4bnIzRkVIZi9XSXBaeGhITlRrTmNaYUVxVXZZWmVW?=
 =?utf-8?B?ZGloSmorYVFDT1dpdElwNUVSRHBOK0Nsd2FhODRPYnd5eFVpcnUzOUdsTWh4?=
 =?utf-8?B?WWd0bnBsVXNMWFk2YWxEYzhocENlNkZPbldXT0tZNDEybmpWcklKYm9wSy9w?=
 =?utf-8?B?S0V2Mk5tRmhaUldjalVCbVBTMTNxQXo4bENtNHRUN2dMV0x4T2dpd2hKSmFH?=
 =?utf-8?B?Uk5scUpOTnNBcDZ6MkxTTFowMGVOdEZLQ3MzS0d4NzNzNFhpM2R1SkpjRkc0?=
 =?utf-8?B?Sk9LQTZoa2o1VHdzQlIyTjhkNDYrcUNqMGhTand4Kzg0aHZkczVVaW9hZSth?=
 =?utf-8?B?dlhkbENKRVd5Tk1yU0srTnZDRHEyQjY4TUJWUUplTENBTkozWVdnYzREQ1JD?=
 =?utf-8?B?QlA4OFJtenIzaDJwUHJVZk1kTzRKVHNWTldBNWI0ekdEbEcwTXVvdVZOZnRh?=
 =?utf-8?B?aGhHc2VkMDJwODJCcmVBdk9DbldvN3RwYkh5c2xxWWF6REt4RnlkR1M5Y2ht?=
 =?utf-8?B?TVhER3FyUG9pNlVScFVjSzdaMUFxWkZIeFVvWmZmZnVueDdYMjJDKy8zclU2?=
 =?utf-8?B?T2FhWnZpSC9hcDAySWYyelBQOFk0ZDF2NVdtKzgraERvemtxbEpFRlI0K2Ix?=
 =?utf-8?B?U0pGNCtzb1VGWnNBaHVid04rYnR5VkxsbW5naTJnYjIrMWZ3UHVwM0NFb1Vh?=
 =?utf-8?B?Z09nT0kwQy80TWdtQnh3NUhld05QOHVnRjBhRURwS2FXUU5PcFh3OUtJbXpo?=
 =?utf-8?B?STU0ZHcyVWxQY3ZZK2Y3ckZ4WXpLL1ZHYVFwL1dWeXZaOTJLeXppdkJyTnht?=
 =?utf-8?B?ZW9xa05NMDB0Tk1IZHNnUFNOa0JlZUp2V25sempsQVVhaTA2em1ya092WmxE?=
 =?utf-8?B?TXc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dea0b453-2068-43a5-79f7-08dd12a9f955
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 08:19:00.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQSO/2RhqKzxlwqzcEEZuHXumJmEidna9HFbMF3wFetSeiYnoMXsuOsqzwYpgsnwNQwz0guuRmcEicNAbg12V9MO15D+hl/Woz3GRp+PU/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5656

Hi Matthias, Krzysztof,

On 12/2/24 08:56, Krzysztof Kozlowski wrote:
> On Sat, Nov 30, 2024 at 03:17:15PM +0100, Matthias Fend wrote:
>> The imx415 driver expects a clock with the name "inck".
>> Document this in the bindings.
> 
> No, fix the driver instead of bypassing review. It was decided to drop
> it during review, so you cannot reintroduce it 2 years later claiming
> that's now ABI. Of course original submission was buggy and never
> tested, but that does not allow review bypass.

Just to make sure I am on the same page here: Between v2 and v3 of the
IMX415 submission the clock-names property was dropped. At that point,
we should have changed the acquisition of the clock from
    sensor->clk = devm_clk_get(sensor->dev, "inck");
to
    sensor->clk = devm_clk_get(sensor->dev, NULL);

Is that correct/the proper fix?

> 
> Best regards,
> Krzysztof
> 

Best regards,
Michael

