Return-Path: <linux-media+bounces-23128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF8E9EBF9C
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B31D16718B
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 23:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D0D22C36D;
	Tue, 10 Dec 2024 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTyCii4L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5468421129B
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 23:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733874567; cv=none; b=LuQdrhpdtLFIR+eT+uoS6HCkT5zcZHtIhpyYGq4NF7Cu3wqtAaKj8onlEnQxSZPG+yVLDeb+6Uq/12NsyDow0NdbbYzDC70J4pB08e1IS00aZGu7jBju3xwfIiQiw1ucs2KAwFnKq8Pk+A6HsHCTwd7JV9nq/znkVqW4qLNjKyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733874567; c=relaxed/simple;
	bh=kdVOR3Wklu2GB+n1WaWD3NPikmxtKRQ+RYJP3kaNy8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GwieevVEohueLlqK7k3aM0hw6si+q5NxeU9eyTrDW+dGOENqy/aIHVRfjfZb0Bu4u8cMqwhWzlHwJFQjIS9BcrNDkbMfwruvkIdPp7QjWOBH4u1h7/n4wJoZJy/AZQaS7P4gq87wiJD6y98RG2lQC4z/T/19TqowPpxVxwDTgs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTyCii4L; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso6640024a12.2
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 15:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733874564; x=1734479364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0Bi83nwvzBHW9htNaoYyBIkvuLS9x1PWwSOzilvAhQ=;
        b=aTyCii4LWyoa2OHa80DLNkJS4aKIv2vO4xR9PuM8UmJ3ysF3MNmds8O+XAnDMS4POL
         lbcnRX/Td2hFIqMLlZQxw1OIbU9KiZScj8JoVpKPrQQsxU3I1jffXDasJAibMrCy/6wF
         fRoj/zvYlF9PzEbQHDLsb086pWeYTSeek8qMSVXYmSDOia38BOsQXPUMPvGI2yuQsbxu
         SFrn+YY4IfNSVIiW4XD0o91QEOX+aDEZZbZvhGp49gEqnt/YeoQFErxKO9LjUJf1+atL
         NulixXsya6sV0gVGOiJ9G2btnbq2+WUQdg9CEqi/ACl8vjN0mGMtjhmRNpLBeyp2OLhT
         Ht7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733874564; x=1734479364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0Bi83nwvzBHW9htNaoYyBIkvuLS9x1PWwSOzilvAhQ=;
        b=G+6sAo/L4kfD062d/xVIDr5fV0JRA20J2gu+p95FlZ1oozE8PxLq0+CgAIklGqRW8S
         Giubau1DOwltQxAQ4YaFIon7CjpSVV2dhwn/QTLrXyboHkw0JQHshP0Rm9jzBaVSlmlb
         0+YxRMSZ5RNAmytYHvGUtWaXcmjqftHeLlEt+l1MQfjbtIpiPmYLScYV81tJhoXb4T0E
         u4/cVGCfCUjezbMjtu/4vbYkED8h8B3fhoVCr7CKjIJBWvc80yXOs6ICBRNf00N2lcA5
         djKmtdYr9O6Z4hbYqWY3fjQh7XS1atj/nVwGCbxBOW3M2ExctjFoOpY5WJJn+FMyVG0R
         mA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmJxk9v/KGlRgIkMwx7shilvcmKf7O22/w8dLMCrk6XC7ADeunftDM24VJiJ8LqAIhdQLTsjtuOUDf1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNqATMBpFmSl8ECaFBFwCN9+vOlk+r1HDiSKv4w+3BNg6/SHAj
	uOqb0mqolIEXJBlfre/jeN9JJ0BEreWh/fKO+nW3rtdQD/8KtiSvLjIR5k2t/68=
X-Gm-Gg: ASbGnctDYxeTjxEncoqZ8l0HnsN786+NOz6W2xxpBGLHNQe7E8oEot7U+5MePhTLiSy
	5tT4cZvaBc4hTP59u1TrvYBHJXGEN6ZGkK8J7vmVHhYaJOUe+Erh02ANrhWstaa/54dsboUrxxN
	y4fVkAib9G0eObwifOCaRvOL4d4h2L3v42oh9VVxuOQUWXyH4gV+H+GAalelHyapK9nucVaMUZZ
	vCd5g3CzqLC3pkEIEZYIilDKi63RwHZ4MMjXvMdpgikGNONI1DKJSL3MwuPbt5NFw0=
X-Google-Smtp-Source: AGHT+IH3jF2Z/UsyE2JcokH/TitWFHL68lwzNBprD9TUestO/ngKH+QJQZekruekHvuCtiR3BRVDbA==
X-Received: by 2002:a05:6402:5305:b0:5d2:723c:a568 with SMTP id 4fb4d7f45d1cf-5d433094803mr714069a12.10.1733874563797;
        Tue, 10 Dec 2024 15:49:23 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3ee6ddf5dsm4755794a12.86.2024.12.10.15.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 15:49:22 -0800 (PST)
Message-ID: <fe8dbb4e-9d0e-4ecf-874b-be9225ae1487@linaro.org>
Date: Tue, 10 Dec 2024 23:49:20 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670: add camss and cci
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20241210233534.614520-7-mailingradian@gmail.com>
 <20241210233534.614520-12-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241210233534.614520-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2024 23:35, Richard Acayan wrote:
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMERA_AXI_CLK>,
> +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> +			clock-names = "gcc_camera_ahb",
> +				      "gcc_camera_axi",
> +				      "soc_ahb",
> +				      "camnoc_axi",
> +				      "cpas_ahb",

I think you sorted the regs, interrupts but forgot the clocks ?

---
bod

