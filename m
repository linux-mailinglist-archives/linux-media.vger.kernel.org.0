Return-Path: <linux-media+bounces-49645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73227CE6E74
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 14:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6B4B300C0EB
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 13:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469F131960A;
	Mon, 29 Dec 2025 13:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CzfuyNyH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D672F83C3;
	Mon, 29 Dec 2025 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767015853; cv=none; b=B6vByA0MoUlhVPCH5cY26AzNuFMdaBq15hmIYnJnIzE7Kv0NOGH2szsOZg8R/xosVBlTJk5TIHdwsWe7sAQVRw8JWajTiCkFjCgq+d/sd08tMD82QKbJeAoOFfs5wbcin1t1V8dR+OMr4dLnDewQNzs/dmrtvw1ybS9Zyo2IADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767015853; c=relaxed/simple;
	bh=dYf9mOwjazzL34JsZ1eI2UV+Lolf1qvovOkDnsrDHF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkJfyD1+YtRYOb1V/quapTax8nvTCuqXRUKhS65G6zMzJaP43FBVJD1YguJ8K3iTB6jNQqpxMEOfiC4Aan+gWi+wPLSExGWxaqDoLQceFWMQb82/c89RlRp44TGP3Ur5QKDqz2zDAASlY8lnYVczDHIXOYZqk2ktfS7MQINmvww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CzfuyNyH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C3BF59CA;
	Mon, 29 Dec 2025 14:43:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767015833;
	bh=dYf9mOwjazzL34JsZ1eI2UV+Lolf1qvovOkDnsrDHF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzfuyNyHOjiIGUs6loDni9kKMGYfb7K3kiUGd+XpHavKjaHHvCzMOVTVIHyVsjH7t
	 zn2t7ZOhpZKdyWa7lotcJrVwa+MACw4vJO4zG5QuEyHVtoH7lQYxNhHDT1MvPTTACz
	 O4L+M8dB8XiUhVsw5N1xEgyyOxp/yFQ36X2y2qUQ=
Date: Mon, 29 Dec 2025 15:43:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
	jacopo@jmondi.org, mchehab@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
	johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
	jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: i2c: ov5647: switch to
 {enable,disable}_streams
Message-ID: <20251229134349.GD6598@pendragon.ideasonboard.com>
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-4-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229023018.2933405-4-xiaolei.wang@windriver.com>

On Mon, Dec 29, 2025 at 10:30:18AM +0800, Xiaolei Wang wrote:
> Switch from s_stream to enable_streams and disable_streams callbacks.
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/media/i2c/ov5647.c | 69 ++++++++++++++++----------------------
>  1 file changed, 29 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index f0ca8cc14794..7f4541f46335 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -637,23 +637,29 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
>  	return 0;
>  }
>  
> -static int ov5647_stream_on(struct v4l2_subdev *sd)
> +static int ov5647_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct ov5647 *sensor = to_sensor(sd);
>  	u8 val = MIPI_CTRL00_BUS_IDLE;
>  	int ret = 0;
>  
> +	ret = pm_runtime_resume_and_get(&client->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = ov5647_set_mode(sd);
>  	if (ret) {
>  		dev_err(&client->dev, "Failed to program sensor mode: %d\n", ret);
> -		return ret;
> +		goto err_rpm_put;
>  	}
>  
>  	/* Apply customized values from user when stream starts. */
> -	ret =  v4l2_ctrl_handler_setup(sd->ctrl_handler);
> +	ret = __v4l2_ctrl_handler_setup(sd->ctrl_handler);
>  	if (ret)
> -		return ret;
> +		goto err_rpm_put;
>  
>  	if (sensor->clock_ncont)
>  		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
> @@ -663,11 +669,18 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>  	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
>  	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
>  
> +err_rpm_put:

I would name the label 'done' as it's also used in the normal exit path,
not only in case of errors.

> +	if (ret)
> +		pm_runtime_put(&client->dev);
> +
>  	return ret;
>  }
>  
> -static int ov5647_stream_off(struct v4l2_subdev *sd)
> +static int ov5647_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
>  {
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct ov5647 *sensor = to_sensor(sd);
>  	int ret = 0;
>  
> @@ -677,13 +690,15 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
>  	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
>  	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
>  
> +	pm_runtime_put(&client->dev);
> +
>  	return ret;
>  }
>  
>  static int ov5647_power_on(struct device *dev)
>  {
>  	struct ov5647 *sensor = dev_get_drvdata(dev);
> -	int ret;
> +	int ret = 0;
>  
>  	dev_dbg(dev, "OV5647 power on\n");
>  
> @@ -706,7 +721,11 @@ static int ov5647_power_on(struct device *dev)
>  	}
>  
>  	/* Stream off to coax lanes into LP-11 state. */
> -	ret = ov5647_stream_off(&sensor->sd);
> +	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
> +		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
> +		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
> +	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
> +	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);

Could you please factor this code out to a separate function (you can
name it ov5647_stream_stop() for instance) instead of duplicating it ?

With that (and the 0 initialization of ret above dropped as it won't be
needed anymore),

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	if (ret < 0) {
>  		dev_err(dev, "camera not available, check power\n");
>  		goto error_clk_disable;
> @@ -803,40 +822,8 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
>  	return NULL;
>  }
>  
> -static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	int ret;
> -
> -	if (enable) {
> -		ret = pm_runtime_resume_and_get(&client->dev);
> -		if (ret < 0)
> -			return ret;
> -
> -		ret = ov5647_stream_on(sd);
> -		if (ret < 0) {
> -			dev_err(&client->dev, "stream start failed: %d\n", ret);
> -			goto error_pm;
> -		}
> -	} else {
> -		ret = ov5647_stream_off(sd);
> -		if (ret < 0) {
> -			dev_err(&client->dev, "stream stop failed: %d\n", ret);
> -			goto error_pm;
> -		}
> -		pm_runtime_put(&client->dev);
> -	}
> -
> -	return 0;
> -
> -error_pm:
> -	pm_runtime_put(&client->dev);
> -
> -	return ret;
> -}
> -
>  static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
> -	.s_stream =		ov5647_s_stream,
> +	.s_stream = v4l2_subdev_s_stream_helper,
>  };
>  
>  static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
> @@ -979,6 +966,8 @@ static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
>  	.set_fmt		= ov5647_set_pad_fmt,
>  	.get_fmt		= ov5647_get_pad_fmt,
>  	.get_selection		= ov5647_get_selection,
> +	.enable_streams         = ov5647_enable_streams,
> +	.disable_streams        = ov5647_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_ops ov5647_subdev_ops = {

-- 
Regards,

Laurent Pinchart

