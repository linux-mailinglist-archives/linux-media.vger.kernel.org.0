Return-Path: <linux-media+bounces-17761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 274BF96F277
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 13:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 448511C21AE5
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 11:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AB51C9ECA;
	Fri,  6 Sep 2024 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nw6k5K+C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB123158866
	for <linux-media@vger.kernel.org>; Fri,  6 Sep 2024 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725621150; cv=none; b=A6HdOodRU7siRo0gpX6PqonFuagCuIiUcuH2l3d/ruPkFgNEubHYHIem2oC8y7fL1zgee9tesLmTp4OzeH0djmv6uW4ZZWacq+h+R4M4x9OGCeZs6sgsL4EBLyRxsokdLpcZg0qloImoGyYMvMTu9GLFZ8gItmXMMZkdJb49j2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725621150; c=relaxed/simple;
	bh=FHH3wyQ7zY55R9CADvoIO5OcTdzNx226agmLIAzSrhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhrRkgoRuSUjt2c1hA0wjcRWvaBVHiRaAkbARXHLTVxL1v6pGPpOMwhajPXo8T8/nU4WtqD3H30JLjWRMt4qtS0pPVQQ7DmYfeECyNowNIIRp01ZKDlwZ8ShsJjj6mN66DlefzQxUG9tJoNXy+f7G5fZG1JaaEyYd2/NUIao83k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nw6k5K+C; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso281565666b.0
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2024 04:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725621147; x=1726225947; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uc2+zdjiBpu46m7tub9zqiCMuodzrCPOa9EZooZK8Qc=;
        b=Nw6k5K+CzDyDOiRFVgiHoIgbdTZqfCj5ppP0QdTScyXJ8er0NG9dDH6Bzkmp3lWgP5
         Dfl/ouPwNj2s24NAo3vxteFlIS8+pzAqvLQ3ha+V9p9kXgOyGrvXKJ4YOArFOO2jNV8Q
         YhupLW8QSCc9OE9d2yiqJg7MDl5STkTisvOm1+NEfNJC5sqmuOEEZv4uK6kOiyWAb2lA
         VXQaMZbm3YBM255UaFmbcMrBvrshvMfKAlXF1dmIOjy8sKSDEngpcJftHvncWfFk+FxG
         Cj2zWKzHp0AkKOHTa4uXik/MGgdNpOXybXjBdZEeRnKkZh761eOKbWPTPVSsfo+hryaP
         oKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725621147; x=1726225947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uc2+zdjiBpu46m7tub9zqiCMuodzrCPOa9EZooZK8Qc=;
        b=p5AK0ogZU55JyN+gHveU7QaStW4g/RtKe2AdAJUZaPIK/B/BD1LP/nir1n7LGiw+nW
         4LoHn4VOCV/wSKnbf8GcGxBWenNKdcC8VrXSlPv/KmYemTwWy9KZHk8w7EE+RgX7BShV
         jQEEAlSG7EevEG32B7TasPoekSPg/J6oXkPuM2iIMr5OeB6sF6crKBx0kUQ9ENYHc/DK
         YcjzDLTN++LSBzyIJJu9pWyRFjuZS2AqLTUUheWJ1UUE8KBVcaBBAQs0FLYVDXW2HP2U
         4rzzvZU11j9keILDS1Gd9Xa2VDl/cegu11xpvSLbFcWctQwA2jdwF6kFzbszQO9LoHnx
         HKDA==
X-Forwarded-Encrypted: i=1; AJvYcCU0c3S0f+PELNzmLftbzYAQ77YREfJdGclsaAWb5gCUlNbj6O1tIuwPyQV/HSMZz63HGW2nHh7B/Hcvdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYeC8kbirN33cLwuoCD9A+5pDynP8V/mUlHtWUkfKT9ywrOlN9
	mm8da2BlU4gUD65xmlGjIRx5MNNc1pZdXiOqSDQi3JOn6u2byeCF/5VpFAAvYiU=
X-Google-Smtp-Source: AGHT+IHLGnwvuz0Zuk0iYkufW1lBlP6YOjby/D3zebopxnLANfHrrf5x7pPi6Md1UNB5/c88v20cNQ==
X-Received: by 2002:a17:907:1c22:b0:a8d:cef:bdd with SMTP id a640c23a62f3a-a8d0cef18a5mr44043766b.10.1725621146924;
        Fri, 06 Sep 2024 04:12:26 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8c8cd01fbfsm26513366b.123.2024.09.06.04.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 04:12:26 -0700 (PDT)
Message-ID: <d94c322e-b26b-4f1b-bcb8-187142dc25fa@linaro.org>
Date: Fri, 6 Sep 2024 12:12:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sc8280xp: Fix interrupt type of
 camss interrupts
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
 <20240905164142.3475873-5-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240905164142.3475873-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2024 17:41, Vladimir Zapolskiy wrote:
> The expected type of all CAMSS interrupts is edge rising, fix it in
> the CAMSS device tree node for sc8280xp platform.
> 
> Fixes: 5994dd60753e ("arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 40 +++++++++++++-------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 80a57aa22839..aa2678eb3bcd 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3882,26 +3882,26 @@ camss: camss@ac5a000 {
>   				    "vfe3",
>   				    "csid3";
>   
> -			interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 762 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 764 IRQ_TYPE_EDGE_RISING>;
>   			interrupt-names = "csid1_lite",
>   					  "vfe_lite1",
>   					  "csiphy3",

Yep, downstream defines these as rising.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

