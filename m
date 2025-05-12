Return-Path: <linux-media+bounces-32272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 421CAAB32BF
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 11:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1B11188F12D
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 09:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32252571BB;
	Mon, 12 May 2025 09:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="f3lJiyIN"
X-Original-To: linux-media@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897EC433A0
	for <linux-media@vger.kernel.org>; Mon, 12 May 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040877; cv=none; b=o4llYmahC1tVxw8L7+Ane0vB70PYiFK3zzh70AZwyvDKnuXcGpK+8iig2VsFu0OfceES0ef6I8cWyXkkm8HnQGGdTdzevVihaMvBmNVRizocR9jIZCXXd/r+6InZj8+rj3g14WqZlHlvHQbc0rn6thxvfGJHwIry63NDjcJ2HFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040877; c=relaxed/simple;
	bh=Afl9oo1xDJLysxlWZb2U9lFAtEvTk8yYfEUjCMDwmgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJU6RkNEcTd80b/gmqHBA2PjA+DQPqGYDcinjn4zymKkRNuM9unHkiledgqrfWsdiCB9eItszLcMMgu+VuIyDzBV/AldFbRZlEi2xquiUomJaL1kL77Drgcesw1tO+yrqKUX8uuIG5hoAVlfEiyP0xtuzqGh6AoYUiT16rHJ08k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=f3lJiyIN; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mtDfODfKKqCTmiLAPWM7Z781dLVe98fzxXS0LXtBsLY=; b=f3lJiyINO+jsjxMX6iFd+vGtsh
	T7/uExi7FM6LgK60FCS8jWIGyaIkNRqgsO3iwDzoYw7+JD9e29vMAJu6TWRWyluzfn/XV7HQvQg/7
	E8u+YTMkrRKQEZoVLj4PtJyDmvid4bpsX6+i4e2nvR5fFAGmTbXxTQVlc9mpaCmOclf36hIoXfIx4
	S+P+u5tvhiKK0PUgg066z7S8/S80okyMRJGacluoFadYDR32k3fvNdIDZ13eTzhsmISM/UuL1wnBf
	TLj9PXh5qWM3ZaWW4TCU54wRcmwH1Shg5VI9a+b5zVwdQb1JBP7ZF1vLPixEmq7YYGTOgGgCRAiTH
	xIz7SKgQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uEP3I-006zPM-IK; Mon, 12 May 2025 11:07:42 +0200
Message-ID: <08e8f2fc-3878-445e-81dd-6f49fc008ee6@igalia.com>
Date: Mon, 12 May 2025 10:07:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 08/13] drm/amdgpu: Use dma-fence driver and timeline name
 helpers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
 <e4887f43-9eb2-47cd-91a9-080c3c646cb4@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <e4887f43-9eb2-47cd-91a9-080c3c646cb4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/05/2025 09:27, Christian König wrote:
> On 5/9/25 17:33, Tvrtko Ursulin wrote:
>> Access the dma-fence internals via the previously added helpers.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> index 11dd2e0f7979..8e5bf179a6c8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> @@ -33,7 +33,7 @@
>>   #define TRACE_INCLUDE_FILE amdgpu_trace
>>   
>>   #define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
>> -	 job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_fence->finished)
>> +	 dma_fence_timeline_name(&job->base.s_fence->finished)
> 
> I think you can nuke the macro now as well, the new function name is short enough.

Done.

Regards,

Tvrtko


