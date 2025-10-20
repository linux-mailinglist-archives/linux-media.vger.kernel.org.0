Return-Path: <linux-media+bounces-45073-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3DBF3313
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C716F3A80FC
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 19:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4762D8DD6;
	Mon, 20 Oct 2025 19:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ux5bv3TK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0179C1EDA0B
	for <linux-media@vger.kernel.org>; Mon, 20 Oct 2025 19:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988278; cv=none; b=UrJt6OYWhr1u7blqpgjUpZ6Xfe8Apow7IsCLUoyJgCsXg3Ve8k1STRx9jPXi3LmmTqEtVPfViPfVkVFCLYXdW0MrVUIjYZMnPGu+zP1Ksqxu+4ZTtBfiUOe+eEZ8nhaTrVk7Nx+4kAbH6Wp4IVuPXUbcVV0lv9/vglSm35BGMqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988278; c=relaxed/simple;
	bh=xeSWnYghKh8BSghJbs7xNLH8nxsv8khqenSZccBpqsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwaEUkDRIIJwIi03Y8QSd6HyRj/gT+PQkLW1UDWL7VBwmbuWbvnrWv8olk5lzmz+MgyQG5pTPqfsFtFWSp7V/mhBGvMV7IVQmtEr0pujR2G6QHlnrz9n+f1LRtbQnXcpx5rtyX7blFs0tdE49jp/h5/N+2ocou5EXop1QViUiEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ux5bv3TK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760988276; x=1792524276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xeSWnYghKh8BSghJbs7xNLH8nxsv8khqenSZccBpqsU=;
  b=Ux5bv3TKZ4h6vkrrYtoINEXLSZ8+eyr8DCP2A9qu0tDeEIb3jP3jJG41
   eKja6jkAUN9N2dNmL985tej3ZUDJPE23lWwLZi4dgw8HI3SiC/AN3b5s+
   X4CQmhobz0bsnnaWRaLN2jE4RTBN8Ika322uis2KfLViHo4tqSEwhJjiR
   tS5OJq0KU9+1b9v/sEFlb0E1OjyoSLrVsmfm02uAGE3BXq8MrbetevqsX
   UdLPQSCBi1jUmY82TcD0TXoU4CpfDSX5g6KoBgBHqUxF+uNZzG0N7IKwy
   OAz+AkKEP4db4SvCPtiD+CmrMPKeDsaIQFitdjdSd9su19OjOLznv4sZp
   g==;
X-CSE-ConnectionGUID: 4ShNmZAhRYCbH3Wr0bTwnQ==
X-CSE-MsgGUID: MXaVfopkRUWTC5vLlVBixg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65726534"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="65726534"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 12:24:35 -0700
X-CSE-ConnectionGUID: Hhhe8uwiStKKhp4gofZZ4w==
X-CSE-MsgGUID: mXfEBnX3QL+Qv9A1qoDOBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="182958613"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.104])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 12:24:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 97B801202B5;
	Mon, 20 Oct 2025 22:24:25 +0300 (EEST)
Date: Mon, 20 Oct 2025 22:24:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: David Plowman <david.plowman@raspberrypi.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, linux-media@vger.kernel.org,
	hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
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
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 43/66] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <aPaMabu9UsEaJcDw@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-44-sakari.ailus@linux.intel.com>
 <176009169065.211618.2319574445990293219@localhost>
 <CAHW6GY+JA_9DZub88RJq4UDC9KgzkQsFO=MtDFBySxhTySXVYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHW6GY+JA_9DZub88RJq4UDC9KgzkQsFO=MtDFBySxhTySXVYQ@mail.gmail.com>

Hi David, Stefan,

Thank you for the review.

On Mon, Oct 20, 2025 at 03:42:22PM +0100, David Plowman wrote:
> Hi Sakari, Stefan and everyone!
> 
> On Fri, 10 Oct 2025 at 11:21, Stefan Klug <stefan.klug@ideasonboard.com> wrote:
> >
> > Hi Sakari,
> >
> > Quoting Sakari Ailus (2025-08-25 11:50:44)
> > > Add V4L2_CID_BINNING control for configuring binning and enumerating a
> > > camera sensor's binning capabilities. The control combines horizontal and
> > > vertical binning into a single control as the two are generally related.
> > >
> > > New drivers should use this control to configure binning.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > ---
> > >  .../media/drivers/camera-sensor.rst           | 12 ++++++++
> > >  .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
> > >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
> > >  include/uapi/linux/v4l2-controls.h            |  1 +
> > >  4 files changed, 44 insertions(+)
> > >
> > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > index 39f3f91c6733..ef1f51862980 100644
> > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > @@ -120,6 +120,18 @@ values programmed by the register sequences. The default values of these
> > >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> > >  independently of the sensor's mounting rotation.
> > >
> > > +Binning
> > > +-------
> > > +
> > > +Binning has traditionally been configured using :ref:`the compose selection
> > > +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> > > +<v4l2-cid-camera-sensor-binning>` is also available for binning configuration and
> > > +users should use it when it's available. Drivers supporting the control shall
> > > +also support the compose rectangle, albeit the rectangle may be read-only when
> > > +the control is present.
> > > +
> > > +Binning isn't affected by flipping.
> > > +
> > >  .. _media_using_camera_sensor_drivers_embedded_data:
> > >
> > >  Embedded data
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > index cdc515c60468..18b484ff5d75 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > > @@ -672,3 +672,32 @@ enum v4l2_scene_mode -
> > >
> > >      As modes differ for each sensor, menu items are not standardized by this
> > >      control and are left to the programmer.
> > > +
> > > +.. _v4l2-cid-camera-sensor-binning:
> > > +
> > > +``V4L2_CID_BINNING_FACTORS (integer menu)``
> > > +
> > > +    Horizontal and vertical binning factors. Binning combines several
> > > +    horizontal, vertical or both pixel values into a single pixel. It is a way
> > > +    to scale an image. Binning typically produces fairly good quality output.
> > > +
> > > +    Determines both horizontal and vertical binning factors for a camera
> > > +    sensor. The values are encoded in the following way:
> > > +
> > > +.. flat-table::
> > > +    :header-rows:  1
> > > +    :stub-columns: 0
> > > +
> > > +    * - Bits
> > > +      - Synopsis
> > > +    * - 48--63
> > > +      - Horizontal binning numerator.
> > > +    * - 32--47
> > > +      - Horizontal binning denominator.
> > > +    * - 16--31
> > > +      - Vertical binning numerator.
> > > +    * - 0--15
> > > +      - Vertical binning denominator.
> >
> > I know I'm late to the game, but I'd like to mention it anyways. I
> 
> Even later to the party, for which my apologies!

Well, it's not yet in upstream, but hopefully gets there in not so distant
future.

> 
> > expect there will be usecases where we'd like to distinguish between
> > different binning strategies (e.g. summing to increase SNR and
> > weighting). But I believe it will be difficult to actually standardize
> > on specific binning strategies as these are very sensor specific. On the
> > other hand the available strategies will be tied to the binning modes.
> > What about sparing some bits to encode the binning strategy in a sensor
> > specific manner?
> 
> I'd like to second the notion that we should give summing/averaging
> some thought. We (Raspberry Pi in this context!) already have user
> space code that tries to guess this information from only obliquely
> related information from the driver. It would clearly be nice to know
> this unambiguously across all sensors.
> 
> The case in point is the IMX708 (as found in the Raspberry Pi Camera
> Module 3). Here there are two versions of the "2x2 binning mode".
> 
> There is the "summation" mode, in which pixels have 4x the level of
> the full resolution mode, as I think you would expect. This means you
> have to use 1/4 the combined exposure * gain value in the full
> resolution mode to get an equivalently bright image.
> 
> Then there's the "averaging" mode. In this mode we get 2x the level of
> the full resolution mode. You might infer that one of the dimensions
> (either horizontal or vertical) always sums, and on the other you have
> a choice - though the datasheet doesn't explicitly confirm that
> anywhere so far as I can see.
> 
> A different but related observation is that I have a feeling I've come
> across sensors that may do both averaging and summation in a single
> dimension. So you'd get 1/4 the output width (or height), but 2x the
> pixel level because one factor of two sums, and the other averages.
> Perhaps someone else can confirm whether I'm just imagining that...?

CCS considers binning factors and mode independent but indeed in reality
things aren't always that simple. Many sensors do binning in both analogue
and digital domains and obviously analogue binning requires hardware
support whereas digitally it's not quite as much hardware-bound. For
instance, doing e.g. analogue binning vertically and digital binning
horizontally makes sense and vertical binning may be limited to what is
supported in analogue domain. Selecting between summing and averaging may
well not be possible in analogue domain either.

Reflecting this in UAPI makes sense.

You can make guesses on whether binning takes place vertically or
horizontally based on blanking limits but it'd be nice if this was properly
documented in sensor datasheets (it almost never is).

I was thinking of providing binning factors via the BINNING_FACTORS control
as defined above and add another control to select the binning mode
(integer menu again) and have the value depend on BINNING_FACTORS control.
Gathering a structured representation in userspace this way could be more
practical than by just providing a flat list (by enumerating the menu
items) from the kernel.

Either way, standardising binning modes somehow would seem reasonable for
the benefit of the userspace, even though in low level implementations
there are obviously differences. What does matter especially is whether
summing or averaging or a combination of two is used; perhaps we could say
the values are multiplied by the multiple of horizontal and vertical
binning factors divided by a divisor we provide via a control (sometimes
settable!). E.g. 2x2 binning and binning divider 4 would mean averaging and
1 summing. The value would obviously depend on the binning factors.

-- 
Kind regards,

Sakari Ailus

