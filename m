Return-Path: <linux-media+bounces-62417-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG/TAk/EDmqiCAYAu9opvQ
	(envelope-from <linux-media+bounces-62417-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:37:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EAC5A12A3
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 10:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F95530D1FA8
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 08:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39F035E953;
	Thu, 21 May 2026 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="K3EsxN+x"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B004C3546D1;
	Thu, 21 May 2026 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352301; cv=fail; b=qCSNaZXOAhgcV0adAwAbHKPALOo0ZK69PMuLfx0SLiLLHxbiIleC8F4WuZWko66ny2lL9rNH6QSpNWVSrumep7nZWb+zpgXY4ST7MszN7uBZYA4xkUHDRWY6CvOwQ2VOl/aWczLe8U4KjIsm9rFdVTljCUasnPnpDN4vggqD2Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352301; c=relaxed/simple;
	bh=Vnjnx41lS3Loq6ljZK7hfUtRmvGNNyn41xSOtkq6lGY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=smy5Zl1to0JhYrp6HItoJZFFEqmWG514q30EDg42Cz0vmOAB/rRfyneroD/b6y1TuhRcmCSrjXmZaT07hlW/uWuw0omlOUm1bsRu65hxCTqks+dz7yBZh5E9Aqqy9jqBYu1nsPcuALcG+m7QP8c7Veua4vm8EN4xE52auNru5J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=K3EsxN+x; arc=fail smtp.client-ip=40.93.195.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcIWD7tZKXy1BWcx/rtufbjhWgn1omRRjol9llzKAE3Poz3PPDFaHfUeRKRYUNmUwBKbzfVMEzYewLknsCSsHnFCwXhqUiUFXnf/04tdhqo8qKsXb2e4SPUPBeoomKvDuQ2bp/XL2nMW+JGc/yl+YPVEcVwlSCGwbrvlfKQYolQU2js3s26fPR6/NXcbCPI4NDB0FCdax/8tvjQ9meU24fTxETIqA+Yzlxt0sCh7gBE3G3Q4N/pvByv3v5Y9TwPVAAHY231yk0tlEmMtyr+Cik/qtSg+Xhh5cZHGBMOwTyWD9/76E2v8yJNaHo4cOHVjsY7CWWGzs677IiJ3NTr9ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG3K3kw4QnWqFoSztoUoN/Rir0Y60TyhhrQQ576I3YQ=;
 b=gLrFgxS9mmCx/rA+t6cofDv21iiNjRAEUtkHDlix1UROcesBTBzISXMtS60gR8jN5lBXmVhPmjRCYDbNoKRSiSaM2jYc54y0JeiK29N+QdzChp8uwXRnqJcwSC/9e9J8bgQTzPY6z2v+jl9W4QMOyYRYs30n3/zgW8EOC+QY1O8Rqu+hoqLNzhcnuvRqkr2USNsepwSWxq3vR+9Ab81oX84Gvjj79bfrjUfTjA2PBTCqCb0CJQTta1ebzRI/28+2ydPeKb+VgkQ3SkVluz1Wi7ONwabPym12Nx1qbadEA/bmYkLMUnkG87lx6HDCwbf4NuLKwoBbkn06dqnLscF05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG3K3kw4QnWqFoSztoUoN/Rir0Y60TyhhrQQ576I3YQ=;
 b=K3EsxN+xakhVLMVaFWMr6u1/K0KVo7LDTEdAQjxwG7OHuQPInhtP1KnhM/KmNzvuxPLy1SEl3gB7V7dKVIedYsLPkgYNZUL+QKD2EEtwCcCAfltzAYjuPzwJaegwI/yCr6qQwGeBjlMPNufrwhBvpHa73f+rOnS7A+rrtfSii/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 08:31:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0025.022; Thu, 21 May 2026
 08:31:35 +0000
Message-ID: <cbf4d01a-0103-4ac9-ae6a-754619ed5cb1@amd.com>
Date: Thu, 21 May 2026 10:31:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to
 drm_exec
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260429143743.50743-1-mikhail.v.gavrilov@gmail.com>
 <20260520151741.50575-1-mikhail.v.gavrilov@gmail.com>
 <20260520151741.50575-2-mikhail.v.gavrilov@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260520151741.50575-2-mikhail.v.gavrilov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:208:238::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ca99a4-39ad-453d-1b78-08deb7135e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Dmu2nqqUjX+rYlkLrrYTivfH+l1cja0p+Qj0d70i9upQZdPDxB5eISCjeth/ayJuFbgTlVgXRosj7CBqXEZ9twz/UDehz6BBEnxgpQluIYn1ILJ9YsgIRFMFM13cB3xjOUifP8HNTMcTc9nH1KOxX1177flFlhPzBgUvtAPWXkvLaE6JgqiLqv8AcOQGrDy8llYyoyi2htbMrP3ADXli8vCPaMbZcHrFKhLdkzGGoEmk60GlLK7PJyRqbJdZMfafESoI0kapY/rB0vsCW+LqftNLqau9tC4/lnlfiSs0UlrWyVXkaqpjfGpz75Ec5jopnT6/h+fr7ViYm+iNH/uHY6EejRLEN+bkWwrkVoo5DvkfbTDXXQX8l6K54XLty/iWBBnJgIy9zJAHTFtD+GALsksdrkbvWyndzXE2aIacU2JW7146eR5Q/2VW1n3zpV3ZAF9vdjV0e0gCQCIbOlQe6d1L+fZRP4s/1itB6JNW0/JD3WlEue9gtZFQmhA64pJtPf+z6WuWXcNlq/8RTgDhOX4ZYQSNJhkK/bc2k9HCh0PT6mI2TWMJT9jqhNys7XRY6m5bavH4SRprtRudgwYFLL7Yc2KfwXh/UWaWftcK+ki5eRI1tTGMcIDGbRLDMUh7t/qfmDbmd8bEHxhwbSbf9gmLUcXuGnDK4cSHcmafp1/bRgiYXHqAeSWJLnwb95P3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(4143699003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2phTW9wTzRNdUhsekRzak1mTUNUMG1FMkZtOFdjQTJqMUN1UnFIYkRFMFQ4?=
 =?utf-8?B?SUI0UlE1WEN6MUpzaWRjRzZwVFNvRFVaUHBXanhHL3Q5c3NPbUxhUXJKL21P?=
 =?utf-8?B?bHAyaFZvNmlnWVpHZW1JaDJBVlluL1BwZURBbE5MZ0l0UVZma2Y4VEFGUnpT?=
 =?utf-8?B?dVpBclAyMmVnNllKSDZBMHhzYlVsSnRockt6UjNWNVZ5dnVzNCt2U0hSWk1o?=
 =?utf-8?B?MXFMRWErbXFhMEVwTzhBaTdiUlVyV2hDbithOUVTbjAzL0hTQUc1bmlkb3Vs?=
 =?utf-8?B?RHJuaW1XOHpQZDdqejY4S0trdGRmakZlQ3NLUlFVemlNelk2bTRuVVBHZFIr?=
 =?utf-8?B?SzhYVzBObjROT3dvc2VwbzJEN29nVnhaeHNCeXMzME91b0thUFdzSTByUzcy?=
 =?utf-8?B?eXVNcVFFMGt6YnlQSVlFek12bW5JNnRPS2ZCQ2N2MWZVOG9zMVgzam9mMmEr?=
 =?utf-8?B?RVFnYk5FY1BkT0I0V2JWSUhPUUdqRGwyYVJQbjVlY0dRemlFRlJYS2ZOQlZq?=
 =?utf-8?B?aUpNU2FScTNrYmpMaHZ6V0g2bTdvWVU5TGNxUDRrdDR6am1xUThZdm1lVUlq?=
 =?utf-8?B?cEMzZHBkT3VOaHgwbmFBRk1ldHd3dWpCdWF1UDdhNUlqaTVTdXVENVVKWGNY?=
 =?utf-8?B?ei8rRmlJSE1VSDRDL0VISnNGZGVxaTNGSWZnbm9xSGwzeE8yblNycGhBWTR1?=
 =?utf-8?B?NUdHVGJ0TDVmdUdzWWU3cTgvTndGRlkvMmpzK3pwQ3FRZml2eFRiclFVVkYv?=
 =?utf-8?B?RDlHODc4anpOdldXVS8zVTVUd2F1Z0F3aVJzMERFMVI2U0NiUWVhaUV0UTVW?=
 =?utf-8?B?QnpobDJRNnlLMGU1YXdrb0VjV0lWM2s4QU1xb0crVW9uekRmaHBvTDBpaEJa?=
 =?utf-8?B?YVZnMDUzZ3JpYS9ESHdDN1AzSE44bDFRcnVWcm1VY3B1dWVXRFNDVFhJZlVH?=
 =?utf-8?B?aGk0bEJlZ2hBNGNtM3hkYVZkZ3ovVEplRVhvRTgwNlJwNjlza1lzTE1yRjhy?=
 =?utf-8?B?VUtnUEJ5MVF5RnpnYkgzZC82WEpOTGpJMm9lQUpBMFl1aVk3S3dibllsOVRa?=
 =?utf-8?B?ZXZpUm43RlRrZHRxL1IwMFJiR3BOaEVMUTRxcU5XWmZSZ25BMW8wL3lBbEMw?=
 =?utf-8?B?Um1yNjN6RVVSMG9ud1czOWFTeThOcitRUWxpb3lyZTFNQy9NYzlwaUdYbjNi?=
 =?utf-8?B?RlBCWDM5ZW5CdlUrR1hrVk14dEhkOGs0VStNSk0zT0xLQ0dMMVNBYXlDQmZT?=
 =?utf-8?B?V1Vwcm5mU1R2VjNMM2dmWWF3ejI4eDgwSFNWV1R6a2hsWWpEeG5pZXdmb0Q5?=
 =?utf-8?B?TGlpVHVJZmI5YXNnck9MZFJBRHF2TWxvemJGZGJZK0JtT0ZocjlUaFpmZU15?=
 =?utf-8?B?OVFGelQ1MHpTbjZReXR0Q3R2TG5VL1RteUluOWl4OWk3bGs3WnVCRnRMYUpF?=
 =?utf-8?B?c3k2LzM2eUJucVdjT04yUWw1MERWeHJmWGlqOU83aWl4UlNISjh6U2w0a0ph?=
 =?utf-8?B?L004NkN3bDNpNUxKU1VpeHRNRFg2Qlo0SjhVOExIZHlrSmtTMllhbkIraHUx?=
 =?utf-8?B?WXJOc0ptY3BWRHByRGZGQWE5S2dKdVRVZURodWxxWlhQT2U3TFA1bHRrRlNW?=
 =?utf-8?B?NVA0QnUvTGt4R0hsK0d2c2d4NjUwb0lZQ2NUazlndC8rNm1jcmlKSmtzbTJi?=
 =?utf-8?B?VDF2WGE3eTVlYzhpTm1xWUllM0dDV0FkVS92OTdwM1M0K1IrMDAwWi9QVmV3?=
 =?utf-8?B?U1E5NTlsUkg0N3lIQXBBYkljUGMwajZxTHlqZGdxcUFFS1pMdUR2MGJldWI3?=
 =?utf-8?B?RnNaMDZ1ZXA5TGFQSk11cmJEK1ZTNzEvUEo1aVdlekJ6dzBmaVlmMWN4akN4?=
 =?utf-8?B?YXBQSkJXYlAwaSszeitZajVlRTdrbWRqc2tpblZ2Vmk0SHN1UnFtZFFCYk5z?=
 =?utf-8?B?MnpIVjFscmMxUzJ1a1lrcGtOcDVyYms1bFpTSWdyYVZRaHZkZzBHeUxod3FV?=
 =?utf-8?B?Um01T1ZTSW9VM3A4dXFhNTl1ZmVNa3VKNktwK0lRTTBMbzNBSThJWVZhc2JR?=
 =?utf-8?B?MlZOZFJVT21ES2FxdTl4VkUwNzQ0RVhmcTR1VDF5bFN2eUNSeUVydlBMbGNl?=
 =?utf-8?B?OVZpNFNUb2RiOURvejNadWoyQW1EVHV4TVpneVc1RU5meDhhUEhrRkVrZHZO?=
 =?utf-8?B?VE5NVXQ5T3ZMazkzU1ZkL0ZkU3pmUGY1dG1pWU91dERLU2x6bnZWTkpMSklo?=
 =?utf-8?B?bWplRlhFbUV4SlV0b0lSYkZCZzRWWWtFQmJqOGllNkRndmFaSUdWaXdGWXA0?=
 =?utf-8?Q?kvq+EMt9FhNjqzltup?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ca99a4-39ad-453d-1b78-08deb7135e93
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 08:31:35.4183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnvyqAOaEUtkPLo7e2Y98F+bX7JR/9QPUbflA1cge/OV+L7Osts5xgOOAzpjVnxG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62417-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org,vger.kernel.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 69EAC5A12A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 17:17, Mikhail Gavrilov wrote:
> amdgpu_vm_lock_by_pasid() looks up a VM by PASID and reserves its root
> PD with a bare amdgpu_bo_reserve(), returning the still-reserved root to
> the caller. A caller that then needs to reserve further BOs (for example
> the devcoredump IB dump) ends up nesting reservation_ww_class_mutex
> acquires without a ww_acquire_ctx, which lockdep flags as recursive
> locking.
> 
> Convert the helper to take a drm_exec context and lock the root PD via
> amdgpu_vm_lock_pd() instead. Callers now run it inside a
> drm_exec_until_all_locked() loop and can lock additional BOs in the same
> ww ticket, so there is no nested ww_mutex acquire.
> 
> The only existing caller, amdgpu_vm_handle_fault(), is updated
> accordingly. Its is_compute_context path, which previously dropped the
> root reservation around svm_range_restore_pages() and re-took it, now
> finalises the drm_exec context and re-initialises a fresh one; behaviour
> is otherwise unchanged.
> 
> No functional change intended for the page-fault path.
> 
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 72 ++++++++++++++++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h |  3 +-
>  2 files changed, 51 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 9ba9de16a27a..3a22670b733f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2950,14 +2950,22 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>  }
>  
>  /**
> - * amdgpu_vm_lock_by_pasid - return an amdgpu_vm and its root bo from a pasid, if possible.
> + * amdgpu_vm_lock_by_pasid - look up a VM by PASID and lock its root PD
>   * @adev: amdgpu device pointer
> - * @root: root BO of the VM
> + * @root: out: reference to the VM's root BO, dropped by the caller
>   * @pasid: PASID of the VM
> - * The caller needs to unreserve and unref the root bo on success.
> + * @exec: drm_exec context to lock the root PD in
> + *
> + * Must be called from within a drm_exec_until_all_locked() loop; the caller
> + * runs drm_exec_retry_on_contention() afterwards and drops the *root
> + * reference once the drm_exec context is finalised.
> + *
> + * Return: the VM on success, or NULL if the PASID has no VM, the VM is being
> + * torn down, or locking the root PD failed.
>   */
>  struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
> -					  struct amdgpu_bo **root, u32 pasid)
> +					  struct amdgpu_bo **root, u32 pasid,

I think we can drop the root parameter now, the exec reference should be sufficient.

> +					  struct drm_exec *exec)
>  {
>  	unsigned long irqflags;
>  	struct amdgpu_vm *vm;
> @@ -2971,9 +2979,11 @@ struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
>  	if (!*root)
>  		return NULL;
>  
> -	r = amdgpu_bo_reserve(*root, true);
> -	if (r)
> -		goto error_unref;
> +	r = amdgpu_vm_lock_pd(vm, exec, 0);

amdgpu_vm_lock_pd() can't be used here since we can't gurantee that the VM pointer wouldn't go away.

Just do:

r = drm_exec_lock_obj(exec, root->tbo.base);

> +	if (r) {
> +		amdgpu_bo_unref(root);
> +		return NULL;
> +	}
>  
>  	/* Double check that the VM still exists */
>  	xa_lock_irqsave(&adev->vm_manager.pasids, irqflags);
> @@ -2981,16 +2991,12 @@ struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
>  	if (vm && vm->root.bo != *root)
>  		vm = NULL;
>  	xa_unlock_irqrestore(&adev->vm_manager.pasids, irqflags);
> -	if (!vm)
> -		goto error_unlock;
> +	if (!vm) {

We should cleanup with drm_exec_unlock_obj() here, same as it was before.

> +		amdgpu_bo_unref(root);
> +		return NULL;
> +	}
>  
>  	return vm;

We can drop the extra reference on the root BO before returning the VM now since the drm_exec object holds one as well.

Apart from that this looks like a really nice cleanup to me.

Thanks,
Christian.

> -error_unlock:
> -	amdgpu_bo_unreserve(*root);
> -
> -error_unref:
> -	amdgpu_bo_unref(root);
> -	return NULL;
>  }
>  
>  /**
> @@ -3013,20 +3019,32 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>  {
>  	bool is_compute_context = false;
>  	struct amdgpu_bo *root;
> +	struct drm_exec exec;
>  	uint64_t value, flags;
>  	struct amdgpu_vm *vm;
>  	int r;
>  
> -	vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
> -	if (!vm)
> +	drm_exec_init(&exec, 0, 0);
> +	drm_exec_until_all_locked(&exec) {
> +		vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		if (!vm)
> +			break;
> +	}
> +	if (!vm) {
> +		drm_exec_fini(&exec);
>  		return false;
> +	}
>  
>  	is_compute_context = vm->is_compute_context;
>  
>  	if (is_compute_context) {
> -		/* Unreserve root since svm_range_restore_pages might try to reserve it. */
> -		/* TODO: rework svm_range_restore_pages so that this isn't necessary. */
> -		amdgpu_bo_unreserve(root);
> +		/* Release the root PD lock since svm_range_restore_pages
> +		 * might try to take it.
> +		 * TODO: rework svm_range_restore_pages so that this isn't
> +		 * necessary.
> +		 */
> +		drm_exec_fini(&exec);
>  
>  		if (!svm_range_restore_pages(adev, pasid, vmid,
>  					     node_id, addr >> PAGE_SHIFT, ts, write_fault)) {
> @@ -3036,9 +3054,17 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>  		amdgpu_bo_unref(&root);
>  
>  		/* Re-acquire the VM lock, could be that the VM was freed in between. */
> -		vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid);
> -		if (!vm)
> +		drm_exec_init(&exec, 0, 0);
> +		drm_exec_until_all_locked(&exec) {
> +			vm = amdgpu_vm_lock_by_pasid(adev, &root, pasid, &exec);
> +			drm_exec_retry_on_contention(&exec);
> +			if (!vm)
> +				break;
> +		}
> +		if (!vm) {
> +			drm_exec_fini(&exec);
>  			return false;
> +		}
>  	}
>  
>  	addr /= AMDGPU_GPU_PAGE_SIZE;
> @@ -3076,7 +3102,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>  	r = amdgpu_vm_update_pdes(adev, vm, true);
>  
>  error_unlock:
> -	amdgpu_bo_unreserve(root);
> +	drm_exec_fini(&exec);
>  	if (r < 0)
>  		dev_err(adev->dev, "Can't handle page fault (%d)\n", r);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index d083d7aab75c..af292c2fc521 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -593,7 +593,8 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>  			    bool write_fault);
>  
>  struct amdgpu_vm *amdgpu_vm_lock_by_pasid(struct amdgpu_device *adev,
> -					  struct amdgpu_bo **root, u32 pasid);
> +					  struct amdgpu_bo **root, u32 pasid,
> +					  struct drm_exec *exec);
>  
>  void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
>  


