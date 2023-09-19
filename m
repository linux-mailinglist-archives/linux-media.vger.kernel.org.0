Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4BD7A6CD3
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 23:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233342AbjISVQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 17:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbjISVQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 17:16:34 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B7BAF
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 14:16:27 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qii53-0005lQ-GP; Tue, 19 Sep 2023 23:16:25 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qii52-007Xif-RW; Tue, 19 Sep 2023 23:16:24 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qii52-009oOf-6l; Tue, 19 Sep 2023 23:16:24 +0200
Date:   Tue, 19 Sep 2023 23:16:24 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org, nicolas@ndufresne.ca,
        kernel@pengutronix.de, Jayant Chowdhary <jchowdhary@google.com>
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in
 correct state
Message-ID: <ZQoPqLUfDBaO9VIh@pengutronix.de>
References: <ZQTpnJvTV+8Ye1si@pengutronix.de>
 <587c9b95-a80c-4bf9-b1a0-fe7ef0f4cd60@google.com>
 <ZQY5Ab+YB9FLHoQq@pengutronix.de>
 <d678b644-5f66-4c23-b2ba-6c84ba56012f@google.com>
 <ZQjEZlk2UFQgA0TF@pengutronix.de>
 <7cd81649-2795-45b6-8c10-b7df1055020d@google.com>
 <ZQnyxA1WldcqQ+k5@pengutronix.de>
 <1d32914c-3a67-439f-b15d-7c7b7d6fc99b@google.com>
 <ZQn/eSaSqd8cgux5@pengutronix.de>
 <45add13c-ffa4-4cd1-be1b-6888fb011534@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nb24PsWMp4VK9kjT"
Content-Disposition: inline
In-Reply-To: <45add13c-ffa4-4cd1-be1b-6888fb011534@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--nb24PsWMp4VK9kjT
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 01:22:42PM -0700, Avichal Rakesh wrote:
>
>
>On 9/19/23 13:07, Michael Grzeschik wrote:
>> On Tue, Sep 19, 2023 at 12:55:02PM -0700, Avichal Rakesh wrote:
>>> On 9/19/23 12:13, Michael Grzeschik wrote:
>>>> On Mon, Sep 18, 2023 at 04:40:07PM -0700, Avichal Rakesh wrote:
>>>>>
>>>>>
>>>>> On 9/18/23 14:43, Michael Grzeschik wrote:
>>>>>> On Mon, Sep 18, 2023 at 12:02:11PM -0700, Avichal Rakesh wrote:
>>>>>>> On 9/16/23 16:23, Michael Grzeschik wrote:
>>>>>>>> On Fri, Sep 15, 2023 at 07:41:05PM -0700, Avichal Rakesh wrote:
>>>>>>>>> On 9/15/23 16:32, Michael Grzeschik wrote:
>>>>>>>>>> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>>>>>>>>>>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>>>>>>>>>>> The uvc_video_enable function of the uvc-gadget driver is dequ=
eing and
>>>>>>>>>>>> immediately deallocs all requests on its disable codepath. Thi=
s is not
>>>>>>>>>>>> save since the dequeue function is async and does not ensure t=
hat the
>>>>>>>>>>>> requests are left unlinked in the controller driver.
>>>>>>>>>>>>
>>>>>>>>>>>> By adding the ep_free_request into the completion path of the =
requests
>>>>>>>>>>>> we ensure that the request will be properly deallocated.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>>>>>>>> ---
>>>>>>>>>>>> =A0drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>>>>>>>>>>>> =A01 file changed, 6 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers=
/usb/gadget/function/uvc_video.c
>>>>>>>>>>>> index 4b6e854e30c58c..52e3666b51f743 100644
>>>>>>>>>>>> --- a/drivers/usb/gadget/function/uvc_video.c
>>>>>>>>>>>> +++ b/drivers/usb/gadget/function/uvc_video.c
>>>>>>>>>>>> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, str=
uct usb_request *req)
>>>>>>>>>>>> =A0=A0=A0=A0 struct uvc_device *uvc =3D video->uvc;
>>>>>>>>>>>> =A0=A0=A0=A0 unsigned long flags;
>>>>>>>>>>>>
>>>>>>>>>>>> +=A0=A0=A0 if (uvc->state =3D=3D UVC_STATE_CONNECTED) {
>>>>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 usb_ep_free_request(video->ep, ureq->re=
q);
>>>>>>>>>>> nit: You can probably just call usb_ep_free_request with req in=
stead of ureq->req.
>>>>>>>>>>
>>>>>>>>>> Thanks, thats a good point.
>>>>>>>>>>
>>>>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 ureq->req =3D NULL;
>>>>>>>>>>>> +=A0=A0=A0=A0=A0=A0=A0 return;
>>>>>>>>>>>> +=A0=A0=A0 }
>>>>>>>>>>>> +
>>>>>>>>>>>> =A0=A0=A0=A0 switch (req->status) {
>>>>>>>>>>>> =A0=A0=A0=A0 case 0:
>>>>>>>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 break;
>>>>>>>>>>>
>>>>>>>>>>> Perhaps I am missing something here, but I am not sure how this=
 alone
>>>>>>>>>>> fixes the use-after-free issue. uvcg_video_enable still dealloc=
ates
>>>>>>>>>>> _all_ usb_requests right after calling usb_ep_dequeue, so it is=
 still
>>>>>>>>>>> possible that an unreturned request is deallocated, and now it =
is
>>>>>>>>>>> possible that the complete callback accesses a deallocated ureq=
 :(
>>>>>>>>>>
>>>>>>>>>> Since the issue I saw was usually coming from the list_del_entry=
_valid check in
>>>>>>>>>> the list_del_entry of the giveback function, the issue was proba=
bly just not
>>>>>>>>>> triggered anymore as the complete function did exit early.
>>>>>>>>>>
>>>>>>>>>> So this fix alone is actually bogus without a second patch I had=
 in the stack.
>>>>>>>>>> The second patch I am refering should change the actual overall =
issue:
>>>>>>>>>>
>>>>>>>>>> https://lore.kernel.org/linux-usb/20230915233113.2903645-1-m.grz=
eschik@pengutronix.de/T/#u
>>>>>>>>>>
>>>>>>>>>> This early list_del and this patch here should ensure that the
>>>>>>>>>> concurrent functions are not handling already freed memory.
>>>>>>>>>
>>>>>>>>> Oh, the patch linked above is interesting. It effectively force r=
emoves the dwc3_request
>>>>>>>>> from whatever list it belongs to? So if DWC3's interrupt handler =
is delayed past
>>>>>>>>> UVC gadget's ep_free_request call, then it won't see the requests=
 in its cancelled
>>>>>>>>> list at all. However, this setup is still prone to errors. For ex=
ample, there is now
>>>>>>>>> a chance that gadget_ep_free_request is called twice for one requ=
est. A scheduling
>>>>>>>>> like the following might cause double kfree:
>>>>>>>>>
>>>>>>>>> 1. uvcg_video_enable calls usb_ep_dequeue for all usb_requests
>>>>>>>>> 2. While the usb_ep_dequeues are being processed, dwc3's interrup=
t handler starts
>>>>>>>>> =A0 calling the complete callbacks.
>>>>>>>>> 3. The complete callback calls gadget_ep_free_request (calling kf=
ree as a result)
>>>>>>>>> 4. Meanwhile, uvcg_video_enable has moved to uvc_video_free_reque=
sts which also
>>>>>>>>> =A0 calls gadget_ep_free_request (calling kfree).
>>>>>>>>>
>>>>>>>>> There is currently (even in your patches) no synchronization betw=
een calls to
>>>>>>>>> gadget_ep_free_request via complete callback and uvcg_video_enabl=
e, which will
>>>>>>>>> inevitably call usb_ep_free_request twice for one request.
>>>>>>>>>
>>>>>>>>> Does that make sense, or am I misunderstanding some part of the p=
atch?
>>>>>>>>
>>>>>>>> The overall concept is correct. But in detail the
>>>>>>>> uvc_video_free_requests is checking that video->ureq[i].req is not=
 NULL.
>>>>>>>>
>>>>>>>> With our previous call of ep_free_request in the complete handler,=
 the
>>>>>>>> ureq->req pointer in focus was already set to NULL. So the
>>>>>>>> uvc_video_free_requests function will skip that extra free.
>>>>>>>>
>>>>>>>
>>>>>>> Is there any form of synchronization between uvc_video_request and =
the
>>>>>>> complete callback? As I see it, the dwc3 interrupt thread and the v=
4l2
>>>>>>> ioctl thread (which calls uvcg_video_enable) are fully independent,=
 so
>>>>>>> the calls made by them are free to be interleaved arbitrarily, so an
>>>>>>> interleaving like this is technically possible:
>>>>>>>
>>>>>>> +------+------------------------------------+----------------------=
-----------------------+
>>>>>>> | time |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ioctl_thread=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dwc3 interrupt han=
dler=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> +=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>>>>>>> |=A0=A0 1=A0 | -uvc_v4l2_streamoff=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0=A0 2=A0 | |-uvcg_video_enable=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0=A0 3=A0 | ||-usb_ep_dequeue=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 |
>>>>>>> |=A0=A0 4=A0 | ||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | -dwc3_process_event_buf=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0=A0 5=A0 | ||-uvc_video_free_requests=A0=A0=A0=A0=A0=A0=A0=A0 |=
 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0=A0 6=A0 | |||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |-dwc3_gadget_ep_cleanup_ca=
ncelled_requests |
>>>>>>> |=A0=A0 7=A0 | |||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | ||-dwc3_gadget_giveback=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0=A0 8=A0 | |||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |||-uvc_video_complete=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0=A0 9=A0 | |||-check ureq->req !=3D NULL [true] | ||||=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0 10=A0 | ||||-usb_ep_free_request=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 | ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0 11=A0 | |||||-dwc3_ep_free_request=A0=A0=A0=A0=A0=A0=A0=A0 | |=
|||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0 12=A0 | ||||||-kfree [first call]=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=
 ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0 13=A0 | ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | ||||-usb_ep_free_request=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0 14=A0 | ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | |||||-dwc3_ep_free_request=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0 15=A0 | ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | ||||||-kfree [second call]=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0 16=A0 | ||||=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | ||||-set ureq->req =3D NULL=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> |=A0 17=A0 | ||||-set ureq->req =3D NULL=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |
>>>>>>> +------+------------------------------------+----------------------=
-----------------------+
>>>>>>>
>>>>>>> A situation like this means that dwc3_ep_free_request can be called
>>>>>>> twice for a particular usb_request. This is obviously low probabili=
ty,
>>>>>>> but a race condition here means we'll start seeing very vague and h=
ard
>>>>>>> to repro crashes or memory inconsistencies when using the uvc gadge=
t.
>>>>>>>
>>>>>>> I do apologize if I've missed something obvious with your changes t=
hat
>>>>>>> prevents such interleaving. I don't currently see any locking or
>>>>>>> other synchronization mechanism in your changes. Is there something
>>>>>>> in dwc3 that prevents this situation?
>>>>>>
>>>>>> I think you have pointed it out totally clear. This is obviously the
>>>>>> case. It just did not trigger here. But the window is there and has =
to
>>>>>> be locked in some way.
>>>>>>
>>>>>> For now we have two options to solve it.
>>>>>>
>>>>>> 1) Trying to avoid this double code path of the complete callback and
>>>>>> uvc_video_free_requests. This is what your patches are already doing.
>>>>>>
>>>>>> But for now I am not so pleased with the timeout concept by waiting =
for
>>>>>> the complete interrupt to be called. This is also a shot in the dark=
 as
>>>>>> the latency depends on the scheduler and the amount of potential
>>>>>> requests that are being handled.
>>>>>
>>>>> I agree, a timeout is not the most elegant of solutions and given a
>>>>> weird enough scheduler, will run into issues as well.
>>>>>
>>>>>>
>>>>>> 2) Locking both codepathes around the resource in question so the is=
sue
>>>>>> is avoided.
>>>>>>
>>>>>> However, I am also not a fried of many locks.
>>>>>>
>>>>>> Perhaps it is possible to use a combination of wait_for_completion in
>>>>>> the uvc_video_free_requests and a complete callback in
>>>>>> uvc_video_complete for those requests that are not listed in the
>>>>>> req_free list.
>>>>>>
>>>>>> What do you think?
>>>>>>
>>>>> There might be a way that builds on your idea of cleaning up in the c=
omplete callback.
>>>>> It would rely on having a uvc_requests that aren't bulk allocated, wh=
ich may have a
>>>>> performance impact.
>>>>
>>>> Since the allocation will only be done once, this performance impact is
>>>> should not be critical.
>>>>
>>>>> I am imagining something like the following:
>>>>> =A01. Instead of allocating a bulk of uvc_requests, we allocate them
>>>>> =A0=A0=A0 one at a time and add them to uvc_video.ureq
>>>>> =A02. uvc_video.ureq becomes a list_head containing all the individual
>>>>> =A0=A0=A0 requests
>>>>> =A03. We add a sentinel flag in uvc_request that says the request is
>>>>> =A0=A0=A0 now stale. This flag is protected by uvc_video->req_lock
>>>>> =A04. uvc_video_complete looks at=A0 this flag to deallocate both
>>>>> =A0=A0=A0 usb_request and uvc_request.
>>>>> =A05. uvcg_video_enable looks something like the following:
>>>>> =A0=A0=A0=A0=A0 uvcg_video_enable(...) {
>>>>> =A0=A0=A0=A0=A0=A0=A0 ...
>>>>> =A0=A0=A0=A0=A0=A0=A0 lock(req_lock);
>>>>> =A0=A0=A0=A0=A0=A0=A0 forall (uvc_requests->ureqs) {ureq->stale =3D t=
rue}
>>>>> =A0=A0=A0=A0=A0=A0=A0 unlock(req_lock);
>>>>> =A0=A0=A0=A0=A0=A0=A0 usb_ep_dequeue all reqs
>>>>>
>>>>> =A0=A0=A0=A0=A0=A0=A0 uvc_video_free_requests(...)
>>>>> =A0=A0=A0=A0=A0=A0=A0 ...
>>>>> =A0=A0=A0=A0=A0 }
>>>>> =A06. uvc_video_complete looks something like:
>>>>> =A0=A0=A0=A0=A0 uvc_video_complete(...) {
>>>>> =A0=A0=A0=A0=A0=A0=A0 // at the start
>>>>> =A0=A0=A0=A0=A0=A0=A0 lock(req_lock)
>>>>> =A0=A0=A0=A0=A0=A0=A0 is_stale =3D ureq->stale;
>>>>> =A0=A0=A0=A0=A0=A0=A0 unlock(req_lock);
>>>>>
>>>>> =A0=A0=A0=A0=A0=A0=A0 if (is_stale) {
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 usb_ep_free_request();
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 dealloc corresponding uvc_request();
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
>>>>> =A0=A0=A0=A0=A0=A0=A0 }
>>>>>
>>>>> =A0=A0=A0=A0=A0=A0=A0 ...
>>>>>
>>>>> =A0=A0=A0=A0=A0=A0=A0 lock(req_lock);
>>>>> =A0=A0=A0=A0=A0=A0=A0 // possible that request became stale while we =
were handling stuff
>>>>> =A0=A0=A0=A0=A0=A0=A0 if (!ureq->stale) {
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 list_add_tail(&req->list, &video->req_fre=
e);
>>>>> =A0=A0=A0=A0=A0=A0=A0 } else {
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 usb_ep_free_request();
>>>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 dealloc corresponding uvc_request();
>>>>> =A0=A0=A0=A0=A0=A0=A0 }
>>>>> =A0=A0=A0=A0=A0=A0=A0 unlock(req_lock);
>>>>> =A0=A0=A0=A0=A0 }
>>>>> =A07. uvc_video_free_requests can freely dealloc usb_requests/uvc_req=
uests in
>>>>> =A0=A0=A0 req_free because we can be certain that uvc_video_complete =
won't modify
>>>>> =A0=A0=A0 it once requests have been marked stale, and the stale requ=
ests in flight
>>>>> =A0=A0=A0 will be cleaned up by the complete callback.
>>>>>
>>>>> Effectively, we freeze the state of req_free before dequeuing, and all
>>>>> inflight requests are considered the responsibility of the complete h=
andler
>>>>> from that point onwards. The gadget is only responsible for freeing r=
equests it
>>>>> currently owns.
>>>>>
>>>>> I think this should ensure that we never have a situation where the o=
wnership of the
>>>>> requests are undefined, and only one thread is responsible for freein=
g any given request.
>>>>>
>>>>> Hope that makes sense!
>>>>
>>>> So you found a way to secure this also with the already available
>>>> req_lock then. Nice!
>>>>
>>>> Also what you suggest is to move from the array model we currently have
>>>> to dynamic allocation in a linked list.
>>>>
>>>> I would suggest some more adaptions.
>>>>
>>>> Keep to allocate all requests dynamicaly as you suggest instead of the
>>>> bulk array.
>>>>
>>>> Rewrite the uvc_video_free_requests to iterate over the video->req_free
>>>> list instead of all available requests to take care of all requests
>>>> that are truely freed.
>>>>
>>>> Take this patch we started this thread with and expand it to
>>>> clean up not only the usb_request but also the uvc_request
>>>> like you suggested in your pseudo code.
>>>>
>>>> Since we check for UVC_STATE_CONNECTED already in the comlete handler
>>>> this is a superset of your stale flag anyway. And every request
>>>> that is currently in flight is not part of the req_free list, which
>>>> makes the uvc_video_free_requests function free to run without making
>>>> no harm.
>>>
>>> The downside of freeing based on UVC_STATE_CONNECTED and why it might be
>>> problematic is that without any other synchronization method, the compl=
ete
>>> callback can be arbitrarily delayed for a given usb_request.
>>>
>>> A STREAMOFF quickly followed by a STREAMON, might set uvc->state to
>>> UVC_STATE_STREAMING before the controller has had a chance to return the
>>> stale requests. This won't cause any functional issues AFAICT, but will
>>> cause a memory "leak" of sorts where every successive quick
>>> STREAMOFF-->STREAMON will lead to some extra usb_requests sticking arou=
nd.
>>> They'll eventually get freed, but it doesn't seem very responsible to i=
ncrease
>>> the memory load unless required.
>>>
>>> The stale flag ensures that this situation never happens and even if the
>>> complete callbacks comes back well after=A0 the new STREAMON event, we =
correctly
>>> free the associated usb_request and uvc_request.
>>
>> In that case we could use stale then, but I would suggest also keeping
>> the change the functionality of uvc_video_free_requests aswell to loop
>> over the requests in req_free list.
>
>Agreed, uvc_video_free_requests should only free the requests in
>req_free.
>
>Just to clear any confusion: are you working on incorporating these changes
>into your patchset, or do you want me to include them in
>https://lore.kernel.org/20230912041910.726442-3-arakesh@google.com/
>instead?

As I am busy on a different topic at the moment, and you have suggested
the main walkthrough for the solution, it would be great if you could
come up with the proper patch.

But it would be great to find my Suggested-by in the patches. :)

Thanks!
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--nb24PsWMp4VK9kjT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUKD6QACgkQC+njFXoe
LGQTahAAtAyTGgsArl6me6DFgXKpD1T3gkOBUOxwqb9tXA3whECMw57pDkSoQy4h
+7d+AdHMjSwq87c8QqZnG8BPaR+W7EEe+OjGOrSLe2Bd5CdOm6kLVAXuikvwrmu9
/9kz5kswMy6Hl7JthYAJtePGh9ZDJvZ0raTKPjWBGRg/mRCpF8JTBysfypcjwIO9
T1uIFM+/qTp30YHAUJYn4BPt9HcoYqB/4w1UgTXE/5o6yIZ9Lvyxlw0CWCa8klEV
LW4uMI5Sv6nvhPlxwkzestCb20OGlM5L77TW/j8+igNSmiUIVKhG2ppLqewXr34I
bGvlFgHQ2WeX42L8Oc6X0gwBFt9N+u51lwNQCh5dtJ0xNDuSVFIpnl79R1T/poo2
oKKXgwP6oG4+IC+hXaJWMwWs0pPAecRVaqTatiQsW9whm1ayjo3pjNGZK8I0HNEt
fElpq9OJIaCdo9GWjQMg+NpbXDjKpMd0gOgS6rk0dA3LJvTQM5Z5T87Mtrx8QG1t
cBW55sT3mMoH6Xy9rcLI5FglMR1R9UZhnZJzrmJv9AAUdkZp+BNlz4ymqMFIDDx5
YetTxi6zWEDy6Y5H/kbbb0V2iQzqFW4AcRWJOEBUKGUfkBa3I+lLiCauyHXcIqyC
e5gqSdElYkNpv7Um9a+t817ADoWvqz3kLfUraS6jUyJuEjW4ENE=
=zcrT
-----END PGP SIGNATURE-----

--nb24PsWMp4VK9kjT--
