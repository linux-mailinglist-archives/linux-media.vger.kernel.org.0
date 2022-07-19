Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 335AC579DA9
	for <lists+linux-media@lfdr.de>; Tue, 19 Jul 2022 14:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242051AbiGSMxd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Jul 2022 08:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242048AbiGSMxM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Jul 2022 08:53:12 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DF77AB32
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 05:20:50 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 626AFC0003;
        Tue, 19 Jul 2022 12:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1658233248;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ph8RgF2GaLxkC/j2OcG8l20iwRiiLS7SQM53+jFcL3Q=;
        b=ZIBjfUlYDidNvF7SWeDhwLYq3UNblpPLe88/jB5od9snSn+S3yOZQEdvO98hcNG1icB0ds
        vjoSZ4j8Fvs9dXg3TGXiKFgdO3lYCt66BLfG7DJnLJiJceFRhkPDn65xh8KDI1Lc8Hzwpo
        fuPUzrQuhXn5c94WaKcx3Jtd4PWojWj3I3xuLmqOTM+hY8oaYgw0tIlwn1tJcqVw4bySBT
        qv72QukJwfko+UB5gY+DGQYvdq1mW4O+3UxWb+Yc250K5fFwbBjW0I+/uSyJHaqFGZE0tQ
        9paUULbUKu+Po3UBjy+pdJ6/xj86V3fPjknOv3oVwnYbfVFzTGkB+FHWd/j4lw==
Date:   Tue, 19 Jul 2022 14:20:48 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: sunxi: sun6i_mipi_csi2.c/sun8i_a83t_mipi_csi2.c:
 clarify error handling
Message-ID: <YtahoElfO/l/Msfm@aptenodytes>
References: <815bc07c-20ef-86ba-1492-54c77afc7a1f@xs4all.nl>
 <YtZ/VmLgnnn2tlAK@aptenodytes>
 <600d543a-7445-3634-dbf7-cf3b01c6a2a4@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VUfeCa5/wcw5y2Gz"
Content-Disposition: inline
In-Reply-To: <600d543a-7445-3634-dbf7-cf3b01c6a2a4@xs4all.nl>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--VUfeCa5/wcw5y2Gz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hans,

On Tue 19 Jul 22, 12:04, Hans Verkuil wrote:
> On 7/19/22 11:54, Paul Kocialkowski wrote:
> > Hi Hans,
> >=20
> > On Mon 18 Jul 22, 18:08, Hans Verkuil wrote:
> >> Both sun6i_mipi_csi2.c and sun8i_a83t_mipi_csi2.c have the same issue:
> >> the comment before the ret =3D 0 assignment is incorrect, drop it and
> >> always assign the result of the v4l2_subdev_call(..., 0) to ret.
> >=20
> > Not sure what is incorrect about it. I agree that it's good to return t=
he
> > return code of v4l2_subdev_call instead of always 0 on the !on path tho=
ugh.
> >=20
> >> In the disable label check for !on and set ret to 0 in that case.
> >>
> >> This fixes two smatch warnings:
> >>
> >> drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c:193 sun=
6i_mipi_csi2_s_stream() warn: missing error code 'ret'
> >=20
> > I don't think this is legit: the initialization of ret is specifically =
there
> > to avoid an undefined ret there.
>=20
> I believe so as well, but I need to get rid of the smatch warning.

Yes fair enough, I was just a bit confused by the commit message.

> >> drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2=
=2Ec:225 sun8i_a83t_mipi_csi2_s_stream() warn: missing error code 'ret'
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >> ---
> >>  .../media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c | 7 ++++---
> >>  .../sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c      | 7 ++++---
> >>  2 files changed, 8 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_c=
si2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> >> index 31e12f1506cb..a4e3f9a6b2ff 100644
> >> --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> >> +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> >> @@ -182,14 +182,13 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_=
subdev *subdev, int on)
> >>  	unsigned int lanes_count =3D
> >>  		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> >>  	unsigned long pixel_rate;
> >> -	/* Initialize to 0 to use both in disable label (ret !=3D 0) and off=
=2E */
> >> -	int ret =3D 0;
> >> +	int ret;
> >> =20
> >>  	if (!source_subdev)
> >>  		return -ENODEV;
> >> =20
> >>  	if (!on) {
> >> -		v4l2_subdev_call(source_subdev, video, s_stream, 0);
> >> +		ret =3D v4l2_subdev_call(source_subdev, video, s_stream, 0);
> >>  		goto disable;
> >>  	}
> >> =20
> >> @@ -281,6 +280,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_su=
bdev *subdev, int on)
> >>  	return 0;
> >> =20
> >>  disable:
> >> +	if (!on)
> >> +		ret =3D 0;
> >=20
> > Then this will always overwrite the ret value from v4l2_subdev_call wit=
h the
> > !on disable path. Looks like this can be removed.
>=20
> Returning an error when stopping streaming is kind of pointless, since
> what are you going to do with that error?

Yeah that's true and it's probably safer to pretend that things went well
just in case returning !=3D 0 somehow ends up halting the turn-off sequence.

> I assumed that's why the original code did this, and I didn't want to
> change the behavior.

Yeah I think it was my initial intent to discard the v4l2_subdev_call return
code for this reason.

> If you think it is better to just return the error, then that can be a
> patch on top.

Nah I'm fine with returning zero after all. But instead of assigning ret fr=
om
v4l2_subdev_call and then overwriting it conditionally in the disable label,
you could just as well set ret =3D 0; before goto disable; which seems less
confusing to me. I think this should also satisfy the smatch warning.

Otherwise it would be nice to at least have a comment about it or to reflect
the ret overwrite in the commit message (and maybe add a blank like after t=
he
conditional block while at it).

> BTW, I think it would have been better to have separate streamon and stre=
amoff
> ops instead of a single s_stream. Starting streaming would return an int,=
 while
> stopping streaming would be a void function. In general when you stop, re=
lease,
> close, etc. something there is no point in an error code since there is n=
othing
> you can do with it.

Agreed, maybe this can be somehow helpful in sensor drivers where you just =
have
one common bit to start/halt the stream but for more complex subdevs it's n=
ot
very helpful to have a single op.

Cheers,

Paul

> Regards,
>=20
> 	Hans
>=20
> >=20
> > What do you think?
> >=20
> > Paul
> >=20
> >>  	phy_power_off(dphy);
> >>  	sun6i_mipi_csi2_disable(csi2_dev);
> >> =20
> >> diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a=
83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a=
83t_mipi_csi2.c
> >> index c82ede3ca0ff..d052ee77ef0a 100644
> >> --- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mip=
i_csi2.c
> >> +++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mip=
i_csi2.c
> >> @@ -214,14 +214,13 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct =
v4l2_subdev *subdev, int on)
> >>  	unsigned int lanes_count =3D
> >>  		csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> >>  	unsigned long pixel_rate;
> >> -	/* Initialize to 0 to use both in disable label (ret !=3D 0) and off=
=2E */
> >> -	int ret =3D 0;
> >> +	int ret;
> >> =20
> >>  	if (!source_subdev)
> >>  		return -ENODEV;
> >> =20
> >>  	if (!on) {
> >> -		v4l2_subdev_call(source_subdev, video, s_stream, 0);
> >> +		ret =3D v4l2_subdev_call(source_subdev, video, s_stream, 0);
> >>  		goto disable;
> >>  	}
> >> =20
> >> @@ -313,6 +312,8 @@ static int sun8i_a83t_mipi_csi2_s_stream(struct v4=
l2_subdev *subdev, int on)
> >>  	return 0;
> >> =20
> >>  disable:
> >> +	if (!on)
> >> +		ret =3D 0;
> >>  	phy_power_off(dphy);
> >>  	sun8i_a83t_mipi_csi2_disable(csi2_dev);
> >> =20
> >> --=20
> >> 2.35.1
> >>
> >=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--VUfeCa5/wcw5y2Gz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmLWoZ8ACgkQ3cLmz3+f
v9GfUgf9GMtdvBHbWjyrak1Gx0vFugqi7d/3IKIrmzwqZy7vwY8oFTwYqK+bkaoa
4K9kVfM7jQfg5J91ecIWuHkXlKKqKWs3bXv+ijsnCjodlaT8ZOebWePUY6xEJ4oA
x7QOOMeh4lOClnN2ThJOWn5KavEnQoohk9joN+6HYknYvHLqto4B4Y/2tgIxIBxr
ia2Q4L9jfqvyVU55SosWNo6iWGZIS3ZhQFoR9a9e7oXX9GY4E4DqQ1ZgKheQkRIf
qcFA4dMJu5Zc/LzZowCVilszTcs0rdpM/IGOCkyBcJvbuzlSizu62zFCr1I677KF
4ENW3EAOMIQL/wPIFgGu/CWbrXhIlg==
=rXIy
-----END PGP SIGNATURE-----

--VUfeCa5/wcw5y2Gz--
