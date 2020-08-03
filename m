Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492C223A111
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 10:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgHCIaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 04:30:07 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:51705 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgHCIaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 04:30:07 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 529DCFF80F;
        Mon,  3 Aug 2020 08:30:01 +0000 (UTC)
Date:   Mon, 3 Aug 2020 10:33:41 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        naush@raspberrypi.com,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] imx219: selection compliance fixes
Message-ID: <20200803083341.tbozpraktldfrmk6@uno.localdomain>
References: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
 <20200801111903.zt2d2djusjdh27vc@uno.localdomain>
 <20200801151317.GF11820@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200801151317.GF11820@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Aug 01, 2020 at 06:13:17PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Sat, Aug 01, 2020 at 01:19:03PM +0200, Jacopo Mondi wrote:
> > Hi Hans, Laurent,
> >
> >     sorry, long email, contains a few things on the general definition
> >     of the selection target, a question for libcamera, and a few more
> >     details at the end.
> >
> > Adding Sakari, libcamera ml, Ricardo which helped with the
> > definition of pixel array properties in libcamera recently and
> > Dave and Naush as this sensor is the RPi camera module v2 and some
> > information on the sensor come from their BSP.
> >
> > On Thu, Jul 02, 2020 at 03:50:04PM +0200, Hans Verkuil wrote:
> > > The top/left crop coordinates were 0, 0 instead of 8, 8 in the
> > > supported_modes array. This was a mismatch with the default values,
> > > so this is corrected. Found with v4l2-compliance.
> > >
> > > Also add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and CROP_BOUNDS
> > > always go together. Found with v4l2-compliance.
> >
> > Let me try to summarize the outcome of the discussion
> >
> > 1) All selection rectangles are defined in respect to the NATIVE_SIZE
> >    target, which returns the full pixel array size, which includes
> >    readable and non-readable pixels. It's top-left corner is in
> >    position (0,0)
>
> Yes, except that, to be pedantic, it's not that the top-left corner *is*
> in position (0,0) but that the top-left corner is defined as (0,0).
> NATIVE_SIZE is the root of the coordinates system, and by definition the
> top-left coordinates must be set to (0,0).
>

You are pedantically right

> > 3) CROP_BOUND returns the portion of the full pixel array which can be
> >    read out, including optical black pixels, and is defined in respect
> >    to the full pixel array size
>
> Yes. I'd say it's defined in respect to NATIVE_SIZE to avoid the
> indirection in the definition (NATIVE_SIZE and pixel array size are the
> same).
>
> This maps to the libcamera PixelArraySize property in libcamera.
>

Yes it does!

> > 2) CROP_DEFAULT returns the portion of the readable part of the pixel array
> >    which contains valid image data (aka 'active' pixels). It is again
> >    defined in respect to the full pixel array rectangle returned by
> >    NATIVE_SIZE target.
>
> Correct.
>
> This maps to the PixelArrayActiveAreas property in libcamera (assuming
> the property contains a single value).
>

Yes, right now a single Rectangle can be expressed with the existing
V4L2 API

> > With an ack on my understanding, I think it's worth expanding the
> > target documentation a bit. As I've said I've been hesitant in doing
> > so, as those targets do not only apply to image sensors, but I think a
> > section that goes like "If the sub-device represents and image sensor
> > then the V4L2_SEL_TGT_.. target represents ... "
>
> It's totally fine by me to add a section that defines the targets
> precisely for sensors.
>
> > Laurent: this will have some impact on libcamera as well
> > https://git.linuxtv.org/libcamera.git/tree/src/libcamera/camera_sensor.cpp#n503
> > When we read the analogCrop rectangle, we decided it is defined in
> > respect to the active portion of the pixel array (CROP_DEFAULT) and
> > not from the full pixel array size (NATIVE_SIZE).
>
> Note that the non-readable portion of NATIVE_SIZE has no impact in
> practice. A sensor driver could return NATIVE_SIZE == CROP_BOUND, as
> long as CROP_BOUND, CROP_DEFAULT and CROP are all expressed relatively
> to NATIVE_SIZE, it will make no difference for userspace.
>
> We could thus mandate that NATIVE_SIZE == CROP_BOUND to simplify things.
>
> > We then should:
> > 1) Back-track on our decision to have analog crop defined in respect
> > to the active part and decide it should be defined in respect to the
> > full pixel array: this has implications on the existing IPAs that
> > assume what we have defined
> >
> > 2) Adjust the analogCrop rectangle by subtracting to its sizes the
> > values reported by TGT_CROP_DEFAULT.top and TGT_CROP_DEFAULT.left.
> >
> > I would got for 2) what's your opinion ?
>
> Inside libcamera I would express all crop rectangles relatively to
> PixelArraySize, so mapping to V4L2 would require adding/subtracting the
> TGT_CROP_DEFAULT offset. That's why requiring NATIVE_SIZE == CROP_BOUND
> may simplify things.
>

If we want to define libcamera properties relatively to
PixelArraySize (the readable part of the pixel array), then we'll have
to subtract the TGT_CROP_BOUND offsets, not the _DEFAULT one,
otherwise we would express it relatively to the active part of the
pixel array (which would be ok, but as those properties are for IPA,
they might want to be able to read OB pixels out ?)

> > On this specific patch:
> >
> > > Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > ---
> > >  drivers/media/i2c/imx219.c | 17 +++++++++--------
> > >  1 file changed, 9 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 0a546b8e466c..935e2a258ce5 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -473,8 +473,8 @@ static const struct imx219_mode supported_modes[] = {
> > >  		.width = 3280,
> > >  		.height = 2464,
> > >  		.crop = {
> > > -			.left = 0,
> > > -			.top = 0,
> > > +			.left = 8,
> > > +			.top = 8,
> >
> > we have
> > #define IMX219_PIXEL_ARRAY_LEFT		8U
> > #define IMX219_PIXEL_ARRAY_TOP		8U
> >
> > Which I would then re-name IMX219_ACTIVE_ARRAY_LEFT and
> > IMX219_ACTIVE_ARRAY_TOP and re-use it there
> >
> > >  			.width = 3280,
> > >  			.height = 2464
> > >  		},
> > > @@ -489,8 +489,8 @@ static const struct imx219_mode supported_modes[] = {
> > >  		.width = 1920,
> > >  		.height = 1080,
> > >  		.crop = {
> > > -			.left = 680,
> > > -			.top = 692,
> > > +			.left = 8 + 680,
> > > +			.top = 8 + 692,
> > >  			.width = 1920,
> > >  			.height = 1080
> > >  		},
> > > @@ -505,8 +505,8 @@ static const struct imx219_mode supported_modes[] = {
> > >  		.width = 1640,
> > >  		.height = 1232,
> > >  		.crop = {
> > > -			.left = 0,
> > > -			.top = 0,
> > > +			.left = 8,
> > > +			.top = 8,
> > >  			.width = 3280,
> > >  			.height = 2464
> > >  		},
> > > @@ -521,8 +521,8 @@ static const struct imx219_mode supported_modes[] = {
> > >  		.width = 640,
> > >  		.height = 480,
> > >  		.crop = {
> > > -			.left = 1000,
> > > -			.top = 752,
> > > +			.left = 8 + 1000,
> > > +			.top = 8 + 752,
> > >  			.width = 1280,
> > >  			.height = 960
> > >  		},
> > > @@ -1014,6 +1014,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
> > >  		return 0;
> > >
> > >  	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >
> > I think this is fine and that's my reasoning:
> >
> > The IMAX219 pixel array is documented as
> >
> >         /-------------- 3296 -------------------/
> >          8                                     8
> >         +---------------------------------------+    /
> >         |IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII| 8  |
> >         |IpppppppppppppppppppppppppppppppppppppI|    |
> >         |IpppppppppppppppppppppppppppppppppppppI|    |
> >         |IpppppppppppppppppppppppppppppppppppppI|    |
> >         |IpppppppppppppppppppppppppppppppppppppI|    |
> >         |IpppppppppppppppppppppppppppppppppppppI|    |
> >         |IpppppppppppppppppppppppppppppppppppppI|    |
> >
> >                             ....                    2480
> >
> >         |IpppppppppppppppppppppppppppppppppppppI|    |
> >         |IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII|    |
> >         |IoooooooooooooooooooooooooooooooooooooI| 16 |
> >         |IOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOI| 16 |
> >         |IoooooooooooooooooooooooooooooooooooooI| 8  |
> >         +---------------------------------------+    /
> >
> > Where:
> >         I = invalid active area
> >         p = valid pixels
> >         o = Invalid OB area
> >         O = Valid OB area
> >         Effective area = 3296x2480
> >         Active area = 3280x2464
>
> This doesn't match your diagram above, 8+2464+16+16+8 != 2480.
>

Correct. The 'effective' 2480 size is defined without taking OB pixels
in consideration

> > The 'active area' is then sorrounded by 8 invalid rows, 8 invalid
> > cols at the beginning and the end, and followed by 8 more invalid
> > rows. Then, 16 invalid black rows follow, then 16 -valid- black
> > rows, then 8 invalid black rows again.
> >
> > My understanding is that the whole effective area is sent on the bus,
> > as the CSI-2 timings report the sizes of the 'effective' area to be
> > the whole 3296x2480 matrix, and assigns a CSI-2 data-type to the
> > "Valid OB area" while sets the DataType for invalid areas to Null.
> >
> > However the registers that select the analog crop work on the 'active
> > area' only, so there is not way to select "I want the Valid OB area"
> > only, as the whole 'effective area' is sent on the bus and the CSI-2
> > receivers filters on the DataType to discard the 'Invalid' lines (to
> > which a Null DataType is assigned) and capture image data ('active area')
> > and eventually 'Valid black' pixels (which have a data type assigned).
>
> I'm not aware of CSI-2 receivers that can capture NULL data types. At
> most you'll be able to capture OB and active pixels, nothing else.
>

That's what I meant, Invalid lines are put on the bus but discarded.

At this point, the manual seems to be contradicting, as the CSI-2
timings report a data type for OB pixels and show the whole
'effective' area to be put on the bus, hence I assume it contains
OB pixels (table 13 adn figure 20). But as you noted, what is defined
as 'effective' area by the pixel array drawings does not contain OB lines.

Furthermore, Figure 46 confuses me even more.

>> All of this to say, there's no point in reporting a TGT_BOUND larger
> > that the active area, as the user cannot select portions outside of it
> > through the S_SELECTION API, but can only instruct it's CSI-2 receiver
> > to filter-in the data it desires, which I think we're missing an API
> > for.
>
> This however contradicts your proposal above, where you said that
> CROP_BOUND should include the OB lines :-)
>

It should -if- they are readable through the selection API, ie, you
can select an area with TGT_CROP to read-out which includes OB lines. My
understanding is that this sensor does not allow you to do so, as the
registers that allows to select the analog crop portion range on the
active pixel area portion. Maybe RPi people which worked more with the
sensor know more about this ?

Hence CROP_BOUNDS = CROP_DEFAULT, as this patch does, I think it's fine.

For libcamera this means PixelArraySize == PixelArrayActiveAreas
And analogCrop should be adjusted to take the CROP_BOUND offsets into
account.

A pretty messy topic indeed :/

> > Hans: would you like to go ahead with this patch, or should I take
> > over and change the libcamera part that parses these properties in one
> > go ?
> >
> > >  		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
> > >  		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
> > >  		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
>
> --
> Regards,
>
> Laurent Pinchart
