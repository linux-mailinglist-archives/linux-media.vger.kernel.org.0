Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19384414CB9
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 17:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236363AbhIVPK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 11:10:58 -0400
Received: from mga02.intel.com ([134.134.136.20]:7977 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232274AbhIVPK6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 11:10:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="210852638"
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; 
   d="scan'208";a="210852638"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 08:09:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,314,1624345200"; 
   d="scan'208";a="704054443"
Received: from bbrowne-mobl.ger.corp.intel.com (HELO [10.213.200.151]) ([10.213.200.151])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 08:09:23 -0700
Subject: Re: [PATCH 01/26] dma-buf: add dma_resv_for_each_fence_unlocked v4
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
References: <20210922091044.2612-1-christian.koenig@amd.com>
 <20210922091044.2612-2-christian.koenig@amd.com>
 <093432d2-de8e-9684-03aa-7cb4842ea755@linux.intel.com>
 <347e66cf-fd85-da15-6a00-cecab25c2d49@gmail.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <3ea25ac4-19f9-530e-8961-cb5b1822a11b@linux.intel.com>
Date:   Wed, 22 Sep 2021 16:09:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <347e66cf-fd85-da15-6a00-cecab25c2d49@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 22/09/2021 15:50, Christian König wrote:
> Am 22.09.21 um 16:36 schrieb Tvrtko Ursulin:
>>> +
>>> +/**
>>> + * dma_resv_iter_first_unlocked - first fence in an unlocked 
>>> dma_resv obj.
>>> + * @cursor: the cursor with the current position
>>> + *
>>> + * Returns the first fence from an unlocked dma_resv obj.
>>> + */
>>> +struct dma_fence *dma_resv_iter_first_unlocked(struct dma_resv_iter 
>>> *cursor)
>>> +{
>>> +    rcu_read_lock();
>>> +    do {
>>> +        dma_resv_iter_restart_unlocked(cursor);
>>> +        dma_resv_iter_walk_unlocked(cursor);
>>> +    } while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
>>> +    rcu_read_unlock();
>>> +
>>> +    return cursor->fence;
>>> +}
>>> +EXPORT_SYMBOL(dma_resv_iter_first_unlocked);
>>
>> Why is this one split from dma_resv_iter_begin and even exported?
> 
> I've split it to be able to use dma_resv_iter_begin in both the unlocked 
> and locked iterator.

Ok.

> 
>> I couldn't find any users in the series.
> 
> This is used in the dma_resv_for_each_fence_unlocked() macro to return 
> the first fence.

Doh!

>>> +
>>> +/**
>>> + * dma_resv_iter_next_unlocked - next fence in an unlocked dma_resv 
>>> obj.
>>> + * @cursor: the cursor with the current position
>>> + *
>>> + * Returns the next fence from an unlocked dma_resv obj.
>>> + */
>>> +struct dma_fence *dma_resv_iter_next_unlocked(struct dma_resv_iter 
>>> *cursor)
>>> +{
>>> +    bool restart;
>>> +
>>> +    rcu_read_lock();
>>> +    cursor->is_restarted = false;
>>> +    restart = read_seqcount_retry(&cursor->obj->seq, cursor->seq);
>>> +    do {
>>> +        if (restart)
>>> +            dma_resv_iter_restart_unlocked(cursor);
>>> +        dma_resv_iter_walk_unlocked(cursor);
>>> +        restart = true;
>>> +    } while (read_seqcount_retry(&cursor->obj->seq, cursor->seq));
>>> +    rcu_read_unlock();
>>> +
>>> +    return cursor->fence;
>>> +}
>>> +EXPORT_SYMBOL(dma_resv_iter_next_unlocked);
>>
>> Couldn't dma_resv_iter_first_unlocked and dma_resv_iter_next_unlocked 
>> share the same implementation? Especially if you are able to replace 
>> cursor->is_restarted with cursor->index == -1.
> 
> That's what I had initially, but Daniel disliked it for some reason. You 
> then need a centralized walk function instead of first/next.

I had some ideas to only consolidate "first" and "next" helpers but never mind, yours is fine as well.

Regards,

Tvrtko

> 
> Thanks,
> Christian.
> 
>> Regards,
>>
>> Tvrtko
> 
