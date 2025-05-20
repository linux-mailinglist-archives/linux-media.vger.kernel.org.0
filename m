Return-Path: <linux-media+bounces-32918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC7CABD81C
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 14:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C66717ACA5
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB52C43159;
	Tue, 20 May 2025 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvJUbteA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32A011713
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743578; cv=none; b=P0SC+kUBH3MU9AohBrKesjsZBE2ggnGTrOp4J6F0tyv1Xjgv5zn+hXkHw4ODTCaQlFqJ0qoXa/w/SQokgP6ijc3VqzBER0xJkhx0A4BwY/pMeHo3IV1Wl15DH2r3uS0GFasvTDspNwI8me/6zNj0mvoblREvGosD+9vzzkaAbzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743578; c=relaxed/simple;
	bh=yN2oz4RGfjWsr3L/yxfEwmYkVPvraUmd8R28Gu6B0Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZOdBOSdacJWmfeZjTTozFp7I7p61G8NG2U25ttEbFMNm1bKjVBA2wXzKup3+kKTXWU/mx3L/as1JxJDObJfPfDlX1fMpGpMAHv5EFEDyKAfYXXRnWwDGr9gahTBe3jWfY+YiVLo5Suvhgd97wXnttN9xrF57U7rI1WUXXk/x4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvJUbteA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551f005fddcso277156e87.1
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747743574; x=1748348374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGxzwmCx0aVZaskSD1cvnXeY9ifmH8LA11mbYYh9vMI=;
        b=cvJUbteAf8Xw1WV0DNcfrB6Gq7qu3YaAU2jIeoXNxuwobYZJaM9B92l7zNJOqQ7tGE
         stjLqXPn001yaYEfc53tGjDzdqAGecNhLq19p8afw4UyVsNZWuGFpv2QdL90Q5KFqoj0
         KpXJRO10E0uhPM94iUjgwPzYjGhGHjYHOa9XNYDme7MzhPg+aM/Ek4Za3RBGg6dUeNSl
         yp3S02zp6aioPjUmWbytHsQOtJp/gSgFtFEo3oKcr36DW6woZ3VGCpZ6yk9+yTRDgnxt
         a09+1o9CkJubWKQWFqg8TUOZhOjbBr6RgKCD2SUO4HwMiEma8QiIYfTaxfi6pbImVEnz
         Z6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747743574; x=1748348374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGxzwmCx0aVZaskSD1cvnXeY9ifmH8LA11mbYYh9vMI=;
        b=lm1ZwNjcbEi/mfCh6QXcPwiD5g/RIQQiBPFYicgOYiAxn8gM9F2tlb3jPhAjpzgX7x
         QWXq9uR06CLCQ6fRPsXlDMgaJAv4FC56ax07GyqNMMCXkokEm9WWIhGYqvFPHS0GVZA/
         rnIOq8+9rKNBiqeSpRLb/b6sG8bIqD4I4otcOj5j+Glbn9jshWu2H0Cp1cz3y87lIwka
         3pyu8Ws/GluXrGyrnm3wL/LmrEg3TzJMRXUrWXfLgLee9V06yv1kgKMGYBPTAkAV03Ge
         g2XtA18udJT0JxcpLyRql7TMHjDfj2qLmR61SUVHJWdKzCmtOnS1VG2L3HGLUOCI5XUV
         T7dw==
X-Forwarded-Encrypted: i=1; AJvYcCVCXN0xOi1gsMbfvP29zmiI6HDSvjhhwdiYCGnSEvdSSjfug+skwj338XMly+UfSePaA23Tug7CblN0fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSGHdZ8wvTXYsNAxcB3boC4tXebisDUdrjq6uJD+kE6agWMv3t
	E3nEhhXF6/orCTUdyaEcRE5Iw0tbazm9pmyjJ9fAGdbMsIceNITj/CUYkDpu7g2LgzU=
X-Gm-Gg: ASbGncvIiihyzbTyL7Q0tGqRcuKQFIYCI+jOrf1wV0NMgk0hdo5GlPYErxqdcc7WBHp
	8Z8wG/ArNpMLuzzuWwBqViB7AYj/uqXVjZyTWi5+9ekABZIkA1jF5WD1c//XMDrFPnMtWROwVFq
	wIyPQo4Kpu7D1loJYyv8SEDXXBCY71YAyfk03BNOhKfitgMIQ6bJYeWbfHlx3cP52iiZ1DgfAGe
	S+a1PV+trtnO3Z9gaY763Kleue82ZtE5KOIh5rCFvFaD440NMN6aGJ4FPPvvq79yw8EHD+xXiIU
	TBv/fBYngKrm5P6miZfwPfM2gCMI0qGgJWLoMjJ+AuQdQh0BhVcacBkvBenNAchgMqWTqbm3lsq
	ydpcb5I8EHsieFvCHIvvQ54soDbkCqg==
X-Google-Smtp-Source: AGHT+IFHmFbjhmDs8JEJN8j6pzPYHRP0s5f+jZkbENRKCNk16g6eKwVvixfcndrmuMQxR0FYU+h/Iw==
X-Received: by 2002:a05:6512:2909:b0:550:ed9e:1b32 with SMTP id 2adb3069b0e04-550ed9e1fbfmr1194001e87.1.1747743573823;
        Tue, 20 May 2025 05:19:33 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcb3sm2327121e87.86.2025.05.20.05.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 05:19:33 -0700 (PDT)
Message-ID: <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
Date: Tue, 20 May 2025 15:19:25 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Content-Language: ru-RU
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, bryan.odonoghue@linaro.org, todor.too@gmail.com,
 rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Wenmeng,

On 5/20/25 11:56, Wenmeng Liu wrote:
> This change enables camera driver for QCS615 ADP AIR board.

what is the rationale of enabling CAMSS on the board without giving any
description of any sensors connected to the SoC?

> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..be8b829ec508d7de7a4cd6be6d1d4e83b09734bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -211,6 +211,13 @@ vreg_l17a: ldo17 {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "ok";
> +};
> +

--
Best wishes,
Vladimir

