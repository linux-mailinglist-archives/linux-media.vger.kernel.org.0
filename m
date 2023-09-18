Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 576C27A563E
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 01:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjIRXkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 19:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjIRXkR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 19:40:17 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6796299
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 16:40:11 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c47309a8ccso12658375ad.1
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 16:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695080411; x=1695685211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R1kfv+EFkPB6JdiOzuLODVRnEJ078J+0nuq2YUCWXK4=;
        b=MPDf2B1jnahCYwRV+JPf0wJSi7fko8+TEqHAnBFNcaf/eZnlX3v+J2xTKahHGkRVvK
         r2E/+lpWnOe1EGAlyQ4IRqWB006pHaP9cBaE83vMl2rT2eDwCPFIMaA1y+V3tvg3anml
         iuQ2qEiCDfqzymvzcmN1ZzZvDkQQh20hILbyvEcbzAD5C5WGUgWcaSPS8sNwFgTT3T7T
         itVVb4mzImzBojUCsTnJyObgT2uHPPfCkrOMLtR9DTv/JZPJF7GwcsjJaW2RtPlZRmuf
         2stEoLH22VIE1tA+5lbm+0e/PC2tzBW1jq5D13Oc80WIjxYpu4J1x+gqLO3CyUYaz7VE
         N3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695080411; x=1695685211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1kfv+EFkPB6JdiOzuLODVRnEJ078J+0nuq2YUCWXK4=;
        b=rJzUA3vJOP/862rceZiOMidTvL/xbLobrBIkXtMHsXhxJiRYidf1CNCqkrwzYHVEv/
         78ksAidLxDeCzWM80waY+56KZv1/Rg4kZs0PrnxFNHeFt9iYsoVTCMMJmEvkSsrOsqZj
         +bCOZyqRXGsPkXRmaw2LrAlMNbA7byPPxrxAHiiRO8GKOEPHwQzsilbU8fkDxh+lXAbl
         c3GkLpNg9ELVabgCwd0LQvyNjitPbrLhlM6xJgchgCGqkOnPwS/crHbsYmmkULAwA/gc
         dFNGq/4++CL+jDiN0YWXo2+7eMm4Eu1VIhFAsY8CmuOllT58E1+5ZXAUie0SqoDbPH1Q
         56wg==
X-Gm-Message-State: AOJu0Yzwh/M1a+JeKmlC+HfgNbJQmZInHuMMd5zx9cyWa7FsYNlEUoI+
        NQ0p0ahX30GeBaYBAwo+jU5hMw==
X-Google-Smtp-Source: AGHT+IHm7A+5n4Qii5Wkqt+Iwaw6ejilrdDG7xUjW+I6SN7/bXPhljU4XozrY2Ic/Dln/SXJNmpqYw==
X-Received: by 2002:a17:903:228b:b0:1c3:81b7:2385 with SMTP id b11-20020a170903228b00b001c381b72385mr1289084plh.11.1695080410506;
        Mon, 18 Sep 2023 16:40:10 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id c21-20020a170902c1d500b001bb8895848bsm2670537plc.71.2023.09.18.16.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 16:40:09 -0700 (PDT)
Message-ID: <7cd81649-2795-45b6-8c10-b7df1055020d@google.com>
Date:   Mon, 18 Sep 2023 16:40:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in correct
 state
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
Content-Language: en-US
From:   Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZQjEZlk2UFQgA0TF@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 9/18/23 14:43, Michael Grzeschik wrote:
> On Mon, Sep 18, 2023 at 12:02:11PM -0700, Avichal Rakesh wrote:
>> On 9/16/23 16:23, Michael Grzeschik wrote:
>>> On Fri, Sep 15, 2023 at 07:41:05PM -0700, Avichal Rakesh wrote:
>>>> On 9/15/23 16:32, Michael Grzeschik wrote:
>>>>> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>>>>>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>>>>>> The uvc_video_enable function of the uvc-gadget driver is dequeing and
>>>>>>> immediately deallocs all requests on its disable codepath. This is not
>>>>>>> save since the dequeue function is async and does not ensure that the
>>>>>>> requests are left unlinked in the controller driver.
>>>>>>>
>>>>>>> By adding the ep_free_request into the completion path of the requests
>>>>>>> we ensure that the request will be properly deallocated.
>>>>>>>
>>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>>> ---
>>>>>>>  drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>>>>>>>  1 file changed, 6 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
>>>>>>> index 4b6e854e30c58c..52e3666b51f743 100644
>>>>>>> --- a/drivers/usb/gadget/function/uvc_video.c
>>>>>>> +++ b/drivers/usb/gadget/function/uvc_video.c
>>>>>>> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>>>>>>>      struct uvc_device *uvc = video->uvc;
>>>>>>>      unsigned long flags;
>>>>>>>
>>>>>>> +    if (uvc->state == UVC_STATE_CONNECTED) {
>>>>>>> +        usb_ep_free_request(video->ep, ureq->req);
>>>>>> nit: You can probably just call usb_ep_free_request with req instead of ureq->req.
>>>>>
>>>>> Thanks, thats a good point.
>>>>>
>>>>>>> +        ureq->req = NULL;
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>>      switch (req->status) {
>>>>>>>      case 0:
>>>>>>>          break;
>>>>>>
>>>>>> Perhaps I am missing something here, but I am not sure how this alone
>>>>>> fixes the use-after-free issue. uvcg_video_enable still deallocates
>>>>>> _all_ usb_requests right after calling usb_ep_dequeue, so it is still
>>>>>> possible that an unreturned request is deallocated, and now it is
>>>>>> possible that the complete callback accesses a deallocated ureq :(
>>>>>
>>>>> Since the issue I saw was usually coming from the list_del_entry_valid check in
>>>>> the list_del_entry of the giveback function, the issue was probably just not
>>>>> triggered anymore as the complete function did exit early.
>>>>>
>>>>> So this fix alone is actually bogus without a second patch I had in the stack.
>>>>> The second patch I am refering should change the actual overall issue:
>>>>>
>>>>> https://lore.kernel.org/linux-usb/20230915233113.2903645-1-m.grzeschik@pengutronix.de/T/#u
>>>>>
>>>>> This early list_del and this patch here should ensure that the
>>>>> concurrent functions are not handling already freed memory.
>>>>
>>>> Oh, the patch linked above is interesting. It effectively force removes the dwc3_request
>>>> from whatever list it belongs to? So if DWC3's interrupt handler is delayed past
>>>> UVC gadget's ep_free_request call, then it won't see the requests in its cancelled
>>>> list at all. However, this setup is still prone to errors. For example, there is now
>>>> a chance that gadget_ep_free_request is called twice for one request. A scheduling
>>>> like the following might cause double kfree:
>>>>
>>>> 1. uvcg_video_enable calls usb_ep_dequeue for all usb_requests
>>>> 2. While the usb_ep_dequeues are being processed, dwc3's interrupt handler starts
>>>>   calling the complete callbacks.
>>>> 3. The complete callback calls gadget_ep_free_request (calling kfree as a result)
>>>> 4. Meanwhile, uvcg_video_enable has moved to uvc_video_free_requests which also
>>>>   calls gadget_ep_free_request (calling kfree).
>>>>
>>>> There is currently (even in your patches) no synchronization between calls to
>>>> gadget_ep_free_request via complete callback and uvcg_video_enable, which will
>>>> inevitably call usb_ep_free_request twice for one request.
>>>>
>>>> Does that make sense, or am I misunderstanding some part of the patch?
>>>
>>> The overall concept is correct. But in detail the
>>> uvc_video_free_requests is checking that video->ureq[i].req is not NULL.
>>>
>>> With our previous call of ep_free_request in the complete handler, the
>>> ureq->req pointer in focus was already set to NULL. So the
>>> uvc_video_free_requests function will skip that extra free.
>>>
>>
>> Is there any form of synchronization between uvc_video_request and the
>> complete callback? As I see it, the dwc3 interrupt thread and the v4l2
>> ioctl thread (which calls uvcg_video_enable) are fully independent, so
>> the calls made by them are free to be interleaved arbitrarily, so an
>> interleaving like this is technically possible:
>>
>> +------+------------------------------------+---------------------------------------------+
>> | time |            ioctl_thread            |            dwc3 interrupt handler           |
>> +======+====================================+=============================================+
>> |   1  | -uvc_v4l2_streamoff                |                                             |
>> |   2  | |-uvcg_video_enable                |                                             |
>> |   3  | ||-usb_ep_dequeue                  |                                             |
>> |   4  | ||                                 | -dwc3_process_event_buf                     |
>> |   5  | ||-uvc_video_free_requests         | |                                           |
>> |   6  | |||                                | |-dwc3_gadget_ep_cleanup_cancelled_requests |
>> |   7  | |||                                | ||-dwc3_gadget_giveback                     |
>> |   8  | |||                                | |||-uvc_video_complete                      |
>> |   9  | |||-check ureq->req != NULL [true] | ||||                                        |
>> |  10  | ||||-usb_ep_free_request           | ||||                                        |
>> |  11  | |||||-dwc3_ep_free_request         | ||||                                        |
>> |  12  | ||||||-kfree [first call]          | ||||                                        |
>> |  13  | ||||                               | ||||-usb_ep_free_request                    |
>> |  14  | ||||                               | |||||-dwc3_ep_free_request                  |
>> |  15  | ||||                               | ||||||-kfree [second call]                  |
>> |  16  | ||||                               | ||||-set ureq->req = NULL                   |
>> |  17  | ||||-set ureq->req = NULL          |                                             |
>> +------+------------------------------------+---------------------------------------------+
>>
>> A situation like this means that dwc3_ep_free_request can be called
>> twice for a particular usb_request. This is obviously low probability,
>> but a race condition here means we'll start seeing very vague and hard
>> to repro crashes or memory inconsistencies when using the uvc gadget.
>>
>> I do apologize if I've missed something obvious with your changes that
>> prevents such interleaving. I don't currently see any locking or
>> other synchronization mechanism in your changes. Is there something
>> in dwc3 that prevents this situation?
> 
> I think you have pointed it out totally clear. This is obviously the
> case. It just did not trigger here. But the window is there and has to
> be locked in some way.
> 
> For now we have two options to solve it.
> 
> 1) Trying to avoid this double code path of the complete callback and
> uvc_video_free_requests. This is what your patches are already doing.
> 
> But for now I am not so pleased with the timeout concept by waiting for
> the complete interrupt to be called. This is also a shot in the dark as
> the latency depends on the scheduler and the amount of potential
> requests that are being handled.

I agree, a timeout is not the most elegant of solutions and given a
weird enough scheduler, will run into issues as well.

> 
> 2) Locking both codepathes around the resource in question so the issue
> is avoided.
> 
> However, I am also not a fried of many locks.
> 
> Perhaps it is possible to use a combination of wait_for_completion in
> the uvc_video_free_requests and a complete callback in
> uvc_video_complete for those requests that are not listed in the
> req_free list.
> 
> What do you think?
> 
There might be a way that builds on your idea of cleaning up in the complete callback. 
It would rely on having a uvc_requests that aren't bulk allocated, which may have a
performance impact. 

I am imagining something like the following:
  1. Instead of allocating a bulk of uvc_requests, we allocate them
     one at a time and add them to uvc_video.ureq
  2. uvc_video.ureq becomes a list_head containing all the individual
     requests
  3. We add a sentinel flag in uvc_request that says the request is
     now stale. This flag is protected by uvc_video->req_lock
  4. uvc_video_complete looks at  this flag to deallocate both
     usb_request and uvc_request.
  5. uvcg_video_enable looks something like the following:
       uvcg_video_enable(...) {
         ...
         lock(req_lock);
         forall (uvc_requests->ureqs) {ureq->stale = true}
         unlock(req_lock);
         usb_ep_dequeue all reqs

         uvc_video_free_requests(...)
         ...
       }
  6. uvc_video_complete looks something like:
       uvc_video_complete(...) {
         // at the start
         lock(req_lock)
         is_stale = ureq->stale;
         unlock(req_lock);

         if (is_stale) {
           usb_ep_free_request();
           dealloc corresponding uvc_request();
           return;
         }

         ...

         lock(req_lock);
         // possible that request became stale while we were handling stuff
         if (!ureq->stale) {
           list_add_tail(&req->list, &video->req_free);
         } else {
           usb_ep_free_request();
           dealloc corresponding uvc_request();
         }
         unlock(req_lock);
       }
  7. uvc_video_free_requests can freely dealloc usb_requests/uvc_requests in 
     req_free because we can be certain that uvc_video_complete won't modify 
     it once requests have been marked stale, and the stale requests in flight 
     will be cleaned up by the complete callback.

Effectively, we freeze the state of req_free before dequeuing, and all
inflight requests are considered the responsibility of the complete handler 
from that point onwards. The gadget is only responsible for freeing requests it 
currently owns.

I think this should ensure that we never have a situation where the ownership of the
requests are undefined, and only one thread is responsible for freeing any given request.

Hope that makes sense!

- Avi.
