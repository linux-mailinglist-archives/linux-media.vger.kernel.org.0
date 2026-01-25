Return-Path: <linux-media+bounces-51479-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M1ZMTULdmkNLAEAu9opvQ
	(envelope-from <linux-media+bounces-51479-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:23:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C880827
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 13:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1707E3009500
	for <lists+linux-media@lfdr.de>; Sun, 25 Jan 2026 12:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE7631A7FD;
	Sun, 25 Jan 2026 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANXpQ52X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077143191A9
	for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 12:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769343788; cv=none; b=BU1ObM8TuV/YoWrsIcF9gwTmKKgwcpLTxFKAIyZWaxrBw9EPkVcO+N0y64V0/UsUg30vTtdz12kVbMtvcVtgnjGwVAGbhC7iqt6bj9hBRejT0nu4w7B/zWyVFETXk2H1kFE1J0JPBnODlM1SAeakLkt6Xw8+byHhoTfwBqLTFJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769343788; c=relaxed/simple;
	bh=MjODaE3Lldnik6r+EEQtGnJOY4MTKCdK023v8j6gmIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vm5gYP2PSAxOLpAmWyJN+KkO5B5Ovt7o4ce2vx3RTaVTOyE9ne0U2b7d2T+PmkwlYhr9bMwebUNAITQT7MzR+Rj+XKOMwgysw+ZcvLhRB1MEzImGIKzayjYH0FCwIoqblOLHKm13Ib7I5dQETFrx/mTzoguTMjcaI0Wir1SvLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANXpQ52X; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso36233175e9.2
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 04:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769343785; x=1769948585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVKNG3fLvRMwGik/QcexO/mF/X2rpGl4bwfxbl4mRR0=;
        b=ANXpQ52X0iG+F5phJ5j3IL23rEtWDC2swd8237SdvF4EtGQieokhr0zSGqolaCTRWU
         8fKx9FSDPK97Ii4G43DMlKyKXvxa5sk5N//gqCPWccoe48ntr7tS2c72DRoXwDoxfrWY
         bFdc1n5PjzQ81PL57noeJr5YvWu52d9Ns4tcDkJ8Q3esbh+5Inv1JfevnQDoUtoF349f
         ZWfjsh4ZV2f7FTfJjgOylyXfg9/cchtUj0FVrwl5C8Th5/WpHaPJTDHZU8FPnJ4VVqrz
         RxUYpZ3ixUkpnwUzYkA/3lgorcT1WHhvoeGjnacq5/sCmrxkla3duPMS3EUglf8jGGxD
         uw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769343785; x=1769948585;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xVKNG3fLvRMwGik/QcexO/mF/X2rpGl4bwfxbl4mRR0=;
        b=AhH9XIXAYLZ3/hXFDjBZe0NY9Ox8Tr887GiFOUlpOWJvGLhp60cjzIj0mcf+epY7b0
         QqTC93VOP33SR8rJklcX4eNqaydTM5jxKb2WGo/WKXAMrY8+IPRr1f7iKWUtLBr2A9P0
         +nhEEMCtBX0OwS72s1cxhLc69MW4lNvUS1sclO39+sA6CuQ9d71WC4jTsrI0jkv7vPPY
         Il7I6NPONLWiDe/5MXoXoOPiw0Ytzkhvh9oW0HW16UDHhOZwzwR6lNrOXwjQP0aRza0y
         g+tjvZ84PnnL7u91g0YEbM7VuQv8gh+f4xYgfs280qyf10ENDRwNzvKrR7DKLmoLsMqR
         2I8g==
X-Forwarded-Encrypted: i=1; AJvYcCUzQBpBaasHv7zZM6eAaktTTnXryCcUrPYUxLEX5LQffwh7G7ddBJEb/2oyG8oCmVGpDweLevYZSQS5Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHazEhDXHDI9U4Ka2iniFIUIlfvXuCTKUyPT743aDrBT8LGEsP
	/yfBs264lLmivkdpYl3ygtwLuDr4lyRwbOh7Rh1sXs8rUfKpDtMfS5xkrzTuPb/olNI=
X-Gm-Gg: AZuq6aLm79/CLhgXg5xdYgcTP4ZD56WObyRHwlO16UV/YI1A1EQBcmGij7mavpanPb0
	/m0WV16/09qSPJJ9BwPR9wHDAz8xcvq5+1P80vb5TImz6Gwdw6VQxVNoyTy8Tg4LF53l8tHgL2W
	VAiAjgb/KifRbJkUHFwWHslYeRb48NEgw+bFRdGGtr7DDHRfp5Jins+ef/6t+A1jIN4LtJeHKXr
	Fyo6rZQE2PyAwtxsyEmarN1i5KdOC/O6rTT0OrZnTZUVEr6XcOTCI/8EJ521g5xpywirJXVkFcT
	RPvrM8HmAF6gJfhxO8fjHfS3gs9fQDegZLN6jyt7Hoo83DVJat+b5z4QXuWOBqNd0UBDYb/g8vR
	wf02yV0TUDCCpDbONLhjUwV3u3S0IpCXIPDd1AVN8Ai45KLE2H2eBWL21xJqpt2zuJZpQhaz+a1
	Q7H09EhHovBzLZyX+VCgcXcFQaDOzj4YXkB8E/wYw02fyaNJa2qCoT
X-Received: by 2002:a05:600c:3b12:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-4805cd45b9fmr25115925e9.5.1769343785290;
        Sun, 25 Jan 2026 04:23:05 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470474cbsm274962825e9.8.2026.01.25.04.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 04:23:04 -0800 (PST)
Message-ID: <689df9e2-da26-440c-aed3-21c8afdc9ae8@linaro.org>
Date: Sun, 25 Jan 2026 12:23:02 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Fix pipeline lock leak in
 stop_streaming
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bod@kernel.org, vladimir.zapolskiy@linaro.org, hansg@kernel.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
 <20260124071751.5885-2-bjsaikiran@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260124071751.5885-2-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51479-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 561C880827
X-Rspamd-Action: no action

On 24/01/2026 07:17, Saikiran wrote:
> When a browser or application closes the camera, if any subdevice fails
> to stop streaming, the video_stop_streaming() function returns early
> without calling video_device_pipeline_stop(). This leaves the media
> pipeline permanently locked, preventing any other application from
> accessing the camera until reboot.
> 
> Symptom:
> --------
> 1. Open camera in browser (via pipewire/libcamera)
> 2. Close browser
> 3. Try to open camera in another app (e.g., qcam)
> 4. Error: "Pipeline handler in use by another process"
> 5. Camera remains locked until reboot
> 
> Root Cause:
> -----------
> In video_stop_streaming() at line 315-318:
> 
>    ret = v4l2_subdev_call(subdev, video, s_stream, 0);
>    if (ret) {
>        dev_err(...);
>        return;  // ❌ Early return without pipeline_stop()
>    }
> 
> This skips the critical cleanup at line 321:
>    video_device_pipeline_stop(vdev);
> 
> Solution:
> ---------
> Continue stopping all subdevices even if one fails, and ALWAYS call
> video_device_pipeline_stop() to release the pipeline lock. This
> ensures proper cleanup even in error cases.
> 
> The pipeline MUST be released when streaming stops, regardless of
> whether individual subdevices report errors. Failing to do so creates
> a permanent resource leak that can only be fixed by rebooting.
> 
> Fixes: Camera permanently locked after browser closes

You need to fix your Fixes: tag

Something like:

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and 
stopping for multiple virtual channels")

> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite, ov02c10 camera)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 831486e14754..578c0ae3d997 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -312,10 +312,15 @@ static void video_stop_streaming(struct vb2_queue *q)
>   
>   		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
>   
> -		if (ret) {
> -			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
> -			return;
> -		}
> +		/*
> +		 * Don't return early on error - we must continue to stop
> +		 * remaining subdevices and release the pipeline lock to
> +		 * prevent the camera from being permanently locked.
> +		 */
> +		if (ret)
> +			dev_err(video->camss->dev,
> +				"Failed to stop subdev '%s': %d\n",
> +				subdev->name, ret);

if (ret) {
	// do stuff here
}

>   	}
>   
>   	video_device_pipeline_stop(vdev);

---
bod

