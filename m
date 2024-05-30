Return-Path: <linux-media+bounces-12279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C28D5258
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 990F71F23FD1
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C9F155380;
	Thu, 30 May 2024 19:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W0MqmFJ+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB160155354
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 19:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717097480; cv=none; b=r1p9duQXkjOneoR1uwo8phhl1PNcDZh2cBofy6VPEYQJc5XqNRv4IaR8pC/NBzUcRjLHhYoyt3hKwZ8iU5xaGk4WcgLRP6xBZ0O3u2g/omRt52351L8weylM27HrPZofLamCrr+d9LMRq3Hgc3nvgTEKXVuj3yCnS6/rnObCFvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717097480; c=relaxed/simple;
	bh=pt8ifNdQEogR/mm9//yEr4tK4Aera7hXk7wPOubsTlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOIFNcSI7rHDDVzG5QFTclTcRZGiH1xgXp1VwCk3JM0al6dyjTKF7UqhjKgg3jd57V3jMwPZwfjpNQnqBCofNVGS7+SpcKti5TvIUSfn87pa0Jf1afvrWI5RKX0b9eEq9ZqO3mdShn0FndxOpk5rmPpnfaEGeE/7LVVSyLdBMqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W0MqmFJ+; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7e8e5875866so6625439f.1
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 12:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717097478; x=1717702278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQ50YN+NudY/PUQxNd5QkAp42gXDHGWmiJvu27RoKvM=;
        b=W0MqmFJ+5hUzDT1sh4XcYK2Hg1U6wospOt0exFnXyyKM03G4KouGtsJgdI5qMFDPJC
         pahVc2jk7zWQorXdkXW/8tMDdvVbST0tA998qaYf1b8QPooxqU8TwRarIe20VQ6Y9kAF
         Uls76r2vXbHiOJ6ZCljlqNCGew67jtEW7A8nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097478; x=1717702278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ50YN+NudY/PUQxNd5QkAp42gXDHGWmiJvu27RoKvM=;
        b=LcjwDa3N7JZu6POxACZywwd1f77P+MbB2B6VfYljUtgbM/e39+l0QAth0UWChlCsO9
         TsctNe1YRg1/jqf51MFwRZiz9QQhiz9jN3p3aClzyHT37IGDdu2kl+UHxQJNo16FKUQr
         FJhDCO12qAXhEF86uvD8e2c841bYVaqQOT4i7IZjNZiREcL/ybzUzfBCS2irIvA6EPYE
         XZtbvH8cP0Y0e8JOLUL7zieJz1bV+uazmyQ8+ReYrf5G1RuoXXiJhDqMFFsSTqitLFfK
         dp6dIUIEzFVTIWYBNOV6b4FRDXX6SmLgund2DTgBJN9bTvFDrDexAmoTm93dyoqw9JQF
         Ztbg==
X-Forwarded-Encrypted: i=1; AJvYcCX55JrrbEWzZGqYsRKMY1/fSLBtolPi/wjwKBgtKMeKURu/OVhJ/MZwdBIpdjzcE6ELi4yxgBCO9hxtra6s/1p9baQEHibnOugXnmc=
X-Gm-Message-State: AOJu0YxjqGY3tkPoSyLyYj6P10vcyhLFh1+C2S658l1epswE7x6PwZMI
	yhZdH+HVUoP44MHELcMT/Q/Q3oOooyAwrlS1xRhYL+WkXe9+wwQFu8NkAv6eh+A=
X-Google-Smtp-Source: AGHT+IFYnmt1A4eG9Befv/z5h30Q6m9oUyQjwCzPYVtOTNX/3eYFvJBdr4TlkeebEeQ3xRu+UgfqRg==
X-Received: by 2002:a5d:948d:0:b0:7de:dc52:18b6 with SMTP id ca18e2360f4ac-7eaf5d8e437mr283528239f.2.1717097477724;
        Thu, 30 May 2024 12:31:17 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b48cd011b3sm74003173.170.2024.05.30.12.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:31:17 -0700 (PDT)
Message-ID: <aecc6af5-caca-4e2d-a6d9-2483aea03ca6@linuxfoundation.org>
Date: Thu, 30 May 2024 13:31:16 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] media: vimc: Centralize subdev internal_ops
 initialization
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-6-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240424235741.17093-6-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 17:57, Laurent Pinchart wrote:
> Initialize the subdev internal_ops field in the vimc_ent_sd_register()
> function. This handles the internal ops the same way as the subdev ops,
> and prepares for moving to the V4L2 subdev active state API.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-common.c  | 2 ++
>   drivers/media/test-drivers/vimc/vimc-common.h  | 2 ++
>   drivers/media/test-drivers/vimc/vimc-debayer.c | 5 ++---
>   drivers/media/test-drivers/vimc/vimc-lens.c    | 2 +-
>   drivers/media/test-drivers/vimc/vimc-scaler.c  | 5 ++---
>   drivers/media/test-drivers/vimc/vimc-sensor.c  | 4 +---
>   6 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.c b/drivers/media/test-drivers/vimc/vimc-common.c
> index 2e72974e35b4..3da2271215c6 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.c
> +++ b/drivers/media/test-drivers/vimc/vimc-common.c
> @@ -358,6 +358,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>   			 u32 function,
>   			 u16 num_pads,
>   			 struct media_pad *pads,
> +			 const struct v4l2_subdev_internal_ops *int_ops,
>   			 const struct v4l2_subdev_ops *sd_ops)
>   {
>   	int ret;
> @@ -367,6 +368,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>   
>   	/* Initialize the subdev */
>   	v4l2_subdev_init(sd, sd_ops);
> +	sd->internal_ops = int_ops;
>   	sd->entity.function = function;
>   	sd->entity.ops = &vimc_ent_sd_mops;
>   	sd->owner = THIS_MODULE;
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> index 6a76717e0384..7a45a2117748 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -215,6 +215,7 @@ const struct vimc_pix_map *vimc_pix_map_by_pixelformat(u32 pixelformat);
>    * @num_pads:	number of pads to initialize
>    * @pads:	the array of pads of the entity, the caller should set the
>    *		flags of the pads
> + * @int_ops:	pointer to &struct v4l2_subdev_internal_ops.
>    * @sd_ops:	pointer to &struct v4l2_subdev_ops.
>    *
>    * Helper function initialize and register the struct vimc_ent_device and struct
> @@ -227,6 +228,7 @@ int vimc_ent_sd_register(struct vimc_ent_device *ved,
>   			 u32 function,
>   			 u16 num_pads,
>   			 struct media_pad *pads,
> +			 const struct v4l2_subdev_internal_ops *int_ops,
>   			 const struct v4l2_subdev_ops *sd_ops);
>   
>   /**
> diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
> index e2f12a7fb58f..d4ca57b3672d 100644
> --- a/drivers/media/test-drivers/vimc/vimc-debayer.c
> +++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
> @@ -591,12 +591,11 @@ static struct vimc_ent_device *vimc_debayer_add(struct vimc_device *vimc,
>   	ret = vimc_ent_sd_register(&vdebayer->ved, &vdebayer->sd, v4l2_dev,
>   				   vcfg_name,
>   				   MEDIA_ENT_F_PROC_VIDEO_PIXEL_ENC_CONV, 2,
> -				   vdebayer->pads, &vimc_debayer_ops);
> +				   vdebayer->pads, &vimc_debayer_internal_ops,
> +				   &vimc_debayer_ops);
>   	if (ret)
>   		goto err_free_hdl;
>   
> -	vdebayer->sd.internal_ops = &vimc_debayer_internal_ops;
> -
>   	vdebayer->ved.process_frame = vimc_debayer_process_frame;
>   	vdebayer->ved.dev = vimc->mdev.dev;
>   	vdebayer->mean_win_size = vimc_debayer_ctrl_mean_win_size.def;
> diff --git a/drivers/media/test-drivers/vimc/vimc-lens.c b/drivers/media/test-drivers/vimc/vimc-lens.c
> index e7d78fa8ccdb..42c58a3e3f1b 100644
> --- a/drivers/media/test-drivers/vimc/vimc-lens.c
> +++ b/drivers/media/test-drivers/vimc/vimc-lens.c
> @@ -72,7 +72,7 @@ static struct vimc_ent_device *vimc_lens_add(struct vimc_device *vimc,
>   
>   	ret = vimc_ent_sd_register(&vlens->ved, &vlens->sd, v4l2_dev,
>   				   vcfg_name, MEDIA_ENT_F_LENS, 0,
> -				   NULL, &vimc_lens_ops);
> +				   NULL, NULL, &vimc_lens_ops);
>   	if (ret)
>   		goto err_free_hdl;
>   
> diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
> index 013cd84f82be..4f9c44a663e1 100644
> --- a/drivers/media/test-drivers/vimc/vimc-scaler.c
> +++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
> @@ -421,14 +421,13 @@ static struct vimc_ent_device *vimc_scaler_add(struct vimc_device *vimc,
>   	ret = vimc_ent_sd_register(&vscaler->ved, &vscaler->sd, v4l2_dev,
>   				   vcfg_name,
>   				   MEDIA_ENT_F_PROC_VIDEO_SCALER, 2,
> -				   vscaler->pads, &vimc_scaler_ops);
> +				   vscaler->pads, &vimc_scaler_internal_ops,
> +				   &vimc_scaler_ops);
>   	if (ret) {
>   		kfree(vscaler);
>   		return ERR_PTR(ret);
>   	}
>   
> -	vscaler->sd.internal_ops = &vimc_scaler_internal_ops;
> -
>   	vscaler->ved.process_frame = vimc_scaler_process_frame;
>   	vscaler->ved.dev = vimc->mdev.dev;
>   
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> index 11df18332865..5c31d9435cdd 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -424,12 +424,10 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
>   	ret = vimc_ent_sd_register(&vsensor->ved, &vsensor->sd, v4l2_dev,
>   				   vcfg_name,
>   				   MEDIA_ENT_F_CAM_SENSOR, 1, &vsensor->pad,
> -				   &vimc_sensor_ops);
> +				   &vimc_sensor_internal_ops, &vimc_sensor_ops);
>   	if (ret)
>   		goto err_free_tpg;
>   
> -	vsensor->sd.internal_ops = &vimc_sensor_internal_ops;
> -
>   	vsensor->ved.process_frame = vimc_sensor_process_frame;
>   	vsensor->ved.dev = vimc->mdev.dev;
>   

Looks good to me.

thanks,
-- Shuah

