Return-Path: <linux-media+bounces-44550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF9BDD5FC
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 10:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E93F54F1A01
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 08:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D722EC574;
	Wed, 15 Oct 2025 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWrYX04b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4822DA743
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760516667; cv=none; b=cmHSqdT6VogW3E+78W7z/eJ8oMvfBFft3EwXxlfcYpdPW1ffWP1WtK5l8epi618rBczNuxlzZEOxCzhovpqFsB9FdgLkXSmPL/fALjTGE9/4UW6j3j8PWMzE0Sonak6ZLm4/cJda9S5g7spUAcPpQDWlgLfUiNNZyfuB93W6fmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760516667; c=relaxed/simple;
	bh=KxWKmiu9Rjq1K6P3jRxYwsFZIUByeyZ59tHsbEg2yjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hfZrYurkliYEEI4eHU2/65qliXTzgvHS+TN8dGiYHeu/hOOTg+QWE92wuv/B9yMjTtOcmFoH1HOzV8OqB9KOtaTSQswVlps4gIELseGJGyPx+FshJy9PtV/VhIJzMocdHJ3IshXF3hzFieIZgHNdBhLfzL4Jy/HqNmxehuo9wK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWrYX04b; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b4f323cf89bso1124731666b.2
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760516663; x=1761121463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TtE/vZEnFRO/O0aDzTmOM5exa4aoLNDYIYIf8N0xWSo=;
        b=UWrYX04bzyITFxVRkRV21xGHmLGQ9ozgyijXXGsaZ6q9eOYagkQovXkZTCq+qrlyI1
         DAD2pPpF7WHyPX/GVm4q4QBf0MR9/P0zu574oi+fzy5mUHsCVpahBeOYfalCftNgoS5S
         7NvUxDi3jJcRQTOlLizX/1W+oQZn9G+qVLztGr6JN4CtpZrqQVsG7gEi67C6m5cw2f4X
         Hp/CgEV8kYdOpFrx2ppjhh718rFr3x4F4J4cNBq+WEGYQ7WCF3Q0lRahC/QvnpD95NEn
         0DJlPXYNUAiUpv/+hVN2zyurfYqaC0FwuKZAJdpKqKSARiFSk4r3ooV0UejoN//fIwSo
         QqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760516663; x=1761121463;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TtE/vZEnFRO/O0aDzTmOM5exa4aoLNDYIYIf8N0xWSo=;
        b=pC4afdstXxN9eTMxxYO54w116OYA3C9HmwtGNOF5cF0wXQELgGkUiv3eg9XiMQmnCD
         Vr3ifkSKr66wkxQxPt4AqCsLt0T4pmdtn7c0qCurxg+mRqafA9J7/QvDUODy10u5kBop
         9CBPnSA6p5XrPUkNCCMhBdM4r0II/EERkmR04UTk0Rr5Atuzu6M3WAddmZvcT4YK4ljV
         4fg+OIpP16h0HnDd7WyMzcxFH0mA1sFh22tCgG6BW1sjCr+yas404VIl/tH+HWgV/lgr
         paJP8VLKnQGm/x3/ElYbozaKvTBeQ2k7OwHOU4Z+iECybGYtL5Fr0NgaCkkgLgPIbkPn
         mDGg==
X-Forwarded-Encrypted: i=1; AJvYcCWTcJKggR1fVHErkxZEcOZnZsULLw1nk6yj7iP0+NO+w8A7+ECTnukjkQd1YvV0uiVkVrcLIRTKg7T84A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+O1Ti95D4YgPfWOe7yLLjlKvYx/KAaXDBj4vNOhX0vunb3ph5
	CH5l+zOPH47RPhQQ0nI2QWp1htE+G0kZ4ogZFZ58T5oEK53qGED/6OqZTM5JBQCsOWQ=
X-Gm-Gg: ASbGnct1w8U8PW2WrP5Uo9rdUHGwcO4bG21ld3+pwqzbW7hHUcFdLC5rGmrSZBBATo0
	AACC8gMeuwsCnnk8ccRIY+0mPoznxcfnqrt8KnH7YIDQ9or+NDPbwiYxd6DsiaiE2ifAlI4/YcP
	caJfGtd8nQgdl4UU25Aa+Cin2iybVdZHteHCiWwCs0k6OIkmg0GQYyDSfAT/fyVzmrrz2/noCdC
	/nr5jR4pNkbsKlEomMMo0vqJjLqYAZUX9/dY+phEr0ZIU66ZWaD5CCmBwZdUeIO9NyecrPSuEK0
	WXvjyLGA+IGmeKpJRsKEracmfvFe/p21hOdbt+yhzOXYYWElJeASXRC3etaJNF9NndNSPjQwRP3
	L9fXQ5tG5zDp2W3CKkaeaDSP1wB0eTJosA57N83gFRSMeIMVhDjCXKO2JDszewJwZ0pFoijTvqy
	eSpPnIZulBokMTzwoh173x/A==
X-Google-Smtp-Source: AGHT+IGevrv/qqYOxvgpm3B6QvO6hWcybEKVbjZIiQDfLWE4gSlzL7mBitr4uu2g2PmlFXgFdhalWg==
X-Received: by 2002:a17:907:934d:b0:b32:8943:7884 with SMTP id a640c23a62f3a-b50abfd6a1fmr2836258966b.45.1760516663245;
        Wed, 15 Oct 2025 01:24:23 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb9e813acsm169952566b.27.2025.10.15.01.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:24:22 -0700 (PDT)
Message-ID: <06043c1b-b261-4469-b897-66e8173588ab@linaro.org>
Date: Wed, 15 Oct 2025 09:24:21 +0100
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 03:42, Hangxiang Ma wrote:
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
> ---
> base-commit: 59a69ef338920ca6a5bca3ec0e13ce32809cea23
> change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

