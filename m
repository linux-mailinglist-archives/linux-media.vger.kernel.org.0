Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1F2661A8E
	for <lists+linux-media@lfdr.de>; Sun,  8 Jan 2023 23:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbjAHWp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Jan 2023 17:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjAHWpJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Jan 2023 17:45:09 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5210B10068
        for <linux-media@vger.kernel.org>; Sun,  8 Jan 2023 14:45:07 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id v25so10344728lfe.12
        for <linux-media@vger.kernel.org>; Sun, 08 Jan 2023 14:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNjDFq7jF6Xutyrz7TZXPQsfgSYhgyOTeZIcCQictVc=;
        b=e8zj826Zagy7Wr+2jC7vyR1XimbGVyk4hS7mMWuWs5jS5BMhe4INZZPZZ3dqZGd4zW
         vVuWxQoKEM2XVg1AJ1pcgxxZxdOmVRvTv6n/91dmCmyvQWOCv4w0hTImVuK4BUK86s0O
         KIsslORjq5lajLYSh379zvq7zEUKgf0Wx2NeMGPciJ/W/W3IS6b0ICpuHi1WlLXLMQRH
         P2ZwoeLK3bIf0AE1GtJdSaO4K/qofXQUK/AihEXhvsbAow2S5HtG3N558XOuEXrTX2h+
         bFCWrkB2ARluw63iPTDc17QjyIKCcm7vZy1eGqwWusrs7OooTfKMoVqVarn+L5fLGiwo
         bR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNjDFq7jF6Xutyrz7TZXPQsfgSYhgyOTeZIcCQictVc=;
        b=5Gb2HQcErK4+ACbk5nUNIwSGS/XNya9hB4cWlHekhKhAJ6Yx7AujqXkZ6VRAnZuKLd
         eSmH3RnZe6NPZ9GrKkWZHRMFgX3kwWeK73PYHSwkehP55alwPRy4YMzE/OSq0T4YH+Lx
         EWyNEMyjdZXVIYnZW6ooRc3ZfyglBLYS8KXuylXDgX2jM7FEETC4YjZo93A7OdHMFjHL
         URYLg6FeNQ+uJnQrRLo/ZDXkmbnqO+xu5lGZ1hJ06SPY3AygE9I0VXK4C5Ryg9FJkmL+
         k9I8XIzTBpuSYWCSHuxjWWRWtTNPaISYk+3W4iAiEc3R9WI+WYQqWXdztPD4nw1PL2q1
         KyRg==
X-Gm-Message-State: AFqh2kp6eyuNsn8jdZKuQHgGv5qZqrLaPjMikuRCJuVghGusEMbiO1CW
        kB69Wikz3blctg9ItT1T9oXq3Q==
X-Google-Smtp-Source: AMrXdXvwzFkEAxmdB2Z6hlU44qt3jw6D5B4obR6CvQwIXBWaGQgM0nax26AbcjwKQIqDWuaHbP3Z5g==
X-Received: by 2002:a05:6512:304a:b0:4b5:5098:e6f7 with SMTP id b10-20020a056512304a00b004b55098e6f7mr19827844lfb.68.1673217905625;
        Sun, 08 Jan 2023 14:45:05 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id n26-20020a05651203fa00b0049464d89e40sm1257366lfq.72.2023.01.08.14.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 14:45:05 -0800 (PST)
Message-ID: <9b53d5f0-e1b1-1ecd-b9b9-efa20b11c916@linaro.org>
Date:   Mon, 9 Jan 2023 00:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RESEND] drm/msm: Add missing check and destroy for
 alloc_ordered_workqueue
Content-Language: en-GB
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run, airlied@gmail.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, freedreno@lists.freedesktop.org
References: <20230106084712.29675-1-jiasheng@iscas.ac.cn>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230106084712.29675-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/01/2023 10:47, Jiasheng Jiang wrote:
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer.
> Moreover, use the destroy_workqueue in the later fails in order to avoid
> memory leak.
> 
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 8b0b0ac74a6f..b82d938226ad 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -418,6 +418,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	priv->dev = ddev;
>   
>   	priv->wq = alloc_ordered_workqueue("msm", 0);
> +	if (!priv->wq)
> +		return -ENOMEM;
>   
>   	INIT_LIST_HEAD(&priv->objects);
>   	mutex_init(&priv->obj_lock);
> @@ -440,12 +442,12 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   	ret = msm_init_vram(ddev);
>   	if (ret)
> -		return ret;
> +		goto err_destroy_workqueue;
>   
>   	/* Bind all our sub-components: */
>   	ret = component_bind_all(dev, ddev);
>   	if (ret)
> -		return ret;
> +		goto err_destroy_workqueue;
>   
>   	dma_set_max_seg_size(dev, UINT_MAX);
>   
> @@ -540,6 +542,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   
>   err_msm_uninit:
>   	msm_drm_uninit(dev);

return ret is missing here. Your code will result in double free.

However the intent was to unroll each and every action of msm_drm_init() 
in msm_drm_uninit(). So in all your cases please goto err_msm_unit.

> +err_destroy_workqueue:
> +	destroy_workqueue(priv->wq);
>   	return ret;
>   }
>   

-- 
With best wishes
Dmitry

