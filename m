Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2FBB5EE5FE
	for <lists+linux-media@lfdr.de>; Wed, 28 Sep 2022 21:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbiI1Tpg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Sep 2022 15:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbiI1Tpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Sep 2022 15:45:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D565072A
        for <linux-media@vger.kernel.org>; Wed, 28 Sep 2022 12:45:32 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1odczq-0000sy-FN; Wed, 28 Sep 2022 21:45:30 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1odczp-0004de-Ch; Wed, 28 Sep 2022 21:45:29 +0200
Date:   Wed, 28 Sep 2022 21:45:29 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <20220928194529.GA27265@pengutronix.de>
References: <20220907215818.2670097-1-m.grzeschik@pengutronix.de>
 <YzR2gyyuU6luYRBP@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
In-Reply-To: <YzR2gyyuU6luYRBP@dev-arch.thelio-3990X>
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nathan!

On Wed, Sep 28, 2022 at 09:29:55AM -0700, Nathan Chancellor wrote:
>On Wed, Sep 07, 2022 at 11:58:18PM +0200, Michael Grzeschik wrote:
>> This patch is changing the simple workqueue in the gadget driver to be
>> allocated as async_wq with a higher priority. The pump worker, that is
>> filling the usb requests, will have a higher priority and will not be
>> scheduled away so often while the video stream is handled. This will
>> lead to fewer streaming underruns.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>...
>
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
>
>I am commenting here because this is the most recent change but after
>this showed up in -next as commit 9b91a6523078 ("usb: gadget: uvc:
>increase worker prio to WQ_HIGHPRI"), I see the following warning/error
>when building s390 allmodconfig:
>
>  In file included from ../include/linux/string.h:253,
>                   from ../include/linux/bitmap.h:11,
>                   from ../include/linux/cpumask.h:12,
>                   from ../include/linux/smp.h:13,
>                   from ../include/linux/lockdep.h:14,
>                   from ../include/linux/rcupdate.h:29,
>                   from ../include/linux/rculist.h:11,
>                   from ../include/linux/pid.h:5,
>                   from ../include/linux/sched.h:14,
>                   from ../include/linux/ratelimit.h:6,
>                   from ../include/linux/dev_printk.h:16,
>                   from ../include/linux/device.h:15,
>                   from ../drivers/usb/gadget/function/f_uvc.c:9:
>  In function =E2=80=98fortify_memset_chk=E2=80=99,
>      inlined from =E2=80=98uvc_register_video=E2=80=99 at ../drivers/usb/=
gadget/function/f_uvc.c:424:2:
>  ../include/linux/fortify-string.h:301:25: error: call to =E2=80=98__writ=
e_overflow_field=E2=80=99 declared with attribute warning: detected write b=
eyond size of field (1st parameter); maybe use struct_group()? [-Werror=3Da=
ttribute-warning]
>    301 |                         __write_overflow_field(p_size_field, siz=
e);
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>
>This commit did not directly cause this, it just made the issue more
>obvious. In commit e4ce9ed835bc ("usb: gadget: uvc: ensure the vdev is
>unset"), also authored by you, the size parameter appears to be wrong?
>It is using the size of 'struct uvc_video', instead of the size of
>'struct video_device'. It appears to be pure luck that everything worked
>up until this point, as those two types had the same size (1400 bytes)
>before this change but now 'struct uvc_video' is 1408 bytes, meaning
>there is now an overwrite. Any reason this is not the fix?
>
>Cheers,
>Nathan
>
>diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/func=
tion/f_uvc.c
>index e6948cf8def3..836601227155 100644
>--- a/drivers/usb/gadget/function/f_uvc.c
>+++ b/drivers/usb/gadget/function/f_uvc.c
>@@ -421,7 +421,7 @@ uvc_register_video(struct uvc_device *uvc)
> 	int ret;
>
> 	/* TODO reference counting. */
>-	memset(&uvc->vdev, 0, sizeof(uvc->video));
>+	memset(&uvc->vdev, 0, sizeof(uvc->vdev));
> 	uvc->vdev.v4l2_dev =3D &uvc->v4l2_dev;
> 	uvc->vdev.v4l2_dev->dev =3D &cdev->gadget->dev;
> 	uvc->vdev.fops =3D &uvc_v4l2_fops;
>

This sounds right. Do you send a proper patch?

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmM0pFYACgkQC+njFXoe
LGQCURAAx3Jzc6h61HOyp96voBnmDoCwAqnIu1JtctLrHUgTz2W+O9ndpAkP3Htj
vwbER2mmFjtnBgx4ETIzZXAwPP34KjX7nu6ZwtbXdvFvFn64ti4GH9ARWiG3wY0h
Iy+NjCivD1LthhY0w3t7Yi28LT+rIYEmt4n6eqeT8bzTMFulnjX07m9gAzHWG578
f/qVIXvgqG1uXulUrii5Yjy0XQzI060iCKqioDUnO7ganbjGR5mqQw01ZD0kurtN
WG6MOsp3nIMNNOzF7ViDZousjSgdscNnAKiotKfUyJQOzqYWPVoQqqeKgNCjZDU4
gbdIrKZSzCSFLzGrTmJML4lpIRM/+q79KFGt58CkrdrDA8njT86dWUMsilqMk5WO
+8tntYqUyQHrKhorPaHY6VLKDVp6yg5wcoWJvDDlANOrRTjjfLsrD0g79cWZqY2B
lCQfzTqAPEvhrZRAwAPwPn1Kslj+WilBQhfOjUB+t+ZaqFd7hZJqyhPV6K+zslee
XSrSmKRbmrLTdLO4+JxSxb/EYRP1WGPTdSWRmNtH1DGLZhWSKjylcsw7cbGApjGq
tAMG/he/DSaLazEKPyHYIUiuaNbCfWpXZXaGWKZ6B//KyQ/dVoX+3laUhLMf3FBM
4MXwt8R3VFDt1XAG4O5wV61JTHwxaYCBy19YGCYtO3wcMXnt8FI=
=Ff8D
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
