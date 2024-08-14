Return-Path: <linux-media+bounces-16277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95E95169D
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 10:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51F971F23668
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 08:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47C5A13DDC2;
	Wed, 14 Aug 2024 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sf77wpav"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218EE156CE
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624272; cv=none; b=i3fd/vNo5Y0CHYTZUoGgpHSxm4vKUqeMAf87BWhUQS0vj7Cfwe1cyoDt8UUlCASAuNu48oH9/g6eGoUmKXU7SYsXBdIRb+t5AC2eJ6dz+UA/vzHFdI+k0Ycunxdu+AEF85Jhxsk8r7ufaQNoAf/FH9fkxfUD3xde4EA3I5VQsFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624272; c=relaxed/simple;
	bh=WM4wGLw+bCnNhcdXmhghAEKcwd5gTCQsqiAP10ujOKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ukZ/vtzfUM2Yp3Zx6T7zq6D+Yhtd+IHzxsiXGzTDLN6DOPynRltAd7ayczIy6d18+aK18iDgVjWYG0T53aVSE2zyFeMi+hR1X380ZGtY6NpsMLev8FVCoWNbxfI8d5IYsivFzNGicjmOByNwMcRPM7H463/W9Fpr7SgoXP5OLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sf77wpav; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso8683299e87.2
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723624268; x=1724229068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5gwQzCwBy7vN2/2RxMQ1HqIkB84Cqquw56cycMRPu0E=;
        b=Sf77wpav0iXojGKkcNcbRPAHJzjGxwacZ6dcjKd0lS6dm/GJUzEVbC36tLIFB/r/ay
         awU7QsArvv3eCB0zWoES/mTOMYLhg/RuGNlFMwDKg2GW+KbgLoh3Xkrl6hfFaYMD9cSG
         BLambWR0TVs6HvaSBmvRn44O409PrXQDTigcOBckk+JxDcjsdyJDBgoubNV9KGZaSnYW
         x2nbIhn6BYIWeUNhvv6lPXP+aDTFxw3lvvmbd8ndWtiMvcV8UUDTP5TvQl0lnnCnmY9x
         JUj1zYjHD9MRoOXyiWpO4dcOeGFoOQEDuOnt3KTKPlz2wmbRvx0dB62PK8vA/sROdh8f
         2eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624268; x=1724229068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5gwQzCwBy7vN2/2RxMQ1HqIkB84Cqquw56cycMRPu0E=;
        b=dXX4RceqmyDvLSKI1iI+j+1jziyHKj5cX1qf8HMT9tksN8lyHxFyTgRm3M2ED87PzA
         i2Y+vwZIvUA7YXXHg0BMZgRoL/CN5JjCucw4eLas/dcQ3CY7mAAO10jOtZFT7pk5xTni
         76yTejfzH1F4PpEd0GwRsncNyqlLKaC24avDxDXeCaBtMGACE5gGwQsqWje0axvAVNer
         Uj9MhOsbMmqXtgbLDdkNJr1qI1v95b417qfiBufRPxJyykrg0gBut1618xxBtS20IYHP
         9GDs4loK3GtGdJP8qhimTeoZGkRJPWTiLIp67P85VhmHOP6Ixlkm29A5/L1WB4+Um+Gx
         k1Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUjLrVY+ZejBm8dnbwng1jYOudxMfOi6SaeTIZ+U9UnVjXf/WMopm8jaSJYcGN7c/OH4gk5sLypinpbpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhH3Hs4Z5Pck0xlOHBtQMghxwjJNAer9xRveuc8CE7mTgb3IVm
	1L7+pR+KZ7ddIkyPWmM7dW9mmOK/RdWy5qqnuEYvPQHBRuQC3UYOS+Hi0Fdbt/g=
X-Google-Smtp-Source: AGHT+IF6QwpbeJz7sN4rejcITBP96MMp53BWoiX+ED7Mk7W84b6OrlnrFjb3C+iqG3cwrNXSoLTWOg==
X-Received: by 2002:a05:651c:50b:b0:2ef:295b:4946 with SMTP id 38308e7fff4ca-2f3aa1b3ba3mr13953301fa.4.1723624268052;
        Wed, 14 Aug 2024 01:31:08 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded58266sm12718605e9.42.2024.08.14.01.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:31:07 -0700 (PDT)
Message-ID: <487eb44a-be4b-4434-bf12-e3b679ddc42b@linaro.org>
Date: Wed, 14 Aug 2024 09:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm670: add camcc
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240813230037.84004-8-mailingradian@gmail.com>
 <20240813230037.84004-12-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240813230037.84004-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2024 00:00, Richard Acayan wrote:
> The camera clock controller on SDM670 controls the clocks that drive the
> camera subsystem. The clocks are the same as on SDM845. Add the camera
> clock controller for SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 187c6698835d..ba93cef33dbb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1400,6 +1400,16 @@ spmi_bus: spmi@c440000 {
>   			#interrupt-cells = <4>;
>   		};
>   
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sdm845-camcc";
> +			reg = <0 0x0ad00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "bi_tcxo";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,sdm670-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

