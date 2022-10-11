Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDB45FBCFA
	for <lists+linux-media@lfdr.de>; Tue, 11 Oct 2022 23:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbiJKVdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Oct 2022 17:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiJKVdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Oct 2022 17:33:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDB392594
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 14:33:01 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oiMrw-00010E-NX; Tue, 11 Oct 2022 23:32:56 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oiMrw-0000MY-B6; Tue, 11 Oct 2022 23:32:56 +0200
Date:   Tue, 11 Oct 2022 23:32:56 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: limit isoc_sg to super speed gadgets
Message-ID: <20221011213256.GI27626@pengutronix.de>
References: <20221011205707.1603017-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BghK6+krpKHjj+jk"
Content-Disposition: inline
In-Reply-To: <20221011205707.1603017-1-m.grzeschik@pengutronix.de>
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


--BghK6+krpKHjj+jk
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 10:57:07PM +0200, Michael Grzeschik wrote:
>The overhead of preparing sg data is high for transfers with limited
>payload. When transferring isoc over high-speed usb the maximum payload
>is rather small which is a good argument no to use sg. This patch is
>changing the uvc_video_encode_isoc_sg encode function only to be used
>for super speed gadgets.
>
>Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>---
> drivers/usb/gadget/function/uvc_video.c | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/=
function/uvc_video.c
>index bb037fcc90e69e..5081eb3bc5484c 100644
>--- a/drivers/usb/gadget/function/uvc_video.c
>+++ b/drivers/usb/gadget/function/uvc_video.c
>@@ -448,6 +448,9 @@ static void uvcg_video_pump(struct work_struct *work)
>  */
> int uvcg_video_enable(struct uvc_video *video, int enable)
> {
>+	struct uvc_device *uvc =3D video->uvc;
>+	struct usb_composite_dev *cdev =3D uvc->func.config->cdev;
>+	struct usb_gadget *gadget =3D cdev->gadget;
> 	unsigned int i;
> 	int ret;
>
>@@ -479,9 +482,11 @@ int uvcg_video_enable(struct uvc_video *video, int en=
able)
> 	if (video->max_payload_size) {
> 		video->encode =3D uvc_video_encode_bulk;
> 		video->payload_size =3D 0;
>-	} else
>-		video->encode =3D video->queue.use_sg ?
>+	} else {
>+		video->encode =3D (video->queue.use_sg &&
>+				 !(gadget->speed <=3D USB_SPEED_HIGH)) ?

I also came up with the following Idea:

-                                !(gadget->speed <=3D USB_SPEED_HIGH)) ?
+                                video->req_size > 4096) ?

Would this threshold of 4096 make sense? What should be preferred?

> 			uvc_video_encode_isoc_sg : uvc_video_encode_isoc;
>+	}
>
> 	video->req_int_count =3D 0;
>
>--=20
>2.30.2
>
>
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--BghK6+krpKHjj+jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmNF4QIACgkQC+njFXoe
LGSaAg/7BlKW1C5OlwmC7obGWyucli27IMagNpQVGuZsarB/0e+qPbdto508zoQ3
/c87DM4KuHPMc1HtH8w5VoLqo56bl3uxMD97vrswMcvZruo/o11hSNlIWu/bxEkv
aEcEtxG6vbVEMJSFIM8X5qW5g1NW+WAJH0oriO0ujytLGp0Szbwxoc5c1l+gknwf
VE4KFbt0ObFDi9CbVmwr6mIKLWGcGI7crwUK+T+bBS6vqqle7X5iz5AO7DI5ucjw
bOcAYnbuTJ7yXE3Oqv20W4iH1IRgfUt1PLQG/Xz7zj7/d8ssXd8h2YNn8VrBQ+cI
1SYK4XPf2ac1p4Z7PNnDbHImYfYv9lNhHq1BWos94+Rxc/QtKdSK60jY9xNP/O9q
Rr3uJWbJwkYaIUrJbdqgs+O1ZCaZesq8heSlyKqF0pvnrgudykDqRiEG/14jllo2
53R+VizM+g+XqMhagx3N2FihAwZ7hOGWoRph+nBZ/ZKs1LQ2/Fi57W4tb7uqpLng
89DEMFF2FkUd64GiHjD1PtJ/H5OT2EPPXHTyNjqbG6Hr9NEpch9+dKsne8vMaqZT
LgZWjVdpqlfMX2FCpORNwkoLW0lbdUp4PimjEWOPkhONge2dmZ5PxIrUv5PW0pWA
ZAwOV9sdYSeYM/IJd0QMXz2ALm8etV2F2CjhZljBdNFF3SYsXNk=
=ISyv
-----END PGP SIGNATURE-----

--BghK6+krpKHjj+jk--
