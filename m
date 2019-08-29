Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2096FA1B33
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 15:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfH2NRU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 09:17:20 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:54361 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfH2NRU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 09:17:20 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 9B46D1C0011;
        Thu, 29 Aug 2019 13:17:15 +0000 (UTC)
Date:   Thu, 29 Aug 2019 15:18:42 +0200
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
Message-ID: <20190829131842.rptvouuir3ubqf4a@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-12-jacopo@jmondi.org>
 <db08aa45-922e-e477-9836-cbbc3f17ad8e@xs4all.nl>
 <20190829124055.zxiu7x6abxfhkzch@uno.localdomain>
 <0df4ef45-ba3f-98b9-878e-8cdd2bf307f6@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ups7cwpo3vh2oipj"
Content-Disposition: inline
In-Reply-To: <0df4ef45-ba3f-98b9-878e-8cdd2bf307f6@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ups7cwpo3vh2oipj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans

On Thu, Aug 29, 2019 at 02:55:30PM +0200, Hans Verkuil wrote:
> On 8/29/19 2:40 PM, Jacopo Mondi wrote:
> > HI Hans,
> >
> > On Thu, Aug 29, 2019 at 12:20:18PM +0200, Hans Verkuil wrote:
> >> On 8/27/19 11:23 AM, Jacopo Mondi wrote:
> >>> Report the native pixel array size and the crop bounds for the ov5670
> >>> sensor driver.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>> ---
> >>>  drivers/media/i2c/ov5670.c | 20 ++++++++++++++++++++
> >>>  1 file changed, 20 insertions(+)
> >>>
> >>> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> >>> index 2bc57e85f721..3e22fe9ccad1 100644
> >>> --- a/drivers/media/i2c/ov5670.c
> >>> +++ b/drivers/media/i2c/ov5670.c
> >>> @@ -2258,6 +2258,25 @@ static int ov5670_set_pad_format(struct v4l2_s=
ubdev *sd,
> >>>  	return 0;
> >>>  }
> >>>
> >>> +static int ov5670_get_selection(struct v4l2_subdev *sd,
> >>> +				struct v4l2_subdev_pad_config *cfg,
> >>> +				struct v4l2_subdev_selection *sel)
> >>> +{
> >>> +	switch (sel->target) {
> >>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> >>> +		sel->r.left =3D 0;
> >>> +		sel->r.top =3D 0;
> >>> +		sel->r.width =3D 2592;
> >>> +		sel->r.height =3D 1944;
> >>
> >> Why do you need this?
> >>
> >
> > I need to expose the pixel array size and the active pixel area size,
> > and I interpreted the two above targets as the right place where to do
> > so.
>
> That didn't answer my question :-)
>
> Why do you need to expose this? Who uses it for what purpose?
>

Ah, ok :)

Quoting the cover letter of the series:

Retrieving the following camera static information is a requirement for the
implementation of the Android-compatiblity layer of libcamera, but I'm sure
it might prove useful for other user-space applications and libraries as we=
ll.

In other words, in order to report to the android camera stack those
two information (among -many- others) they should be somehow retrieved
=66rom the kernel interface, and after considering adding two more
read-only controls to expose them as I did for rotation and location,
I went for using the selection API.

> >
> > At least for NATIVE_SIZE the documentation seems to match my
> > understanding:
> >
> > "The native size of the device, e.g. a sensor=E2=80=99s pixel array. le=
ft and top
> > fields are zero for this target."
>
> Correct.
>
> >
> >
> >> Since the format can change for this and the next driver I think CROP_=
BOUNDS
> >> at least should match the current format.
> >>
> >
> > Ah, does it? It was not clear to me from the documentation, as it
> > suggested to me that target actually identifies the active pixel area
> >
> > "Bounds of the crop rectangle. All valid crop rectangles fit inside the
> > crop bounds rectangle."
> >
> > It does not mention format, should this be updated?
>
> The problem is that for sensors it is indeed not clear.
>
> In principle the crop bounds matches the resolution that the sensor uses
> pre-scaling. So yes, that means that it is equal to the native size.

native size !=3D active areas size.
Did you mean the latter here?

>
> But many sensors have a discrete list of supported formats and it is not
> clear how they map each format to the actual sensor. If it is clearly just
> done through binning or averaging, then all is fine.
>
> If the formats have different aspect ratios, then it becomes a bit more
> difficult how to relate the crop bounds with the format since you may not
> know to which sensor area the current format corresponds.

I see. We've had the same discussion in the libcamera list, as indeed
the crop bounds might depend on the aspect ratio as you said.

Maybe the crop_bound target is not the right place to report the
active area, or maybe the concept of active area is ill-defined if
the sensor is cross-shaped:

    /--------------------/ -> Pixel array size
    ----------------------
    |x    |        |--- x|------> 4:3 crop bounds
    |x------------------x|
    |x|   |        |   |x|
    |x|   |        |   |x|------> 21:9 crop bounds
    |x|   |        |   |x|
    |x------------------x|
    |x    |________|    x|
    ----------------------
      |                 |
      ---------------------------> Black pixels colums

>
> I have no clear answer for you, to be honest, but it can get tricky.
>

Indeed, but assuming a simpler square-shaped sensor, is the crop bound
target the right one to report the active pixel area ?

> >
> > How would you report the two information I need?
>
> It depends on my original question: what do you need this information for?
>

Please note that it's for the android camera stack in this case, but
it's an information that userspace might want to know for several
different reasons. Calibration and FOV calculation come to mind. Does
this makes sense to you?

Thanks
   j

> Regards,
>
> 	Hans
>
> >
> >> I don't think this patch and the next have anything to do with the loc=
ation/rotate
> >> support. I would split it off from this series.
> >>
> >
> > Agreed, they were split in v1, maybe it has not been a wise move to
> > make a single series out of them. I'll split again.
> >
> > Thanks
> >    j
> >
> >> Regards,
> >>
> >> 	Hans
> >>
> >>> +		break;
> >>> +	default:
> >>> +		return -EINVAL;
> >>> +	}
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>>  static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *frame=
s)
> >>>  {
> >>>  	*frames =3D OV5670_NUM_OF_SKIP_FRAMES;
> >>> @@ -2425,6 +2444,7 @@ static const struct v4l2_subdev_pad_ops ov5670_=
pad_ops =3D {
> >>>  	.enum_mbus_code =3D ov5670_enum_mbus_code,
> >>>  	.get_fmt =3D ov5670_get_pad_format,
> >>>  	.set_fmt =3D ov5670_set_pad_format,
> >>> +	.get_selection =3D ov5670_get_selection,
> >>>  	.enum_frame_size =3D ov5670_enum_frame_size,
> >>>  };
> >>>
> >>>
> >>
>

--ups7cwpo3vh2oipj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1n0LIACgkQcjQGjxah
Vjx1rhAAioNHwVNTOQr6WBWnUUZTMTb98327WUcRxKEMp1by7u7/UPu769r3Znqh
qJjTCg4PtOx6CWi+RYZnwed0T1u4Whx68AKVb59GnFuS+qReZXbL1OoctOeFKR+l
RGHcD5hH842w++SfM0XPX63aI9awzGA+laLPo78JkEgmp9lNZkuGMPNVlOua4pu0
O/j+8W9EypWhvzt1IiN/csmVvmcjzzYX+QOVLpprP+6o/D17hUlpj4Jlls5MHAUf
6K8lwK4IdZeqXkvCxfUtYRksXizOwVKmHIu6eFNpYyfxHR2kx2tiiHUHuXpXYPBk
EuilXmTuaZlSXYxow2MmdxNjDZwIdNBA/FulC+sx0dvgaiEJUwhFzM5L/KBzar+j
KGjGhmv1+wb+Aya6IuHq6tBsvQkM0rttZJ1mYXACjufpZp0DktYphW/29O9FdATy
sKCAFM7we1++d3lA+96+19VsvJCvSTNYEwoJDjwsqfpSHnMMpPia6Ae+AWOLxew4
z4H+xDOIGc4tOBxPuSiD9dUA4cOifcsCPY/zu6A9ucc2WJ6/eY5RlstV+PXWZ3yM
8cWJpQ3D7N4VmNXUdB9SAYtjhaeq5RRhjr9rCX1N7BC82nG22knF/uEt8DDyG+H8
fapAW0X353pbBeE0maoZs4fRdBF9vzjdIbJynfx8jawIqkc9CKg=
=tVVQ
-----END PGP SIGNATURE-----

--ups7cwpo3vh2oipj--
