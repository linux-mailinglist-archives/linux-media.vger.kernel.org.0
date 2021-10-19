Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F99C433B3E
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 17:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbhJSPyn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 11:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbhJSPyJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 11:54:09 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FD4C061777
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 08:51:41 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id g39so8454596wmp.3
        for <linux-media@vger.kernel.org>; Tue, 19 Oct 2021 08:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6ZFaxOZuF+IhLUiqvXFEEaubfNfset/rnTpcy2dgnJg=;
        b=UKPHdrSwzYVYfSOaQNp28TlNw8ngnMfJFfd+bxj8K6Yk60xlDM3U3CMVv7havbe6d5
         mlhmi+ZablsSB8GX3O3JLakmBpT4p/UFv6EBMQiUNmbHp8w86++d1P1D9eE34J3Xn/UN
         QrvCaOe6Ebj8ZPQYzkFrNuKm3+BHxHE851Thul43ZfsCvMn6vJLjX/1jgzAIhCGEsN9e
         oA6TExBNqjmvTTgQ2W+mkivR9ovsuQ+VhByjzxqAuRfHXRfx5Ud+CtKkUj+9Ug0bjCHI
         VE4zU2MMS/hPW/IwgxZGY94R9f58Jq8wLe5F7m7aFOEQMkeVwKU2si3Tqe+jcKFK6Bdb
         WfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6ZFaxOZuF+IhLUiqvXFEEaubfNfset/rnTpcy2dgnJg=;
        b=Jb86Ax26a/5g6dJc2p8lF6qtlklN+NfwSkhBz4wEtqQAMXS3/qcTSMmAZI5NSFblo9
         i9TQhzk4RByQIWB5IbeIH2oEyIeMtUeYjRbRvJUwN6S0Z/PPggM0A9f4VNOgbDAIqK4z
         S8GsyO9ojUqBZGLphq03MmqhVUGMBrc/epGYUGkOPCKfl1y+pml1D6tEjOh26RM8x3E7
         30ja2299PBo9LLF6iW0Lwl0Boft/9/xyMhXounV5q34GMEXwdg1Zqllb2pl46pvhZglD
         npHj52tmPtl1EAa+8NeVAS10yBH1vo2qyKuFqsv24HGR7+wFu2MFdNgcRztdBN9cXHBU
         DRNw==
X-Gm-Message-State: AOAM530UV1EgL+AeSME0+/mLJqhUS7/gUCiFNFx/INwZw3NSVsIaHXmg
        vgsNpiVSl+yU/Gprii20uhc=
X-Google-Smtp-Source: ABdhPJz4XNeACAlrFxmsoMuUEFHsdoY3ZgMk/DqPLSEBGgjXzSylOvjXgNMCJTEtcGYcpIsBs1s+Tw==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr6922264wmi.143.1634658700577;
        Tue, 19 Oct 2021 08:51:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4fc4:fae2:bc41:a808? ([2a02:908:1252:fb60:4fc4:fae2:bc41:a808])
        by smtp.gmail.com with ESMTPSA id 133sm2560203wmb.24.2021.10.19.08.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 08:51:40 -0700 (PDT)
Subject: Re: [PATCH 24/28] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        tvrtko.ursulin@linux.intel.com
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-25-christian.koenig@amd.com>
 <YWbr0/ey1rCbb0Yi@phenom.ffwll.local>
 <405b9df8-58fd-b8f2-cec2-acde69aa5633@gmail.com>
 <YW7WmU/GLzgJbDQc@phenom.ffwll.local>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <35416546-b60b-d5cf-7fe9-abaa0dde63e2@gmail.com>
Date:   Tue, 19 Oct 2021 17:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW7WmU/GLzgJbDQc@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 19.10.21 um 16:30 schrieb Daniel Vetter:
> On Tue, Oct 19, 2021 at 03:02:26PM +0200, Christian König wrote:
>> Am 13.10.21 um 16:23 schrieb Daniel Vetter:
>>> On Tue, Oct 05, 2021 at 01:37:38PM +0200, Christian König wrote:
>>>> Makes the handling a bit more complex, but avoids the use of
>>>> dma_resv_get_excl_unlocked().
>>>>
>>>> v2: improve coding and documentation
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
>>>>    1 file changed, 11 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
>>>> index e570398abd78..8534f78d4d6d 100644
>>>> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
>>>> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
>>>> @@ -143,6 +143,7 @@
>>>>     */
>>>>    int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>>>>    {
>>>> +	struct dma_resv_iter cursor;
>>>>    	struct drm_gem_object *obj;
>>>>    	struct dma_fence *fence;
>>>> @@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
>>>>    		return 0;
>>>>    	obj = drm_gem_fb_get_obj(state->fb, 0);
>>>> -	fence = dma_resv_get_excl_unlocked(obj->resv);
>>>> -	drm_atomic_set_fence_for_plane(state, fence);
>>>> +	dma_resv_iter_begin(&cursor, obj->resv, false);
>>>> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>>> +		/* TODO: We only use the first write fence here and need to fix
>>>> +		 * the drm_atomic_set_fence_for_plane() API to accept more than
>>>> +		 * one. */
>>> I'm confused, right now there is only one write fence. So no need to
>>> iterate, and also no need to add a TODO. If/when we add more write fences
>>> then I think this needs to be revisited, and ofc then we do need to update
>>> the set_fence helpers to carry an entire array of fences.
>> Well could be that I misunderstood you, but in your last explanation it
>> sounded like the drm_atomic_set_fence_for_plane() function needs fixing
>> anyway because a plane could have multiple BOs.
>>
>> So in my understanding what we need is a
>> drm_atomic_add_dependency_for_plane() function which records that a certain
>> fence needs to be signaled before a flip.
> Yeah that's another issue, but in practice there's no libva which decodes
> into planar yuv with different fences between the planes. So not a bug in
> practice.
>
> But this is entirely orthogonal to you picking up the wrong fence here if
> there's not exclusive fence set:
>
> - old code: Either pick the exclusive fence, or not fence if the exclusive
>    one is not set.
>
> - new code: Pick the exclusive fence or the first shared fence

Hui what?

We use "dma_resv_iter_begin(&cursor, obj->resv, *false*);" here which 
means that only the exclusive fence is returned and no shared fences 
whatsoever.

My next step is to replace the boolean with a bunch of use case 
describing enums. I hope that will make it much clearer what's going on 
here.

Christian.

> New behaviour is busted, because scanning out and reading from a buffer at
> the same time (for the next frame, e.g. to copy over damaged areas or some
> other tricks) is very much a supported thing. Atomic _only_ wants to look
> at the exclusive fence slot, which mean "there is an implicitly synced
> write to this buffers". Implicitly synced reads _must_ be ignored.


>
> Now amdgpu doesn't have this distinction in its uapi, but many drivers do.
> -Daniel
>
>> Support for more than one write fence then comes totally naturally.
>>
>> Christian.
>>
>>> -Daniel
>>>
>>>> +		dma_fence_get(fence);
>>>> +		break;
>>>> +	}
>>>> +	dma_resv_iter_end(&cursor);
>>>> +	drm_atomic_set_fence_for_plane(state, fence);
>>>>    	return 0;
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
>>>> -- 
>>>> 2.25.1
>>>>

