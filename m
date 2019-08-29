Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCA7A1A3C
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 14:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfH2Mj2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 08:39:28 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58995 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfH2Mj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 08:39:27 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id F0F03FF809;
        Thu, 29 Aug 2019 12:39:23 +0000 (UTC)
Date:   Thu, 29 Aug 2019 14:40:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 09/10] media: i2c: ov5670: Report native size and crop
 bounds
Message-ID: <20190829124055.zxiu7x6abxfhkzch@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-12-jacopo@jmondi.org>
 <db08aa45-922e-e477-9836-cbbc3f17ad8e@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tbdd7zqj7h5afyyc"
Content-Disposition: inline
In-Reply-To: <db08aa45-922e-e477-9836-cbbc3f17ad8e@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tbdd7zqj7h5afyyc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI Hans,

On Thu, Aug 29, 2019 at 12:20:18PM +0200, Hans Verkuil wrote:
> On 8/27/19 11:23 AM, Jacopo Mondi wrote:
> > Report the native pixel array size and the crop bounds for the ov5670
> > sensor driver.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5670.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > index 2bc57e85f721..3e22fe9ccad1 100644
> > --- a/drivers/media/i2c/ov5670.c
> > +++ b/drivers/media/i2c/ov5670.c
> > @@ -2258,6 +2258,25 @@ static int ov5670_set_pad_format(struct v4l2_sub=
dev *sd,
> >  	return 0;
> >  }
> >
> > +static int ov5670_get_selection(struct v4l2_subdev *sd,
> > +				struct v4l2_subdev_pad_config *cfg,
> > +				struct v4l2_subdev_selection *sel)
> > +{
> > +	switch (sel->target) {
> > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > +		sel->r.left =3D 0;
> > +		sel->r.top =3D 0;
> > +		sel->r.width =3D 2592;
> > +		sel->r.height =3D 1944;
>
> Why do you need this?
>

I need to expose the pixel array size and the active pixel area size,
and I interpreted the two above targets as the right place where to do
so.

At least for NATIVE_SIZE the documentation seems to match my
understanding:

"The native size of the device, e.g. a sensor=E2=80=99s pixel array. left a=
nd top
fields are zero for this target."


> Since the format can change for this and the next driver I think CROP_BOU=
NDS
> at least should match the current format.
>

Ah, does it? It was not clear to me from the documentation, as it
suggested to me that target actually identifies the active pixel area

"Bounds of the crop rectangle. All valid crop rectangles fit inside the
crop bounds rectangle."

It does not mention format, should this be updated?

How would you report the two information I need?

> I don't think this patch and the next have anything to do with the locati=
on/rotate
> support. I would split it off from this series.
>

Agreed, they were split in v1, maybe it has not been a wise move to
make a single series out of them. I'll split again.

Thanks
   j

> Regards,
>
> 	Hans
>
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frames)
> >  {
> >  	*frames =3D OV5670_NUM_OF_SKIP_FRAMES;
> > @@ -2425,6 +2444,7 @@ static const struct v4l2_subdev_pad_ops ov5670_pa=
d_ops =3D {
> >  	.enum_mbus_code =3D ov5670_enum_mbus_code,
> >  	.get_fmt =3D ov5670_get_pad_format,
> >  	.set_fmt =3D ov5670_set_pad_format,
> > +	.get_selection =3D ov5670_get_selection,
> >  	.enum_frame_size =3D ov5670_enum_frame_size,
> >  };
> >
> >
>

--tbdd7zqj7h5afyyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1nx9cACgkQcjQGjxah
VjwyXA//TFC3om84oeZRyaWdJg3X97i+QX55dKR6ZbMoYbvRKoESStm32WMlLAJ8
5atdg8bDpfhOqZ7xBeeFYzYE2FIwAu6xT3Fd2R0H2Xpk2FDSg9P/uaizLm/ZFu3R
TwNg62Mr+lnXQaskJ9JHV+ehOLDqR6AvVio53aHDBm07xhkylzVagfvmMQUU0yyT
4FHBg5tIcHhaetMVT0o1df+69tDPs9bVPAjJyYRgE0ZXoijnnZVUwjm8AXt04Tye
5QHhZX47cyzH8ELAUjR/P+w+vLZ7a5o1Nb8U3ppbqf7jV7bYeku75hTZfAVGvA2J
acDr+/X1GSVVCZ+jhY5+waKzSkAnCy5fXjiRy9+mQmlX6cLm4TdIPhFxGgaJBhck
ANClFXLOs6BX1WRe7IhDB5l1CXF4Xz35kfLpB/n/85VYZ1frs87tQqojdjMJj5CE
8R2XQSQj2VgOTdNgo3hrt3QANkdgeMDBWayAYa7+5otV4z8EoMmSdq2cT35k7MHP
FKeOs77al1N7jz9qQycgOrr2e93+K1T7U2VjpBzCqlbhXyA1nzKTWUIwjE3slUsj
0SV2OG16QODQtHS0hzLz3+Lh2T0ldZ0o5NBy32F6BG8odl5U7I5Esd6lk0yGTljd
yZKaZxNLSq8P4JZVGfF8v5VkSYkRZqzYQWS7VULfAtldbVWi7mc=
=/R+F
-----END PGP SIGNATURE-----

--tbdd7zqj7h5afyyc--
