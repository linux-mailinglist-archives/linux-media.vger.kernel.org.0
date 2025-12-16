Return-Path: <linux-media+bounces-48841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89067CC09D3
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 03:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A588301CD2E
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 02:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5C12EAB6B;
	Tue, 16 Dec 2025 02:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Db2sn/7S"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022141.outbound.protection.outlook.com [52.101.126.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB572E9ED6;
	Tue, 16 Dec 2025 02:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765852592; cv=fail; b=lrjgoLxJWnm27WJv0q9BSpZXyLGi4RoPalbuVhYhiBtK+QySQW2CDFaKdPuu/w0AEaM9HZwkT0TBKdwDaoqfQ0S1QKAyS538VVtLK+A76r3WT1WT+vAKqxPCitBODrrkzp+PzhemY70vppnCAYwPEDLgpz+YB1FhF8eQ7Ry8YMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765852592; c=relaxed/simple;
	bh=KjP4UXvI4u6rn8bvL957Bj5veKf7dbZEX1L+K3g18qA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s0l6JDwA2dYETJWHwoKgLfE6mYxb4rK4gaTk91+Oz0TxHvxbFsppqZC5/5kXydQRAe9VWeOq5KFnKbqn15v8PrLOBs9GqsQ8aZnFj7uvjJ5JjDnUtmavA8AYcrWkhIifyOkQgpEALaEtD4hhLLbCRlBL/nhK9P3v1f0DeUMJ95M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Db2sn/7S; arc=fail smtp.client-ip=52.101.126.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ixs/iSGWuI66HSK8gW3xRqUHnBm2MDpVVwfexcmCDn+8A42wdgBRIIQdzQJTDYwXjwo1Yd5AVUVvJRfB+k7vakku92SQkAtVst70SrbTk/ya9pOzbAnzUf8eRQA08W2/thDcIAoVtVFWZfk2TnKKYs6mSFOPFR9iPm0wq/M5lOc2B4GGAxjz1Cu3erpDvVCSy6vetOnLO3LnyyXUuLz0swfnm1U2vdhHZdsIwPnC47L3yqlBOGEJpRvb6utunBVQmEEisEPJwesBr9EO+5aK0RhjM6LiRyco53U1E9eC6lz8UPWenix9soXVkMzPJiXzESgB24XaY8omHJRTylNIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUp56oyq1AxbnvAGjYgfctA7iFOFxYTEUR/k8qFvodc=;
 b=oqqq6gWSDDsV9OYkRUsbwi7ZBhjDw3zn85H6Y9H9rWU7ekLOw7DK4Q0Tb7QrsPuBQRGi6YI/Rumwu/JN9DRx9kZ8IPnP9UeT/yT6VhthSEhm9VDK/JIf18fY60AenYFZi8S8tedpBfRPQC8ZK4Xs67qtplcM/i1bz1Y+UeQaLI8TbRCk36tonvbakAa6bI1ihChT54w1pTSVHN48/RyUfFikPSlo7NUPSomnXBgqH175nIzmFkqvaYyG0ipXkB7hwSyxzp83hHx2WLdyTGBO7FJLlrIB8Pdyn8/KonF6o3DRfhjMED3zaXwB6LSUEQg5m5KEQ3kJR9d8GkDtNbOiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUp56oyq1AxbnvAGjYgfctA7iFOFxYTEUR/k8qFvodc=;
 b=Db2sn/7SGklEbuvfE0B/Q5197hRla1oEcLAcS65bk5xIeKmmVldQj60CG0LNtnffs5l2/++7pRoORTKq5pEgSgscEvjC0A7idTOlKh8WehZWP6rgGhySd/zOj21hAj53dW5Rl1rodOcIBElLiztWrQV+WR4d1OB021XPJTOSE/FxWwQVZzfZGs3iyRlMFRG3/BfoinzJYaPMMtL61S7F4WbDE/VtPfYIfc4oYEDoSqa68NopI1e6rSRM3FH67RH46gbGLhviWzHppjrV7XcqM7/JkgveRfk2WBBlF50Y8iWffoGVXgG2lKFPCQvu7ZQYHfQBZkGNBHsXuPsoFmPPng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by OSQPR03MB8460.apcprd03.prod.outlook.com (2603:1096:604:277::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 02:36:28 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 02:36:28 +0000
Message-ID: <d8011eea-5073-4619-8ba2-05a2a3f251df@amlogic.com>
Date: Tue, 16 Dec 2025 10:36:27 +0800
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
X-ClientProxiedBy: SG2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:3:17::13) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|OSQPR03MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9c6c97-0ce5-4d78-e5d6-08de3c4bea52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTVISlRRVWF2MW8yaWRaSlRsUy9CUmJDSTJjbGJEUzdUeWpjbkRybEpGUFNi?=
 =?utf-8?B?TjBPQkpjWStFZDlTeWVaVGVmOThsdkxPM1dYVVVOcE1iRmdXRFFIRW8zSFNU?=
 =?utf-8?B?Y0p6ek1sUFpWNDFVSHNWREdBdC9RNFozQ0czOUcwb2VzTjg2Qlo1VnBoaCtM?=
 =?utf-8?B?Qld2SG5SbzZLOFJMQVZVUUFydjMwY0pqL2h6N1VROGFGT0VBM0lUOFdJUHNE?=
 =?utf-8?B?ZjRmK21LRUhSbldsTGFZVmZsYkhvZjc1aDlLeC9OaWNYemFzVXVKNm94LzNr?=
 =?utf-8?B?TVRldE5GTmMzMXIyL0Jia2QzYUFza3RSaEdmZTdlN0NpSzViTkViT2NUd1hC?=
 =?utf-8?B?eDFHWUs4TXJJeDVST3BGc3lXV1IwenVmWmhKY2k4RWo3ajROa2tpdWk2MTY0?=
 =?utf-8?B?dkdlSjY4MHN3VzNmSjJnNExxakdSUE83Zmk1czB0OTBUcGJmMW9IL2x4dThy?=
 =?utf-8?B?UzdOT25jeW5uUlc5TGdkSEh0ZzRubER6SGg5SHJFbGJMNjZhWnNhNlA3TE9q?=
 =?utf-8?B?Uzc1R3drRm5lUTZZcHRrMmt3ZWlpa2NCdUIzSlNzWkFBeE93YnhDVzR5RHNl?=
 =?utf-8?B?WW52MEt3eWNaR1VlODNFeTZkTXNWNFpmTmV1cGZwb0lud1lSOGFiUnlzcU9C?=
 =?utf-8?B?dEJUaXZEcTRNRCtNZEdtdnFuRXIzelRPd0s2Rjl2OW5kenA4Y0xiYjFOSFMv?=
 =?utf-8?B?dzBaclB4Wlc1VG1NNHNYWkJ6c0JZUnJsd3ZHQjVNdzlQQkNPZjFOck8vb1lG?=
 =?utf-8?B?WW50UHNMZjRBOG0zN0J2Mzd1aHFHelpRUXZ3MUcwbS9YZXJ0TlpMd2tjMDlJ?=
 =?utf-8?B?RTk3Z29tVHBlbHVqWmNWSXc3UXJBTkJGSTVYdTBEWFkvVnZKTzBkK0piNXJS?=
 =?utf-8?B?NzlQWVFNVnhiN0hqWGRuNmZFNk5Ma3ZobmRYNGhJM1hNMERUTEVMcFU0VnBW?=
 =?utf-8?B?NVdRUG1zUTQwRVhleUJkSURVL0Z6bkhkS2xzWDE3WmsydG1rRkZla01PK2tF?=
 =?utf-8?B?VEFKN0FLajliQVpsNWw0b1VTckl2OE51R2lnZVpoZjBBMnFjQ1IyR01CU3B3?=
 =?utf-8?B?R1FvVDdRTjNuTmNSQy85S25QczNqL0U2S0pMbGtqM2orY25hUnJwdjcyYTZs?=
 =?utf-8?B?cWxOYzdvSlBnMi90aDFFRzQwRlNkTkI1eklPd3pNZlBMbEMzNnl1aE9Jek9h?=
 =?utf-8?B?S09zQTQ0QVJzMHBQSnByZk85R3lBMHlxQXRSYjV2MnJTWENyUDZ4eDRvR1lo?=
 =?utf-8?B?bXFRNjQraER2NmV4b0pZK2FiL1F0MUFtMkdxV2hhbERvM1ZjL25nTDVKcXZP?=
 =?utf-8?B?b0xTcytuRFNDTnBUTExTa25WVkNmb3RqVXFxcHcraUdYUmhybXNWYUZuWFVJ?=
 =?utf-8?B?NHU4OEVnRzAxWS9VemtFRW9JZ1AxczlOdGxZU1kwQ3RqTnIyMVM3d1QvdzB1?=
 =?utf-8?B?ZlFNYkxndnM1d3Rnc0Z2Zk5QSXZWY3kyb3BJTEtnK3Z0TVRES2U3dStta2RZ?=
 =?utf-8?B?Y3ArT3lyWHVnbHFad054alRMS2RudFlJUVBNWWtjZGhWTjFvUkZTaENDdkpL?=
 =?utf-8?B?bG9XLzhTcTRwWVc3OFlhaVhweWtLenluenlvaVk3dGgxeGlnaVNaVEF2WE9F?=
 =?utf-8?B?enA4djNpOWZOZ1BCc0JXL3RiYUhJM0Q5YWdIUTBVK01uelVudWs0dmh2bDRT?=
 =?utf-8?B?am82NHZIMFh1bnhMcGd2cVBuR3ZiLzRTemFZd2gzSVNNSnQ1Zko0Tk1iZ3pI?=
 =?utf-8?B?OUIxMWdCZmljMlZZRUJkMzdYaUp2dmtQZUs2V2c0TnZJeE4rdkhHcHR5WUpa?=
 =?utf-8?B?NzlIaHc3YjZmWGhjdHNFWXVualMxelJ3SGUycjh5STZ4Qjg5OFhsdWZHMXY3?=
 =?utf-8?B?VTA4QnlnNzNyMEhsNnFnSlE0NXJ1elBGWUlwT0o0aHRib3RlN2JmcXZ2ckdF?=
 =?utf-8?Q?uG1AntlW6/NQVwoXC5cNIJHVoqQ33QjJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkNxQkFNL1RLRzZEMkEveUZreVIvTHF4QS9kek5VYlFxbVpoYlJEcUR6Y0tQ?=
 =?utf-8?B?ZEtWZk1wd3BmeTcxblhDT0lobHJXRzdaaExSUmFVTUVaRWpmenhnUFhxaUtK?=
 =?utf-8?B?OENXMks1cE1OaWRSRFlUQ09TN1JxVTlseFdUYWx4SmpkcEJzRUJraTlQVzlF?=
 =?utf-8?B?M0g0ZS9FRnBwWTIzZjJsdnJ5YmJZRG5MYTB3bnlwZk9kMnd6K2tlRU82b2Jw?=
 =?utf-8?B?QTQyMVBGZFhQM21NTWVibVZla0d1WmVYZnY3SnZpdEJmS3dVL3NmWE9PSWYz?=
 =?utf-8?B?YlZRbTJ2ZGRWZC9SOVA5SlRlMnJJUjl6QTBTNE9NMEpHZHRRay9UeFZMaFlY?=
 =?utf-8?B?ZEJESFdJRytDeERnWXplMVN4OTI0b3NBdWc4ZU11cElXVDl5MXE1RklhWlBk?=
 =?utf-8?B?VXM2cXVZc3FmYzFKVFZzUjJISzNxY0t2cHU5M1RiVzd3ZWV6U1JLbUdTdXdB?=
 =?utf-8?B?SDlWakpUL3FZaGFlZjV2eHRoa3JNN1NEMFpENitpeVJ3bVROZVU0VzFIY1lK?=
 =?utf-8?B?citPUGdwT29IT2ZWVGdPVm1vYWtTeDBwWDZEekVSWWQrcEd3S2p0OFhxa3Y2?=
 =?utf-8?B?MlIybXZGQTdVNDNRVnFNZHgzTXc0RUcxSHVLYmoyZzhLL3lremI1eUtDcEVi?=
 =?utf-8?B?VmJ0U1VLZk11Z01neHBxczU3UGhSUHpOVmIrbUtFWTNlWmVINmNrL0F1c0ZG?=
 =?utf-8?B?cWI1elVwcUd3akQxbkhMSU9QY1E5cWNEaDR1NDVob3Zud1RUYmRaeThjenlY?=
 =?utf-8?B?c1BrVGhhS2pDaGt1UnVFS2FGbFBUdE4zbUZQSlh0eUhRNksyazA4cS9NczNp?=
 =?utf-8?B?QjREYkpyM3I4TERsdklUN2VzV2E3UFBvZ0ZGc3czWG5kVnpFTytxcmIxWTE5?=
 =?utf-8?B?VHk4YXIwY1c0R3RjRzVJYzlFWThPWHNZbnY1Y2xxRUF6WkNnWkFSTTdockFC?=
 =?utf-8?B?a0tQREdaazh5VFR2Y1l4N1k3V0ZVcmdVWmdlZXhDRDV4YWJqZjh2SGJjUEU3?=
 =?utf-8?B?bVpFdmRpVmJVMjFXT1BzRkZvbk5GOC9DZUVDeWpObU5Jb3hVZFJXVnJrTlY1?=
 =?utf-8?B?OElZWG5Pd1ZYMmY4OGxsZ2svUkM3TGlnM1VKN2RjNThkVlFDTDFNYXlLYnJM?=
 =?utf-8?B?NEczK3hHVm45c2VxSXhtNkRxZlNvVHBxVittU1NoTVNHOXllZ3pjRGp5OVBt?=
 =?utf-8?B?Y0x5T1V2UGQ3WFNBN2lDcEFPUlFCTkFYNTRTck5ZM2w2OXA1U1laVDV6azhT?=
 =?utf-8?B?bS81SHNwaVhKckdJL1JtbUJaYVNXWlhzVStpS052OUJaYXNzNFE5MER4Q1V5?=
 =?utf-8?B?NkdKSm1scko5QlYxRnF6dFZrdGRMTG9kajF5THpaQ1JaaGw4bXRsK2h2SjhE?=
 =?utf-8?B?N3ZXM3loYkxqcUpXN3Yyb3J6UVhCQWpiTTlLVFdGaHVjZFpQUGdNWnZWS1hO?=
 =?utf-8?B?QnRXd3RwTXN4V2NQaDFLU2kwVmpnQVg3WFNSQzZWSU1KRFgzR2VXcXRkN0lt?=
 =?utf-8?B?UHVGUlRXd2Y5NWYzdGV5Wk54N3B4Wjd0eENtUDlYczBtcFU4eGFRSjhucGds?=
 =?utf-8?B?bVN0VFIyTXdSRUZIQjgrOXJoOG5LdVpackJDOGc3cGpUWWhJNS9mV01oUkY3?=
 =?utf-8?B?R3FTUGdYS2hYMUdLV2l1QTY1NVovY2JudWtVSXlQZHpIYk56RE9OVFpuMmZt?=
 =?utf-8?B?cWZuaW1ibDcyOE9oNHduNHVmbzFyY1JlRkJmMVVYRmp3SU42RWgyQ0paVHkv?=
 =?utf-8?B?RE5HK3pTcGo1Q0NWWXJnWWVVZHdRZXB3d0VXRERUZTdPNWZEeWJ3MlVNdVRI?=
 =?utf-8?B?REpXbExJSXdLKzRibVZYSzVJZGhjdkYxeWN0YkcrU1hnc1FmM2VEUm5JVExl?=
 =?utf-8?B?dW80eTY1dWZlL1ZKcEh6S2JBdEVRd0hPNGhEeEdWQ2hKWS8ydHBxeDQ0ZlRE?=
 =?utf-8?B?cEZqUThLQTFhSmxVUjRpWEptaGRWRE1MblBEcnhEejJVbXBSL2sxY1J2cXd4?=
 =?utf-8?B?dW56UnJNcjhJbDRGd2RmVGx6V0ZxUmdKM1dndTFrOVJmdGZkMDRXUktEOUtZ?=
 =?utf-8?B?OWUzQ1E4L20vdHp3aGM1ZmZsejR3Z0JCMmtTUmlaYVNyT2JqZHpwTGVVWEZv?=
 =?utf-8?B?NExXYkE4cTNEUGRtclJhRW1xdU5tSVJhNUppRS9RODNGbUtmeHcyek83RDhM?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9c6c97-0ce5-4d78-e5d6-08de3c4bea52
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:36:28.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyRP/VWDeiLEisA05jLCdxjS/xIKnUr3wzXt7UQQeTsk4M2y6xE6ZA6qcUYR2koOQVogWYvwF+38lrVZX6oFpg==
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

