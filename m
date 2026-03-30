Return-Path: <linux-media+bounces-57671-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFlnCVm1ymmE/QUAu9opvQ
	(envelope-from <linux-media+bounces-57671-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:39:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE3135F5ED
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 19:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70A9C30209F1
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097003DCD92;
	Mon, 30 Mar 2026 17:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BV1IhFPw"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DC42C21E6;
	Mon, 30 Mar 2026 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892320; cv=fail; b=AxWlSguhrspJG4eHZ/epDbS1/J+4+RzyuqzxacSUYoJaVL5oVRsd5fMwewcTm1eVTOH9/i3a3rBVWXzbKFwDewxn1ugqWeT4bIFUuHKdwGSFRYtXtIjcuZ/fSRHfcFcktg+i926oUL2az74+VL5YHVxg/KRlD7hI7vM3JZCRT8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892320; c=relaxed/simple;
	bh=fj6K2UUXFRemfx3fO3QcKwp+tyKenUQNlCSx1QZXGFw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jgr/6CzhOzyY5Zr18DcZ4VZfj+7PmPRUgv1rVscAc/0nshNKj4BYZQbxtmhcFtBcDgeeI32SVdcK5SnH7OWfPG37EkoLb9sdEPrG5G30umTE6QU/W80qvigse0nH5aEdJsJAs6ilffI/p7jHVjc01HnocczbrNZwEZTSkc4guto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BV1IhFPw; arc=fail smtp.client-ip=52.101.53.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrsrOxqc0NmGueIAZSRmdfh7op/nN2D1J5OF+++cycmjSI9YDedvGdZQUzA5CcSvyrpor1bj4FF83T6v1pAjo9J4zKjDQXMQ13ak6XOEVi6px9e6SSWTnwgh+HPUtC2j4g2xIuS9jiJnoIGsdGn/Vv4mkjdwxemT1DlKGJ/L5XIegISw2j2D//tZpY/Orr0KHk4KHiB1TYj7syGPHPJ3MXx5vFkJGuaAxJmsKdMaNeCVGgUQqh7BHqUYHKo2I3djXp+3G8+8wxClihmoBezapntLEBWAXrkEXpwVlDMB73eUZ8MI/cTbqtYNH0H5+ZfILL2NAHosK2WFXHwpKwnukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kvybm4fNI1bNuhdSTNiiffgvzWLPk3Na4YKHH3Qfck=;
 b=KUsTUNQ8o8wAWCC9Ko0IR48I3TzMnTnTNxNYcrpUecifagPcnnobmrSfukXufykH/jx99Gv33mmsvs5Agwm+3kBJQoMD6GN/CDUhR4ofQIz+5ngz+X6RuhIVDufGwwUGDzRxR2MfUKtRIjRnEfcDOSw5VOP4RCd02yrNIhMUtTe3QqTb7sKDgf9vDtjLU3vrtuWQBc2mjVGWK9m0VA3H2e7BkdMkkXC9Nsc9R8lWXJV4AAthCRudIN67llLz5bfw1vVJx9vlTPXYMzPTpFj6Tag5zQjTVA+ha5eYshLlU6EV2lR6mpMrHiqrI7bYD3FKktNUCP9U32joh9+Dt6RVLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kvybm4fNI1bNuhdSTNiiffgvzWLPk3Na4YKHH3Qfck=;
 b=BV1IhFPwlUkiYC/XA+ONAFwNHig/iDmrnc2xeNb0UC2Cy8k96UiFg+TEM0thZv50bxwoFdC7rT+WkXvqmeRCwylOXdgCEeHFMzGpSJfGHLt12yiyvL/M+v4h3JBoL1IasbhHG0umA6y9dJ47dfFdMiDdaDpQ1Eg6ZNAsxpEnDv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 17:38:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 17:38:33 +0000
Message-ID: <5391e530-6ddc-4132-905c-c23ff0b277a0@amd.com>
Date: Mon, 30 Mar 2026 19:38:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] dma-fence: Dereference correct dma_fence in
 dma_fence_chain_find_seqno()
To: Li Ming <ming.li@zohomail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20260328-fix_dma_fence_chain_find_seqno-v1-1-3847c8ef0292@zohomail.com>
 <bb78ce6f-603a-40eb-ac47-bf5ea06a6cc8@zohomail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <bb78ce6f-603a-40eb-ac47-bf5ea06a6cc8@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:208:52f::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: af7f6641-ef5d-4794-02b5-08de8e832a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Mlk3DW5oxg1KxMddX+LJD3dFuIdYW/LKe6e/mQq80F3N0YafbzjLtTo81+NYpv+9WkIas0GogKK/ToZl5bvTwFPp+5GCgi475UGT9h1lKjUsK0TDMDerX95BuMCNGtWaIinLXMJPDhs+jXOKpJVb/wFXFYBxn7iqO8IUIHXg3OU5lkUimZ9MPlIwMrgYS84vMBW+cP+OBPEj/I7XQ2QTP5IvQx7DzyROjzjqk/tB9dAFLHktEogjiSiO4SeppH7VnMGoPbBSXL22Pu0q/Z00i0Tg9md/hnuSOX9h7fAD+exM8NDukODgDEqmAcgSeSO47zmT9Fu8vh/ZA75MlDvMfU0HcRrjOTZWreX3QF7BnBvOTaKHWtgorTRoHwukZDg2qoVz07+O8uwbo1MXc/Mvhzs1Mobh6KEtNV3TlCIoJo/0gEn4TQKZyHZEL7JTvTfnMx8wM4S8a8IPwDsDKqiA/dyClLtb49UFZQkw2K0iH7yno/KN1m4Jo5n1vpGC6QClo1ezhPnKD38m6Gzfp5FAsoe9ks0FuJ2vEMkz6x5KGxAb7DNNNUClY2NTuwB6JwJD2lZdRe5od3nh/Euk5USDUrJoUagLUArQv9+vBSZT1LLM9ZHFmgMiFm2Ma/u+z1bVeGEuZaPqA3gQhaKLOV85DPHD7Av3tYF47UKLeklUkXDXn4kNNXDxJBZgntdQHQFbiblMQmCA4ZE3xOaKqJc1xLRzUtCT6gliF3EHlS5LPP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3RrVHR2YU9kcHpOaHcwdHhWM1Y5VEdqc3ZRL0lIckhzQ3lGZGRCQVRkUy85?=
 =?utf-8?B?OCtxT2dBdkhlWDRxOE8zTStNWEd2VWt5QjdFV2VQa2JGMmpadkZKemo0RUx2?=
 =?utf-8?B?anRLU2p4bDZBaVpzeWFiN0RLK05VL0Q1TGUrQlRLUjhoNFQrZlVxOXJkSndF?=
 =?utf-8?B?RUJhVi83U3ZSdTBPNnRnWjRZSTNmeUpOTzcrd3J5Tll3OFpXYmQzU0pLRkhR?=
 =?utf-8?B?aFloVzFwbkZObXliWE44aGNkREtKd1lxTVp6b1V3OTJQS3pmeWhBRGZDOHIy?=
 =?utf-8?B?SktTbGVaL1ZUQ3RLT0JZWWROUUZOQXMzeCtiVXZRTUhvajRMQ1BiVFpBNUVK?=
 =?utf-8?B?dGFpaVJ2NjJjTldVYzBmcnhLQTdERjBPdEdXN2dLNndVRVpsaFIrV2ZWWUps?=
 =?utf-8?B?OFEzV0NwQ1FTeUhvc3A4RVFRUkh5aWtyRlJ0ZC9zU2ZtdGZVakg1a2lzcHRR?=
 =?utf-8?B?cTBlNU1pVnFNTUg5eUdLVUZIeS9Ec0Z3YzdXQ08xOEpzdVY5NFlmUCthWDJ4?=
 =?utf-8?B?U01USGEyMll5OEtjZ1RJWThKWmUxUXV3R1BPSldCKy9JaVZneWlOSXgyUWNr?=
 =?utf-8?B?VG5tMGRnZk1Ja3NOSFUzd1JGdXFnS0RJZUxYZTVuOFJOWU1PMGRJS2xVaHg5?=
 =?utf-8?B?VktrL1JYbUJsUm9VVHFKUHp3WDdNVXdmczhTZ2hMbS83d2NlRkhERjJjcllw?=
 =?utf-8?B?aGZKMFlSMU9qbVczbHZ6a2xLZ2xrMWRiMnNXblh2N0Z2dmZRVm9YYnJHelBy?=
 =?utf-8?B?YzlVZFZjMHVFbEZuNzVlMTd2TEdqa05mdEpQL2NBQzZqOVNkSXprZzE0WlJI?=
 =?utf-8?B?OUZDNVBWYzhDYU84bWpuVUlyc2VxVDVRRVdVOE5zd2JlYkd4RUFvSkFZTEs5?=
 =?utf-8?B?dzFIdkZMM09LY3J2U0xvZXQxU3NLeS9Fd0FHOXpkaWN6c05mWElYaUtTcGRN?=
 =?utf-8?B?cm1uTHlqR2tyS0ppZ21RdTdnUXhsTFZwT3BMUGwybkQ1NTB4UUNwSEgrNEY1?=
 =?utf-8?B?TzdRL2dJWitYSlYzZDdtQS9CeVpUdDgrS0FYcEw3VTB0dlhDdTZjMFkyNHl6?=
 =?utf-8?B?Z3g5Z3ZEcXlCSHZ1NmFHOW9Mc0pEOWQyNXpHbzEvNEg1dTJyVStFUmJEbHpx?=
 =?utf-8?B?ZTJvU2ZWbjU0eUk3ZEJkbGZmNHpFclVnakNjb0ZlMS9TTHMyNENGYTFNSVY4?=
 =?utf-8?B?TDFJQ1dxNVZnM1hrNEJSY01YelJlbWZsRlVxL0N5KzRGWVpiSU93dmdacjRV?=
 =?utf-8?B?ZlhvY2NlZHhtTVUraHdrWTBEOXFvTCtLU3hVdjZXYXVncmQ3VXZWQ05VUHcx?=
 =?utf-8?B?cmNSWHQ1Z0hBaWRlUWpRblNGcy8xSzZkMzczcGV1NC95UERrUHNSZHpoYVE2?=
 =?utf-8?B?NkVKS2MySDR3M2xRZUpObDVyY2pBcVM2c0thU2RkZ2tQUVBGQ1NpdjU3UWlo?=
 =?utf-8?B?VXhFZFE4dTdIYXZFa2Z6Rkxzc2R3THVvcFhGK3RYbkQ4SlJybHIzd0xIalo3?=
 =?utf-8?B?MjJiT2E5NDZLN0Z6eGZNd1N2cVRkZUs4ZGNkNFJqbFBJbUU2T25aNGlkNmI3?=
 =?utf-8?B?cUNyZzc5UHRxTlJ6OXd0Y3p0OVluTW1yQ0RyRVE5VzJhOVVwRTdZWjU3R0dx?=
 =?utf-8?B?MWRSMHdRZFZ6bHpldzhvV1ZRNFRBSWYzUzJOSnh2OVRFM0F1R0xCSDluRm9U?=
 =?utf-8?B?WTRlVksxcUZoRU5tK3BrQXp4Rzc4WHVzZm1ZMk1HbjcxZDc5L2gvR2FGQVFv?=
 =?utf-8?B?bXptckRHZjdLMU1uQUVLYkszRGZWb0tFR0pRNG1maVNhaDBiWjJybS9iZ0lY?=
 =?utf-8?B?Um93Y1FERXZJNHptUDE5NFJpOGxkaTJvV1psbFlZRTZNZHBCZmJCZHl4S01p?=
 =?utf-8?B?dnpwOVdLcWxhZEprTEk4ZXdmUkllQXh3R01hNEw4YmRyeHIyZkpPdXdSSW5N?=
 =?utf-8?B?dGI1TXdidEluQVpVN2NwSjJodEdCZGs2ZTUzSzNEdU5yK1N3YTFxMGZla1J1?=
 =?utf-8?B?dStRWGtIY05mNExHTDlmT09vMmdyempZRXVWVmtBQjB0TTkxaEhEUFg3MnNM?=
 =?utf-8?B?SUZmWVFUS2c3VmcvZUo3VlNYZkxlV1FZWmNjSExIUm1YQWF4TjlqV2ZRODcw?=
 =?utf-8?B?T1FjZ0RrSnRES1BYQzZXQUo1Qmt5SzFsaEg4R241NlVabHY2eWJ4RnNNa0lD?=
 =?utf-8?B?MlhKdUpXZHlObU5pN0M4U2NocWwzRmg4a01CVm9mOTRMNFFITG1iSldWdXAy?=
 =?utf-8?B?cy9McFBLREo5eSt4MW1RN2ZlODIxL2g5cWJkU1h0TURwKzJpRmZiMjhVZ0VC?=
 =?utf-8?Q?iH1jlESzHb7CAlEsrM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7f6641-ef5d-4794-02b5-08de8e832a6b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 17:38:33.8126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dQ9KTj01JlVchyeCKttMCTUJNheT2OHME2mSdeRmj9y9bg1i2uJvMghFHuSCJHI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57671-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,zohomail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9BE3135F5ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/28/26 11:26, Li Ming wrote:
> 
> 在 2026/3/28 02:47, Li Ming 写道:
>> dma_fence_chain_find_seqno() uses dma_fence_chain_for_each() to walk a
>> given dma_fence_chain. dma_fence_chain_for_each() always holds a
>> reference for the current fence during iteration. The reference must
>> be dropped after breaking out. Instead of dereferencing the last fence
>> as intended, dma_fence_chain_find_seqno() incorrectly dereferences the
>> first fence in the chain.
>>
>> Fixes: 7bf60c52e093 ("dma-buf: add new dma_fence_chain container v7")
>> Signed-off-by: Li Ming <ming.li@zohomail.com>
>> ---
>>   drivers/dma-buf/dma-fence-chain.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>> index a8a90acf4f34..71fa173aef13 100644
>> --- a/drivers/dma-buf/dma-fence-chain.c
>> +++ b/drivers/dma-buf/dma-fence-chain.c
>> @@ -103,7 +103,7 @@ int dma_fence_chain_find_seqno(struct dma_fence **pfence, uint64_t seqno)
>>               to_dma_fence_chain(*pfence)->prev_seqno < seqno)
>>               break;
>>       }
>> -    dma_fence_put(&chain->base);
>> +    dma_fence_put(*pfence);
>>         return 0;
>>   }
>>
>> ---
>> base-commit: c369299895a591d96745d6492d4888259b004a9e
>> change-id: 20260327-fix_dma_fence_chain_find_seqno-7adea64efe01
>>
>> Best regards,
> 
> After looking deeper into this issue, it is not a bug.
> 
> Seems like this function requires that caller needs to hold the reference of the give fence before calling it. When pfence changed, need to transfer the reference from the original fence to the new fence. That is why it releases the reference for the original fence in the end.

Yeah exactly that. We have documented the behavior in the kerneldoc:

 * Advance the fence pointer to the chain node which will signal this sequence
 * number.

But that is somehow not enough.

If you have suggestions how to improve the comments then please speak up. This patch has been suggested as "fix" numerous times.

Regards,
Christian.


> 
> Sorry to make this noise.
> 
> 
> Ming
> 


