Return-Path: <linux-media+bounces-44626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 360F7BE059F
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 21:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB97C58019C
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 19:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AB2303A08;
	Wed, 15 Oct 2025 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UwJGf+Ul"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5C303A0B
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556178; cv=none; b=L+Gm4Grq0xEY+A2XAv6hywqUp0BVotKi7ayySsVPOqbpVSCsi5Z9GwKbYztcIuLyqYQEg+n6PrpWZopN7yJA9wgETXDt3YtLooLNEhKSPQra/OPts29589BjzQFok4kH2mBghLeJszHEC6ZZ0UCUNVlQ5BQ17H4KR2w6UXPA2tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556178; c=relaxed/simple;
	bh=6FJ/R1ITDsF+bIAIpfjW01XbZyF5cdVhQGhS9FNGWBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKvErZHMeYoH1h7aFid+I+MtaSJUzB3mEmd2xNlCQqES+nnKq6vHApvWe44f6aCdWBj64+A2OK+2Y/5MOid097mu+H17tZU8AxO4YPdiLvppGs8N0dqQYur6NPj1634sNoHnIYD3WvcROBpjlv1asW7N9DyaIaAd+UJrJIpMwB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UwJGf+Ul; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5848a2b3c8aso945582e87.0
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 12:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760556175; x=1761160975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2uKCDGSkRJ1nI5Vl4WxpkpeLM82j5VPKiPiLY2XZbg=;
        b=UwJGf+UlWJ7t8hswzGU8YK+rxrOuzqHONzuZvAEiwpkAROzMHTpLkkQNhV7o/LEmva
         jZoNgA+b1QlTvQITTDVjuuuvZKbv1rFcfWcvt1WYbn0PpXPmG3xiWtyEFuphXwHCzzge
         0iFKQmd07AWa18Jc8VcjsBEbzoaZZj2pFVCE026X7r89Vik8YAKk0Jgg23aOl0rpd5PN
         rBpBs2+RJCTSiDv1nqCc/36aDGgX8n8tgQCOs9I5xO8Cm8R6XiYcLThitzFuraUTG/qb
         HUsq+QSuVAvrmIhMl8jxjfRBxrTAP7sepgYisGScurVa6EI6ShCZbU9mRnHUcSLc5p27
         aAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556175; x=1761160975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2uKCDGSkRJ1nI5Vl4WxpkpeLM82j5VPKiPiLY2XZbg=;
        b=IbUTnAL1LhuAZQBvBQHwizTiYUtIovDXXU4DNyHGxJBDs8v/ig6gorLt3Nvjnfg8zT
         NnXmpB9FOziIPDYPqkeHav3Q4V2aS53jVJ2YLo/UI3ExU/SnkjbCfonpkZayKwcOLOLN
         7Nrt2xkAi9ZnKIoOljXClUcW+6ikfm6RSdVcuee64NOeeuirROmTtRy2dHNKcX0XOHnM
         uzCp6sSJvE6N0ibM+sZvoG2loWGMt5Qf0ACphXoGhV5WME35L7UD/KmYsB5Rz34DYqs/
         OQGHDOUceK3UUiUuyIO+wEXZW8kl8zU4tA5D7ZCo+/LIhPnafZMVfVzcmfdL5F6jUj3o
         n8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKoQAN8i3duA5h/qBy4efi9af2F0nJzSTCditmprGaDWv4xirUUpsQ4MgEa5I30IpWZFmHwRhBsLMwvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpeQFSAqlW/j/c7f3LYhe9t3CfgIXMsBWa78eJEa5x5yC2O38X
	JpRHLDV3ATz79xlGWQ98xELbBBU1wSeJcCGk8vId980GvegpogJgEho4LP2azO0SB/s=
X-Gm-Gg: ASbGncsuvOY1rk1SQYY5+uDR0gXgoFPqTIHQgUPKCIoFskF9CSGM5zMoAQvi87WfvjY
	zJ9pQFQCdtSMcWTefOKfjKHGcpmxdqfL5/umjWXwakMFgxwfNMNt5IJ8mMxaP56V9YHaLKd8Nap
	UQZY1XtiKEWeg7Sk71nZ7XaNTzWK+Qdr+NZh9ZHO1kfBmqfJrgiQZ/Lbchm4G37QaBjvSnp/qIT
	Vphf5c8feJPbF9iID653DXhRxScuyZJsS8JnU7HDszlbxvsTKBjnI8XQowFleOh4ONf2MLTrxYm
	4hWuWzwvCXtNUZY+A8MrmRU3BCp9eQ56Y9toS+xB1V0Y9ddCgCipFQ2+HNIokVT5KaA1kE1/9Q4
	U3mFwBNmNHU6k0/Xovea7d6w4OMwwpDLai191sn5FIHxipmERKswOlJ2T2ePIHIUsbtJ7DMNvaz
	0APT6A5zTU/ICYuyE2Lnmv7+dqokM2OfMG5BeU7jM9qjS3WZ5rwmCzHgLRPMMxFa8huyk6zA==
X-Google-Smtp-Source: AGHT+IGD/Uw/fgx84AFertLSvfVKmejPqlvypnP8IIzpqbGwR8abvcNYUgIYpDHVV55dLFfVQQ6myg==
X-Received: by 2002:a05:6512:39c6:b0:58a:fa11:b795 with SMTP id 2adb3069b0e04-5906d87bd8cmr5059024e87.3.1760556174897;
        Wed, 15 Oct 2025 12:22:54 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59092ed98d9sm5657624e87.24.2025.10.15.12.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:22:54 -0700 (PDT)
Message-ID: <62da6efb-24d0-4a6b-9a52-c8f981f09d30@linaro.org>
Date: Wed, 15 Oct 2025 22:22:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Use a macro to specify the initial
 buffer count
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 05:42, Hangxiang Ma wrote:
> Replace the hardcoded buffer count value with a macro to enable
> operating on these buffers elsewhere in the CAMSS driver based on this
> count. Some of the hardware architectures require deferring the AUP and
> REG update until after the CSID configuration and this macro is expected
> to be useful in such scenarios.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> This change use a global macro to specify the initial buffer count. It
> meets the requirement that some hardware architectures need to defer the
> AUP and REG update to CSID configuration stage.

Both the commit message and the explanation above brings no clarity on
the necessity of this change at all.

This is a dangling useless commit, if you'd like to connect it to
something meaningful, please include it into a series.

> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>   drivers/media/platform/qcom/camss/camss.h     | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 09b29ba383f1..2753c2bb6c04 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -541,7 +541,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   
>   	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
>   
> -	for (i = 0; i < 2; i++) {
> +	for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
>   		output->buf[i] = vfe_buf_get_pending(output);
>   		if (!output->buf[i])
>   			break;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index a70fbc78ccc3..901f84efaf7d 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -41,6 +41,7 @@
>   	(to_camss_index(ptr_module, index)->dev)
>   
>   #define CAMSS_RES_MAX 17
> +#define CAMSS_INIT_BUF_COUNT 2
>   
>   struct camss_subdev_resources {
>   	char *regulators[CAMSS_RES_MAX];
> 

-- 
Best wishes,
Vladimir

