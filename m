Return-Path: <linux-media+bounces-9816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD38ABD97
	for <lists+linux-media@lfdr.de>; Sun, 21 Apr 2024 00:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08CE8B20E79
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 22:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257C247A58;
	Sat, 20 Apr 2024 22:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w1OKLciC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E852D481DA
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 22:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713653229; cv=none; b=G3qcoxLDoq3+aSC7spCCGEWGrFIkVldGDVh8l0eu+im4CrIRvD4NbOIYOr1A9qIDR6M+eK+49XjekAbj0Z1C++7w6CbxcYXDXG9traWhHZV+1mWUaXIt9w7V8Xkxxd8PNRSHNsdpuolnktSj5RME9Akxn7KnEe4SYoB2nnRsV3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713653229; c=relaxed/simple;
	bh=7rus6XVRgap7s1soDiF1cXI8lMxTwZlFAZbG+UDBkQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f+plNBxPqevr4RP2SUQoFq8spKK3vHBH6wIX8zWD2A4dPeReoXx9XajTbcoEc6XnEpAiBlIsTO7DLcpwezpqJLr8tiBRN4Ca3Ry3I5KUa12Q8fIPuCnplhF0GwKUKuQK02OZ3Mt8mhXZ+uB21McoOUM4esPM3wD/5ojyp5FIClU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w1OKLciC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-418c2bf2f55so22367855e9.2
        for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 15:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713653226; x=1714258026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fHqxIncYJ8egtEQrph9tKgbaWj8ag9453EB89pr+LvE=;
        b=w1OKLciCu9wHLskM35r/KRD4m8cCCX9nB0zFYtM4gpxGvaGth/WzWe6mYRgCwIh6Pf
         mH8HkFvcgjqqA9ysIJEN/al9xHeY/0DgKqzW/R4iHwtTCHmGlGK9QY6Hv+cmCRYIxcdU
         vFWTKuIvYCGw7gO0/+WXb1b4Qt/YoTJGZExCLTw/Qu15jejGvfn1vnpZfhFnsZmwKIMx
         eClwIpyPFAsHjy/XjLuhvsMmHwPtkmj+r9ZNMmWLtyC7/4ZoghhN+VPPhtnzigg1D2TM
         t47aFq7vCdhZ9qWFxaJLSxoGc8o90gmXpZrWt+ie7VgqvFKBCsAjbjUWiegDWNZPMawm
         bAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653226; x=1714258026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fHqxIncYJ8egtEQrph9tKgbaWj8ag9453EB89pr+LvE=;
        b=VKoehiUhcean/wL7Pqyrpbc1GJwPlMWIRtYWgtSNK2mSRHNQ1oUWoj1I3lKQCKet+y
         o2jzQMYCrZ4mTTNqS+fEgytUIR2EDAKhCECkz54gfOyKrqRrMRQ7/1s0Q3HoH5qTQwl1
         XnH8pMEf0pZgV1iH2R6wPunkbCNX4g9yW5iilFr4KFQ5ePq52lasnqwO9+IS1fB2OQzu
         gvP+cQ7MNPLaTr7P7jESyDEbqinPG5vRVguR3izxur5PJCdeWInKKo7NjKfez12WEkC2
         gnjmRYT7tceCDxWOv3Zs/xJnvZ5SuDnwn8a/6mcxFVKh7hV0TD+20BuHqCXeppMWHwTo
         q3kg==
X-Gm-Message-State: AOJu0YzFKoKCWsmVpadL4jrV4nOLQdFeRpbGTfUddiYA67/0jl0Q8LGb
	r/fWgU5P8M6k/7nGOTDFm0AS878bQfUxz2C5TlD6j/OVGsimUaFuRB3I1hOznGY=
X-Google-Smtp-Source: AGHT+IGtPzW/+9lmMVQCxqN2UztagHO9wsOjvQj41cl+HJwvySkknf0HE8sKI3A2uzyMihcZkv08Sw==
X-Received: by 2002:a05:6000:2c2:b0:346:758e:5f29 with SMTP id o2-20020a05600002c200b00346758e5f29mr4624994wry.60.1713653226127;
        Sat, 20 Apr 2024 15:47:06 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id fc14-20020a05600c524e00b004161af729f4sm11399884wmb.31.2024.04.20.15.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 15:47:05 -0700 (PDT)
Message-ID: <0b5c6091-e47c-4d24-a13a-2b5ad1b9cfb8@linaro.org>
Date: Sat, 20 Apr 2024 23:47:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/26] media: venus: vdec: Make explicit the range of
 us_per_frame
To: Ricardo Ribalda <ribalda@chromium.org>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
 Abylay Ospan <aospan@netup.ru>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dmitry Osipenko <digetx@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 10:48, Ricardo Ribalda wrote:
> Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
> number. Make that explicit.
> 
> Found by cocci:
> drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29130a9441e7..2b2874aedb2d 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	struct venus_inst *inst = to_inst(file);
>   	struct v4l2_captureparm *cap = &a->parm.capture;
>   	struct v4l2_fract *timeperframe = &cap->timeperframe;
> -	u64 us_per_frame, fps;
> +	u64 us_per_frame;
>   
>   	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>   	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -484,10 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>   	if (!us_per_frame)
>   		return -EINVAL;
>   
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> -
> -	inst->fps = fps;
> +	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
>   	inst->timeperframe = *timeperframe;
>   
>   	return 0;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

