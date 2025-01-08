Return-Path: <linux-media+bounces-24409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B6A05C9B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 14:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B9811884096
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2025 13:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44061FA8FA;
	Wed,  8 Jan 2025 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fXqZpAbG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF911F2C44
	for <linux-media@vger.kernel.org>; Wed,  8 Jan 2025 13:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342475; cv=none; b=XZhiS95COPvywJNB5+0nv0YAYtEVxzA4SVsESfR9nhrPQo2ciFkL/+cSdFR+PDbpGhevx3xoW3S06mqFEDU6zdvLxOtvAiUB2XmamC3uHnoDeLP0Y57mW5LiNYounvJhHH4a2RkLTv3FUKWcZ69BAIQQdbtgvw2Yrlh/XRSM5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342475; c=relaxed/simple;
	bh=HgomU9ZkBxXsXqxDU1RD+Io9+Qznyk/OTLPFxpmhSmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjYOiCXf5I4cj8Ph4+AQlwNewF9KDhZVmevaGp+5+gkUOWPIBXPyJgh6bcMBlJfrjYpWZSycJhm9tWP0Ur9ihUbU7KOKsHHg/WN++IN7rCsK89XLSvkMuubgnIqeGEhmEml0WS3CIHJO7rS7APYhE2gchrYcmfH/bW6aBopDD2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fXqZpAbG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A43C5B3;
	Wed,  8 Jan 2025 14:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736342416;
	bh=HgomU9ZkBxXsXqxDU1RD+Io9+Qznyk/OTLPFxpmhSmU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fXqZpAbGnXadg1J0f0kVeuSzNhPNV0lykm7crIJWTGpPjfR9gHaRlcmO1ThDd4Jee
	 VVcbb+0aCRrNoXfylHTejNmT3vePaOoLSZRdsQJgE27T+tlMrbY9CNJBjRjqkt9EdF
	 nRlg+FGCJbK/B7cqzQDiSFmD21hOBRy8Y46j4yLc=
Message-ID: <d2808e45-f7f7-48c3-82b7-32786c8fd23e@ideasonboard.com>
Date: Wed, 8 Jan 2025 15:21:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 7/9] media: uapi: Add V4L2_CID_BINNING control for
 binning configuration
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
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
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>
References: <20241220132419.1027206-1-sakari.ailus@linux.intel.com>
 <20241220132419.1027206-8-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241220132419.1027206-8-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/12/2024 15:24, Sakari Ailus wrote:
> Add V4L2_CID_BINNING control for configuting binning and enumerating a

"configuring".

> camera sensor's binning capabilities. The control combines horizontal and
> vertical binning into a single control as the two are generally related.

It's a bit sad we need to combine different values into one control like 
this, but I see the benefit.

> New drivers should use this control to configure binning.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../media/drivers/camera-sensor.rst           | 10 +++++++
>   .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
>   include/uapi/linux/v4l2-controls.h            |  1 +
>   4 files changed, 42 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 5bc4c79d230c..c6167c91f46c 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -107,6 +107,16 @@ values programmed by the register sequences. The default values of these
>   controls shall be 0 (disabled). Especially these controls shall not be inverted,
>   independently of the sensor's mounting rotation.
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
>   .. _media_using_camera_sensor_drivers_embedded_data:
>   
>   Embedded data
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index cdc515c60468..18b484ff5d75 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -672,3 +672,32 @@ enum v4l2_scene_mode -
>   
>       As modes differ for each sensor, menu items are not standardized by this
>       control and are left to the programmer.
> +
> +.. _v4l2-cid-camera-sensor-binning:
> +
> +``V4L2_CID_BINNING_FACTORS (integer menu)``
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
> index 24c9c25e20d1..5945976b841f 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1087,6 +1087,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>   	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
>   	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>   	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
> +	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
>   
>   	/* FM Radio Modulator controls */
>   	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1424,6 +1425,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>   	case V4L2_CID_HDR_SENSOR_MODE:
>   		*type = V4L2_CTRL_TYPE_MENU;
>   		break;
> +	case V4L2_CID_BINNING_FACTORS:
>   	case V4L2_CID_LINK_FREQ:
>   		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
>   		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 0152240229ab..8d5815a058d7 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1088,6 +1088,7 @@ enum v4l2_auto_focus_range {
>   #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
>   
>   #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
> +#define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
>   
>   /* FM Modulator class control IDs */
>   

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


