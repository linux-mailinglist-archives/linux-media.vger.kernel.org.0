Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327137A6B37
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 21:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbjISTNT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 15:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjISTNS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 15:13:18 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A628CB3
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 12:13:11 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qig9m-0007kN-4s; Tue, 19 Sep 2023 21:13:10 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qig9l-007WBp-11; Tue, 19 Sep 2023 21:13:09 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qig9k-009n6E-LF; Tue, 19 Sep 2023 21:13:08 +0200
Date:   Tue, 19 Sep 2023 21:13:08 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org, nicolas@ndufresne.ca,
        kernel@pengutronix.de, Jayant Chowdhary <jchowdhary@google.com>
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in
 correct state
Message-ID: <ZQnyxA1WldcqQ+k5@pengutronix.de>
References: <20230911002451.2860049-1-m.grzeschik@pengutronix.de>
 <20230911002451.2860049-3-m.grzeschik@pengutronix.de>
 <a55b3b0c-2306-4591-8613-7be4927f0d4e@google.com>
 <ZQTpnJvTV+8Ye1si@pengutronix.de>
 <587c9b95-a80c-4bf9-b1a0-fe7ef0f4cd60@google.com>
 <ZQY5Ab+YB9FLHoQq@pengutronix.de>
 <d678b644-5f66-4c23-b2ba-6c84ba56012f@google.com>
 <ZQjEZlk2UFQgA0TF@pengutronix.de>
 <7cd81649-2795-45b6-8c10-b7df1055020d@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DqD8sUUSySz3ajyR"
Content-Disposition: inline
In-Reply-To: <7cd81649-2795-45b6-8c10-b7df1055020d@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--DqD8sUUSySz3ajyR
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 04:40:07PM -0700, Avichal Rakesh wrote:
>
>
>On 9/18/23 14:43, Michael Grzeschik wrote:
>> On Mon, Sep 18, 2023 at 12:02:11PM -0700, Avichal Rakesh wrote:
>>> On 9/16/23 16:23, Michael Grzeschik wrote:
>>>> On Fri, Sep 15, 2023 at 07:41:05PM -0700, Avichal Rakesh wrote:
>>>>> On 9/15/23 16:32, Michael Grzeschik wrote:
>>>>>> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>>>>>>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>>>>>>> The uvc_video_enable function of the uvc-gadget driver is dequeing=
 and
>>>>>>>> immediately deallocs all requests on its disable codepath. This is=
 not
>>>>>>>> save since the dequeue function is async and does not ensure that =
the
>>>>>>>> requests are left unlinked in the controller driver.
>>>>>>>>
>>>>>>>> By adding the ep_free_request into the completion path of the requ=
ests
>>>>>>>> we ensure that the request will be properly deallocated.
>>>>>>>>
>>>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>>>> ---
>>>>>>>> =A0drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>>>>>>>> =A01 file changed, 6 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb=
/gadget/function/uvc_video.c
>>>>>>>> index 4b6e854e30c58c..52e3666b51f743 100644
>>>>>>>> --- a/drivers/usb/gadget/function/uvc_video.c
>>>>>>>> +++ b/drivers/usb/gadget/function/uvc_video.c
>>>>>>>> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct =
usb_request *req)
>>>>>>>> =A0=A0=A0=A0 struct uvc_device *uvc =3D video->uvc;
>>>>>>>> =A0=A0=A0=A0 unsigned long flags;
>>>>>>>>
>>>>>>>> +=A0=A0=A0 if (uvc->state =3D=3D UVC_STATE_CONNECTED) {
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 usb_ep_free_request(video->ep, ureq->req);
>>>>>>> nit: You can probably just call usb_ep_free_request with req instea=
d of ureq->req.
>>>>>>
>>>>>> Thanks, thats a good point.
>>>>>>
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 ureq->req =3D NULL;
>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 return;
>>>>>>>> +=A0=A0=A0 }
>>>>>>>> +
>>>>>>>> =A0=A0=A0=A0 switch (req->status) {
>>>>>>>> =A0=A0=A0=A0 case 0:
>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 break;
>>>>>>>
>>>>>>> Perhaps I am missing something here, but I am not sure how this alo=
ne
>>>>>>> fixes the use-after-free issue. uvcg_video_enable still deallocates
>>>>>>> _all_ usb_requests right after calling usb_ep_dequeue, so it is sti=
ll
>>>>>>> possible that an unreturned request is deallocated, and now it is
>>>>>>> possible that the complete callback accesses a deallocated ureq :(
>>>>>>
>>>>>> Since the issue I saw was usually coming from the list_del_entry_val=
id check in
>>>>>> the list_del_entry of the giveback function, the issue was probably =
just not
>>>>>> triggered anymore as the complete function did exit early.
>>>>>>
>>>>>> So this fix alone is actually bogus without a second patch I had in =
the stack.
>>>>>> The second patch I am refering should change the actual overall issu=
e:
>>>>>>
>>>>>> https://lore.kernel.org/linux-usb/20230915233113.2903645-1-m.grzesch=
ik@pengutronix.de/T/#u
>>>>>>
>>>>>> This early list_del and this patch here should ensure that the
>>>>>> concurrent functions are not handling already freed memory.
>>>>>
>>>>> Oh, the patch linked above is interesting. It effectively force remov=
es the dwc3_request
>>>>> from whatever list it belongs to? So if DWC3's interrupt handler is d=
elayed past
>>>>> UVC gadget's ep_free_request call, then it won't see the requests in =
its cancelled
>>>>> list at all. However, this setup is still prone to errors. For exampl=
e, there is now
>>>>> a chance that gadget_ep_free_request is called twice for one request.=
 A scheduling
>>>>> like the following might cause double kfree:
>>>>>
>>>>> 1. uvcg_video_enable calls usb_ep_dequeue for all usb_requests
>>>>> 2. While the usb_ep_dequeues are being processed, dwc3's interrupt ha=
ndler starts
>>>>> =A0 calling the complete callbacks.
>>>>> 3. The complete callback calls gadget_ep_free_request (calling kfree =
as a result)
>>>>> 4. Meanwhile, uvcg_video_enable has moved to uvc_video_free_requests =
which also
>>>>> =A0 calls gadget_ep_free_request (calling kfree).
>>>>>
>>>>> There is currently (even in your patches) no synchronization between =
calls to
>>>>> gadget_ep_free_request via complete callback and uvcg_video_enable, w=
hich will
>>>>> inevitably call usb_ep_free_request twice for one request.
>>>>>
>>>>> Does that make sense, or am I misunderstanding some part of the patch?
>>>>
>>>> The overall concept is correct. But in detail the
>>>> uvc_video_free_requests is checking that video->ureq[i].req is not NUL=
L.
>>>>
>>>> With our previous call of ep_free_request in the complete handler, the
>>>> ureq->req pointer in focus was already set to NULL. So the
>>>> uvc_video_free_requests function will skip that extra free.
>>>>
>>>
>>> Is there any form of synchronization between uvc_video_request and the
>>> complete callback? As I see it, the dwc3 interrupt thread and the v4l2
>>> ioctl thread (which calls uvcg_video_enable) are fully independent, so
>>> the calls made by them are free to be interleaved arbitrarily, so an
>>> interleaving like this is technically possible:
>>>
>>> +------+------------------------------------+--------------------------=
-------------------+
>>> | time |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ioctl_thread=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dwc3 interrupt handle=
r=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> +=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>>> |=A0=A0 1=A0 | -uvc_v4l2_streamoff=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0=A0 2=A0 | |-uvcg_video_enable=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0=A0 3=A0 | ||-usb_ep_dequeue=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0=A0 4=A0 | ||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | -dwc3_process_event_buf=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0=A0 5=A0 | ||-uvc_video_free_requests=A0=A0=A0=A0=A0=A0=A0=A0 | |=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0=A0 6=A0 | |||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |-dwc3_gadget_ep_cleanup_cance=
lled_requests |
>>> |=A0=A0 7=A0 | |||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | ||-dwc3_gadget_giveback=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0=A0 8=A0 | |||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |||-uvc_video_complete=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0=A0 9=A0 | |||-check ureq->req !=3D NULL [true] | ||||=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0 10=A0 | ||||-usb_ep_free_request=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |=
|||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0 11=A0 | |||||-dwc3_ep_free_request=A0=A0=A0=A0=A0=A0=A0=A0 | ||||=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0 12=A0 | ||||||-kfree [first call]=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |||=
|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0 13=A0 | ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | ||||-usb_ep_free_request=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0 14=A0 | ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |||||-dwc3_ep_free_request=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0 15=A0 | ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | ||||||-kfree [second call]=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0 16=A0 | ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | ||||-set ureq->req =3D NULL=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> |=A0 17=A0 | ||||-set ureq->req =3D NULL=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>> +------+------------------------------------+--------------------------=
-------------------+
>>>
>>> A situation like this means that dwc3_ep_free_request can be called
>>> twice for a particular usb_request. This is obviously low probability,
>>> but a race condition here means we'll start seeing very vague and hard
>>> to repro crashes or memory inconsistencies when using the uvc gadget.
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
>I agree, a timeout is not the most elegant of solutions and given a
>weird enough scheduler, will run into issues as well.
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
>There might be a way that builds on your idea of cleaning up in the comple=
te callback.
>It would rely on having a uvc_requests that aren't bulk allocated, which m=
ay have a
>performance impact.

Since the allocation will only be done once, this performance impact is
should not be critical.

>I am imagining something like the following:
>  1. Instead of allocating a bulk of uvc_requests, we allocate them
>     one at a time and add them to uvc_video.ureq
>  2. uvc_video.ureq becomes a list_head containing all the individual
>     requests
>  3. We add a sentinel flag in uvc_request that says the request is
>     now stale. This flag is protected by uvc_video->req_lock
>  4. uvc_video_complete looks at  this flag to deallocate both
>     usb_request and uvc_request.
>  5. uvcg_video_enable looks something like the following:
>       uvcg_video_enable(...) {
>         ...
>         lock(req_lock);
>         forall (uvc_requests->ureqs) {ureq->stale =3D true}
>         unlock(req_lock);
>         usb_ep_dequeue all reqs
>
>         uvc_video_free_requests(...)
>         ...
>       }
>  6. uvc_video_complete looks something like:
>       uvc_video_complete(...) {
>         // at the start
>         lock(req_lock)
>         is_stale =3D ureq->stale;
>         unlock(req_lock);
>
>         if (is_stale) {
>           usb_ep_free_request();
>           dealloc corresponding uvc_request();
>           return;
>         }
>
>         ...
>
>         lock(req_lock);
>         // possible that request became stale while we were handling stuff
>         if (!ureq->stale) {
>           list_add_tail(&req->list, &video->req_free);
>         } else {
>           usb_ep_free_request();
>           dealloc corresponding uvc_request();
>         }
>         unlock(req_lock);
>       }
>  7. uvc_video_free_requests can freely dealloc usb_requests/uvc_requests =
in
>     req_free because we can be certain that uvc_video_complete won't modi=
fy
>     it once requests have been marked stale, and the stale requests in fl=
ight
>     will be cleaned up by the complete callback.
>
>Effectively, we freeze the state of req_free before dequeuing, and all
>inflight requests are considered the responsibility of the complete handler
>from that point onwards. The gadget is only responsible for freeing reques=
ts it
>currently owns.
>
>I think this should ensure that we never have a situation where the owners=
hip of the
>requests are undefined, and only one thread is responsible for freeing any=
 given request.
>
>Hope that makes sense!

So you found a way to secure this also with the already available
req_lock then. Nice!

Also what you suggest is to move from the array model we currently have
to dynamic allocation in a linked list.

I would suggest some more adaptions.

Keep to allocate all requests dynamicaly as you suggest instead of the
bulk array.

Rewrite the uvc_video_free_requests to iterate over the video->req_free
list instead of all available requests to take care of all requests
that are truely freed.

Take this patch we started this thread with and expand it to
clean up not only the usb_request but also the uvc_request
like you suggested in your pseudo code.

Since we check for UVC_STATE_CONNECTED already in the comlete handler
this is a superset of your stale flag anyway. And every request
that is currently in flight is not part of the req_free list, which
makes the uvc_video_free_requests function free to run without making
no harm.

Does this sound better?

Regards,
Michael


--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--DqD8sUUSySz3ajyR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUJ8sIACgkQC+njFXoe
LGRT6Q//WZ1lp5B4eJ2ZlAm4v0rYB002MWjH1Y39oVZmDqz8BE0K+N1gtqif7xzl
CEmHY6UelU6yrx6IANx8chVIHhGUZw8WQ7x74kkkbUO930FTckry/iJeeRRAc+2o
fIK5uTFxcprefKdge8e0mzrnbj1WaTwgz4ElJos7BVWP/K7D/jM6MndlCkaqMEKz
BtwHdi6tlWJ6a5eVbF9nksS3C3dmAe4I2wOq4IyztME5xqBToULheI9xXSLGzxTt
xlS5ESMSxc2uzU3tDN8Aho7BeB5NBVnP4xhNdRREPoNoBlVdlYz2xJpaHv/n+8a4
59Zw9P/xcv8562n/3+tXclwuFagxFlo0QT7XO2GrSTYKWxauC45SfY0Jaa2xWk0t
ppuA3YKWWoq1K8TLDltfZ341HMzQ9Xa3RpmsDaJOB7la6VtgsllV0vtusxqWg/Gg
0C6ST90YtftYgoGpXhvz2wUC3Gsb7YEjuU7bEqFu4+j71tJXmkRvKE1wQbp4gN2m
oBN0wx+DH1nll3tgfNZs6lDCJiSD8MNAu7iA7tbETUR8FYlauwtFg+vRG4ajnvJh
aXKufZJerIyzS6Bq7IviRcSDyAq+KuTDQnpXG5x3ee5QSMSNrPJBMHTsuxA8Pmtl
ztM62qsxGozf+pVmms3wEAWB4cJINyxhbwOZjl8yGQak8FlMN9g=
=ZZrm
-----END PGP SIGNATURE-----

--DqD8sUUSySz3ajyR--
