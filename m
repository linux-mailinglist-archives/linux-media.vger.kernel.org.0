Return-Path: <linux-media+bounces-29916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914CA842CD
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 14:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D39A17B6B8
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 12:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7C0284B43;
	Thu, 10 Apr 2025 12:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gTFxOYtM"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF06C2036E0;
	Thu, 10 Apr 2025 12:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287359; cv=fail; b=J5cTZ1bZC3cQ8Dn7XjEAd4HmE2Ncb+vLrGIhkJGhA5akIKWKLwjGt0myCuhjG6oymCq4zkpmJhzd74zSTkMbhn9wns+ahXtF3INHVzw+CEsYYv++fF0uFSG7gmHnBkhGoKT/gaBNMLy8RjcI8pCNyGeKkKLfqNlgkaJ7PckE0cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287359; c=relaxed/simple;
	bh=EYZBoP/D2yjlxywyLU4kk0o6gH0jDGOy0h4vKdB16qg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uB4w1NQjYVFCic/fcaViI/gG3Nl6b9gW7Kz7OwaTRsCtIDUou2WXlHUv7ClGMIIrcxLatmxujBL77xYf0OpzxHGI0CTRSm432hWHTdVL+SonG+ifCGarOflBarCZmdsG6ia1i93XVo+ZvhSSx3VJwBDfhjsFjCsjj/MXhdfPYOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gTFxOYtM; arc=fail smtp.client-ip=40.107.237.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l6TKi84JRfxqLM1BTlDcV1eGR4pyKKQHMmBQMa1lkNCF3NhxvosAputjdor3NMzBW1xmBUgVqcPwoMLmdeKe31FZZFpHyUmlM5zxNnFewYf1u9nmBa22DZp8XRcMQSJ897DRU+PnTn5NlGNGqEgJJqorpxk6SjWVoayI1ptvhCB2rbJrE0GJQBioBWiQvxmSpDucJVO8lIEnf+Xdrn6cnSveRMe2lWdLBEHqQHgTpNkVBc5zlm/9CTVjT9x2rQ3shDKPKCoQxB/6GGYsJ6yz3xbozhPRBv9DHxTk0HfIt5vYK2Kc/geCWeLG298ZJxDsPLDPgrH55eyjwWQO6RaJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqMMkn1TNfd20ikNc9RR8SFwMaqxV+c4twLCO3zcb9g=;
 b=OyKc+67PAVFnAUklUWvFrbFTBwlZOKGY3rE7s2xYiFcgfLAgSzP5ZbXkI41rz5wKdUh06H0yxH7ugOwa98VYxP9aKvMHjivHfN4UgS6lqbB7tiyjE87exeyxgFnZDonZ69vTWsH7EUWKXNl3FvAIAGtV/26KQfg+k8XdcZw7KTUeLFAI7nRMIwx93xayNILeWI//+uLRpTnkQ8ahTo99SDGQ0fjfe4H/Z6XgxMi+Q9QWt5L3ICG9BTNfByNJVqhSTz0ecOapFJrtLQpsqoBRRL01Rm/AXXU0T2O1987FN/nqan0Iwf0fPC7jh8NUg8GXWjyXDfk/huN+YBdoactcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqMMkn1TNfd20ikNc9RR8SFwMaqxV+c4twLCO3zcb9g=;
 b=gTFxOYtMXq7Nz2V0Leeo10TzpCCjLnoOtZ9VtiBbei1WVSApiXn5/kgNyJKs/+03xVuvokNiEM9hMSX2vn7ZJIlxoTlg5xhbHpg5mLDTeF5OYG8GhK/kMefQ4jeu78UmTcJuA2GNAzzoT62pTb7duVkzCQC8lSGLDisNK6V+e/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 12:15:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 12:15:55 +0000
Message-ID: <7603cbad-2fed-47cc-91f1-81d6f529afb8@amd.com>
Date: Thu, 10 Apr 2025 14:15:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/nouveau: Remove surplus if-branch
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250410092418.135258-2-phasta@kernel.org>
 <20250410092418.135258-4-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250410092418.135258-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0258.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 382a1809-449c-4689-e2f4-08dd78297160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFVqcS9iR29oMXJBaFZkcXA3L0QzZWw1dkUzRmNhYjE5bDZRbDNLZWxCNkhl?=
 =?utf-8?B?cGJlcTg5THhBamY2bGxYWnhzOUlQaERkUFVKN3IzTmZ6T0FTbTBRZTBRc3M5?=
 =?utf-8?B?VnRScGZ3b2ZGemFka1hrMnptQWE2OHJFTjYvUWRuOXRJNjJNT2ttdjFaVGM0?=
 =?utf-8?B?NkFBUXViY1k1TDFySzRRbTNVdzVZR0hWc0JPQUJxM1AxWEhqaGV2eHUwT3l5?=
 =?utf-8?B?MUJLL0xsRWprWVBJTUNyY3Y1Y3ltRnhwc3Q3Y1J0UHJIUVNQSEpNb09DN1ZG?=
 =?utf-8?B?anZRK3kzS0l0b3dhdFhaL2xJVURCcmYrL3ZYbzZJQXR2L1ZSR2N4TXg3Q3pV?=
 =?utf-8?B?QnFrQ3FJWEpmRmc3WXI2TzIyNEpCR0xJS1lzYU9MZjJsREtWeFF2SVVZb1FN?=
 =?utf-8?B?UEpGNGFlWHlWb0tDOEpxU292Y29jRHlaLzBJK0xYNnU5Y2E0dkIyZUdHcDl0?=
 =?utf-8?B?WmFpcTdqSXZiR2FFa0hkaFI1ZG4vNmNUV1Vhb2NiNUJXSVZ3TDV6Qkkzc3lj?=
 =?utf-8?B?aW9VTG1qbVBEQXZ1NFhnYklYRTlTajMwVmxjVTIrN1dyK0dyNXRVc1BxamNM?=
 =?utf-8?B?Skx5a0cvNjFzNndOL1diMHFNZEptQVVxb0dMOWZHUmY2dFBTV2RxVmxqOEJ6?=
 =?utf-8?B?UVp1RXlsN0FpR1lxZWlxZ0VqY0xYbTRQUjcvSmRZV2hpQnJQM21yS2hOT1FD?=
 =?utf-8?B?dlE1MWdEQVp3d2ZJZWZkVmtXdzgxQW1nbVYwb053YlczN09UZEdkNFplTSsr?=
 =?utf-8?B?dmVqa3RKM0toR3ZiSEtOQTNzRHpPZVI1Skx6cFRyd0wzcnZWMURsVENhSktm?=
 =?utf-8?B?TUVBODlnNk9mUjQxcFI4Si84RERCSUhGU1EvdjdwL3VaK1d6eXNUOTNoMVg5?=
 =?utf-8?B?Umc4dENSUjIxMHRqNTJQVnZ1VEdyZHRLZmZ5RTB1N3d6cW44MXhnbFJRdGFU?=
 =?utf-8?B?QU1RbE10NXpEZEZsd2RmWHFzd1F2QnA0SG1JU0NxVEZicUIrUjBkSkZqWXVM?=
 =?utf-8?B?N1J6eXovTXRaeXpsemZFUWdiV2k2elIrbDlNVU1CVHVaSGpQYUN3QVBPVVp3?=
 =?utf-8?B?YVMvQXpHa0ppRjFUVUxLcnlLbGZsYUUwM0xUWkx1aitCOVF3dXJBUUhGdndi?=
 =?utf-8?B?T2IxZjFVY0NRWUxHQmdMRGhuY3dPMnBPcUpMZFNtOXlXV0gyQW15NkJ4RE8y?=
 =?utf-8?B?MjZDRHoxeVV3VUpheVJTRGZQRG9oWTk2aDJCS0xYM1lyMjFPRlh3d3BESTFx?=
 =?utf-8?B?WnVTZldUak5od3E2NldsS1hHQUx1UmdjNEgvM2xSeGlJMURQQmhrSHA3L2xx?=
 =?utf-8?B?VEhhMnJQN3N4c2l3QUphSVkrUTErbG5KQUhaTUxDYWZMYjdOS290dUNTdWxR?=
 =?utf-8?B?ZGphRWtocFdrdDBHN2hpRFYwcWk1YjdDUE1hT3VYaUhuQTZqaDYvSllucE5B?=
 =?utf-8?B?azVXUkZENG02Y2x6MENhZE13TVRlOTNabkcwNGxIcWszejZXRnVTU1BZS3o1?=
 =?utf-8?B?STI3VG9GZ3NXOVREMzJPWUNMYTdUdm9JTzJaMGJsRFRPYXlyWkFWMm5iM25B?=
 =?utf-8?B?eDA0UmJyaTdZQVdUaFBMSXhxNHlvV1A3aEZpdGJvK09IN1FKMjQ3c1huWXly?=
 =?utf-8?B?blY3Umc3Y3oxOG41akcvUjJ4SHB3dUFMQmN6NC9aZWEwSTRzc1lSYjB2TDkv?=
 =?utf-8?B?RUVXWDlLRGpTdkxxQWluSXdEeVBmQXVJZ09rSUxZMHRudldTbU84c00xUHpE?=
 =?utf-8?B?eXB6VFJBLzY3UTU1TXZ4b3dERXgvOXk5L1hFVC91M21tVWRRTEoxUCtjV1dQ?=
 =?utf-8?B?MXV0OU9EWW5lQUZSRWRvS2hOd0V1K0h4UkFMSEl2NlQvKzIzbXRlYmdkZThs?=
 =?utf-8?Q?UIgCuBYITm7UA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGlFWDJJbGYzVm96ZUh4cHN2UkJoSUZuVS9iRDh5RTVKZWduOVp4bGZNWGFx?=
 =?utf-8?B?c1ZxVzIyWFFxMVdyaHQxYUlSSUFQaFZWcDcrTy9WdENES0MweUtYUE9uaXlM?=
 =?utf-8?B?YXdMeHJQVmdIL0FSci9mYXIvMmpBb240TjJDOHJXMm1QaDAraVpRcmRVVHRV?=
 =?utf-8?B?d1I0cExUWXYrNWVTQWdYWGlBbHRsajJDT2Y1UWxmZ2ZZSkRVb1FCalVsUlU2?=
 =?utf-8?B?Wk5HT25MMFVod1V5dFBSdW5RZTZ2UzF1RC90bkoyNkthNFF6MkhGOWlCbmFx?=
 =?utf-8?B?ZHJISC9zNG12TDFQQ05RUEVpUVNmeDhjWmRHbHlXNEluSXFJSmxUTzYzMFBt?=
 =?utf-8?B?aXhBSCtyK1BlQ3Q5YkhzaFBvRWpPWWp4UnZibW10SmZ4VXR6dVZ6NHBOMnNq?=
 =?utf-8?B?OXE4dmhiMFVVSHJ0c3c0d1hsRGF3eUUvcVEyMVRDTDBlclhUVkk4OXpPa2Jl?=
 =?utf-8?B?ZnowOTVGRFk4dE1FL0VlR09sSUVuQmZNai8rRGtKTU1IMDdjZ1lQSjNGNTRU?=
 =?utf-8?B?Tm0wbnN3UlRvT1BwUzE0VVVGREw2SzVNLzFjeDM3ZkUzMUxJb0tqMkl2UTFG?=
 =?utf-8?B?aWNvcktwNXhTVkFnbDZLdWVobUFzcFpVcnppR3ZlWnBJYk9QMkZMNmlSMkdP?=
 =?utf-8?B?K0ZyaHNQQzlhQVU3NFhIbmExaWYxNHBFclFxVFBUOVBkRlZmbnBjWkpwTitm?=
 =?utf-8?B?cWpzQXBKWjkvRk5reDN4a3pFRW1adUdSa29YeEppSUI1bUR1bEV5bDdDQW0y?=
 =?utf-8?B?eTJHZzl4OHllV3ZIRk5oV1NlSHR1Z2xjOHYvSnlJUHpVajhPY0J0RUM0aEk3?=
 =?utf-8?B?d2tRZktWY3FEMGhGcEtSSnloa2Q2L0gwcEo0MXNVS09ISmFjaFAvUmNud0Qy?=
 =?utf-8?B?bS9XQUJYMmtqM3VVMVlKNUpDMDBNbGNNZzE0ZWpUTkV1R1RiRTRWQzZWWkxL?=
 =?utf-8?B?UG9NdUl4QXhpWGs5UFc3WFBheGtUaWFtS0VVZFkwV3ZRaC96TFZVamxnZDJY?=
 =?utf-8?B?NHgxODc0ZC9oTTRsUTVpYzcyU2hBNlJmV1dHTFVrYVJHQlVZMitOVUFPb3B5?=
 =?utf-8?B?U0JLdGhBZnhtYnExd25HbC9yc043ZlZ3NFJLMjliOXlPdVF1WG5LY01zQmFF?=
 =?utf-8?B?ZE1lUWNPbW1WR0RhcXQxcXNDUmhaWS9NRTVsYnRwZU83L0JJaGtFdmM4dHpK?=
 =?utf-8?B?dEcvaVVOMS8rSzVPWmxETml5MGxPSE5NS01vbTF4d3FQLzJCUktnQnVkR0tJ?=
 =?utf-8?B?aHd2Ty9ONEM0cEpGN2ZRUlRGblROV01hRWZpRGl4QndqOW9hdFdEVi9penI2?=
 =?utf-8?B?YnBkdXNQNGRzZzllZkxHNmk5eEJRSjB6NStxajJWdWJYMnBXUW8zM3oxclFU?=
 =?utf-8?B?bnloT0JhSFRtYjVtWDVPZXlOYzdxSXNlc2tkZ3lDdkV3L3RqODJrZE5McWhB?=
 =?utf-8?B?bWZNdWovMVRtL0FKTmU3RGlmYTlXUWh0VVJDS2trQmhwMVVQOXN6S2F0c0tC?=
 =?utf-8?B?MHJGSXZyZE1QeUZuVTRjMTRmdmJpOGw5MHVwMVRwWWVPUW5udHFQbU5lc0tU?=
 =?utf-8?B?eENVSm5Na29valJ0dHlRZHhpdFJKSjQyZlJNdHVTcjkvN1Fxd290QjFlT1VB?=
 =?utf-8?B?WEZvVmo4Zzc0bmQ1MDhqOWliZjRVRC9vZnFUTS9kUXhIcHh5NjhadEc2OFpy?=
 =?utf-8?B?S2lEK2V5bFc1cGpwMlNFUzJCeFBoMlp1QmRCQWxBelBNTjFIYVNXTnAvdHA4?=
 =?utf-8?B?dEpJc05HK1pGK21GUnh3TEo4eGplaFkwc2hwZUlBV2gyZHBMcXFISU15SWZU?=
 =?utf-8?B?RlBRY3V6UFptUXZQRm5qaEswT2tQcnhNYkhtWU95NVFVbHE4VWZDd2Y0SHNM?=
 =?utf-8?B?NmEwa3kzZTBPVlhReUZNWHZYVzgxNkIrdEZpQjZoMUwwa1VVZFJ4VERVNjk2?=
 =?utf-8?B?YnVpeCtJai9vL2RaY1JFS3U0SXBacStpK2N1cFk3M0tMUmFzak4vbkZWalo2?=
 =?utf-8?B?eU9YSE9VTHE3eERsVFZQMHp4bkx1YmF5eE92clYvWXRPb0FCdm1LQ2krSjk4?=
 =?utf-8?B?aVpab2YzcXdhNVA1L3VIK2xlSEtuRkwvclBKRDc3V1libk1BRUpvb3ZHa05Q?=
 =?utf-8?Q?nehGI4ECT7dlBazA/1FTZTzoH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382a1809-449c-4689-e2f4-08dd78297160
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:15:55.0533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llDT9IgFJMxjYHwge0tkJRznFoxdR7uu3F++joE9M7jwyyb/2gavtGOkgRNbbOsO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571

Am 10.04.25 um 11:24 schrieb Philipp Stanner:
> nouveau_fence_done() contains an if-branch which checks for the
> existence of either of two fence backend ops. Those two are the only
> backend ops existing in Nouveau, however; and at least one backend ops
> must be in use for the entire driver to be able to work. The if branch
> is, therefore, surplus.
>
> Remove the if-branch.

What happens here is that nouveau checks if the fence comes from itself or some external source.

So when you remove that check you potentially illegally uses nouveau_fctx() on a non-nouveau fence.

Regards,
Christian.

>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 33535987d8ed..db6f4494405c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -259,21 +259,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>  bool
>  nouveau_fence_done(struct nouveau_fence *fence)
>  {
> -	if (fence->base.ops == &nouveau_fence_ops_legacy ||
> -	    fence->base.ops == &nouveau_fence_ops_uevent) {
> -		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> -		struct nouveau_channel *chan;
> -		unsigned long flags;
> +	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> +	struct nouveau_channel *chan;
> +	unsigned long flags;
>  
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
> -			return true;
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
> +		return true;
> +
> +	spin_lock_irqsave(&fctx->lock, flags);
> +	chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> +	if (chan && nouveau_fence_update(chan, fctx))
> +		nvif_event_block(&fctx->event);
> +	spin_unlock_irqrestore(&fctx->lock, flags);
>  
> -		spin_lock_irqsave(&fctx->lock, flags);
> -		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> -		if (chan && nouveau_fence_update(chan, fctx))
> -			nvif_event_block(&fctx->event);
> -		spin_unlock_irqrestore(&fctx->lock, flags);
> -	}
>  	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags);
>  }
>  


