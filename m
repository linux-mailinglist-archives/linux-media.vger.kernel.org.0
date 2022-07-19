Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E644457AA11
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 00:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240360AbiGSWw4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 18:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235748AbiGSWwz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 18:52:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE365FACA
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 15:52:54 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oDw5A-0002Iv-2J; Wed, 20 Jul 2022 00:52:48 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oDw59-0000vK-E6; Wed, 20 Jul 2022 00:52:47 +0200
Date:   Wed, 20 Jul 2022 00:52:47 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     balbi@kernel.org, paul.elder@ideasonboard.com,
        linux-usb@vger.kernel.org, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [RESEND v2 2/3] usb: gadget: uvc: increase worker prio to
 WQ_HIGHPRI
Message-ID: <20220719225247.GB24858@pengutronix.de>
References: <20220608110339.141036-1-m.grzeschik@pengutronix.de>
 <20220608110339.141036-3-m.grzeschik@pengutronix.de>
 <YqDtWkUbp4LPBRxS@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
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
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Pd0ReVV5GZGQvF3a
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
>
>I'm still a bit worried about WQ_UNBOUND and the risk of running work
>items in parallel on different CPUs. uvcg_video_pump() looks mostly
>safe, as it protects video->req_free with a spinlock, and the buffer
>queue with another spinlock. The req_int_count increment at the end of
>the loop would be unsafe though.

I looked into this again. But am still a bit unsure.

Why exactly would req_int_count be unsafe?

I thought WQ_UNBOUND is just making sure, that the workqueue could be
scheduled on any CPU, independent of the calling CPU waking the WQ. The
function uvcg_video_pump would than be called. But would it then be
called in parallel on two CPU at once? I doubt that. So how should
touching req_int_count on the bottom of the function be unsafe?

If WQ_UNBOUND would mean, that it would be run on more than one CPU
at once, this should clearly be documented.

>Could we get to the bottom of this and find out whether or not the work
>items can be executed in parallel ?

Since the list handling is properly locked, this should be fine.

>> +	if (!video->async_wq)
>> +		return -EINVAL;
>> +
>>  	video->uvc =3D uvc;
>>  	video->fcc =3D V4L2_PIX_FMT_YUYV;
>>  	video->bpp =3D 16;

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmLXNbwACgkQC+njFXoe
LGQMhg//RNgommIgvm6zv+5wBx7JwxPuxF5FjJHVWFZcwmNWRRxVP3ZPws83TmD8
Mw2Nww+HKrvY4/9DZDwhSD3dD8aNfB+SSlcwpozWlw85u6b8LnLYm8qWIz51dd8U
QWiXELjR1Ul6MrVekDQfdiaBIhqn8KZuxlWAXjd2/FTHLqTg54d/9/XwFkQFInTd
1VK5xIKR83FmMTW7UVHe9eciPohNFzvU94J5wGjIWtbp+SWzHFbjxSwANhrjrmNv
RrYQZguhcggw/UeDFSYlMLMDXaQy1TdP+jzbMthZTqCmCc+WntirgZyT4Ea1YRx6
CHGpohxedjD99Qz4Goy11VHxUA6WmVxlg2iYApJgGplBu3G+ecd+35uAwtVGYb2o
D+HPeUrTb6xYeQuN4xnRS0at5iH/ibUooxJ62g7ylzEPDVwpIIvSPFmKNKIGfspa
4T26XODahT1TE3+mzyz1Cd+uL0dhL6999ppj65bISPXYMrhATwLx8FfAQxVOSdQ9
TE+4R/4dp/Nx2Gc3JGE98SPIZrfOSO0jKUQlVVLV8ZkXy8iLs33FI/X2xlcmoY5/
pwObmu03chmkppwcAPx+lUWYof9BGuLPe9qvdW1lJncsIe8MD8YbEKbk5TQr2x2b
vTX3FLA/mJZhRvpvB+amuaYQzrQtu6U7PjtP+LrpJz4w9yQ+jhc=
=nFJ5
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
