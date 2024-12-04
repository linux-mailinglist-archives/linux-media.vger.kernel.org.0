Return-Path: <linux-media+bounces-22608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44709E38DD
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70270284417
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F511B21AE;
	Wed,  4 Dec 2024 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nPx7PAQz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D161AC884
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733312016; cv=none; b=m0Q9n2KrVnRGXmIJtbHhhpkFHNVlWc221MIgUisZfRZMsmtAqP9Us+dNZpwAMt+W+RMufUqj9RVGEoe/sBkQ0rFVp8DANYkzLjFGDR6vfUJ5AAwHXg2SUaPFTB3v0qcf/xPWCq0/UO0mFnRCyNMXaDDXPj37Q0Lrao6ILh5UYg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733312016; c=relaxed/simple;
	bh=t0HA9wIg2oxHnm6oZJDQCmxr1jHH3bVso0Oooz2+sJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMIkNoW6CYKl8/a4uIzIa8pbWCEqkD9NZ2TI9j7uem6+kE3q0UTwnYzZNeiWdKFZrpuaED7je9WdgNq62G+tgrHlqUVCQxESznLDGm1Mc3TqfDSU9BXj95wZrBBTg8VGrcHK5XBeQWvKb93ufimTEECuFq1QB3MVpcYvQdyh1rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nPx7PAQz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 777089FC;
	Wed,  4 Dec 2024 12:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733311983;
	bh=t0HA9wIg2oxHnm6oZJDQCmxr1jHH3bVso0Oooz2+sJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPx7PAQzPhKyn2TfZbVD9cddXbaBsKWU+o2BkahvARbWFf2Eez3MP8wYkT39NZ1my
	 dMsL0nE25IE8Zii6pSsR7+zVLcPE6TYAUcghA6enf7YKlKv/Qn17c9amTJgePARYT+
	 av91tvmneCJsJLKs3TKqoB7XO6aN5+TC/wWXJ9ws=
Date: Wed, 4 Dec 2024 12:33:28 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [RFC v3 7/9] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
Message-ID: <hkfnqpaukvvffbr3g5ybgy6xgqio4ohdtns72jytk242epykva@c4o5wmtxbeas>
References: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
 <20241129095142.87196-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241129095142.87196-8-sakari.ailus@linux.intel.com>

Hi Sakari

On Fri, Nov 29, 2024 at 11:51:40AM +0200, Sakari Ailus wrote:
> Add V4L2_CID_BINNING control for configuting binning and enumerating a
> camera sensor's binning capabilities. The control combines horizontal and
> vertical binning into a single control as the two are generally related.
>
> New drivers should use this control to configure binning.

I thought the idea was to post-pone this (and the following 2 patches)
to when controls will be able to be tested without changing the device
configuration, to properly support TRY_FORMAT, and before that time
work with selection rectangles and let the drivers select the
"correct" binning/scaling factors deduced from the
TGT_CROP-to-TGT_COMPOSE ratio on (pad, stream) 1/0

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/drivers/camera-sensor.rst           | 10 +++++++
>  .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  4 files changed, 42 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 5bc4c79d230c..c6167c91f46c 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -107,6 +107,16 @@ values programmed by the register sequences. The default values of these
>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>  independently of the sensor's mounting rotation.
>
> +Binning
> +-------
> +
> +Binning has traditionally been configured using :ref:`the compose selection
> +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> +<v4l2-cid-camera-sensor-binning>` is also available for binning configuration and
> +users should use it when it's available. Drivers supporting the control shall
> +also support the compose rectangle, albeit the rectangle may be read-only when
> +the control is present.
> +
>  .. _media_using_camera_sensor_drivers_embedded_data:
>
>  Embedded data
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index cdc515c60468..3fbab0e78719 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -672,3 +672,32 @@ enum v4l2_scene_mode -
>
>      As modes differ for each sensor, menu items are not standardized by this
>      control and are left to the programmer.
> +
> +.. _v4l2-cid-camera-sensor-binning:
> +
> +``V4L2_CID_BINNING (integer menu)``
> +
> +    Horizontal and vertical binning factors. Binning combines several
> +    horizontal, vertical or both pixel values into a single pixel. It is a way
> +    to scale an image. Binning typically produces fairly good quality output.
> +
> +    Determines both horizontal and vertical binning factors for a camera
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
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 24c9c25e20d1..3a84051ec11c 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1087,6 +1087,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
> +	case V4L2_CID_BINNING:			return "Binning Factors";
>
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1424,6 +1425,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_HDR_SENSOR_MODE:
>  		*type = V4L2_CTRL_TYPE_MENU;
>  		break;
> +	case V4L2_CID_BINNING:
>  	case V4L2_CID_LINK_FREQ:
>  		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 0152240229ab..8d5815a058d7 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1088,6 +1088,7 @@ enum v4l2_auto_focus_range {
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

