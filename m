Return-Path: <linux-media+bounces-33373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE3BAC3F12
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E6423B6A6D
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 12:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49901FE44B;
	Mon, 26 May 2025 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="icVOdcLW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE87E1B9831;
	Mon, 26 May 2025 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748261444; cv=none; b=hSl5Ed9YPMup/EmPw1FeipSDHpbKxavDZYONRYofVH6kXD+0BZTXcq0VgVY/Ncya5271vu041DwhBad6cR87AVPproXfOHUZZ13ZGhj92BIAoV1XV5kWXyjrcWuG6wu28vHpatf5JHp1oHiVqmPUZUakYgr5HRbFVLVJv2NwB+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748261444; c=relaxed/simple;
	bh=cZQpOYhiY2Gn7/YYsV3N5uVt4FURCVYh5mGWhtCL+dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAUrN/vwYc4rz+1uwOHfc6SMF+Js4JvFWqXmJ4l7KNdXh363pzSyWpP5YSa/4hhWZguUBofL24+hAPxSBfMJLIUv6YJ8Awyl4y6tR6RfshVNYZRXLm1/yBX1xphE2ahYtjJ3ISyNdv9YBPdyj/cKybo+1H5gQN9GNFqO6Ud/85M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=icVOdcLW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9D3B7E6;
	Mon, 26 May 2025 14:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748261415;
	bh=cZQpOYhiY2Gn7/YYsV3N5uVt4FURCVYh5mGWhtCL+dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icVOdcLW8i1i0wDcy19eXcnfv6YEu3DHgAfNLOKlC3hyigEDdazkaPkzSBFXhgze2
	 XJ2JRgIN7skMdrXTKNbiW6UF+l0M1HZqYIce1ff8yJwrD3hc233QSCREr0u2muS2Yr
	 VzA+A4yX7/8bDXOjQJo1PHCjL+WUxOpA6WE0/jhM=
Date: Mon, 26 May 2025 14:10:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v6 4/7] media: mt9m114: Apply horizontal / vertical flip
 while streaming
Message-ID: <20250526121034.GF17743@pendragon.ideasonboard.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
 <20250522143512.112043-5-mathis.foerst@mt.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522143512.112043-5-mathis.foerst@mt.com>

Hi Mathis,

Thank you for the patch.

On Thu, May 22, 2025 at 04:35:08PM +0200, Mathis Foerst wrote:
> The current implementation does not apply changes to the V4L2 controls
> HFLIP & VFLIP of the sensor immediately if the sensor is in streaming
> state. The user has to stop and restart the stream for the changes to be
> applied.

This is by design. Changing horizontal or vertical flip will cause a
shift in the bayer pattern, which would require reconfiguring the
downstream devices in the pipeline atomically. This affects raw data
capture.

> Issue a CONFIG_CHANGE when the V4L2 controls HFLIP or VFLIP are set if the
> sensor is in streaming state to apply the change immediately.
> 
> Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
> ---
>  drivers/media/i2c/mt9m114.c | 43 +++++++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index 6c80c6926aef..7d39978835fe 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -399,6 +399,11 @@ struct mt9m114 {
>  		struct v4l2_ctrl *gain;
>  		struct v4l2_ctrl *hblank;
>  		struct v4l2_ctrl *vblank;
> +		struct {
> +			/* horizonal / vertical flip cluster */
> +			struct v4l2_ctrl *hflip;
> +			struct v4l2_ctrl *vflip;
> +		};
>  	} pa;
>  
>  	/* Image Flow Processor */
> @@ -1059,6 +1064,7 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct v4l2_subdev_state *state;
>  	int ret = 0;
>  	u64 mask;
> +	u64 val;
>  
>  	/* V4L2 controls values are applied only when power is up. */
>  	if (!pm_runtime_get_if_in_use(&sensor->client->dev))
> @@ -1095,17 +1101,25 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  
>  	case V4L2_CID_HFLIP:
> -		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN;
> +		mask = MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN |
> +		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
> +		val = (sensor->pa.hflip->val ?
> +		       MT9M114_CAM_SENSOR_CONTROL_HORZ_MIRROR_EN : 0) &
> +		      (sensor->pa.vflip->val ?
> +		       MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN : 0);
>  		ret = cci_update_bits(sensor->regmap,
>  				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> -				      mask, ctrl->val ? mask : 0, NULL);
> -		break;
> +				      mask, val, NULL);
> +		/*
> +		 * A Config-Change needs to be issued for the change to take
> +		 * effect. If we're not streaming ignore this, the change will
> +		 * be applied when the stream is started.
> +		 */
> +		if (ret || !sensor->streaming)
> +			break;
>  
> -	case V4L2_CID_VFLIP:
> -		mask = MT9M114_CAM_SENSOR_CONTROL_VERT_FLIP_EN;
> -		ret = cci_update_bits(sensor->regmap,
> -				      MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
> -				      mask, ctrl->val ? mask : 0, NULL);
> +		ret = mt9m114_set_state(sensor,
> +					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
>  		break;
>  
>  	default:
> @@ -1406,12 +1420,13 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
>  			  sensor->pixrate, sensor->pixrate, 1,
>  			  sensor->pixrate);
>  
> -	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> -			  V4L2_CID_HFLIP,
> -			  0, 1, 1, 0);
> -	v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> -			  V4L2_CID_VFLIP,
> -			  0, 1, 1, 0);
> +	sensor->pa.hflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> +					     V4L2_CID_HFLIP,
> +					     0, 1, 1, 0);
> +	sensor->pa.vflip = v4l2_ctrl_new_std(hdl, &mt9m114_pa_ctrl_ops,
> +					     V4L2_CID_VFLIP,
> +					     0, 1, 1, 0);
> +	v4l2_ctrl_cluster(2, &sensor->pa.hflip);
>  
>  	if (hdl->error) {
>  		ret = hdl->error;

-- 
Regards,

Laurent Pinchart

