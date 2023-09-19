Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B796E7A6BDD
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 21:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbjISTzQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 15:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjISTzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 15:55:12 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC74F3
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 12:55:05 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-577e62e2adfso4678577a12.2
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 12:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695153304; x=1695758104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fcBvVL3pgNoLhCwpZhCUARJj+A64BFXVJHb3CY6w9Qc=;
        b=iHT7MU6DMKU7GpEOWXISWThtPqrwQhdk/GIRK7PJIh2hD8KVO+gooRk04YToKXKMNv
         VLltEXdRP0GF9CvhUJa8UZThGpOrkHJUIxgHxcn24G8qcbnD67ApW/eDoin+IIJHRYBF
         Ljls4YP/rjunZIhXXIoGkOw0gGlfLuLp0hD4wUUoZ9F7OjBuA7h5/HBx9zYHKvwL+eTk
         76NYZmIsQrZqSuw6k/ifGGh5zbUOnDFtQ7n8ue6jTtGYjBcGDfiTIOnF1/+a4nUWszUq
         wQLhBO3OSLHUBBOrljF7plRkaUcSQc0oHGs2++YkpuQiszV1EASukofkSpgSsAL6ugR0
         sSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695153304; x=1695758104;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcBvVL3pgNoLhCwpZhCUARJj+A64BFXVJHb3CY6w9Qc=;
        b=B4Idk+sFFY4N71ZWYVlo0WF2276H1kMteLWcDhX89UliujsDzkZBMJvx7jWVF5UeW/
         vGed8o34f11eTXOXEKyus+A6t4QyUWdKBWb3BzA0rJGc0RAFtlykF6g7JJkr5bvg7uJU
         A/+eDVkhOoptgiFCpldD4rOoh9WEi4v32ZPoeMertnEQApTmEhYtk+7vKwtu9JtzE6tg
         enuoR4ek7hT+uRFY8iQvG2fOcn804uR2Di/eWG9q8Ly8FiVugj+C0DO+NZ713MfncgWl
         ioj08yZjTJdGnW2SDxl54xEvSpfu0OMjfODvX/gsFOTYXsi5XjGQeKWfrm5nbYg1E32w
         tSFQ==
X-Gm-Message-State: AOJu0Yzv9u75WUNb5kST6r3LaPNQqbb6+ms7uspvbtIP38VXwrHvELqu
        xS5/m8YepISfvrQcRV4akHRA2A==
X-Google-Smtp-Source: AGHT+IGpPky7VgBlTkAdP7UsQEAT9Unw8TwWYZMrxBTCimqsn0uDL1DDqLQBeRXdZfwoha3P6Cz9uA==
X-Received: by 2002:a17:902:7585:b0:1b9:e972:134d with SMTP id j5-20020a170902758500b001b9e972134dmr430130pll.3.1695153304119;
        Tue, 19 Sep 2023 12:55:04 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902d2ca00b001bbf7fd354csm10330575plc.213.2023.09.19.12.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 12:55:03 -0700 (PDT)
Message-ID: <1d32914c-3a67-439f-b15d-7c7b7d6fc99b@google.com>
Date:   Tue, 19 Sep 2023 12:55:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in correct
 state
Content-Language: en-US
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org, nicolas@ndufresne.ca,
        kernel@pengutronix.de, Jayant Chowdhary <jchowdhary@google.com>
References: <20230911002451.2860049-1-m.grzeschik@pengutronix.de>
 <20230911002451.2860049-3-m.grzeschik@pengutronix.de>
 <a55b3b0c-2306-4591-8613-7be4927f0d4e@google.com>
 <ZQTpnJvTV+8Ye1si@pengutronix.de>
 <587c9b95-a80c-4bf9-b1a0-fe7ef0f4cd60@google.com>
 <ZQY5Ab+YB9FLHoQq@pengutronix.de>
 <d678b644-5f66-4c23-b2ba-6c84ba56012f@google.com>
 <ZQjEZlk2UFQgA0TF@pengutronix.de>
 <7cd81649-2795-45b6-8c10-b7df1055020d@google.com>
 <ZQnyxA1WldcqQ+k5@pengutronix.de>
From:   Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZQnyxA1WldcqQ+k5@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/19/23 12:13, Michael Grzeschik wrote:
> On Mon, Sep 18, 2023 at 04:40:07PM -0700, Avichal Rakesh wrote:
>>
>>
>> On 9/18/23 14:43, Michael Grzeschik wrote:
>>> On Mon, Sep 18, 2023 at 12:02:11PM -0700, Avichal Rakesh wrote:
>>>> On 9/16/23 16:23, Michael Grzeschik wrote:
>>>>> On Fri, Sep 15, 2023 at 07:41:05PM -0700, Avichal Rakesh wrote:
>>>>>> On 9/15/23 16:32, Michael Grzeschik wrote:
>>>>>>> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>>>>>>>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>>>>>>>> The uvc_video_enable function of the uvc-gadget driver is dequeing and
>>>>>>>>> immediately deallocs all requests on its disable codepath. This is not
>>>>>>>>> save since the dequeue function is async and does not ensure that the
>>>>>>>>> requests are left unlinked in the controller driver.
>>>>>>>>>
>>>>>>>>> By adding the ep_free_request into the completion path of the requests
>>>>>>>>> we ensure that the request will be properly deallocated.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>>>>> ---
>>>>>>>>>  drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>>>>>>>>>  1 file changed, 6 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
>>>>>>>>> index 4b6e854e30c58c..52e3666b51f743 100644
>>>>>>>>> --- a/drivers/usb/gadget/function/uvc_video.c
>>>>>>>>> +++ b/drivers/usb/gadget/function/uvc_video.c
>>>>>>>>> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>>>>>>>>>      struct uvc_device *uvc = video->uvc;
>>>>>>>>>      unsigned long flags;
>>>>>>>>>
>>>>>>>>> +    if (uvc->state == UVC_STATE_CONNECTED) {
>>>>>>>>> +        usb_ep_free_request(video->ep, ureq->req);
>>>>>>>> nit: You can probably just call usb_ep_free_request with req instead of ureq->req.
>>>>>>>
>>>>>>> Thanks, thats a good point.
>>>>>>>
>>>>>>>>> +        ureq->req = NULL;
>>>>>>>>> +        return;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>>      switch (req->status) {
>>>>>>>>>      case 0:
>>>>>>>>>          break;
>>>>>>>>
>>>>>>>> Perhaps I am missing something here, but I am not sure how this alone
>>>>>>>> fixes the use-after-free issue. uvcg_video_enable still deallocates
>>>>>>>> _all_ usb_requests right after calling usb_ep_dequeue, so it is still
>>>>>>>> possible that an unreturned request is deallocated, and now it is
>>>>>>>> possible that the complete callback accesses a deallocated ureq :(
>>>>>>>
>>>>>>> Since the issue I saw was usually coming from the list_del_entry_valid check in
>>>>>>> the list_del_entry of the giveback function, the issue was probably just not
>>>>>>> triggered anymore as the complete function did exit early.
>>>>>>>
>>>>>>> So this fix alone is actually bogus without a second patch I had in the stack.
>>>>>>> The second patch I am refering should change the actual overall issue:
>>>>>>>
>>>>>>> https://lore.kernel.org/linux-usb/20230915233113.2903645-1-m.grzeschik@pengutronix.de/T/#u
>>>>>>>
>>>>>>> This early list_del and this patch here should ensure that the
>>>>>>> concurrent functions are not handling already freed memory.
>>>>>>
>>>>>> Oh, the patch linked above is interesting. It effectively force removes the dwc3_request
>>>>>> from whatever list it belongs to? So if DWC3's interrupt handler is delayed past
>>>>>> UVC gadget's ep_free_request call, then it won't see the requests in its cancelled
>>>>>> list at all. However, this setup is still prone to errors. For example, there is now
>>>>>> a chance that gadget_ep_free_request is called twice for one request. A scheduling
>>>>>> like the following might cause double kfree:
>>>>>>
>>>>>> 1. uvcg_video_enable calls usb_ep_dequeue for all usb_requests
>>>>>> 2. While the usb_ep_dequeues are being processed, dwc3's interrupt handler starts
>>>>>>   calling the complete callbacks.
>>>>>> 3. The complete callback calls gadget_ep_free_request (calling kfree as a result)
>>>>>> 4. Meanwhile, uvcg_video_enable has moved to uvc_video_free_requests which also
>>>>>>   calls gadget_ep_free_request (calling kfree).
>>>>>>
>>>>>> There is currently (even in your patches) no synchronization between calls to
>>>>>> gadget_ep_free_request via complete callback and uvcg_video_enable, which will
>>>>>> inevitably call usb_ep_free_request twice for one request.
>>>>>>
>>>>>> Does that make sense, or am I misunderstanding some part of the patch?
>>>>>
>>>>> The overall concept is correct. But in detail the
>>>>> uvc_video_free_requests is checking that video->ureq[i].req is not NULL.
>>>>>
>>>>> With our previous call of ep_free_request in the complete handler, the
>>>>> ureq->req pointer in focus was already set to NULL. So the
>>>>> uvc_video_free_requests function will skip that extra free.
>>>>>
>>>>
>>>> Is there any form of synchronization between uvc_video_request and the
>>>> complete callback? As I see it, the dwc3 interrupt thread and the v4l2
>>>> ioctl thread (which calls uvcg_video_enable) are fully independent, so
>>>> the calls made by them are free to be interleaved arbitrarily, so an
>>>> interleaving like this is technically possible:
>>>>
>>>> +------+------------------------------------+---------------------------------------------+
>>>> | time |            ioctl_thread            |            dwc3 interrupt handler           |
>>>> +======+====================================+=============================================+
>>>> |   1  | -uvc_v4l2_streamoff                |                                             |
>>>> |   2  | |-uvcg_video_enable                |                                             |
>>>> |   3  | ||-usb_ep_dequeue                  |                                             |
>>>> |   4  | ||                                 | -dwc3_process_event_buf                     |
>>>> |   5  | ||-uvc_video_free_requests         | |                                           |
>>>> |   6  | |||                                | |-dwc3_gadget_ep_cleanup_cancelled_requests |
>>>> |   7  | |||                                | ||-dwc3_gadget_giveback                     |
>>>> |   8  | |||                                | |||-uvc_video_complete                      |
>>>> |   9  | |||-check ureq->req != NULL [true] | ||||                                        |
>>>> |  10  | ||||-usb_ep_free_request           | ||||                                        |
>>>> |  11  | |||||-dwc3_ep_free_request         | ||||                                        |
>>>> |  12  | ||||||-kfree [first call]          | ||||                                        |
>>>> |  13  | ||||                               | ||||-usb_ep_free_request                    |
>>>> |  14  | ||||                               | |||||-dwc3_ep_free_request                  |
>>>> |  15  | ||||                               | ||||||-kfree [second call]                  |
>>>> |  16  | ||||                               | ||||-set ureq->req = NULL                   |
>>>> |  17  | ||||-set ureq->req = NULL          |                                             |
>>>> +------+------------------------------------+---------------------------------------------+
>>>>
>>>> A situation like this means that dwc3_ep_free_request can be called
>>>> twice for a particular usb_request. This is obviously low probability,
>>>> but a race condition here means we'll start seeing very vague and hard
>>>> to repro crashes or memory inconsistencies when using the uvc gadget.
>>>>
>>>> I do apologize if I've missed something obvious with your changes that
>>>> prevents such interleaving. I don't currently see any locking or
>>>> other synchronization mechanism in your changes. Is there something
>>>> in dwc3 that prevents this situation?
>>>
>>> I think you have pointed it out totally clear. This is obviously the
>>> case. It just did not trigger here. But the window is there and has to
>>> be locked in some way.
>>>
>>> For now we have two options to solve it.
>>>
>>> 1) Trying to avoid this double code path of the complete callback and
>>> uvc_video_free_requests. This is what your patches are already doing.
>>>
>>> But for now I am not so pleased with the timeout concept by waiting for
>>> the complete interrupt to be called. This is also a shot in the dark as
>>> the latency depends on the scheduler and the amount of potential
>>> requests that are being handled.
>>
>> I agree, a timeout is not the most elegant of solutions and given a
>> weird enough scheduler, will run into issues as well.
>>
>>>
>>> 2) Locking both codepathes around the resource in question so the issue
>>> is avoided.
>>>
>>> However, I am also not a fried of many locks.
>>>
>>> Perhaps it is possible to use a combination of wait_for_completion in
>>> the uvc_video_free_requests and a complete callback in
>>> uvc_video_complete for those requests that are not listed in the
>>> req_free list.
>>>
>>> What do you think?
>>>
>> There might be a way that builds on your idea of cleaning up in the complete callback.
>> It would rely on having a uvc_requests that aren't bulk allocated, which may have a
>> performance impact.
> 
> Since the allocation will only be done once, this performance impact is
> should not be critical.
> 
>> I am imagining something like the following:
>>  1. Instead of allocating a bulk of uvc_requests, we allocate them
>>     one at a time and add them to uvc_video.ureq
>>  2. uvc_video.ureq becomes a list_head containing all the individual
>>     requests
>>  3. We add a sentinel flag in uvc_request that says the request is
>>     now stale. This flag is protected by uvc_video->req_lock
>>  4. uvc_video_complete looks at  this flag to deallocate both
>>     usb_request and uvc_request.
>>  5. uvcg_video_enable looks something like the following:
>>       uvcg_video_enable(...) {
>>         ...
>>         lock(req_lock);
>>         forall (uvc_requests->ureqs) {ureq->stale = true}
>>         unlock(req_lock);
>>         usb_ep_dequeue all reqs
>>
>>         uvc_video_free_requests(...)
>>         ...
>>       }
>>  6. uvc_video_complete looks something like:
>>       uvc_video_complete(...) {
>>         // at the start
>>         lock(req_lock)
>>         is_stale = ureq->stale;
>>         unlock(req_lock);
>>
>>         if (is_stale) {
>>           usb_ep_free_request();
>>           dealloc corresponding uvc_request();
>>           return;
>>         }
>>
>>         ...
>>
>>         lock(req_lock);
>>         // possible that request became stale while we were handling stuff
>>         if (!ureq->stale) {
>>           list_add_tail(&req->list, &video->req_free);
>>         } else {
>>           usb_ep_free_request();
>>           dealloc corresponding uvc_request();
>>         }
>>         unlock(req_lock);
>>       }
>>  7. uvc_video_free_requests can freely dealloc usb_requests/uvc_requests in
>>     req_free because we can be certain that uvc_video_complete won't modify
>>     it once requests have been marked stale, and the stale requests in flight
>>     will be cleaned up by the complete callback.
>>
>> Effectively, we freeze the state of req_free before dequeuing, and all
>> inflight requests are considered the responsibility of the complete handler
>> from that point onwards. The gadget is only responsible for freeing requests it
>> currently owns.
>>
>> I think this should ensure that we never have a situation where the ownership of the
>> requests are undefined, and only one thread is responsible for freeing any given request.
>>
>> Hope that makes sense!
> 
> So you found a way to secure this also with the already available
> req_lock then. Nice!
> 
> Also what you suggest is to move from the array model we currently have
> to dynamic allocation in a linked list.
> 
> I would suggest some more adaptions.
> 
> Keep to allocate all requests dynamicaly as you suggest instead of the
> bulk array.
> 
> Rewrite the uvc_video_free_requests to iterate over the video->req_free
> list instead of all available requests to take care of all requests
> that are truely freed.
> 
> Take this patch we started this thread with and expand it to
> clean up not only the usb_request but also the uvc_request
> like you suggested in your pseudo code.
> 
> Since we check for UVC_STATE_CONNECTED already in the comlete handler
> this is a superset of your stale flag anyway. And every request
> that is currently in flight is not part of the req_free list, which
> makes the uvc_video_free_requests function free to run without making
> no harm.

The downside of freeing based on UVC_STATE_CONNECTED and why it might be 
problematic is that without any other synchronization method, the complete
callback can be arbitrarily delayed for a given usb_request.

A STREAMOFF quickly followed by a STREAMON, might set uvc->state to 
UVC_STATE_STREAMING before the controller has had a chance to return the 
stale requests. This won't cause any functional issues AFAICT, but will 
cause a memory "leak" of sorts where every successive quick 
STREAMOFF-->STREAMON will lead to some extra usb_requests sticking around.
They'll eventually get freed, but it doesn't seem very responsible to increase
the memory load unless required.

The stale flag ensures that this situation never happens and even if the 
complete callbacks comes back well after  the new STREAMON event, we correctly
free the associated usb_request and uvc_request.

Hope that makes sense!

- Avi.

