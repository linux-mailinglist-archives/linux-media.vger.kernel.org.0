Return-Path: <linux-media+bounces-32268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC6DAB3199
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 967E6170C00
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 08:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A087C258CC4;
	Mon, 12 May 2025 08:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RjtJuVIK"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEF12571CC
	for <linux-media@vger.kernel.org>; Mon, 12 May 2025 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038461; cv=fail; b=UFNUTXXtEGtf7VDUCHKtmSy8gsUjIRHgY1CikphOjhJtsQ0oF7yhzMZmZ9n1YttmperRQnqbPVS0IOT5zptZIGnVcPVTKMhMDVN20Rjhwu5G+BHdvY3t929NzbstIPpVUi5iEStZ37C0Ds3xVWnQpWN+M6635vVqWRDsfRnSy3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038461; c=relaxed/simple;
	bh=f/v3yZGOn+JR5qv8/PUuaizbTwbdwqddCWxcsPN4L0k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M4E1BGXyI2A7NV1svB48sVz4uF845Gd0rPV8GkAl5YSiE1vogOiMq/sJ/sgUGQFn1LAdSMrVkJg4FZ1SO2iut2N6OhVALX6+JEawRVjpqjuDx7ko8QOiVy7qUNRMwg/wzql5639NGKk3qYfSr4ierchCvqoOczLittnr7zltki4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RjtJuVIK; arc=fail smtp.client-ip=40.107.237.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhZrjCd47ywXCsZBYaJ9m1XBitAR0k9hIJkmfuYLsHXDV0y/wUd+nV+IHsr3ALopVcyywI7PrQ09G7bddVezj9QkQqUxnmAnubiD7sc4tNjV7WUjD9PyG86ppEEnLP0KM+JNk6+UQglzU8x5nHuWy5aifJKuQNg+lKbOeKUaeLGr8JbfKwqJaf18qKGhwdxNm5JF+QreIc5C+eaggBAp3QbUZumLX+vj8QNLBTHxUTzot+x147cG2ovZefxW1+Xnx9zXz+dfulk7hYcWriLkgRFNVZVi/zBmApkKwEUJYG6xnh2qqfHVUgPi3Nw9ZRvbR09nBP9/U5ApOVe1JcGsuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yat3azGah7QfWhB2yUx5NRQeqIwU7S2k6QCPgLZ3VPc=;
 b=fevyNBRIfTOtEkrDDtkuRMGm8h9Om3s1SRezIfeY/vPdlSzWafJpcKsWtqsf+6oAy4O18GwArfrZm64/dHbOwBVYrWsBpWxra6X6eilPtBB/riEPxgb7AdcLM5SrUFyDRKXLPSSHfRoD52EVdtXe590ry8GhZqhtjgoFUbB8dWe4ayexaM44ChnFgdoKlWfKr74cYDSlka/mCGsuWoBAOglI22LfqRWHKQy7TPY41R9w/vu49KXWHOTb05SgA7nxdN52NxEsIXn+7ucw4KjYnYqpQYmTfYNZEt/GU9Idxd2/29/HAdICE/2n0lVyHeQkgVgFlqHVFsaj/HQxc2h/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yat3azGah7QfWhB2yUx5NRQeqIwU7S2k6QCPgLZ3VPc=;
 b=RjtJuVIKm0OTOf6FQuTG7VxkjLTa4t7gdt9WozrS2UdwGnEqHH0l5DJ2DEmIjAXDOb9buAMGuxIUy4RMFLWxo/yjkFMD0Mm72f7J8qTyRS5TT1lzgpwI/jvEgax3NtqrqJipxmmHFNi3CQ1BH9RyHOwPy1uZVYmtFbN1HuMxmkI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 08:27:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:27:35 +0000
Message-ID: <e4887f43-9eb2-47cd-91a9-080c3c646cb4@amd.com>
Date: Mon, 12 May 2025 10:27:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 08/13] drm/amdgpu: Use dma-fence driver and timeline name
 helpers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-9-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250509153352.7187-9-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf15648-60d8-4b83-5a94-08dd912ed941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3ZwRmN3TFU4blBKR2pUTkZ3RmhhdHJ4VmtNOWxVNzZlYS95U2YvSmRaVlp3?=
 =?utf-8?B?LzFDcmM3NHY1TXNtWGh0ekZ1aHNHeks4VFN3QVozeEZJWm82RG5YZjVET0o0?=
 =?utf-8?B?cnJsMi9QRnFDS2hpMy9adE9nWGxzQmd4RjhPOEJ2RHUzbXdXVzEvcm9zZ3dK?=
 =?utf-8?B?cUhJTEVuamdRcUdnNlBsZXZGMXhSVGJieUtMcU90SWw5VE1ha3B4TmV0eGtX?=
 =?utf-8?B?R29UMVY2U1dYTVBUdG0xSlFJMzRzU01rSWQrTmxFcnJQYTBuZjNVUTA0V1Yz?=
 =?utf-8?B?N3JNOGtXMThDSUNyU0xyWGR4Q2JsVDJUejQ0UnhxaTVLSTNiWlFQRTMxSTIz?=
 =?utf-8?B?Y01UQllyeTVSSUNEQjJqKzBpTzF0TnV1T0J1SDBVZ0hPNm1oODNaMldnOGNV?=
 =?utf-8?B?MEZwVlhlZUZGdHBjQlY5OTFoZDVUcCtqRXJiU0c0NDdFK3ZDYTlUa3h6M1Mw?=
 =?utf-8?B?bnp0TmFRYkQ2TEc2VFBETWlqUTFNYmhKU2txT0lXZnpSNkNVYjRuVnpNSnFm?=
 =?utf-8?B?SXhCVHFoTGpKVmFyV294UGhGZ0h6NTczTFVyOGhpRTlKYkVZQitQNkJhYXV5?=
 =?utf-8?B?QlRjNFFtN3B4VUFwOXdvWms5WDBJeno3VU9GZE8zQlhkcC9KRHNQc2dvTEJX?=
 =?utf-8?B?NXlGYzBGQ0c5QTBNbndaNVh5a1J3T1cvRHVJYkRnMWhzWU1DaXA1VUhxdjN5?=
 =?utf-8?B?WVdPRkdvWEpmb1F3S0hTeXROdmJGQXVvdjJQbHQ5bnpjMFFnS2RBb0N4VDVB?=
 =?utf-8?B?eUt0V2V1VHRPMGtVSjV1bVErVVdRMGRDdUR2ZTFWTmFMbDhMMGY3azhuRGpj?=
 =?utf-8?B?VXNRYmQrYnpmU09INnlOejRFUjlDUTVSSkI2dlMvU0pNcEhienRiQ0hBTGIw?=
 =?utf-8?B?Q01YVXducGozWlc4TlhVSUxkd05yYjM5V3NiN1ZIeVBkZnlzdGtHNlVFN3o2?=
 =?utf-8?B?RW5YMXFNVlpTSElxS2JEQTMwZlBwL2Y3UExRUUJTbExORkM1Z2Qrd3pnK3N1?=
 =?utf-8?B?QVE2TVh3YzZkVzJGbHE0c2xITEFMeE4rNE0vUDZWaytaWDZySWlCTDUwUkJp?=
 =?utf-8?B?cVA3cFpPLy9LOXFnQ0d6MTRVYUdxQWpUaGo1eVlnN2VyZzUxS2Izd0szZ1Y4?=
 =?utf-8?B?RnJhWWhtTHdrbWVpa2Z5d2xkMG9OcStTZUcwUXhUOTFPeW82Nit2ZEpTUG9p?=
 =?utf-8?B?TkFsN3FPRklLMGtVUXprTVdjN2xDWEdlZFlKWW5ZY3ViV3VpTjBTNjh4SnFM?=
 =?utf-8?B?eXV1OERqcWNNRndPSHdTdjk1Y3pVUUd2c1VVYWxVUG94STMrenZUbWp1bXVM?=
 =?utf-8?B?MFR4R1k4OFFkZ3V6TVdiQ3puUVJXaTFHWGxjdjYrNktNaUlNQmRnOGRhbitZ?=
 =?utf-8?B?OWkxQkdHSG94eFRoNHZEalI3WVZ6ZW9lY3VTdnFqNHVncHJ6cjBPdDAzU2F0?=
 =?utf-8?B?Mml6QVgxZHhxbGhqYTRBK29TQTZoWDAweDR2Qnh5WXdPU0VIeEIrMVNCVFRt?=
 =?utf-8?B?MXpHdmpTbkhSMWE1UEh4YUYxZ25kM3FFQ2hLZ2hhOWw0MklUamV1QmZqRGk1?=
 =?utf-8?B?cTVxWE81cnBhODZwbmhKaGRMRVRZTDVONndkdGtZbkxkNUo5WFk1YlF6N3hQ?=
 =?utf-8?B?VkdLSmIyTS96WWk4aU1NNy9WMEhwcWRtZHVMZ2lrR0Rhc0lTNmdSL1ZIYzlT?=
 =?utf-8?B?YnZySEZmNlJXWVMrSm4rMHNQOERDakxSODZlOEt2MzZ5azNjdC9iK2hpTk9G?=
 =?utf-8?B?NHhrUStQUytEQjRMaWY1UEc1di84QWpyRVpLTGNTUDNNazZoK1B3YzJ5aVZN?=
 =?utf-8?B?YWl1SHQzQlh0R0hvbFExTGNwcHFwcWQ2S00vOEF1WXBzOXIzZ2hIeHBJVk0v?=
 =?utf-8?B?N2Y4QU04anoxaDU2aXVlcUZVOFVSblJNUjl4eG1JWXc1SFFkMTNSNUExNk9K?=
 =?utf-8?Q?YtG0goE8+50=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjFWWFBiWXo2OWFCY20xU2hQSHR0Ni9pZGVBNTArZmxueW1TN3g1SC8xSUlW?=
 =?utf-8?B?bWtWMWx4MHdWVDhQVEhkZ3h4aWpsNVlJOEw4YUZNUGZHTHFkS3gyY2I4UUR1?=
 =?utf-8?B?Mzh5emM0OGx2cGJMRW55RnZZOVgvMkpmd1JicTlwNkJLY0NnK2hTVUtFU05L?=
 =?utf-8?B?d2NKd2loZEtqVkYwSTNNaGpSUmRzTTVrRE03SFBDZmVFSWpETWh5OFN5cjlW?=
 =?utf-8?B?NlhHZU9rNmdmZEQ0cGdER3lRc2VnOWtlZDNRcGo3eWhKbUZnWmV2MTJZR3p2?=
 =?utf-8?B?L0NsdW5udzZaS0NQdHM2K3A3azFRbjd2MXMxcStnU1ZjWk12L1pJR0ViTUlL?=
 =?utf-8?B?R0ZaSEZGb2pwVHR2dHU5MmRDci9zK1R0akZSWitldWJrL2ZrWEx1bHFlR2NF?=
 =?utf-8?B?M0tuU2VCc3l5VWRkdW5CWURQWmNHYjF2VTdzNm1Wd2hFTGd1QW44T0N0YWRw?=
 =?utf-8?B?NXRyejQ1d0lhTEtzUjB2L3lSOGorN21Ybm4xS1FmNUpwMWdqUXpCaTBTOEsz?=
 =?utf-8?B?VmJpdzcwbGd0MHQ1RVp0RFR4MXliYkszcEZiSmFxM2pyVlRQeDRadVJraEds?=
 =?utf-8?B?K1RPMVFDODNqTEJGb1QxTjFqT3RtZEIraUtPYXNYTkgrMjJFbXQrT2orK0hP?=
 =?utf-8?B?bFVzc0dmSUR6S1dNN1pGVlJWUlN6MnZxZXFEQ2ZDK24rOWY1aWpzenFMSWxu?=
 =?utf-8?B?UFBwVFVxcVVjWDdneHlxMmNieUFreDZxSmVrb2dIaW5kdTVZZDFtMnNsajdI?=
 =?utf-8?B?VTVWWmZmdGYzbWxzSFhXSFNCUXRoNit4aWFhOEl1L2hHUTRwREpwQ3ZPWmx0?=
 =?utf-8?B?TVhwYXVMeWNiZEtNT1oyS0NsYngxdXNNa2NYTlNXSWhJTHdEMWpueUp3OVJN?=
 =?utf-8?B?UFN3MW5ZVEtjSnp4YUROQWJIRTlWY2VpNlZaZEZsNUZabDdqdnhORTJqdm5F?=
 =?utf-8?B?L0tqTTA2SUFGMzZuR1o5d1lZSjZoR0RmdkNJRTdnY3pyVVFkdEMveUcvMGIv?=
 =?utf-8?B?WGRZbHIxWStBc044R016NzNpMWVWY3FjMGdLNUJodWtRWXNKTHRyK3FQWkNF?=
 =?utf-8?B?R0hmOVAwakR4OEhhckV1RndNWmI2eDk5K3IvcGtrR3FuTEJpbEJsbXNSM2xR?=
 =?utf-8?B?ZUVjMlRxVDJiZk1tY3dvVEpSWlR5Z0Y2aW82ZEZjSUJIalBpV0wzVm5LQkpO?=
 =?utf-8?B?dTEzZmd5UXNOMVVSZzFjTHZxR0tLVmE4UFZTNHpvYWFXOUVkd3ZEbkg5RlE5?=
 =?utf-8?B?M0VvQmcrb2owZFZObzZQWndDbHBzVDFpQy9oR1kvOGJqbGYyV3hhR2hma3Nv?=
 =?utf-8?B?VXF0SXN2QzFCK3hVaEc1aDIydnhYRTljVXlDS1h6Q3BYYmxCSGNVc1QrdC9l?=
 =?utf-8?B?dWJyb3NNcW5BOFpEYTFReWlhMkI1M1pEek1xR3d4cFlCMzd3VmRUL1pkVXM1?=
 =?utf-8?B?SjhVd1JRSW9yQXhsMG10cmsrS0tLMDFEZUU4YzJMcGhBNFVOdUtiSk9SeEF3?=
 =?utf-8?B?YzRiY1NkZFVncmFZVDYzQW9iZ2w1WmNSTktSZThOY2dORlBRVENvYjcyQW5j?=
 =?utf-8?B?YUJvclg2QWRWRlJTV3hOSmh5QjNqblIva3IvR01jamVQRUZ0TGN4UFVWM05q?=
 =?utf-8?B?NWduUUxXcWkrUzQ3V05wM0xhTGV3cHF0bGRxMHpwUk9EUkNjSkZMdEljM3lm?=
 =?utf-8?B?aHM5cHB3QTIzRERJWndGemJMcE1hSWp5ZnlXcmhrcGRjRVRrbnJNWHFoNmt0?=
 =?utf-8?B?enRNdDVucXk4QzI2U2ErZ0s3K3o4YS8xbmdTUG0rZjZsMnVnNW5TOE96U0lG?=
 =?utf-8?B?MEw1dUp0R3hNc2lUN1FJd3RISW9MU0V0bzBFSnRhWWErVzh3K3BWS3BRTWx4?=
 =?utf-8?B?SDRLcWFFdCtwbnE0NHNkZlM2WW16NFJOVUNoR1FmRHVaazB2VGdyZmhXaWU1?=
 =?utf-8?B?eU40TkI5dGs1WDdjK3c3NVdoSjdHM3V6VEJ6NVVjakRVaWJmNkF0dUc3MGhD?=
 =?utf-8?B?VnVjb3MyYXB3Ti9PWllad0Q4VDVSTVcyd3g5MFhRZmtoT3hCWGc3TTl2TkFk?=
 =?utf-8?B?VFdYMnU1VHlWY0hDcTZrZUZLYUVRYjlPV3Q0VTF2UFFPVExYZUNldmhFbHBF?=
 =?utf-8?Q?k02c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf15648-60d8-4b83-5a94-08dd912ed941
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:27:35.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iyhbu+WZkKy9lrB5FUEpL2v3XqFzZeHzwuiZeiREnAkH5zcu/Ki8hx30ydjLCjLD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751

On 5/9/25 17:33, Tvrtko Ursulin wrote:
> Access the dma-fence internals via the previously added helpers.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index 11dd2e0f7979..8e5bf179a6c8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -33,7 +33,7 @@
>  #define TRACE_INCLUDE_FILE amdgpu_trace
>  
>  #define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
> -	 job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_fence->finished)
> +	 dma_fence_timeline_name(&job->base.s_fence->finished)

I think you can nuke the macro now as well, the new function name is short enough.

Christian.

>  
>  TRACE_EVENT(amdgpu_device_rreg,
>  	    TP_PROTO(unsigned did, uint32_t reg, uint32_t value),


