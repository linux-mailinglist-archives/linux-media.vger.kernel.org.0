Return-Path: <linux-media+bounces-29921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F75A84385
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D431B82630
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676E428540E;
	Thu, 10 Apr 2025 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Tg+705ws"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D0426B2BA;
	Thu, 10 Apr 2025 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288941; cv=fail; b=IfL/d2Q/OgUj7OuR1cWezLpuNUgFai4MkB/7qqHe2V5uSCUwUyUJuYtdTh0HVH0haeXrM0prRwJwRbE4NzEapFVCOOUIL46Dx5YHYdAEbOr2lUA8mLTdzHbUfZITQCPqWh1MDPrWBnlWcDsK+B06JixxQM/5hp/HA7VwraY18G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288941; c=relaxed/simple;
	bh=9MjFZqDmqEzgEkCdeUQh9EXbPdt5JBwlF8/oRwvoGDk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kg/F1VAaRj7vaQyoxVsMqRxQAtbJODcbtO+dW3SVancIaJL7hJlIiSE0TW1syq6P9ovNLvWw5REyOnYrh1j1bw8DuoJTMKvu3/pd2HbPBODUTDayOH5iThNLG7JM31x9YE5Bt4rLkfL65zslC7xC9u3rpt4gYE/5e3IcVK1mViA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tg+705ws; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8WUjnj+FsYRWESXX2KfXIMLi5oimz2IS+i8kdT+pdChfXUg/mvCzpDNG9URwjqau/RBmYuH5ubQYQeGjGUUyWptwsTUO+LspLBy8V7rxOJD2TMOZLP1QZqFWKA0rsjsOGOJG6nWfNweCm2d8g7beiZgMtgMh7DxuUEH5mdQRvEb4q5kgHHRS31o6pgn3zwz1ZRiTHiW9FvBnkEJ/wfNU3cOYzb6HPIyNTiBhz3iDWrjI5qnDljgiNtFiEWjTuW9jPUwzuJwsr1fEylCxwAfobtx0djGzWQ0RR9yudEnbVDj4opDYbuJglzV+LfUdbKl01+CKFzJYaFRpT2QN0mVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCxzTSKaUUuaPfTNpKXGRt8AJ+4GHhsLWeKDaNWNzpo=;
 b=c7yNaXYB1doCIVdzZJiqcjJJwgcI3hT+9sOtp+V1N4buN8JlczfRCm0ZP5Vn4gMiR/RBYCHiB5oBblTb+p3KsW2ZIkDVZrHgry/lBnSyY/oaGsPoVr6mmIAEDIBavlywrSuHkoSLaPAu+NChrXuh9hjdqoEj+lxcVonzxaK5c2nM+LSgxuBSoXHdwDDAMMgTRSKIfrbMZzQDU474WQbRChqzWnr8uByktXDa8dJT7tT4G5saLDocWlFBNgkCaBIBJBxhyfTPj/lSshLBPXYdx5yidaO/fOKM2Z3zBZZlBskcpSnWtNtRwmX8qa2fU4J38HYSh6enb+Hfpg+DKYI8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCxzTSKaUUuaPfTNpKXGRt8AJ+4GHhsLWeKDaNWNzpo=;
 b=Tg+705wsNBfbE0jUaiLUk7NCuUiuwny+zkSwTJkBElf/+v2w9AIlsevxfesb7pD/S0bKitHX/7Bt4W7ryh7+cC/8B0ZZ0Fu5Y5Kq1V+gbZn8EyIgAQF4ywQYQ9g+BGKeuI6AxHR3BrdMO/IQE42pYZuEO0QOjBFPphr0R+zVfFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 12:42:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 12:42:16 +0000
Message-ID: <9583e25e-1abc-458d-8b06-01193368f5fb@amd.com>
Date: Thu, 10 Apr 2025 14:42:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sabrina Dubroca <sd@queasysnail.net>, Sumit Semwal
 <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-3-phasta@kernel.org>
 <d03c618e-aa4b-423b-9c50-143b8a197cac@amd.com> <Z_e3uihgYFvwmQ7C@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z_e3uihgYFvwmQ7C@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4bd55b-4600-47f6-2ca0-08dd782d2046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3lyWmRYdlZRZStxZ1p6SGQvR2NFVFA4TEJrMU0zTmJ6WUhNejV0TUIzeHMx?=
 =?utf-8?B?eDNadGtMcE1ERlZaYnFtZmo3RE91NUZob3JLa2RHa041MStMN2l2TnYwVzJM?=
 =?utf-8?B?YWx6cEFudDBsd2JCQU44cFJvL3I5VS9nbGRYOVlGWEc1U2Q0UG9SRHUwM1Iy?=
 =?utf-8?B?d1dFcThMQ3NGK284THV5UXk1Y3pyRHFZSVhwN2RxbzZPTWZETnYxVE9SYmRj?=
 =?utf-8?B?RFFCVEtadnNEV2FhdGhUQ3dIL0ltejJCVGpxdTRIR0VPOWU3QU53QmowV01m?=
 =?utf-8?B?VndVZFQ4MjJ2M1pUQzAwVWpaSWRTZ25QUkZiZWJpUHlsS21yV3dIZ29RalQv?=
 =?utf-8?B?dDVaUTNoT1l3ZlNzK3BZV2VxTHI1YjhxK2xVR3RoL1hsVFQyUlhNaEtqZGdi?=
 =?utf-8?B?WGxsTklQcnMwKzU1UlA0cyt5bnpzSDdpRWVjSi9RTW9iQkpjcFRFSG1ndEV1?=
 =?utf-8?B?b0pSR095SUdaenNlZXFHam1IcTJhbEtTelZ5WVJvVm1jdzIxUTJSS1lnWDcx?=
 =?utf-8?B?TDRCRHRsVW9laTI3Rm1WOHgzZmI0MzNITVlOYW8rOXMwS0RhU2M5M0RJSDJx?=
 =?utf-8?B?QjFldDBtaEtnaGxIQXk0YW10ajFTcmZ6eXlyd2M0V3JpK1paUDVlTXRCYzlB?=
 =?utf-8?B?eFhtM2QrOXAwY3U0RlhGRmhhdEd6UzZ6c0JpQ0dueHVaQ2pHYkFiQkpkMmRH?=
 =?utf-8?B?RDFUTXlXdWtGZ3creFAyMnpqQXN0ekhBL21JYzhEQzlGUmlkci9vSXVlWjI1?=
 =?utf-8?B?eVQ4ZVBvNXQxWEh4YVZiVHdXUUlNZWVGcm9MeGRVbmQ3eGRlazdBUzZLM1hD?=
 =?utf-8?B?MnZnT3d6UytTc3VPTmt1UWJtVUhRYlFoVUZveWcwenVIMC9qOFZYdVQyU240?=
 =?utf-8?B?NmVyVnp5eVNxSGtReGw4VUg2T0xnaC9SeTUzaEE2amR1TXJGUUtkZDc0Qkpy?=
 =?utf-8?B?MVJ4RDkwbDJUaEtNTkFqSHpTZVhwVzBydFJOaWtpNmUyVUx5YWJRWVNJTFdR?=
 =?utf-8?B?SEJHV3dsV2pSb3MySXErQjdFNDhodm9uYkpOb1hiT015YzFzejA1ek5UdklP?=
 =?utf-8?B?UVdjVlVWWjJXQnhmcDdyMDdrWk50NDVvSDNuZGtFT0Vwb0ludDEraEtqSUpl?=
 =?utf-8?B?cHU5bW9aNEliOEpnVHNBeHBEZjZSakhCTWpLeGRaSDFlZ0JNcHp5RkZlbENW?=
 =?utf-8?B?QVhCVzl3ZmZkQjBlYmFvdDNTbTZBdXNBakxZK2NJMlVheDlKVXB2cXpKZjIz?=
 =?utf-8?B?YTFMVlZKTGlZTC9jOWoxNkY4SFByNUp4VGh3UW9yZEVZZE93dmVGVVBSamFa?=
 =?utf-8?B?MzAwQ3FkRHpEWUxHSE9ySXNxcGViVnJ1NUpWWHNsME9qbXo3a2FacVBiclVP?=
 =?utf-8?B?YW4weWh1N0hyWEFBNkhKUTlNVlh4ZzNIdmU4MmhwRkpRMGZSMHlRTHNjMlgv?=
 =?utf-8?B?dldsSUtnS0dtL3VEd051YmxZTDN2N1lIclVzR1VsVkI3QzdhYnU4bytYdUZl?=
 =?utf-8?B?b0lxdFN3Um05bms5SkdRUGE2WWJ1aVFwdUNBd2RoalkzSFpxQzJSSTZWMHhD?=
 =?utf-8?B?ZTlwb1B1ZXJ1ZTl6MWtUOFhyU25SMEwwcEFMWGNJR2ZTR1ZQL1hUQ0lVemNR?=
 =?utf-8?B?ZFRwditHbW5XL056enluc1pLWnN4cWl5T2FZdkFRRzJ4bDUyTFczanh6RUUw?=
 =?utf-8?B?T3Evbm9STEs1endwTW9YWUpEZThZZHZXdWtNODdoT1YxZnl4Wmx0UnJZdjNL?=
 =?utf-8?B?KzN6OEZjMjVaNWZXU0lWVWFxUWVQTjE1ZnVIaDZSYnU2am9uY0FoWXdyeXNS?=
 =?utf-8?B?ajJwTHVsV2d3NUVoOVYvVGFvdlQzcmpLNjBieE5RREZMTEV3Z3UyWFUvbkZ4?=
 =?utf-8?Q?qXVoCCUIpBd7H?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2tWZ3dFWkQ5bGtNWnF0bVY4U0IrSjIxODVFZW1OZ3FtZEVSS3FWaEF3OXVO?=
 =?utf-8?B?QjRYTGloMSt3eVZSVkV5NkovSU1TSFNuT3d3VkdLc3Q2UkUwUWlzTVZDSTdl?=
 =?utf-8?B?QmVxMHZRbFg1TTA3c2pHYjBqRS9NZzhzTEVFUjdPTWR0VnRjUGZnRnZ6QTUv?=
 =?utf-8?B?L2lyajFqN2hRU29PcVVvdHNRcFhqVDk1SjFFdzhUSHNpeXRmVlA1ZnNjZmVx?=
 =?utf-8?B?ZmF3NTljUkVDbEtLaHBUZHpMb1J5MWNXbFFIU1h0UlNVZWhHcFJvRGovb1Bz?=
 =?utf-8?B?bXp5MXB1RllTWThadGRrbHBqZFIvUFNWd1lYZzRUQy92YlN0R2oza2NFVzNi?=
 =?utf-8?B?d0JiMGRiYUtTU1R3WU9OTVVjNU5nSmpaNWZuWEhXbXl2WmxoOFk2ZHZlSW4z?=
 =?utf-8?B?NHhkUktaSm5XRU9YWHRFQUp3USt0QXMxdkY5amZiNlVWUktzTGN2UDcyOVRk?=
 =?utf-8?B?VkRVM1cyZjJNbVpzRjRlVFdBa2RQUTNkbGZUbXRLdXRYRG1MNEU4bWVERnpi?=
 =?utf-8?B?YmxkYm5pQUd0OVp1Q2JHd0Jralp4WTBSNFU0TDM2NmphSmY5UWdLQWZxdHZL?=
 =?utf-8?B?WGMxUlR2UFVKSFMwc1NqMjBiRnF4dFRkUk1HUlNSUUYrZVhNZDU2bUdNemc2?=
 =?utf-8?B?K2FhYVFUVUdTdVRoaW5JcHNrWUp5MG5wWXJSdEZ0WFU0OWdIM0lQa05aWHl6?=
 =?utf-8?B?djdETWF3cmVuK2pXd2dybmJHQ1d3bG1EZTFrMWZDYkZTN2pma0tsanVwTHBm?=
 =?utf-8?B?K1hrTmZrM040NUJYYk1vUndBR0JjS1QrZ21ZWnIvQXFKTmt1VHdCdW44VXRu?=
 =?utf-8?B?YUNlVkw0NkVJK1dBcW9CMGJzWGVvakx3SklJd2NtK1UxUDBGUkg4bzYzbTgr?=
 =?utf-8?B?b0NMQ2FZU0tBNHgxU2NUK2dFQ1J6d2JyVHBQZUdEY0dUdnhBVktqZXY0ZW5S?=
 =?utf-8?B?TUlqWHlzVWl0MUhwQnN5VVRGYVAwVUJQUi85TUprRnRPV2svV01iZ1huQW9V?=
 =?utf-8?B?RFgvS0tINk9LOUkvRHdmQjlDQXpsL3ZhdGRMYXZ5N1JMcXhUcHdOTktxaVV1?=
 =?utf-8?B?dnNBWGNHZ3JCa3lJUjAxYkJTUzNvaHhKa3J4QVJkQmt0OHQxclM3Q1BJcWZK?=
 =?utf-8?B?cUk5RnUwd21oNnJ5SHlORnhWNDFrWnNFQ1UvTytkcDZNazQvM3d5V3JoZW9S?=
 =?utf-8?B?bG01cVNCam1xeGIrZ3gzQisvUldndkx2R0tkL3VwaEFGa2lPV1I1ZlhxYngy?=
 =?utf-8?B?MlF0Rjk4M2Yvb2hPakhjNm9yNE1JQ3dxVEM1QUNPSVZOejIvaGlMMDBmLzBJ?=
 =?utf-8?B?VmVYU1YxTkNtT2tSMEtkYWhIb3RPMXpoeVFNVDZRaDFQL2trSnRBQXM5WG1I?=
 =?utf-8?B?U0c5OWVjT3drbXowWTl1VHdWQkxodjRWUkJsMk1RRTZQVEE0dWhDZGRYblVx?=
 =?utf-8?B?Qmd4N3RnRmpUWmxobzQ3aUI3V0VVdjRqQjFWZmlMNW51QmhTL2ZLWUVRNFdr?=
 =?utf-8?B?Wkp1WEQ2YTVRQ3JZL2NodHpDeTQvc0djSW1PM3l6Y29URGlWUmY2MzNUYUVN?=
 =?utf-8?B?akxNVGxGRWxMenAzR3lLOUlzMXJlQmxaODVKZHl5UnF3VHR6LytCZzFwY3Zw?=
 =?utf-8?B?MmdRTzdFL3VrREtaM3BaZFg2VUZ4bXVMS2ZTdjB2azJkcjYyMmcvSUtnTXFv?=
 =?utf-8?B?L2JCQnJqYlNyVjVFK2k4bWlrU09DVkFRV3hTa204bS9IZmtoaDQ4aFc1Si9u?=
 =?utf-8?B?ZEd5RDQ0Ty9RZ1c0NEN0YWtxWUd4RElYcy85bHFQbkd2a2xlZ3hBN0NySHkv?=
 =?utf-8?B?UERPRC9VRElJUTZxaVBQVk1aZzYzNVI2NzduS0piYWxNb3ZNaXA1MDI1aHd3?=
 =?utf-8?B?Q1UrNFdaQUZ1ZVlTMEVJSzFROEZMNXhqcmZpbVhNU29SVGE1bVplYUg2ZFdX?=
 =?utf-8?B?dTVteHVkZUxwSHBPR09YbGY0VkQ2ZS9yUFhBa1lMZ1lVRnlrZW1DTVBOOXFE?=
 =?utf-8?B?ZDdzRFo1eXRTZktaYVRXcGprYXhPd2prMEFPNnMwa0Q0dGoyczhySnR2ckdr?=
 =?utf-8?B?NEpheDBDY1IrUk9jeFlGRGxKbjc2Nk1JTXovcHc4bVNGcUpsWmdEMFRQelRh?=
 =?utf-8?Q?zSIBTxpIdEgtDfyhVRnXygeJ6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4bd55b-4600-47f6-2ca0-08dd782d2046
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:42:16.8502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkHa2Q2jfFgSTmOQ8l39YfetwBI/uNw8EwNeCKDS2yL4G1CnwSexSDauGErMp9eI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331

Am 10.04.25 um 14:21 schrieb Danilo Krummrich:
> On Thu, Apr 10, 2025 at 02:13:34PM +0200, Christian König wrote:
>> Am 10.04.25 um 11:24 schrieb Philipp Stanner:
>>> Nouveau currently relies on the assumption that dma_fences will only
>>> ever get signaled through nouveau_fence_signal(), which takes care of
>>> removing a signaled fence from the list nouveau_fence_chan.pending.
>>>
>>> This self-imposed rule is violated in nouveau_fence_done(), where
>>> dma_fence_is_signaled() (somewhat surprisingly, considering its name)
>>> can signal the fence without removing it from the list. This enables
>>> accesses to already signaled fences through the list, which is a bug.
>>>
>>> In particular, it can race with nouveau_fence_context_kill(), which
>>> would then attempt to set an error code on an already signaled fence,
>>> which is illegal.
>>>
>>> In nouveau_fence_done(), the call to nouveau_fence_update() already
>>> ensures to signal all ready fences. Thus, the signaling potentially
>>> performed by dma_fence_is_signaled() is actually not necessary.
>>>
>>> Replace the call to dma_fence_is_signaled() with
>>> nouveau_fence_base_is_signaled().
>>>
>>> Cc: <stable@vger.kernel.org> # 4.10+, precise commit not to be determined
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> index 7cc84472cece..33535987d8ed 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>> @@ -274,7 +274,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
>>>  			nvif_event_block(&fctx->event);
>>>  		spin_unlock_irqrestore(&fctx->lock, flags);
>>>  	}
>>> -	return dma_fence_is_signaled(&fence->base);
>>> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
>> See the code above that:
>>
>>         if (fence->base.ops == &nouveau_fence_ops_legacy ||
>>             fence->base.ops == &nouveau_fence_ops_uevent) {
> I think this check is a bit pointless given that fence is already a struct
> nouveau_fence. :)

Oh, good point. I totally missed that.

In this case that indeed doesn't make any sense at all.

(Unless somebody just blindly upcasted the structure, but I really hope that this isn't the case here).

Regards,
Christian.

