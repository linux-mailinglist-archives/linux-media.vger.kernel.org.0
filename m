Return-Path: <linux-media+bounces-7519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF84885EC9
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 228382829B9
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 16:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DBA433BD;
	Thu, 21 Mar 2024 16:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uX8/m8k/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F77CBE6F
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039495; cv=none; b=lSmwN+cM6kNzULK0hTplliOzDi0wUkDklLxRcDAPC+yMiOjWzyOURO4aK22sOtGdhLOfOiHpGkNfopd8GhAnApF8mtAuT7MSiPT4J87kK9S6XSE7wTA5y01TAfTEJcEA4mZR3PlSsabrCUKaXsDDiU6ukmtSP/gijHrfP98qL68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039495; c=relaxed/simple;
	bh=2PVzQKdG95CZSSyL66rT4NRx5lgenVPiDTxsvmUUhmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjqikNCV9FFhyPQIC/5VEcC8e+TFbxR2+nLxLETNIBdu2vgFzq2OJgouISN7BkNNfyf6MREmCPdVYK/EyeZAQ10AjcsvqWQ4Mq65P+gZ6Wh0MN30zN2Vb+yzcSfnnDgUWE21J3nYl9SjOgfwlEQB5lRrfVlHgvZe0sCGhlLQZVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uX8/m8k/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89E08672;
	Thu, 21 Mar 2024 17:44:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711039463;
	bh=2PVzQKdG95CZSSyL66rT4NRx5lgenVPiDTxsvmUUhmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uX8/m8k/zFzAr5u/om/na44TdPd/Qp95r63VRMsPy8UbeMopPMr1SyGN/s/lrF8Nb
	 iyBgO3FEh5r6ZQoMzlwpjXtk8mTfd5c3iBYvacYGwIXSTMmInK1vy7l+ga37ZmhCO2
	 33UrUsCzRKs8/zrx3FxMubi1TiBy1wqTV/lXCTKU=
Date: Thu, 21 Mar 2024 18:44:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 22/38] media: ccs: Support frame descriptors
Message-ID: <20240321164448.GC9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-23-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-23-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:00AM +0200, Sakari Ailus wrote:
> Provide information on the frame layout using frame descriptors.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c  | 60 +++++++++++++++++++++++++++++++
>  drivers/media/i2c/ccs/ccs-quirk.h |  7 ++++
>  drivers/media/i2c/ccs/ccs.h       |  4 +++
>  3 files changed, 71 insertions(+)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 0efbc63534bc..9cc2080b73ec 100644
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
> @@ -2632,6 +2660,37 @@ static int ccs_set_selection(struct v4l2_subdev *subdev,
>  	return ret;
>  }
>  
> +static int ccs_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
> +				 struct v4l2_mbus_frame_desc *desc)
> +{
> +	struct ccs_sensor *sensor = to_ccs_sensor(subdev);
> +	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
> +
> +	if (ccs_has_quirk(sensor, frame_desc))
> +		return ccs_call_quirk(sensor, frame_desc, desc);

I would introduce the quirk later, along with the patch that will use
it.

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
> +		ccs_mipi_csi2_data_type(sensor->csi_format->compressed) :

Functionally equivalent,

		ccs_mipi_csi2_data_type(sensor->csi_format->width) :

would be clearer I think. The way it's written today made me wonder why
you want the DT for the compressed format, which is not what you're
doing.

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
> @@ -3054,6 +3113,7 @@ static const struct v4l2_subdev_pad_ops ccs_pad_ops = {
>  	.set_selection = ccs_set_selection,
>  	.enable_streams = ccs_enable_streams,
>  	.disable_streams = ccs_disable_streams,
> +	.get_frame_desc = ccs_get_frame_desc,
>  };
>  
>  static const struct v4l2_subdev_sensor_ops ccs_sensor_ops = {
> diff --git a/drivers/media/i2c/ccs/ccs-quirk.h b/drivers/media/i2c/ccs/ccs-quirk.h
> index 392c97109617..3e1d9eaa33fa 100644
> --- a/drivers/media/i2c/ccs/ccs-quirk.h
> +++ b/drivers/media/i2c/ccs/ccs-quirk.h
> @@ -36,6 +36,7 @@ struct ccs_sensor;
>   *			 access may be done by the caller (default read
>   *			 value is zero), else negative error code on error
>   * @flags: Quirk flags
> + * @frame_desc: Obtain the frame descriptor
>   */
>  struct ccs_quirk {
>  	int (*limits)(struct ccs_sensor *sensor);
> @@ -46,6 +47,8 @@ struct ccs_quirk {
>  	int (*init)(struct ccs_sensor *sensor);
>  	int (*reg_access)(struct ccs_sensor *sensor, bool write, u32 *reg,
>  			  u32 *val);
> +	int (*frame_desc)(struct ccs_sensor *sensor,
> +			  struct v4l2_mbus_frame_desc *desc);
>  	unsigned long flags;
>  };
>  
> @@ -62,6 +65,10 @@ struct ccs_reg_8 {
>  		.val = _val,		\
>  	}
>  
> +#define ccs_has_quirk(sensor, _quirk)					\
> +	((sensor)->minfo.quirk &&					\
> +	 (sensor)->minfo.quirk->_quirk)
> +
>  #define ccs_call_quirk(sensor, _quirk, ...)				\
>  	((sensor)->minfo.quirk &&					\
>  	 (sensor)->minfo.quirk->_quirk ?				\
> diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
> index 4725e6eca8d0..adb152366ea2 100644
> --- a/drivers/media/i2c/ccs/ccs.h
> +++ b/drivers/media/i2c/ccs/ccs.h
> @@ -46,6 +46,8 @@
>  
>  #define CCS_COLOUR_COMPONENTS		4
>  
> +#define CCS_DEFAULT_COMPRESSED_DT	0x30

I'd write

#define CCS_DEFAULT_COMPRESSED_DT	MIPI_CSI2_DT_USER_DEFINED(0)

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

