Return-Path: <linux-media+bounces-587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8177F0D74
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 09:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 698B8B2105F
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 08:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07963E578;
	Mon, 20 Nov 2023 08:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="cYT4dPXZ"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5207B9
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 00:26:00 -0800 (PST)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4SYgZD1nHpzyxL;
	Mon, 20 Nov 2023 10:25:46 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1700468758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ip8v13NsessFlMJ9yCF1TPDLZo27z7iN/m0g+1zSfek=;
	b=cYT4dPXZF5ZPzQthhQdWey6AHaXsR4NBBf6kxumt3acJSk9KMwFhWfoAZehBWej6RMu/Hn
	pIZDtwgYhshSHHvXUmcTY/dK1kiiYkYp7swbueShY13CUc5//V1U0tu9MueOiQ9jgm7ftU
	mKpwoDBfee8TQ0/T4l2rOPYUfbmgWkE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1700468758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ip8v13NsessFlMJ9yCF1TPDLZo27z7iN/m0g+1zSfek=;
	b=Q1pJjxH1McXbp5GHfztVKGccyRZkkz95ts5nwZ6KvywRJ4DE/+6VF0tqT+K3iq/eVzLA4l
	ChvLS9m1ix7TIzHjWHtfUsY/12QuerQl8kZBqaxYfMhJ3Q+k1QhTeqy0h7L8BPtlP5X9XH
	IupQAD1WmaUWDm2dx4ITGlA4mjlJC9E=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1700468758; a=rsa-sha256; cv=none;
	b=GxiXX0zwyUWZ0lVquTX8aPfNkjFAjUzC8+9JBBTyUBF1hYTMvoU8R97Ah6MB8eKK4Qx6xI
	9oLhFat6v06zzOOXCfhVu5Isd/x67HOFnphccKHb0nJnW4RWtc6dVRWjFJxJuAyqCjXXN9
	KiRkonRzCougFeCJDIoQSKbK0WpaNBg=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9CBFA634C93;
	Mon, 20 Nov 2023 10:25:45 +0200 (EET)
Date: Mon, 20 Nov 2023 08:25:45 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 2/2] Documentation: v4l: Exposure/gain for camera
 sensor
Message-ID: <ZVsYCTe12NpHjxva@valkosipuli.retiisi.eu>
References: <20230710132240.7864-1-jacopo.mondi@ideasonboard.com>
 <20230710132240.7864-3-jacopo.mondi@ideasonboard.com>
 <ZLUW1eBTH3GpnSlW@valkosipuli.retiisi.eu>
 <wdhkxxokan2gk4m2b3gwro7d6j6ie4zhshfman456dhvjqokxm@67jcmm3bewgb>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wdhkxxokan2gk4m2b3gwro7d6j6ie4zhshfman456dhvjqokxm@67jcmm3bewgb>

Hi Jacopo,

Just found this old e-mail I apparently forgot to reply...

On Thu, Jul 27, 2023 at 11:42:45AM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Jul 17, 2023 at 10:24:21AM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Mon, Jul 10, 2023 at 03:22:40PM +0200, Jacopo Mondi wrote:
> > > Document the suggested way to exposure controls for exposure and gain
> > > for camera sensor drivers.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  .../driver-api/media/camera-sensor.rst        | 27 +++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > index cd915ca119ea..67fe77b1edb9 100644
> > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > @@ -189,3 +189,30 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > >  a flip can potentially change the output buffer content layout. Flips should
> > >  also be taken into account when enumerating and handling media bus formats
> > >  on the camera sensor source pads.
> > > +
> > > +Exposure and Gain Control
> > > +-------------------------
> > > +
> > > +Camera sensor drivers that allow applications to control the image exposure
> > > +and gain should do so by exposing dedicated controls to applications.
> > > +
> > > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > > +The control definition does not specify a unit to allow maximum flexibility
> > > +for multiple device types, but when used for camera sensor drivers it should be
> > > +expressed in unit of lines whenever possible.
> >
> > This part of the documentation applies to both raw and SoC cameras.
> >
> > Should the exposure unit be something more user-friendly for SoC cameras?
> 
> SoC cameras == YUV/RGB sensors ?
> 
> Are you thinking about using the actual exposure time for YUV/RGB
> sensors ?

Some devices support both but there are devices that don't natively support
it, including UVC and Alvium.

I wonder whether we should suggest using the control method that best works
with device-native units? I.e. if the device natively uses frame length and
line length, then use blankings + the pixel clock, otherwise
[gs]_frame_interval?

> 
> >
> > We have two exposure controls now, V4L2_CID_EXPOSURE and
> > V4L2_CID_EXPOSURE_ABSOLUTE. The former doesn't specity a unit whereas the
> 
> Apparently only 2 drivers in mainline register V4L2_CID_EXPOSURE_ABSOLUTE

It's not very popular, no. :-) 100 µs is also a long time, I would expect
to have issues with that large granularity.

> 
> > latter suggests the unit of 100 µs.
> >
> > As exposure is specific to cameras, I think at least a part of this should
> > make it to the controls documentation. The UVC, for instance, uses
> > EXPOSURE_ABSOLUTE.
> >
> > Could we document V4L2_CID_EXPOSURE is in lines (if possible)?
> 
> I would indeed be happy with something like "The suggested unit for
> the control is lines"

Should there be another control for exposure in (µ)s then?

> 
> >
> > > +
> > > +To convert lines into units of time, the total line length (visible and
> > > +not visible pixels) has to be divided by the pixel rate::
> > > +
> > > +        line duration = total line length / pixel rate
> > > +                      = (image width + horizontal blanking) / pixel rate
> > > +
> > > +Camera sensor driver should try whenever possible to distinguish between the
> > > +analogue and digital gain control functions. Analogue gain is a multiplication
> > > +factor applied to all color channels on the pixel array before they get
> > > +converted into the digital domain. It should be made controllable by
> >
> > The analogue gain may not be linear. This depends on the sensor. I'd thus
> > drop the wording related to multiplication factor.
> >
> 
> I might have missed why the gain being linear or not has implications
> on the fact it acts as a multiplication factor for the color
> channels...

I must have read this as the analogue gain being the control value. Could
you still add that the analogue gain factor may have a non-linear relation
to the control value?

> 
> > > +registering the ``V4L2_CID_ANALOGUE_GAIN`` control, expressed as a device
> > > +specific gain code. Digital gain control is optional and should be exposed to
> > > +applications by registering ``V4L2_CID_DIGITAL_GAIN``. Camera sensor drivers are
> > > +discouraged from using ``V4L2_CID_GAIN`` as it doesn't allow differentiation of
> > > +analogue vs digital gain.
> >

-- 
Regards,

Sakari Ailus

