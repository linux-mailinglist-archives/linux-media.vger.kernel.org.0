Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D17E4A2127
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 18:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbfH2QmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 12:42:02 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:46735 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfH2QmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 12:42:02 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DE704C000C;
        Thu, 29 Aug 2019 16:41:58 +0000 (UTC)
Date:   Thu, 29 Aug 2019 18:43:30 +0200
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
Message-ID: <20190829164330.7bshpd52non7ivqi@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-12-jacopo@jmondi.org>
 <db08aa45-922e-e477-9836-cbbc3f17ad8e@xs4all.nl>
 <20190829124055.zxiu7x6abxfhkzch@uno.localdomain>
 <0df4ef45-ba3f-98b9-878e-8cdd2bf307f6@xs4all.nl>
 <20190829131842.rptvouuir3ubqf4a@uno.localdomain>
 <f282b92b-515d-09fd-20d1-cfec53c84332@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sesjiyxe3vhrl45a"
Content-Disposition: inline
In-Reply-To: <f282b92b-515d-09fd-20d1-cfec53c84332@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--sesjiyxe3vhrl45a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Thu, Aug 29, 2019 at 03:39:43PM +0200, Hans Verkuil wrote:
> On 8/29/19 3:18 PM, Jacopo Mondi wrote:
> > Hi Hans
> >
> > On Thu, Aug 29, 2019 at 02:55:30PM +0200, Hans Verkuil wrote:
> >> On 8/29/19 2:40 PM, Jacopo Mondi wrote:
> >>> HI Hans,
> >>>
> >>> On Thu, Aug 29, 2019 at 12:20:18PM +0200, Hans Verkuil wrote:
> >>>> On 8/27/19 11:23 AM, Jacopo Mondi wrote:
> >>>>> Report the native pixel array size and the crop bounds for the ov56=
70
> >>>>> sensor driver.
> >>>>>
> >>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>> ---
> >>>>>  drivers/media/i2c/ov5670.c | 20 ++++++++++++++++++++
> >>>>>  1 file changed, 20 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> >>>>> index 2bc57e85f721..3e22fe9ccad1 100644
> >>>>> --- a/drivers/media/i2c/ov5670.c
> >>>>> +++ b/drivers/media/i2c/ov5670.c
> >>>>> @@ -2258,6 +2258,25 @@ static int ov5670_set_pad_format(struct v4l2=
_subdev *sd,
> >>>>>  	return 0;
> >>>>>  }
> >>>>>
> >>>>> +static int ov5670_get_selection(struct v4l2_subdev *sd,
> >>>>> +				struct v4l2_subdev_pad_config *cfg,
> >>>>> +				struct v4l2_subdev_selection *sel)
> >>>>> +{
> >>>>> +	switch (sel->target) {
> >>>>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >>>>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> >>>>> +		sel->r.left =3D 0;
> >>>>> +		sel->r.top =3D 0;
> >>>>> +		sel->r.width =3D 2592;
> >>>>> +		sel->r.height =3D 1944;
> >>>>
> >>>> Why do you need this?
> >>>>
> >>>
> >>> I need to expose the pixel array size and the active pixel area size,
> >>> and I interpreted the two above targets as the right place where to do
> >>> so.
> >>
> >> That didn't answer my question :-)
> >>
> >> Why do you need to expose this? Who uses it for what purpose?
> >>
> >
> > Ah, ok :)
> >
> > Quoting the cover letter of the series:
> >
> > Retrieving the following camera static information is a requirement for=
 the
> > implementation of the Android-compatiblity layer of libcamera, but I'm =
sure
> > it might prove useful for other user-space applications and libraries a=
s well.
> >
> > In other words, in order to report to the android camera stack those
> > two information (among -many- others) they should be somehow retrieved
> > from the kernel interface, and after considering adding two more
> > read-only controls to expose them as I did for rotation and location,
> > I went for using the selection API.
> >
> >>>
> >>> At least for NATIVE_SIZE the documentation seems to match my
> >>> understanding:
> >>>
> >>> "The native size of the device, e.g. a sensor=E2=80=99s pixel array. =
left and top
> >>> fields are zero for this target."
> >>
> >> Correct.
> >>
> >>>
> >>>
> >>>> Since the format can change for this and the next driver I think CRO=
P_BOUNDS
> >>>> at least should match the current format.
> >>>>
> >>>
> >>> Ah, does it? It was not clear to me from the documentation, as it
> >>> suggested to me that target actually identifies the active pixel area
> >>>
> >>> "Bounds of the crop rectangle. All valid crop rectangles fit inside t=
he
> >>> crop bounds rectangle."
> >>>
> >>> It does not mention format, should this be updated?
> >>
> >> The problem is that for sensors it is indeed not clear.
> >>
> >> In principle the crop bounds matches the resolution that the sensor us=
es
> >> pre-scaling. So yes, that means that it is equal to the native size.
> >
> > native size !=3D active areas size.
> > Did you mean the latter here?
>
> I mean the latter, but I have to say that the spec doesn't make it clear
> if TGT_NATIVE_SIZE equals the active area or also includes inactive pixel=
s.
>
> What exactly does Android expect?
>
Ah! You asked for this, so be prepared...

I started by trying to retrieve from the kernel interface the
following parameters:

The pixel array size
https://jmondi.org/android_metadata_tags/docs.html#static_android.sensor.in=
fo.pixelArraySize
The physical dimensions of the sensor (TODO)
https://jmondi.org/android_metadata_tags/docs.html#static_android.sensor.in=
fo.physicalSize
The active area size:
https://jmondi.org/android_metadata_tags/docs.html#static_android.sensor.in=
fo.activeArraySize
Sensor orientation:
https://jmondi.org/android_metadata_tags/docs.html#static_android.sensor.or=
ientation
Location:
https://jmondi.org/android_metadata_tags/docs.html#static_android.lens.faci=
ng

For very simple cameras there are not many more informations about
sensor/lens to be retrieved, but if you look at the end of the page you can
see a list of other informations Android requires for more advanced use case
(not so advanced actually, those are expected to be there for any
recent modern phone device I guess)

It's a long list, with many details about the sensor, lens and the
capabilities of the camera.

Just to provide an example list:
android.lens.info.availableApertures (static)
android.lens.info.availableFilterDensities (static)
android.lens.info.availableFocalLengths (static)
android.lens.info.availableOpticalStabilization (static)
android.lens.info.minimumFocusDistance (static)
android.lens.info.shadingMapSize (static)
android.lens.info.focusDistanceCalibration (static)
android.sensor.info.sensitivityRange (static)
android.sensor.info.exposureTimeRange (static)
android.sensor.info.maxFrameDuration (static)
android.sensor.info.physicalSize (static)
android.sensor.info.timestampSource (static)
android.sensor.maxAnalogSensitivity (static)

And they grow up to the point of describing the color transformation
matrices and other low level details, if your device claim to support
raw capture and manipulation:
android.sensor.info.colorFilterArrangement (static)
android.sensor.info.whiteLevel (static)
android.sensor.info.preCorrectionActiveArraySize (static)
android.sensor.referenceIlluminant1 (static)
android.sensor.referenceIlluminant2 (static)
android.sensor.calibrationTransform1 (static)
android.sensor.calibrationTransform2 (static)
android.sensor.colorTransform1 (static)
android.sensor.colorTransform2 (static)
android.sensor.forwardMatrix1 (static)
android.sensor.forwardMatrix2 (static)
android.sensor.blackLevelPattern (static)
android.sensor.profileHueSatMapDimensions (static)

So, going forward I cannot tell how much of this could actually come
=66rom V4L, ideally all of this, but as of today it's not possible, so
vendors keep adding custom solutions to support this with out-of-tree
drivers or find solutions to generate these information from
configuration files in user space.

For libcamera this is not possible, it aims to build on top of
standard v4l2 interfaces, so I've started the process of adding small
bits to v4l2 to at least retrieve the most basic information.

> >
> >>
> >> But many sensors have a discrete list of supported formats and it is n=
ot
> >> clear how they map each format to the actual sensor. If it is clearly =
just
> >> done through binning or averaging, then all is fine.
> >>
> >> If the formats have different aspect ratios, then it becomes a bit more
> >> difficult how to relate the crop bounds with the format since you may =
not
> >> know to which sensor area the current format corresponds.
> >
> > I see. We've had the same discussion in the libcamera list, as indeed
> > the crop bounds might depend on the aspect ratio as you said.
> >
> > Maybe the crop_bound target is not the right place to report the
> > active area, or maybe the concept of active area is ill-defined if
> > the sensor is cross-shaped:
> >
> >     /--------------------/ -> Pixel array size
> >     ----------------------
> >     |x    |        |--- x|------> 4:3 crop bounds
> >     |x------------------x|
> >     |x|   |        |   |x|
> >     |x|   |        |   |x|------> 21:9 crop bounds
> >     |x|   |        |   |x|
> >     |x------------------x|
> >     |x    |________|    x|
> >     ----------------------
> >       |                 |
> >       ---------------------------> Black pixels colums
> >
> >>
> >> I have no clear answer for you, to be honest, but it can get tricky.
> >>
> >
> > Indeed, but assuming a simpler square-shaped sensor, is the crop bound
> > target the right one to report the active pixel area ?
>
> I don't think so.
>
> The crop bounds defines the outer bounds of the area where you can put
> your crop rectangle. This can very well include areas where the pixels
> are covered and so always return black (sometimes used to obtain black
> levels, I believe).

Ah, I didn't considered black pixels as part of a possible crop
selection..

>
> The default crop rectangle would be the one that reports the active
> area. The native size rectangle would be the full pixel array.
>
> So CROP_DEFAULT <=3D CROP_BOUNDS <=3D NATIVE_SIZE.
>

I see thanks for clarifying this

> For a cross-shaped sensor I would expect that the CROP_BOUNDS/DEFAULT
> depends on the format (aspect ratio).

Currently the selection API do not support to retrieve that
information depending on the aspect-ratio though
>
> I think this makes sense.
>
> The specification definitely needs to be improved, patches are welcome...
>
> >
> >>>
> >>> How would you report the two information I need?
> >>
> >> It depends on my original question: what do you need this information =
for?
> >>
> >
> > Please note that it's for the android camera stack in this case, but
> > it's an information that userspace might want to know for several
> > different reasons. Calibration and FOV calculation come to mind. Does
> > this makes sense to you?
>
> Ah, so that's what it is used for :-)
>
> Which of the three targets above would match with what Android needs?
>

the full pixel array size would be reported by the NATIVE_SIZE target
the active area size by the CROP_DEFAULT rectangle (regardless of the
aspect ratio)

It's still not clear to me what the CROP_BOUNDS rectangle would then
be used for, unless it is made to be dependent on an aspect ratio but
that would require userspace to provide a populated rectangle to
G_SELECTION and drivers to inspect it and return an opportune
CROP_BOUNDS one. Would this be acceptable ?

Thanks
  j

> Regards,
>
> 	Hans
>
> >
> > Thanks
> >    j
> >
> >> Regards,
> >>
> >> 	Hans
> >>
> >>>
> >>>> I don't think this patch and the next have anything to do with the l=
ocation/rotate
> >>>> support. I would split it off from this series.
> >>>>
> >>>
> >>> Agreed, they were split in v1, maybe it has not been a wise move to
> >>> make a single series out of them. I'll split again.
> >>>
> >>> Thanks
> >>>    j
> >>>
> >>>> Regards,
> >>>>
> >>>> 	Hans
> >>>>
> >>>>> +		break;
> >>>>> +	default:
> >>>>> +		return -EINVAL;
> >>>>> +	}
> >>>>> +
> >>>>> +	return 0;
> >>>>> +}
> >>>>> +
> >>>>>  static int ov5670_get_skip_frames(struct v4l2_subdev *sd, u32 *fra=
mes)
> >>>>>  {
> >>>>>  	*frames =3D OV5670_NUM_OF_SKIP_FRAMES;
> >>>>> @@ -2425,6 +2444,7 @@ static const struct v4l2_subdev_pad_ops ov567=
0_pad_ops =3D {
> >>>>>  	.enum_mbus_code =3D ov5670_enum_mbus_code,
> >>>>>  	.get_fmt =3D ov5670_get_pad_format,
> >>>>>  	.set_fmt =3D ov5670_set_pad_format,
> >>>>> +	.get_selection =3D ov5670_get_selection,
> >>>>>  	.enum_frame_size =3D ov5670_enum_frame_size,
> >>>>>  };
> >>>>>
> >>>>>
> >>>>
> >>
>

--sesjiyxe3vhrl45a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1oALIACgkQcjQGjxah
VjylXw/+IaAaEh+IS5WnBIJiWZmQoD7IixmE7CiDCkhmL+f7WCIBME6Cnvg7cMr6
FUFy+p/kLgg8RrD2nAYQ4OcDb5thr5O7GtUfYSdxaz9qAZoe1iw1Q0sSHez03wWs
LvZSHzg5pWLILLU3CAmj+IBtayL4RZtxe9dKxuV6T62iSI3r2cTQOBJ5wAo3nZbj
V/j6IDb1MEx6ztNM+gjd3kYxBd4XfNY4+L4Za65sU53UipE4TTmvNOxo30kaI4IL
xb3dLGsXJscoK/U0xUZbP1uEZK+V50GE4icvFEu/kkywcYKL0gODmmbA3+N/74Je
TIdGd8iJrf+hyLdq0RdLJxfoArkuoXQrUo1agNOhLWu0HGjhi8RM7Ccc6vP7jbsu
+qY0KVwppnl+HFjrOTm4k6oNVvsygcDa5Wsl6LtIz9QPZfPwEyneUy/vumXqzCCE
9iBchSdPoiY8q1Rk9vAGaPLkkISZmo3nOIPrf2rNHvaxC6PlN+6yt8P0jUtFn1XB
nj4nfbjxj2lFyeNzYbqGBJjozS1KbseOQhmkOCdF/Fl8iYUWUUolxmNGpkCrFxn5
5Axfi73EMIIye0a8kCci+7JD0HEsgXuRVfh9ig+dHDyOzwC7UM/npCD9O0NT0Reo
kUAKzcc8bJSs3CIPQGi7HM+TV5AALaNzm1TGRD1OFUqmZ4IKUVs=
=uQjB
-----END PGP SIGNATURE-----

--sesjiyxe3vhrl45a--
