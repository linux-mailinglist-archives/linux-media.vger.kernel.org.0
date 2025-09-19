Return-Path: <linux-media+bounces-42809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FC4B8A8ED
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 18:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF19D1CC30FF
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 16:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF3B32126F;
	Fri, 19 Sep 2025 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kLb+pJgW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E2223DE7
	for <linux-media@vger.kernel.org>; Fri, 19 Sep 2025 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758299144; cv=none; b=s0nMsF9sf77uzgxhvuxuhP+K7/+NE0RfowDFfOQbzSSe3e5u92n+bMiUPfxqDFWbJdmBI9oIX54E16Z+nQDZ8Sck5Iu/YzfOY3JwjbqvJYY7UB9Cd5Ysgm1AKCGEV0XxcHSftLIP12wFBRs+7oUQbZZke6qlWJCkSY0ZPUuaB10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758299144; c=relaxed/simple;
	bh=DvWdTA0cGpp/OGjI84oyY7v9fK195T7mNGXWSsMNOVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2nnrs+Ho/7I1fNzGxefvNc1FvDZGIqdtjmgMKHqjc4ZL4sffRRcq7RqaEjATiqcPTejwKlrZvy0PTmMTbZ25kz2GXaoIonxGq6QU9c82MFxXIVroeJrike2Z0tvqcI+Ei2XVxfuHrdvqJ0GXqncSZTI8aqm3pk+U3NepkR8/3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kLb+pJgW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758299142; x=1789835142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DvWdTA0cGpp/OGjI84oyY7v9fK195T7mNGXWSsMNOVc=;
  b=kLb+pJgW9PO6bZs+9lVJvPbjHUU/W2SMb47rL19zS/kA6TARQ42ciOId
   M5N0ZhhzR5t/l+zkk9loaOIDlYpY/U2LnLNpfXpeJjV9NsXzEm6ZElXha
   ZqlBaTOY8I37h+TGLUl9rfVOt2qP/1i3RG1Acf3PfoMbH6RXDtxTJBd+x
   O4ierzNaHncLLneE4NNyN5MdmDkHaPPHxH6CIT2UxCbogA9hc/gg1WB8C
   GJE7RD/NlPu6qoaB31NFUc/8+25fJS5iR3df57Thol9RUCqrmZqd+a1fu
   w4smAWccFHX6v/MRVvWGf1ZryXeIcy5PouuH5/UGeehf967GIu8iW7iUZ
   Q==;
X-CSE-ConnectionGUID: ZDtFSXvdSvCRxiGLSE2B3g==
X-CSE-MsgGUID: X74tasMZS72xoklQ5YOQag==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="64470367"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="64470367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 09:25:41 -0700
X-CSE-ConnectionGUID: bJtkLaVbTheH+x6SxmEi1w==
X-CSE-MsgGUID: L8mRFt/2SrKe/5qJohk/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="176695760"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 09:25:35 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3E69811F95D;
	Fri, 19 Sep 2025 19:25:32 +0300 (EEST)
Date: Fri, 19 Sep 2025 19:25:32 +0300
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
Subject: Re: [PATCH v11 44/66] media: uapi: Add controls for sub-sampling
 configuration
Message-ID: <aM2D_AaimtAWdMQn@kekkonen.localdomain>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-45-sakari.ailus@linux.intel.com>
 <4a4nave4dgx4ywqsujjmzbgbi5itsazojklx3km7jnhnylpadr@5l6lnuejdhio>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a4nave4dgx4ywqsujjmzbgbi5itsazojklx3km7jnhnylpadr@5l6lnuejdhio>

Hi Jacopo,

On Mon, Sep 01, 2025 at 07:29:13PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Aug 25, 2025 at 12:50:45PM +0300, Sakari Ailus wrote:
> > Sub-sampling is a way to decrease the data rates after the pixel array by
> > systematically discarding some samples, either vertically or horizontally
> > or both. Add two controls for the purpose and document them. The
> > sub-sampling configuration is taken into account in the compose rectangle.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > ---
> >  .../media/drivers/camera-sensor.rst              | 16 +++++++++++++---
> >  .../userspace-api/media/v4l/ext-ctrls-camera.rst | 11 +++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  2 ++
> >  include/uapi/linux/v4l2-controls.h               |  2 ++
> >  4 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index ef1f51862980..b0ad0d778396 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -120,8 +120,8 @@ values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> >
> > -Binning
> > --------
> > +Binning and sub-sampling
> > +------------------------
> >
> >  Binning has traditionally been configured using :ref:`the compose selection
> >  rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> > @@ -130,7 +130,17 @@ users should use it when it's available. Drivers supporting the control shall
> >  also support the compose rectangle, albeit the rectangle may be read-only when
> >  the control is present.
> >
> > -Binning isn't affected by flipping.
> > +Sub-sampling is often supported as part of a camera sensor's binning
> > +functionality and performed after the binning operation. Sub-sampling typically
> > +produces quality-wise worse results than binning. Sub-sampling factors are
> > +independent horizontally and vertically and they are controlled using two
> > +controls, :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> > +V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`. In
> > +sub-sampling, the image size before sub-sampling is horizontally and vertically
> > +divided by the respective sub-sampling factors. Drivers supporting the control shall
> > +also reflect the sub-sampling configuration in the compose rectangle.
> > +
> > +Binning and sub-sampling aren't affected by flipping.
> >
> >  .. _media_using_camera_sensor_drivers_embedded_data:
> >
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > index 18b484ff5d75..577b73045bee 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> > @@ -701,3 +701,14 @@ enum v4l2_scene_mode -
> >
> >  For instance, a value of ``0x0001000300020003`` indicates binning by 3
> >  (horizontally) * 3/2 (vertically).
> > +
> > +.. _v4l2-cid-camera-sensor-subsampling:
> > +
> > +``V4L2_CID_SUBSAMPLING_HORIZONTAL`` and ``V4L2_CID_SUBSAMPLING_VERTICAL``
> > +(integer)
> 
> Shouldn't these be menus as well, with the driver reporting the
> supported sub-sampling factors ?

They could be integer menus. In practice, as sub-sampling is simply
filtering out data, there's no such connection to hardware A/D processes as
there is in the binning case. For that reason the sub-sampling factor can
be generally chosen rather freely. E.g. CCS has minimum and maximum for odd
and even increments and the values within the range are supported.

I'd simply use integers for these.

> 
> > +
> > +    Horizontal and vertical subsampling factors.
> > +
> > +    Sub-sampling is used to downscale an image, horizontally and vertically, by
> > +    discarding a part of the image data. Typically sub-sampling produces lower
> > +    quality images than binning.
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > index 5e1c28850e87..9f8816bfffbe 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> > @@ -1088,6 +1088,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> >  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
> >  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
> >  	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
> > +	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
> > +	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
> >
> >  	/* FM Radio Modulator controls */
> >  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> > index 90f47f4780e5..51d43d4a3151 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -1102,6 +1102,8 @@ enum v4l2_auto_focus_range {
> >
> >  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
> >  #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
> > +#define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_CAMERA_CLASS_BASE+38)
> > +#define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_CAMERA_CLASS_BASE+39)
> >
> >  /* FM Modulator class control IDs */
> >

-- 
Kind regards,

Sakari Ailus

