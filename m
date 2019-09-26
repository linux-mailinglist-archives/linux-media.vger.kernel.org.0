Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2722BF9AB
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 20:55:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbfIZSzZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 14:55:25 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:54579 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfIZSzY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 14:55:24 -0400
X-Originating-IP: 37.176.121.220
Received: from uno.localdomain (mob-37-176-121-220.net.vodafone.it [37.176.121.220])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 62F7640003;
        Thu, 26 Sep 2019 18:55:16 +0000 (UTC)
Date:   Thu, 26 Sep 2019 20:56:50 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 09/10] media: i2c: ov5670: Report native size and crop
 bounds
Message-ID: <20190926185650.yu32oa5gqxsat6zm@uno.localdomain>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-12-jacopo@jmondi.org>
 <db08aa45-922e-e477-9836-cbbc3f17ad8e@xs4all.nl>
 <20190829124055.zxiu7x6abxfhkzch@uno.localdomain>
 <0df4ef45-ba3f-98b9-878e-8cdd2bf307f6@xs4all.nl>
 <20190903130626.GR5475@paasikivi.fi.intel.com>
 <20190903164956.hyf326hyzmvpubdv@uno.localdomain>
 <053f799d-bba1-ccd0-a3f3-38286761608d@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6nif5qjuvlkql74t"
Content-Disposition: inline
In-Reply-To: <053f799d-bba1-ccd0-a3f3-38286761608d@xs4all.nl>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6nif5qjuvlkql74t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans, thanks for the lenghty reply

On Thu, Sep 26, 2019 at 10:11:51AM +0200, Hans Verkuil wrote:
> On 9/3/19 6:49 PM, Jacopo Mondi wrote:
> > Hi Sakari, Hans,
> >
> > On Tue, Sep 03, 2019 at 04:06:26PM +0300, Sakari Ailus wrote:
> >> Hi Hans, Jacopo,
> >>
> >> On Thu, Aug 29, 2019 at 02:55:30PM +0200, Hans Verkuil wrote:
> >>> On 8/29/19 2:40 PM, Jacopo Mondi wrote:
> >>>> HI Hans,
> >>>>
> >>>> On Thu, Aug 29, 2019 at 12:20:18PM +0200, Hans Verkuil wrote:
> >>>>> On 8/27/19 11:23 AM, Jacopo Mondi wrote:
> >>>>>> Report the native pixel array size and the crop bounds for the ov5=
670
> >>>>>> sensor driver.
> >>>>>>
> >>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>>> ---
> >>>>>>  drivers/media/i2c/ov5670.c | 20 ++++++++++++++++++++
> >>>>>>  1 file changed, 20 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670=
=2Ec
> >>>>>> index 2bc57e85f721..3e22fe9ccad1 100644
> >>>>>> --- a/drivers/media/i2c/ov5670.c
> >>>>>> +++ b/drivers/media/i2c/ov5670.c
> >>>>>> @@ -2258,6 +2258,25 @@ static int ov5670_set_pad_format(struct v4l=
2_subdev *sd,
> >>>>>>  	return 0;
> >>>>>>  }
> >>>>>>
> >>>>>> +static int ov5670_get_selection(struct v4l2_subdev *sd,
> >>>>>> +				struct v4l2_subdev_pad_config *cfg,
> >>>>>> +				struct v4l2_subdev_selection *sel)
> >>>>>> +{
> >>>>>> +	switch (sel->target) {
> >>>>>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >>>>>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> >>>>>> +		sel->r.left =3D 0;
> >>>>>> +		sel->r.top =3D 0;
> >>>>>> +		sel->r.width =3D 2592;
> >>>>>> +		sel->r.height =3D 1944;
> >>>>>
> >>>>> Why do you need this?
> >>>>>
> >>>>
> >>>> I need to expose the pixel array size and the active pixel area size,
> >>>> and I interpreted the two above targets as the right place where to =
do
> >>>> so.
> >>>
> >>> That didn't answer my question :-)
> >>>
> >>> Why do you need to expose this? Who uses it for what purpose?
> >>>
> >>>>
> >>>> At least for NATIVE_SIZE the documentation seems to match my
> >>>> understanding:
> >>>>
> >>>> "The native size of the device, e.g. a sensor=E2=80=99s pixel array.=
 left and top
> >>>> fields are zero for this target."
> >>>
> >>> Correct.
> >>>
> >>>>
> >>>>
> >>>>> Since the format can change for this and the next driver I think CR=
OP_BOUNDS
> >>>>> at least should match the current format.
> >>>>>
> >>>>
> >>>> Ah, does it? It was not clear to me from the documentation, as it
> >>>> suggested to me that target actually identifies the active pixel area
> >>>>
> >>>> "Bounds of the crop rectangle. All valid crop rectangles fit inside =
the
> >>>> crop bounds rectangle."
> >>>>
> >>>> It does not mention format, should this be updated?
> >>>
> >>> The problem is that for sensors it is indeed not clear.
> >>>
> >>> In principle the crop bounds matches the resolution that the sensor u=
ses
> >>> pre-scaling. So yes, that means that it is equal to the native size.
> >>>
> >>> But many sensors have a discrete list of supported formats and it is =
not
> >>> clear how they map each format to the actual sensor. If it is clearly=
 just
> >>> done through binning or averaging, then all is fine.
> >>
> >> Sensor drivers do; sensors themselves support much, much more than most
> >> drivers allow. But this is due to the nature of information available =
to
> >> the sensor driver developers, not really something that is trivial to
> >> change.
> >>
> >>>
> >>> If the formats have different aspect ratios, then it becomes a bit mo=
re
> >>> difficult how to relate the crop bounds with the format since you may=
 not
> >>> know to which sensor area the current format corresponds.
> >>>
> >>> I have no clear answer for you, to be honest, but it can get tricky.
> >>
> >> I've suggested earlier that the crop and compose selection targets to =
be
> >> used to convey the cropping and binning (or scaling) that is done on t=
he
> >> sensor, in that order. In reality, there are usually more than one
> >> (sometimes three) inside a sensor to crop, and often more than one pla=
ce to
> >> scale as well. So the driver would need to accommodate this.
> >>
> >> The modes come with both cropping and scaling configuration, and V4L2 =
only
> >> allows specifying one at a time. In principle an output size may be
> >> achieved by scaling and cropping by different amounts, and as most dri=
vers
> >> use only the output format (size) in mode selection, the result could =
be
> >> ambiguous. In practice this hasn't been an actual issue.
> >>
> >> Better sensor drivers (such as smiapp) do not have this problem as the
> >> configurations (cropping in three different places as well as binning =
and
> >> scaling) can be all independently configured. So with some luck this
> >> problem could disappear in time with newer hardware and better hardware
> >> documentation.
> >>
> >> I have no objections to providing the cropping and scaling information=
 to
> >> the user space using the selection rectangles, albeit it's somewhat ag=
ainst
> >> the semantics currently. This approach would also require using compose
> >> rectangles on the source pads which is not supported (documentation-wi=
se)
> >> at the moment, but it's better that way: it can be added now. There are
> >> other, older, drivers such as omap3isp that configure scaling based on=
 the
> >> source format configuration only.
> >
> > Thanks for all information here, but I think we've gone a bit far
> > from my original point. The cropping and scaling informations you
> > mention are, in my understanding, the portion of the pixel array which
> > is fed to the ISP before scaling, and the result of the ISP
> > binning/averaging respectively. Those information indeed depends on the
> > desired capture resolution, the driver implementation, and the sensor
> > capabilities.
> >
> > What I was interested in was just reporting to userspace the physical
> > size of the active pixel array area, which should reasonably be
> > defined as a sub-portion of the native pixel array, excluding the back
> > calibration pixels.
> >
> > In one of the previous emails Hans suggested to use CROP_DEFAULT for
> > that purpose, but in the documentation it is reported not to apply to
> > subdevice :(
> >
> > Do we need a new target, similar to V4L2_SEL_TGT_NATIVE_SIZE that
> > could maybe report multiple rectangles to accommodate cross-shaped
> > sensors?
> >
> > Are the selection API the right place to report these information?
> > With a control, it might be easier to report such a static
> > information...
>
> Sorry for the late follow-up.
>
> I am uncomfortable with hacking something here. I strongly feel that we
> are missing a proper API to configure a sensor.
>
> If I look at video receivers (SDTV or HDTV), then in both cases you set up
> the incoming video resolution with S_STD or S_DV_TIMINGS. This explicitly
> defines the incoming image size and all crop/compose/scale operations
> operate on that image size.
>
> In my opinion we are missing an equivalent to that for sensors. I think t=
he
> original thinking was that sensors have a fixed pixel array, so there is
> nothing to configure. But with cross-shaped sensors, binning/skipping,
> sensors that just hide all the inner details and just report a set of
> discrete framesizes, this is not actually trivial anymore.
>
> And the odd thing is that our API does have discovery (at least to some
> extent) of the various options through ENUM_FRAMESIZES, but does not let
> you choose a specific variant. We abuse S_FMT for this, which is really
> not the right ioctl to use since it defines what you want to receive in
> memory after cropping/composing/scaling, not the initial image size before
> all these operations take place.
>
> Regarding binning and skipping: I never understood why this wasn't
> configured using controls. Is there a reason why it was never implemented
> like that?
>
> If we had a Set Source Size operation (either a control, new ioctl or sel=
ection
> target) then you can use that to select a specific source size based on w=
hat
> ENUM_FRAMESIZES reports. Sensor drivers can choose to either enumerate
> variants based on the cross-shape and binning/skipping, or just enumerate=
 variants
> based on the cross-shape and add binning/skipping controls to explicitly =
set
> this up.
>
> In any case, since you now know exactly which image size the sensor produ=
ces,
> you can set up all the selection rectangles associated with that correctl=
y.
>
> Since I am not a sensor expert I no doubt missed things, but in my view we
> really need to see a sensor not as a fixed array, but as something more a=
kin
> to video receiver, i.e. you need to explicitly configure the video source
> before cropping/composing/scaling takes place.
>
> So in the example of a cross-shaped sensor ENUM_FRAMESIZES would report
> two sizes (landscape/portrait), binning/cropping controls (optional, this
> might be implicit in the enumerated framesizes), and after configuring all
> this using the new API 'Set Source Size' (or whatever it will be called) =
and
> possible binning/skipping controls, the user can read various selection
> targets to get all the needed information.
>
> Any cropping/composing/scaling will be done based on the selected image s=
ize
> + binning/skipping.

If I'm not mistaken smiapp sensor driver models this by exposing
multiple subdevices, one for the pixel array and additional ones for
the scaler (and the CSI-2 TX port, iirc from my multiplexed stream
support adventures). Sakari knows better for sure here...

Anyway, going towards a model where sensor expose several subdeves
would allow to have one for each configurable part of the sensor
processing pipeline, such as one for the raw pixel array (where one could
support cross-shaped sensors as you have suggested), one for ISP input
where to select the area of the pixel array to feed to the ISP, and one
to model the final processing stage where to to get to the final
image from, obtained through binning/skipping/averaging whatever and
possibly by applying a composition rectangle or selecting the
desired output format, if the sensor supports so.

Am I over-simplifying things here? I fear this is mostly frowned upon by
the constant lack of decent documentation from sensor manufacturers,
as most drivers still relies on magic blobs 'guaranteed to work' and
often produced by some 'certified' tuning applications..

And yes, more burden on userspace, as right now most sensors are a single
entity that gives you images in one format/resolution and that's it,
but this clearly is showing limits. On this side, libcamera could be a
great help and sensor-specific configurations will be offloaded there.

One quick consideration from my limited experience with sensors: the
method used to obtain the final image from the portion of the pixel
array fed to the ISP is not something often freely selectable. From
the sensor I've seen the manuals of, to obtain a certain resolution
you use averaging/binning, for another one skipping or direct crop of
the full pixel array etc.. So I'm not sure a control would fit well here.

Again, I might be really simplifying things :)

>
> Re binning/skipping: one other option is to add a flags field to v4l2_frm=
sizeenum
> that reports if the reported size was achieved via binning and/or skippin=
g.
>

Yes, but in this case that would be a read-only information, not sure
what you would use it for

Thanks
  j

> You wouldn't need controls in that case.
>
> Regards,
>
> 	Hans

--6nif5qjuvlkql74t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2NCe4ACgkQcjQGjxah
VjxwTA/8CgTlXKSAZhiQtBuyVf3O5uxwt9SXB4sFROCxCQe5x1GtFzs6uCCy+sqK
igBkiiyTMRQ6CGJRuCKglVtZ8BKyW4inEMOIk4Y0n1+jCRhnyN0f6N0KRQaTJ52H
gg698a4RW8XtJXMrtxrV8/MLvxltpnVGRFjs/Q4w8qZFUIr/MZ8mZOskewWFJshG
mhvY14DP3kAs/mcNaLX2aqInLKvjvd/glFqK5z1Y3ZJ5z+1EdKZ6MWGdM6DQh0sI
1sQaXis7YlV75l+086TbaoEk3M75GkixtEgkMBsw2bJzkkqdx6uBP1Ln3xeDLyG7
oi1zP1YGjGz3gAbd7SazFN/t12lPspSgTMuO/5mDk9wPEG1PWSaROSgtDYPBbfY/
JomgCMJ8PaYX3obRCZ5RP/7N3Q5IH0BMOoi6jecEeyArnTB+NlUHE8llmUUGXHXI
PlriLwlNWwyrunIvX5h+9C5u12CN//cSXrCudCvYjFw1AHx5DsenyAhqvuUssReP
LduacaaalzfhFTbo1kS8EMCHNJ09tBP+SIZJ2rFOfdQa3gnYE7ce/PLYkFgWKS7h
8UkLfv4kwAx+rvZobNsx5CrGPo43YbubVFIxZsnXoQH9c6mQBgx+Cd/JutYzei5K
VopMZkpylPAURAfPE5YU3qHLk3gYNLC8o9rsPGHiKiBy6p0of9Y=
=yOGj
-----END PGP SIGNATURE-----

--6nif5qjuvlkql74t--
