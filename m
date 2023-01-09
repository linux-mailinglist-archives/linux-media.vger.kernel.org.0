Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFD4B663359
	for <lists+linux-media@lfdr.de>; Mon,  9 Jan 2023 22:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbjAIVmK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Jan 2023 16:42:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238142AbjAIVlq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Jan 2023 16:41:46 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A74C12613
        for <linux-media@vger.kernel.org>; Mon,  9 Jan 2023 13:41:30 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pEztY-0000Xk-Qu; Mon, 09 Jan 2023 22:41:28 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1pEztX-0003KR-Tk; Mon, 09 Jan 2023 22:41:27 +0100
Date:   Mon, 9 Jan 2023 22:41:27 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3] media: uvcvideo: Remove format descriptions
Message-ID: <20230109214127.GA6064@pengutronix.de>
References: <20230106235242.9536-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline
In-Reply-To: <20230106235242.9536-1-laurent.pinchart@ideasonboard.com>
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


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 07, 2023 at 01:52:42AM +0200, Laurent Pinchart wrote:
>The V4L2 core overwrites format descriptions in v4l_fill_fmtdesc(),
>there's no need to manually set the descriptions in the driver. This
>prepares for removal of the format descriptions from the uvc_fmts table.
>
>Unlike V4L2, UVC makes a distinction between the SD-DV, SDL-DV and HD-DV
>formats. It also indicates whether the DV format uses 50Hz or 60Hz. This
>information is parsed by the driver to construct a format name string
>that is printed in a debug message, but serves no other purpose as V4L2
>has a single V4L2_PIX_FMT_DV pixel format that covers all those cases.
>
>As the information is available in the UVC descriptors, and thus
>accessible to users with lsusb if they really care, don't log it in a
>debug message and drop the format name string to simplify the code.
>
>Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>---
>Changes since v2:
>
>- Squash "media: uvcvideo: Remove format descriptions" and "media:
>  uvcvideo: Drop custom format names for DV formats"
>- Don't replace %pUl with %p4cc when the format is unknown
>- Print debug message even if fcc is 0
>---
> drivers/media/usb/uvc/uvc_driver.c | 18 ++----------------
> drivers/media/usb/uvc/uvc_v4l2.c   |  2 --
> drivers/media/usb/uvc/uvcvideo.h   |  2 --
> 3 files changed, 2 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uv=
c_driver.c
>index 57c948d47bbf..3318ec8ae7ef 100644
>--- a/drivers/media/usb/uvc/uvc_driver.c
>+++ b/drivers/media/usb/uvc/uvc_driver.c
>@@ -252,14 +252,10 @@ static int uvc_parse_format(struct uvc_device *dev,
> 		fmtdesc =3D uvc_format_by_guid(&buffer[5]);
>
> 		if (fmtdesc !=3D NULL) {
>-			strscpy(format->name, fmtdesc->name,
>-				sizeof(format->name));
> 			format->fcc =3D fmtdesc->fcc;
> 		} else {
> 			dev_info(&streaming->intf->dev,
> 				 "Unknown video format %pUl\n", &buffer[5]);
>-			snprintf(format->name, sizeof(format->name), "%pUl\n",
>-				&buffer[5]);
> 			format->fcc =3D 0;
> 		}
>
>@@ -271,8 +267,6 @@ static int uvc_parse_format(struct uvc_device *dev,
> 		 */
> 		if (dev->quirks & UVC_QUIRK_FORCE_Y8) {
> 			if (format->fcc =3D=3D V4L2_PIX_FMT_YUYV) {
>-				strscpy(format->name, "Greyscale 8-bit (Y8  )",
>-					sizeof(format->name));
> 				format->fcc =3D V4L2_PIX_FMT_GREY;
> 				format->bpp =3D 8;
> 				width_multiplier =3D 2;
>@@ -313,7 +307,6 @@ static int uvc_parse_format(struct uvc_device *dev,
> 			return -EINVAL;
> 		}
>
>-		strscpy(format->name, "MJPEG", sizeof(format->name));
> 		format->fcc =3D V4L2_PIX_FMT_MJPEG;
> 		format->flags =3D UVC_FMT_FLAG_COMPRESSED;
> 		format->bpp =3D 0;
>@@ -331,14 +324,10 @@ static int uvc_parse_format(struct uvc_device *dev,
>
> 		switch (buffer[8] & 0x7f) {
> 		case 0:
>-			strscpy(format->name, "SD-DV", sizeof(format->name));
>-			break;
> 		case 1:
>-			strscpy(format->name, "SDL-DV", sizeof(format->name));
>-			break;
> 		case 2:
>-			strscpy(format->name, "HD-DV", sizeof(format->name));
> 			break;
>+
> 		default:

Couldn't this become an simple if instead of this odd looking switch?

		if (buffer[8] & 0x7f) > 2)

With that change you can add:

Reviewed-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

> 			uvc_dbg(dev, DESCR,
> 				"device %d videostreaming interface %d: unknown DV format %u\n",
>@@ -347,9 +336,6 @@ static int uvc_parse_format(struct uvc_device *dev,
> 			return -EINVAL;
> 		}
>
>-		strlcat(format->name, buffer[8] & (1 << 7) ? " 60Hz" : " 50Hz",
>-			sizeof(format->name));
>-
> 		format->fcc =3D V4L2_PIX_FMT_DV;
> 		format->flags =3D UVC_FMT_FLAG_COMPRESSED | UVC_FMT_FLAG_STREAM;
> 		format->bpp =3D 0;
>@@ -376,7 +362,7 @@ static int uvc_parse_format(struct uvc_device *dev,
> 		return -EINVAL;
> 	}
>
>-	uvc_dbg(dev, DESCR, "Found format %s\n", format->name);
>+	uvc_dbg(dev, DESCR, "Found format %p4cc", &format->fcc);
>
> 	buflen -=3D buffer[0];
> 	buffer +=3D buffer[0];
>diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_=
v4l2.c
>index 0f4a39324062..35453f81c1d9 100644
>--- a/drivers/media/usb/uvc/uvc_v4l2.c
>+++ b/drivers/media/usb/uvc/uvc_v4l2.c
>@@ -712,8 +712,6 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *st=
ream,
> 	fmt->flags =3D 0;
> 	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
> 		fmt->flags |=3D V4L2_FMT_FLAG_COMPRESSED;
>-	strscpy(fmt->description, format->name, sizeof(fmt->description));
>-	fmt->description[sizeof(fmt->description) - 1] =3D 0;
> 	fmt->pixelformat =3D format->fcc;
> 	return 0;
> }
>diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcv=
ideo.h
>index c5a1c1c9d49e..e85df8deb965 100644
>--- a/drivers/media/usb/uvc/uvcvideo.h
>+++ b/drivers/media/usb/uvc/uvcvideo.h
>@@ -263,8 +263,6 @@ struct uvc_format {
> 	u32 fcc;
> 	u32 flags;
>
>-	char name[32];
>-
> 	unsigned int nframes;
> 	struct uvc_frame *frame;
> };
>
>base-commit: d3428667a95be621bfffe70e5bf2e607bbf7e049
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

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmO8igUACgkQC+njFXoe
LGSQMA//V13c8ayAAaxoA2YIvQDeRT8yobEcomczB/k0IO9d/rNdF78V/xKamhq5
27Lo3GEgk3ebJUFR7MpkEscKpuLlfJ5LpWp3X9l5tJIGdn1oqpifMVhyAn0OPAtf
j6llWo2DQoAu07at2XnjGzuDB5/jVMppV2N7ATgYoxYMzv9ZEaLT8u2JLHg6XEfx
MjsetRlEjOEOjoOZaPbyjs+ic7SRvK96bCfrnVsVLja0q/LG/YJBbW+e8zKL9NrD
4Ls1+3Ij6TJc9XZnV/f/jAmjMzKrm4oM7uueXTZ9IOuzIx8x8suiq5FOONkOrZqK
IIc/bC5XILByYZ4ot6DrdCGDqIimKcCyj22Ul9aqPWys0t5Rc6SBwlCmiS3btWmH
fyF+vAIjmo9CNrhtLCuI1n5i3qxDMhk6nG55ykJJBjES4yJ6GjuW023ziJBk8sN1
q7XKreq7Jnb69gOQxsjXqLLAUnZDLcVEa/9HHN6pLWGh6VKgbiSjl68Ss4an548y
nyTWe1ecFUurHue1ZNzWbOzH0H0NsCTZNDDSon68x5GOb0O5qKD8bWBDga22oBrD
Lp/pmWC04V5EIa1Uvn3H1BaCD11pafDYhFcbgbIz9/t7QQ2retPwhwqBVY4xojD6
a3dWYL+W3T3IColE8+dJdoyM1XpStY9ocfKWjl+iif/ou/IvcvM=
=LTir
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
