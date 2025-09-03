Return-Path: <linux-media+bounces-41723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2AFB4259C
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 17:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D295168987
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 15:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09983267AF6;
	Wed,  3 Sep 2025 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tLKr1OPm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882DB1E9B37
	for <linux-media@vger.kernel.org>; Wed,  3 Sep 2025 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913756; cv=none; b=KE4w8yruAIcvc/Y3UGnqCn2TG4V2auHjh5VDHx7Y0DSgs0HBy3fIPGjQu0oY99mnfEymJeypdLzy0G4/uyQWMPSVkTr1nheCqVdXbzDZlM5BM/cdEUBz8HVcCgXMS7pq0IoAQdNWPfJgyIRIs1goOhA8A+hmoQkHbZ/U27EBUYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913756; c=relaxed/simple;
	bh=DWoFevYnJFv8+VBJN6pgRVuzA9Y59R1VBkkDVxtVZ+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPr6sM4mICnKj3K4Nzj5NXDEBOs/DtUhTlIxAZvho7FUGHaA4T2l2JsN/5WgptCxbSBykITnGK6n700DNmrtYmvo4gFcWgS1HXXe7mWTJgofvxW9jhKNycgP1FG15W6jhc0RH6J4dJ4NbXxL0O9wDAq2gTf6wPR7cGj37lVhtvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tLKr1OPm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DAB3D8CB;
	Wed,  3 Sep 2025 17:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756913684;
	bh=DWoFevYnJFv8+VBJN6pgRVuzA9Y59R1VBkkDVxtVZ+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLKr1OPmRvW/MVCvdWQnl5cB4upMO3lSQD7aCwB/gCMmrEO8D0s3DTmDHtvLtzpPC
	 rPpOR5eXWhVthfMrVKjlds3BIT5P0dBevywzdoZkhlXi4dgIlzSQ9q73CSpotqJT2m
	 QK0AxGg6EjlNrlkziHlepi7lV/70i3cGBSofZVAE=
Date: Wed, 3 Sep 2025 17:35:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 23/66] media: Documentation: Document raw mbus codes
 and CFA for cameras
Message-ID: <20250903153532.GT3648@pendragon.ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-24-sakari.ailus@linux.intel.com>
 <5ajf3ywfraxumrcm6a6mrwgcl6koutghyivftuhbcxs3tcwi7f@6toxy2ikdkwv>
 <aLgfwejfIRC6qDoB@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLgfwejfIRC6qDoB@kekkonen.localdomain>

On Wed, Sep 03, 2025 at 02:00:17PM +0300, Sakari Ailus wrote:
> On Mon, Sep 01, 2025 at 04:59:42PM +0200, Jacopo Mondi wrote:
> > On Mon, Aug 25, 2025 at 12:50:24PM +0300, Sakari Ailus wrote:
> > > Document the use of raw mbus codes for camera sensors and how the
> > > V4L2_CID_COLOR_PATTERN and V4L2_CID_COLOR_PATTERN_FLIP controls are used
> > > to convey the color filter array pattern on UAPI.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > index 75fd9166383f..a8e0e4accbc9 100644
> > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > @@ -39,6 +39,19 @@ format set on a source pad at the end of the device's internal pipeline.
> > >
> > >  Most sensor drivers are implemented this way.
> > >
> > > +V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping
> > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > This will appear as a subsection of
> > 
> > "2.1. Sensor internal pipeline configuration"
> > 
> > With
> > 
> > 2.1.1. Freely configurable camera sensor drivers
> > 2.1.2. Register list-based drivers
> > 2.1.3. V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping
> > 
> > I don't know if it's intentional or not, but I would rather make out
> > of this a paragraph of its own, as it will be done for
> > 
> > 2.3. Rotation, orientation and flipping
> > 2.4. Binning and sub-sampling
> 
> It's all related to sensor internal pipeline configuration. It's not wrong
> to put them after it instead of under though. I don't have a strong opinion
> either way.
> 
> > etc
> > 
> > > +
> > > +For raw image data originating from camera sensors, specific :ref:`raw mbus
> > > +codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit depth)
> > > +<v4l2-mbus-pixelcode-generic-raw>` are used as Color Filter Array (CFA) agnostic
> > > +raw formats. The ``V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>``
> > 
> > This and the below ``V4L2_CID_COLOR_PATTERN_FLIP ...`` links are
> > broken.
> > 
> > Shuould this be
> > 
> > :ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>`
> > 
> > > +control in the same sub-device defines the native color pattern of the
> > > +device. Flipping may further affect the readout pattern as indicated by the
> > > +``V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>``
> > 
> > and this
> > 
> > :ref:`V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>`
> > 
> > instead ?
> 
> Yes.
> 
> > 
> > > +control. Further on, cropping also has an effect on the pattern if cropped
> > > +amount is not divisible by the size of the pattern, horizontally and vertically.

We could expand this, but it's a good start.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > > +
> > >  Frame interval configuration
> > >  ----------------------------
> > >

-- 
Regards,

Laurent Pinchart

