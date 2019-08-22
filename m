Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B59E98F06
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 11:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbfHVJQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 05:16:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:32840 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbfHVJQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 05:16:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id p77so6642642wme.0
        for <linux-media@vger.kernel.org>; Thu, 22 Aug 2019 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pBmNUN83OemH3FmcqfsNeAfJoNa4Im4df8D7+zD1r3E=;
        b=QhFBb1WoBe9Gc/FZHaHfiKyHlPWFOJcnccXPYUDEQdpsIW0NgB7uSh27aUe6puJcrB
         70LeinoHkJTHlxcz1JUlDJcmiR9RV03aTCQqK0rkvZnSkYltfJ/U25KIuIAA9foVbTji
         xHzaThCjLHm6Ss4GZ87WFEJn8QU8wInkyv77vi/+T8YOEVcTUAMWfDpjMCGDpvXMPpFF
         /BgVQuBBfRIzu52hwW3Tkuq618pzPF58Q6HsvuJml2PdLOvNkrwWr6zxpptUSmKdrNEP
         BGILeD5AcL8prlKOjrqeK3Z+DTzZXiqcuIHB830QYlA9rfrYPJ6lhbYssOtVrSejaO1Q
         BQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pBmNUN83OemH3FmcqfsNeAfJoNa4Im4df8D7+zD1r3E=;
        b=E0lDEcaeumlRomq0pqE9+mNAMAgrSkmUfdQFK3o3gtNCjuA1rlrxHvwaWdVdFuMiQJ
         /sPI9vwcTGvHe6fUP2qQYDpeDTgo2nN2/c5PhUxXvZrBWtMJkiWr00hQ6aNDj2SD4gav
         o4akviPZ/B1h7qAVtl1M3fmcv+78deN8kWGGA9V4v04qflSeEEgsrlQapoV8lH5GWnAV
         DOP2D8kcbjtYlIfkFJKZKWtCPBtsmQKxYVIvSQtsUBJRLEohTY6GvTZOYvYvPS4aHQn5
         ju0BbaAXlGHLt0QpC3XfC1q5XnbDTY2sz+6s8CshRDh+xHO5RFAfTDzmvi3pIYxBKTKi
         nbYw==
X-Gm-Message-State: APjAAAUiYz6hUA7D3TOgn0p43oQYb+NkYuyzMz3hUQBRylZtQxe6NIjS
        +hI08APh+X7yL53GgKg6onY=
X-Google-Smtp-Source: APXvYqy/Wz1IuC/teaJCII1HCJXAPjNQbjqduVpy6CcVncTwTbqhe4dbierlFKaXLSDPxoq1SqKVjw==
X-Received: by 2002:a1c:3d89:: with SMTP id k131mr4706155wma.24.1566465387555;
        Thu, 22 Aug 2019 02:16:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7? ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
        by smtp.gmail.com with ESMTPSA id j20sm57328725wre.65.2019.08.22.02.16.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Aug 2019 02:16:27 -0700 (PDT)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences
 container
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To:     Chris Wilson <chris@chris-wilson.co.uk>, daniel.vetter@ffwll.ch,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, sumit.semwal@linaro.org
References: <20190821123147.110736-1-christian.koenig@amd.com>
 <20190821123147.110736-9-christian.koenig@amd.com>
 <156640106246.20466.15153611256655352471@skylake-alporthouse-com>
 <156640893097.20466.17027932311642169386@skylake-alporthouse-com>
 <5a2aea22-6857-d061-4a80-64f2f57da007@gmail.com>
Message-ID: <25f13de1-c5e2-1ec8-cb79-4e7ee28bb392@gmail.com>
Date:   Thu, 22 Aug 2019 11:16:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5a2aea22-6857-d061-4a80-64f2f57da007@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 22.08.19 um 10:37 schrieb Christian König:
> Am 21.08.19 um 19:35 schrieb Chris Wilson:
>> Quoting Chris Wilson (2019-08-21 16:24:22)
>>> Quoting Christian König (2019-08-21 13:31:45)
>>>> @@ -117,17 +120,10 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>> busy_check_writer(rcu_dereference(obj->base.resv->fence_excl));
>>>>            /* Translate shared fences to READ set of engines */
>>>> -       list = rcu_dereference(obj->base.resv->fence);
>>>> -       if (list) {
>>>> -               unsigned int shared_count = list->shared_count, i;
>>>> -
>>>> -               for (i = 0; i < shared_count; ++i) {
>>>> -                       struct dma_fence *fence =
>>>> - rcu_dereference(list->shared[i]);
>>>> -
>>>> -                       args->busy |= busy_check_reader(fence);
>>>> -               }
>>>> -       }
>>>> +       readers = dma_resv_fences_get_rcu(&obj->base.resv->readers);
>>>> +       dma_fence_array_for_each(fence, cursor, readers)
>>>> +               args->busy |= busy_check_reader(fence);
>>>> +       dma_fence_put(readers);
>>> That's underwhelming, the full-mb shows up in scaling tests (I'll test
>>> the impact of this series later). Something like,
>> To put some numbers to it, adding the full-mb adds 5ns to a single
>> thread on Kabylake and 20ns under contention.
>
> The question is if that's the use case we want to optimize for.
>
> Querying a buffer for business is something we do absolutely rarely on 
> amdgpu, e.g. IIRC we even grab the full reservation lock for this.
>
> But adding new fences comes with every command submission.
>
> What could maybe work is the "do { } while (fence has changed); loop 
> you suggested earlier in this mail thread, but I need to double check 
> if that would really work or clash with recycling dma_fence_arrays().

Ok thinking about it some more that won't work either.

See the dma_fence_array is only guaranteed to not change when you hold a 
reference to it. Otherwise we don't guarantee anything.

Christian.

>
> Christian.
>
>> -Chris
>

