Return-Path: <linux-media+bounces-7153-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CF987D0FB
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 17:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 163B71F23BA3
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D6018035;
	Fri, 15 Mar 2024 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VMAKaWDl"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3953C3FE47
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710519204; cv=none; b=ilzLHA8fx+hmVMCAocAdwHZrIn+EBcuyTWMRstDq4fLBGDPwLz81OsGxGT7eVrSKKGAB4rlMLxvcf60w4oE7r9jxRGrTdGiHeOOWAeiD4X9qbOEK3DgM0ReeeGtoquPAJC4UT3JjPYXdNPee8zlBj6gCUThY2oUcMOs11d5SN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710519204; c=relaxed/simple;
	bh=FnF47sU4p601pHCfC45Ul/5wM/3UwdetWCHngpDyGRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9W7f0CF6Y1/dNOqgSPEU8fqDvZOF+BT1yOOlSKtPpBYiycbH2m/8QiOkkwFJbskY5hP/qkDunZuQ3BDYabyU/UfWofNpCR++qandSdA4LgvlD1OnhWtQVMLbxzVyQAU+tr9WbJViVSoLZfXZvThNI0SfVoNYa607qhx2VIlVrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VMAKaWDl; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710519198;
	bh=FnF47sU4p601pHCfC45Ul/5wM/3UwdetWCHngpDyGRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VMAKaWDlp+yYHm3xTcr1hsN0wfTzot9Jmyi1b7rGyWY32IeLyIEXC2I6mrop/i4uN
	 IHtjlL0ecgsHEHSHdcDvTF71wGg5YqMhK4uBXVWgMtr6HKdt3PuRrw0sODWZUV0DVa
	 o8TgkzkqgSRKJbb273YI9mFJqS4Eva6gj1WZkmU92Yld1M6wyidlPxJ9sC3nMLl8jD
	 bk56Tt5uvDMNN5bwtAmk8IJin84CxC8/lVxm011E5kjx6AqhrLC+i3NCR3K9NLdD0M
	 gQLU1mynL7X46Z8WDNhVevj/LdtIDmfgabGoUYZwWSLs9UKOmhcMp/LJg7+sXiJ790
	 AnmPYpmx7pbLw==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DCCDB3782110;
	Fri, 15 Mar 2024 16:13:17 +0000 (UTC)
Message-ID: <c40a7bd6-52e6-464f-96f7-dc44fb4b726e@collabora.com>
Date: Fri, 15 Mar 2024 17:13:16 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 33/38] media: ov2740: Switch to
 {enable,disable}_streams
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-34-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-34-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:25, Sakari Ailus wrote:
> Switch from s_stream to enable_streams and disable_streams callbacks.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/i2c/ov2740.c | 72 +++++++++++++++++---------------------
>   1 file changed, 32 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 552935ccb4a9..44c6724a102c 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -919,16 +919,23 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
>   	return ret;
>   }
>   
> -static int ov2740_start_streaming(struct ov2740 *ov2740)
> +static int ov2740_enable_streams(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *state, u32 pad,
> +				 u64 streams_mask)
>   {
> -	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
> +	struct ov2740 *ov2740 = to_ov2740(sd);
>   	const struct ov2740_reg_list *reg_list;
>   	int link_freq_index;
>   	int ret;
>   
> +	ret = pm_runtime_resume_and_get(&client->dev);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret = ov2740_identify_module(ov2740);
>   	if (ret)
> -		return ret;
> +		goto out_pm_put;
>   
>   	if (ov2740->nvm)
>   		ov2740_load_otp_data(ov2740->nvm);
> @@ -937,7 +944,7 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
>   	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
>   	if (ret) {
>   		dev_err(&client->dev, "failed to reset\n");
> -		return ret;
> +		goto out_pm_put;
>   	}
>   
>   	usleep_range(10000, 15000);
> @@ -947,64 +954,47 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
>   	ret = ov2740_write_reg_list(ov2740, reg_list);
>   	if (ret) {
>   		dev_err(&client->dev, "failed to set plls\n");
> -		return ret;
> +		goto out_pm_put;
>   	}
>   
>   	reg_list = &ov2740->cur_mode->reg_list;
>   	ret = ov2740_write_reg_list(ov2740, reg_list);
>   	if (ret) {
>   		dev_err(&client->dev, "failed to set mode\n");
> -		return ret;
> +		goto out_pm_put;
>   	}
>   
>   	ret = __v4l2_ctrl_handler_setup(ov2740->sd.ctrl_handler);
>   	if (ret)
> -		return ret;
> +		goto out_pm_put;
>   
>   	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>   			       OV2740_MODE_STREAMING);
> -	if (ret)
> +	if (ret) {
>   		dev_err(&client->dev, "failed to start streaming\n");
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
>   }
>   
> -static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
> +static int ov2740_disable_streams(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_state *state, u32 pad,
> +				  u64 streams_mask)
>   {
> -	struct ov2740 *ov2740 = to_ov2740(sd);
>   	struct i2c_client *client = v4l2_get_subdevdata(sd);
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
>   	return ret;
>   }
> @@ -1089,7 +1079,7 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
>   }
>   
>   static const struct v4l2_subdev_video_ops ov2740_video_ops = {
> -	.s_stream = ov2740_set_stream,
> +	.s_stream = v4l2_subdev_s_stream_helper,
>   };
>   
>   static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
> @@ -1097,6 +1087,8 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
>   	.set_fmt = ov2740_set_format,
>   	.enum_mbus_code = ov2740_enum_mbus_code,
>   	.enum_frame_size = ov2740_enum_frame_size,
> +	.enable_streams = ov2740_enable_streams,
> +	.disable_streams = ov2740_disable_streams,
>   };
>   
>   static const struct v4l2_subdev_ops ov2740_subdev_ops = {

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

