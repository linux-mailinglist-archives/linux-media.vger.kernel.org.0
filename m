Return-Path: <linux-media+bounces-48840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B48AFCC09D6
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 03:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC20B302355D
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 02:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E407A2E5B32;
	Tue, 16 Dec 2025 02:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="FU92lcaq"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022079.outbound.protection.outlook.com [52.101.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310622673A5;
	Tue, 16 Dec 2025 02:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852586; cv=fail; b=U3T+mJF/LbBcYqll6DMrsubfc8X9T2PBZhYvibfIwBP5cZiszLlzNKdQUdUoMDob74zoXmQp6ieXAXIF7kOw5//RMWUyJgYX8Ssunm9IbdJAMadotrwx2XjZkRmBxNj5LHm3PWwoMTThyl1Oc/dr6jEXYas8T8Q/1MKcOl/twJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852586; c=relaxed/simple;
	bh=KjP4UXvI4u6rn8bvL957Bj5veKf7dbZEX1L+K3g18qA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WdSU/HIamm6pF3NDk6WRBBfg+7R+gOFliD09uzjuK564JrQZnx0Mh38ghJVxXy2Wm0JKvLS6agbSQG4Zda1rE1o1PL21sGujHpaVGT1PFggJCsQc4I3lUgZCkM8Ka4Y/K4/qWg5D84ZR2qHG5JKPvEPbNsTsu27F2aUrt+/9iv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=FU92lcaq; arc=fail smtp.client-ip=52.101.126.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFjEvUQCqBtMtJo8pgYiwhKYU3ELZJlxhDLrnAu5GGlfkijL0WGXpY1TfDgxtu9x8XqODxVihbWUYIkjde9k5NNdR4qjkSNPi3g9waML5uLRkdAj5Doli9z4bHba1dTUSDVktclYROmcjEifmdB6tgX3mzAEDjX0+S4CN00pishXFdlqVxni706UxzkW2CfoZAziGzAhd/Fr1lgwPGbV2QKeG7ws5YJYHXTpthwNzyV8Xe0CKESyK6kRAMio0gn9M6u6FQchuGE7EyIPQtgcVbK9+i1PpYct3UnkWmVCCHNlgVLUi2zuKdL6L9XMS3bIVQrYwOjJD5LlOFuGv0gl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUp56oyq1AxbnvAGjYgfctA7iFOFxYTEUR/k8qFvodc=;
 b=hRTXfMEv8Cl3UAQj+yiKUGO/yFgxa+JdVBiyIUpMjt5DXqBhui7t5ts2/f4eNo00n7QYkA5gfnBHEmF/1veGeUZNbhlgWBE/QQflX27aRYwuhDoj1PT1u+MPbh+mm5PrT5vazrDxe1+jgfvuZAeEiegRp1Dj23NjnzgocZlg0uNOF7072qdVdB5EGiXVTSz6dMOevEVSQ7ZPdPhVhE16TXgXLL+Yx/+IcrCCjpptr2x//iM2cMBmoS3zGHQ2uMhC01Wqanzbz4Q1S9gnW5DD4fUMs5Bi8V2E15ZiIkzcgX9WRGXjeJTOMYwBZd3wVROVPSonFP4a229dk5ZJfy35jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUp56oyq1AxbnvAGjYgfctA7iFOFxYTEUR/k8qFvodc=;
 b=FU92lcaqL6oFlio6z0/KryT6HkVqsTK3M4///wuXsUnjEJ07HpldqvGAhjL4gtUjpP4+/EgVOCYMv3t9pn8gft0KjiSsLLUo3ArLWm/Dmcfy7CfmXMWn8PPzFH7pgthc2uHyOl5ndq1ikNpv4852+hAegpGVRpYzgmXvCUIRCx7eou2xU+brp7lGZEEZYpWYFs2xpcDTcjpOggywE28si388f86z1UBKYvwXJE7CoZLDPTkPWKVtSYF237rNEElbb8cmgfLAZYUGQtueJA+WoZSkReDHzaYBTNjTMJqCOkdNthUL/5dw2JUBiEubf2RnXXOX6gtq8ChdH5WXqeVGvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by OSQPR03MB8460.apcprd03.prod.outlook.com (2603:1096:604:277::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:36:20 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:36:19 +0000
Message-ID: <3b3f890c-2649-4a29-a620-203d4a72688e@amlogic.com>
Date: Tue, 16 Dec 2025 10:36:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/3] decoder: Add V4L2 stateless H.264 decoder
 driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
 <20251124-b4-s4-vdec-upstream-v2-2-bdbbce3f11a6@amlogic.com>
 <9b74086ac938475328904960add2c284b81efd4a.camel@ndufresne.ca>
 <12f26bf8-409b-4206-a39b-4bb2a14edec0@amlogic.com>
 <f9c113914290a0701614c64b5e2167d4b3e21646.camel@ndufresne.ca>
 <9ab31529-8146-4ca7-8389-04c69f7d1b49@amlogic.com>
 <04287d0b6207c98f24112b492b9ee52f0889da39.camel@ndufresne.ca>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <04287d0b6207c98f24112b492b9ee52f0889da39.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:3:17::30) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|OSQPR03MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: f6cf413c-7080-4a5b-a8cb-08de3c4be4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NS91M0E4UnlZbVo5blZ3cExnejluanRzTTMwMmhjS3VKdkc5dUc0Y3MyV2Rj?=
 =?utf-8?B?bDNiVGR2Y1N5VStXek9WaG1IZWo2MEdJWmRZVzQ0R21pdmd2dFBVTUROaE1j?=
 =?utf-8?B?K0w3NDBrdGI2NDh5d0VvSU9WZ2JiWkF2Ui84bmF2dnJ5ZEZXd01UbU85WVRV?=
 =?utf-8?B?SVpBakV6bG42VXVKZUlKUEMxdFF3bWdxcmtDZGdud1BBRVFPQk5qWTNLbHp5?=
 =?utf-8?B?Z2VxdCtKclU4MTQ1OFBZdUlTR1hYdDlJZERxbmxhQ2lzTm1yUS9TajNrbzdO?=
 =?utf-8?B?SDVOaEVENWJRUzZ1eTlSbU95NGlsbVNFcUxMNjV0NStVZlJ3NFJDelVGT3hu?=
 =?utf-8?B?RjB5bk5ubFhPc0VCMEdYbFF3SG1GRGN2V0ZqK3VtOEVGd2FMZUY4dGdTZzhL?=
 =?utf-8?B?bTRkVng3RmJpNDlodlVwdzBCdzhQaWI5amNQTTZHT05tS2x0OGFWeDQ0OFJY?=
 =?utf-8?B?SzA5UjRCbjUvZGhneWVNTjZsM0VEUzIvdG9pSHUrRStWM1Z6R2x2Y2FEeFQr?=
 =?utf-8?B?NzJ0bFFZKzFGeWVDelMzdlJEZlB2Z05iaUt2bUUvQlAyQzk0bkJYcnh6TVpq?=
 =?utf-8?B?dzR1NkZqVnp3ZEZqMDhSenRXRS81NGwwVk1Tc0dqTUtqaE1YVk1MT2FqbnY0?=
 =?utf-8?B?WTlZV1l5QkFDb2ZNc0l6S1VaTVlldGpJcU1seCtMaU56d05TWlRFQmhaTmFs?=
 =?utf-8?B?d0d0UnByRzZjTnF1S253NTVFTUVDR3FFTk9UcXRjTHVNUURkWnhkTlhuQ0Z3?=
 =?utf-8?B?SnorMWx3TlNTK0k3WWhvSjcydGsycWRKcEJUOWVhTXh4RjMrZGFYVWkwWEdv?=
 =?utf-8?B?alE4dEc3andjbWpjdTZsNFdmNzZnNjBwbEM0dWlJTHB4TnRPVTcwZVRwaVZ3?=
 =?utf-8?B?QlIza0VsQ2pYeWhWWWpLdkhhRURpaG1VNnFIT3JMeFZvUUI1cmdNREhudis4?=
 =?utf-8?B?djIrTDdqTHhqMUpGZFgrMXNUcXBRZGFwcEt3UWFGMHB1anBjNmZjUUplS05C?=
 =?utf-8?B?dktvd0lUYzFobzNGNkdTQmdkZmFoZTNPalllZzZITlI0Si9LeHV3Sms5YlNs?=
 =?utf-8?B?anJtNWpMemZiNzVteUR3R0V4YTU5TUNTVis1Z0tMQUZkVjJMOUlkTTZWcGxO?=
 =?utf-8?B?alp1TXJXSUFmdFB5bklBYVJML0lBck1ISktPZTRzTEl2SVp5REVZdU96WFM4?=
 =?utf-8?B?UExXTnFnZWJRNnc2Q3FvWEIyK1J0TXBXV0N0L3oyOUdUa1FtaTdvQk9OUWVw?=
 =?utf-8?B?RXA1TmJTQVd2dStiS2JLNGpzRVJpd2pOUDNzMFc1U3Y4VjVzbnBNT29ZTkx5?=
 =?utf-8?B?NFFYNTQ4L1JtSkJ2Z3dhSEtsMGVHWU5rTG0ycHl1by9GWW5oc3oxbnF5MWpp?=
 =?utf-8?B?QzFqZkMzbmEzbGsyTlpLR2gyalJuWnNYVG1JWFM5N0h1Z1I5QUxoM2UwZ2hB?=
 =?utf-8?B?U2ZEN0t2RzhybDgxOUI3MmpSNkpOUk85ZEhSUytlVFJrcjUwTm5VQXdWRGFu?=
 =?utf-8?B?V1lRbStqeDFzSHM3TUp0VUh6OVZ0Ti9jdGdJUmZkbVg4RzlvYXA2R3ZsaVQy?=
 =?utf-8?B?SlZNMGJkM1ZnWDJydVRvdlpiaXhaaWRVY3czOGh5WWVyL2lkRjRMY2laNTNF?=
 =?utf-8?B?UllpZ3pWQ0wyUkVjT2VDMGRKVlNyZjZja29UTGJRYmQ1cFRzUFpPMHVIaUc5?=
 =?utf-8?B?cmFxZlpPRVZwUnNtWVI3TUozeGoySFBsNCtzdytQTktXTnQ5MFBCSWFtWlFX?=
 =?utf-8?B?QlBQelAyZ2t4cm5WNEFFM0pPWHhYUk9ER1dYOFM3K3ZPdDNLeEN3czgvT3lH?=
 =?utf-8?B?b054NFZPRHphVjczVFVIWmQ2STJ1N1BBb0VueGtYNTNkK3VJLzlZMGdXd2xi?=
 =?utf-8?B?OEFiMU02RE1saGs3T0JvbjlrbWhPVFFoMWJRb1I4WEFyQTJ1S0pyNVZWc3VS?=
 =?utf-8?Q?cfx4Xr1EpyU8MPKd7wrrp+8PF8uO8vd9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXVGZ1ZlT0RSSU5YRm9hTE55amQvUEJXTWxQTzFmeUQxRHo1YmpUbW9Pbld5?=
 =?utf-8?B?T0E5MzVSMUpzYU9TOGRGN3hMVzg0VEoyVkpJL1RUWVlYT2tYOEx0ODJablYr?=
 =?utf-8?B?Wk5seWs0NEZObmlZczByVmFhS3FNclFpUXNYSFdWbXp5U0Q0L1luMHZZNWx5?=
 =?utf-8?B?a2RheHVKeEdqK0JTYmlrdEptRWIybmRhYWZPeXJZeHJMNVhuZERqVnZoVjNh?=
 =?utf-8?B?V1U0dG5EMWc1ejNUblBIK0IvSnVpRnVSYVRZeUw2WWpDbjc0WUJtWGhoeFFr?=
 =?utf-8?B?OFQzMFV4bWpVb0cwdlRuQkNXTzFtUFg4ajJwQVJkTlBLT3pvMHRkQWxJVkN1?=
 =?utf-8?B?a2llQUcxYmUwU0UxSkhUUGVxc3dHa3E1MFN3Q3k4c041d3VLVHB2L2JRS3Vi?=
 =?utf-8?B?LzFNaGRuVDRwUVUyMWJYdUQxTVo0cmhyaW9pSFV6bGNob2hCUm9EaDZVWURv?=
 =?utf-8?B?aGdFMitOcVFPSHlDbExNK2pXSm9Hc0hHS2c5ZVlDS0c1VG9Hd01yZkRLdFZn?=
 =?utf-8?B?YnJoeWRQM2lnV01uV0tiYlBwTS9PNlYySDlPS1hlZGgyVS9WUlR1TjU1WG9B?=
 =?utf-8?B?M2VDbVNaNy9YU0NkZHZkZjRvNFZTY29NR2p6bkVwYXBrMklZdmtlM2k1dEFV?=
 =?utf-8?B?ZWZXSHVLUk1rRW1iako2R0lMUWNuN2tNL3BWV014Zlcwd1pjK01pLzRqTEFq?=
 =?utf-8?B?d0N1VnY0anNVS2gwT0UxTTY3RWVuWmY3dWM1Ly9ZL1I4TFZtRE9RM1MwcC9Y?=
 =?utf-8?B?UzlSN2l1OTZ4UFZ6dEVGd3dweHVuK2hlVEFhcXVxait4cTN4QUdpWG4wSENt?=
 =?utf-8?B?MDZqNVZoSjh3MDlWQXR6ZjBoUHBnTytDUHIrZ2x0QnpqZGMydmZlbHdDVkl4?=
 =?utf-8?B?NmI1RXdZd2xwRGpLZnRCRHFtZDlSN3NWcjJXN3lwM0RjdDgvVmF0aFc1d0pv?=
 =?utf-8?B?REVCdk1LMWZVOSsySUZLM3NITUZOMDVPd2J0RDc5QTlhbE50c24vVXBRWFdD?=
 =?utf-8?B?TFNsMGF0UmZEZlBFUVdHclk5bjdHdndnK1RoOHlWT2t3cDF4ekh5NzVRSUFZ?=
 =?utf-8?B?d1JzaXRCNEVnZ01ic0pTNldDYTQrTkZyMnlLenZCVGlxM3pVTDUyK0YySHhX?=
 =?utf-8?B?MGZDOUppTWF2dTVSdHRKV2dCVktEd3VESDRESUlLTHFDSVdnbERjVFlxY3FE?=
 =?utf-8?B?OGltbVJJVkZ5OGVvcWhoalN0V28zR1VNTkFYZXFqd3g1TWRXc25vU1hzSG5J?=
 =?utf-8?B?c25YYW1rTVBSNGU4bGJhdkJrbEdFdnlUKzFMYlhKN2VzSGg0TWxnWm9iYmRB?=
 =?utf-8?B?eEwvSjMvVUk1cDFrRERDdGorQzZJQ0hjeVU1MzF4Z016blc0K0pRMEF5alNu?=
 =?utf-8?B?VTFZQUtOZmg0OEhEdDBMUVk4SWt6YkpFU0pHVEFQNVZ2elBtcTJrTHRBNlpN?=
 =?utf-8?B?TVlwdzIvMkRxUFJqalBld2pHYTJ5NGt3OEhSeXc4S1NKUGZiWDU4UWd6bG9o?=
 =?utf-8?B?TjZLZE90enJkdW9XQTlhejh3UVR3RGpqSHdneXJDVzJUT09BTlptc2laOHNN?=
 =?utf-8?B?Rk1qWjdvSUZFS0xDZTV5VWErcVNWVFhxYXliZGtlTGpGM29VYnRnR0syQ1RB?=
 =?utf-8?B?Um9KYU5Ma09pS1hrY0NMdFhQSml3QjVTYmZEcVJEeWdZUlhwRTRkUHFjNVY1?=
 =?utf-8?B?YTJoeldKRG16YjBKVFRmMjROdTVkbEJOZzRwNzg0dU5PL0tuZ0VDRHhSWHd5?=
 =?utf-8?B?TFRyVHNmcG5zNGtNMk9QeERRemZJeWJBNHhFS0ljeTdUaVo2MENYNElVcjVv?=
 =?utf-8?B?NFRIMVQvNUdITkRLcGUrUXZKVTlFODhOSkk5ajlZOW02dk8wRExoQlZqYjJM?=
 =?utf-8?B?NDlIdFhEVitqSU0rSHpyRUVNR0VQelRNaGVXenJJanJmMkhkdWQyaURuMXpo?=
 =?utf-8?B?a0xHZDlsQzBXdDAzckdieVJESzYxSmdPZjNlVjBZUXlUczBqbUFGMGtRMjlw?=
 =?utf-8?B?K3RrVFFaSWt5VElVT1A0U1ZVZ1hBaXpTZkVocXI0aytSejVVb2thYVZEblRY?=
 =?utf-8?B?czJ0c295azZ4UnB5eFovNlBkN3AwcXplYjZQT0lkalpwT01jVlJpS3Faalp2?=
 =?utf-8?Q?6b1NaV7vvNzJ+kaPGmTKTeFBV?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6cf413c-7080-4a5b-a8cb-08de3c4be4e4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:36:19.6514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SP/OSj/mn3xQIEAdGoWT4WzIa5uBRg1QechFDgkCLEDGSNgew3CYL+Q3uf2EozRZ0CAkHffOZ6ayk1To07cy6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8460


在 2025/12/15 21:58, Nicolas Dufresne 写道:
> Le lundi 15 décembre 2025 à 10:15 +0800, Zhentao Guo a écrit :
>> 在 2025/12/12 21:51, Nicolas Dufresne 写道:
>>> Hi,
>>>
>>> Le vendredi 12 décembre 2025 à 12:11 +0800, Zhentao Guo a écrit :
>>>>> strcpy() would be the preferred helper for this, no need to fill the
>>>>> leading
>>>>> zero liek this, see include/linux/string.h
>>>> Ok, it should be more suitable to use strcpy.
>>> I have to correct myself, I meant to suggest strscpy(dst, src, size).
>>> Passing
>>> the size for safety seems important, and unlike strncpy() it takes care of
>>> the
>>> leading zero.
>> Yes, we use strscpy() for copying all the strings.
> Indeed, I had miss-read, then you simply need to remove the code you added to
> force the last byte to be 0, this is not needed with that function.
Yes, I checked the function strscpy too. It will add the \0 if the 
parameter 'size' is proper. We will remove this step in our code.
> Nicolas
>
>>> Nicolas
>> Thanks
>>
>> Zhentao

