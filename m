Return-Path: <linux-media+bounces-614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 088457F1914
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 17:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD9311F253E6
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 16:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD801E523;
	Mon, 20 Nov 2023 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RvCAdRro"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4C1BC
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 08:49:36 -0800 (PST)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D570BBBB;
	Mon, 20 Nov 2023 17:49:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700498944;
	bh=F2ZKGZMoTMZTWg9p+Z+hSV614K9FOiLchrSZX+d6Qsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RvCAdRroaYeiHb3gIjm4aI1Wpu/UU07LuycDvCWLwicrQUOEUBE6XWWtX524ApjsJ
	 +wvUKH9nggANbco9Xu172K5q3v7rRlCXvArOxuiY4NIEis3feIfZ5lOM8PKi19xTMl
	 5/zD2sy7WvVhq2UnOf/Zx1VAVRXVHgNVPVWRJB40=
Date: Mon, 20 Nov 2023 17:49:30 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 2/2] Documentation: v4l: Exposure/gain for camera
 sensor
Message-ID: <xnm7y7thxderbs4ka4qkpgs6r3rjjehmqkniagnkxgjzy5zyyz@vsgjiczgzket>
References: <20230710132240.7864-1-jacopo.mondi@ideasonboard.com>
 <20230710132240.7864-3-jacopo.mondi@ideasonboard.com>
 <ZLUW1eBTH3GpnSlW@valkosipuli.retiisi.eu>
 <wdhkxxokan2gk4m2b3gwro7d6j6ie4zhshfman456dhvjqokxm@67jcmm3bewgb>
 <ZVsYCTe12NpHjxva@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVsYCTe12NpHjxva@valkosipuli.retiisi.eu>

Hi Sakari

On Mon, Nov 20, 2023 at 08:25:45AM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> Just found this old e-mail I apparently forgot to reply...
>

This really fell into the cracks for me as well

> On Thu, Jul 27, 2023 at 11:42:45AM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Mon, Jul 17, 2023 at 10:24:21AM +0000, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Mon, Jul 10, 2023 at 03:22:40PM +0200, Jacopo Mondi wrote:
> > > > Document the suggested way to exposure controls for exposure and gain
> > > > for camera sensor drivers.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > ---
> > > >  .../driver-api/media/camera-sensor.rst        | 27 +++++++++++++++++++
> > > >  1 file changed, 27 insertions(+)
> > > >
> > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > index cd915ca119ea..67fe77b1edb9 100644
> > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > @@ -189,3 +189,30 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > > >  a flip can potentially change the output buffer content layout. Flips should
> > > >  also be taken into account when enumerating and handling media bus formats
> > > >  on the camera sensor source pads.
> > > > +
> > > > +Exposure and Gain Control
> > > > +-------------------------
> > > > +
> > > > +Camera sensor drivers that allow applications to control the image exposure
> > > > +and gain should do so by exposing dedicated controls to applications.
> > > > +
> > > > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > > > +The control definition does not specify a unit to allow maximum flexibility
> > > > +for multiple device types, but when used for camera sensor drivers it should be
> > > > +expressed in unit of lines whenever possible.
> > >
> > > This part of the documentation applies to both raw and SoC cameras.
> > >
> > > Should the exposure unit be something more user-friendly for SoC cameras?
> >
> > SoC cameras == YUV/RGB sensors ?
> >
> > Are you thinking about using the actual exposure time for YUV/RGB
> > sensors ?
>
> Some devices support both but there are devices that don't natively support
> it, including UVC and Alvium.
>
> I wonder whether we should suggest using the control method that best works
> with device-native units? I.e. if the device natively uses frame length and
> line length, then use blankings + the pixel clock, otherwise
> [gs]_frame_interval?
>

Are we mixing two things here ? The above documentation block is about
the suggested unit for the exposure control, while [gs]_frame_interval
vs {blankings + pixel_rate} is to control the frame duration ?

> >
> > >
> > > We have two exposure controls now, V4L2_CID_EXPOSURE and
> > > V4L2_CID_EXPOSURE_ABSOLUTE. The former doesn't specity a unit whereas the
> >
> > Apparently only 2 drivers in mainline register V4L2_CID_EXPOSURE_ABSOLUTE
>
> It's not very popular, no. :-) 100 µs is also a long time, I would expect
> to have issues with that large granularity.
>

is 100 micro-seconds a too large granularity when it comes to exposure
time ??

> >
> > > latter suggests the unit of 100 µs.
> > >
> > > As exposure is specific to cameras, I think at least a part of this should
> > > make it to the controls documentation. The UVC, for instance, uses
> > > EXPOSURE_ABSOLUTE.
> > >
> > > Could we document V4L2_CID_EXPOSURE is in lines (if possible)?
> >
> > I would indeed be happy with something like "The suggested unit for
> > the control is lines"
>
> Should there be another control for exposure in (µ)s then?
>

Isn't it V4L2_CID_EXPOSURE_ABSOLUTE ?

> >
> > >
> > > > +
> > > > +To convert lines into units of time, the total line length (visible and
> > > > +not visible pixels) has to be divided by the pixel rate::
> > > > +
> > > > +        line duration = total line length / pixel rate
> > > > +                      = (image width + horizontal blanking) / pixel rate
> > > > +
> > > > +Camera sensor driver should try whenever possible to distinguish between the
> > > > +analogue and digital gain control functions. Analogue gain is a multiplication
> > > > +factor applied to all color channels on the pixel array before they get
> > > > +converted into the digital domain. It should be made controllable by
> > >
> > > The analogue gain may not be linear. This depends on the sensor. I'd thus
> > > drop the wording related to multiplication factor.
> > >
> >
> > I might have missed why the gain being linear or not has implications
> > on the fact it acts as a multiplication factor for the color
> > channels...
>
> I must have read this as the analogue gain being the control value. Could
> you still add that the analogue gain factor may have a non-linear relation
> to the control value?
>

Sure!

Thanks for digging this one out!

> >
> > > > +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> > > > +specific gain code. Digital gain control is optional and should be exposed to
> > > > +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> > > > +discouraged from using ``V4L2_CID_GAIN`` as it doesn't allow differentiation of
> > > > +analogue vs digital gain.
> > >
>
> --
> Regards,
>
> Sakari Ailus

