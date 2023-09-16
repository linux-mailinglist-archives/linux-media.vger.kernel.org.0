Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103AD7A335F
	for <lists+linux-media@lfdr.de>; Sun, 17 Sep 2023 01:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjIPXX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Sep 2023 19:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjIPXXz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Sep 2023 19:23:55 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591FDCD1
        for <linux-media@vger.kernel.org>; Sat, 16 Sep 2023 16:23:49 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qhede-0007vv-3d; Sun, 17 Sep 2023 01:23:47 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qhedd-005K5N-97; Sun, 17 Sep 2023 01:23:45 +0200
Date:   Sun, 17 Sep 2023 01:23:45 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, dan.scally@ideasonboard.com,
        gregkh@linuxfoundation.org, nicolas@ndufresne.ca,
        kernel@pengutronix.de, Jayant Chowdhary <jchowdhary@google.com>
Message-ID: <ZQY5Ab+YB9FLHoQq@pengutronix.de>
References: <20230911002451.2860049-1-m.grzeschik@pengutronix.de>
 <20230911002451.2860049-3-m.grzeschik@pengutronix.de>
 <a55b3b0c-2306-4591-8613-7be4927f0d4e@google.com>
 <ZQTpnJvTV+8Ye1si@pengutronix.de>
 <587c9b95-a80c-4bf9-b1a0-fe7ef0f4cd60@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fq3RHi3m/7M6Nb+A"
Content-Disposition: inline
In-Reply-To: <587c9b95-a80c-4bf9-b1a0-fe7ef0f4cd60@google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:2:b01:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: [PATCH 2/3] usb: gadget: uvc: cleanup request when not in
 correct state
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.whiteo.stw.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fq3RHi3m/7M6Nb+A
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 07:41:05PM -0700, Avichal Rakesh wrote:
>On 9/15/23 16:32, Michael Grzeschik wrote:
>> On Mon, Sep 11, 2023 at 09:52:22PM -0700, Avichal Rakesh wrote:
>>> On 9/10/23 17:24, Michael Grzeschik wrote:
>>>> The uvc_video_enable function of the uvc-gadget driver is dequeing and
>>>> immediately deallocs all requests on its disable codepath. This is not
>>>> save since the dequeue function is async and does not ensure that the
>>>> requests are left unlinked in the controller driver.
>>>>
>>>> By adding the ep_free_request into the completion path of the requests
>>>> we ensure that the request will be properly deallocated.
>>>>
>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>> ---
>>>> =A0drivers/usb/gadget/function/uvc_video.c | 6 ++++++
>>>> =A01 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gad=
get/function/uvc_video.c
>>>> index 4b6e854e30c58c..52e3666b51f743 100644
>>>> --- a/drivers/usb/gadget/function/uvc_video.c
>>>> +++ b/drivers/usb/gadget/function/uvc_video.c
>>>> @@ -256,6 +256,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_=
request *req)
>>>> =A0=A0=A0=A0 struct uvc_device *uvc =3D video->uvc;
>>>> =A0=A0=A0=A0 unsigned long flags;
>>>>
>>>> +=A0=A0=A0 if (uvc->state =3D=3D UVC_STATE_CONNECTED) {
>>>> +=A0=A0=A0=A0=A0=A0=A0 usb_ep_free_request(video->ep, ureq->req);
>>> nit: You can probably just call usb_ep_free_request with req instead of=
 ureq->req.
>>
>> Thanks, thats a good point.
>>
>>>> +=A0=A0=A0=A0=A0=A0=A0 ureq->req =3D NULL;
>>>> +=A0=A0=A0=A0=A0=A0=A0 return;
>>>> +=A0=A0=A0 }
>>>> +
>>>> =A0=A0=A0=A0 switch (req->status) {
>>>> =A0=A0=A0=A0 case 0:
>>>> =A0=A0=A0=A0=A0=A0=A0=A0 break;
>>>
>>> Perhaps I am missing something here, but I am not sure how this alone
>>> fixes the use-after-free issue. uvcg_video_enable still deallocates
>>> _all_ usb_requests right after calling usb_ep_dequeue, so it is still
>>> possible that an unreturned request is deallocated, and now it is
>>> possible that the complete callback accesses a deallocated ureq :(
>>
>> Since the issue I saw was usually coming from the list_del_entry_valid c=
heck in
>> the list_del_entry of the giveback function, the issue was probably just=
 not
>> triggered anymore as the complete function did exit early.
>>
>> So this fix alone is actually bogus without a second patch I had in the =
stack.
>> The second patch I am refering should change the actual overall issue:
>>
>> https://lore.kernel.org/linux-usb/20230915233113.2903645-1-m.grzeschik@p=
engutronix.de/T/#u
>>
>> This early list_del and this patch here should ensure that the
>> concurrent functions are not handling already freed memory.
>
>Oh, the patch linked above is interesting. It effectively force removes th=
e dwc3_request
>from whatever list it belongs to? So if DWC3's interrupt handler is delaye=
d past
>UVC gadget's ep_free_request call, then it won't see the requests in its c=
ancelled
>list at all. However, this setup is still prone to errors. For example, th=
ere is now
>a chance that gadget_ep_free_request is called twice for one request. A sc=
heduling
>like the following might cause double kfree:
>
>1. uvcg_video_enable calls usb_ep_dequeue for all usb_requests
>2. While the usb_ep_dequeues are being processed, dwc3's interrupt handler=
 starts
>   calling the complete callbacks.
>3. The complete callback calls gadget_ep_free_request (calling kfree as a =
result)
>4. Meanwhile, uvcg_video_enable has moved to uvc_video_free_requests which=
 also
>   calls gadget_ep_free_request (calling kfree).
>
>There is currently (even in your patches) no synchronization between calls=
 to
>gadget_ep_free_request via complete callback and uvcg_video_enable, which =
will
>inevitably call usb_ep_free_request twice for one request.
>
>Does that make sense, or am I misunderstanding some part of the patch?

The overall concept is correct. But in detail the
uvc_video_free_requests is checking that video->ureq[i].req is not NULL.

With our previous call of ep_free_request in the complete handler, the
ureq->req pointer in focus was already set to NULL. So the
uvc_video_free_requests function will skip that extra free.

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--fq3RHi3m/7M6Nb+A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmUGOP4ACgkQC+njFXoe
LGSfUw//fXvFaPM+/+60N0pzWj57QmqLLqHH6Ie406CwoJ3dLluRSHqKpFZ7sWQb
c0M+J9ZdpIQKh8ezU2p6DWdQr66MQnKZsVIc4Q6p5rbh3NOzb+yxqiGzJ2VKaEhZ
3Vi8m2U9hfDlmylafXhM6gyG4b2p2yY2c2ss7fcfoKiGKTItzwXiRIIs2Qab1VSf
tfFSpOvJeI0u/2ITjxnUk/mXhiJaAUnnuyuwl3Xa6q/wrlBZjSQ6y46QhtlYciBz
6kXkNFikR86rpEaw507bHKyBiD6aPQWKIoCb5Tfrq4mG74YyFBWpf8QZZPjVhnJG
4FL5GYDd14+yMoPYq/a2uAJl2AsnuIeRIPLT8AZ5qEJBpxgfbLONDRTeYqb9xGVX
mhbjhPMwuAbOKGrzx6Apb1zEAICucxpP5PwWHJallMEEQyfvr48CXVwY3qNhlHGG
eCcVSC2phu+xFLqHxr3ugAGjEha+dBe961bH0DJlcDVMC8+JTelPwREvoaKVApTs
Fgh0xw/Eqdz3QoA3tL1Q4vUpmLF3gXkvjCIIYCnN7q8Y1ab94Q++F1pdQmSRZCNv
3gMyQtz2TGIr4kOPAfk2g0YrmI7vkvyE1PVl8LFPLC0EszI3GxGeS2W2b3N+gdWz
6tcRn9MQoeiXjOQ26hLGrkVluXK9OGV6ql8PSK3PfFBiNV0MFu4=
=HkKu
-----END PGP SIGNATURE-----

--fq3RHi3m/7M6Nb+A--
