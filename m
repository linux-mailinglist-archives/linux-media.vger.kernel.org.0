Return-Path: <linux-media+bounces-3429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C00828D84
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 20:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 647151C248D2
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 19:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2627A3D3A3;
	Tue,  9 Jan 2024 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RYfo8jna"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A8C3D39A
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 19:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-205dc844e5eso665664fac.0
        for <linux-media@vger.kernel.org>; Tue, 09 Jan 2024 11:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704829061; x=1705433861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WjzbK7YpXixqMh1oQ4ZtpKKWIDBLksrpSftF6B5luow=;
        b=RYfo8jna9m03dCZYNQK+dXuUDzRa8tvWXJyj9BMkAJrWq6v/ltxsLs37ul2AR/Sgck
         mLlwqrbjcgtGRZoomtk1IGqXp/IkLt/tNKmlm7tEpitH3mnMxnFZ0pIM8xBD9ku7GvlW
         RCFi5JFZbvbuFjtw99kYner1DbYIlqiJxA4JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704829061; x=1705433861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WjzbK7YpXixqMh1oQ4ZtpKKWIDBLksrpSftF6B5luow=;
        b=Pqx63XTJeCOmOk0ZFOc1B47s3l+aeVerUdrBv4HnF9RfoSAaWH/GNKP4DYpGebmcvu
         HD2FxpMFippxOwEh1f4+gmVZVCylTliUKhjZ2RCMNLNDlsy6p1cHdlT463lKM45NEaYl
         aFVFtWzbQGHa0t/uufAbCPOlVaIOslGtHjCUId2uHqGxTGZH0emAMVnSnEjEwLbq4wkj
         FIjkm5iFA0Vlefd/yKDqPm6TkD/HUe6b7gHvXjDE4ifwCBw3crmhjU8TL2kbee7nhflM
         tsxBVsWWqiFO/B2Vz/84AVILCyT8REQHOP1MtEW3bMGlb/V09gpn8B4wzGzAHSyq8/Ef
         00nA==
X-Gm-Message-State: AOJu0Yy3yS0DC03r3ZFnpjE2eK4B5glLpGJLnnBKWSNArKsAIif3BCnY
	gFuexy7f2W3CsC3UfMeiq2neI5tm32VaMQ==
X-Google-Smtp-Source: AGHT+IFx2uwVxRWYAqR1GbS7z/aMgssYbmV1Dj8TI8Vhm7oW+IIJxCwuCmNGxpTmpzMoq51zjbaqyg==
X-Received: by 2002:a05:6870:65aa:b0:206:5411:f97b with SMTP id fp42-20020a05687065aa00b002065411f97bmr3360396oab.4.1704829060833;
        Tue, 09 Jan 2024 11:37:40 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id hi8-20020a056870c98800b002061a7f5733sm614200oab.11.2024.01.09.11.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 11:37:40 -0800 (PST)
Message-ID: <8de79d85-d70d-44ec-9700-5f5356d9c393@linuxfoundation.org>
Date: Tue, 9 Jan 2024 12:37:39 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: vimc: Don't explicitly set bus_info
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Shuah Khan <skhan@linuxfoundation.org>
References: <20231129141545.87461-1-sakari.ailus@linux.intel.com>
 <20231129141545.87461-3-sakari.ailus@linux.intel.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231129141545.87461-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/23 07:15, Sakari Ailus wrote:
> The platform device name is already set by V4L2 and MC frameworks for
> media device bus_info and V4L2 querycap bus_info fields. Don't do it in
> the driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-capture.c | 2 --
>   drivers/media/test-drivers/vimc/vimc-core.c    | 2 --
>   2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
> index aa944270e716..1e7cc7c980f9 100644
> --- a/drivers/media/test-drivers/vimc/vimc-capture.c
> +++ b/drivers/media/test-drivers/vimc/vimc-capture.c
> @@ -57,8 +57,6 @@ static int vimc_capture_querycap(struct file *file, void *priv,
>   {
>   	strscpy(cap->driver, VIMC_PDEV_NAME, sizeof(cap->driver));
>   	strscpy(cap->card, KBUILD_MODNAME, sizeof(cap->card));
> -	snprintf(cap->bus_info, sizeof(cap->bus_info),
> -		 "platform:%s", VIMC_PDEV_NAME);
>   
>   	return 0;
>   }
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> index af127476e920..2a924abd0ebc 100644
> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> @@ -366,8 +366,6 @@ static int vimc_probe(struct platform_device *pdev)
>   	/* Initialize media device */
>   	strscpy(vimc->mdev.model, VIMC_MDEV_MODEL_NAME,
>   		sizeof(vimc->mdev.model));
> -	snprintf(vimc->mdev.bus_info, sizeof(vimc->mdev.bus_info),
> -		 "platform:%s", VIMC_PDEV_NAME);
>   	vimc->mdev.dev = &pdev->dev;
>   	media_device_init(&vimc->mdev);
>   

Sorry this seems to have been lost in inbox.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


