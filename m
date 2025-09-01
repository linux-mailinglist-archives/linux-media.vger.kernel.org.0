Return-Path: <linux-media+bounces-41404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E9B3DCE2
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 10:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF4DC7ADB9B
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 08:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138052FE07B;
	Mon,  1 Sep 2025 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXhpOICq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23282FE041
	for <linux-media@vger.kernel.org>; Mon,  1 Sep 2025 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756716377; cv=none; b=duXXj1zSbherJ5HYeZyW/W5YwucZswNsD0GUZbsx99S0Lfy318taAgbAfZV+tCPXWiaYCUCryUxbF2leISS5zJdE8A7wZXLowPvSOgKfklYbdyh+YTGL30F2RYNqAQS3miDygLjg4Kf2RfY8IPIlovQKgwGMAl26PpMWf8+ahJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756716377; c=relaxed/simple;
	bh=QoCdfFwHTIhOjBwrsgIE/hHcr1xYXegmqPtRl8bOr48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HVlQ6DAieWq0vPcCRrwZY+FExf5jTf9wx/txV8uOqBcUzAdoy5ZbnN4xyBzYcfFM0RpH2h6+k+AtVGmPcloYZX7AoTxGtjyxBAupbl6UIDbLAPHzui48bYw0HdsW603yjgAKyUujXhLWxjQhrarn+UxH+vyll2Q+OtVJkZSEfS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FXhpOICq; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so6250203a12.3
        for <linux-media@vger.kernel.org>; Mon, 01 Sep 2025 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756716374; x=1757321174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCuDvCcZtXrgauUzDw46OP3GVMHfHfFOYH0ITU3ZEfo=;
        b=FXhpOICqDBMtI/Tx6BqwrNKTDDbxeMlX1+r0qq3CD+xUoGahK7wURA6FxIWjEtycbM
         Bbl5CFWBxAO5o3kwM6KYp+AxkqZZfxCLxMv10ijf4T4nsKqJ17GjZjkuxkLsb00iTWZq
         eZPiVm/+gNjhpMNGLIVd81N78ttD7BurRKDblujnxO2kFOGqmCb6WGXueSPsMPCIdVzc
         zKzLf/4xZ3p6HgPthkWzcBjVFLmXXwoV+s6vRsRtLo7ClueWwrBRcDam6BEKI8U7Gmcq
         tC/XzQyvEkm8hUnzMVGtKgZeQmJhC+mgNEfxZw1uPKvqyrIY8op5qKehrZD5sBTd0iJF
         9cHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716374; x=1757321174;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCuDvCcZtXrgauUzDw46OP3GVMHfHfFOYH0ITU3ZEfo=;
        b=q9H3EHagv/FdQVQSyc2vC5ceijZZm0rg4BYneGoCtV52U29m2pnAiefxewreoiXfRo
         QViV5ZhsXmx5MU0mkdxjuskZqGQRPr3sShhIERv0hLPZn82wsqu8MZBgPltLKhiqE+Nn
         u3AbVoAZYmir4vmYh7r+5O/QHHRt0nn3x7ICQJSDGcyAlNaOgLNM9anSsBpSTwE790TW
         v6EZG6SCYJAC52wsg4eICkPzPlg11w8Fy33c9nrJw/OqO40Vg1PQkYVtQOZNRwGAuJ21
         xN3POwB4Ld9GlYH1Si5FL25EIAfl3DOl3iwyBFGXChwmP1iFf1JwbxGMwKJAkdS3ueA7
         QFJA==
X-Forwarded-Encrypted: i=1; AJvYcCU8NpqEsOgJIAQ6VbtIcxEIBqtPULQSLeapZvRVRGhg4wdLl00jsVaHr969fAKW9G22hyMLHa2wBnY0Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3bqbXP/QFHMqS0lN4ZK3RWWKEjyfVTemJjjQIMbboFZF+DdwC
	Z7pSGrCUWuRTBON/QoNX80jUFL0nwSXCVRj1ab0JR2V//KDAncOdFIc8J8xxczqxU8Q=
X-Gm-Gg: ASbGncsR/joeq91ZZYw4vcxuSCmn4YfN2eFF6nkr5PenaoHPAfaG4S8jCuJsBLEvcvZ
	lvrvuWu6E3ya5bdcrTwNvGidFlBRYBML8ALrLjwYAsrBa6xo3zY+YouulZ5bLsbCzkbtlJQma1p
	3K2ZAugmFDhiGqA/jp+3ypgt5CdTpDonF60INVqqRyGUHX6nO0ACctwmKFfOAmbd2tIPn4+xR1n
	bBzxNh2WdYiyV62IZR7R5+jMWr+mhhqAZposC+B8YauZOCmYisvoR/2X6Wm+lrsr+cZvnPm4/x/
	uya7E8M1qYYGs6Qk1e/QH8cXhe/u57SbAd3aYBhjSLAAM/424eIjMZigBOPFnRHlBCyzN4CKprw
	z9Zo2FXVhu5+UvmR6jihb15s+Vk0CVSEOmVbRXpeb/TpA1H9gP5uzsgkpyIB2mPzDy9YZJoOxoy
	0hDduEP/KOfztAzfB3yIewNSU3lHb1Lw==
X-Google-Smtp-Source: AGHT+IEwgaLMLaFBKFr/PWcWKPlujPF7MSGDJTrP82Ursog0u8JoY9Z+hSv7cNIFvoZlLeRqHrBOgg==
X-Received: by 2002:a05:6402:2693:b0:61d:dd9:20db with SMTP id 4fb4d7f45d1cf-61d26d79f49mr5756112a12.31.1756716374144;
        Mon, 01 Sep 2025 01:46:14 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4ea764sm6686462a12.40.2025.09.01.01.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:46:13 -0700 (PDT)
Message-ID: <dda29710-4997-4c23-8620-b43ba402b7ec@linaro.org>
Date: Mon, 1 Sep 2025 09:46:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: update Dikshita Agarwal's email
 addresses
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250901-update-email-v1-0-8fd49d58c0e5@oss.qualcomm.com>
 <20250901-update-email-v1-1-8fd49d58c0e5@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250901-update-email-v1-1-8fd49d58c0e5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2025 08:33, Dikshita Agarwal wrote:
> Use dikshita.agarwal@oss.qualcomm.com as the main address for kernel
> work as quic_dikshita@quicinc.com will go away in some time.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 64ecfa45540c3e10cdef4fc10fc10e854b396c99..fe9253d6fe49c33828a79ddcf59d024495661774 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20818,7 +20818,7 @@ F:	drivers/regulator/vqmmc-ipq4019-regulator.c
>   
>   QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
>   M:	Vikash Garodia <quic_vgarodia@quicinc.com>
> -M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
> +M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>   R:	Abhinav Kumar <abhinav.kumar@linux.dev>
>   R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   L:	linux-media@vger.kernel.org
> @@ -20890,7 +20890,7 @@ F:	drivers/usb/typec/tcpm/qcom/
>   
>   QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
>   M:	Vikash Garodia <quic_vgarodia@quicinc.com>
> -M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
> +M:	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>   R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   L:	linux-media@vger.kernel.org
>   L:	linux-arm-msm@vger.kernel.org
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

