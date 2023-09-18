Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1959C7A5530
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 23:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjIRVnM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 17:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjIRVnL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 17:43:11 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5E590
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 14:43:05 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qiM1H-0001CS-B7; Mon, 18 Sep 2023 23:43:03 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qiM1G-008HRQ-8e; Mon, 18 Sep 2023 23:43:02 +0200
Date:   Mon, 18 Sep 2023 23:43:02 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org, nicolas@ndufresne.ca,
        kernel@pengutronix.de, Jayant Chowdhary <jchowdhary@google.com>
Message-ID: <ZQjEZlk2UFQgA0TF@pengutronix.de>
References: <20230911002451.2860049-1-m.grzeschik@pengutronix.de>
 <20230911002451.2860049-3-m.grzeschik@pengutronix.de>
 <a55b3b0c-2306-4591-8613-7be4927f0d4e@google.com>
 <ZQTpnJvTV+8Ye1si@pengutronix.de>
 <587c9b95-a80c-4bf9-b1a0-fe7ef0f4cd60@google.com>
 <ZQY5Ab+YB9FLHoQq@pengutronix.de>
 <d678b644-5f66-4c23-b2ba-6c84ba56012f@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kauwziZBdtmgOiSI"
Content-Disposition: inline
In-Reply-To: <d678b644-5f66-4c23-b2ba-6c84ba56012f@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:2:b01:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in
 correct state
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.whiteo.stw.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--kauwziZBdtmgOiSI
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 12:02:11PM -0700, Avichal Rakesh wrote:
>On 9/16/23 16:23, Michael Grzeschik wrote:
>> On Fri, Sep 15, 2023 at 07:41:05PM -0700, Avichal Rakesh wrote:
>>> On 9/15/23 16:32, Michael Grzeschik wrote:
>>>> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>>>>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>>>>> The uvc_video_enable function of the uvc-gadget driver is dequeing a=
nd
>>>>>> immediately deallocs all requests on its disable codepath. This is n=
ot
>>>>>> save since the dequeue function is async and does not ensure that the
>>>>>> requests are left unlinked in the controller driver.
>>>>>>
>>>>>> By adding the ep_free_request into the completion path of the reques=
ts
>>>>>> we ensure that the request will be properly deallocated.
>>>>>>
>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>> ---
>>>>>> =A0drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>>>>>> =A01 file changed, 6 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/g=
adget/function/uvc_video.c
>>>>>> index 4b6e854e30c58c..52e3666b51f743 100644
>>>>>> --- a/drivers/usb/gadget/function/uvc_video.c
>>>>>> +++ b/drivers/usb/gadget/function/uvc_video.c
>>>>>> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct us=
b_request *req)
>>>>>> =A0=A0=A0=A0 struct uvc_device *uvc =3D video->uvc;
>>>>>> =A0=A0=A0=A0 unsigned long flags;
>>>>>>
>>>>>> +=A0=A0=A0 if (uvc->state =3D=3D UVC_STATE_CONNECTED) {
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 usb_ep_free_request(video->ep, ureq->req);
>>>>> nit: You can probably just call usb_ep_free_request with req instead =
of ureq->req.
>>>>
>>>> Thanks, thats a good point.
>>>>
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 ureq->req =3D NULL;
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 return;
>>>>>> +=A0=A0=A0 }
>>>>>> +
>>>>>> =A0=A0=A0=A0 switch (req->status) {
>>>>>> =A0=A0=A0=A0 case 0:
>>>>>> =A0=A0=A0=A0=A0=A0=A0=A0 break;
>>>>>
>>>>> Perhaps I am missing something here, but I am not sure how this alone
>>>>> fixes the use-after-free issue. uvcg_video_enable still deallocates
>>>>> _all_ usb_requests right after calling usb_ep_dequeue, so it is still
>>>>> possible that an unreturned request is deallocated, and now it is
>>>>> possible that the complete callback accesses a deallocated ureq :(
>>>>
>>>> Since the issue I saw was usually coming from the list_del_entry_valid=
 check in
>>>> the list_del_entry of the giveback function, the issue was probably ju=
st not
>>>> triggered anymore as the complete function did exit early.
>>>>
>>>> So this fix alone is actually bogus without a second patch I had in th=
e stack.
>>>> The second patch I am refering should change the actual overall issue:
>>>>
>>>> https://lore.kernel.org/linux-usb/20230915233113.2903645-1-m.grzeschik=
@pengutronix.de/T/#u
>>>>
>>>> This early list_del and this patch here should ensure that the
>>>> concurrent functions are not handling already freed memory.
>>>
>>> Oh, the patch linked above is interesting. It effectively force removes=
 the dwc3_request
>>> from whatever list it belongs to? So if DWC3's interrupt handler is del=
ayed past
>>> UVC gadget's ep_free_request call, then it won't see the requests in it=
s cancelled
>>> list at all. However, this setup is still prone to errors. For example,=
 there is now
>>> a chance that gadget_ep_free_request is called twice for one request. A=
 scheduling
>>> like the following might cause double kfree:
>>>
>>> 1. uvcg_video_enable calls usb_ep_dequeue for all usb_requests
>>> 2. While the usb_ep_dequeues are being processed, dwc3's interrupt hand=
ler starts
>>> =A0 calling the complete callbacks.
>>> 3. The complete callback calls gadget_ep_free_request (calling kfree as=
 a result)
>>> 4. Meanwhile, uvcg_video_enable has moved to uvc_video_free_requests wh=
ich also
>>> =A0 calls gadget_ep_free_request (calling kfree).
>>>
>>> There is currently (even in your patches) no synchronization between ca=
lls to
>>> gadget_ep_free_request via complete callback and uvcg_video_enable, whi=
ch will
>>> inevitably call usb_ep_free_request twice for one request.
>>>
>>> Does that make sense, or am I misunderstanding some part of the patch?
>>
>> The overall concept is correct. But in detail the
>> uvc_video_free_requests is checking that video->ureq[i].req is not NULL.
>>
>> With our previous call of ep_free_request in the complete handler, the
>> ureq->req pointer in focus was already set to NULL. So the
>> uvc_video_free_requests function will skip that extra free.
>>
>
>Is there any form of synchronization between uvc_video_request and the
>complete callback? As I see it, the dwc3 interrupt thread and the v4l2
>ioctl thread (which calls uvcg_video_enable) are fully independent, so
>the calls made by them are free to be interleaved arbitrarily, so an
>interleaving like this is technically possible:
>
>+------+------------------------------------+-----------------------------=
----------------+
>| time |            ioctl_thread            |            dwc3 interrupt ha=
ndler           |
>+=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
>|   1  | -uvc_v4l2_streamoff                |                             =
                |
>|   2  | |-uvcg_video_enable                |                             =
                |
>|   3  | ||-usb_ep_dequeue                  |                             =
                |
>|   4  | ||                                 | -dwc3_process_event_buf     =
                |
>|   5  | ||-uvc_video_free_requests         | |                           =
                |
>|   6  | |||                                | |-dwc3_gadget_ep_cleanup_can=
celled_requests |
>|   7  | |||                                | ||-dwc3_gadget_giveback     =
                |
>|   8  | |||                                | |||-uvc_video_complete      =
                |
>|   9  | |||-check ureq->req !=3D NULL [true] | ||||                      =
                  |
>|  10  | ||||-usb_ep_free_request           | ||||                        =
                |
>|  11  | |||||-dwc3_ep_free_request         | ||||                        =
                |
>|  12  | ||||||-kfree [first call]          | ||||                        =
                |
>|  13  | ||||                               | ||||-usb_ep_free_request    =
                |
>|  14  | ||||                               | |||||-dwc3_ep_free_request  =
                |
>|  15  | ||||                               | ||||||-kfree [second call]  =
                |
>|  16  | ||||                               | ||||-set ureq->req =3D NULL =
                  |
>|  17  | ||||-set ureq->req =3D NULL          |                           =
                  |
>+------+------------------------------------+-----------------------------=
----------------+
>
>A situation like this means that dwc3_ep_free_request can be called
>twice for a particular usb_request. This is obviously low probability,
>but a race condition here means we'll start seeing very vague and hard
>to repro crashes or memory inconsistencies when using the uvc gadget.
>
>I do apologize if I've missed something obvious with your changes that
>prevents such interleaving. I don't currently see any locking or
>other synchronization mechanism in your changes. Is there something
>in dwc3 that prevents this situation?

I think you have pointed it out totally clear. This is obviously the
case. It just did not trigger here. But the window is there and has to
be locked in some way.

For now we have two options to solve it.

1) Trying to avoid this double code path of the complete callback and
uvc_video_free_requests. This is what your patches are already doing.

But for now I am not so pleased with the timeout concept by waiting for
the complete interrupt to be called. This is also a shot in the dark as
the latency depends on the scheduler and the amount of potential
requests that are being handled.

2) Locking both codepathes around the resource in question so the issue
is avoided.

However, I am also not a fried of many locks.

Perhaps it is possible to use a combination of wait_for_completion in
the uvc_video_free_requests and a complete callback in
uvc_video_complete for those requests that are not listed in the
req_free list.

What do you think?

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--kauwziZBdtmgOiSI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUIxGMACgkQC+njFXoe
LGR7wBAAxuHUvAbryu7Ff2jzYZhmMSj1i93QDN3hcEV0bcMrMV9L9DMzJvkWkjU6
NmkAKoMlWVSwu3WuZYupJmnLTBxWBoT3h/jHgLtYnSU1IA6eZvZ20k10W+JZ07Cw
Ni3b4CX9JIRZfs/evILvgU0fJKeSIIJocQypP1kxnyqewOzTSdwD6fVDRZl/LM31
1Pbzw4qxmo06modAEezW+JtuqW/cxW93ivY2Ga7TMDzfZURqL8FCB6o0i/ViClAJ
XKzdtZCFaiWkYJasfzElDxuEYFzvek7OtmfkY/pcN2zrO4HWtXYOMCsk2Z6TF+WL
vpZVNqTdoWBYa/ut/z9Niv7a9AvVInQKG1x5Mr8gtOMr0I2WeZfzsy3oe1KvaIWV
T88tJOcH8PxWI7g79Om8H+o1+jgFMTZw9iCYmgLIhyBhr7LLH+5bFAOvzhcmPqb0
6TICCMdDQ6ooS9isZjzOffCrv6sA8DGQLgRDiEJzyPQ+mJRalsHfy2SlVCuOpmNc
ptvER0COWhAWMtvmx1gpTHKJG6JMK20VF2bL/tLx2wSHRZ109/bXErf70N4V8zW8
XR98xDq3BKCsDJm7Ph8cKcQUxFrsKnwWnV3g8wAyWX8Zrx9ZNg6BgqnawMLxfokF
BbAJoCwYZHpn9yIYBIgz9XxVJZDOH1SDukgeJFrG9p9M6Pmenhg=
=Tmc1
-----END PGP SIGNATURE-----

--kauwziZBdtmgOiSI--
