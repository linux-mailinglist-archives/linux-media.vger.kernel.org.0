Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D34F5EFB94
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 19:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236053AbiI2RHo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 13:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234729AbiI2RHn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 13:07:43 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC301C6A56;
        Thu, 29 Sep 2022 10:07:40 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id 13so4131349ejn.3;
        Thu, 29 Sep 2022 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=vK9/+GlSYvUPvh2/77OIcn3D5FUhfXeuUNPY7jU1QrE=;
        b=Fpo0pMMqGz0vduBEEM/1sZlikMAn8kCQJEM+tUnz8rARK5jvhtQAEzH56cC1EqHa8r
         5V5IHsRw3qVLjyezJPciAmiRnyu2o+60Emlxf7qitI+lkTPBeKLqFBWGh8cEuuUT2lEf
         r2Srrj8rPdFhbtUrGKSSImS7hZayBW3ac7Sa4Bmos5QaSxG8h0GUgfixds3reeC8H/hG
         u2qMYcaqnIyjoq6CO0orGo/aiJHHmv9mESUkCWVVpB3XS49tVHcgcMmCapMca1ii1WXY
         25M9fWsih8uz9MXQWV2UhNX4GxWwnXh4WjS6YbKqC+YgFqYqG/jXrINtJjixMupNKMuO
         lHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vK9/+GlSYvUPvh2/77OIcn3D5FUhfXeuUNPY7jU1QrE=;
        b=kv2qqcJyY43tUzXowmRhjBL/760qlEJVNPruazCfTWtzbAJDc6HkuvLCc8SwPqzBcV
         PEKxxtTnaBGmRpaDKesHYahB7wwxnVjtdQlfpnwHFEzwLzU6+Kw7ahwkTcH/r+kx3/5z
         ucNCISmVem3T1YiALgbfUNyTyiUBO6KDTYxXDj+d609mwqTSkRRa1dlzdKRrDyH8UcPD
         vChj5m73YO28K6uxKPAYuYb64is69E1ECBNvcg5JZ6o5dZuJWdC+hXSRZJw2iOmHqkeZ
         cnFZIy/jmV85eq9BJcNiUFnEMaKdoJ+ItaKPyxD8p7BLB11M6Q1yDs0nFPGMyUMNNSpO
         UR6w==
X-Gm-Message-State: ACrzQf3z7atV9FVa062dArzS5gkaO/cLRSHLVK6dSgz6PzeLKdOMzYGB
        1w16FiAe5/WKHJLt8R1gH6Q=
X-Google-Smtp-Source: AMsMyM5BgGw29H2zTEUAsm3s36r3NQvksC3sKB/X7MDifJ+YggRZcYZUyyhmBslDcfMQFZJAn7ZUaQ==
X-Received: by 2002:a17:906:dc8d:b0:782:e270:26ae with SMTP id cs13-20020a170906dc8d00b00782e27026aemr3530551ejc.427.1664471258519;
        Thu, 29 Sep 2022 10:07:38 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:2ac9:f206:b2b3:2fab? ([2a02:908:1256:79a0:2ac9:f206:b2b3:2fab])
        by smtp.gmail.com with ESMTPSA id w14-20020a17090633ce00b00741a251d9e8sm4186315eja.171.2022.09.29.10.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 10:07:37 -0700 (PDT)
Message-ID: <d5dca4c1-bb2e-70c0-155d-624f00ede3d6@gmail.com>
Date:   Thu, 29 Sep 2022 19:07:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] Re: [PATCH v4 5/6] drm/sched: Use parent fence
 instead of finished
Content-Language: en-US
To:     Steven Price <steven.price@arm.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
        shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
        Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
        gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <20220914164321.2156-6-Arvind.Yadav@amd.com>
 <e613a225-dabf-7e87-2624-a3244df8a877@arm.com>
 <5beff5e2-8589-28cf-40b4-9e6b9e45b307@amd.com>
 <ccb55f39-2d7d-1e9d-91ac-70f609370e22@arm.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ccb55f39-2d7d-1e9d-91ac-70f609370e22@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 29.09.22 um 17:31 schrieb Steven Price:
> On 29/09/2022 15:57, Christian König wrote:
>> Am 29.09.22 um 16:53 schrieb Steven Price:
>>> On 14/09/2022 17:43, Arvind Yadav wrote:
>>>> Using the parent fence instead of the finished fence
>>>> to get the job status. This change is to avoid GPU
>>>> scheduler timeout error which can cause GPU reset.
>>> I'm able to reproduce crashes on Panfrost and I believe this commit is
>>> the cause. Specifically it's possible for job->s_fence->parent to be
>>> NULL.
>>>
>>> The underlying issue seems to involve drm_sched_resubmit_jobs_ext() - if
>>> the run_jobs() callback returns an error it will set s_fence->parent to
>>> NULL after signalling s_fence->finished:
>>>
>>>>          fence = sched->ops->run_job(s_job);
>>>>          i++;
>>>>
>>>>          if (IS_ERR_OR_NULL(fence)) {
>>>>              if (IS_ERR(fence))
>>>>                  dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
>>>>
>>>>              s_job->s_fence->parent = NULL;
>>> I don't understand the reasoning behind this change, but it doesn't seem
>>> right to be using the parent fence when we have code which can be
>>> setting that pointer to NULL.
>>>
>>> Since I don't understand the reasoning my only suggestion is to revert
>>> this patch (and potentially the dependent patch "dma-buf: Check status
>>> of enable-signaling bit on debug"?).
>>>
>>> Can anyone suggest a better fix?
>> Well, first of all please absolutely don't use
>> drm_sched_resubmit_jobs_ext()!
> Panfrost isn't using drm_sched_resubmit_jobs_ext() directly but via
> drm_sched_resubmit_jobs().

Yeah, but it's the same problem that this isn't designed very well.

>> It was an extremely bad idea in amdgpu to approach GPU by re-submitting
>> jobs and it was an even worse idea to push this into the scheduler.
>>
>> The design of dma_fence is that you submit that once and *only* once and
>> then get a result for this submission. If re-submission is desirable it
>> should be done in userspace or at least higher levels.
> Panfrost has an interesting feature where it's possible to rescue a job
> during a GPU reset. Because jobs are queued on the GPU if the job hasn't
> actually started executing then it's quite possible to safely resubmit
> it from the kernel driver and user space doesn't need to be involved.

That's actually fine. E.g. when you can save the hardware state and 
restart it there is nothing as far as I can see which speaks against that.

The problem is rather pushing this into the scheduler because and trying 
to fit the square pig through a round hole.

You either end up allocating memory while inside a GPU reset (which is 
illegal because allocating memory could need to wait for the reset to 
finish). Or you end up re-using the same dma_fence object twice (which 
in turn is illegal from the dma_fence design).

> The benefit of this is if another process has hung the GPU that
> processes jobs can be killed off without affecting any other innocent
> processes.
>
> One option would be to hide all this from the scheduler, but I can't see
> how to do that without also hiding the actual reset from the scheduler.
> Admittedly at the moment Panfrost is far too aggressive at resetting and
> will perform a GPU reset in conditions where it's completely
> unnecessary. There's work to do there but I haven't had the time to look
> at it yet.
>
>> Apart from that, yes a NULL check is missing here but that should be
>> trivial to fix.
> What I'm struggling to get my head round is whether it's correct to
> always treat the job as signalled just because s_fence->parent is NULL?

Well s_fence parent will never be set to something else than NULL in 
this situation, isn't it?

The problem with using the finished fence is that this is actually the 
public interface of the scheduler instead of the internal state.

In other words s_fence->parent is what the scheduler deals with to 
produce the s_fence->finished state.

Christian.

>
> Thanks,
>
> Steve
>
>> Thanks,
>> Christian.
>>
>>> Thanks,
>>>
>>> Steve
>>>
>>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>>> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>
>>>> changes in v1,v2 - Enable signaling for finished fence in sche_main()
>>>> is removed
>>>>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index e0ab14e0fb6b..2ac28ad11432 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -829,7 +829,7 @@ drm_sched_get_cleanup_job(struct
>>>> drm_gpu_scheduler *sched)
>>>>        job = list_first_entry_or_null(&sched->pending_list,
>>>>                           struct drm_sched_job, list);
>>>>    -    if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>> +    if (job && dma_fence_is_signaled(job->s_fence->parent)) {
>>>>            /* remove job from pending_list */
>>>>            list_del_init(&job->list);
>>>>    @@ -841,7 +841,7 @@ drm_sched_get_cleanup_job(struct
>>>> drm_gpu_scheduler *sched)
>>>>              if (next) {
>>>>                next->s_fence->scheduled.timestamp =
>>>> -                job->s_fence->finished.timestamp;
>>>> +                job->s_fence->parent->timestamp;
>>>>                /* start TO timer for next job */
>>>>                drm_sched_start_timeout(sched);
>>>>            }
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

