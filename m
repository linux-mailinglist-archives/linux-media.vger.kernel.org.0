Return-Path: <linux-media+bounces-47357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEC7C6D6BF
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 09:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 3A9972D5DB
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 08:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C98328B58;
	Wed, 19 Nov 2025 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b="kPYfLD5j";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="KycOX4jZ"
X-Original-To: linux-media@vger.kernel.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9ED313289;
	Wed, 19 Nov 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.152.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763540999; cv=none; b=Wg3uHopmJWRhifLhApwc4KS842cFDnpSP5YfJ1K30nTYz/18gW5+/Mu5qCrPDu+1dGAiDXRspjeiTvvm04p+HbiiwJW/GMT1RkZ/l0qqfCM91CHw9WgqRYBxWfLP4q57s7W7GZ6mZdOl0seJrVfOKippmLhRWO7QvDIkB4M/UPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763540999; c=relaxed/simple;
	bh=CB9yYwteUoPXL8rJbrdAqX1qN8YxeJaV5AjP1cYuB+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JA3ap63IgpLmStLuSG+LEzAaXXadl/8s0SoQxARbjgDw74aE9sCSPzNNvt9VLlsL5CeaSb93px8UoW+1QZKBoRIxmkD2j+6zmRCAxqjaht66Qik9tLr0wkw+QrZDseAR8apJZMcMOlx4ZBuhcxLNY1cPJ8EWG27ltPmL95IKtLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net; spf=pass smtp.mailfrom=damsy.net; dkim=pass (2048-bit key) header.d=damsy.net header.i=@damsy.net header.b=kPYfLD5j; dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b=KycOX4jZ; arc=none smtp.client-ip=51.159.152.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=damsy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=damsy.net
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1763540935; bh=UuVoHiX4g1DcUjyvKAoxU8D
	BSFgJKZF+njAyH5dFFYc=; b=kPYfLD5jrPQ5qPDQwRfqKDwGwsFo33eoPCQbC4OBc4kDSS47w/
	WjSQBOOr+QABNlYpqjNh46rwf3XfVCxHdu4QJrFZLAfSyEUAFjEE2X4UNsVkevr8aCJmfnmaO+E
	ZUNmfKsHxi5rxhPFn1kZvbtq6Zr/O1Mt9I1VZAF/VIiKsc/b6+V9KW1efR3dL9fE/WDmLX6X5WO
	iP6pebym4YKxV4Ma0CInXxI+eeIL/NSVwA+gUWYrrRcLfd45fySBu86PynZV1+LZCMEjyIl8RsE
	FAnM9gOuboUQdUYQJVeYZk5LSDvtVyRqgrXwKH20X2sEqIQ4nx309dnCcTmGCRyLOSg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1763540935; bh=UuVoHiX4g1DcUjyvKAoxU8D
	BSFgJKZF+njAyH5dFFYc=; b=KycOX4jZWE/T7hQo+sFKk3hoGSjmtQo3+lW9S0zV/N5jk7FyLd
	T++LSUgYSRUta3m5zPJL3FBQ85vSpBGLdSDw==;
Message-ID: <918608aa-0383-46fe-9130-8c9cd3f57aae@damsy.net>
Date: Wed, 19 Nov 2025 09:28:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/20] drm/admgpu: handle resv dependencies in
 amdgpu_ttm_map_buffer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-11-pierre-eric.pelloux-prayer@amd.com>
 <ebb52a9a-9454-471b-8262-098231b58777@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <ebb52a9a-9454-471b-8262-098231b58777@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 17/11/2025 à 09:44, Christian König a écrit :
> On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
>> If a resv object is passed, its fences are treated as a dependency
>> for the amdgpu_ttm_map_buffer operation.
>>
>> This will be used by amdgpu_bo_release_notify through
>> amdgpu_fill_buffer.
> 
> Why should updating the GART window depend on fences in a resv object?
> 

You're right, this is not needed. I'll drop the patch.

Pierre-Eric

> Regards,
> Christian.
> 
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 +++++++++++-----
>>   1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index b13f0993dbf1..411997db70eb 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -184,7 +184,8 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
>>   				 struct amdgpu_res_cursor *mm_cur,
>>   				 unsigned int window, struct amdgpu_ring *ring,
>>   				 bool tmz, uint64_t *size, uint64_t *addr,
>> -				 struct dma_fence *dep)
>> +				 struct dma_fence *dep,
>> +				 struct dma_resv *resv)
>>   {
>>   	struct amdgpu_device *adev = ring->adev;
>>   	unsigned int offset, num_pages, num_dw, num_bytes;
>> @@ -239,6 +240,10 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
>>   	if (dep)
>>   		drm_sched_job_add_dependency(&job->base, dma_fence_get(dep));
>>   
>> +	if (resv)
>> +		drm_sched_job_add_resv_dependencies(&job->base, resv,
>> +						    DMA_RESV_USAGE_BOOKKEEP);
>> +
>>   	src_addr = num_dw * 4;
>>   	src_addr += job->ibs[0].gpu_addr;
>>   
>> @@ -332,14 +337,14 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>   		r = amdgpu_ttm_map_buffer(&entity->base,
>>   					  src->bo, src->mem, &src_mm,
>>   					  entity->gart_window_id0, ring, tmz, &cur_size, &from,
>> -					  NULL);
>> +					  NULL, NULL);
>>   		if (r)
>>   			goto error;
>>   
>>   		r = amdgpu_ttm_map_buffer(&entity->base,
>>   					  dst->bo, dst->mem, &dst_mm,
>>   					  entity->gart_window_id1, ring, tmz, &cur_size, &to,
>> -					  NULL);
>> +					  NULL, NULL);
>>   		if (r)
>>   			goto error;
>>   
>> @@ -2451,7 +2456,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>   		r = amdgpu_ttm_map_buffer(&entity->base,
>>   					  &bo->tbo, bo->tbo.resource, &cursor,
>>   					  entity->gart_window_id1, ring, false, &size, &addr,
>> -					  NULL);
>> +					  NULL, NULL);
>>   		if (r)
>>   			goto err;
>>   
>> @@ -2506,7 +2511,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>>   					  &bo->tbo, bo->tbo.resource, &dst,
>>   					  entity->gart_window_id1, ring, false,
>>   					  &cur_size, &to,
>> -					  dependency);
>> +					  dependency,
>> +					  resv);
>>   		if (r)
>>   			goto error;
>>   


