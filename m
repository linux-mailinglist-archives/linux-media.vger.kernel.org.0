Return-Path: <linux-media+bounces-52705-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC3+D3nrjmkCGAEAu9opvQ
	(envelope-from <linux-media+bounces-52705-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:14:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9713813454F
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE2D7303AB58
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F352934B1A7;
	Fri, 13 Feb 2026 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="qEfUQq7r"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023143.outbound.protection.outlook.com [40.107.44.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BF8330B27;
	Fri, 13 Feb 2026 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974059; cv=fail; b=fINS38nGeISGExYEL7z0tXrogQYBlFufq+7CIZilMft+Q8y2xGtuHTjkaUFZ7TDFp+Y5MFwpRK2EKo1XSQAWtgqnVeFxU9PztiSmSOkJye2I9iEuyUiCbG5joDwJHBRcWRmRxIddwZOET9WbNLRNisWWyhEf2GjHyGfmyThc5dU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974059; c=relaxed/simple;
	bh=TbJfYk3PdYuhZ0A7iZEik0cY5vWME+nwprv8Wiz0gQs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a+mtCpmywJECPirTox1Wkq7cBQJbw18qMffx9TbX+gJbmD1pNgpPA65pVskkmFa0XCs1LSe1hbEOfBj8ArHhry2b2+7IneRxQgg4EJtlrfvIYm5fcaGsXGybqBeynFlOgHaztJSsRMeZcNpOQuk7uDcwkfd65AXzi8JIPeoYkRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=qEfUQq7r; arc=fail smtp.client-ip=40.107.44.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6ivDsjzx6+YXH349Ycc6mQ64TOfTL1GGzBvZFULwp3W74C8w08dm3oYQ18khdxQ0oo4PslA7f3Fymk+hVeNZqhxuXMThyjrdEK+TnL3QnAZV9hQEuMPqPrSW/PP2CsJV8l0IEnvTAMqD5efZ5bs7abI3T+jwBd/b2hdtaAvUSXoxeGSDfPKfsylOz7oj8A0cRJXQmc4qKbH50pN2eHlLXhhYecfV2Mfw5qUJImrNMjZX+XdJiE8K3C2KKeUXwuiGIXBDfXFIlN/6j24PKNh01cjauDGiG+HsZdElPXpnpLh5fY+Xt8FvPz3e9oMPhj3caBn1asEVL7JHRzNcgFrug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkXY1HpTGxO9YiCJjAPDB/+iSBHoU1L2vq/I1U8gs0c=;
 b=Z8xPL0fJwyuHtv0WrB/ZRESDxUe8SHvUCwMN+UrcR5tFiQn7oAqFRqVU02RVmogKWNcnUuyGCzP9V+wiZR2hov5OWML6QyjFiTM6/AJpyq8OImiHP2r82aukLJm5vP6TYqkRUofX8M83CXxkBiicjFEff+hV0hNR/HEXdG+ObmdbxKYQdZD3SlVUf1S6U1kRVSbYKX4ZjDALDlb+Yu1PUl7kbxuW3Llm40rQJDAkSSrFm1WvmYgs9hI0KwPwbPBZfGaKlyy6/YeG99BpHIwQq5+dN7aLEJRqcSpAoxZ1IqKqtRcE/harp8VWHL6tPOGTYfnyDBBbKAxhnmI0gfRXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkXY1HpTGxO9YiCJjAPDB/+iSBHoU1L2vq/I1U8gs0c=;
 b=qEfUQq7rk+/THzA2Bzv1d4Jj8QRWogilU+LGQUVOQQ7G784P1VEj8ozdxCWPrEwsVDmhmOlIhfeb0f7B2A1nLi7i7fmfs5YHVHHwbPVdl5fOcyNSXKOerh0zGAe7NBjAogAbarl3EWPqUWEmouiVJIRAuxfZcVtvKesGAfeERGqKhiw4xlwZ3woz0dIylHxAaDN6lGh4Vp4PEiIgMyc9Yp7EVbjX+LTVj5SaygPfxYMIpMXPjcRmUxJ6RfKN3mtisWLoj8qLj+/Scv5PfRL65RiXcwACykgaEXC34L42oD+XsD34iY85/QEfSB/W9r2Knzz/lSR/48puknBjJXxQMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by KL1PR03MB8403.apcprd03.prod.outlook.com (2603:1096:820:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 09:14:14 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 09:14:14 +0000
Message-ID: <df5ec40a-8674-4983-a912-8aa2bbfd2da7@amlogic.com>
Date: Fri, 13 Feb 2026 17:14:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
 <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
 <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|KL1PR03MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 692cffeb-9afc-492e-2b70-08de6ae041b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0QxR0orNWlLeVcvSys3ZHlRbWRzR05uSWdKRmdPd3hmRkFIVUJxTnJBT0cz?=
 =?utf-8?B?Y0ZvUCs4cjg4ZWVmNTFEMUwyTFRLMFUzMU9pVnZIRDdjZUJJeEluNndUQ3R1?=
 =?utf-8?B?YTU2ODZ4YzZBRDJmM29DWFNuVitvOFJxRnpCYmN1L2NOZ2JqNERUVk5STVVY?=
 =?utf-8?B?Z1dKVkI1R3p3K2JTcGphdXpRdkxsVHRmK0I4MGc2TVFIMlZ5SUkxdzBWSytt?=
 =?utf-8?B?TXl5c29idnpaeFI2UWd0NnkyNW13VHUzeFJ2cGRYVHpLS2V4NHdrSVZ1djBq?=
 =?utf-8?B?SjVkQW9qbDJuRFdsR3JoY3JGY0RiV0R4QkJiVFBEOWIyWXZySG1CYjV5ZU9J?=
 =?utf-8?B?SVNWZG90bTk5MWFGVmkvWk40bm1LQytodDdueDY4dFVyQnJURjRYYWVidFF3?=
 =?utf-8?B?TW1tbFd1RUVYRHJ2Rm9qVzVkV3RrdkpXblE4SHYzRVpJczdKa2FKMUhEQnJ3?=
 =?utf-8?B?dkIrUnBoSzVGVnAzaGtMdHBRTGRiU2pib1RESlB4OUpEYlhvYWVoY2JtdzBW?=
 =?utf-8?B?SkUxeGU2a2REcVYzaVg2aytrTUV3L3ZqUWlVM0V0M2drQlMzR1hrWGFsRVE2?=
 =?utf-8?B?U2RjK0tnSFVqTmZ0eFRFcStnN3FkWjB1TEhnZ0lyVzIxU2xKN1BEVStBdlVm?=
 =?utf-8?B?bTY2bFhqVW5IRnFzdGNpRHRwY3VLS25rTktGd29zYkpVMHFCRHV3UVd2bGVm?=
 =?utf-8?B?MzJLM3FzVkEvbWxpdTNKalh6azUwN1JwdmcxVkpUV255NThQNTRzOHNOWkZq?=
 =?utf-8?B?TU5lV3RhTndmRE1IVDZxV2trRDJpS2tKdDYycWdidHVwZVYvR011L1R3WGlT?=
 =?utf-8?B?ZzhmZ0Y4eU9xbVRaYUVUdjZ3aGJQVkJJZ0ZJVFFVSWt3OWFNMWdnaHpwYXpM?=
 =?utf-8?B?UzVJZlVlQ0VzNklaYk9yU0sxemg5TTFHQzByN0ZlWThVSk96K0dONVl0OGpp?=
 =?utf-8?B?cW1KbXBhV2tFY3lBRHNTZnFPL2tyd3RlMXV5T2VjdVJQdmM5WEFXSTZxL3RX?=
 =?utf-8?B?UFpHWXBnYkxEbXl4WTJ4VW5XM0IvL3JpWWZvVHhvTUNNZCszQm5XWjNEWGhy?=
 =?utf-8?B?ZGdXTDJKeDR5ZzBSVWlPMW9PYUxLMHNyTnF5T3pnV1Jjb2lLcm1GQm1ydU9I?=
 =?utf-8?B?MEw0WnFVTTJ0MFpKaEVidjhxSUI5MlNzOFdXcldlUkhNK2V0TWd4cEJVNk5y?=
 =?utf-8?B?cUllSWV2bGJsK0JQY2VsWHVCVHc0Nkpjc1ZHQmMzbmFKMlI3bGxDNEF6TUxs?=
 =?utf-8?B?QmN5bWUzbXFNRC8xSlNTYVM3bExmNlZ2OWVyNFRxa0pZVEZBNzJzbW5ESG5p?=
 =?utf-8?B?cGNJZFFzc3dhZVhHN25lMjFJYjF0WmV6MW1RbWVuNS9iVjliV1czUGdpRmd2?=
 =?utf-8?B?N3V3L3hKVmRwdnNsR3RxTTR0ZFBHNFBUSVlKTndtUm5vaFhnN0VIVTNyQzQw?=
 =?utf-8?B?eDFkZE5oL0QraE1OOHZudE0yeVVWbTQ5bTVmbm5BaHVlQ3NrOUViM2dBd2xW?=
 =?utf-8?B?Zk14a0hOU01OdjQrZTNVeVBJbU5UWGZwWDlOWEdRaXU4U3NsbE1zRm5JeWkv?=
 =?utf-8?B?RlNtcDkzS3d4R1pxT2JhMjR1R0FTZndkc1Flank1RnBoODg0QS83K2lOSTQv?=
 =?utf-8?B?SkhKai82UThWYWhHS01IRVZiMTBpUys0UC9IZmkvTEVkbDNNa28wRy8vU2pJ?=
 =?utf-8?B?MVBhUllEa2dlZGxEL1JZWlBTVWppWG1iVll3OWppc010WmZoU25ycTFUaVlp?=
 =?utf-8?B?NGNTWjNBRS9PRisrYjlzaElEZnM1c1Jkc1RPT3hiT3ZCS3pNMnB5Y2RpREtr?=
 =?utf-8?B?V2xyYUZ6V3JqYVorWXd2VXBHbnJWc0ZCSnM4OGhoa1FRSnozd3Y1V0RsV2hh?=
 =?utf-8?B?M0JEZ3FIb0g0Z3o1Ly9yODA3Z2c1czdwNHp3aU1uQjE0MkZJMTc4WWJDajNv?=
 =?utf-8?B?L2kyL2ZJcVJ3Q0hlU21rTWdvUmxsZFJvQ2xaNjZwbnp2Qkx1ZFlqb2xJQjNW?=
 =?utf-8?B?RjBrNnFSU1RZKzgzN1M4UEQ3UW1CNzJpVldrdHNsbURubzlKTHU5bzhVS2Zh?=
 =?utf-8?B?QWRDdHlyc3JOYXg2RWVjR0UwdEorQjF4Z3pHWkMwb1hTSzRUdzV2WHhnMlNG?=
 =?utf-8?Q?jVEw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXBNL29QZS9CaTRqeUdXYTZNLzFIdEdBOUpkbEFVOU9sS3dpQTk0czhJc0tM?=
 =?utf-8?B?VkVkWTFOUFd1T0JiTFRFSjJkUmhieEc2THJRWU5lcDc2RzFSazR4U0pUV0dK?=
 =?utf-8?B?WGV1aExqTDZUQkRvblA2UTdFbm1KYjJEOFBZcVYwUUR4dmR0dzN6bDV3cWJq?=
 =?utf-8?B?bzFxLzNOTnpIbHR5WFZWUUoxNjY5ZWQzcjFHb1R0RlVsRmJOQVgyQThDUUlU?=
 =?utf-8?B?bG83K3FxY0NKVE5DU2k4KzQ5dG5wa1pTaTRvK1pwbEh2cElwblk2T0ZDclJ1?=
 =?utf-8?B?MDBJZGpzOXI2bGh6L0YwZWZKc3U4UjdVb016SGpEczRRWEpUOUFybFJPaytU?=
 =?utf-8?B?WFd1T290bUJpK2MrZDcrRk43ZVR1UFIybmJkSXpBL2ErZUN0OVZsaTcyWGR6?=
 =?utf-8?B?TlN2Y0JWbWZGdXBMYW9kVTlqTW52cEVXWVNPMmtPTVBiWHdDVG5Ta2lOUUY2?=
 =?utf-8?B?a0ZGdWJwYTlyVDZHVGtwREk3M1dqd1VkdnF1UkFXcXc1N0RGSDFoaVMwL3lJ?=
 =?utf-8?B?Y0dNaE5uZ2ZTNWFTRTlqcWZWRC9jMlRUT2pPbkNXS2YrRTdKUHdBQURoWSsv?=
 =?utf-8?B?NUFla2NhYjQ3NXVsR2k5UlJDdEJJY3RQaXJkTXZ1cmtxbWhpTlZPVjhyME5Y?=
 =?utf-8?B?MEdEZTJQR1BiWXY4RmZUS2JjbzM1cHlNbnd5SjUrRWYxUk1YOXA0L2FDbko5?=
 =?utf-8?B?M2ZpQnVNNHZSYU9GbWdJK3dBVzkzaDBxaGhCM0J2TzNOenlwVzFnR2I3NHE1?=
 =?utf-8?B?YWcrMkdHaTlGcitNdnhUVnM1ekFyWmVJdHZ5eEd1T1puUWFsWDhNckpIZnhQ?=
 =?utf-8?B?MWMxZFN2TnF1MEtkRHFjVmdXaEZJaXZmdjFBNzliOWdoVmc3aXBOSG9CUi9J?=
 =?utf-8?B?NFhKM1ZuaDZPYnZZRXFHSk0zN1JGcmVvS3lndXZoeFZQdm4yRUxHWEpQMld6?=
 =?utf-8?B?bm15NHFQNit1ekM2WVl1VTM1L0hvS0pXVVEweEhwVkx2LzFyTS9idnhkb0xv?=
 =?utf-8?B?UUt5enpRVThxa3VNcmZFMmM2dFIwS0hiMElxYmIzZjc0UGJTNFIyY2RSR3JE?=
 =?utf-8?B?cGFISE5hZ0hFQnppNDdyejQxTVhZQUF2TjRLdzcxWno1SjAzalI3dDhNTG5P?=
 =?utf-8?B?UDZRR0hQazliMElDQXBDSkFwZzlNeXJxcmwvRU8zcFdWR1czMXNvOFZlNTc5?=
 =?utf-8?B?QlZWcWEvZ2VxYnpVdHhkaitDeWxLSmFXb0ZOclIwVS80L3BHdFJNTUlzdXo4?=
 =?utf-8?B?TnV6bmp6V29yREhDNmVvWW5QWVVmSmtoVFIzbTA4KzArd2hiUlpLWlp5aERI?=
 =?utf-8?B?ZVNuNkNOWW0wdEJ4QzJXeWlnZ1hMZXdRbG1JRTRKUkFlK1RvVTBzandTbXhw?=
 =?utf-8?B?K2p2NCtEMnNxdXFFQTNJOXRLeitFYVR1Y3I1anU2cVJzelFWQS9SSFNxUnhj?=
 =?utf-8?B?aTZja0hqM3YycjdpT0tDczRjMWgvc3gxVkFxNWVpMW84Q05peFYydkZvK2Nn?=
 =?utf-8?B?bTdFUXl2Q2xRanZMamg1eUFrQVA1L1lWRyticC9Fb3Y1V043MXlqNGNtWTBP?=
 =?utf-8?B?TjJWSUZoL0ZkYjZsTE5XUVl5a003TUM0M1NTOVNrckpFdXRjOTc0aitTTDk5?=
 =?utf-8?B?Mk9JdWQ5YUZqSVBXeEhVTkRGWmNsSHd6UHlTdzQzZTMwd09md0V1VGNxQWRr?=
 =?utf-8?B?TFdmY2tMZy8weGZhK3MyaXNURFZlRkJjb05ZQWVOMG9lNnhHZ2trdENzYS9Z?=
 =?utf-8?B?dUNnbklOTXFCdTBXam9PcEQ2OGxCaGMrVlhtZ3NERzN4VkpBQW5JQ0lzOFhr?=
 =?utf-8?B?WWxIangwZ1J3Vkw0QXd1aFFTV0VzMzFMLzk0Wmg4SVBJb284TTRjbE9PNHFP?=
 =?utf-8?B?Y3czQ2RvcjBiNm1oQ0hwaFRhbG1ML1B1VTY1MkY3RlNjSGN0cm1UR1drRXh3?=
 =?utf-8?B?N0o3NkxCTG4xd3pUbVl2MGxpQnlnYlVWZzlvYlVuSlVTVFI4YnFZNGU1endx?=
 =?utf-8?B?VGxESXA1UnIwa1lJWERKZzlQVTROdVUzNU1pWHE0Rm9vTzRzRnNYcGFCTlBV?=
 =?utf-8?B?cjZJN0hRbjdoSituMkxsRk1RYjVVS0ovaDdSUWgzK0k0SzRrUEo4M1gyZWhC?=
 =?utf-8?B?b2RVVmVXRDh2VXNiNklxTFZISlpGOUpIM3YvOVpMTHhaRmh5SERYNU1RcVd6?=
 =?utf-8?B?MVE5alRJOXJ5NWhoRnBJVUVzTFlaTDAxclpndjFYbWtnNkdEbklzOUduOW4w?=
 =?utf-8?B?Y3RnSVYwdWNlUzlTYUw1THZJSHpXb09RV0R1UnRtakdlWDF3QW8zaFNiNEY1?=
 =?utf-8?B?cUJwWmVsWDFyQmR0b3hkSTVCK1NaWlA5Nzc2V0c5RzhJMWxhSFI2Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692cffeb-9afc-492e-2b70-08de6ae041b4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 09:14:14.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r90TBg5WGFgzUZ3wPrWSvkOxzCkt6+GXCTRBubf7kH+0lj9T/SX0QZSKGTEkIG6OQsbuuXd0hfKD/E8FgGLzfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8403
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amlogic.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amlogic.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52705-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhentao.guo@amlogic.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amlogic.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9713813454F
X-Rspamd-Action: no action

Hi

在 2026/2/13 16:55, Krzysztof Kozlowski 写道:
> On 13/02/2026 09:31, Zhentao Guo wrote:
>>>>>> +  power-domains:
>>>>>> +    maxItems: 2
>>>>>> +
>>>>>> +  power-domain-names:
>>>>>> +    items:
>>>>>> +      - const: vdec
>>>>>> +      - const: hevc
>>>>>> +
>>>>>> +  resets:
>>>>>> +    maxItems: 1
>>>>>> +
>>>>>> +  amlogic,canvas:
>>>>>> +    description: should point to a canvas provider node
>>>>> Why? What for?
>>>>>
>>>>> What is canvas provider?
>>>> The canvas provider is: drivers/soc/amlogic/meson-canvas.c
>>> What is this "canvas" device.
>> You can think of canvas as the agent through which the decoder hardware
>> accesses DDR.
> AGAIN:
>
> What is the canvas device. Describe or point me to bindings describing
> it. Your current bindings say that canvas is "a collection of metadata
> that describes a pixel buffer" so there is no way it handles DDR access.
>
> NAK
I will rewrite this description based on your feedback after I 
thoroughly understand the role of the canvas device.
>>>> In short, canvas is a hardware IP inside the Amlogic SoC. The decoder IP
>>>> needs to access DDR through canvas IP, so we need to reference the
>>> Why decoder cannot access DDR directly?
>> The internal topology of the S4 chip is designed this way, we don't know
>> why our VLSI colleauges designed like this. But similar designs have
>> been removed in subsequent chips, eliminating the need to rely on a
>> common hardware IP.
> Quite poor explanation. Based on this, this as well could be entry in
> device reg lists.
>
> Anyway, I am done guessing, explain properly the hardware instead of
> answering with half-baked responses just so I will go away.
Okay, please give me some time and I'll ask our colleagues about this.  
I you reply you basedon this message then.
> Best regards,
> Krzysztof

BRs

Zhentao


