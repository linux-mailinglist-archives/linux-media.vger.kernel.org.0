Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76DB02F5FB4
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 12:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbhANLTW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 06:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727820AbhANLTT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 06:19:19 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B8FC061575
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:18:38 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id l9so1871555ejx.3
        for <linux-media@vger.kernel.org>; Thu, 14 Jan 2021 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HRmrH3JRSU4wFGyW7pKc7d0RBOCtUf376wdrcGqsw5Q=;
        b=i6nIRfVA2NBjtWPs1SW9iEr9IbDnnZsuCXTVPZ0c5L3gRkByZAS/Jk387XTuF4WDxV
         2u1QmOd/p8mGNqppyMw9TWikjsP6DP1fiTsZf2C4sBevlx5l6e3r+VQsz9HnWxev8I23
         QCE+23z0l24gdaRM0XX8JjqZEJZIJSTx9YoOVn5PP1nf6Bu7rrD4RgN6Na5Nr+38Cy1g
         n+cjcnrU2RryErMnuoKBtKpTNsYyY5IutzoXPjJ8AwGkDKZykH83+GOy1+uqDSj7SXfd
         MfF6xWzXAqcORraeHZbT8TG9XcKQ0ferBSAMk44jE2q1vPMh3R/Nf0fNYHai2CwnM6DG
         Qc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HRmrH3JRSU4wFGyW7pKc7d0RBOCtUf376wdrcGqsw5Q=;
        b=NC5qF3ZxsbMt7Si2ZMc3gjKLUmeIrhjUrW97JsAY84LLqpMMQThHByz7f34XH68e83
         VMOkNDH55BY+o5rwWH92QMFDc7Rf8Kn1XhZp3BZFcHnNdRyAnXiZEqmmVIg27UyGIq8G
         ND08nbQX4qOR2lEFPyldYuhjCVqn0BS80g6dN0cRWqJ49i58gps7qfa52uLSnaEis5wc
         dNg30tC0FrR1tA2QLgVLzA37G/8ZadN/8h25ME9BhCrco+21gVhdwG40c6ZdszM8kB4P
         l5Qtzk01fBpuNU94fYbxigeV5KsTk4EfBHycxs/Q0Z17OEpVyhmC+GBfDjoYdVDP4Cvl
         AeIQ==
X-Gm-Message-State: AOAM531ATpNiCUZhRr8tH/yYsYw/PoFmB19zO6s14XUvBT+riFfAaSAv
        lylS2AufwrEJZTbTL5R0tts=
X-Google-Smtp-Source: ABdhPJw2XL2zR8hgBFGNNblvodsZkYp27MkdkzvCVcfPBjUN3A0TWTfzh0C1ZzxzP8aFsjIz6ZDjgQ==
X-Received: by 2002:a17:906:490d:: with SMTP id b13mr4840080ejq.307.1610623117585;
        Thu, 14 Jan 2021 03:18:37 -0800 (PST)
Received: from kontron.lan (2001-1ae9-1e8-b200-9c26-b1f7-3f54-fb94.ip6.tmcz.cz. [2001:1ae9:1e8:b200:9c26:b1f7:3f54:fb94])
        by smtp.gmail.com with ESMTPSA id t9sm1851964ejc.51.2021.01.14.03.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 03:18:36 -0800 (PST)
Subject: Re: [PATCH v2 2/6] media: pxa_camera: Drop the v4l2-clk clock
 register
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com, Arnd Bergmann <arnd@arndb.de>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Daniel Mack <zonque@gmail.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>
References: <20210112194919.50176-1-ezequiel@collabora.com>
 <20210112194919.50176-3-ezequiel@collabora.com>
From:   Petr Cvek <petrcvekcz@gmail.com>
Message-ID: <1b34f160-fba4-c5b5-d4a1-9cdd6ef1cf42@gmail.com>
Date:   Thu, 14 Jan 2021 12:22:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112194919.50176-3-ezequiel@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: cs
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Acked-by: Petr Cvek <petrcvekcz@gmail.com>

Dne 12. 01. 21 v 20:49 Ezequiel Garcia napsal(a):
> Now that mach-based PXA platforms are registering proper
> fixed-rate clocks through the CCF, the v4l2-clk clock
> is no longer required.
> 
> Drop this clock, so the driver no longer depends on the
> legacy v4l2-clk API.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/media/platform/pxa_camera.c | 30 +----------------------------
>  1 file changed, 1 insertion(+), 29 deletions(-)
> 
> diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
> index b664ce7558a1..8cfa39108162 100644
> --- a/drivers/media/platform/pxa_camera.c
> +++ b/drivers/media/platform/pxa_camera.c
> @@ -31,7 +31,6 @@
>  #include <linux/dma/pxa-dma.h>
>  
>  #include <media/v4l2-async.h>
> -#include <media/v4l2-clk.h>
>  #include <media/v4l2-common.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -677,7 +676,6 @@ struct pxa_camera_dev {
>  	unsigned long		ciclk;
>  	unsigned long		mclk;
>  	u32			mclk_divisor;
> -	struct v4l2_clk		*mclk_clk;
>  	u16			width_flags;	/* max 10 bits */
>  
>  	struct list_head	capture;
> @@ -2030,9 +2028,6 @@ static const struct v4l2_ioctl_ops pxa_camera_ioctl_ops = {
>  	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
>  };
>  
> -static const struct v4l2_clk_ops pxa_camera_mclk_ops = {
> -};
> -
>  static const struct video_device pxa_camera_videodev_template = {
>  	.name = "pxa-camera",
>  	.minor = -1,
> @@ -2140,11 +2135,6 @@ static void pxa_camera_sensor_unbind(struct v4l2_async_notifier *notifier,
>  
>  	pxa_camera_destroy_formats(pcdev);
>  
> -	if (pcdev->mclk_clk) {
> -		v4l2_clk_unregister(pcdev->mclk_clk);
> -		pcdev->mclk_clk = NULL;
> -	}
> -
>  	video_unregister_device(&pcdev->vdev);
>  	pcdev->sensor = NULL;
>  
> @@ -2278,7 +2268,6 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  		.src_maxburst = 8,
>  		.direction = DMA_DEV_TO_MEM,
>  	};
> -	char clk_name[V4L2_CLK_NAME_SIZE];
>  	int irq;
>  	int err = 0, i;
>  
> @@ -2417,23 +2406,11 @@ static int pxa_camera_probe(struct platform_device *pdev)
>  	if (err)
>  		goto exit_notifier_cleanup;
>  
> -	v4l2_clk_name_i2c(clk_name, sizeof(clk_name),
> -			  pcdev->asd.match.i2c.adapter_id,
> -			  pcdev->asd.match.i2c.address);
> -
> -	pcdev->mclk_clk = v4l2_clk_register(&pxa_camera_mclk_ops, clk_name, NULL);
> -	if (IS_ERR(pcdev->mclk_clk)) {
> -		err = PTR_ERR(pcdev->mclk_clk);
> -		goto exit_notifier_cleanup;
> -	}
> -
>  	err = v4l2_async_notifier_register(&pcdev->v4l2_dev, &pcdev->notifier);
>  	if (err)
> -		goto exit_free_clk;
> +		goto exit_notifier_cleanup;
>  
>  	return 0;
> -exit_free_clk:
> -	v4l2_clk_unregister(pcdev->mclk_clk);
>  exit_notifier_cleanup:
>  	v4l2_async_notifier_cleanup(&pcdev->notifier);
>  exit_free_v4l2dev:
> @@ -2463,11 +2440,6 @@ static int pxa_camera_remove(struct platform_device *pdev)
>  	v4l2_async_notifier_unregister(&pcdev->notifier);
>  	v4l2_async_notifier_cleanup(&pcdev->notifier);
>  
> -	if (pcdev->mclk_clk) {
> -		v4l2_clk_unregister(pcdev->mclk_clk);
> -		pcdev->mclk_clk = NULL;
> -	}
> -
>  	v4l2_device_unregister(&pcdev->v4l2_dev);
>  
>  	dev_info(&pdev->dev, "PXA Camera driver unloaded\n");
> 
