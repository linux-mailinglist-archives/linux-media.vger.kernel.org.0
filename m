Return-Path: <linux-media+bounces-29086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 535AEA76D77
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 21:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58E863A8257
	for <lists+linux-media@lfdr.de>; Mon, 31 Mar 2025 19:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04480215771;
	Mon, 31 Mar 2025 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pw6VPBiP"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FD1DE4E3;
	Mon, 31 Mar 2025 19:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448768; cv=fail; b=JWTPP7K9QXC1lqiylEnE7sMLYyHPF9xCgFbVj1sMHQ+WOXfHahRONv8cY8vEN2m6aTipD3ZtcCV0l9O1CEt4qj0IjkFnu2SGWWh0pW4+5SlmO+AyDrEkaotByrdgEQPfo/+frVbmgLjwSa4dW3pPLjdBsGDdyQz9SYIuHCBNDMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448768; c=relaxed/simple;
	bh=Ns6evJ+iWdEbIude3bIZJTcv6R0KruqwzWaPsQDcS4s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mxV4n+gVXcpnQv3x2oQbVHZESvNtV1jaF9Qou34IqM2IDl36IacfHafs2hW8evNRVyxjLAgvlmSbKY+jX5QWwbuyhoWvRaWr59PgVcY3jl+I7rARwy/aIIzb+tA9U5kaaV4eEAt+ogEQCluO10hTaobKluXBybnutU3uxxb1OoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pw6VPBiP; arc=fail smtp.client-ip=40.107.243.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOijUjk+DcQbTqq987SH6ISitmLZmrEt1URWgAGePOWxOSBpBk0X/Cp8+WiS9vz1pWrbT406aHwTkD9twFZlHp+Z4iUOZLxBSE8lhAjUHZc10kChouJ9jAojU4nqt4qa+3id3m5C0EckAnRyXAOZLDpp46uZLCeDD3IzO5wfE9HoqQzW0I0099ACN1O6+R6wLL1JHrFgpeTlPTwwzqleUQmvfZlot9RUFFbb/0WV260qkuFeMdIfR1lAOkgavISCr0NWGsJJRdyVYKRgshagUK7u7FAdQvLpUSs4Rq2UXjPlBPwEJA4gbEH2WxYL7Ke4ufjxbyVbQeg+qS9ZAG3Jgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRG06wFY/0O59myBfSfYC7Auw2VPYaCU8B/2kZZQBJ4=;
 b=TKfAnVfzcVi6zrQ+Vs4H9v7BywpvP0Ma4JzT1qxkaTFoEuQr+tpkQKEaj9+9HOPw9GTpWOlUkBOeHf9bVi+2NA3CWKhRx76NlxRgrFN0gFhmlnMTy0mMVtW7CX5m8oRrumayaPyZBKicN4FvWsfpZdnyguBf/EGDylkcHmCEofeXEKWetBPsQ8qrNAsqA2XLjfZTArlTyJzK1YFhZgdWOU0Ntr0Kn1SQeFeB9VnD9bGSTlyEuiH1LdLVvB/Gvb70jIio/cNgBVuTRR/T0VR2yTw5NgsCC7ScTdMq6ebb8ZALCiSA+fTVS0KKOIV18fwjau9+5u2b7rUYo7otLMAAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRG06wFY/0O59myBfSfYC7Auw2VPYaCU8B/2kZZQBJ4=;
 b=pw6VPBiPEWVbxJ6SdpxNCGK0FPqpRKj42q56htLDKgAKxKApQMNQSmNU8TXGe5E2iWK71xsN2IP0wcMKx+QXTNIBlUuDmW/cGvc7KnZ+C8N3y4ktmaXQytgEKtRQOolv/VGrB/Qt7hbkF9lOpxwTaKdXqGy+MZhkLMYaco9z4WQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Mon, 31 Mar
 2025 19:19:24 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 19:19:23 +0000
Message-ID: <2cce157d-eaba-44c1-89d1-7e5088ee361f@amd.com>
Date: Mon, 31 Mar 2025 15:19:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
 dan.carpenter@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <20250328214706.1516566-1-pratap.nirujogi@amd.com>
 <e94d3ba7-78ad-453a-86c0-a71662e02922@kernel.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <e94d3ba7-78ad-453a-86c0-a71662e02922@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0340.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::17) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: d89144cf-584b-43ad-f849-08dd7088f225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1djL0l6Q242ZUhkL1lrSnBqMjIzUUdTWjZNYVlwTmMwWVFNUERyL2xpeDdq?=
 =?utf-8?B?SFhtNVdweS9tckFoWGdHRkowdlk3MHNPTEtzU2xhN01FQmYzN21DUm83YVh1?=
 =?utf-8?B?U05XYldBbC9yVzNhcG8yeWQ1N2V3c2ZHcWl2Wm9LaWxidll0cFVFT2JMcThi?=
 =?utf-8?B?VDhpWHp2MUFhc2pGQzdrbGdqUlBlZVhVSDd2Y3QxdTdOeW44NWpvMGpCUnYr?=
 =?utf-8?B?anJsRFdwbWl1bGpRZ08yUStwVGd6cGt5THFvampKNTRETnJCZUtlNTdpQW96?=
 =?utf-8?B?cDlEQlZ4bTVza2hsdXAxY1VJR21obGo5VFg0Mi9UeGRRY2JRSnUrZCtTY2pM?=
 =?utf-8?B?djd2YmcrbVMrTGczMVZicmErbGRXN1JWUlAxd2tLRVk1d016T2x1eUM2L3Ur?=
 =?utf-8?B?SzJyZW5QbVQ1Mm5acDhMWGQ4Nm5DbFFKWlQxeWpGNWhwQ2pHWTFmMTI5NTRO?=
 =?utf-8?B?cHowZ1FUOWZjUUE0L1Q1cDBOYjhpTExTSW5oQnBlb0ZTWko5blRhNXRPczFI?=
 =?utf-8?B?YkwyNEpoTGxneGdiV0R4dEdGa0VhU3pNV3B1UHJwN0tBazBPc1ZRNDByOXRm?=
 =?utf-8?B?U3NHRjNCSk8xSnRHRVlXTjBTdG1JNWZXTTB2Rk52b2RxNkNhMFJYOWNzSWpV?=
 =?utf-8?B?WTZVb3hUWlo4YUR0NVQ1cnMxVkhhK2RubkZhN0VxK0NCdk9KU2FoVlQ4WUxx?=
 =?utf-8?B?MDNScW1VejZweVUvWXJHRkhONklvQlNkVkdCZ3RmeThhMFllZWxrcjhSdkxF?=
 =?utf-8?B?SVVzWkpkWXI3Y1l2TXFOQVQrSWRLOTArMjFGY0tvdk5OR3ZaOFFaNm9OT1NY?=
 =?utf-8?B?UWgzblpQcWFYeDk1SGJpQmI0TTdlN2NqSENFR1RIOG5YUEFkUGliSE1nQm1l?=
 =?utf-8?B?Z3lLZHQvVUgzNjlHamcrNTZCTjYvZnp3bVV0Szh6UXNHLzlGQVVXSUJ1WVZU?=
 =?utf-8?B?NHRhbmFqcWVhTFFLc0ErdUd4TzNVY0JjNzdRTG1uU1NyczBsdEdEb3QxV3Na?=
 =?utf-8?B?am92WFp4VUJ0QUxPaDhsNUF2RmpxV0VKMEt1VFZhMXFqa2lUQU9VcGY1R1JO?=
 =?utf-8?B?NU5GeUNRV0RoM1hEcnFCMzNCUENCYjZDK2JZY1ZXY1hrVFJkZHQxR0tEeC81?=
 =?utf-8?B?Y2dVWnJ2Nmp0Sll0STdLNkhNNEwrRmJMak0xTzJvZjY1RS92UzdoemVhMGxP?=
 =?utf-8?B?dFd4Nzc4ei84M2pGRklMZzU2c3JIZzZaV1ZPdnNzOWFkQlpJd0xQNFR4d1cz?=
 =?utf-8?B?S2EvRkoxNzludlpWUTNrTG4xclhXRHY1TVVZZmY5MVdpYXhQMWI0V1ZUMHN5?=
 =?utf-8?B?dDNkaXFUWGtJcUEzYlQvdGtUTXpPaGFiUFFSNytaOU81WG9FMHhmR1Zqbzh4?=
 =?utf-8?B?Qno3d2N1c0dlRlVpemptalZWWjZLNlBmd3JPbE1SQnJsT1M2Rnc4eTBqVzli?=
 =?utf-8?B?b0pLSjF4SG84MDMxZTE4QUFJWlFpMHJWU1BIYTh0OXk1Y1JhQU5SR09xcHBn?=
 =?utf-8?B?MWZ0anJNZnRQRXluZ1BoQTdXbkhBcGYyS2JzWVEvdjJPY1BLUmJVNWpHUzY0?=
 =?utf-8?B?VzRML0Z5NmxmYkNqOXJuREFFUVJndElqYUw3Tm1WNHBTU3RjL3BsK0YvbjZy?=
 =?utf-8?B?dkh6aHNCS2hPODBCd3plNFRlNFFFUGs0b04yakdFZGtFSnByS3BwU0x5WnZ1?=
 =?utf-8?B?NFkvRHB2Wk5XTlBDYy9qSmduWjdKL0IxaEN1WklaZzNOc0VDV243Sm5OdEZr?=
 =?utf-8?B?UENnODJzdUw2ZEdLL011djdwU2g5YS9BS0JNMi8zTDR0d2h4RlY2M2NYQjl5?=
 =?utf-8?B?UktHNHBabzdHMXI0ZklYMXpaQnJSenRrb3NSVzJpd09rTmNtbU0wMDVHNk1s?=
 =?utf-8?Q?AJhvRXLvUY9EU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjRPTlg3L1BBR0lmQ244MjQ2YVN0RW1odUJQWFltMElpUUZtcHg0dXE5bWhn?=
 =?utf-8?B?MDBDUVFtYTluUGNZR2pjNEpYWUdhOERCSnNBeHVtZUU2cTYwL0Nrc0s2RUF0?=
 =?utf-8?B?RkFxd3dPcU9zdEpGZTRDeThMTVJWVW9iSnNWMFUyZDlwU0s0UEhnN0JWVVBx?=
 =?utf-8?B?Y0hZeGkyNGFiQWZhbGJsb3QrMEcxVHFhUFprcStPZXQ3aG8raHhYbGlHbUcy?=
 =?utf-8?B?VlJXR1RHcE1VSjdyNTdsMFNJYkswa05hbEwyWW42UnlPbS9QZnFrRDRCY0Fq?=
 =?utf-8?B?YnN5eTVBQ2lOS1JmOGVwZk9NeTgxNm9lcW5JbkpDZ1FiNkc0QnVpRldJTVdJ?=
 =?utf-8?B?NkxaZjBKK2Y1ZXVRNVJsREdBWGRVYnBzNk5vclA0cXBBcXNiOXFWcWlCUngw?=
 =?utf-8?B?RzFIMGxDa05RNi9BbjVwdFRZLy92S01LTXlybGFwZ3FYa3c5eWJGZEVzWFdn?=
 =?utf-8?B?MTFYbVN5bE5SN3dWbVlHTGpBRXo3Um84OTRiMG1HSnJ6N0FIVitKNWE1QVJp?=
 =?utf-8?B?K29lVVVrU2xuOFpsc3hFcUtGNjlBRUxONEp1S2h3bCthZUEzampUZTM0WGw5?=
 =?utf-8?B?YVFrTG0yU0VJc2xxNmdiNUFtcWFHUC9MUjd0TlNEK2pLb2UrbFNZTnZSUUJs?=
 =?utf-8?B?dE5zUEdKTWpLcFFadDI2blluZjdVdFhYeEJvbGFSZUo4MGJnclU2aUJmamFO?=
 =?utf-8?B?TktRVHVIMEFCNDAwVVNLMmI2SDc5T3B4Q0VDM2xvTTZ5LzQvQ1ZteUIzeGNK?=
 =?utf-8?B?clQxY1BYZXhXV3N2QjZ5Zi80M043UUJiZW5YNEJiTUNWNkUvVjQzcmxzQjNl?=
 =?utf-8?B?WktIL1BXMVQwZXR3K3NFVEU1U2dxK1ZQR1JSMS9EQlhReUVaRlArbmthazdM?=
 =?utf-8?B?YVBNcGtFRmZWeHUzMmpOZzQyM2drQ3NXL0ZBZENOSUhXNWJLSUw1RlE5Q3Jj?=
 =?utf-8?B?eGhUWlgvc0k4VGtZSGNCdXJCYTduT1VvbHFjQnFManpBTnI1aHR3VjJmZzhQ?=
 =?utf-8?B?dDVwb3ZoV2RhVHZ0a3NrVW51bU4xbEdhS3IwcjFMcEhnYmhSK1FhZ0g0dmsz?=
 =?utf-8?B?LzVmZjNFZGxQcWh6VjNNcGxOZHYwcVhnUC80cEtHS2sxYlROeDlQb1JGMlBP?=
 =?utf-8?B?NkVTaFI2MUZFWDJWSVExQ0UxVUM5SGdaTzdhV1BJczRERmUxWnB5MVpMbzBa?=
 =?utf-8?B?ckJZWkQxaHo5cUwrNExXVjd1S2ZvWVJ2NGV1ckVGZzZvYi9vQ1VlRkFPMG1C?=
 =?utf-8?B?cStoMVR0VThMQ0tvUk1hVEZIRXVIaU1MU1g2aXFiMjdlRENyaXNySFMwSmJS?=
 =?utf-8?B?SCtXMzl6RUVURzU0cG9JT3E4RGhFY3d3SHQ0REtTQmF2aUJzVk8yaTErU1h5?=
 =?utf-8?B?b2VrNmNPQUJ2aFg3dDN4R1ZabmJsM1BMelBYckM0WVNyMzhnWm1zQjdPZGlG?=
 =?utf-8?B?SlJCekQ1dzQ3RWkxcVpVRzVmMzFtZkRpKy9iM0s5YW04ZmszT1B4aWFZaG90?=
 =?utf-8?B?bU03WkRZU3FJVkhNV3dFemxpSEJ6dHNJWlhZa1dnbW9icEpjYW52eFVzdHM4?=
 =?utf-8?B?UDJ2Y1NJaUJOQmxVZURINzJ5N21LcDJpSUdLNlVldEUyM3kzeVkyQW1BaW5a?=
 =?utf-8?B?V0lIb1pPVy9ZWVBzdWF3TWhVaFpVN2EwbDk4VERXNTNPTFRkb0ovcmlSbTFB?=
 =?utf-8?B?UmFLMElyYURmZnI2UjNGeW1ESjZOL3c5SGNXL2Z6STgzQnZRcFhtTW5pdHhP?=
 =?utf-8?B?NEdML1lLWFNOMTBRcHdnUStVUXJnaTNlZC9NbXZ6UHJwaGZkaWR0NXJMbnUv?=
 =?utf-8?B?SkFteVRzTDljSzI1N3hRa2h5cG81UnNiSTlKVVdlUDlGT0cxVzdoOWxaTktm?=
 =?utf-8?B?cTYyeUZaNm5tYjh6TC9XTWxYeTVHUWZKVEhCd1hnaHo4bjljZ0RZdkJDVzFa?=
 =?utf-8?B?UE5wTHNpTE9EUjNWSXRvaXJSN2U4SUxQUGlveTF3bzMxRXJ0SHIweVlQRWIv?=
 =?utf-8?B?cXlQV0dKUDhQMXNIS20rM1pUMGpuM1laS1RXQmZNWkcrbnV4STI2czA3cjRw?=
 =?utf-8?B?UnlwZGZsZFpkeFpuaVMyVGxWcVBoV3lqbUkxYjBPRUlBTUJOSTF2amllZitO?=
 =?utf-8?Q?AqW0/XjBMRGBuogWDREE4VAMN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89144cf-584b-43ad-f849-08dd7088f225
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 19:19:23.8798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XJZjcQdOaZxe9ebe78IMvBWpMkbNl3ydbp5dsG65Hkf2jeTVWD9khsTg+QASOxxsXWm0m2Wfq+n7lx5wvNH6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359

Hi Krzysztof,

Thanks for the review.

Thanks,
Pratap

On 3/29/2025 12:30 AM, Krzysztof Kozlowski wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On 28/03/2025 22:42, Pratap Nirujogi wrote:
>> +static int ov05c10_probe(struct i2c_client *client)
>> +{
>> +     struct ov05c10 *ov05c10;
>> +     u32 refclk;
>> +     int ret;
>> +
>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), GFP_KERNEL);
>> +     if (!ov05c10)
>> +             return -ENOMEM;
>> +
>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>> +
>> +     ret = fwnode_property_read_u32(fwnode, "refclk", &refclk);
> 
> Use existing properties, like clock-frequency. refclk means this is the
> clock, not it's frequency.
> 
sure, will replace "refclk" with "clock-frequency" variable in the next 
V3 patch.

>> +     if (ret)
>> +             return  dev_err_probe(&client->dev, -EINVAL,
>> +                                   "fail to get refclk\n");
>> +     if (refclk != OV05C10_REF_CLK)
>> +             return dev_err_probe(&client->dev, -EINVAL,
>> +                                  "failbad refclk %u, %lu expected\n",
>> +                                  refclk, OV05C10_REF_CLK);
>> +
>> +     ret = ov05c10_parse_endpoint(&client->dev, fwnode);
>> +     if (ret)
>> +             return dev_err_probe(&client->dev, -EINVAL,
>> +                                  "fail to parse endpoint\n");
>> +
>> +     ov05c10->enable_gpio = devm_gpiod_get(&client->dev, "sensor0_enable",
>> +                                           GPIOD_OUT_LOW);
> 
> Nothing improved and you did not bothered to wait for my feedback. You
> just sent v2.
> 
sorry, I should have waited for your feedback before submitting V2. I 
will use the suggested name "enable" in the next V3 submission.

> There is no second GPIO, otherwise would be present here.
> 
I rechecked both GPIOs. Only one is relevant for sensor driver and other 
one is for the ISP driver. Sorry for the confusion caused.

> NAK.
> 
> 
> 
> Best regards,
> Krzysztof


