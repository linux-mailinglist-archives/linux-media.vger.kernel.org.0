Return-Path: <linux-media+bounces-7523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5958E885F22
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D5711C23A66
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63175134733;
	Thu, 21 Mar 2024 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ti6JH4Wr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108A68592F
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040202; cv=none; b=XxRQd1V0p2dDSrv3gDrBAONk+H6cSbIjLKM5iVC5YBlw33ftSnvWGGenKqW/LTh4lmqxuxmuoa3u9iMKvYU7CdSjiac3zq81W+Majycpjn6LmV43Blm8J6tFxCAMmns8ZL2W8gbWwsM+zd/1WL5GLsE9esA3vAniz9ZN23QwpUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040202; c=relaxed/simple;
	bh=BK35NLzqUGUGczJNbUjJYaS8RivX3ANcSe2DI2mUB4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk8rjL/Q/uid+lw6Go0Xc9B+Dh6wm0IjHh6bs/RVCZDqjCkv+pPbdxln+UXMpVjBtls5wy1YXOeweOSlBkMqpZVXribLTEwOK32TTwdvxh7lzVR847NBtCmAcDAcscwnmHIe3yDdK3E2gbNie0dbpw1UZ2N4ZrW8bDq2x3PJcP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ti6JH4Wr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5ECF1672;
	Thu, 21 Mar 2024 17:56:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711040171;
	bh=BK35NLzqUGUGczJNbUjJYaS8RivX3ANcSe2DI2mUB4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ti6JH4WrbIyw4JpufaIf2X7MGaojDTTVzmSfldEsHrKYECmugtld1ma6hNkUGyUw0
	 xL/0euUS2KTvpPpf3evp6p3f+clYllJl87Cf1xF1VHa5l0rjFhYnLs7R67iQE08pPc
	 uum4PddWV7TS6ljKbNYKrOHlKEOGJzQWxUEM3Q5c=
Date: Thu, 21 Mar 2024 18:56:36 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 33/38] media: ov2740: Switch to
 {enable,disable}_streams
Message-ID: <20240321165636.GG9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-34-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-34-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:11AM +0200, Sakari Ailus wrote:
> Switch from s_stream to enable_streams and disable_streams callbacks.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ov2740.c | 72 +++++++++++++++++---------------------
>  1 file changed, 32 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 552935ccb4a9..44c6724a102c 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -919,16 +919,23 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
>  	return ret;
>  }
>  
> -static int ov2740_start_streaming(struct ov2740 *ov2740)
> +static int ov2740_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
>  {
> -	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct ov2740 *ov2740 = to_ov2740(sd);
>  	const struct ov2740_reg_list *reg_list;
>  	int link_freq_index;
>  	int ret;
>  
> +	ret = pm_runtime_resume_and_get(&client->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = ov2740_identify_module(ov2740);
>  	if (ret)
> -		return ret;
> +		goto out_pm_put;
>  
>  	if (ov2740->nvm)
>  		ov2740_load_otp_data(ov2740->nvm);
> @@ -937,7 +944,7 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
>  	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
>  	if (ret) {
>  		dev_err(&client->dev, "failed to reset\n");
> -		return ret;
> +		goto out_pm_put;
>  	}
>  
>  	usleep_range(10000, 15000);
> @@ -947,64 +954,47 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
>  	ret = ov2740_write_reg_list(ov2740, reg_list);
>  	if (ret) {
>  		dev_err(&client->dev, "failed to set plls\n");
> -		return ret;
> +		goto out_pm_put;
>  	}
>  
>  	reg_list = &ov2740->cur_mode->reg_list;
>  	ret = ov2740_write_reg_list(ov2740, reg_list);
>  	if (ret) {
>  		dev_err(&client->dev, "failed to set mode\n");
> -		return ret;
> +		goto out_pm_put;
>  	}
>  
>  	ret = __v4l2_ctrl_handler_setup(ov2740->sd.ctrl_handler);
>  	if (ret)
> -		return ret;
> +		goto out_pm_put;
>  
>  	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>  			       OV2740_MODE_STREAMING);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&client->dev, "failed to start streaming\n");
> +		goto out_pm_put;
> +	}
>  
> -	return ret;
> -}
> +	return 0;
>  
> -static void ov2740_stop_streaming(struct ov2740 *ov2740)
> -{
> -	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
> +out_pm_put:
> +	pm_runtime_put(&client->dev);
>  
> -	if (ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> -			     OV2740_MODE_STANDBY))
> -		dev_err(&client->dev, "failed to stop streaming\n");
> +	return ret;
>  }
>  
> -static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
> +static int ov2740_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
>  {
> -	struct ov2740 *ov2740 = to_ov2740(sd);
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> -	struct v4l2_subdev_state *sd_state;
> -	int ret = 0;
> -
> -	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
> -
> -	if (enable) {
> -		ret = pm_runtime_resume_and_get(&client->dev);
> -		if (ret < 0)
> -			goto out_unlock;
> +	struct ov2740 *ov2740 = to_ov2740(sd);
> +	int ret;
>  
> -		ret = ov2740_start_streaming(ov2740);
> -		if (ret) {
> -			enable = 0;
> -			ov2740_stop_streaming(ov2740);
> -			pm_runtime_put(&client->dev);
> -		}
> -	} else {
> -		ov2740_stop_streaming(ov2740);
> -		pm_runtime_put(&client->dev);
> -	}
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> +			       OV2740_MODE_STANDBY);
>  
> -out_unlock:
> -	v4l2_subdev_unlock_state(sd_state);
> +	pm_runtime_put(&client->dev);
>  
>  	return ret;
>  }
> @@ -1089,7 +1079,7 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
>  }
>  
>  static const struct v4l2_subdev_video_ops ov2740_video_ops = {
> -	.s_stream = ov2740_set_stream,
> +	.s_stream = v4l2_subdev_s_stream_helper,
>  };
>  
>  static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
> @@ -1097,6 +1087,8 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
>  	.set_fmt = ov2740_set_format,
>  	.enum_mbus_code = ov2740_enum_mbus_code,
>  	.enum_frame_size = ov2740_enum_frame_size,
> +	.enable_streams = ov2740_enable_streams,
> +	.disable_streams = ov2740_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_ops ov2740_subdev_ops = {

-- 
Regards,

Laurent Pinchart

