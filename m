Return-Path: <linux-media+bounces-34769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F16FAD90EC
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D581B1BC3BFB
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67C01F4262;
	Fri, 13 Jun 2025 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbIdonJd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530F01CF5C0
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 15:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827659; cv=none; b=Ey2INixeYStGkRkPDjWyWHZFjnRgOjRUkRrT7yk1tEsib1B46jpBjELqLE8VmY1b0UiE6qyMhQUv+mF7fD25xMtITNm0GhABcQ8swZIuHzSG3ae/w245Zhl0zSrS0LGpOzA4pDvD6aAf40wpFlxCRLYpoglDo4ixNaNZDqqQN8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827659; c=relaxed/simple;
	bh=yigUz7BHxw8QBhJm4Z5XVyp2Bokda5y8lA60GXi8/tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ka2n9A9dGIMGgD2J0e8+EGD7BHeppuw7KilNvyzukhF1+3+DP0wiLGCk/FQgyDbVCLrHfWWC+Kqt8ofaYYo+qPiLxDZrAJ9KcOx3EDxCFX5zDAbLTAuRp2eqI3yDUJrovnqfhN+F4xzC4+H7dEiVZ9zaR01/ygW+FdOTTgrlzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbIdonJd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so26813275e9.2
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749827656; x=1750432456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5YL1/PTWX9ntjACVUMCkmmCdXN1AOyN6/cgs5Z/ZJw=;
        b=AbIdonJdKmaOhTw+HXKauFkWJvbpj+j7oM7WcX5IA546PTlfLWEan5zIhU6ipW/pQl
         Z85CYmmRdaBOAHGo0shOCsUX57CQauRLEdin4j109j2jlHJWMdsI/7/V1gzmlSoT7nAg
         aj2mMDoNXIbYX2gd+C+lV2QzFj1ZLXdPqXIvVHaMhGTz6z8pDHU6k3wXTZERlhFj2Jve
         4Bkdo2aBlIcqMqFPR3gJPMhb2lZdUwFCUZHrXpxbg/manM9WpUQQw9uK+PXv1sUkymuo
         4vnRF+w4BZRnp+ofRd4zcJegXTfUVdxRi6GYiMk3GpyPcJ7FwR4ehup1CX2WTCt3qqFF
         lqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827656; x=1750432456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5YL1/PTWX9ntjACVUMCkmmCdXN1AOyN6/cgs5Z/ZJw=;
        b=uKvL0eQt4CBeUnneulRYZLPoa+IOEJ9sC3cCeL9v0+YtK3ujFwoTgSadhbkAGy5zxl
         UG5brUHpl4i/Pg4bBgTP7O1JlIGXbtSWSFr34ABLKnXGzv/NDuoUrbBQEoWLo/nyqhoe
         08UuUZ0rZICXKCX672Mo6/SGG04EzGS/v1m4WHOsBVzABTQ+mbKEhLQQH7NW7FXO6uAO
         P+JMG8hL1NgAup+Qp0jHcZosfZSGZfIowIuOroU08ql5Dm2YGYQ0hFh9k0PcfgZ82dfF
         Kg+ngp7HqnBvjNE9Xbn2sRp7HNwzPiK8H4M9WE7A/DbykQ/TxlqLk9O4m3MLefCMyeIN
         PoHg==
X-Forwarded-Encrypted: i=1; AJvYcCXGZooEqDu+tjjAzxGKGDtrhTVe/Dz2zocwjwkjt8XGtJ88zvsg4wqjlOg65QgkfUMmU988B0IeE1VAHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt5R3mDDpKG2hPHPdEJCm5r0BGrnVjFKf2JARpKl4mX07H/HDd
	CT/1x/mO2793U/cI7pgjz3gvl4gxZCmBYJR9CXhK3UeCpwrcQ8EH0KvQN9i/0dSVfsw=
X-Gm-Gg: ASbGncv/R2lWYwbsOFBKDQrQe6IMWqh5d13SbljRJAd5p229UE9QfJ1jpWfHFhPpYWW
	fR09ZSUxolSqtMCFNfZW0ZBAiZlEVG0DhMuwKHUnuFb1U9KRlm6JXQ8Dcr95YvaSExgKhgbu8wZ
	toRtIqGf137bw57msM3triLs2OlLwIUMvXwxN0XWanaCpNr3lHCt3FSfgUFCAN5G+8JhrxOEZMr
	kRk7OZBzAea0ZAajjNjroLVlbraG+1lzT1vSylfUv1lbYglwTe0ld/6Xg91nbYGlDsDqxZ2Qo7K
	KFyaau9Ty2o1XxGOLpKMVo1DGNF1gPrsW9ZwWtTqasA46WDxZwDVYooasDuYKOgilSazuEMOLjK
	3zJEk8xEDTIhPhoINhp5LjbdCF0M=
X-Google-Smtp-Source: AGHT+IE5BqWkTcV/YtfSzruju0bqO5TpxF/6X93NQ6kxh0a7Xc5nDXiCwJmre3t2cwX6AdTEyT0K5A==
X-Received: by 2002:a05:600c:1c23:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-45334ac72d5mr36043655e9.8.1749827655647;
        Fri, 13 Jun 2025 08:14:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e14f283sm55321915e9.27.2025.06.13.08.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:14:15 -0700 (PDT)
Message-ID: <069d5c16-f3a9-408b-aa61-4bc060ec2771@linaro.org>
Date: Fri, 13 Jun 2025 16:14:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] media: venus: protect against spurious interrupts
 during probe
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: hans.verkuil@cisco.com, stanimir.varbanov@linaro.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 16:25, Jorge Ramirez-Ortiz wrote:
> Make sure the interrupt handler is initialized before the interrupt is
> registered.
> 
> If the IRQ is registered before hfi_create(), it's possible that an
> interrupt fires before the handler setup is complete, leading to a NULL
> dereference.
> 
> This error condition has been observed during system boot on Rb3Gen2.
> 
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   v3:
>      Added Fixes tag
>   v2:
>      Fix authorship
>      Fix spelling mistake
>   
>   drivers/media/platform/qcom/venus/core.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152..5bd99d0aafe4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
>   	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
>   	init_waitqueue_head(&core->sys_err_done);
>   
> -	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -					"venus", core);
> +	ret = hfi_create(core, &venus_core_ops);
>   	if (ret)
>   		goto err_core_put;
>   
> -	ret = hfi_create(core, &venus_core_ops);
> +	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> +					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					"venus", core);
>   	if (ret)
>   		goto err_core_put;
>   

@Dikshita @Vikash.

Good/happy with this patch ? Looks right to me.

---
bod

