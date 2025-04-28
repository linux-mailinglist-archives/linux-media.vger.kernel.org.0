Return-Path: <linux-media+bounces-31217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A7A9F3C4
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 16:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AAA23A9D55
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 14:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E79526B971;
	Mon, 28 Apr 2025 14:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Gs5Y1npP"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527BE152E02;
	Mon, 28 Apr 2025 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745851566; cv=fail; b=hIuxQjD9PRyIs+UjzDyLNW6K7ZU1fgC8ooWcVTetaCoLPtg8+qXu7rSDm56Q1IV8ByGlOHvjtyt11wx9aqQG7dXA5CT2kxjogMuiaPw48PNaxwyW3bnisPZwE95PkKy0XgoAYGtCrYKSG09oIhSmyOFXbmWWXuI5A/xzaSk5vRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745851566; c=relaxed/simple;
	bh=dvuYBira41u1ZpZdYH3ymZzJwMM7aRLaBzgAQMnZuvg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XiKEirOwgQhTmT0M9hGq9H+zZseFgm0sNtaJQY2Jyj/D+z/ZmHJMdEFGF9HZb3biN8XfEZtTbTta2goVOdXqt06vb6Egumcu5jIslHLcdW7UNX0WFRxjR9uCopfzIYizZDC1O8i6ZQpLZI+oXwOUhuLKgOk9SUxB5pNyvJUQDpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Gs5Y1npP; arc=fail smtp.client-ip=40.107.244.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2GXoXrcXs2f81vilr6QHGqUZV0Oou/0h057Lo4e+LTqWNlofroKF/eDvISilYFUNCdDKU8O6Oap3cMEQ313TCY6t/bOsNivQKUi42UOQopZe0dz0B+s7JOdAa2g5ZqH7DrFiPKN1JfO3XNeqwovzomvPTJMpYl2FwI+VbXNOvNA+2qTSa0/zl5HNH5f+/4U2WcdcYAwyuuMJgRRfWipS7P6Qq36ULDF75Bp8wV+iXuZm++UGmk4T3Nn+g+RK7sQ3fJ06tP+9X7H0Z8ZYqrpiPfP/pQi7Ygb6/ePA26QcvnhQVpwXWbp/hH+pb/lHz4Ks2EqG2mkGLvtMRjYJyRlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcYG1GYWpI0zoWKagZvI6IGdSMqFqYI7fbN57NLMh4I=;
 b=Np36FE/5OQjRuekbAfmDqc7WRun/cndJyOyv+8/Wgo3k+DFLD+DnIRvYlqBy151TKf+JdnJeNs4t+AzIQP7j5AKGcdx9K7J4r97u1uYvtWESVnpvrkkrMsnabLMXNbk64npQrIwQpCE1g/Ve+cTMAAmzsdtDneIUL2/XvtZAfW/DOpZs1FdAQVO+kjRZZlknA0FtfStmpU2wfKR+js539tWmnPiPDOpl1lcxKB5WJ8go5S6wJbu8DPhJAQB8TbpNVeYJ+MV9Mo/XkQleXvlOb5m9FPmYCuGJyZ6qgedqNGkT+oTs3lfR7hKw3A9+EdmewHVbVF0zqVkN+1CEKbIwKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcYG1GYWpI0zoWKagZvI6IGdSMqFqYI7fbN57NLMh4I=;
 b=Gs5Y1npPuhDU2MyTKzOmyQ8UD7Feajw15lWt8Pad9VudryHcJoaw1P5cMitxO0K1hWs8SeF1TrjQskX6Tk8H8LcHKWY31yRgS/Vtg9srSy7HG0RP5fUq2Y3UCzMXj26wGXDJYZ1stQAwWTjVdem9Ay0eh80JYg/Kx6XmoXbVvdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6991.namprd12.prod.outlook.com (2603:10b6:a03:47c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 14:46:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 14:46:00 +0000
Message-ID: <9793bfc7-5309-4e19-a0e4-5e298720aa9e@amd.com>
Date: Mon, 28 Apr 2025 16:45:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250424130254.42046-2-phasta@kernel.org>
 <20250424130254.42046-6-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250424130254.42046-6-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: c499fc97-e8ba-4a5b-1b7f-08dd86636480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEhNdG1tUzVnSWlYemFHWkhHUXlod2loKzBEeXIydTJ2ZlR4NXUxYmdZS2NU?=
 =?utf-8?B?N0ZZUUFjNjRZeWJYcnVCaDF5QzZzaXhMa2NpTE80WkUzQ0pkVDNYZVN2cTBZ?=
 =?utf-8?B?RUlwZUQzWGo3Smt4QWdRRmRKWEJWN0M5TW5MZUtiMkZyWGhrUG9LU1NtdnFV?=
 =?utf-8?B?YnY2QXNmQVhRQSs5ZUVOZmZZSVFadXkzWng5NXRnTFVlZGRTYUFlVWhKR29U?=
 =?utf-8?B?dHVReXFIcUE3K052clJqd1FjOXdjQ0Jkb1RRY2R1WlNKV0t1cFAwVzdKZXdh?=
 =?utf-8?B?dWhNM2xpTjErczZkbkMvdHptQ1hJbkhaOFA0NkdrNTcvNFp3SVUyaUtvU09t?=
 =?utf-8?B?TlFJdHpnck5qODNLenU5VFZmcHhjandGRS96WitKQi9RdDQvYWV5RGtsZDN1?=
 =?utf-8?B?RjhjeU0yVkdXd2VzWTNnRU5WMldCdFVFZENMc3NPMnpRcXFpNVBwaGpCNHVu?=
 =?utf-8?B?OFNvWXIrNlZMYWpNbW8vNmVlVGVvYlFuQnloU2dVZXZPUUFHb3l6aUlzaDhj?=
 =?utf-8?B?L0xHYUd6M3M0YU42L0I4TDR1SEc3b1lsRDlIbEdDZExDZm5mMDROSmpKT2hT?=
 =?utf-8?B?OUVaVWtqSTBhMkd5cmh2YUVLcnVqWkora2w3RDhvTTV6SytBRWFiMlBvOVNj?=
 =?utf-8?B?c01vQjlaaFJlMk1aMEtVdUI0QlNvdTE1MUlLM3ZBdlQ0K0N2OGxYMFBwbDJG?=
 =?utf-8?B?YXI2L1ZNVU9ySlVIZks3dHhtMWFtcjgxZWFCNFprVlcyTGVKRTlZMFZKM2lE?=
 =?utf-8?B?Nk9hSzAyeTh3ZjBXT2tjK2FWeGNwa1M3dnMvcU9lVTRNV3J0ai83UGlIT3BB?=
 =?utf-8?B?QlQzWjIvbW9GQmxSR3grM1NtQmVML1ZyWmIyMUhkTmZuMGxGQUhKSHp3dWpq?=
 =?utf-8?B?UEUzMmViOHQ3cDNNaExhejc0Q1ZzOHJSdHlkclRLM2MrQUJFN2xHbGV5S0h4?=
 =?utf-8?B?OVpGTVZwOUs4WHBYMjFrVlgyOGVGYkdhV3NCNm8xMmEvaUFCYUdJVlM1WUM4?=
 =?utf-8?B?L244NkF1SnVzTnViOTVGakNnSjJSMGw1T0NQemcxT0IwMFZZVGJFZW1CKzFo?=
 =?utf-8?B?MGF5Q0Q1OFZPYnVrWjZKNzdVZE5wdmsySnVqNVBiQTltOGN3SE1aVXlPdFBG?=
 =?utf-8?B?TDNnRDVtQUQzNDJiL1BiZ3N5MmpJNVk2MExyQXFPNmI3d2pTd2hGVDJVWW4z?=
 =?utf-8?B?VFhqRHd1Z3drU2tUUC94Q2FlVklDOU44WTJQcFdGSHcwWjF0dUtDbnNPU2d3?=
 =?utf-8?B?MTlHSnUxblVZbmMzT1htTWtiSDZpcUx3NWIyTlBsNkJCckVxOXRodlZ6bHBI?=
 =?utf-8?B?WmpYbGRqYWk4QzZ4ZEZka054YjBFZVRLVmFnZUNsMmgvUHNVVUVSV2hheHlh?=
 =?utf-8?B?dHp2dVY2emxtSTVhalJ2UVh2K2F0QzM5ZjJXbHlEZDVhTXNiNVdSVzNlR2lq?=
 =?utf-8?B?NHQrSlFzamNjR3JlZm14aTEzenBYc0g4WEtudzYxN1ZoSnR0UUhNTWxWWm1N?=
 =?utf-8?B?WEpnOE9TQW9LUThzV2NkVzNjYmlMTVlFT2pic0Rlbm05K3FpdWtzVmxrR0Vn?=
 =?utf-8?B?dXZuUEREaWdOSFllWGEybGFVcGJ1VzVlY3RBaTBjR051NjJJQW4rZjNMcjhm?=
 =?utf-8?B?OFMyNE9wbGhSdjFDV3hGdjFGallkS3loR0VOOGlHa0hTS21NWURET0pod01F?=
 =?utf-8?B?UWxpQ1U4OGZsS2hSeUVkVXcrTEw1Mk5JMEp2ZUlCZHVIL2hlY0N6T0ExMTBE?=
 =?utf-8?B?YmduYU94RFFkTGtkL3NsVEQ0L2JBMjFraTZ1SHFXbUNGNEE0WHBuY212VXp5?=
 =?utf-8?B?b2lzUVpKVlVNcE1laGUzdWdmTm5XeWZRaVIyRGZ6S0pIMW9xL2tsVkE2WVFt?=
 =?utf-8?B?bmd1bitEUlNqUGQ2aVFwQ1ArYzdDRVpkT2VPNCtsVG1RZThkSjQ3RUZRUUFw?=
 =?utf-8?Q?rZtBWrDaVYw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S25mMEN5NFRkUS9pV29PVUZJZFJXNEtqcUptNGFZcWNIRllzc3p0cEFsa21I?=
 =?utf-8?B?b1o4M2JTcWVPaGtSL1FDRVAwcHdDTkQ4THUrNFhRWXpqNUVTanE4b2xTQzBi?=
 =?utf-8?B?U3BkR0hmWUJzZWk5ZmtzL2hnc1JKWFhJaW9Pa01rdlQyQUFYdktMNXNzaFNJ?=
 =?utf-8?B?ck9mMTJIaXd2YWJBZTZaZ0VmR0NTTDVuMUtoYjJ6OEZMcVdnRGNudFdtZHB1?=
 =?utf-8?B?Z3l3dDBDMVk1cG9taVhGOGM2YWlMYUV4OHJEczNCOTVMZy9hZ1N3N3Rsc29w?=
 =?utf-8?B?NHZvL285Z3JxQTJaeGpTNlRLNjUyS0Y5NDJpdHJndm95SEhPZlBUNTZZV0FD?=
 =?utf-8?B?Q0RyaEhPN004YjNCeXg0OWpjd1N6VEZuZFdzeVdWVytUczl5dmVnWDRmaCt5?=
 =?utf-8?B?bTAwRWJTR2xLRHF6UmZSWXBMT3RXbldlcE9SV01JVmp1R3FFRitBWVZDU09a?=
 =?utf-8?B?ajFhRzd3V2Q5RGd1Ry9ockdnb0tVY015ZVZPNE1kVFZ5ajc1ZzB0Ykx0VVhN?=
 =?utf-8?B?QjBLMHh6QlBtVnBRckJjc3ZwZ2dsR1RObFhtTTlWb0l6YW82RGJiUFROYlpu?=
 =?utf-8?B?c2Uyak5mdnVMNUs3c2MrMVBQREQ0eWJGa1EzelJ2QU1DdzNycXpKODRsRXQ4?=
 =?utf-8?B?cFBCempxS0pMbTFQQzl4UjBtUG9GSUpUNjdzd09NMCtLTGVWbnVWSmxCTGI1?=
 =?utf-8?B?YnplNzF4TW1XcGxzNlpJam44VW9KSUFrYlg0cmRXbHNseExnaG93ZERnTDh0?=
 =?utf-8?B?Zm1oekhscWJ4VmFzLytJbjk3UkxKZ2pkWHcydVBJVGhuRHlpY211YUpKS0Zr?=
 =?utf-8?B?UmpudjJwWkJGcnNyZnZhR1lPWE1iZXFhcXVHRVhaeElrc2JJdUo4cXdHc1Jz?=
 =?utf-8?B?K0NrekhRdHRiWHNoVTBRK1pSNDVtY0crbm10T1JNVVY3a1EwVnAvUGNYN1pD?=
 =?utf-8?B?UlhXclJwUkJ2MEdnQTZGMmVNN2pkdGRTODlWRlBac3hZRVhET3krdW5WeGZB?=
 =?utf-8?B?MzFZWUlybXNtR096ZjRWdTNZTWlsMzNtSkhKRk1nOEcvejRCWW9LYUhablBr?=
 =?utf-8?B?cmh0UDNXelNUT01GU2pkUXhaZGlXMEhaQnd3eXFwSXpoUFF4QWtJNFVyK0tE?=
 =?utf-8?B?S0hTUWhKSDg2OXc5QzVJNlNpTHRnUzZUQ0pzMzV1aFl4Uy95T1RMR1ozK2Iz?=
 =?utf-8?B?dWFON01rdUtOU0dySXlmcDZEN05obVhjd3RLdWl3cElqU0dEanE1VThvbDdQ?=
 =?utf-8?B?ZkVxYU45cWdDcG1vUzVTSVEraUVVUGRoa3BXMTdXUjZwRlRxd2UwQnZVQW1j?=
 =?utf-8?B?Z2dzL1JRRitEUURvc004QWJNZ1RGMytUTFdEN2dUQkdYS0NFM2xadTR6ZzVq?=
 =?utf-8?B?bzRjdXZVbnhvaG4yemsyNEZ5UkZLb3pDbVJuSUo5ZHlQOWgzUjU0ckJMT1Ez?=
 =?utf-8?B?NXl3ejJpRnFTRENpUXR1Skd1b0wzOWdvajRWaHZoc3ZGeHVSZDdQc3hRdG4y?=
 =?utf-8?B?ODRESHlJL2phdVlyNWUrdG5NK0puNkYrRUhZL3I0R0xmcFdyMzAzczFKTEll?=
 =?utf-8?B?WTRYQWlzSm5hNEJqN1o5YVJrTnIwWVNLNy9qMitrZ0xKSkRzZVRveHhzejRM?=
 =?utf-8?B?VmdGeDRtTFlrYXZseVpyN09WNnNjM2x6cVJIZUJkbVh1NjhyVUdJbzBnV1N0?=
 =?utf-8?B?emFidjh0aU9Rc2kwWFJqZm9sYURmenRXREFDakdqekdoeGp6REJhL2R6ZjZt?=
 =?utf-8?B?Z0tFTmhDckxVSlFhREN3NHRuYitDUG5MMTBHaHlvMzA2Vk43bHV4c0lHMk9J?=
 =?utf-8?B?enQ3aTduZ2ZoMitPWUgzRDNOWm1GK2l4ZXJudW1FUGN1Ym9MSkx3bFhCQUMx?=
 =?utf-8?B?SVlhamk3OVRaSWRSK2VIT0pwdEVLSlV2Rk5iV3ZjVm9QbE0xL3UwWUVBU3k5?=
 =?utf-8?B?VUV0R3FPNzllY3loOFdVK0VQQm4xYVIrQ3ZVZnJHMzdPV2VLNDdSS3JxWGI3?=
 =?utf-8?B?QUVtSnI5RTJpYllDeTZmdkExZ0FXS25DRmtWTjlheDlzeTNYNExHU0FGbUtL?=
 =?utf-8?B?Zko5bmlleWlucUFkcnYwYlBDMlQ4Z2dYZUFVbWNTMGVRL2kySDB0OU5ZMlJy?=
 =?utf-8?Q?YVq9Yu/lHZRihSPx0eE4KWgtQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c499fc97-e8ba-4a5b-1b7f-08dd86636480
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 14:46:00.5607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1NSIPrOqyMQe8oDChIGx3+4f7CrkQ9Pkk/mRY2rb+GqINgXuYz/4k5T3iJNQZ0D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6991

On 4/24/25 15:02, Philipp Stanner wrote:
> In nouveau_fence_done(), a fence is checked for being signaled by
> manually evaluating the base fence's bits. This can be done in a
> canonical manner through dma_fence_is_signaled().
> 
> Replace the bit-check with dma_fence_is_signaled().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>


I think the bit check was used here as fast path optimization because we later call dma_fence_is_signaled() anyway.

Feel free to add my acked-by, but honestly what nouveau does here looks rather suspicious to me.

Regards,
Christian.

> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index fb9811938c82..d5654e26d5bc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
>  	struct nouveau_channel *chan;
>  	unsigned long flags;
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
> +	if (dma_fence_is_signaled(&fence->base))
>  		return true;
>  
>  	spin_lock_irqsave(&fctx->lock, flags);


