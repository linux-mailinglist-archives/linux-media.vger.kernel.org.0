Return-Path: <linux-media+bounces-41476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF4B3ED60
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 19:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9B4166EDD
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 17:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6382E320A19;
	Mon,  1 Sep 2025 17:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nvYsfhuH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C762747B
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756747761; cv=none; b=Ncum2cpRyd4koF64n/S5kCBMTpN40sApbS6mlJgrc/StSPeoc2RWNtKCJAGzsetOiI5emW1fwifPYhNSV6J26mF3Azso3MNSB2++nMLCeArz8Pabmg32QmQpVi/wXI/1sZXOg2qfdxBuVpWnumgDyL0smHu3HWrxMsIeapkQ0wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756747761; c=relaxed/simple;
	bh=Lbzs1XJn4ny2FSavPuIBH651nnoR02bSaSh4OyzY28U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rW1bYi51mPQDytX4Q61G8yrK6EqZyDPPMuRJsPNRFZnfaU2HErWwKHTXnx3oYYnHyy3GMLcoF/c71wUz6p5HFdtGj3mZpdrwWJUrcwmuqVVhTVXy3rFIQy0ka5r+mjKf399QRKXXNKsRgiF0Gl65XwuvfjJtyDoiKwogDQDbG9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nvYsfhuH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A6D62E8A;
	Mon,  1 Sep 2025 19:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756747690;
	bh=Lbzs1XJn4ny2FSavPuIBH651nnoR02bSaSh4OyzY28U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nvYsfhuHZizEW2M6YCB6gJJ2pOYNgMraPwFLgg0M/QTyJO9VKG9/mEBKEt5TaC48k
	 t1dIq3SpkgWC5gWn2FtecLsgsVSKNSCzI1BcLtLfKR3CtaG9b/Pm4Y5K7UYb8lhKQ+
	 cY6S46htbkj8CZVKSUoPdIW+soHf7aKOmRwhXZ7w=
Date: Mon, 1 Sep 2025 19:29:13 +0200
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
Subject: Re: [PATCH v11 44/66] media: uapi: Add controls for sub-sampling
 configuration
Message-ID: <4a4nave4dgx4ywqsujjmzbgbi5itsazojklx3km7jnhnylpadr@5l6lnuejdhio>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-45-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-45-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:45PM +0300, Sakari Ailus wrote:
> Sub-sampling is a way to decrease the data rates after the pixel array by
> systematically discarding some samples, either vertically or horizontally
> or both. Add two controls for the purpose and document them. The
> sub-sampling configuration is taken into account in the compose rectangle.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../media/drivers/camera-sensor.rst              | 16 +++++++++++++---
>  .../userspace-api/media/v4l/ext-ctrls-camera.rst | 11 +++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  2 ++
>  include/uapi/linux/v4l2-controls.h               |  2 ++
>  4 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index ef1f51862980..b0ad0d778396 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -120,8 +120,8 @@ values programmed by the register sequences. The default values of these
>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>  independently of the sensor's mounting rotation.
>
> -Binning
> --------
> +Binning and sub-sampling
> +------------------------
>
>  Binning has traditionally been configured using :ref:`the compose selection
>  rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> @@ -130,7 +130,17 @@ users should use it when it's available. Drivers supporting the control shall
>  also support the compose rectangle, albeit the rectangle may be read-only when
>  the control is present.
>
> -Binning isn't affected by flipping.
> +Sub-sampling is often supported as part of a camera sensor's binning
> +functionality and performed after the binning operation. Sub-sampling typically
> +produces quality-wise worse results than binning. Sub-sampling factors are
> +independent horizontally and vertically and they are controlled using two
> +controls, :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> +V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`. In
> +sub-sampling, the image size before sub-sampling is horizontally and vertically
> +divided by the respective sub-sampling factors. Drivers supporting the control shall
> +also reflect the sub-sampling configuration in the compose rectangle.
> +
> +Binning and sub-sampling aren't affected by flipping.
>
>  .. _media_using_camera_sensor_drivers_embedded_data:
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index 18b484ff5d75..577b73045bee 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -701,3 +701,14 @@ enum v4l2_scene_mode -
>
>  For instance, a value of ``0x0001000300020003`` indicates binning by 3
>  (horizontally) * 3/2 (vertically).
> +
> +.. _v4l2-cid-camera-sensor-subsampling:
> +
> +``V4L2_CID_SUBSAMPLING_HORIZONTAL`` and ``V4L2_CID_SUBSAMPLING_VERTICAL``
> +(integer)

Shouldn't these be menus as well, with the driver reporting the
supported sub-sampling factors ?

> +
> +    Horizontal and vertical subsampling factors.
> +
> +    Sub-sampling is used to downscale an image, horizontally and vertically, by
> +    discarding a part of the image data. Typically sub-sampling produces lower
> +    quality images than binning.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 5e1c28850e87..9f8816bfffbe 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1088,6 +1088,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
>  	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
> +	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
> +	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
>
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 90f47f4780e5..51d43d4a3151 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1102,6 +1102,8 @@ enum v4l2_auto_focus_range {
>
>  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
>  #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
> +#define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_CAMERA_CLASS_BASE+38)
> +#define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_CAMERA_CLASS_BASE+39)
>
>  /* FM Modulator class control IDs */
>
> --
> 2.47.2
>
>

