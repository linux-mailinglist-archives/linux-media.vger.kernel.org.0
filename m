Return-Path: <linux-media+bounces-42804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50FB8A1C4
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 16:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D373A5A647E
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 14:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7C1314B64;
	Fri, 19 Sep 2025 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTZKYcB+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0AB2652BD
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758293631; cv=none; b=j3m2hFrKFDVxQqZsFQMq2PJchnzzunLyEetVDLfuewQS4URa3Ed1CfXHi12MJ0BRSDPmah3UPXV9gPsC4Bkr3yAhiQz9iR5ebDn48KAUCZJqkuGtbO0+HB1olkxNRwXXgc2uhNQEy9QZsFzTuCcLPxUNS75KMYRld3G/5JIp6qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758293631; c=relaxed/simple;
	bh=PQS7xbWxO9fFUG8ELu1Ss7KQXJtJL+EHhRnFooo6gOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVzabL8f03TPHJLNlsNAnsyB95wR6nbsZm3nOgvJNzmxiITbnWokupYzZ+vHkhbn+qdEZnq2BD09e5kSIUCJQEJycfjAMnuwmTb7uc9V/IuqeFqrPMy2+VOTvYSZVO86HPWiaF1APP/lbPglkdpRDSs1r1Nl73+j7B9yEpV0jLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTZKYcB+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758293629; x=1789829629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PQS7xbWxO9fFUG8ELu1Ss7KQXJtJL+EHhRnFooo6gOw=;
  b=dTZKYcB+QfHsKD9vfS77Zg0KRPyylNLc5K0AZ/93EkBWQNZgHUhtwH1X
   ZPhE5Zy0LQPumqhUBCHLU29TgwM/GobT60O8qsG5yXvrOUBAS17PtqpB/
   1kWJkFxqRLA9WWe3HD3niugz8YcPdR8csWLRztv+l9BI7wWzRpAJcOm5J
   ZEFcxZSdOpQiOlUPl854WFPyITB9xjZ8WMzbLPG3iqF3PXaAACmk1BD99
   XS/gGbZBdtK1U0BJAzIeJz1rhXkwauiNvij83yumzHrtHSBDanDXMi2ZT
   oMLYwCWjf/K6EQoZLvFsqchN9JmFDWbaQG8Pu62/IjBlHH9K7uL8kyojY
   w==;
X-CSE-ConnectionGUID: Rx+ntsT1RAamtlpOkefiUw==
X-CSE-MsgGUID: Q3bYlXtbSlOnoY5YFVxRfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="72012468"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="72012468"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:53:49 -0700
X-CSE-ConnectionGUID: NhSEQfAyTeKePxuAH4CETQ==
X-CSE-MsgGUID: hBU71TbVSEe1epFAGl+aUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176241411"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:53:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2B66511F95D;
	Fri, 19 Sep 2025 17:53:40 +0300 (EEST)
Date: Fri, 19 Sep 2025 17:53:40 +0300
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
Subject: Re: [PATCH v11 43/66] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <aM1udH10FPupD50h@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-44-sakari.ailus@linux.intel.com>
 <anrpx4ux5t4nwvhr55ibqmsp4ilbla3q6mafqoujin47zczsh3@rfe4mh3ctsfn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anrpx4ux5t4nwvhr55ibqmsp4ilbla3q6mafqoujin47zczsh3@rfe4mh3ctsfn>

Hi Jacopo,

Thank you for the review.

On Mon, Sep 01, 2025 at 07:27:13PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:44PM +0300, Sakari Ailus wrote:
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
> I would add "... >` on the internal sink pad that represents the image
> data source.

The compose target has this semantics on the common raw sensor model but
this text is more generic than that.

> 
> > +<v4l2-cid-camera-sensor-binning>` is also available for binning configuration and
> 
> missing 'control' after the :ref:`...` so that it reads
> 
> The V4L2_CID_BINNING -control- is also available
> 
> when rendered

Yes.

> 
> 
> > +users should use it when it's available. Drivers supporting the control shall
> 
> I would not make it just about users, but also for drivers.
> 
> "The V4L2_CID_BINNING control has been introduced as the preferred way
> for drivers and userspace applications for configuring binning."

The UAPI documentation is also relevant for drivers but usually not the
other way around.

> 
> > +also support the compose rectangle, albeit the rectangle may be read-only when
> > +the control is present.
> > +
> > +Binning isn't affected by flipping.
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
> > +
> > +For instance, a value of ``0x0001000300020003`` indicates binning by 3
> > +(horizontally) * 3/2 (vertically).
> 
> indicates an horizontal binning factor of 3 and 3/2 vertical one.

I prefer the text in the patch.

I also realised that the patch is adding the control to the old camera
control class; I'll move it to the image source class.

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
> > index e25c9d669687..90f47f4780e5 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1101,6 +1101,7 @@ enum v4l2_auto_focus_range {
> >  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
> >
> >  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
> > +#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thank you!

-- 
Kind regards,

Sakari Ailus

