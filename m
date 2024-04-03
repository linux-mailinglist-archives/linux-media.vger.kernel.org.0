Return-Path: <linux-media+bounces-8524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63213896ED8
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 14:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 876111C2105E
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 12:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB18B1420C4;
	Wed,  3 Apr 2024 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qu39B/uH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6957146588
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712147225; cv=none; b=HIL6QgjCJKiL94T+DEqcM3vyepJ2An/Kqx8Iu+9cVNVQb0La4/XUEOicxvYKC0V5u9KC4DptfJW8vC4zlb2XgdfTvlj1U08iygnkiz5uKULcnWDgzOQ5P+1Lnbm06LQwHNOHXEEfKdfKK1WGyuQFb9tvVNIy5akxeC7D1DyrDMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712147225; c=relaxed/simple;
	bh=Zy/M8aNYONxJGXe3WuHCJOu2jY2K97JusptQ5Clk+cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hATpnUgVImvDiBSZOArkVVA2hcrgaEvESaRQR4OTWvdSaWyBKOfxYv64BwfAPjNTi0j6Xbpz9Cb/89BysqUNDiiYRlmpEbyWS2x3tiwD3F4hjZNFBOtatSgDJugyofD0p6dfoVm+aGaTCajtoUohOW9lDexILNYt/Iw+2VcH1eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qu39B/uH; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4339CuKW002614;
	Wed, 3 Apr 2024 14:26:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=VxO9mKw9OH0OidKUhW58U4Aj9l4yR5RqL55NAfEEA3c=; b=qu
	39B/uHui6L3SC4lefDY5Jd5R3T3EWgompRoWd//I1UZEHuMkN8o8/gT855MRrLf/
	hxWqwCQRqdOd7m6nxM784sN4IVJQ0SzkxkERyp18aUEwH/l1P4XYclW4BtRW2M5i
	oL5EYquUsYSUxoiWDmHricLNGeRNfDRSOvbdlYebqgLMjfM1/RiytqEZVWqgyF0W
	Z/dWV5tmxZdFDDRv8bdCwaHF7gwM6ohxWMzk6yrh61NOcuTCIBRIMmCWWRcv4/0R
	dQPOd/xpApFVuxKslEmQHlVkoazugVCUAOiyk/sgOI4zuxSx7XzyT7Bw1x3oVqkv
	ho4euZV7BzVe6xvm+DJQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x6wsuehce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 14:26:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 728024002D;
	Wed,  3 Apr 2024 14:26:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F46421861B;
	Wed,  3 Apr 2024 14:26:25 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 3 Apr
 2024 14:26:24 +0200
Message-ID: <cd1f6c89-bd97-4b6b-9f01-28f3aeb1e7b1@foss.st.com>
Date: Wed, 3 Apr 2024 14:26:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: i2c: st-vgxy61: Use sub-device active state
To: Julien Massot <julien.massot@collabora.com>, <mchehab@kernel.org>,
        <sakari.ailus@linux.intel.com>, <sylvain.petinot@foss.st.com>
CC: <linux-media@vger.kernel.org>, <kernel@collabora.com>
References: <20240315085158.1213159-1-julien.massot@collabora.com>
 <20240315085158.1213159-2-julien.massot@collabora.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20240315085158.1213159-2-julien.massot@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_10,2024-04-03_01,2023-05-22_02

Hi Julien,

Thank you for your patch.


First, sorry for the delay. I have a lot of stuff ongoing. I'll be more
available now.

Second, I don't currently have a setup that can handle the multi stream
serie. Therefore I'm not able to test your serie. Following your
patchset acquiring such a platform went up in my todo list.


On 3/15/24 09:51, Julien Massot wrote:
> Use sub-device active state. Rely on control handler lock to serialize
> access to the active state.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

I have yet to dive deep into active states.
I find curious that the 'current_mode' field in vgxy61_dev is still
here. From my understanding it should be replaced by
'v4l2_subdev_state_get_format', and all the 'current_mode->crop'
replaced by 'v4l2_subdev_state_get_crop'.
Someone tell me if this is incorrect.

> ---
>  drivers/media/i2c/st-vgxy61.c | 109 ++++++++++++----------------------
>  1 file changed, 39 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
> index b9e7c57027b1..733713f909cf 100644
> --- a/drivers/media/i2c/st-vgxy61.c
> +++ b/drivers/media/i2c/st-vgxy61.c
> @@ -397,8 +397,6 @@ struct vgxy61_dev {
>  	u16 line_length;
>  	u16 rot_term;
>  	bool gpios_polarity;
> -	/* Lock to protect all members below */
> -	struct mutex lock;
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *pixel_rate_ctrl;
>  	struct v4l2_ctrl *expo_ctrl;
> @@ -686,27 +684,6 @@ static int vgxy61_enum_mbus_code(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> -static int vgxy61_get_fmt(struct v4l2_subdev *sd,
> -			  struct v4l2_subdev_state *sd_state,
> -			  struct v4l2_subdev_format *format)
> -{
> -	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
> -	struct v4l2_mbus_framefmt *fmt;
> -
> -	mutex_lock(&sensor->lock);
> -
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> -		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
> -	else
> -		fmt = &sensor->fmt;
> -
> -	format->format = *fmt;
> -
> -	mutex_unlock(&sensor->lock);
> -
> -	return 0;
> -}
> -
>  static u16 vgxy61_get_vblank_min(struct vgxy61_dev *sensor,
>  				 enum vgxy61_hdr_mode hdr)
>  {
> @@ -1167,16 +1144,17 @@ static int vgxy61_stream_disable(struct vgxy61_dev *sensor)
>  static int vgxy61_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
> +	struct v4l2_subdev_state *sd_state;
>  	int ret = 0;
>  
> -	mutex_lock(&sensor->lock);
> +	sd_state = v4l2_subdev_lock_and_get_active_state(&sensor->sd);
>  
>  	ret = enable ? vgxy61_stream_enable(sensor) :
>  	      vgxy61_stream_disable(sensor);
>  	if (!ret)
>  		sensor->streaming = enable;
>  
> -	mutex_unlock(&sensor->lock);
> +	v4l2_subdev_unlock_state(sd_state);
>  
>  	return ret;
>  }
> @@ -1187,51 +1165,39 @@ static int vgxy61_set_fmt(struct v4l2_subdev *sd,
>  {
>  	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>  	const struct vgxy61_mode_info *new_mode;
> -	struct v4l2_mbus_framefmt *fmt;
>  	int ret;
>  
> -	mutex_lock(&sensor->lock);
> -
> -	if (sensor->streaming) {
> -		ret = -EBUSY;
> -		goto out;
> -	}
> +	if (sensor->streaming)
> +		return -EBUSY;
>  
>  	ret = vgxy61_try_fmt_internal(sd, &format->format, &new_mode);
>  	if (ret)
> -		goto out;
> -
> -	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		fmt = v4l2_subdev_state_get_format(sd_state, 0);
> -		*fmt = format->format;
> -	} else if (sensor->current_mode != new_mode ||
> -		   sensor->fmt.code != format->format.code) {
> -		fmt = &sensor->fmt;
> -		*fmt = format->format;
> -
> -		sensor->current_mode = new_mode;
> -
> -		/* Reset vblank and framelength to default */
> -		ret = vgxy61_update_vblank(sensor,
> -					   VGXY61_FRAME_LENGTH_DEF -
> -					   new_mode->crop.height,
> -					   sensor->hdr);
> -
> -		/* Update controls to reflect new mode */
> -		__v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate_ctrl,
> -					 get_pixel_rate(sensor));
> -		__v4l2_ctrl_modify_range(sensor->vblank_ctrl,
> -					 sensor->vblank_min,
> -					 0xffff - new_mode->crop.height,
> -					 1, sensor->vblank);
> -		__v4l2_ctrl_s_ctrl(sensor->vblank_ctrl, sensor->vblank);
> -		__v4l2_ctrl_modify_range(sensor->expo_ctrl, sensor->expo_min,
> -					 sensor->expo_max, 1,
> -					 sensor->expo_long);
> -	}
> +		return ret;
> +
> +	*v4l2_subdev_state_get_format(sd_state, format->pad) = format->format;
>  
> -out:
> -	mutex_unlock(&sensor->lock);
> +	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> +		return 0;
> +
> +	sensor->current_mode = new_mode;
> +
> +	/* Reset vblank and framelength to default */
> +	ret = vgxy61_update_vblank(sensor,
> +				   VGXY61_FRAME_LENGTH_DEF -
> +				   new_mode->crop.height,
> +				   sensor->hdr);
> +
> +	/* Update controls to reflect new mode */
> +	__v4l2_ctrl_s_ctrl_int64(sensor->pixel_rate_ctrl,
> +				 get_pixel_rate(sensor));
> +	__v4l2_ctrl_modify_range(sensor->vblank_ctrl,
> +				 sensor->vblank_min,
> +				 0xffff - new_mode->crop.height,
> +				 1, sensor->vblank);
> +	__v4l2_ctrl_s_ctrl(sensor->vblank_ctrl, sensor->vblank);
> +	__v4l2_ctrl_modify_range(sensor->expo_ctrl, sensor->expo_min,
> +				 sensor->expo_max, 1,
> +				 sensor->expo_long);
>  
>  	return ret;
>  }
> @@ -1321,8 +1287,6 @@ static int vgxy61_init_controls(struct vgxy61_dev *sensor)
>  	int ret;
>  
>  	v4l2_ctrl_handler_init(hdl, 16);
> -	/* We can use our own mutex for the ctrl lock */
> -	hdl->lock = &sensor->lock;
>  	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN, 0, 0x1c, 1,
>  			  sensor->analog_gain);
>  	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DIGITAL_GAIN, 0, 0xfff, 1,
> @@ -1398,7 +1362,7 @@ static const struct v4l2_subdev_video_ops vgxy61_video_ops = {
>  
>  static const struct v4l2_subdev_pad_ops vgxy61_pad_ops = {
>  	.enum_mbus_code = vgxy61_enum_mbus_code,
> -	.get_fmt = vgxy61_get_fmt,
> +	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = vgxy61_set_fmt,
>  	.get_selection = vgxy61_get_selection,
>  	.enum_frame_size = vgxy61_enum_frame_size,
> @@ -1801,7 +1765,7 @@ static int vgxy61_probe(struct i2c_client *client)
>  	vgxy61_fill_framefmt(sensor, sensor->current_mode, &sensor->fmt,
>  			     VGXY61_MEDIA_BUS_FMT_DEF);
>  
> -	mutex_init(&sensor->lock);
> +	sensor->sd.state_lock = sensor->ctrl_handler.lock;
>  
>  	ret = vgxy61_update_hdr(sensor, sensor->hdr);
>  	if (ret)
> @@ -1820,6 +1784,10 @@ static int vgxy61_probe(struct i2c_client *client)
>  		goto error_handler_free;
>  	}
>  
> +	ret = v4l2_subdev_init_finalize(&sensor->sd);
> +	if (ret)
> +		goto error_media_entity_cleanup;
> +
>  	/* Enable runtime PM and turn off the device */
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
> @@ -1841,11 +1809,12 @@ static int vgxy61_probe(struct i2c_client *client)
>  error_pm_runtime:
>  	pm_runtime_disable(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
> +	v4l2_subdev_cleanup(&sensor->sd);
> +error_media_entity_cleanup:
>  	media_entity_cleanup(&sensor->sd.entity);
>  error_handler_free:
>  	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
>  error_power_off:
> -	mutex_destroy(&sensor->lock);
>  	vgxy61_power_off(dev);
>  
>  	return ret;
> @@ -1857,7 +1826,7 @@ static void vgxy61_remove(struct i2c_client *client)
>  	struct vgxy61_dev *sensor = to_vgxy61_dev(sd);
>  
>  	v4l2_async_unregister_subdev(&sensor->sd);
> -	mutex_destroy(&sensor->lock);
> +	v4l2_subdev_cleanup(&sensor->sd);
>  	media_entity_cleanup(&sensor->sd.entity);
>  
>  	pm_runtime_disable(&client->dev);

-- 
Regards,

Benjamin

