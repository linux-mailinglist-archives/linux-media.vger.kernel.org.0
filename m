Return-Path: <linux-media+bounces-32258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E8DAB3137
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7283A843C
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886A4257450;
	Mon, 12 May 2025 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="NtkGuSqQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23EB255F4A
	for <linux-media@vger.kernel.org>; Mon, 12 May 2025 08:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037489; cv=none; b=HRUY9X3hYMrF9q8NQK/p2mu/Hx3PaT7Ak0ZLu4nGH6ssVyPeIOxcYHl291hN52iZdWnGsFJ+mNdRnM608YE4nOhp9OyGzl93Iwcaq0UkK3edQpGcP5fIJVjeshI/XibInrOEUQ/qxEwjdU/emK0CYvAD9/V4a6HVyN1DcpbU8JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037489; c=relaxed/simple;
	bh=DMu2lVY8Bz1zWDcQ31wc7raoeh2qw9A3EElkZHz65KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/iy3DNQtnHU22HRCfLOAdVaY1N850Y42EELrb7NxBbrpPMZJ9nxhFYLtq1NDkBI/5dQKnbnp4+zs8zFui/9RT7r+ATE1qiSXlQy2/Xtx/rHVdVv3qYls4hRu6+RgJluBbDk7h8u/Xhx9/Ep7+fXr7BP0F9waaZLk/s9MdAtj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=NtkGuSqQ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EyUPgNbeUlMO4Ov6OPHBR1G2/41p5bmVgChlfHzDEHE=; b=NtkGuSqQlSXzYbKBBtyh4Clyxw
	PMcaEnnNOCRqInijXdbesUhJLpt85NmtyO7IIf47EbLPPvXoPnZRjnVRswEUohIyYADeJ38wREdNQ
	mEjDCpnENmA59TWxmGPV5g45LQTpg3xpWqHkfugzvdjzhLkFbc1BLB5A5VANUUj8RGQ0Gc0CssDlK
	3yvXtp5sYcQntJ3XGuL6UoStyWVsaRgyUdxG9P2vxlU1e2Fdm1YY7WOaYNNPJpb41XR3f2aJzTW5y
	PD3V0wiIjco5Sa7atc4c7njVoSjy3qzgBm4jaC8ZjryiJW4P1bxsmoTJntbgpe42NlqVfH8F2bqQH
	3lOVicFQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uEOAf-006xsm-KR; Mon, 12 May 2025 10:11:15 +0200
Message-ID: <29029dde-a602-4fc0-abba-631b10a992d9@igalia.com>
Date: Mon, 12 May 2025 09:11:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 01/13] drm/i915: Use provided dma_fence_is_chain
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-2-tvrtko.ursulin@igalia.com>
 <aB4jgtwqqNUs11py@lstrano-desk.jf.intel.com>
 <b99eff49-cac4-4728-b66e-48bdffb94883@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <b99eff49-cac4-4728-b66e-48bdffb94883@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/05/2025 09:05, Christian König wrote:
> On 5/9/25 17:47, Matthew Brost wrote:
>> On Fri, May 09, 2025 at 04:33:40PM +0100, Tvrtko Ursulin wrote:
>>> Replace open-coded helper with the subsystem one.
>>>
>>
>> You probably can just send this one by itself as it good cleanup and
>> independent.
>>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Any objections that I start to push those patches to drm-misc-next or do you want to take this one through the i915 branch?

I think it will depend on timing. If this series gets stalled, or gets 
rejected, I will push this cleanup patch to i915. But if things will be 
looking positive to merge more of this series, then it is much simpler 
to take everything via drm-misc-next and avoid branch dependencies.

Regards,

Tvrtko

>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 7 +------
>>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>> index 7127e90c1a8f..991666fd9f85 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>>> @@ -106,11 +106,6 @@ static void fence_set_priority(struct dma_fence *fence,
>>>   	rcu_read_unlock();
>>>   }
>>>   
>>> -static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
>>> -{
>>> -	return fence->ops == &dma_fence_chain_ops;
>>> -}
>>> -
>>>   void i915_gem_fence_wait_priority(struct dma_fence *fence,
>>>   				  const struct i915_sched_attr *attr)
>>>   {
>>> @@ -126,7 +121,7 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
>>>   
>>>   		for (i = 0; i < array->num_fences; i++)
>>>   			fence_set_priority(array->fences[i], attr);
>>> -	} else if (__dma_fence_is_chain(fence)) {
>>> +	} else if (dma_fence_is_chain(fence)) {
>>>   		struct dma_fence *iter;
>>>   
>>>   		/* The chain is ordered; if we boost the last, we boost all */
>>> -- 
>>> 2.48.0
>>>
> 


