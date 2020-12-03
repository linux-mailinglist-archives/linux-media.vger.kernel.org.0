Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E1F2CCB7B
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 02:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgLCBPU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 20:15:20 -0500
Received: from a2.mail.mailgun.net ([198.61.254.61]:61847 "EHLO
        a2.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgLCBPT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 20:15:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606958099; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Jx2bJnvscSS0IAaRCjKGvC/AZvsByrOUW8lInylOR/0=;
 b=fgVUKDz+Ra2bxS7Dm6Uu6xYkZhx6FXag9A24Hpoxgbdkw9nasQaVYCktiDqwvEEGIBo4hk/F
 77FRE9X4py59xOl+yDunLq7dqbyi9JpV+ah1i0Yh8BKH670h7KmTqXJks70uybQRb8HXtZ0Z
 YFmJLohw/vk586+ZiZCxPl+yCNk=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fc83bf4e084c50478946e7a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Dec 2020 01:14:28
 GMT
Sender: veeras=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 40CBDC43467; Thu,  3 Dec 2020 01:14:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: veeras)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D387DC433ED;
        Thu,  3 Dec 2020 01:14:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 02 Dec 2020 17:14:26 -0800
From:   veeras@codeaurora.org
To:     Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        Dave Airlie <airlied@linux.ie>
Cc:     ostedt@goodmis.org, "Clark, Rob" <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, pdhaval@codeaurora.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [PATCH RESEND 1/2] dma-fence: allow signaling drivers to set
 fence timestamp
In-Reply-To: <CAKMK7uEaYQmu6zBR5rYj=O1DdhzO2q_bMhntwxEuqbMqh_E9aQ@mail.gmail.com>
References: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
 <CAKMK7uEaYQmu6zBR5rYj=O1DdhzO2q_bMhntwxEuqbMqh_E9aQ@mail.gmail.com>
Message-ID: <c356da0d7b5a945e415620585073e40c@codeaurora.org>
X-Sender: veeras@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-11-19 03:58, Daniel Vetter wrote:
> On Thu, Nov 12, 2020 at 7:27 PM Veera Sundaram Sankaran
> <veeras@codeaurora.org> wrote:
>> 
>> Some drivers have hardware capability to get the precise timestamp of
>> certain events based on which the fences are triggered. This allows it
>> to set accurate timestamp factoring out any software and IRQ 
>> latencies.
>> Move the timestamp parameter out of union in dma_fence struct to allow
>> signaling drivers to set it. If the parameter is not set, ktime_get is
>> used to set the current time to fence timestamp during 
>> dma_fence_signal.
>> 
>> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> 
> So with they "why?" question fully resolved, I think this is a bit too
> much a hack. I think much better if we pass the timestamp explicitly,
> in a new dma_fence_signal_timestamp variant. That means a bit more
> work, but I think it will handle this special case cleaner.
> 
> Also means we need to wire the timestamp through the entire call stack
> on the drm side too. So we need a drm_send_event_locked_timestamp
> variant too for send_vblank_event.
> -Daniel
> 

@Sumit Semwal, @Gustavo Padovan, @Steven Rostedt
Can you please help in getting review for the v2 patches.
I have addressed the earlier comments from Daniel Vetter.
https://patchwork.kernel.org/project/dri-devel/list/?series=388881&archive=both
Thanks,
Veera

>> ---
>>  drivers/dma-buf/dma-fence.c | 18 ++++++++++--------
>>  include/linux/dma-fence.h   | 15 +++------------
>>  2 files changed, 13 insertions(+), 20 deletions(-)
>> 
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 43624b4..7cef49a 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -4,6 +4,7 @@
>>   *
>>   * Copyright (C) 2012 Canonical Ltd
>>   * Copyright (C) 2012 Texas Instruments
>> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>>   *
>>   * Authors:
>>   * Rob Clark <robdclark@gmail.com>
>> @@ -329,7 +330,6 @@ void __dma_fence_might_wait(void)
>>  int dma_fence_signal_locked(struct dma_fence *fence)
>>  {
>>         struct dma_fence_cb *cur, *tmp;
>> -       struct list_head cb_list;
>> 
>>         lockdep_assert_held(fence->lock);
>> 
>> @@ -337,16 +337,18 @@ int dma_fence_signal_locked(struct dma_fence 
>> *fence)
>>                                       &fence->flags)))
>>                 return -EINVAL;
>> 
>> -       /* Stash the cb_list before replacing it with the timestamp */
>> -       list_replace(&fence->cb_list, &cb_list);
>> -
>> -       fence->timestamp = ktime_get();
>> +       /* set current time, if not set by signaling driver */
>> +       if (!fence->timestamp)
>> +               fence->timestamp = ktime_get();
>>         set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>>         trace_dma_fence_signaled(fence);
>> 
>> -       list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>> -               INIT_LIST_HEAD(&cur->node);
>> -               cur->func(fence, cur);
>> +       if (!list_empty(&fence->cb_list)) {
>> +               list_for_each_entry_safe(cur, tmp, &fence->cb_list, 
>> node) {
>> +                       INIT_LIST_HEAD(&cur->node);
>> +                       cur->func(fence, cur);
>> +               }
>> +               INIT_LIST_HEAD(&fence->cb_list);
>>         }
>> 
>>         return 0;
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index 09e23ad..a9eebaf 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -4,6 +4,7 @@
>>   *
>>   * Copyright (C) 2012 Canonical Ltd
>>   * Copyright (C) 2012 Texas Instruments
>> + * Copyright (c) 2020 The Linux Foundation. All rights reserved.
>>   *
>>   * Authors:
>>   * Rob Clark <robdclark@gmail.com>
>> @@ -70,26 +71,16 @@ struct dma_fence {
>>          * release the fence it is unused. No one should be adding to 
>> the
>>          * cb_list that they don't themselves hold a reference for.
>>          *
>> -        * The lifetime of the timestamp is similarly tied to both the
>> -        * rcu freelist and the cb_list. The timestamp is only set 
>> upon
>> -        * signaling while simultaneously notifying the cb_list. Ergo, 
>> we
>> -        * only use either the cb_list of timestamp. Upon destruction,
>> -        * neither are accessible, and so we can use the rcu. This 
>> means
>> -        * that the cb_list is *only* valid until the signal bit is 
>> set,
>> -        * and to read either you *must* hold a reference to the 
>> fence,
>> -        * and not just the rcu_read_lock.
>> -        *
>>          * Listed in chronological order.
>>          */
>>         union {
>>                 struct list_head cb_list;
>> -               /* @cb_list replaced by @timestamp on 
>> dma_fence_signal() */
>> -               ktime_t timestamp;
>> -               /* @timestamp replaced by @rcu on dma_fence_release() 
>> */
>> +               /* @cb_list replaced by @rcu on dma_fence_release() */
>>                 struct rcu_head rcu;
>>         };
>>         u64 context;
>>         u64 seqno;
>> +       ktime_t timestamp;
>>         unsigned long flags;
>>         struct kref refcount;
>>         int error;
>> --
>> 2.7.4
>> 
