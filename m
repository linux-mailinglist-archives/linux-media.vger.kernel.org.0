Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDDC7A2D89
	for <lists+linux-media@lfdr.de>; Sat, 16 Sep 2023 04:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237962AbjIPClR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Sep 2023 22:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238635AbjIPClO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Sep 2023 22:41:14 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99BE106
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 19:41:08 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-76f2843260bso179139285a.3
        for <linux-media@vger.kernel.org>; Fri, 15 Sep 2023 19:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694832068; x=1695436868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s7CgLAXDOJ9e6WmF60CbAuG+eWk/KQRBydtpsnTThtA=;
        b=paTa3fTTwcgz2o8F1WHzsSRD3CsYna9mFbA9oHjO00DxICuVQrwtvFCNbEEr5QA0vo
         lsuR7vKiRTv21gy2KKl0NpZC/E8+8tKACaVddEMGFRczBcIf/ewHQNvRE88YN+IXk8uW
         69VdhCrMXhA7ujnLRNCg5UJV/g8nWTKO54noVFlYhEVT96i7dcKve3GSmvwtGptZyZet
         5ioZyfsNk9gikdekpjfq2l5cpPjQwlQXh+lQj2FCPc2sSLToTtCpIoQA4ERvjLXuOLN4
         M3d+kTPg1qsAtHS7zbvyNEMej+Hn6QA4SCyx+bmmXK3RQbNBZOmNv+hGl4OvSOwcOn/P
         9lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694832068; x=1695436868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7CgLAXDOJ9e6WmF60CbAuG+eWk/KQRBydtpsnTThtA=;
        b=utGng0AhJjMISCh77G9uASVGZvu3eolyj2z3rH1LQbbrbF6vEOqnzpex02RFqON1bP
         tnJpXEfvk/lPJHu9Eapn38WR5dAe8xERXp5XjCx6i1MUd+MJ499EgHnXjVtDlwA3lRH7
         2K81wpdxTSvea1qv2sHWsi4BMdNXRqHfdImDbd/lHbklTWhR9paDSu4/5cmOU3icc2P3
         Uk41orekZOiB7G8FfALYWcvUHg0yIoqI8x4/O0s9yJgGvXuzS9N6SQGEP2v5RUYbzRgt
         jw445VD3zandbM52vG4jZY4YIIyakQ9xNNgKScogID7X5Ym6HGdDi3w2AqSEwZLwszsD
         n8cQ==
X-Gm-Message-State: AOJu0YxCsG2QrMx38DowxjZPIADA00BWsYZsQIPrFjslXnMJ47U6ooS5
        7E3hMscPw1lYwEgldcybKNsD8H9ZU5q5ukAhNTMood5T
X-Google-Smtp-Source: AGHT+IEthQw2CH9y8Ip3DrZKo9O2XRFB3jpd7fRpmKsa8EFzVQJxBhqXTtxDX3MqoLSM77RrJYiUuA==
X-Received: by 2002:a05:620a:222e:b0:76c:fc7c:ac5e with SMTP id n14-20020a05620a222e00b0076cfc7cac5emr2963108qkh.74.1694832067759;
        Fri, 15 Sep 2023 19:41:07 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id s24-20020aa78298000000b0068be348e35fsm3578264pfm.166.2023.09.15.19.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 19:41:06 -0700 (PDT)
Message-ID: <587c9b95-a80c-4bf9-b1a0-fe7ef0f4cd60@google.com>
Date:   Fri, 15 Sep 2023 19:41:05 -0700
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
From:   Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZQTpnJvTV+8Ye1si@pengutronix.de>
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



On 9/15/23 16:32, Michael Grzeschik wrote:
> Hi Avichal
> 
> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>> The uvc_video_enable function of the uvc-gadget driver is dequeing and
>>> immediately deallocs all requests on its disable codepath. This is not
>>> save since the dequeue function is async and does not ensure that the
>>> requests are left unlinked in the controller driver.
>>>
>>> By adding the ep_free_request into the completion path of the requests
>>> we ensure that the request will be properly deallocated.
>>>
>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>> ---
>>>  drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
>>> index 4b6e854e30c58c..52e3666b51f743 100644
>>> --- a/drivers/usb/gadget/function/uvc_video.c
>>> +++ b/drivers/usb/gadget/function/uvc_video.c
>>> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>>>      struct uvc_device *uvc = video->uvc;
>>>      unsigned long flags;
>>>
>>> +    if (uvc->state == UVC_STATE_CONNECTED) {
>>> +        usb_ep_free_request(video->ep, ureq->req);
>> nit: You can probably just call usb_ep_free_request with req instead of ureq->req.
> 
> Thanks, thats a good point.
> 
>>> +        ureq->req = NULL;
>>> +        return;
>>> +    }
>>> +
>>>      switch (req->status) {
>>>      case 0:
>>>          break;
>>
>> Perhaps I am missing something here, but I am not sure how this alone
>> fixes the use-after-free issue. uvcg_video_enable still deallocates
>> _all_ usb_requests right after calling usb_ep_dequeue, so it is still
>> possible that an unreturned request is deallocated, and now it is
>> possible that the complete callback accesses a deallocated ureq :(
> 
> Since the issue I saw was usually coming from the list_del_entry_valid check in
> the list_del_entry of the giveback function, the issue was probably just not
> triggered anymore as the complete function did exit early.
> 
> So this fix alone is actually bogus without a second patch I had in the stack.
> The second patch I am refering should change the actual overall issue:
> 
> https://lore.kernel.org/linux-usb/20230915233113.2903645-1-m.grzeschik@pengutronix.de/T/#u
> 
> This early list_del and this patch here should ensure that the
> concurrent functions are not handling already freed memory.

Oh, the patch linked above is interesting. It effectively force removes the dwc3_request
from whatever list it belongs to? So if DWC3's interrupt handler is delayed past 
UVC gadget's ep_free_request call, then it won't see the requests in its cancelled 
list at all. However, this setup is still prone to errors. For example, there is now
a chance that gadget_ep_free_request is called twice for one request. A scheduling
like the following might cause double kfree:

1. uvcg_video_enable calls usb_ep_dequeue for all usb_requests
2. While the usb_ep_dequeues are being processed, dwc3's interrupt handler starts 
   calling the complete callbacks.
3. The complete callback calls gadget_ep_free_request (calling kfree as a result)
4. Meanwhile, uvcg_video_enable has moved to uvc_video_free_requests which also
   calls gadget_ep_free_request (calling kfree).

There is currently (even in your patches) no synchronization between calls to 
gadget_ep_free_request via complete callback and uvcg_video_enable, which will 
inevitably call usb_ep_free_request twice for one request. 

Does that make sense, or am I misunderstanding some part of the patch?

- Avi.

