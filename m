Return-Path: <linux-media+bounces-44029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B17BC6F3C
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 01:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D0D74024B5
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 23:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948092C327D;
	Wed,  8 Oct 2025 23:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4WyePDA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA10204F8B
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 23:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759967538; cv=none; b=RSCWomX8YbO9lGyOdO2lBJjIqSVWAsiI49qcs+CPhvzYUA8pY3YCOItd6tTGiZ5mJyDPCjdtu4aubCZPeVyNSRKekSlrBO1G9ly7LMwwtdWeNhf3vLc/nNsRL9LiRit+TJnZhHRCu6+lc9Up19WgmF0bTRAXsO62/2p3Vu1Odpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759967538; c=relaxed/simple;
	bh=TBQISZKH/GjwZoJUXF5TfT7sT2bjyy9kewRKzJAXMIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKZuJIuA9HME0DMTang1bYKrpGkAHb5OD/Rgx5ERnOplr0fb3nlzrmEfdo4rf5mqRJlb1hCBQ1W8WDvrHoLLuj2Kkxvzi9dpQwEowWUteI+RtTMqYxT+rpe6OG1y/Hq1+e068+my+s5ljzvks5w3XRfdkwlxd76zvNAvMFz4lj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4WyePDA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso2596975e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 16:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759967534; x=1760572334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JMEZbdYmBxBwQ2oYSgatJMEkEKkxHmlBTl3b0l/F90s=;
        b=V4WyePDAe26Xf9zFPSKeqI/9EJqVhdNIws40ku6BiKJIi9nX5s8/gILWdjGAceq5P/
         qc32mHuG2NqUJ8SMhtvQRz2WMlFo9a0dRQDkE99g9z9eyZ9uHpU866OYRcWIxtfQmgaw
         wv8yjBG7Fuks8YPCJ9ypYKdf3Wcv9a+JVNayNnchpmWxqXNyWLkGzvhfJ+U8Harqln8J
         +JmcOb9QBibfKPm1pvKsvGb140+U6OydEdsf3y5YkoHI+gLmHHSK1i8k/zZB9UOUmdkS
         doAbWmC071Nqpj7pLzb4uOON+e1F8ldYPols3q4Pdb8CJ7X3jiMXlkIqIman/b6wIG2K
         LCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759967534; x=1760572334;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMEZbdYmBxBwQ2oYSgatJMEkEKkxHmlBTl3b0l/F90s=;
        b=pVsw8Mi/+OcA8BvHuFEk8v5ijHjEqHbGcPNSYM3kxkEybPo9gfjviBCDXvBFFt1KbW
         veTQlTMKD7h2G+kzMmFScZ7Wcx8v/suZqriwBuBjmkzuuvJpcyA9PHNn9kS6JmaA8hXp
         ZXwoP10K79LNK7xb2K1gEKj/LNVd3HINCYJrhqbhxObXeePUoSJs8vazqwgBsX7Y75mF
         /XJ8WWhfP3THRGJbiLUo4/l5zUl7K3SYip2UQtUjj3v/aipj68zPSCfPN/zVjOsXSY6W
         /MeIaoyau0cPjjCawm0XC5Qru7rPEQTdxfzRDtuTqklVgQiZHtg8FdNOWTcY6kHKj8Cd
         i19Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSiurKMjzDqSMhjpFr9H+NYaIT91FoWi5ZKrS86GWaUwFGM/yUsGmaTzZC64wwRy9sNl+3sCWKHoJ14w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNuJF+4wcjrG8ghu/w98luaY4tWh4xmxRJVDfuXemZ/+qUW//
	1mn72Q5LeYX9Qt38ghrMudTgOv+YOk6AnaZa2LaYEPhxSUI4W9ch7yOoF0QcDBi994gJicIszXA
	XrIuX7fU=
X-Gm-Gg: ASbGnct360o8FHW+yiGSAn5LB8sK9AfaJl5TosTYkcTpvcW+GhmrBFRxDzndfOv0Mwc
	BCs/OLJiQumoYgn+qY7yKuZviGM7dF0m7YhxCRV9PGvhBDYAryW4lkKcrcltocjnDdWC6JVOPFv
	6jgVTELgob/0Mn4Mgm/ALFfpdh7fNnBde/Z3JKc3hput6jMiJQYG7vCPrxRDdWKyhLuApkdI+UA
	/QUvIcaQeRpGzDiYEO0wKfrLGdXKPlNPEMR66VRbYbB7a9zXV1X9ArjIQV5Eq4m37WwmeVmZdy6
	vhbS7FIuUNcH7tKy6CgsQPIHJO7iJ9aKix0CNx8CP7nALGTOUjxY8lZVqQNIkd0nggUH8gReZFl
	BSgPQxU7uQQrljUy9IJaJDRPmZ2AdJhCZDEVlMwz27h91T8VUWaXp5/KyCGXSFil8NAy0GiUmQn
	l/rU6JjBCAVlTynmGM
X-Google-Smtp-Source: AGHT+IFsEChlVG8pxTMvthV/pJR2MSo7vf26zXxeNj4z1rkuzP1YOYr4eDF+lU6Q5uMCn0N4JWGQZQ==
X-Received: by 2002:a05:600c:8b52:b0:46c:a569:71a0 with SMTP id 5b1f17b1804b1-46fa9b08b46mr37296905e9.26.1759967534532;
        Wed, 08 Oct 2025 16:52:14 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cc939sm24120165e9.1.2025.10.08.16.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 16:52:14 -0700 (PDT)
Message-ID: <6caf62b0-e8f3-4753-bb1a-8083f0753431@linaro.org>
Date: Thu, 9 Oct 2025 00:52:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/25] media: qcom: venus: Drop unneeded v4l2_m2m_get_vq()
 NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-17-laurent.pinchart@ideasonboard.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251008175052.19925-17-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2025 18:50, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 2 --
>   drivers/media/platform/qcom/venus/venc.c | 2 --
>   2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29b0d6a5303d..8c77db0f6e76 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -329,8 +329,6 @@ static int vdec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>   	struct vb2_queue *q;
>   
>   	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>   
>   	if (vb2_is_busy(q))
>   		return -EBUSY;
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index c0a0ccdded80..0fe4cc37118b 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -241,8 +241,6 @@ static int venc_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>   	struct vb2_queue *q;
>   
>   	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>   
>   	if (vb2_is_busy(q))
>   		return -EBUSY;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

