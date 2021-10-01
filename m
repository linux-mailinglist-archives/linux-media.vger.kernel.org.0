Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA76041EB10
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhJAKlh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbhJAKlg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:41:36 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D3FC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:39:52 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id m22so9293872wrb.0
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OaGv+qm5SuNdsSmcpk03CbdLQM2e6BUerjnin6OTQVo=;
        b=LbrVyo5iRAYHVwqsB83B+gqgn+xQo4l/WliW9dQclgC4bINop8954OfITWNxjcw6Gt
         SO7BHo9r1tjfntFJxWokhynXQwO1I2WOrni9h00qnIzz4dnJ44KJDWODAKE+U/Q0MHia
         kFCTSDSBDUXG1RiecTkWep+33RuLo/97shBYQl4z/wopeWNLRJRGXFZ0KWmiHTRvOdvl
         XEG8ZD3RDSBVnQDUI/SlJ63jaU0jq8oVYUvBn4H5Q2G+7CuYU/OhQ2W1O1HtiI2sFOR9
         LYLs2e72FFDXwFHBvUVl+ZplGwvTxZqD7sDqYHxDV93ilakitf9GiDuoJX08A0heXzPK
         pAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OaGv+qm5SuNdsSmcpk03CbdLQM2e6BUerjnin6OTQVo=;
        b=laq68omJqXS2f2RHizGDmS7SYUnDxfJ+LYzfUBAD+vLkW35MQGsR9vqLd5a7K+jbbv
         BlUQ+F1wYTQbGiZ3zgDCZzmmbIcLLD0rNOwPFvc950Bo4w2QpYvZpP3arj6bAop8LgMq
         kg5Bd/ww8ym0MHWVj1OvWNP4nUBqoaqVLJ5PDTx8Ew0C37SfcxBnzqvjsU27FgEg4D6S
         LSxHqVqildyC4hRrx5Z2EEVJGdOD4H//FsLheTkTvDyi22ksplBuDcKAs4pnIpt7cYlZ
         OyYk3yLw99NIuf7dyf4qkFnqjN4rdLNMRZI8N/rn7ocpHCFLbXhFvajfJ8PgDZniuSqE
         0yhA==
X-Gm-Message-State: AOAM533/WAPNAwAg0RQYf9WcI/Yfi8A6wXUR4FlvgJtjBtf3huTqV9Xp
        iZOcELE97vWpEKj7ntH9UyNZhNckB4o=
X-Google-Smtp-Source: ABdhPJzzsWpPn1VpZitrRxGC4hk7LTyPFUdYE0nVKmdn4+DLsxUEpKC52grmglpl2LBR8hnvQu2J8g==
X-Received: by 2002:adf:8b45:: with SMTP id v5mr11569085wra.211.1633084791135;
        Fri, 01 Oct 2021 03:39:51 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id w23sm7676012wmi.6.2021.10.01.03.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 03:39:50 -0700 (PDT)
Subject: Re: [PATCH 17/28] drm/i915: use the new iterator in
 i915_gem_busy_ioctl v2
To:     Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-18-christian.koenig@amd.com>
 <c6837f74-0ba5-e3c2-5778-a9d120c6ea67@linux.intel.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cda5d293-4cf2-3b9b-7e38-4ad7cac2db1e@gmail.com>
Date:   Fri, 1 Oct 2021 12:39:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c6837f74-0ba5-e3c2-5778-a9d120c6ea67@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 01.10.21 um 12:37 schrieb Tvrtko Ursulin:
>
> On 01/10/2021 11:05, Christian König wrote:
>> This makes the function much simpler since the complex
>> retry logic is now handled else where.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Sorry I retract until you add the text about the increased cost of the 
> added atomics. I think the point is important to discuss given 
> proposal goes from zero atomics to num_fences * 2 (fence get/put 
> unless I am mistaken) atomics per busy ioctl. That makes me lean 
> towards just leaving this as is since it is not that complex.

I'm certainly pushing hard to remove all manual RCU dance from the 
drivers, including this one.

The only option is to either have the atomics overhead (which is indeed 
num_fences*2) or the locking overhead.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
>>   1 file changed, 14 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> index 6234e17259c1..dc72b36dae54 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
>> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void 
>> *data,
>>   {
>>       struct drm_i915_gem_busy *args = data;
>>       struct drm_i915_gem_object *obj;
>> -    struct dma_resv_list *list;
>> -    unsigned int seq;
>> +    struct dma_resv_iter cursor;
>> +    struct dma_fence *fence;
>>       int err;
>>         err = -ENOENT;
>> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, 
>> void *data,
>>        * to report the overall busyness. This is what the wait-ioctl 
>> does.
>>        *
>>        */
>> -retry:
>> -    seq = raw_read_seqcount(&obj->base.resv->seq);
>> -
>> -    /* Translate the exclusive fence to the READ *and* WRITE engine */
>> -    args->busy = 
>> busy_check_writer(dma_resv_excl_fence(obj->base.resv));
>> -
>> -    /* Translate shared fences to READ set of engines */
>> -    list = dma_resv_shared_list(obj->base.resv);
>> -    if (list) {
>> -        unsigned int shared_count = list->shared_count, i;
>> -
>> -        for (i = 0; i < shared_count; ++i) {
>> -            struct dma_fence *fence =
>> -                rcu_dereference(list->shared[i]);
>> -
>> +    args->busy = 0;
>> +    dma_resv_iter_begin(&cursor, obj->base.resv, true);
>> +    dma_resv_for_each_fence_unlocked(&cursor, fence) {
>> +        if (dma_resv_iter_is_restarted(&cursor))
>> +            args->busy = 0;
>> +
>> +        if (dma_resv_iter_is_exclusive(&cursor))
>> +            /* Translate the exclusive fence to the READ *and* WRITE 
>> engine */
>> +            args->busy |= busy_check_writer(fence);
>> +        else
>> +            /* Translate shared fences to READ set of engines */
>>               args->busy |= busy_check_reader(fence);
>> -        }
>>       }
>> -
>> -    if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
>> -        goto retry;
>> +    dma_resv_iter_end(&cursor);
>>         err = 0;
>>   out:
>>

