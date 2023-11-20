Return-Path: <linux-media+bounces-622-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3257F1C2A
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 19:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5561F256B1
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 18:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD333035C;
	Mon, 20 Nov 2023 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="CmyHNZrN"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF35D8
	for <linux-media@vger.kernel.org>; Mon, 20 Nov 2023 10:19:56 -0800 (PST)
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4SYwlX00JzzyRq;
	Mon, 20 Nov 2023 20:19:47 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1700504393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olwfimsV37OJHX/VHV94lkHtIqIjhDyovkhpcXkOM8w=;
	b=CmyHNZrN1E6CEVi6WlwMEpATXDra9d+EshLaukQJ77W/1ad2rxRI5qwnA2whwX6FwVovG6
	3P1HKGc2iNopXo0T9MbI9DfebP55h49rL092P17sM3l2aWAPfInwlx0CbwZEr15kAJO0PO
	p8tdQ/FS/8qvQBR1lIyS4YxavOj53ro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1700504393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olwfimsV37OJHX/VHV94lkHtIqIjhDyovkhpcXkOM8w=;
	b=mrysAgrE23rn5ESUzQTBU5k0yuLKQvFatuw1lGulyLaaAmHGzLfLReIubPMk13kHHjRm6t
	9MDH6MpsBRh58vn1Ebb1qRJ7Tl1jOo0ZMBvanfd8ND1jIbN4lxV51NrMqxUPrs0XmgOT3b
	YSuil8WWHe4ps3IbTYqm4cw0UNMAHd8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1700504393; a=rsa-sha256; cv=none;
	b=g4Sev+A1UCMV+Kvntj+nbXtAtmEif3bWQetY6W+3SRXoAmfyufbmMfTp550Yc83jOIq4Op
	OUZmbUS0pTzHyKXZqBFPknl3aWawPtYVax07g8LabV14nGcEN/V+p2YyWAGwSD02EhYwUQ
	J9ry0L8pYYxSjLBygau8kkzzQ6AZtMc=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3B73F634C93;
	Mon, 20 Nov 2023 20:19:46 +0200 (EET)
Date: Mon, 20 Nov 2023 18:19:46 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v3 2/2] Documentation: v4l: Exposure/gain for camera
 sensor
Message-ID: <ZVujQotfUK5kICbo@valkosipuli.retiisi.eu>
References: <20230710132240.7864-1-jacopo.mondi@ideasonboard.com>
 <20230710132240.7864-3-jacopo.mondi@ideasonboard.com>
 <ZLUW1eBTH3GpnSlW@valkosipuli.retiisi.eu>
 <wdhkxxokan2gk4m2b3gwro7d6j6ie4zhshfman456dhvjqokxm@67jcmm3bewgb>
 <ZVsYCTe12NpHjxva@valkosipuli.retiisi.eu>
 <xnm7y7thxderbs4ka4qkpgs6r3rjjehmqkniagnkxgjzy5zyyz@vsgjiczgzket>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xnm7y7thxderbs4ka4qkpgs6r3rjjehmqkniagnkxgjzy5zyyz@vsgjiczgzket>

Hi Jacopo,

On Mon, Nov 20, 2023 at 05:49:30PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Nov 20, 2023 at 08:25:45AM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > Just found this old e-mail I apparently forgot to reply...
> >
> 
> This really fell into the cracks for me as well
> 
> > On Thu, Jul 27, 2023 at 11:42:45AM +0200, Jacopo Mondi wrote:
> > > Hi Sakari
> > >
> > > On Mon, Jul 17, 2023 at 10:24:21AM +0000, Sakari Ailus wrote:
> > > > Hi Jacopo,
> > > >
> > > > On Mon, Jul 10, 2023 at 03:22:40PM +0200, Jacopo Mondi wrote:
> > > > > Document the suggested way to exposure controls for exposure and gain
> > > > > for camera sensor drivers.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > ---
> > > > >  .../driver-api/media/camera-sensor.rst        | 27 +++++++++++++++++++
> > > > >  1 file changed, 27 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
> > > > > index cd915ca119ea..67fe77b1edb9 100644
> > > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > > @@ -189,3 +189,30 @@ the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > > > >  a flip can potentially change the output buffer content layout. Flips should
> > > > >  also be taken into account when enumerating and handling media bus formats
> > > > >  on the camera sensor source pads.
> > > > > +
> > > > > +Exposure and Gain Control
> > > > > +-------------------------
> > > > > +
> > > > > +Camera sensor drivers that allow applications to control the image exposure
> > > > > +and gain should do so by exposing dedicated controls to applications.
> > > > > +
> > > > > +Exposure time is controlled by registering the ``V4L2_CID_EXPOSURE`` control.
> > > > > +The control definition does not specify a unit to allow maximum flexibility
> > > > > +for multiple device types, but when used for camera sensor drivers it should be
> > > > > +expressed in unit of lines whenever possible.
> > > >
> > > > This part of the documentation applies to both raw and SoC cameras.
> > > >
> > > > Should the exposure unit be something more user-friendly for SoC cameras?
> > >
> > > SoC cameras == YUV/RGB sensors ?
> > >
> > > Are you thinking about using the actual exposure time for YUV/RGB
> > > sensors ?
> >
> > Some devices support both but there are devices that don't natively support
> > it, including UVC and Alvium.
> >
> > I wonder whether we should suggest using the control method that best works
> > with device-native units? I.e. if the device natively uses frame length and
> > line length, then use blankings + the pixel clock, otherwise
> > [gs]_frame_interval?
> >
> 
> Are we mixing two things here ? The above documentation block is about
> the suggested unit for the exposure control, while [gs]_frame_interval
> vs {blankings + pixel_rate} is to control the frame duration ?

Oops. The context was apparently garbled in the meantime. X-)

I meant using ISO units (i.e. second) in this case.

> 
> > >
> > > >
> > > > We have two exposure controls now, V4L2_CID_EXPOSURE and
> > > > V4L2_CID_EXPOSURE_ABSOLUTE. The former doesn't specity a unit whereas the
> > >
> > > Apparently only 2 drivers in mainline register V4L2_CID_EXPOSURE_ABSOLUTE
> >
> > It's not very popular, no. :-) 100 �s is also a long time, I would expect
> > to have issues with that large granularity.
> >
> 
> is 100 micro-seconds a too large granularity when it comes to exposure
> time ??

It's a pretty long time in bright lighting conditions. The problem is not a
value as such, but the granularity: a change of one has a major relative
effect on the exposure time.

In practice this value is translated to some number of lines, and the
granularity shouldn't be worse than that. I'd therefore make this �s
instead.

> 
> > >
> > > > latter suggests the unit of 100 �s.
> > > >
> > > > As exposure is specific to cameras, I think at least a part of this should
> > > > make it to the controls documentation. The UVC, for instance, uses
> > > > EXPOSURE_ABSOLUTE.
> > > >
> > > > Could we document V4L2_CID_EXPOSURE is in lines (if possible)?
> > >
> > > I would indeed be happy with something like "The suggested unit for
> > > the control is lines"
> >
> > Should there be another control for exposure in (�)s then?
> >
> 
> Isn't it V4L2_CID_EXPOSURE_ABSOLUTE ?

I guess we could use that but the control name makes no sense, there is
also some amount of former use. I'd create a new one instead. At this point
it shouldn't really matter for the user space.

The existing drivers will continue to also use whatever they're using now
(I guess?).

> 
> > >
> > > >
> > > > > +
> > > > > +To convert lines into units of time, the total line length (visible and
> > > > > +not visible pixels) has to be divided by the pixel rate::
> > > > > +
> > > > > +        line duration = total line length / pixel rate
> > > > > +                      = (image width + horizontal blanking) / pixel rate
> > > > > +
> > > > > +Camera sensor driver should try whenever possible to distinguish between the
> > > > > +analogue and digital gain control functions. Analogue gain is a multiplication
> > > > > +factor applied to all color channels on the pixel array before they get
> > > > > +converted into the digital domain. It should be made controllable by
> > > >
> > > > The analogue gain may not be linear. This depends on the sensor. I'd thus
> > > > drop the wording related to multiplication factor.
> > > >
> > >
> > > I might have missed why the gain being linear or not has implications
> > > on the fact it acts as a multiplication factor for the color
> > > channels...
> >
> > I must have read this as the analogue gain being the control value. Could
> > you still add that the analogue gain factor may have a non-linear relation
> > to the control value?
> >
> 
> Sure!
> 
> Thanks for digging this one out!

You're welcome! :-)

-- 
Regards,

Sakari Ailus

