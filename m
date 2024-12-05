Return-Path: <linux-media+bounces-22690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D822D9E517A
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 10:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD1AD163CCB
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 09:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250551D5CEE;
	Thu,  5 Dec 2024 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtY1vNeR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90C61A8F84
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733391338; cv=none; b=rcbLbTo/1d1jEUo/pwza8l8oCqJ4kbl8mKXKy65KP5emkZBb22j8O0a32IMCJrN70fKO7LBCUIK2hfUr2k/2h+tXs+LCZ2wll2bXj7Of5oAqN5c8Ea5CHpLl1iMQre9N6npeGgWivlbXbpYlbugcFjOKGtBTnumyQvtmetNbL7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733391338; c=relaxed/simple;
	bh=ioj11kRVt4ZzslmCkvbLnmBtMfYRxYdlCp3WQpO83Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xm04HaHe2xeC+4pyOngwM26DBjd82xuVcxAAlcg+rM/wkUXB1VeBlQdZZSqAq+bxqokMmJqzZWurB1GskvbDytJYKVZ1DpNAXrEvQ9UdfdtNkCTl2QWx+3pRkKfgzqJaUwtWxipF09l/UZRfgQ1trkj3bB3Vs01Ra23QxL2boXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtY1vNeR; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d0d71d7f00so1019604a12.3
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 01:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733391335; x=1733996135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjDqS05st+cDBpUDwPN55de5TW7/RedGp9MsJFKfa1A=;
        b=TtY1vNeRwVPA7C2f9kOILVD+K2JN3BjkhbBN2fmGzwDDKHyiLYZtWnri0Miffn1ZbS
         wy4wJLHVt21F28iQNiEnstnDe5BoksA5p3WJ+C34lJgKv/T3glfpSCvq9AVnidOH5TeO
         qlbK0q3+fr67YVsAqBjDz8AwqI4HoFGyqtG2oxDPLxvLQ2HSaEMTcglOtaqgx6xK5tSe
         zS0u6gxtecC2MPKzDZBc3edT9wgXcOPBKJh1Vw5Za94xAAlV9jCA4gm2VUykMu6QmkW9
         A+e1KdLLnZNP3pl/zkN13Niju0bZhfd2/IFaSjsvyczB9LZaF0uyxWCvIKrINFgJy+rM
         APXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391335; x=1733996135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjDqS05st+cDBpUDwPN55de5TW7/RedGp9MsJFKfa1A=;
        b=RGmhAbDTdA6b85Weq/IhdCx4sMdzzcWzmJvGF5q9HYC5C+3hXBC08A0LNuPAO5nX/D
         ydCyTireIpRqmK0d+uEjv0/mrzyymcvCbvh9rKWkTzMcQXckAGyNiP/Hzl40qv7pWNkW
         HkbTcVVzAY+4qxj2wgbGfmYwfmp5KWQqJOUf+JrVPNbxGzPtKcdUuD2iu5ezXSYuQcbn
         2Pq5Eh3e/avc/kBFQdWHOUlYynk5haTWlckYMAZMFXn9ImZRS9oosqEhCbST8zWOc0Ml
         1kIo5Nx7SlKwnB3lN/4CP9BFTIUEYsqWWo8nRkjFb+ABsq3S/0sjXIGYxHA1RFpqemSi
         48NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXufST/yBeFRXRKEvu/Fjq4VPC2NazzQfwp5I5V+56y/NkEB4vfwKkvMRKp26bly/CWuduv3/58KcVDYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7wceYYjVEQQ79ustVpl/D07FSfCJDp9ha06jUhEgd1eHkG6WX
	vTBN9IAblao/sbaOhqAlsEJ+zvB7qWhYOtPGG6DfOTkreSm6rjR/duR94dEO0t4=
X-Gm-Gg: ASbGnctwQrE8Nt0S5xWK4KKiUs+3Of6W+r+XElEvCyvjsyT94/0s7oCSJSoVitFn0Jk
	7a6bWA/wOWjh9Gjv1kXlnejR25Z4pWvynXutuFWXk6J+cKm0MQUKS8U7hJddufUANHl9k+9yEwy
	ISqTIUl2z06aOENecxMGlRbK/RnlI2pYy8pDzJFshZuwkziHfVFlkPKiUGrnMMl44D3gAiFQxoF
	VfFb2zyYwcDac9f4GHMbM/MYgMFwX2HJbBNUapvIzQWknIE+awP/xCljeRQ518=
X-Google-Smtp-Source: AGHT+IHFm4UZarfubQus9XeHuRq9CcZZpSvgMn+7LHQv0GsiN/Tz1ExqT9VocSpHFgTuSVRxvEIx3A==
X-Received: by 2002:a17:907:b98:b0:aa6:1678:fdc with SMTP id a640c23a62f3a-aa616781260mr394843066b.58.1733391335136;
        Thu, 05 Dec 2024 01:35:35 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b609sm66188266b.109.2024.12.05.01.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:35:34 -0800 (PST)
Message-ID: <51d340e1-a62a-4851-a2be-545580bf4088@linaro.org>
Date: Thu, 5 Dec 2024 09:35:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2024 10:00, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 172 +++++++++++++++++++++++++++
>   1 file changed, 172 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 55db1c83ef55..e363996602d6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

