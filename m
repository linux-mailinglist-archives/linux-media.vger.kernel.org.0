Return-Path: <linux-media+bounces-50685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE1D1E340
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4659306FB71
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF54395DB2;
	Wed, 14 Jan 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbId5NJ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC52A38E11C
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768387339; cv=none; b=iZimVE60oOKpVMNd8BSMYhsY7NWoKM9I3M8v0OZUZpR6S+UBxfKnq3kblk5jItH794rajXlvWBucn9+zz60s4bN2WGZCbz+LVXEeEYUcVKHxC3XIiX2oH5dEJPTm7I3/ydH5n0MnEBe1CAOm5FIfpMdH085gN3A75ByO5L9gJLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768387339; c=relaxed/simple;
	bh=1Y7/eChMoxQiipXPj3a/YSlE9dCLHDzaQUSmbYJqn7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVuQhqGZZQ9vwUoVubZ0MItTwzGboe1wFGNzwGqxIZ8TVGe03KqkKokl+p7CYivFx0+tEskRIAkkYR87RMIpDz7xyAzSpzgF40meiS6pKmP3FXM4vsP4Lta1UlQir/aXxb8KoAU5ydSbncfR/gJKd2W/ZC6YnkojL33ogSNsdM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbId5NJ7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768387338; x=1799923338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Y7/eChMoxQiipXPj3a/YSlE9dCLHDzaQUSmbYJqn7M=;
  b=QbId5NJ7pSaQ+Uqc4cxs/9RueN2XwbWdj9eQb8S9Ktl2HoWCgZXY7wR2
   NL3y57F2siGZsAfJofM/+FwanQtGA8pP63wxWIOqgB5eeRniPTpZLYf+v
   c6sBUieic1umqldlZxMzjdhCTl1Qisgpy+DTympl9ZlGRkNcluDhiHAj9
   wKCaz2h40wzQmAp58TMBcpwXjnShTcWCfULjREsVyHwGa3Abo8d/ffFDr
   EQZ4aDD60vGXLIg21SUauxh/HoXS26Nuh0R6yD689HYi7l15Vx//kVm2W
   V49jOnx/OcFlQiAlpnA+1iaM0KkBHEmHOGGcvEPw8P+eJeLahTZrZ/kG9
   g==;
X-CSE-ConnectionGUID: mBqkY32STUeKbKH7JoIr9w==
X-CSE-MsgGUID: veRgb4IVR96iL0p0Xklzxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69417876"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69417876"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:42:17 -0800
X-CSE-ConnectionGUID: 76GZmhSPRl6A7TRthm/S+w==
X-CSE-MsgGUID: Aen0/CsERmuXNgQ+4YIwqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235899960"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.244.116])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 02:42:10 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 964CA11F9B2;
	Wed, 14 Jan 2026 12:42:08 +0200 (EET)
Date: Wed, 14 Jan 2026 12:42:08 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
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
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 43/64] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <aWdzAGubWsKu6J9K@kekkonen.localdomain>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-44-sakari.ailus@linux.intel.com>
 <ogvkuq54ro3vkvz6cmphnqpaq45zdrxllv7yq77otmwuxx7ydf@cpnxztiwy25h>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ogvkuq54ro3vkvz6cmphnqpaq45zdrxllv7yq77otmwuxx7ydf@cpnxztiwy25h>

Hi Jacopo,

On Mon, Jul 28, 2025 at 05:24:03PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:58:15PM +0300, Sakari Ailus wrote:
> > Add V4L2_CID_BINNING control for configuring binning and enumerating a
> > camera sensor's binning capabilities. The control combines horizontal and
> > vertical binning into a single control as the two are generally related.
> >
> > New drivers should use this control to configure binning.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  .../media/drivers/camera-sensor.rst           | 12 ++++++++
> >  .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
> >  include/uapi/linux/v4l2-controls.h            |  1 +
> >  4 files changed, 44 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 39f3f91c6733..ef1f51862980 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -120,6 +120,18 @@ values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> >
> > +Binning
> > +-------
> > +
> > +Binning has traditionally been configured using :ref:`the compose selection
> > +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> 
> To be honest, I don't think we should only refer to the generic
> description of the selection targets which has not meaning
> specifically in relation to raw camera sensors, but to this very specific
> part of Documentation/userspace-api/media/v4l/subdev-config-model.rst

This documentation applies to all camera sensors, not just those
implementing the common raw sensor model. Either way, I'd expect nearly all
new drivers to implement the common raw sensor model going forward.

> 
> ------------------------------------------------------------------------------
> Binning and sub-sampling are configured using the V4L2_SEL_TGT_COMPOSE
> rectangle, relative to the analogue crop rectangle, on (pad, stream)
> pair 1/0. The driver implementation determines how to configure
> binning and sub-sampling to achieve the desired size.
> ------------------------------------------------------------------------------
> 
> introduced by
> [PATCH v10 40/64] media: Documentation: Add subdev configuration models, raw sensor model
> 
> > +<v4l2-cid-camera-sensor-binning>` is also available for binning configuration and
> > +users should use it when it's available. Drivers supporting the control shall
> > +also support the compose rectangle, albeit the rectangle may be read-only when
> > +the control is present.
> > +
> > +Binning isn't affected by flipping.
> 
> As it isn't affected by other configurations like link_freq etc.
> Why do you think flipping is particular relevant here ?

I added the line to address a review comment from Hans earlier.

> 
> 
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
> 
> Should the control name be singular ? (BINNING_FACTOR) ?

There are two binning factors: horizontal and vertical.

> 
> > +
> > +    Horizontal and vertical binning factors. Binning combines several
> > +    horizontal, vertical or both pixel values into a single pixel. It is a way
> > +    to scale an image. Binning typically produces fairly good quality output.
> > +
> > +    Determines both horizontal and vertical binning factors for a camera
> 
> "This control determines ... "

Sounds good.

> 
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
> > +
> > +For instance, a value of ``0x0001000300020003`` indicates binning by 3
> > +(horizontally) * 3/2 (vertically).
> 
> Ok, I might be missing how 3/2 binning works (I presume it's just 3
> pixels are binned in to 2...)

The hardware engineers would know that, yes. :-)

> 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index a7ea380de5ee..5e1c28850e87 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1087,6 +1087,7 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
> >  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
> >  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
> > +	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
> >
> >  	/* FM Radio Modulator controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > @@ -1427,6 +1428,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
> >  	case V4L2_CID_HDR_SENSOR_MODE:
> >  		*type = V4L2_CTRL_TYPE_MENU;
> >  		break;
> > +	case V4L2_CID_BINNING_FACTORS:
> >  	case V4L2_CID_LINK_FREQ:
> >  		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
> >  		break;
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 762751588439..630850d237ad 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1095,6 +1095,7 @@ enum v4l2_auto_focus_range {
> >  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
> >
> >  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
> > +#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
> >
> >  /* FM Modulator class control IDs */
> >

-- 
Kind regards,

Sakari Ailus

