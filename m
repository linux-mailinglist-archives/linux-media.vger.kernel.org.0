Return-Path: <linux-media+bounces-41430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 407C0B3E231
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F41FB17A803
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 12:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02699258EDD;
	Mon,  1 Sep 2025 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y9XZleOO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E08254B09
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756728410; cv=none; b=TXT1TzvUnpU5QMeYF2zHAkq2AoqBBhVZvKzBl8t7P8VYm+S8mW6wrLjp6OR31COArbZ04Vgw5Wq6R771NKRnIl2CN45tBBjE65Z2k0BlthQDz51R8qbb1XnxBJPumehVeazayDF+DkkOnPHY4Rjzd4m+COllOknUYbLpWl8eqjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756728410; c=relaxed/simple;
	bh=Y9511aFZQavW0AiqYtk6WEHlvDdKmV8v+21AxDBnRB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3POcrxlX0s3e8vxkh+Z6wLhri4F+YojVzXM9S4iLkb/u3W460afijNgUEFO1HF5E5walmCg/GCtrnxxhnc3SmPifkTYBmSII3sCsAn43SJJlsIgIerDOw9k3NVlFUt89IMR98/MWTxJj7X2D93RV3s3f8/AF1/GrixIgfsurCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y9XZleOO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-95.net.vodafone.it [5.90.63.95])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CCDBE92;
	Mon,  1 Sep 2025 14:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756728338;
	bh=Y9511aFZQavW0AiqYtk6WEHlvDdKmV8v+21AxDBnRB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y9XZleOOtzmnD5zCn8RT0uL7cYD5YmL45ejkpp81N6JwKb5Ig+apCIt82juoo+bTB
	 Bxb9l5QiI+O4hmZQpYhiECqbV7T01i7fUzGKdb9giYsK9xCQgotUnScucCeLzdPGKm
	 hhF6bUOcRT8JMF3D+6OuyK0Twrp8Uhs2Ic45hSgs=
Date: Mon, 1 Sep 2025 14:06:40 +0200
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
Subject: Re: [PATCH v11 12/66] media: ccs: Support frame descriptors
Message-ID: <7gvah5dvlh3tapzqwr3cbfd5dt3zidlnmasq6b3umudcebex7r@4wehf5whc3kz>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-13-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825095107.1332313-13-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Aug 25, 2025 at 12:50:13PM +0300, Sakari Ailus wrote:
> Provide information on the frame layout using frame descriptors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Are there dependencies on previous patches from this series for these
CCS-only changes ? They look reviewed to me, can they be fast-tracked ?

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 74 ++++++++++++++++++++++++++++++--
>  drivers/media/i2c/ccs/ccs.h      |  4 ++
>  2 files changed, 74 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index bd7d2a8d23dd..109b74476b8c 100644
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
> @@ -2078,10 +2106,11 @@ static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
>  	if (crops)
>  		for (i = 0; i < subdev->entity.num_pads; i++)
>  			crops[i] =
> -				v4l2_subdev_state_get_crop(sd_state, i);
> +				v4l2_subdev_state_get_crop(sd_state, i,
> +							   CCS_STREAM_PIXEL);
>  	if (comps)
> -		*comps = v4l2_subdev_state_get_compose(sd_state,
> -						       ssd->sink_pad);
> +		*comps = v4l2_subdev_state_get_compose(sd_state, ssd->sink_pad,
> +						       CCS_STREAM_PIXEL);
>  }
>
>  /* Changes require propagation only on sink pad. */
> @@ -2114,7 +2143,8 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
>  		fallthrough;
>  	case V4L2_SEL_TGT_COMPOSE:
>  		*crops[CCS_PAD_SRC] = *comp;
> -		fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC);
> +		fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC,
> +						   CCS_STREAM_PIXEL);
>  		fmt->width = comp->width;
>  		fmt->height = comp->height;
>  		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
> @@ -2629,6 +2659,41 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
>  	return ret;
>  }
>
> +static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> +	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
> +	struct v4l2_subdev_state *sd_state;
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
> +	sd_state = v4l2_subdev_lock_and_get_active_state(subdev);
> +	if (!sd_state)
> +		return -EINVAL;
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
> +	v4l2_subdev_unlock_state(sd_state);
> +
> +	return 0;
> +}
> +
>  static int ccs_get_skip_frames(struct v4l2_subdev *subdev, u32 *frames)
>  {
>  	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> @@ -3047,6 +3112,7 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
>  	.set_selection = ccs_set_selection,
>  	.enable_streams = ccs_enable_streams,
>  	.disable_streams = ccs_disable_streams,
> +	.get_frame_desc = ccs_get_frame_desc,
>  };
>
>  static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 518482758da6..0bdb8cd3accb 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -48,6 +48,8 @@
>
>  #define CCS_COLOUR_COMPONENTS		4
>
> +#define CCS_DEFAULT_COMPRESSED_DT	MIPI_CSI2_DT_USER_DEFINED(0)
> +
>  #define SMIAPP_NAME			"smiapp"
>  #define CCS_NAME			"ccs"
>
> @@ -177,6 +179,8 @@ struct ccs_csi_data_format {
>  #define CCS_PAD_SRC			1
>  #define CCS_PADS			2
>
> +#define CCS_STREAM_PIXEL		0
> +
>  struct ccs_binning_subtype {
>  	u8 horizontal:4;
>  	u8 vertical:4;
> --
> 2.47.2
>
>

