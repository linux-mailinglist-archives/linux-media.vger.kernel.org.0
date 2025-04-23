Return-Path: <linux-media+bounces-30879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FB2A99AB2
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 23:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC1E546144D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 21:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D55226561B;
	Wed, 23 Apr 2025 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLR4irnJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C2239562
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745443678; cv=none; b=G6ZDtwU1stWPE7IdNHwO3UPNT1QxL4ZguT3dLHkL1c4awO6usiaDUgmI7XXSuWh2+CNOVIWtlnqGyeYotbGVw+4HgwA7qR4AnXK6r3NDU74wmB36VF2GuX/j8QNyz32f+NkUFB87e7T25sSvIDlWyVIkep1UY/Wd+DNa1Nl/+sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745443678; c=relaxed/simple;
	bh=UoXx4tGES9OMPPM7oZI7K3CxI/4ypR1vyn2KvyB5orQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/bo108G0ppy90i1lUvOFEoTAg8UszYW2B3+Dk/ezDDaVLb9NloPy99T5vcwk91LveHKpwAEAce9VMMZGiDgy/jD8A55jHUCFNQR9RuRF17aHDmFBMi/TMAW0ZzyRlAfKHJNLVD7BGpaV0EUyMTPNpXS2ErZtvATdRDFrXCLD4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLR4irnJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso2385405e9.3
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745443675; x=1746048475; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aNVqL+OZswouyUq3SbRuMHrYu0xbf+/3y1/IN5N3DtQ=;
        b=XLR4irnJGnxyNuZJ6qrJIHxW9ByjG7kEGsip2cYdSXNLY0bXFDqhrI4MuyNbs5zx0z
         mGebB66qlTp3hbnLAnc7vTXRRJQraZ2WVouJ1ZnAHEcXIZpMcMWeLSC4WSWOEZwTzdWu
         HiungUpCZQeqT1kf2uKx57pHtX8GHgu9ZpWpR4cthVo9sfWANysDKCpZsfBqh2A6jsy1
         w+U93jdT9XL4IxBs0eOE57A1OqzaZjI8t7g2vptWdR3Q8Cd1eySulhKwksIq2VGIb+0Y
         v3BqZBoI/i65YLZQy06t2wa+kBT65uzU8ufl2IAEr8Ch9y62rmKK8N57eJEVg6MSUhVr
         LR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745443675; x=1746048475;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aNVqL+OZswouyUq3SbRuMHrYu0xbf+/3y1/IN5N3DtQ=;
        b=FmISGpVW+xvxcnJWfL8cJh+FQgGSLe/GfsdBB3nqnUuwYMk6+T5Vdwu5H4kXUwCL+h
         nFgtSf005cpztW5EjUOHF6TsNlCgXp40FRbwxQzpb0VnIQHNX/tVBDTz3LSmrTymesEL
         G+KPckQprR3zrITZRH9jM076a+GmYO9IxR6wH6BznnG51K7Z9VPIukVLMpm4is45B+KM
         wkSs1qKrYbB8yBsi/bQdzlswaBhK0NvziHQTeQ4vGgJdYfSYYYblWNoNg6ffstPCnyfz
         9YGCveLYODTFSv54PImmZa16MgdZSCBh4+kRxc7SYKq71J0qIz+q8B8ilRTB9ifJyLt5
         25HA==
X-Gm-Message-State: AOJu0Yz5YshVhZMXN/p2m1XKhSlfVZfkOCzS0gayQtXjIq/5KNvRqxgd
	PJUSKtv87JjtvhqgVpSVLAVw3Lh1+K0awLEyctemTDRVc6tMfIxSzoZXx9RUA3I=
X-Gm-Gg: ASbGncszS6I4TRHlRUkDOSqchlpqyZ7xOKawhiGzxUDNy2oGWgg1+DEMUCBOE+BqC5b
	bNFfAoKcMz3UOFfWZ8zTsQrZWO5lrk+tdCll04ucG4CUYnB4OXSHJ5WXM+Vd2BdqbKRJBfNGt3Z
	nPLTzaQRk0ZwWjVuUNPoaOw58sEGHBoySsFMwCfimLF/QPJ6vVbD9TUsAwdFR/QUbHw5kYY1dXx
	Wlg0K3pv/aJAix/vrblaNhe9iGRbS7iYJTMOKaJN2FtApNuLBJ7vYuAsrtq4TBHY7xf0gu7R99l
	BLQCybCj0qk1izPbpNJw0hcayOl2+kVTHm8EAEg3rrDaeUEMDHUx+BAuPSlzZOVIcM/b9vKBbnl
	kObPfYExGNtYf12Po
X-Google-Smtp-Source: AGHT+IHqb57GnB8kDuXYgg2wy9NjvC9CrGI7gkJ4N6LcFpbnWl0SOhTR/Fqxf+gYXyCBGmhSP7sFMw==
X-Received: by 2002:a05:600c:4ec8:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-4409bd051e3mr1119865e9.6.1745443675342;
        Wed, 23 Apr 2025 14:27:55 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493377sm20389750f8f.62.2025.04.23.14.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 14:27:54 -0700 (PDT)
Message-ID: <198b6f8a-8502-4b57-a1ba-77bb585aae65@linaro.org>
Date: Wed, 23 Apr 2025 22:27:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] media: iris: fix the order of compat strings
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v4-0-6e66ed4f6b71@quicinc.com>
 <20250424-qcs8300_iris-v4-2-6e66ed4f6b71@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250424-qcs8300_iris-v4-2-6e66ed4f6b71@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 20:33, Vikash Garodia wrote:
> Fix the order of compatible strings to make it in alpha numeric order.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_probe.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7cd8650fbe9c09598670530103e3d5edf32953e7..fa3b9c9b1493e4165f8c6d9c1cc0b76d3dfa9b7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -335,16 +335,16 @@ static const struct dev_pm_ops iris_pm_ops = {
>   };
>   
>   static const struct of_device_id iris_dt_match[] = {
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> +	{
> +		.compatible = "qcom,sm8250-venus",
> +		.data = &sm8250_data,
> +	},
> +#endif
>   	{
>   		.compatible = "qcom,sm8550-iris",
>   		.data = &sm8550_data,
>   	},
> -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> -		{
> -			.compatible = "qcom,sm8250-venus",
> -			.data = &sm8250_data,
> -		},
> -#endif
>   	{
>   		.compatible = "qcom,sm8650-iris",
>   		.data = &sm8650_data,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

