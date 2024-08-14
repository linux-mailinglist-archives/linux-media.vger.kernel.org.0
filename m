Return-Path: <linux-media+bounces-16276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE6C951699
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 10:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FFBDB22E88
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 08:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E46383BF;
	Wed, 14 Aug 2024 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BABB7KkZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF4F156CE
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624244; cv=none; b=odf4W1f5WNuO74G2n6/hu9OWr2jhuOtikXIdrTsGVD8TnY91NLKw4LbdbsWILGdB5sZu1y5t6iVjqFB0BAwcRAj20RuXXNxuAgvhEFk2AhcCKgK1Aj1YuaLd3OzDjIafwFT8zwpAMeB79k/740DOYJvChQi5YiSPdxt1A0GhmIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624244; c=relaxed/simple;
	bh=1INm8gwkSqcs/W0J2vHqll2aNXyo+Eh6o9uUu0kjbIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qUsORtW6zWL59OaHsKZSOF3cBBizzHKobN/ibYd24emQ7i2dET4fFxILgXIgLyuO9NsPECZk6JTu5J6Cdzzt03KLXTBnt5phoWrh6M/+B6dqlRTEN8PEt8njd4qYuZ5UM2Suzq6uXlz+l+9krdbjjCJ8uP1mzO7sy4rUilfKf4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BABB7KkZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so8492716e87.1
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 01:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723624241; x=1724229041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UMgipy3VwvyCG5PHkuxC9oP/US1a/KtkJqjlrnNFBFQ=;
        b=BABB7KkZZRIgS1F4pso8SKWejhpR/bVH0ZFZXxNMrIi5R28XB+6nDltfZGonUXSc4O
         9BUyiTHHTS5wmRFPYycW9JA1FFYJ/qUhHa4zgGHMprGRGoVquEbp9YGJVn4eUocWO3LH
         0myi0tDWGIsAVqV3ELZYVMCeUzwW6jDEw0u2bt7iJvGsmflaaL0BEvuAEkRvudNyyW2q
         oikPOtgQUbM18xrLYrY47veMoqO5tAn+DLK56brtL9OldnKzpWRmZY9RCew6cd0mbugg
         PEsUNSvnn/pUXaPqIOxpxjKWj4KBagCzQNAISQ7FRcqJcZKT7a6wrCxMM8bsnRTMUdmn
         vcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624241; x=1724229041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMgipy3VwvyCG5PHkuxC9oP/US1a/KtkJqjlrnNFBFQ=;
        b=bRDw4RvJficjg2ALBID6c6dPJIRzy+oLQiPj05fIbTh0wqXg9OTE3cJX4V9RwbdyJY
         tAUO21GiJ9mcJzw1EanLqf5XoBvBv2Qr39ewJpyy+N7CPqJTVxfDLxcMOFnxmXVIv7B5
         L6x+Eyj+B5xjVV8bQgGSOoOmNjQX1dNVW4iJWi3VgazNXP2qpYcV7Dj8GPnxNc8CQrz4
         HP3eL4VXXoOsnBrqTB4+kXcVCnQ+PYuEDSDDzih7bF92bV14N2rQRCzISwuzMhQo2iAf
         DTquoQjVOtg+XjoZXh14kC+y9EphFPhqGn1Md+hPrR9VUt6vxUwIzWe3vgH/IzxV2m5r
         fVCA==
X-Forwarded-Encrypted: i=1; AJvYcCVDoTJ2sJyKZT1pa9yzGoiZ/TfLPLDuwpDtXdxQet+Ewj6vFHddN/zDJscv3pfg51ENLVe5ylDC9ku5qmKq6iD4EyIUql5yVtzqmTE=
X-Gm-Message-State: AOJu0YwpkUa/DuojSNn7xS+rVtg9YvjyxiaHCtgnf9J3djfObysd/TDb
	/4uDupZ2jHDerc9EG+sti7T43DQa1n+WNmnwYcIWiDghjAfZNl/7Dz5NdWMhHX8=
X-Google-Smtp-Source: AGHT+IHoPF5CG8fkC0yFG7NzrIuqSyh/tGCm27v5YMRV0WGZ8VnkjHsth0kvxOODfbnPBiXoo0A58g==
X-Received: by 2002:a05:6512:12c8:b0:52c:e1cd:39be with SMTP id 2adb3069b0e04-532eda5eed4mr1215698e87.8.1723624240959;
        Wed, 14 Aug 2024 01:30:40 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded720eesm12446695e9.33.2024.08.14.01.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:30:40 -0700 (PDT)
Message-ID: <1942b9f4-297a-404e-89fb-0e03400b0985@linaro.org>
Date: Wed, 14 Aug 2024 09:30:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm670: add camss and cci
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
 <20240813230037.84004-13-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240813230037.84004-13-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2024 00:00, Richard Acayan wrote:
> Add the camera subsystem and CCI used to interface with cameras on the
> Snapdragon 670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_CLK>,
> +				 <&camcc CAM_CC_CCI_CLK_SRC>;
> +			clock-names = "camnoc_axi",
> +				      "soc_ahb",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci",
> +				      "cci_src";

These "_src" clocks should be dropped, per similar comment on &camss{}; 
in the previous.

> +
> +			assigned-clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +					  <&camcc CAM_CC_CCI_CLK>;
> +			assigned-clock-rates = <80000000>, <37500000>;

Do you need to assign the CAMNOC_AXI_CLK here ? More usual to specify it 
in drivers/media/platform/qcom/camss/camss.c for your SoC

grep camnoc_axi drivers/media/platform/qcom/camss/* | wc -l
26

Other than that looks fine. Will wait your v3 before R/B.

---
bod

