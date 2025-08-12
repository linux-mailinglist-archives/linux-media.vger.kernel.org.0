Return-Path: <linux-media+bounces-39482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 643ABB21A7A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 04:02:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46C871A253E4
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 02:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FA42D77FA;
	Tue, 12 Aug 2025 02:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fYp2/vR1"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A3518DB1C;
	Tue, 12 Aug 2025 02:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754964153; cv=fail; b=o0TLAy517S6FkuQvb+5in10wWuuJ6028b6fDnuplK638GFqQAp2Ztx4t5iUk32HyBS660aMG4V5ccWoEZ1uoAdD2fORTll3nlz+eBgEWZ9k2Prx0xadLNhRnLhgMTp/C6CEnak8BhGGO2SqKEArJf3DjgOfsbHdaWo6/Q3pxY4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754964153; c=relaxed/simple;
	bh=FtDLhcHm75TKbPEFs7sEv6Ju3ISEu3vRZfFLlIO/etA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vswpz+dfASljaLSqIAVxKHWROzO1q8Rm4jbxBFOXjpjTQkAVcVI+0Nug6RwadZOtEymwCyL989ji70b1/3KoQbAMVEIJS7C4SSUui9YmOGNUtJMQkgNmH+tukyGhWfozbPtOf9cAVOepVxu+PsrfB1X7US3eA6tHtapLgvApJgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fYp2/vR1; arc=fail smtp.client-ip=40.107.237.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcFuguDQQw+h7tlHgtU+KHtTtWmtJejWYxdW9TBtILgHEjGgkUXZCSaNLpmIjHe4yIQix8SFop8uWzkekgmDYXYadQrJm7B/bzuJyxrAGcSwv1ptWsrFFuqN5fbl9xXPFfvxp/Uy2NpSFUbTIqemsxRA/S4M8MK0EGAcYFMA7OETohKeozqkVbfQ8EYJRo3okUVA99Fs2b1Ne9qm1IUvt+7SABF+l0cW+mIRd8XpsOSMUfTCPUbkK9YfSZ5CM3gj8U1mZebi0jVX6WTj41q+sKfyj6O6sOAWyU+d1o/ayoioPSa/2/rzvon6zBCXP9w/nv5qMhaQmNW4ZQ4TQFPKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud8A/QCGBeK50WprJUGQAs1p3Rc9/dnfkYhI1T9Myxc=;
 b=BNV/yRJuC/zpgUl08WRZt5u0s+/AORdXXovmmsdCWcTYADNpr6mZMDpkdXve1idN5qzqXlOpTl38oEFTPifJL6E1KrcxipTkfIco39oGmxrmaYi+CsBADQmkqqw+FQJ6sFw3IjVPAP9oXOmNxmikp3rCbd4v5v4Nwurnw6wSkqUiAHR5MTpCFNyCySJPp326fOnP014fy1RieBOQHI8L+Mus++iauIHLjpX+C1jYikPyTBqQcZ0LW5nXJM+4pbOXn7PRFHt9ZVxzhL1A/kyD1bUAJuwbWmqg8XmtJ1VVCRY2spGi3wzFwa9MY6GlRCUCKGK3aPb7CLPpTJo4skeRHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud8A/QCGBeK50WprJUGQAs1p3Rc9/dnfkYhI1T9Myxc=;
 b=fYp2/vR1NRN6sa5K2dTJ2hyu/cGBeuE6+NL5KHl8Roqi9HIOaYDeXabsWXRMCR+lRPLr5I6tt9iiIcYpD3Q38L5cKkTs/F0xgl8aNv+CQIR/UlC0b9H5zh0DGGyqIakE3LRX7lsEGRIL31EhQca0sOfgf0OCXai72K1wNKn2pGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 02:02:27 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9009.016; Tue, 12 Aug 2025
 02:02:27 +0000
Message-ID: <31a6c05a-4482-469a-bda1-55a83550b199@amd.com>
Date: Tue, 12 Aug 2025 10:02:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
 anson.tsao@amd.com
References: <aImvvC9JEgQ2xBki@sultan-box>
 <a3272335-1813-4706-813e-a79a9cabc659@amd.com> <aIq5EyQ_uuO63dJb@sultan-box>
 <1a9a4beb-97ab-4853-8201-bf08f1a030ab@amd.com>
 <d8c99b00-e8f2-49bb-8c72-ebc4e783e51d@amd.com> <aJA2S0EY7HhVSSzc@sultan-box>
 <17464bff-6b3e-4962-8b83-132cd7367d1d@amd.com> <aJmEaXkXDtfkVQiR@sultan-box>
 <f85fce70-64d6-4d33-9483-c8e6dc8a79bc@amd.com> <aJplOgN9BSbElDfi@sultan-box>
 <aJpsEwdZ945jEZqi@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aJpsEwdZ945jEZqi@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::20) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: c90f322d-a89b-4a86-bb68-08ddd9444967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDJCRjRhRDNBajBITEN0NXA5QWNybFR6Zys0Nmo2eHhpRCs5Z2dYUjlZTU0w?=
 =?utf-8?B?UWtQYytFL3ZhRkl5WlpLaDJpdk5sUGNDaXREMUZ3dGlsYmhycHNGejlLMWQ0?=
 =?utf-8?B?Vjc4aGovOVpjTElCenpjeEZvNS9wMVFJMHNEVzJOZVFvc1Q5NVpNS2FaWlB3?=
 =?utf-8?B?Yis0OHpEMFY0QnU5UE5hYTF5NFpONVZOVE9EMkY5dWZQcitXUmM1WndvUVhZ?=
 =?utf-8?B?TVhudXZHYzZmVlVkaCt4Q2IxZVZYL0ExVzhVZS91U2hONUtlV0hOQUdzcUJt?=
 =?utf-8?B?TGVjWHhCZ0YxRG51Z1g3RkY4K25FNDZQcEdOcDE5ZTg2bmtrVmRKU1BFTERL?=
 =?utf-8?B?TTRJOFNESm0yenVmZDFXdnk3ZW93ci83VDhCYTMwdko4b21XYUJTYnNNeHVP?=
 =?utf-8?B?WEJTSVRib0ZSYk9lY3hqclZWa0xnVVpSbTNPWDB0UFp5d0krbXdRc0RRRVM4?=
 =?utf-8?B?QlNFelZ6WmVma2sxTnFydlBtM2RDRnlxMUw1MElzT3RkMldUZ1llUzVBUWRV?=
 =?utf-8?B?OWdXcVdicE5wMDhaV0VaQjlVaGQranRyQkZkQlY0aHJmY3pnQ3BwUk5GMHF4?=
 =?utf-8?B?NGU0Z3ZKcVBOc3dJTTg0Y01ocG9aZWR5ZUh5QkRyVnFFdGRmOE4zQUdERFIv?=
 =?utf-8?B?Z0tiRW1SclhHNnh2VXZabVd3cWVjZFdCK2UzUnp0MEVpa2YrVjZ1TlAycmp6?=
 =?utf-8?B?M0MxMjNRZHhpMTRVS0Q2bjh0clVCMWI2QnowTUhJZkZiUGNVY1FFZGRJanlP?=
 =?utf-8?B?NUpkaTJ6YjJQRHowaldjVldRdE14OGlsQzBZQ3FaU1F2RlVjMU9SWkp6V1oy?=
 =?utf-8?B?YUxhbmxDeWVML1BSTE5IRVF6T21rWFI4c3RtM1NaRVZ0bW0yaStmYldTRGJ2?=
 =?utf-8?B?Ri9rTE5lNE1wcURsNHIyZERRbkFwT3l6cEJIbmlYamdCWDd2TE9UNC9Qc1RY?=
 =?utf-8?B?ekQzUEVLY1JLa0xWY3Y2Kzl2amtwZHhFSEJGUzAzVjJRRDRadmx4Qi9YSjVQ?=
 =?utf-8?B?MWZZZXpaSGwrK2RUdkRrczZUTFo5aFlEZE9jTlF4Q0dhUG5QcktNU0hydmZ0?=
 =?utf-8?B?bytRUVpLUFQ4MEpMek1pL0lWQ1dQYnhYWmR3dWRJOWx5d2kvTnNzWENWcGgz?=
 =?utf-8?B?TE40bnVsSkRrZndTdTlyZ0xTYy9NL3RKb015OEdCaGphazNYMXlnTzBzYzZw?=
 =?utf-8?B?WmR6SVUyMGUxdjRQN2dyUVRyS2pPSXdUdHNhYiszemxrVzZTalljWXB2Z0JY?=
 =?utf-8?B?L1ZKNGkzeEViaTJ4Q0dQQTliS0FFNldnQ2JlZkhleGorSWYrK1dBRFRLQmk1?=
 =?utf-8?B?YVJMSDVWTnVabld1MTlMelhnT0c2SDNYdW0rZHlhZlM3bU9SbDd5ZHloOUZT?=
 =?utf-8?B?ZHpRQWlaY3A1dnhUaGU2bEJmZVZldG91akd6MVlqZXhocXhwMUZWMVFVVjNi?=
 =?utf-8?B?SEtFaDhBeHZqYVQyNnRMZ2R3bStvdnFKT3lmTzNhZUxqWUlRcjFOVmpNaHZs?=
 =?utf-8?B?RTcwSnAyYU43M09XU0JUUnFuMmNOOWNQVGJEbXdYbUhVNGZ5aWg1em9HbCtF?=
 =?utf-8?B?cFk0bWp4Q1NTRXRHVHFCb0tOUTRmamppMktMbzNab0ZjZklTbkZXRnVoc2tL?=
 =?utf-8?B?MkVTeXBYcy9kMGhadGdvWGRlcnBPOHhFUVQ4cC9WWldmQUF1a3pPM2NxaUgx?=
 =?utf-8?B?Q2xRMmNhb0dTUThobWtrU2tuakxHbFJDQ0w1RUpQa3dSRE1LcjYydTlmTXQ3?=
 =?utf-8?B?NEJnVU9EelZGQ2ZSTS9iK3h0R094SjRyR20xVHB6WlpCeFd5VjBHb2k0bkFk?=
 =?utf-8?B?cFRoOHRHeVYxS3JWeU13bG1qaWtSYWRNTUR3ZlQrdkNQZWplUHRzNlRjY0xy?=
 =?utf-8?B?SmxReDNzbU55ZDBIU2hGSHY3K3RRZHBFY21pSHlIZHVualEvQk1zTVlHV1Fh?=
 =?utf-8?Q?sib9/azpI/3cU2H9/WK2Issk/IpKPDEU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHp4ZVRaMGNtK2laVk9ZRzhVT3VuN0FIaERFZjBpNHdTMFd0c0I2b2QydUxQ?=
 =?utf-8?B?dEI4QXJ4R3NoK3c0aWxJZ0ZPcmlIb1M3ZWt1cGEvWWwxZUZ3UjlLTjNnMzhS?=
 =?utf-8?B?SndxNVNjd0Q5V2Y1VkhZUEFrcUh0YisxMHk4VXl6K2tNVDdrQm1CUVRZajBK?=
 =?utf-8?B?UzlNRFRWRHd2MUN4M2dzYmdEUE1xaW1RZ21YdXFjcUczQ3FLeTJWRmVLbmUz?=
 =?utf-8?B?VFFuMk0wdWZTdkUwWGVCREpuNW9HeUpkUWkrM21QaEJ2NWsrN1lpYTZEenFp?=
 =?utf-8?B?SFk0TEg2REdwamhGNTluVWptVzN1Y08vbmJ5bzZTVTNyRUhrZ0RLbGptR01O?=
 =?utf-8?B?OTFCcVhOdEZ0NjVxMXNBTjlneWJQSXVBR0ZTMEpONUZ4MXhPalR5Q0l2Smo5?=
 =?utf-8?B?YkZMb29kVE9ZR1g1ckh1NzFQK0FqWHMvalRQMzQ2YTRIbFBuMTlPYzczcUE3?=
 =?utf-8?B?QzVwZS9RQTBzdzFuamMreVJQZ25zRWxlUnpXRytIRklwMUxuVEJ6a0RaZ2xR?=
 =?utf-8?B?SmRMTXprbTlmUXpIUUVkckNvVnBiUG9mZFVrZWVvcHR5SGR5Z0RGUEhoSG9K?=
 =?utf-8?B?OU9CeXVEa2xKZDhGWndxTzFFYWdXR2ZKN004TUdQR2REQ284ekw2WktQKy9j?=
 =?utf-8?B?Vi9URDdLZWtpS0FWQXM0SnpOek1mSXA4NXFhNlNMY0hVVUMyRk1hZEFyTE9S?=
 =?utf-8?B?eld2NmNod2s1b2Z0TWU3SHgzc2hyTTA1Wkc1OWVKcUhoWHp4K2lZVlJHNDg4?=
 =?utf-8?B?NWw2Q0drZmFCRVVhQmRLMkI5d2FQWC9PWVBGL0VYVTBSOW9KclA2OHNyTEcw?=
 =?utf-8?B?NFY5b2NNaHJ6eFAwRTZScTk2dUVvclFQMlBUaG1hSndscndabUREWDRLNHkw?=
 =?utf-8?B?SW44dHA5UTg3cUtoNVdFa2tWSHcvSCtUdUlTRngwNXBJekFmY1lvVXJHNG9S?=
 =?utf-8?B?ei9Cb0svRmV0eStlRVZ3WWlGemhvWC9xVjBsV3dXMjhBTnQ4SmhHNThUejFJ?=
 =?utf-8?B?Z3dMcU5EOUR3Ymc0NDlLVGdtSWoxQVJMa0pLWU5OdE5Ib3RMRmpXdUtZY3RW?=
 =?utf-8?B?MDQ5WWFMa3o0OHZYNjV2RkxoaUorQUQzUnB6WHR1Vmd2R1h4MTZ1RlpEdU5r?=
 =?utf-8?B?ZHJOZUpaS09HZFdkQzVYL2ZjYk5kOGh5OFlZZ09LRW9GNy9yYUJ4a0o2dWR3?=
 =?utf-8?B?RXJheWx3RVZseHYySnYwdHZPZ3YzUlVIcldjdVFkV0txWDhWQ2xRSFBFV2R4?=
 =?utf-8?B?TzVVd1NYVUpWam56dzBMSDJoWFVZTkJGdkd1ZUR5ekgzN3VXRWNOQzlYNTNu?=
 =?utf-8?B?Y2p5NU91cXhqTGlZZFhNNHJSMXdSTFdtbWVpZ3MwTDA4V0JIQzB3bWNUcGNu?=
 =?utf-8?B?em5yMTUydDZsNTY2WkxyaVpMdXBTdzRlTVk1T0hRWk5FSGVXL0tYTWtybFlr?=
 =?utf-8?B?TkxQZmRNbTBSMWJmMGFuK0YrSXBac042MUJRVXpBUmF0c1dFZlJFaHY5R1Js?=
 =?utf-8?B?ZW9xUGR5YnpDK1hBcGxxZ0ZneE82cU9JbjVob05LNWJ2L2hWMVdvQVdJUURn?=
 =?utf-8?B?SEpocS9icytUV2t5OVVwbndCM2paZVF6emVPWis2UEUzVFNwdHhpdmpobVhm?=
 =?utf-8?B?aVZRdWlhUHNhaDFIU24ycVBWV1hGUitQZCtjYWlySUVDSzdVU2lnWXVYZUtY?=
 =?utf-8?B?aWRHbm0yS1ZjZmFzSDkwYlF3SlZ2dzlHWXR2Z0Y1NlF0aGRVSHpkVlRxZlZN?=
 =?utf-8?B?RlFQM0hYUVlzcnFBQ1Bxck52bGpHeWRma0pnSGZxcFZmeUgvMTIzL3duSENm?=
 =?utf-8?B?ZzlWSkY4TXdIV2NoNGZVckp5UUNhc0M5Z1VnY2ZCLzh5ZDR0RW83WE1zOVdM?=
 =?utf-8?B?WElHN0l5WStmSGdVQmIwZElGL05LRTlGTHk5Z3JuKy9nMUNqSWJ0Q2NEK1FH?=
 =?utf-8?B?VFkzaTN5aEtCN3ZmRXovaldtS29IeXVLVjZDNk42S2JyU0tQZlc2ZlArYmdr?=
 =?utf-8?B?OWNJa2hsYVFLUW1sbnlBd3ZWdFNVT0JJRm5nS0ladlc1TDQ1TkJvY0FRNEhM?=
 =?utf-8?B?RUYrZU5MMnVwZFJxalVGL3hXSU9DL2hvUFRNSkErNjlCUng3V1o1TnRrTDlK?=
 =?utf-8?Q?jLaU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90f322d-a89b-4a86-bb68-08ddd9444967
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:02:27.1198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRVPiGVBMy0b5mwOURc1DBkxSFar+K0MQmqL3DvfLOUrxfpY+Mo4arEbKEdWlWMs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927

Thanks Sultan.

On 8/12/2025 6:17 AM, Sultan Alsawaf wrote:
> On Mon, Aug 11, 2025 at 02:48:42PM -0700, Sultan Alsawaf wrote:
>> On Mon, Aug 11, 2025 at 04:35:10PM +0800, Du, Bin wrote:
>>> On 8/11/2025 1:49 PM, Sultan Alsawaf wrote:
>>>> On Fri, Aug 08, 2025 at 05:11:39PM +0800, Du, Bin wrote:
>>>>> On 8/4/2025 12:25 PM, Sultan Alsawaf wrote:
>>>>>> On Mon, Aug 04, 2025 at 11:32:11AM +0800, Du, Bin wrote:
>>>>>>> On 7/31/2025 6:04 PM, Du, Bin wrote:
>>>>>>>> Thanks Sultan for your test
>>>>>>>>
>>>>>>>> On 7/31/2025 8:30 AM, Sultan Alsawaf wrote:
>>>>>>>>> On Wed, Jul 30, 2025 at 05:53:58PM +0800, Du, Bin wrote:
>>>>>>>>>> On 7/30/2025 1:38 PM, Sultan Alsawaf wrote:
>>>>>>>>>>> On Tue, Jul 29, 2025 at 06:13:50PM +0800, Du, Bin wrote:
>>>>>>>>>>>> On 7/29/2025 3:45 PM, Sultan Alsawaf wrote:
>>>>>>>>>>>>> On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
>>>>>>>>>>>>>> On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
>>>>>>>>>>>>>>> Thanks Sultan, please see my comments
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
>>>>>>>>>>>>>>>> On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
>>>>>>>>>>>>>>>>>> I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> I cannot for the life of me get
>>>>>>>>>>>>>>>>>> the webcam working under Linux.
>>>>>>>>>>>>>>>>>> The webcam works
>>>>>>>>>>>>>>>>>> under Windows so it's not a hardware issue.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> With this patchset and all of
>>>>>>>>>>>>>>>>>> the patches you link here
>>>>>>>>>>>>>>>>>> applied to 6.15, I get
>>>>>>>>>>>>>>>>>> the following errors:
>>>>>>>>>>>>>>>>>>           [   11.970038]
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware: Unknown
>>>>>>>>>>>>>>>>>> Synopsys component type:
>>>>>>>>>>>>>>>>>> 0xffffffff
>>>>>>>>>>>>>>>>>>           [   11.973162]
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware: error
>>>>>>>>>>>>>>>>>> -19: i2c_dw_probe failed
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> With the old ispkernel code from
>>>>>>>>>>>>>>>>>> February [1] applied on 6.15,
>>>>>>>>>>>>>>>>>> the webcam
>>>>>>>>>>>>>>>>>> indicator LED lights up but
>>>>>>>>>>>>>>>>>> there's no image. I see these
>>>>>>>>>>>>>>>>>> messages at boot:
>>>>>>>>>>>>>>>>>>           [    9.449005]
>>>>>>>>>>>>>>>>>> amd_isp_capture
>>>>>>>>>>>>>>>>>> amd_isp_capture.1.auto: amdgpu:
>>>>>>>>>>>>>>>>>> AMD ISP v4l2 device registered
>>>>>>>>>>>>>>>>>>           [    9.489005]
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>>>>> The OV05 sensor device is added
>>>>>>>>>>>>>>>>>> to the ISP I2C bus
>>>>>>>>>>>>>>>>>>           [    9.529012]
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>>>>> timeout while trying to abort
>>>>>>>>>>>>>>>>>> current transfer
>>>>>>>>>>>>>>>>>>           [    9.554046]
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>>>>> timeout in disabling adapter
>>>>>>>>>>>>>>>>>>           [    9.554174]
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>>>>> timeout while trying to abort
>>>>>>>>>>>>>>>>>> current transfer
>>>>>>>>>>>>>>>>>>           [    9.580022]
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware
>>>>>>>>>>>>>>>>>> amd_isp_i2c_designware.2.auto:
>>>>>>>>>>>>>>>>>> timeout in disabling adapter
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> And then the kernel crashes due
>>>>>>>>>>>>>>>>>> to the same use-after-free
>>>>>>>>>>>>>>>>>> issues I pointed out
>>>>>>>>>>>>>>>>>> in my other email [2].
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Any idea what's going on?
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> [1]
>>>>>>>>>>>>>>>>>> https://github.com/amd/Linux_ISP_Kernel/commit/
>>>>>>>>>>>>>>>>>> c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>>>>>>>>>>>>>>>>> [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
>>>>>>>>>>>>>>>>> Hi Sultan,
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> [1] is for kernel 6.8, believe it
>>>>>>>>>>>>>>>>> can't be applied to 6.15. We didn't
>>>>>>>>>>>>>>>>> verify
>>>>>>>>>>>>>>>>> on 6.15 but we are really glad to
>>>>>>>>>>>>>>>>> help, would you please provide some
>>>>>>>>>>>>>>>>> info,
>>>>>>>>>>>>>>>>> 1. Suppose you are using Ubuntu, right? What's the version?
>>>>>>>>>>>>>>>>> 2. 6.15, do you mean
>>>>>>>>>>>>>>>>> https://github.com/torvalds/linux/tree/
>>>>>>>>>>>>>>>>> v6.15 ?
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> After your confirmation, we'll see
>>>>>>>>>>>>>>>>> what we can do to enable your camera
>>>>>>>>>>>>>>>>> quickly and easily
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Regards,
>>>>>>>>>>>>>>>>> Bin
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Thank you, Bin!
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
>>>>>>>>>>>>>>>> 2. Yes, here is my kernel source [2].
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I have some more findings:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Currently, the first blocking issue is
>>>>>>>>>>>>>>>> that the I2C adapter fails to
>>>>>>>>>>>>>>>> initialize.
>>>>>>>>>>>>>>>> This is because the ISP tile isn't powered on.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I noticed that in the old version of
>>>>>>>>>>>>>>>> amd_isp_i2c_designware [3], there were
>>>>>>>>>>>>>>>> calls to isp_power_set(), which is
>>>>>>>>>>>>>>>> available in the old ISP4 sources [4].
>>>>>>>>>>>>>>>> Without isp_power_set(), the I2C adapter
>>>>>>>>>>>>>>>> always fails to initialize for me.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> How is the ISP tile supposed to get
>>>>>>>>>>>>>>>> powered on in the current ISP4 code?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> You are correct, yes, i believe the I2C
>>>>>>>>>>>>>>> adapter failure is caused by ISP not
>>>>>>>>>>>>>>> being powered up. Currently in latest code,
>>>>>>>>>>>>>>> isp_power_set is no longer
>>>>>>>>>>>>>>> available, instead, we implemented genPD for ISP in amdgpu
>>>>>>>>>>>>>>> https://lore.kernel.org/all/20250618221923.3944751-1-
>>>>>>>>>>>>>>> pratap.nirujogi@amd.com/
>>>>>>>>>>>>>>> Both amd_isp_i2c and amd_isp_capture are in
>>>>>>>>>>>>>>> the power domain and use the
>>>>>>>>>>>>>>> standard runtime PM API to do the power control
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Thanks for that link, I found it along with
>>>>>>>>>>>>>> another patch on the list to make
>>>>>>>>>>>>>> the fwnode work ("drm/amd/amdgpu: Initialize
>>>>>>>>>>>>>> swnode for ISP MFD device").
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Also, I noticed that the driver init
>>>>>>>>>>>>>>>> ordering matters between all of the
>>>>>>>>>>>>>>>> drivers
>>>>>>>>>>>>>>>> needed for the ISP4 camera. In
>>>>>>>>>>>>>>>> particular, amd_isp_i2c_designware and
>>>>>>>>>>>>>>>> amd_isp4
>>>>>>>>>>>>>>>> must be initialized before amd_capture,
>>>>>>>>>>>>>>>> otherwise amd_capture will fail to find
>>>>>>>>>>>>>>>> the fwnode properties for the OV05C10
>>>>>>>>>>>>>>>> device attached to the I2C bus.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> But there is no driver init ordering
>>>>>>>>>>>>>>>> enforced, which also caused some issues
>>>>>>>>>>>>>>>> for
>>>>>>>>>>>>>>>> me until I figured it out. Maybe probe
>>>>>>>>>>>>>>>> deferral (-EPROBE_DEFER) should be used
>>>>>>>>>>>>>>>> to ensure each driver waits for its dependencies to init first?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> amd_isp_capture only has dependency on
>>>>>>>>>>>>>>> amd_isp4 which is the ACPI platform
>>>>>>>>>>>>>>> driver, it is init before amd_isp_catpure.
>>>>>>>>>>>>>>> Do you see in your side the amd_capture
>>>>>>>>>>>>>>> probe failure caused by failing to
>>>>>>>>>>>>>>> read fwnode properties? If that's the case
>>>>>>>>>>>>>>> please help to check if amd_isp4
>>>>>>>>>>>>>>> is loaded successfully
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I got much further now: there aren't any driver
>>>>>>>>>>>>>> initialization errors, but when
>>>>>>>>>>>>>> I open the camera, there's no image. The camera
>>>>>>>>>>>>>> LED turns on so it's active.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> And then shortly afterwards, amdgpu dies and the
>>>>>>>>>>>>>> entire system freezes.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I've attached my full dmesg, please let me know
>>>>>>>>>>>>>> what you think. Thanks!
>>>>>>>>>>>>>
>>>>>>>>>>>>> I almost forgot, here is my current kernel tree:
>>>>>>>>>>>>> https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16-
>>>>>>>>>>>>> sultan-isp4
>>>>>>>>>>>>>
>>>>>>>>>>>>> Sultan
>>>>>>>>>>>>
>>>>>>>>>>>> Thanks Sultan, yes, seems much close to the final
>>>>>>>>>>>> success. Will have some
>>>>>>>>>>>> internal discussion.
>>>>>>>>>>>
>>>>>>>>>>> I got the webcam working. The same bug happened when I tried
>>>>>>>>>>> Ubuntu's linux-oem
>>>>>>>>>>> kernel, which made me think that the issue was firmware.
>>>>>>>>>>>
>>>>>>>>>>> And indeed, the culprit was a firmware update from February. I bisected
>>>>>>>>>>> linux-firmware and found the commit which broke the webcam for me:
>>>>>>>>>>>
>>>>>>>>>>>        commit 1cc8c1bfa11251ce8bfcc97d1f15e312f7fe4df0 (HEAD)
>>>>>>>>>>>        Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>>>>>>        Date:   Wed Feb 19 12:16:51 2025 -0500
>>>>>>>>>>>
>>>>>>>>>>>            amdgpu: Update ISP FW for isp v4.1.1
>>>>>>>>>>>
>>>>>>>>>>>            From internal git commit:
>>>>>>>>>>>            5058202443e08a673b6772ea6339efb50853be28
>>>>>>>>>>>
>>>>>>>>>>>            Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>>>>>>
>>>>>>>>>>>         amdgpu/isp_4_1_1.bin | Bin 4543184 -> 6083536 bytes
>>>>>>>>>>>         1 file changed, 0 insertions(+), 0 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> Downgrading firmware to before that commit fixes the webcam.
>>>>>>>>>>> Any idea why?
>>>>>>>>>>>
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Sultan
>>>>>>>>>>
>>>>>>>>>> So, can i say the working firmware binary is this one?
>>>>>>>>>>
>>>>>>>>>> Commit 8f070131
>>>>>>>>>> amdgpu: Update ISP FW for isp v4.1.1
>>>>>>>>>>
>>>>>>>>>>     From internal git commit:
>>>>>>>>>> 39b007366cc76ef8c65e3bc6220ccb213f4861fb
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>>>>
>>>>>>>>> Correct.
>>>>>>>>>
>>>>>>>>>> There are too many changes between them, so i can't tell exactly which
>>>>>>>>>> change caused this. So, from my side
>>>>>>>>>> 1. Will try these two firmware to see if we have the same issue.
>>>>>>>>>> 2. It has been quite a long time since last release, will see if need to
>>>>>>>>>> release a latest one.
>>>>>>>>>
>>>>>>>>> Thanks. It was a quick bisect for me, so I'm happy to help test if a
>>>>>>>>> bisect
>>>>>>>>> between those two internal git commits is needed.
>>>>>>>>>
>>>>>>>> Really appreciate your test.
>>>>>>>>> In case it makes a difference, I have the laptop with the 2.8K OLED
>>>>>>>>> display. I'm
>>>>>>>>> aware there is one other display variant on other SKUs, which is a
>>>>>>>>> WUXGA IPS.
>>>>>>>>>
>>>>>>>> Good to know, I believe it won't make any difference for ISP
>>>>>>>>
>>>>>>>>> Also, with that old firmware, my camera only works with the old isp4
>>>>>>>>> driver from
>>>>>>>>> that Linux_ISP_Kernel repo (which is the same isp4 driver used in
>>>>>>>>> Ubuntu's
>>>>>>>>> linux-oem kernel). Does the new isp4 driver you've submitted here
>>>>>>>>> require newer
>>>>>>>>> firmware than the old driver located in Linux_ISP_Kernel?
>>>>>>>>>
>>>>>>>>> Sultan
>>>>>>>>
>>>>>>>> We had a try, yes, both of the old FW can't work on the new ISP4 driver,
>>>>>>>> as you know, for the last months, we did lots of driver modifications
>>>>>>>> for upstream and cause it incompatible with old FW.
>>>>>>>> Now, under internal discussion to upstream a new FW to support the new
>>>>>>>> ISP driver
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Bin
>>>>>>>>
>>>>>>>> Hi Sultan,
>>>>>>>
>>>>>>> This is the conclusion of your test,
>>>>>>> Driver: https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>>>>>> [1] It works on FW      8f070131(ext):39b00736(int)
>>>>>>> [2] It can't work on FW 1cc8c1bf(ext):50582024(int)
>>>>>>
>>>>>> Correct.
>>>>>>
>>>>>>> Would you please help to check if CONFIG_VIDEO_OV05C is defined not in the
>>>>>>> .config file when building the kernel? Our assumption is to make [1] work,
>>>>>>> CONFIG_VIDEO_OV05C shouldn't be defined. to make [2] work,
>>>>>>> CONFIG_VIDEO_OV05C should be defined.
>>>>>>
>>>>>> Yes, it is enabled and I have only tested with it enabled:
>>>>>>
>>>>>>        $ rg CONFIG_VIDEO_OV05C linux-oem-6.14/.config
>>>>>>        CONFIG_VIDEO_OV05C=m
>>>>>>
>>>>>> That's the Ubuntu linux-oem-6.14 kernel. You can get the full source and .config
>>>>>> I tested by running the following commands:
>>>>>>
>>>>>>        git clone https://git.launchpad.net/ubuntu/+source/linux-oem-6.14 -b applied/6.14.0-1006.6
>>>>>>        cd linux-oem-6.14
>>>>>>        python debian/scripts/misc/annotations -e --arch amd64 > .config
>>>>>>        make olddefconfig
>>>>>>
>>>>>> Let me know if that works.
>>>>>>
>>>>>> Sultan
>>>>>
>>>>> Thanks Sultan for the details, yes, we can reproduce the same issue on old
>>>>> isp driver 4.0 release on FW 1cc8c1bf(ext):50582024(int), after debug, the
>>>>> cause is
>>>>>     - ov05c sensor device is added by amd i2c driver
>>>>>     - When ov05c sensor driver probes, it will try to get gpio description but
>>>>> it will fail because the amd-pinctl driver which creates the gpio resource
>>>>> hasn't been loaded yet.
>>>>>     - the ov05c sensor driver probe failure will finally make sensor not able
>>>>> to work when start streaming
>>>>>
>>>>> Add following patch is supposed to fix this issue to make it work on FW
>>>>> 1cc8c1bf(ext):50582024(int) when CONFIG_VIDEO_OV05C is defined.
>>>>>
>>>>> @@ -1121,6 +1129,7 @@ static struct i2c_driver ov05_i2c_driver = {
>>>>>
>>>>> module_i2c_driver(ov05_i2c_driver);
>>>>>
>>>>> +MODULE_SOFTDEP("pre: pinctrl-amdisp");
>>>>> MODULE_ALIAS("ov05");
>>>>> MODULE_DESCRIPTION("OmniVision OV05 sensor driver");
>>>>> MODULE_LICENSE("GPL and additional rights");
>>>>>
>>>>> Please help to see if it works if you get time.
>>>>
>>>> There is no difference I'm afraid. I applied the patch and tested with FW
>>>> 1cc8c1bf(ext):50582024(int) and the webcam is still broken on that FW:
>>>>
>>>>     [   19.523006] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:0)|start_streaming
>>>>     [   19.537000] amd_isp_capture amd_isp_capture.1.auto: ISP FW boot suc!
>>>>     [   19.537009] amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting Phy
>>>>     [   19.537050] PHY register access test success!
>>>>     [   19.537901] Termination calibration observability: 0x0
>>>>     [   19.539926] Wait for phyReady: 0x0
>>>>     [   19.541932] Wait for phyReady: 0x1
>>>>     [   20.901654] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
>>>>     [   22.070676] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
>>>>     ...
>>>>     [   28.769372] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:1)|stop_streaming
>>>>     [   28.769388] amd_isp_capture amd_isp_capture.1.auto: amdgpu: stopping Phy
>>>>     [   28.769868] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[1]
>>>>     [   28.771799] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[0]
>>>>
>>>> Sultan
>>>
>>> That's really weird, I tested kernel built from
>>> https://github.com/amd/Linux_ISP_Kernel/tree/4.0 with CONFIG_VIDEO_OV05C=m
>>> and above sensor driver probe failure patch on FW c8c1bf(ext):50582024(int),
>>> camera APPs like cheese, qv4l2, Camera all work well.
>>>
>>> Your failure still looks like sensor related, Would you help to add log to
>>> sensor driver drivers/media/i2c/ov05c.c to see if its probe function gets
>>> called and succeeds? Here is the log in success case,
>>>
>>> amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting Phy
>>> PHY register access test success!
>>> Termination calibration observability: 0x0
>>> Wait for phyReady: 0x0
>>> Wait for phyReady: 0x1
>>> amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting camera sensor
>>> amd_isp_capture amd_isp_capture.1.auto: isp_intf_start_stream,cid:0,sid:0
>>
>> Debug log output:
>>
>> $ dmesg | rg SARU
>> [    4.565697] amd-isp4 OMNI5C10:00: SARU: amd_isp_probe started...
>> [    4.565753] amd-isp4 OMNI5C10:00: SARU: amd_isp_probe completed successfully
>> [    6.937077] amd_isp_i2c_designware amd_isp_i2c_designware: SARU: amd_isp_dw_i2c_plat_probe started...
>> [    6.937522] amdisp-pinctrl amdisp-pinctrl: SARU: amdisp_pinctrl_probe started...
>> [    6.941264] amdisp-pinctrl amdisp-pinctrl: SARU: amdisp_pinctrl_probe completed successfully
>> [    6.951967] amd_isp_i2c_designware amd_isp_i2c_designware: SARU: amd_isp_dw_i2c_plat_probe completed successfully
>>
>> Log output when opening cheese:
>>
>> [   46.957925] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:0)|start_streaming
>> [   46.979797] amd_isp_capture amd_isp_capture.1.auto: ISP FW boot suc!
>> [   46.979812] amd_isp_capture amd_isp_capture.1.auto: amdgpu: starting Phy
>> [   46.979860] PHY register access test success!
>> [   46.980565] Termination calibration observability: 0x0
>> [   46.982598] Wait for phyReady: 0x0
>> [   46.984634] Wait for phyReady: 0x1
>> [   48.340154] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
>> [   49.509505] amd_isp_capture amd_isp_capture.1.auto: -><- fail respid Unknown respid(0x30002)
>> [   51.823498] amd_isp_capture amd_isp_capture.1.auto: amdgpu: Preview(fw_run:1)|stop_streaming
>> [   51.823513] amd_isp_capture amd_isp_capture.1.auto: amdgpu: stopping Phy
>> [   51.823962] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[1]
>> [   51.825358] amd_isp_capture amd_isp_capture.1.auto: isp_rm_cmd_from_cmdq_by_stream: fail empty cmd q, stream[0]
>>
>> Patch applied to tree:
>>
>> --- a/drivers/i2c/busses/i2c-designware-amdisp.c
>> +++ b/drivers/i2c/busses/i2c-designware-amdisp.c
>> @@ -42,2 +42,3 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>>   	pdev->dev.init_name = DRV_NAME;
>> +	dev_info(&pdev->dev, "SARU: %s started...", __func__);
>>   
>> @@ -95,2 +96,3 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
>>   
>> +	dev_info(&pdev->dev, "SARU: %s completed successfully", __func__);
>>   	return 0;
>> --- a/drivers/media/i2c/ov05c.c
>> +++ b/drivers/media/i2c/ov05c.c
>> @@ -1031,2 +1031,3 @@ static int ov05_probe(struct i2c_client *client)
>>   
>> +	dev_info(&client->dev, "SARU: %s started...", __func__);
>>   	ov05c = devm_kzalloc(&client->dev, sizeof(*ov05c), GFP_KERNEL);
>> @@ -1081,2 +1082,3 @@ static int ov05_probe(struct i2c_client *client)
>>   
>> +	dev_info(&client->dev, "SARU: %s completed successfully", __func__);
>>   	return 0;
>> @@ -1123,2 +1125,3 @@ module_i2c_driver(ov05_i2c_driver);
>>   
>> +MODULE_SOFTDEP("pre: pinctrl-amdisp");
>>   MODULE_ALIAS("ov05");
>> --- a/drivers/pinctrl/pinctrl-amdisp.c
>> +++ b/drivers/pinctrl/pinctrl-amdisp.c
>> @@ -183,2 +183,3 @@ static int amdisp_pinctrl_probe(struct platform_device *pdev)
>>   	pdev->dev.init_name = DRV_NAME;
>> +	dev_info(&pdev->dev, "SARU: %s started...", __func__);
>>   
>> @@ -215,2 +216,3 @@ static int amdisp_pinctrl_probe(struct platform_device *pdev)
>>   
>> +	dev_info(&pdev->dev, "SARU: %s completed successfully", __func__);
>>   	return 0;
>> --- a/drivers/platform/x86/amd/amd_isp4.c
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -365,2 +365,3 @@ static int amd_isp_probe(struct platform_device *pdev)
>>   
>> +	dev_info(&pdev->dev, "SARU: %s started...", __func__);
>>   	pinfo = device_get_match_data(&pdev->dev);
>> @@ -388,2 +389,3 @@ static int amd_isp_probe(struct platform_device *pdev)
>>   	platform_set_drvdata(pdev, isp4_platform);
>> +	dev_info(&pdev->dev, "SARU: %s completed successfully", __func__);
>>   	return 0;
> 
> Sorry, please disregard my last two emails, as I was testing on the wrong
> kernel. :(
> 
> I've confirmed that the MODULE_SOFTDEP("pre: pinctrl-amdisp") change indeed
> fixes the newer firmware on the old isp driver 4.0 release. Without that change,
> it is as you say: the ov05c sensor probe fails.
> 
> So now I can use FW 1cc8c1bf(ext):50582024(int).
> 
> Sultan

Never mind, really glad it is finally resolved and you can use the new FW.

Regards,
Bin


