Return-Path: <linux-media+bounces-47767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC54C8AB34
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 16:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DABE4E04B3
	for <lists+linux-media@lfdr.de>; Wed, 26 Nov 2025 15:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA02C33A003;
	Wed, 26 Nov 2025 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDWiD84L"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CF63346A8;
	Wed, 26 Nov 2025 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171609; cv=none; b=NSuHvtFagqTqGkdoiUDlBLUYt9lJ1UTScbzUEcOwslRhHXsx2TXscAa2CdtoDiMtnkJB2mM+nKJyiUKoUc0ZtBKeGjChPti14gSK3ZJRDjiWi/9Z7poXAPd/yP6SzY0U5TWsjYG5x3N15NeMW93GYZe8qiw/byxeT4yw9LdtY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171609; c=relaxed/simple;
	bh=eiOyf4PPCC5BPzh21IyIWJ2IEXjl5NsUns4X8e/v5V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUGxwnckov00n1CqsbyyDtmdKPrNQd+W+0lxcabIShi+AfuZnAOvO7s6hT1RiZaeqmxTM566uumKQwrdU/829wUthk453TZ2bVo7LlTCbh5rLNVpRh03+MZO0xgAceyHoE5E6gDihSRlHgCH4tMb0a1aN1iC6g79vqtREhW/nIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDWiD84L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764171606; x=1795707606;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eiOyf4PPCC5BPzh21IyIWJ2IEXjl5NsUns4X8e/v5V0=;
  b=UDWiD84Lhd3D9ekoNRigngdDtl4mGmr7DeEW3xh0t+mIjRYi6k1VMUr3
   AHdYcLvY0KK7f7PAcq0NjzJsu0GLhQNCXq6EhkgKzVhIfFjpdk6M/+zjw
   PNNBNZNAWytATZkSUIC4rShP2phf5Vt0wrojmr28GAV2p1GkJLaxg6Wuw
   AMTP/piTEnzNzOCUSqsHEt5WpMWSDqDsADaWgriCkCOgJcvOIfKUzvHCY
   mV+6fnVxwhXCxtmf+bPgErIOfKysQCd96/TNzUmtpzV1qApFJl5RnDBeZ
   UezDZDc4MaaQfjUC/F3m1wlfsdJemLOZ7XzlcWI0Qtpvu3fbxkW3YPgCu
   A==;
X-CSE-ConnectionGUID: N4fdxY1lQvyzazuq8FQpRg==
X-CSE-MsgGUID: 3OeUPi94Rxu0vJIF8Tg9UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76840486"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="76840486"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:40:05 -0800
X-CSE-ConnectionGUID: KGSGpFdFQomTJy7tMtg9oA==
X-CSE-MsgGUID: QYRJHGmORaC+kHZXBk8FHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="193065802"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.178]) ([10.245.245.178])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:40:02 -0800
Message-ID: <847eb5a7-7464-40f2-81ea-7bf2ff009a31@linux.intel.com>
Date: Wed, 26 Nov 2025 16:39:59 +0100
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
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <cc43a512-b979-4c11-a413-ab5108dab466@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey,

Den 2025-11-26 kl. 16:36, skrev Christian König:
> On 11/26/25 16:34, Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2025-11-21 kl. 16:12, skrev Christian König:
>>> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>>>> Until now ttm stored a single pipelined eviction fence which means
>>>> drivers had to use a single entity for these evictions.
>>>>
>>>> To lift this requirement, this commit allows up to 8 entities to
>>>> be used.
>>>>
>>>> Ideally a dma_resv object would have been used as a container of
>>>> the eviction fences, but the locking rules makes it complex.
>>>> dma_resv all have the same ww_class, which means "Attempting to
>>>> lock more mutexes after ww_acquire_done." is an error.
>>>>
>>>> One alternative considered was to introduced a 2nd ww_class for
>>>> specific resv to hold a single "transient" lock (= the resv lock
>>>> would only be held for a short period, without taking any other
>>>> locks).
>>>>
>>>> The other option, is to statically reserve a fence array, and
>>>> extend the existing code to deal with N fences, instead of 1.
>>>>
>>>> The driver is still responsible to reserve the correct number
>>>> of fence slots.
>>>>
>>>> ---
>>>> v2:
>>>> - simplified code
>>>> - dropped n_fences
>>>> - name changes
>>>> v3: use ttm_resource_manager_cleanup
>>>> ---
>>>>
>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> Going to push separately to drm-misc-next on Monday.
>>>
>> Pushing this broke drm-tip, the amd driver fails to build, as it's not using the eviction_fences array.
> 
> Thanks for the note! But hui? We changed amdgpu to not touch the move fence.
> 
> Give me a second.commit 13bec21f5f4cdabdf06725e5a8dee0b9b56ff671 (HEAD -> drm-tip, drm-tip/drm-tip, drm-tip/HEAD)

Author: Christian König <christian.koenig@amd.com>
Date:   Wed Nov 26 13:13:03 2025 +0100

    drm-tip: 2025y-11m-26d-12h-12m-41s UTC integration manifest

drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2188:34: error: ‘struct ttm_resource_manager’ has no member named ‘move’
 2188 |                 dma_fence_put(man->move);
      |                                  ^~
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2189:20: error: ‘struct ttm_resource_manager’ has no member named ‘move’
 2189 |                 man->move = NULL;
      |                    ^~

Is what I see.

Kind regards,
~Maarten Lankhorst

