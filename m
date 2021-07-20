Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 853CB3D0138
	for <lists+linux-media@lfdr.de>; Tue, 20 Jul 2021 20:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhGTRX2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Jul 2021 13:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhGTRWq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Jul 2021 13:22:46 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5044DC061574;
        Tue, 20 Jul 2021 11:03:23 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id o30-20020a05600c511eb029022e0571d1a0so54403wms.5;
        Tue, 20 Jul 2021 11:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=gWH1mqA4+vapOJIXzh/ykRjP5f+XZ2ZAp8SGuGSrQSI=;
        b=fVfUKBzrPupAmTZp1bqSebRkyIgFdKXx9/pqIavRXBzhAn0V5x0o60tiKSvXoozN90
         mIAYHPwb9Q9IfKUH/hJj87newNyhE7k5Xp3q+LIg1IpN+he1gaZJ8fLWQcFBRdKtWVR4
         yyPzodXkeISl3ZE1KrbhPisNXHTOtaiBkRuUpjdmMajXlwR/U20GYkg1a28q6JmFu4WM
         5uO0dAF0c8Qv5fwGSzC0ouWb/N4HaYGXjyyp9HvfxNAeM7pCTVnURWy1xBDDi7vEbgTC
         GoG4rL79j6Z9PcJvqUiHNPIpvVOh08rzub/xzFnogc9BPtNkZR1APlVlgVoIn+yXtcud
         AdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gWH1mqA4+vapOJIXzh/ykRjP5f+XZ2ZAp8SGuGSrQSI=;
        b=s/k4GS7LWgAb0qi4itIaDH+YwrBXIu5RdPpO2Wv1Utc79pZWfZ1GFRjmsdh9ficSWQ
         g/mn+/Px1M7mDVHnl9Y15Fb1GHJPapBgZCSTH36KOVenvb7QtdU+iHcll19bmcuBDFMo
         Cz7PGbhGpk1LBgYamo3doDE4tz4y30v8mGd/l4AorUncfOuXXwy4XgQCqH8CqwA8u7Rj
         JtJhoOY+RQhQsH1Frgf38O4alRhIjfki/6rk62GhzX9hUNjxDN93T4V4Cutd33vy+M+w
         dUA4UUwuYejHN1DYGnVJQAkyqN7/kBOLwDaml/lJs+4eVR4kWPUiXhcrnxG/GyBC3D8/
         XzRg==
X-Gm-Message-State: AOAM532hcVEk6EFtjxS9HsaTWr18ji3EPpOaB0FyJIHWpL8hpjvC2HXf
        aj2eJ7YuqHh/MIt2ud2rkQEXUW0ikto=
X-Google-Smtp-Source: ABdhPJyn538Zosr+FfzjT/kpmsbXqWyORu74lS4tsG67xejxgZsAjrudUjsp+rUcHYDJqQOdWK3Nbg==
X-Received: by 2002:a05:600c:a04:: with SMTP id z4mr32311002wmp.103.1626804201842;
        Tue, 20 Jul 2021 11:03:21 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:2b66:b2d1:7649:7bbf? ([2a02:908:1252:fb60:2b66:b2d1:7649:7bbf])
        by smtp.gmail.com with ESMTPSA id v11sm23924357wrs.4.2021.07.20.11.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 11:03:21 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH] drm/msm: Add fence->wait() op
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
        Sean Paul <sean@poorly.run>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210720150716.1213775-1-robdclark@gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <60ffb6f3-e932-d9af-3b90-81adf0c15250@gmail.com>
Date:   Tue, 20 Jul 2021 20:03:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720150716.1213775-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Am 20.07.21 um 17:07 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Somehow we had neither ->wait() nor dma_fence_signal() calls, and no
> one noticed.  Oops.


I'm not sure if that is a good idea.

The dma_fence->wait() callback is pretty much deprecated and should not 
be used any more.

What exactly do you need that for?

Regards,
Christian.

>
> Note that this removes the !timeout case, which has not been used in
> a long time.


>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_fence.c | 59 +++++++++++++++++++--------------
>   1 file changed, 34 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index cd59a5918038..8ee96b90ded6 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -38,11 +38,10 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
>   	return (int32_t)(fctx->completed_fence - fence) >= 0;
>   }
>   
> -/* legacy path for WAIT_FENCE ioctl: */
> -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> -		ktime_t *timeout, bool interruptible)
> +static signed long wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> +		signed long remaining_jiffies, bool interruptible)
>   {
> -	int ret;
> +	signed long ret;
>   
>   	if (fence > fctx->last_fence) {
>   		DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
> @@ -50,33 +49,34 @@ int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
>   		return -EINVAL;
>   	}
>   
> -	if (!timeout) {
> -		/* no-wait: */
> -		ret = fence_completed(fctx, fence) ? 0 : -EBUSY;
> +	if (interruptible) {
> +		ret = wait_event_interruptible_timeout(fctx->event,
> +			fence_completed(fctx, fence),
> +			remaining_jiffies);
>   	} else {
> -		unsigned long remaining_jiffies = timeout_to_jiffies(timeout);
> -
> -		if (interruptible)
> -			ret = wait_event_interruptible_timeout(fctx->event,
> -				fence_completed(fctx, fence),
> -				remaining_jiffies);
> -		else
> -			ret = wait_event_timeout(fctx->event,
> -				fence_completed(fctx, fence),
> -				remaining_jiffies);
> -
> -		if (ret == 0) {
> -			DBG("timeout waiting for fence: %u (completed: %u)",
> -					fence, fctx->completed_fence);
> -			ret = -ETIMEDOUT;
> -		} else if (ret != -ERESTARTSYS) {
> -			ret = 0;
> -		}
> +		ret = wait_event_timeout(fctx->event,
> +			fence_completed(fctx, fence),
> +			remaining_jiffies);
> +	}
> +
> +	if (ret == 0) {
> +		DBG("timeout waiting for fence: %u (completed: %u)",
> +				fence, fctx->completed_fence);
> +		ret = -ETIMEDOUT;
> +	} else if (ret != -ERESTARTSYS) {
> +		ret = 0;
>   	}
>   
>   	return ret;
>   }
>   
> +/* legacy path for WAIT_FENCE ioctl: */
> +int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> +		ktime_t *timeout, bool interruptible)
> +{
> +	return wait_fence(fctx, fence, timeout_to_jiffies(timeout), interruptible);
> +}
> +
>   /* called from workqueue */
>   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>   {
> @@ -114,10 +114,19 @@ static bool msm_fence_signaled(struct dma_fence *fence)
>   	return fence_completed(f->fctx, f->base.seqno);
>   }
>   
> +static signed long msm_fence_wait(struct dma_fence *fence, bool intr,
> +		signed long timeout)
> +{
> +	struct msm_fence *f = to_msm_fence(fence);
> +
> +	return wait_fence(f->fctx, fence->seqno, timeout, intr);
> +}
> +
>   static const struct dma_fence_ops msm_fence_ops = {
>   	.get_driver_name = msm_fence_get_driver_name,
>   	.get_timeline_name = msm_fence_get_timeline_name,
>   	.signaled = msm_fence_signaled,
> +	.wait = msm_fence_wait,
>   };
>   
>   struct dma_fence *

