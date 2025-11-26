Return-Path: <linux-media+bounces-47774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42138C8B287
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 18:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B0014E27C0
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 17:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26D8267714;
	Wed, 26 Nov 2025 17:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fp2hNaKZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6614533E354;
	Wed, 26 Nov 2025 17:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764177302; cv=none; b=kuwAxUGWQtwsfukczevd1xvcTbE6aUrAd8Fns6OwUior64NgHalo0UWKY+JYF31RyqS9r47O7DKq5bdZheYe1lKxv9oRM8ocyYHEHk4aAO5yrGIprN1F0bh7JSW/ameYS/zjCkDXwbzfwbenAsKLoQVPvO7o2sBYuPrP3VZ8Kfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764177302; c=relaxed/simple;
	bh=XpXTi22h1lQyNqutX7n5OVEjFZ0vyoINVMrIpbkzf1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cadDEY9NF1kUV8dcOU7gpY5C2OUplaFDXAk7etK9pckWLe2TYTcEXY3C+L4Rf8DU0TO9W2FNrIVPaPyhp2/WSVYgMpPQDPpNY+t2ESb1KXryp8GBZTswWLRs76eGx1VgaCHluaI9mHCX9g8zrQmPw2hphwODSAqiejyeINawz5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fp2hNaKZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764177301; x=1795713301;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XpXTi22h1lQyNqutX7n5OVEjFZ0vyoINVMrIpbkzf1Y=;
  b=Fp2hNaKZuttZYfgtk60oEKnpjVJuQf/kKRmxAn8LZEBHfzD0Syhyj9zy
   EX2R5SqCd8Nnj9dkckwEC5aGJJsNx2u6/Z3A3vYul8FeMk0asrtD+O0s8
   GrkZqQTIflexGtTG8QEgdER09qUZSBX2jraKV+0QQgDxH+LxqspQhGnsb
   J9kForrW1JQbT1IDq5Ui4GlB1UrkRG7CF5cflT9b9oX/vdpXZ5Ht6lH5b
   pNreR5VzdOYNwDx0eBZN4wNE8nAF1BCqcyIjwMCZm6UsgcULJH83T5wRb
   1ZBuYNNj2+UuC9QeJ9SP7suck9WfneDtU6P8ZKv2VPrqg27y4KctT/4wy
   A==;
X-CSE-ConnectionGUID: bPRCTBvbTvmGGT4/aOOtCA==
X-CSE-MsgGUID: lGdEqQzMTZOZxp2WkuNEyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66254356"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66254356"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:15:01 -0800
X-CSE-ConnectionGUID: T/rFJVtsTEW6SEEyte7elA==
X-CSE-MsgGUID: j5+qzM/uRhKhpwTkPVow6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193007523"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.194]) ([10.245.245.194])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 09:14:57 -0800
Message-ID: <702ac955-32ad-4f24-88cd-c98f9d2f2552@linux.intel.com>
Date: Wed, 26 Nov 2025 18:14:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/28] drm/ttm: rework pipelined eviction fence
 handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-20-pierre-eric.pelloux-prayer@amd.com>
 <414584f0-3fdb-41e2-aa26-3776dc514184@amd.com>
 <7346d42b-3ad7-4170-900f-73d8ed356f71@linux.intel.com>
 <cc43a512-b979-4c11-a413-ab5108dab466@amd.com>
 <847eb5a7-7464-40f2-81ea-7bf2ff009a31@linux.intel.com>
 <b12b952b-1e32-439f-8d96-78e449cbbde7@amd.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <b12b952b-1e32-439f-8d96-78e449cbbde7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey,

Den 2025-11-26 kl. 16:48, skrev Christian König:
> On 11/26/25 16:39, Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2025-11-26 kl. 16:36, skrev Christian König:
>>> On 11/26/25 16:34, Maarten Lankhorst wrote:
>>>> Hey,
>>>>
>>>> Den 2025-11-21 kl. 16:12, skrev Christian König:
>>>>> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>>>>>> Until now ttm stored a single pipelined eviction fence which means
>>>>>> drivers had to use a single entity for these evictions.
>>>>>>
>>>>>> To lift this requirement, this commit allows up to 8 entities to
>>>>>> be used.
>>>>>>
>>>>>> Ideally a dma_resv object would have been used as a container of
>>>>>> the eviction fences, but the locking rules makes it complex.
>>>>>> dma_resv all have the same ww_class, which means "Attempting to
>>>>>> lock more mutexes after ww_acquire_done." is an error.
>>>>>>
>>>>>> One alternative considered was to introduced a 2nd ww_class for
>>>>>> specific resv to hold a single "transient" lock (= the resv lock
>>>>>> would only be held for a short period, without taking any other
>>>>>> locks).
>>>>>>
>>>>>> The other option, is to statically reserve a fence array, and
>>>>>> extend the existing code to deal with N fences, instead of 1.
>>>>>>
>>>>>> The driver is still responsible to reserve the correct number
>>>>>> of fence slots.
>>>>>>
>>>>>> ---
>>>>>> v2:
>>>>>> - simplified code
>>>>>> - dropped n_fences
>>>>>> - name changes
>>>>>> v3: use ttm_resource_manager_cleanup
>>>>>> ---
>>>>>>
>>>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>>>
>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>>
>>>>> Going to push separately to drm-misc-next on Monday.
>>>>>
>>>> Pushing this broke drm-tip, the amd driver fails to build, as it's not using the eviction_fences array.
>>>
>>> Thanks for the note! But hui? We changed amdgpu to not touch the move fence.
>>>
>>> Give me a second.commit 13bec21f5f4cdabdf06725e5a8dee0b9b56ff671 (HEAD -> drm-tip, drm-tip/drm-tip, drm-tip/HEAD)
>>
>> Author: Christian König <christian.koenig@amd.com>
>> Date:   Wed Nov 26 13:13:03 2025 +0100
>>
>>     drm-tip: 2025y-11m-26d-12h-12m-41s UTC integration manifest
>>
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2188:34: error: ‘struct ttm_resource_manager’ has no member named ‘move’
>>  2188 |                 dma_fence_put(man->move);
>>       |                                  ^~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2189:20: error: ‘struct ttm_resource_manager’ has no member named ‘move’
>>  2189 |                 man->move = NULL;
>>       |                    ^~
>>
>> Is what I see.
> 
> Ah, crap, I know what's going on.
> 
> The patch to remove those lines is queued up to go upstream through amd-staging-drm-next instead of drm-misc-next.
> 
> I will push this patch to drm-misc-next and sync up with Alex that it shouldn't go upstream through amd-staging-drm-next.
> 
> Going to build test drm-tip the next time.
Thank you, drm-tip now builds cleanly again!

> 
> Thanks,
> Christian.
> 
> 

Kind regards,
~Maarten Lankhorst

