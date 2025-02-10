Return-Path: <linux-media+bounces-25927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E3A2EFD1
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 15:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E92D83A32D2
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 14:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4015252911;
	Mon, 10 Feb 2025 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDS7meTM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564822528FA
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197942; cv=none; b=KzlgB/jhX0SKf2fc5blZvRKzH7HeEOnl22t96Xqbh/+8rjX2z6blxJ18gwq4/a2a5K2yZ0YaJxPTNt3pDt0VUWVvnDSvC0gbWqGZGnn0IWqB2eJ8PeaN9sbmHBUvhwVOSkbmZGYMbxHqS9Jp8xFWkOXTMHMGpG8rW1WhB9dtBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197942; c=relaxed/simple;
	bh=ymebnlNRKek7qoTCN5YtnTMeyGiS6c8NW1hm4bfthOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A24NJ0OKBk0xZUDzO7B0E1ddleyewdJEhlgy3lmsjcZoaTwDzUGnIrgFOYoA1Gus8R8coOTG6X9kuMEGA9dUM2r4f6hHCEaNaZ8GQxGbBbqWJrlCL1Y3FMpg8WP/kNrPsTaA+JHn263Od/iVfiT7qpOj4Pf2l9UBEaFHXMGfSSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDS7meTM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739197941; x=1770733941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ymebnlNRKek7qoTCN5YtnTMeyGiS6c8NW1hm4bfthOA=;
  b=fDS7meTMW/HptV+1E6VMtt6+Y+2/OXYgDtuJu7n6Fl/1iVOPXCGhRWQk
   TkEP2U5qmKaRbgp2woj2vMLjldKp6n9OG/8RPMMQVSd630gvOTzT4+LCJ
   WLB251RwpViPVvJXkLW0rMC4kMrxgORKtYv3homjLBGQ54RqnIvr1+4AC
   BH5RAS6r7BIHHZgql/umiPYEf9N3MSQw7PfYlUiIRPl4Tu1++AJ3rbpFt
   eI0Ecfil+JbSRmETeb1MJS7TZdlmoXzFZdP55PqQNIaT2df2HDk6U7P67
   lCfK8kSydIo+VX78UQed92RUTCSCbhjGQLF+MNgiu1aVKOgNRT2lBSh6n
   w==;
X-CSE-ConnectionGUID: J4xpMgLkSjObJMZpdu3zRw==
X-CSE-MsgGUID: BmHcgfMYSXOozpjYspR4RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="51171680"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="51171680"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:32:20 -0800
X-CSE-ConnectionGUID: oQy7mGk2QdeMxCCsq58o2g==
X-CSE-MsgGUID: JL2Wi3ohSimFc8LZztHWog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116272261"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:32:14 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AC3C011F8D9;
	Mon, 10 Feb 2025 16:32:11 +0200 (EET)
Date: Mon, 10 Feb 2025 14:32:11 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC v5 13/15] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <Z6oN60Ek543JiylM@kekkonen.localdomain>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-14-sakari.ailus@linux.intel.com>
 <7215ff25-5fde-42ae-9f53-c2d200855849@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7215ff25-5fde-42ae-9f53-c2d200855849@xs4all.nl>

Hi Hans,

Thank you for the review.

On Mon, Feb 10, 2025 at 03:07:25PM +0100, Hans Verkuil wrote:
> On 03/02/2025 09:58, Sakari Ailus wrote:
> > Add V4L2_CID_BINNING control for configuring binning and enumerating a
> > camera sensor's binning capabilities. The control combines horizontal and
> > vertical binning into a single control as the two are generally related.
> > 
> > New drivers should use this control to configure binning.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  .../media/drivers/camera-sensor.rst           | 10 +++++++
> >  .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
> >  include/uapi/linux/v4l2-controls.h            |  1 +
> >  4 files changed, 42 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 91e5305458b9..59431ab0b923 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -120,6 +120,16 @@ values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> >  
> > +Binning
> > +-------
> > +
> > +Binning has traditionally been configured using :ref:`the compose selection
> > +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> > +<v4l2-cid-camera-sensor-binning>` is also available for binning configuration and
> > +users should use it when it's available. Drivers supporting the control shall
> > +also support the compose rectangle, albeit the rectangle may be read-only when
> > +the control is present.
> > +
> >  .. _media_using_camera_sensor_drivers_embedded_data:
> >  
> >  Embedded data
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > index cdc515c60468..18b484ff5d75 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > @@ -672,3 +672,32 @@ enum v4l2_scene_mode -
> >  
> >      As modes differ for each sensor, menu items are not standardized by this
> >      control and are left to the programmer.
> > +
> > +.. _v4l2-cid-camera-sensor-binning:
> > +
> > +``V4L2_CID_BINNING_FACTORS (integer menu)``
> > +
> > +    Horizontal and vertical binning factors. Binning combines several
> > +    horizontal, vertical or both pixel values into a single pixel. It is a way
> > +    to scale an image. Binning typically produces fairly good quality output.
> > +
> > +    Determines both horizontal and vertical binning factors for a camera
> > +    sensor. The values are encoded in the following way:
> > +
> > +.. flat-table::
> > +    :header-rows:  1
> > +    :stub-columns: 0
> > +
> > +    * - Bits
> > +      - Synopsis
> > +    * - 48--63
> > +      - Horizontal binning numerator.
> > +    * - 32--47
> > +      - Horizontal binning denominator.
> > +    * - 16--31
> > +      - Vertical binning numerator.
> > +    * - 0--15
> > +      - Vertical binning denominator.
> 
> This suggests that the vertical and horizontal binning factors are not
> independent settings, is that correct?

There are dependencies between the two, yes.

> 
> How does this control (and the subsampling controls) relate to the ROTATE control?
> Does it happen before or after the rotate?

In general there's no rotation support in (raw) camera sensors, just
flipping. And flipping isn't affecting binning.

-- 
Kind regards,

Sakari Ailus

