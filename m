Return-Path: <linux-media+bounces-21981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1AF9D8619
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D081B36A0F
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07FA19CC2D;
	Mon, 25 Nov 2024 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQCJYBid"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E902500BA
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732536662; cv=none; b=lTBa0XE5sXQCGM4ToznmvEA2m6k1GKrbDp6SPKU9Aw0CIq+lq+eS/re8bjwSIPqphT7fszk5DeZWtBlU354D7a18PFeMwTrWVGWF+lbIzVRYE7Ti/lG6mdEXm/CAppSfZAHbZyGT3hn52rxGkLhyB3EbBHKaPJCSduqpiwhDABs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732536662; c=relaxed/simple;
	bh=MD2kXp9zcST7rQN7sT17fiFMKuYALRaid8lTQMGgKnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWRH5DSNTlAMJ4FUiVEdiEzHeQ9MFWrv9AqKkMGeRB3RAa+c0wCP02kvrMd7ls9kkje6uNaCFmSpLlJGoVwCm0iwC4sh9SM7GaEh1VGwC46mM99T5bnud19tmVQautwh09tLHAuwsBsQLuoi3/Jwl2NyBsGjwr69aC8ripTtchg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQCJYBid; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43163667f0eso39094205e9.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 04:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732536659; x=1733141459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay9iD2Ui7/MFbStQyK+xjPWNY7pA8bVsVnnpt4EVpMs=;
        b=bQCJYBidxeWwNh1lwj1KtNpajVBE1s+1G9HkRw0xjegVq5v+LoEEm+4gB2VW4p2TFn
         Fd1isqV1s3tWu/KGLava+WI6C8J5CzpKnJydfX89m2qTysm3fKdIaWXXcvxCZOyF6Nzb
         RpzchUH8j9y+KOvjlH8ASNSgCx6NN10crjsUZC+dYkMpaYSD4hBZeM+UAZRYBfFL+2YP
         wsHKFm4ibV/92tdlZ6lH5N1iK1D205S0P+BEfXBd5Ftr197Py6R7wChxclOBl74X6cVN
         Ypnrw756xoH05o6k9ONegp5jsCLuk7I+eqylmkv681rck7+uK9IbhNkWVJScWnwpqzH/
         7qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536659; x=1733141459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ay9iD2Ui7/MFbStQyK+xjPWNY7pA8bVsVnnpt4EVpMs=;
        b=B541aRq8PF+kYItfcblyKS32wa5R4L9X7LIgBLjXw+EK0oUfjHKgdagfnC6xiSqauT
         TKZRYyMhn9+IViBQUkKwZZMl2wOys/q561VRF+Bnp+rAdc6y4Xo40JMibFvfZ//BjgdN
         TTaTqZeKAcNNKulTCISiCJtRN5TOA01L+mHw7nB6t/7/grusJovCQ5L9vnLl3fCneKBi
         GsDlhXw1xRo0PL4xYLR5FW5jXIBtIxPNhw3zqkInbj+TLy8uCQ4SS83NZxJD80sYEfG4
         EX3o5ZCmkGdF3NZxthkbyEMEYTlmPKZmpnawcSGaxKiERLjCz/eK6AGVJ1cSE+tCJpJ2
         yrtw==
X-Gm-Message-State: AOJu0YwR6jvGf0wdaZNuorr24ExtoM9faWn0Md3VBYMDwM0u2mVaRJ3s
	k+ZcBHU2Yo9MRClsFK1xrROgEOZpimt113xS1nCN/DEMW+5ZqM79cw6wbjyMASHDs62wKmX8sE+
	wfFA=
X-Gm-Gg: ASbGnctUyCzrMgyMtgw/D1no43IvkXXXgc1LOnADm5Zs1W2YIyjxA1Bv999CcQzau2Q
	kZs7dQkZVdtr6Kk1+MSlWeT1txEReUeynj4DOkQsxLeOuXcKJYfMbwNN8KOFHIL8hWMKrAWpG5q
	fGO/qqbfBSdiVixNeVvGgUGci6UtBdZShrBbWihUfWgZjZF7zVIFQJ9jiKPflojr3wRXLkKZqJS
	29OxQVh4483GLrHNhA0Ik8bz1kbEMIekQiKJ3ugphlyBMKImuQjV4HP80pbWxU=
X-Google-Smtp-Source: AGHT+IHH9UAHPTXjXBibyKyQ4JzxX2GfjasFy+EHmbvGazyodBa+wJi65PPztAT/YiOrgJzhITmkGA==
X-Received: by 2002:a7b:cbcd:0:b0:434:932b:a469 with SMTP id 5b1f17b1804b1-434932ba853mr49370555e9.28.1732536658895;
        Mon, 25 Nov 2024 04:10:58 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm10168167f8f.109.2024.11.25.04.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:10:58 -0800 (PST)
Message-ID: <c464dfb3-8d30-41e4-88ea-c7c21ee9cf92@linaro.org>
Date: Mon, 25 Nov 2024 12:10:57 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: qcom: camss: reducing the repitious error
 message string
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com
References: <20241125103457.1970608-1-quic_vikramsa@quicinc.com>
 <20241125103457.1970608-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241125103457.1970608-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 10:34, Vikram Sharma wrote:
> Introducing a new function camss_link_err to avoid repition of
> same error message, improving code maintainability.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 60 ++++++++++++++---------
>   1 file changed, 37 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9fb31f4c18ad..520c5bc7a265 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1993,6 +1993,26 @@ static int camss_init_subdevices(struct camss *camss)
>   	return 0;
>   }
>   
> +/*
> + * camss_link_entities - Register subdev nodes and create links
> + * camss_link_err - print error in case link creation fails
> + * @src_name: name for source of the link
> + * @sink_name: name for sink of the link
> + */
> +inline void camss_link_err(struct camss *camss,
> +			   const char *src_name,
> +			   const char *sink_name,
> +			   int ret)
> +{
> +	if (!camss || !src_name || !sink_name)
> +		return;

You don't need this defensive coding error check, please drop.

Once done you can add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

