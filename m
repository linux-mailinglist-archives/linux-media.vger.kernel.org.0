Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 207087A5BF9
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 10:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjISIIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 04:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjISIIP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 04:08:15 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145D1115
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 01:08:08 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c4194f769fso38234125ad.3
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695110887; x=1695715687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xo0QCYH4wkdMzRKO9glnSSgct/wZRd3shLKK4I8on7A=;
        b=lc50bnf7kHB9vG2h/ethqdVRANF5+XSRUDrAb74id2uFXHd6O53xxSKzSqV3hzgNSN
         7AyJMyzFCidTZNUzWHiZs6tClfnDvQyo5pkYW27P7TkuBogJKhTxp5xwtU+TmZHSZV0S
         mF/T5FeOMi6UU7+Jg6GwHjj9pBahb5jRxGFMpHUavfzWj4h6ZXz5BE7DmZ+MWWuB9+8R
         TkQbCXMxHW4k3awYKtG795s/f26+Qw57tEOIQ2+eJdbvnJGUt262rDrtUXmrIdDfAzFp
         7nLrmRjPm3jzDB2efi6pfdVNa4FZzBugekyFTUHDv+1rfK1TUnsqMcREJcUm0rOiD2Jq
         AX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695110887; x=1695715687;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xo0QCYH4wkdMzRKO9glnSSgct/wZRd3shLKK4I8on7A=;
        b=KiDRl0z/0qbqLj9AsrlbaLOxXCQPpLD/LlkbFYD89EFMuvkHmwPQbolwyls/nVeExd
         qVZnh5LLRIe5uWZg1EUsgNs347WlBsm97fqOveQ9L8OqIjEjSTTuWJ4xrsx0Wok30zhF
         1Q7VwAssdEHBMw86+bV01SQhn9v4P2450QJdoVyBXJBdkxWd84W26zF4af0QgnkK3Fld
         O9xzfcHyz3OWAHGXc+htdG7zeXfusZCSbDHihSQhm+Z0HdJiefl8o6SO4yMekNIVeIDf
         VlB9P/VqItI97fe2Z5M+StpPub6UXcBv9Iz0/WmEhHpxHo7njxXfSPN98wb7Cq9V1L0H
         KZzg==
X-Gm-Message-State: AOJu0YxtrR0oQdg0C9734pS51A7xx2zocplbKv9Bj3MqysHkiYPYlw3S
        tG3Tkye2NkSkbZCeOKYMtfPCeA==
X-Google-Smtp-Source: AGHT+IF6z2D97WD5NMFOHhc6nVLxCzqnbFlTtzNY4CqRtLCGmOJkoPqb3HNSC7mEeDMNgTMVyjvgMQ==
X-Received: by 2002:a17:902:eaca:b0:1c4:2271:55c3 with SMTP id p10-20020a170902eaca00b001c4227155c3mr10212774pld.38.1695110887159;
        Tue, 19 Sep 2023 01:08:07 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902d38600b001bdb167f6ebsm9510565pld.94.2023.09.19.01.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 01:08:06 -0700 (PDT)
Message-ID: <a6a3266d-8b19-4f24-839b-4483738c728e@google.com>
Date:   Tue, 19 Sep 2023 01:08:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in correct
 state
Content-Language: en-US
From:   Avichal Rakesh <arakesh@google.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
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
In-Reply-To: <7cd81649-2795-45b6-8c10-b7df1055020d@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/18/23 16:40, Avichal Rakesh wrote:
> 
> 
> On 9/18/23 14:43, Michael Grzeschik wrote:
>> On Mon, Sep 18, 2023 at 12:02:11PM -0700, Avichal Rakesh wrote:
>>> On 9/16/23 16:23, Michael Grzeschik wrote:
>>>> On Fri, Sep 15, 2023 at 07:41:05PM -0700, Avichal Rakesh wrote:
>>>>> On 9/15/23 16:32, Michael Grzeschik wrote:
>>>>>> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>>>>>>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>>>>>>> The uvc_video_enable function of the uvc-gadget driver is dequeing and
>>>>>>>> immediately deallocs all requests on its disable codepath. This is not
>>>>>>>> save since the dequeue function is async and does not ensure that the
>>>>>>>> requests are left unlinked in the controller driver.
>>>>>>>>
>>>>>>>> ...
>>>
>>> I do apologize if I've missed something obvious with your changes that
>>> prevents such interleaving. I don't currently see any locking or
>>> other synchronization mechanism in your changes. Is there something
>>> in dwc3 that prevents this situation?
>>
>> I think you have pointed it out totally clear. This is obviously the
>> case. It just did not trigger here. But the window is there and has to
>> be locked in some way.
>>
>> For now we have two options to solve it.
>>
>> 1) Trying to avoid this double code path of the complete callback and
>> uvc_video_free_requests. This is what your patches are already doing.
>>
>> But for now I am not so pleased with the timeout concept by waiting for
>> the complete interrupt to be called. This is also a shot in the dark as
>> the latency depends on the scheduler and the amount of potential
>> requests that are being handled.
> 
> I agree, a timeout is not the most elegant of solutions and given a
> weird enough scheduler, will run into issues as well

.
Thinking about this some more: I still agree that a timeout seems arbitrary
and will (rightly) lead to questions along the lines of "If we can safely move
on after 500ms, why not safely move on immediately?". 

However, to me it seems more reasonable to put an indefinite wait. The uvc gadget
can wait forever for the complete callbacks to come through. This basically says
that until the usb controller returns the usb_requests back to uvc gadget, it 
can't guarantee a consistent memory state as it is responsible for managing the
usb_requests it has allocated. 

Of course there is no such thing as an indefinite wait, the watchdog will 
eventually kick in to reap the subsystem (potentially causing a kernel panic).
But it seems reasonable to say that if the usb controller is unable to 
return the usb_requests in however long it takes the watchdog to bite, 
it has no business running uvc gadget anyway.

My changes in https://lore.kernel.org/20230912041910.726442-2-arakesh@google.com
will ensure that no other control request comes in while uvc gadget is waiting,
and it should be relatively trivial to update
https://lore.kernel.org/20230912041910.726442-3-arakesh@google.com to wait 
indefinitely.

Laurent and Dan, does an indefinite wait seem more reasonable than an arbitrary wait,
or would something like the suggestion in previous email be better?

> 
>>
>> 2) Locking both codepathes around the resource in question so the issue
>> is avoided.
>>
>> However, I am also not a fried of many locks.
>>
>> Perhaps it is possible to use a combination of wait_for_completion in
>> the uvc_video_free_requests and a complete callback in
>> uvc_video_complete for those requests that are not listed in the
>> req_free list.
>>
>> What do you think?
>>
> There might be a way that builds on your idea of cleaning up in the complete callback. 
> It would rely on having a uvc_requests that aren't bulk allocated, which may have a
> performance impact. 
> 
> I am imagining something like the following:
>   1. Instead of allocating a bulk of uvc_requests, we allocate them
>      one at a time and add them to uvc_video.ureq
>   2. uvc_video.ureq becomes a list_head containing all the individual
>      requests
>   3. We add a sentinel flag in uvc_request that says the request is
>      now stale. This flag is protected by uvc_video->req_lock
>   4. uvc_video_complete looks at  this flag to deallocate both
>      usb_request and uvc_request.
>   5. uvcg_video_enable looks something like the following:
>        uvcg_video_enable(...) {
>          ...
>          lock(req_lock);
>          forall (uvc_requests->ureqs) {ureq->stale = true}
>          unlock(req_lock);
>          usb_ep_dequeue all reqs
> 
>          uvc_video_free_requests(...)
>          ...
>        }
>   6. uvc_video_complete looks something like:
>        uvc_video_complete(...) {
>          // at the start
>          lock(req_lock)
>          is_stale = ureq->stale;
>          unlock(req_lock);
> 
>          if (is_stale) {
>            usb_ep_free_request();
>            dealloc corresponding uvc_request();
>            return;
>          }
> 
>          ...
> 
>          lock(req_lock);
>          // possible that request became stale while we were handling stuff
>          if (!ureq->stale) {
>            list_add_tail(&req->list, &video->req_free);
>          } else {
>            usb_ep_free_request();
>            dealloc corresponding uvc_request();
>          }
>          unlock(req_lock);
>        }
>   7. uvc_video_free_requests can freely dealloc usb_requests/uvc_requests in 
>      req_free because we can be certain that uvc_video_complete won't modify 
>      it once requests have been marked stale, and the stale requests in flight 
>      will be cleaned up by the complete callback.
> 
> Effectively, we freeze the state of req_free before dequeuing, and all
> inflight requests are considered the responsibility of the complete handler 
> from that point onwards. The gadget is only responsible for freeing requests it 
> currently owns.
> 
> I think this should ensure that we never have a situation where the ownership of the
> requests are undefined, and only one thread is responsible for freeing any given request.
> 
> Hope that makes sense!
> 

- Avi.
