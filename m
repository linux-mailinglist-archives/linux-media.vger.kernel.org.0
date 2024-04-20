Return-Path: <linux-media+bounces-9794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F18ABA33
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 10:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E54228177A
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 08:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55DC14003;
	Sat, 20 Apr 2024 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jzo8VeQR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB05813AC5
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 08:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713600027; cv=none; b=lYXZWwmH1ZeiSMFsK2vAaxLfgBZlC4QCcMsyCCl6aOAJ6Aumuoz8yId2IglyoardIXzct5ZV5OgkrEJ2cddf7bW7+yMwSvsWq5LsFhrg4WsNLscpOwkrfL/LfL4R3y4BCDRhH5+oK9oMJbp6/8sE9Czbp0dg6J8mjO+t7BlZU+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713600027; c=relaxed/simple;
	bh=nblk1NyCrMTilvKrzjRLLCimcgvh7HBaKX97lzjHmKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I85Z2/JfwZ9wOw3pCpYIPQ2g4BcsHoO35lxPV17ZFQdfzkp+PDszSNZNrGTdM02KSx4btbf9wSyyDiUpKKoAw5UIk1hEZsP8M9Gs4C1p3f6UgHyIcHhCufphZRpI9P5MfgluqsBN7u3UYO9zXewjcB/SZvOaZ9Pk76skrzTmFZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jzo8VeQR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C85622BC;
	Sat, 20 Apr 2024 09:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713599974;
	bh=nblk1NyCrMTilvKrzjRLLCimcgvh7HBaKX97lzjHmKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzo8VeQRzv5jQ1KvA9+n/l1FEbUXtdQ6pDy5QjRD8Gy4k39SPQAPxXTF4S0REA4Ei
	 gRU7CGoya4IuMtsYpGC0p99F5yoNAHNGmZdGfJxsWPRE/td2E/4CnVXsRRRYChoXzP
	 Mp/CBB7jd9W2n7a/IHre6EZV34wSqZHjcJtZ+fJs=
Date: Sat, 20 Apr 2024 11:00:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 24/46] media: ccs: Support frame descriptors
Message-ID: <20240420080015.GN6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-25-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-25-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:32:57PM +0300, Sakari Ailus wrote:
> Provide information on the frame layout using frame descriptors.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 57 ++++++++++++++++++++++++++++++++
>  drivers/media/i2c/ccs/ccs.h      |  4 +++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index a711233f6fbf..3ca2415fca3b 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -25,6 +25,7 @@
>  #include <linux/slab.h>
>  #include <linux/smiapp.h>
>  #include <linux/v4l2-mediabus.h>
> +#include <media/mipi-csi2.h>
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -245,6 +246,33 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
>  	return ret;
>  }
>  
> +static u8 ccs_mipi_csi2_data_type(unsigned int bpp)
> +{
> +	switch (bpp) {
> +	case 6:
> +		return MIPI_CSI2_DT_RAW6;
> +	case 7:
> +		return MIPI_CSI2_DT_RAW7;
> +	case 8:
> +		return MIPI_CSI2_DT_RAW8;
> +	case 10:
> +		return MIPI_CSI2_DT_RAW10;
> +	case 12:
> +		return MIPI_CSI2_DT_RAW12;
> +	case 14:
> +		return MIPI_CSI2_DT_RAW14;
> +	case 16:
> +		return MIPI_CSI2_DT_RAW16;
> +	case 20:
> +		return MIPI_CSI2_DT_RAW20;
> +	case 24:
> +		return MIPI_CSI2_DT_RAW24;
> +	default:
> +		WARN_ON(1);
> +		return 0;
> +	}
> +}
> +
>  static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
> @@ -2633,6 +2661,34 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
>  	return ret;
>  }
>  
> +static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> +	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
> +
> +	switch (sensor->hwcfg.csi_signalling_mode) {
> +	case CCS_CSI_SIGNALING_MODE_CSI_2_DPHY:
> +	case CCS_CSI_SIGNALING_MODE_CSI_2_CPHY:
> +		desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> +		break;
> +	default:
> +		/* FIXME: CCP2 support */
> +		return -EINVAL;
> +	}
> +
> +	entry->pixelcode = sensor->csi_format->code;
> +	entry->stream = CCS_STREAM_PIXEL;
> +	entry->bus.csi2.dt =
> +		sensor->csi_format->width == sensor->csi_format->compressed ?
> +		ccs_mipi_csi2_data_type(sensor->csi_format->width) :
> +		CCS_DEFAULT_COMPRESSED_DT;
> +	entry++;
> +	desc->num_entries++;
> +
> +	return 0;
> +}
> +
>  static int ccs_get_skip_frames(struct v4l2_subdev *subdev, u32 *frames)
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> @@ -3055,6 +3111,7 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
>  	.set_selection = ccs_set_selection,
>  	.enable_streams = ccs_enable_streams,
>  	.disable_streams = ccs_disable_streams,
> +	.get_frame_desc = ccs_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 4725e6eca8d0..90b442a3d53e 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -46,6 +46,8 @@
>  
>  #define CCS_COLOUR_COMPONENTS		4
>  
> +#define CCS_DEFAULT_COMPRESSED_DT	MIPI_CSI2_DT_USER_DEFINED(0)
> +
>  #define SMIAPP_NAME			"smiapp"
>  #define CCS_NAME			"ccs"
>  
> @@ -175,6 +177,8 @@ struct ccs_csi_data_format {
>  #define CCS_PAD_SRC			1
>  #define CCS_PADS			2
>  
> +#define CCS_STREAM_PIXEL		0
> +
>  struct ccs_binning_subtype {
>  	u8 horizontal:4;
>  	u8 vertical:4;

-- 
Regards,

Laurent Pinchart

