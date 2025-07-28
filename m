Return-Path: <linux-media+bounces-38583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03741B13E2A
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 17:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D65C3BEF4C
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 15:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1374A27147A;
	Mon, 28 Jul 2025 15:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KuhAKC9K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72A12905
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753716255; cv=none; b=aRgak56qARiz818F9fz3pgdXYIAwBpi8J2GkiAd1oqJPBr91ctHClE9AoqtxnKi+Z7ih9cvQxQdnC5l9d37ahEyQsWkFsl97Wr6WItl6MtFtXT0e0c4GdDegtWuwaIvU6thPUa5T8YXGEHEYFeTvqEiLMLUUp2BT2OTMWSwQy/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753716255; c=relaxed/simple;
	bh=8B8sSnUqtUHxGsihtZTP8uPViucRc/t6QkI702Oa5D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWHAD6ioIya3mL1YT6wIMSbwmfYiu7uliefFOWXEA95Esta1i9HyLO3KgcDAqPAh6/O0FJbhKRz4Znj1XvsPajSiDekp1To1bEgcVZOAeeF0/uT1V6HU/3NbR5a+BA1yM/Q0prVnK9eIhW6ReN4Fuk9QaBJLGfoT3AC220/JCrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KuhAKC9K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-139-29.net.vodafone.it [5.90.139.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B420442B;
	Mon, 28 Jul 2025 17:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753716208;
	bh=8B8sSnUqtUHxGsihtZTP8uPViucRc/t6QkI702Oa5D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KuhAKC9KoDsht4P7mc/yLm9AvriYlGLpieOCidNFXVayPA4sBPsSj0usabfhAAUOy
	 WTIuFxLf5AJSKhS+6n3JMSshKWqEGEMLNvzbmmTSP8WproN6Uc4wXLplSOVeo3KCkE
	 M5Yaud2ylxeW5iNwm3CbW4E025OWYLXJ+rlzWlY0=
Date: Mon, 28 Jul 2025 17:24:03 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 43/64] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <ogvkuq54ro3vkvz6cmphnqpaq45zdrxllv7yq77otmwuxx7ydf@cpnxztiwy25h>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-44-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-44-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:58:15PM +0300, Sakari Ailus wrote:
> Add V4L2_CID_BINNING control for configuring binning and enumerating a
> camera sensor's binning capabilities. The control combines horizontal and
> vertical binning into a single control as the two are generally related.
>
> New drivers should use this control to configure binning.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../media/drivers/camera-sensor.rst           | 12 ++++++++
>  .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  4 files changed, 44 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 39f3f91c6733..ef1f51862980 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -120,6 +120,18 @@ values programmed by the register sequences. The default values of these
>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>  independently of the sensor's mounting rotation.
>
> +Binning
> +-------
> +
> +Binning has traditionally been configured using :ref:`the compose selection
> +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING

To be honest, I don't think we should only refer to the generic
description of the selection targets which has not meaning
specifically in relation to raw camera sensors, but to this very specific
part of Documentation/userspace-api/media/v4l/subdev-config-model.rst

------------------------------------------------------------------------------
Binning and sub-sampling are configured using the V4L2_SEL_TGT_COMPOSE
rectangle, relative to the analogue crop rectangle, on (pad, stream)
pair 1/0. The driver implementation determines how to configure
binning and sub-sampling to achieve the desired size.
------------------------------------------------------------------------------

introduced by
[PATCH v10 40/64] media: Documentation: Add subdev configuration models, raw sensor model

> +<v4l2-cid-camera-sensor-binning>` is also available for binning configuration and
> +users should use it when it's available. Drivers supporting the control shall
> +also support the compose rectangle, albeit the rectangle may be read-only when
> +the control is present.
> +
> +Binning isn't affected by flipping.

As it isn't affected by other configurations like link_freq etc.
Why do you think flipping is particular relevant here ?


> +
>  .. _media_using_camera_sensor_drivers_embedded_data:
>
>  Embedded data
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index cdc515c60468..18b484ff5d75 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -672,3 +672,32 @@ enum v4l2_scene_mode -
>
>      As modes differ for each sensor, menu items are not standardized by this
>      control and are left to the programmer.
> +
> +.. _v4l2-cid-camera-sensor-binning:
> +
> +``V4L2_CID_BINNING_FACTORS (integer menu)``

Should the control name be singular ? (BINNING_FACTOR) ?

> +
> +    Horizontal and vertical binning factors. Binning combines several
> +    horizontal, vertical or both pixel values into a single pixel. It is a way
> +    to scale an image. Binning typically produces fairly good quality output.
> +
> +    Determines both horizontal and vertical binning factors for a camera

"This control determines ... "

> +    sensor. The values are encoded in the following way:
> +
> +.. flat-table::
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - Bits
> +      - Synopsis
> +    * - 48--63
> +      - Horizontal binning numerator.
> +    * - 32--47
> +      - Horizontal binning denominator.
> +    * - 16--31
> +      - Vertical binning numerator.
> +    * - 0--15
> +      - Vertical binning denominator.
> +
> +For instance, a value of ``0x0001000300020003`` indicates binning by 3
> +(horizontally) * 3/2 (vertically).

Ok, I might be missing how 3/2 binning works (I presume it's just 3
pixels are binned in to 2...)

> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index a7ea380de5ee..5e1c28850e87 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1087,6 +1087,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
> +	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
>
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1427,6 +1428,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_HDR_SENSOR_MODE:
>  		*type = V4L2_CTRL_TYPE_MENU;
>  		break;
> +	case V4L2_CID_BINNING_FACTORS:
>  	case V4L2_CID_LINK_FREQ:
>  		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 762751588439..630850d237ad 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1095,6 +1095,7 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
>
>  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
> +#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
>
>  /* FM Modulator class control IDs */
>
> --
> 2.39.5
>
>

