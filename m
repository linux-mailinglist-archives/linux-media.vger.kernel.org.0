Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B76A45479C6
	for <lists+linux-media@lfdr.de>; Sun, 12 Jun 2022 12:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236063AbiFLKd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jun 2022 06:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbiFLKd2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jun 2022 06:33:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B558313E19
        for <linux-media@vger.kernel.org>; Sun, 12 Jun 2022 03:33:27 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o0KuI-0006c7-2g; Sun, 12 Jun 2022 12:33:22 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1o0KuH-0008D6-Pp; Sun, 12 Jun 2022 12:33:21 +0200
Date:   Sun, 12 Jun 2022 12:33:21 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        linux-usb@vger.kernel.org, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [RESEND v2 2/3] usb: gadget: uvc: increase worker prio to
 WQ_HIGHPRI
Message-ID: <20220612103321.GD29935@pengutronix.de>
References: <20220608110339.141036-1-m.grzeschik@pengutronix.de>
 <20220608110339.141036-3-m.grzeschik@pengutronix.de>
 <YqDtWkUbp4LPBRxS@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline
In-Reply-To: <YqDtWkUbp4LPBRxS@pendragon.ideasonboard.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 09:41:30PM +0300, Laurent Pinchart wrote:
>Hi Michael,
>
>Thank you for the patch.
>
>On Wed, Jun 08, 2022 at 01:03:38PM +0200, Michael Grzeschik wrote:
>> Likewise to the uvcvideo hostside driver, this patch is changing the
>> simple workqueue to an async_wq with higher priority. This ensures that
>> the worker will not be scheduled away while the video stream is handled.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1 -> v2: - added destroy_workqueue in uvc_function_unbind
>>           - reworded comment above allow_workqueue
>>
>>  drivers/usb/gadget/function/f_uvc.c     | 4 ++++
>>  drivers/usb/gadget/function/uvc.h       | 1 +
>>  drivers/usb/gadget/function/uvc_v4l2.c  | 2 +-
>>  drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
>>  4 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/fu=
nction/f_uvc.c
>> index d3feeeb50841b8..dcc5f057810973 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -891,10 +891,14 @@ static void uvc_function_unbind(struct usb_configu=
ration *c,
>>  {
>>  	struct usb_composite_dev *cdev =3D c->cdev;
>>  	struct uvc_device *uvc =3D to_uvc(f);
>> +	struct uvc_video *video =3D &uvc->video;
>>  	long wait_ret =3D 1;
>>
>>  	uvcg_info(f, "%s()\n", __func__);
>>
>> +	if (video->async_wq)
>> +		destroy_workqueue(video->async_wq);
>> +
>>  	/* If we know we're connected via v4l2, then there should be a cleanup
>>  	 * of the device from userspace either via UVC_EVENT_DISCONNECT or
>>  	 * though the video device removal uevent. Allow some time for the
>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/func=
tion/uvc.h
>> index 58e383afdd4406..1a31e6c6a5ffb8 100644
>> --- a/drivers/usb/gadget/function/uvc.h
>> +++ b/drivers/usb/gadget/function/uvc.h
>> @@ -88,6 +88,7 @@ struct uvc_video {
>>  	struct usb_ep *ep;
>>
>>  	struct work_struct pump;
>> +	struct workqueue_struct *async_wq;
>>
>>  	/* Frame parameters */
>>  	u8 bpp;
>> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget=
/function/uvc_v4l2.c
>> index fd8f73bb726dd1..fddc392b8ab95d 100644
>> --- a/drivers/usb/gadget/function/uvc_v4l2.c
>> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
>> @@ -170,7 +170,7 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4=
l2_buffer *b)
>>  		return ret;
>>
>>  	if (uvc->state =3D=3D UVC_STATE_STREAMING)
>> -		schedule_work(&video->pump);
>> +		queue_work(video->async_wq, &video->pump);
>>
>>  	return ret;
>>  }
>> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadge=
t/function/uvc_video.c
>> index a9bb4553db847e..9a9101851bc1e8 100644
>> --- a/drivers/usb/gadget/function/uvc_video.c
>> +++ b/drivers/usb/gadget/function/uvc_video.c
>> @@ -277,7 +277,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_req=
uest *req)
>>  	spin_unlock_irqrestore(&video->req_lock, flags);
>>
>>  	if (uvc->state =3D=3D UVC_STATE_STREAMING)
>> -		schedule_work(&video->pump);
>> +		queue_work(video->async_wq, &video->pump);
>>  }
>>
>>  static int
>> @@ -478,7 +478,7 @@ int uvcg_video_enable(struct uvc_video *video, int e=
nable)
>>
>>  	video->req_int_count =3D 0;
>>
>> -	schedule_work(&video->pump);
>> +	queue_work(video->async_wq, &video->pump);
>>
>>  	return ret;
>>  }
>> @@ -492,6 +492,11 @@ int uvcg_video_init(struct uvc_video *video, struct=
 uvc_device *uvc)
>>  	spin_lock_init(&video->req_lock);
>>  	INIT_WORK(&video->pump, uvcg_video_pump);
>>
>> +	/* Allocate a work queue for asynchronous video pump handler. */
>> +	video->async_wq =3D alloc_workqueue("uvcvideo", WQ_UNBOUND | WQ_HIGHPR=
I, 0);
>
>Let's call it "uvcgadget" (or "uvc gadget", "uvc-gadget", ...) as
>"uvcvideo" refers to the host side driver.

Good Idea. I will fix this.

>I'm still a bit worried about WQ_UNBOUND and the risk of running work
>items in parallel on different CPUs. uvcg_video_pump() looks mostly
>safe, as it protects video->req_free with a spinlock, and the buffer
>queue with another spinlock. The req_int_count increment at the end of
>the loop would be unsafe though.

I didn't think about that. I will have to check for that.

>Could we get to the bottom of this and find out whether or not the work
>items can be executed in parallel ?

Do you have an Idea to check for that?

>> +	if (!video->async_wq)
>> +		return -EINVAL;
>> +
>>  	video->uvc =3D uvc;
>>  	video->fcc =3D V4L2_PIX_FMT_YUYV;
>>  	video->bpp =3D 16;
>
>--=20
>Regards,
>
>Laurent Pinchart
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmKlwPEACgkQC+njFXoe
LGT/sg//XI+zbJNYyEnypxXofkpak3fU9COwNpProk2OFKt2zbABubR3zlkM1A6I
vDtL3WMU/cKDsU9n0s7kirqmHJ7yXA+QBgq9/L9iPJ+QSJwwdkniWdd9YEuYt/Gh
TcOIFzTNBHRQGKdMvYIwCraBpTmpTXX4sJZk1OqZxgI+T1I2occf3A1eWHID/cYJ
S7CR+rh1fHQYhA5btpDUzx4RTbrNbjAkYO5+lA5/YyoAIbIM2HnTPAfayKnRMDEM
RT7FySnUeMJxcGRbux1YAUgdDuCAdPK10ZCF9Z2cSAmVo4JUnADom8aiHHLlXnGI
t7kdijYpRa6sEN/GKVmrfj8fcJTsRNZ1jxT9mVoAjT7NNIN2aPqapl9RRqNlNEMj
5KvE6a5YC8aQhA7TbSbVkLdgdPJwRKbgtQU7io74L+T4VUP7OQ3zoRukp2bBzXce
AF05c8MDx7n2VdMyaVFlj/ShWzO1LRs3qVNVO02LjLYF7wCpAwvcKXVOf17nCZkD
Q0ohSBvhdG5PR7zorOlxW07Sl35sSEQF2rFq/7YNHl1gtumbQKtfI3YynemTBZSq
e8Yzxd2MHaA0KMICP10VZkEO5/dc+XmGDKRir72/G0zDsddcbM4iqbvayD2Z3JLj
x3RVY74f3amu/gNQil6YOiC33t6TPHexXFcWzbX0ONieBTfXoKc=
=VYxZ
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
