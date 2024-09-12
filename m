Return-Path: <linux-media+bounces-18229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D682397732B
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 22:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 073471C20B60
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 20:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE011C2322;
	Thu, 12 Sep 2024 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rj26X24R"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F101B1402
	for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 20:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726174637; cv=none; b=COv6k3jOIYmNWRjpcZNCKtHTIz4JtAAM5RWWKXQyHFTXR3Ij8EPJW7ZCxWueQJAEV82ljEtSJPzfA2PqWhTrRTnRnBWrtMKs1CbBJ0nP6APwo9858Ghzxj0YAs3l4GpRUefQq6eNoq/Y2yIWyU0mmSnzTgdlmoool5YtMXDg8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726174637; c=relaxed/simple;
	bh=KJviDHZ9lPMrCKs9Y16MulHLEhykyksuBhbmdkvKEt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2JN3LqqJq+jyuvgEAOpmZWV+KpJDEZbZAPJck0qNQS+ZJfY2o73WfxgWuYJESU/2aLSJeBmqfoBVD+JzBXphNK8q/SclNA8jf3JuM7kB/MG/4hZPzHZk10GF8IR2CvWT2uoP4HWgtJ5pOiqU77nzHTW67cUJlQoO8UCrfmuZ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rj26X24R; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f77d142aa2so1851851fa.3
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726174633; x=1726779433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VEN2kvQPgr1Ms7pd8H18XzR4Akxhw4D8Y32gs8tCUBI=;
        b=rj26X24RZhaVvv9w0zswB2/K8IEyIqWc4uTFz9fJvw/oChVhjqO5s/XTa8sQzQhxMk
         HBCWhJFVbblkhC+KahPfXSC1yiJjVszSJcpfMmH9+HYBadd2Q4FrA2GPPtM4j6Ek0Za4
         d74Fwsc06P5nGhIDafJgLLbDG4zeZiAqw7SAzAdASWk/5b5O3oDxScPe69oY9Cvcr/V7
         ODvvITP/D/q/b+YuMt6+C/YC2Wr/Dh0jT7eQYW+e77xn85bMI/K/8rEmEipaVj+7zSQh
         LToD1WKa59n033SK2othiQBbyJLY6ps7euQ8CZVp2JfhgDZjIDOXRqcrEtSBmu4oQM3n
         R72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726174633; x=1726779433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEN2kvQPgr1Ms7pd8H18XzR4Akxhw4D8Y32gs8tCUBI=;
        b=gxBqw7voHclPuXxqMcJvBncsQ1F4vn0VgyCSTxdZTAFh81wQ4CzzAHG2S4/FDUxLzv
         vd+ekntP73CIsZwIinN2TUb63JQFY87z292J4YB0V/ZJBSe+2JO6CGxJ4h7Dinhym0uV
         MlBspTZq5hXmJs1wKLN8e5EEuK2xS+RuIRmH9noLNM/rZ3qn4+WrcgkXP+W2CRrZALIw
         IpGBxo95Ylkr73iWMoiSBewTDkuH8VQ40euYE024ShphAbhl7yqP0uJGIm8Hr7GyBQFS
         PQ1DVWeDjlsCyLE/VODoNSq8P9RLwN93qrDQEkCy+Ecb0amejUU2iidFkZ5j6Q+GgF6h
         L87Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyWx84OcU3a3+eeBvV11oEIwo4DvAxBy3ozr7pGy0XshICSObW/+yEEeUYzfNbNqETU+mJwOnCAGk02Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrp6Dckt9/1WlGWvpI4amR8htQ/VX7UHjIxtcTDhvOCUJfm94k
	sdXuiGD/IxaahQ8nTyKLiwwHiDMJ+fO6GpvdmtIPL8auD4K3jAUXWehIrPQw4vc=
X-Google-Smtp-Source: AGHT+IF5y36oHtilMrxdEGv+5g780tzqe3ogPeLW1QGZrWL44AwZEE7/E7trA6yIla2NOXosmijcCg==
X-Received: by 2002:a05:651c:2203:b0:2f7:7f76:992f with SMTP id 38308e7fff4ca-2f787ee1554mr8031811fa.6.1726174633366;
        Thu, 12 Sep 2024 13:57:13 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75bfe7f1fsm19904211fa.11.2024.09.12.13.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 13:57:12 -0700 (PDT)
Message-ID: <6eadc285-f413-4bf0-8795-59ff19c734da@linaro.org>
Date: Thu, 12 Sep 2024 23:57:11 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
 <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
 <da60cf71-13a4-465d-a0ee-ca2ad3775262@linaro.org>
 <97e4f888-1ed7-4d82-b972-3e0b95610198@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <97e4f888-1ed7-4d82-b972-3e0b95610198@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 9/12/24 18:11, Bryan O'Donoghue wrote:
> On 12/09/2024 13:44, Vladimir Zapolskiy wrote:
>>> csiphy0
>>>
>>> vdda-phy-supply = <&vreg_l2c_0p9>;
>>> vdda-pll-supply = <&vreg_l1c_1p2>;
>>>
>>> This is also the case for csiphy 1/2/4
>>>
>>> So, I _don't_ believe this is work we need to do, since its the same
>>> regulator for each PHY.
>>
>> This is board specific, and even if the separation is not needed on the
>> boards
>> you have just checked, still it may be needed on some boards, which are
>> not yet
>> checked/not yet known.
> 
> There is a Power Grid Analysis document which specifies these rails @
> the SoC level and assumes you've used the Qcom PMIC to power, moreover
> the PGA re-uses the same regulator over and over again.
> 
> You _could_ provide that power from your own PMIC which provides the
> same voltage range as the Qcom PMIC you haven't used. Even if you did
> provide that from your own PMIC you'd have to provide _separate_ rails
> for the various CSIPHYs before it would be required to have a per PHY
> rail requirement on this SoC.
> 
> Are people really powering these SoCs with their own PMICs ?
> No probably not.
> 
> Should we add the support for it anyway ?
> Maybe.

To have a set of regulators is a matter of proper IC/IP description, actually
here I see very little option for a divergence or disagreement.

> So to reiterate:
> 
> 1. csiphyX-vdda-phy-supply
>      csiphyX-vdda-pll-supply
> 
>      In the dts and yaml
> 
>      => The names should be generic from the perspective of the driver

As for me I don't care about the particular names, somebody else can care.

> 2. camss.c::csiphy_res_sm8550
>      [0].regulators = { "csiphy0-vdda-phy-supply",
>                         "csiphy0-vdda-pll-supply" }
>      ...
> 
>      [N].regulators = { "csiphyN-vdda-phy-supply",
>                         "csiphyN-vdda-pll-supply" }
> 
>      => The regulators for the PHY should be defined in the
>         PHY resources description

This is obvious.

> 3. Required not optional in the yaml
> 
>      => You can't use the PHY without its regulators

No, the supplies shall be optional, since it's absolutely possible to have
such a board, where supplies are merely not connected to the SoC.

Hence there shall be no requirement to describe any non-present supplies,
which is a legit case, if there is no connection and usage of the
correspondent non-supplied PHY.

--
Best wishes,
Vladimir

