Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6961298DE5
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 10:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731418AbfHVIhY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 04:37:24 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]:34304 "EHLO
        mail-wr1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730919AbfHVIhY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 04:37:24 -0400
Received: by mail-wr1-f49.google.com with SMTP id s18so4585890wrn.1
        for <linux-media@vger.kernel.org>; Thu, 22 Aug 2019 01:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qHqGzI3h6bGS7SsXoxtNnAD8/KMthB9ts12wm/m1eDo=;
        b=svgTT1e6pwUX0FYCa/TK8wFPHCvQOwllQyIUxvPuvAZdBnNaxUcA5RCqQ7wr45sxJq
         H0iRVQhLqOuq5bu2KYrDBBlgELVeJj0e8KfDhSKSwZFXQZ3jWE1kctG0pvnrLOy4kiaw
         9wL9In2fT4AA7jQVPHbt1OVw+W3s1tBc0TfNHrAB4GfgCByTBcZmhQynhNeR2u6h3Bme
         k5Y71yDkkknYmn3SNkb5gR3+IjsyG2/XqfY2mvMYoh91mZhfcvSvcrhRze1MgVJc7f+E
         0GkbVcuJXxm6JmFqcVo9+yM9sgyeizfZhbQqheP54y3h1msRyineluEX6J3KfAyc4uTg
         wVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qHqGzI3h6bGS7SsXoxtNnAD8/KMthB9ts12wm/m1eDo=;
        b=CRmcgEVY1nEs+4BPE4+EZJ0SHqKItfexnWbDsh5Bdwkk2SY5Kab/71jV8g0aqm98ST
         S3FcBzFjBmlyPewRwCocyORf3hGxnLxPUcsvgJMNHbKjS2bwoKjNzhFv+xkXVUIMGFV9
         UbqKUdK6q70pCkK2gILMdFm7x7AtHEKbYOH5w1lXdOBL1GeAk25T4qUgrTenBLGWrwEx
         x57ytny1KzhN5hWLoox5FSV7q8+45ty+39ycJRgufiwZJ5qA7Qgar3iCFns0FeFSf5p1
         rDEETtRhW1LjV+bUxXI5ws/VrUngZETDpcA+uz3B2m8n5L+Bd/mTjOow8McQZl80ZuYF
         jTvw==
X-Gm-Message-State: APjAAAU87d8hCEtywiYhG4HJR8wDzM2Rlbvj+LCY3chJJRcGK77vHSjN
        3HYAz0eqewDw1Qvp6FSDal8=
X-Google-Smtp-Source: APXvYqzdnU9t8ZEiiXpnOtQfSt7dy2nTHQVHAAc8vwelIXp0H+dR1wesZhPTChfDg57Ppdd202C+vw==
X-Received: by 2002:adf:f14f:: with SMTP id y15mr45649273wro.28.1566463042071;
        Thu, 22 Aug 2019 01:37:22 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id w13sm55729223wre.44.2019.08.22.01.37.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 01:37:21 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences
 container
To:     Chris Wilson <chris@chris-wilson.co.uk>, daniel.vetter@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-9-christian.koenig@amd.com>
 <156640106246.20466.15153611256655352471@skylake-alporthouse-com>
 <156640893097.20466.17027932311642169386@skylake-alporthouse-com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5a2aea22-6857-d061-4a80-64f2f57da007@gmail.com>
Date:   Thu, 22 Aug 2019 10:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156640893097.20466.17027932311642169386@skylake-alporthouse-com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 21.08.19 um 19:35 schrieb Chris Wilson:
> Quoting Chris Wilson (2019-08-21 16:24:22)
>> Quoting Christian König (2019-08-21 13:31:45)
>>> @@ -117,17 +120,10 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>>>                  busy_check_writer(rcu_dereference(obj->base.resv->fence_excl));
>>>   
>>>          /* Translate shared fences to READ set of engines */
>>> -       list = rcu_dereference(obj->base.resv->fence);
>>> -       if (list) {
>>> -               unsigned int shared_count = list->shared_count, i;
>>> -
>>> -               for (i = 0; i < shared_count; ++i) {
>>> -                       struct dma_fence *fence =
>>> -                               rcu_dereference(list->shared[i]);
>>> -
>>> -                       args->busy |= busy_check_reader(fence);
>>> -               }
>>> -       }
>>> +       readers = dma_resv_fences_get_rcu(&obj->base.resv->readers);
>>> +       dma_fence_array_for_each(fence, cursor, readers)
>>> +               args->busy |= busy_check_reader(fence);
>>> +       dma_fence_put(readers);
>> That's underwhelming, the full-mb shows up in scaling tests (I'll test
>> the impact of this series later). Something like,
> To put some numbers to it, adding the full-mb adds 5ns to a single
> thread on Kabylake and 20ns under contention.

The question is if that's the use case we want to optimize for.

Querying a buffer for business is something we do absolutely rarely on 
amdgpu, e.g. IIRC we even grab the full reservation lock for this.

But adding new fences comes with every command submission.

What could maybe work is the "do { } while (fence has changed); loop you 
suggested earlier in this mail thread, but I need to double check if 
that would really work or clash with recycling dma_fence_arrays().

Christian.

> -Chris

