Return-Path: <linux-media+bounces-12014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7960F8D0A9A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC8628160D
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 19:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF26A1667D5;
	Mon, 27 May 2024 19:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zr627DWc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784771649D1
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 19:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716836463; cv=none; b=kHv/Wa3uQQmkrLXj5ZIb9F1HT1F9d1Jr9149Qj/fzvif+jzbyWQxhbGHqOKuN12893dfkwT5j1yCsFfg8KTCsaw29CVMwtoLCgtTOeabSEABrecJYne5kwQkYFfVHcxY7FXHUxXMfnPOAVFqgqorqAA9Hwfe0Gp7V58ZNGP2E2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716836463; c=relaxed/simple;
	bh=ZJykFrLkMw27Ap6h6e1bwUeJqwTUQU6oAVNdAHpj1/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bRNoFBiirU33Go5jGh96GUABgn0zvXitHldzOEQT5xsLgidstpNQINTBRxxrdVfcohLh9QQCDOaKcT7bVFO7aWaPET3lA82J9rmhMnkYapXdVT0QMA3PnGjxAfnmNegsFsRZyK23BBAS0ADYiqmZseVkSwn9NZZLTVBnYX1z9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zr627DWc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so33120a12.1
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 12:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716836460; x=1717441260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VTJ3szqoHmc1+yUf2WmkBbMeHBDSss7x5+bTQB5BW00=;
        b=Zr627DWc6Nb6ESeXj2t4BtxB2RK7aGgqVyCjB9arygWsAd4DI9g/wE21/HNewV3YG6
         xjgfVO2wuV8E6kwUA8qydPlnjGeBQYa6VnZlpDP8WvxU/N0ld2cZDzezPCIUzse2dUIv
         /OnD26u/LDWNS8GeSxK48rloPlVJPYurZFZ5KsDsiY2+opQLmArVWrqmZEI3LjEm1Gqe
         Z45pm64STqeuQPdaGeqd/1yx77++/S4UsqzXsRzxLUFlJhBosR2eja/7uR90tbPDkQtI
         AgM4o4rE1a/MEjLN8RxpCDhVWn6uzWUJicnZS4bDTBMyvLexEsgfabrjAcLAHS7AeCkQ
         0uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716836460; x=1717441260;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTJ3szqoHmc1+yUf2WmkBbMeHBDSss7x5+bTQB5BW00=;
        b=HY9FH6KyfIYoibXaRN1KihnSv6kMY2X1EHhmjdqEgOu5cGKrPnnfA0w/LCTwCw5nDX
         ZqroLLMXu94QVVGT/R8qaTalGnAw3cABtJo3SQEubauygHE+YQ1XK2BUm8L+BfgwwlJ6
         moFLf05cbb5faepXv1IuTrdVwQyc6nEec4hOXA1S1am13LFZGhp8cmJMhPAE5OyjVPCV
         R4/IpiaN7NnGL5eLESZio2m6VQrjancjl7af+jlQGqQj/agA+Syuhey0WZ+bzbr+1ZvU
         Uc4vVbG0iwduf6SL/5mLmRSaKL3b1AefvDvUkJqV3aNvx/L5+8QvhqlonwqIgMpQEnMi
         eMwQ==
X-Gm-Message-State: AOJu0YyNwn6glLXeZ5ZNQZdevZIAcuL8li5yZO/oSxXXc7HeVatlMuZ7
	GgWon3z+/iVN8kjI5cM0V8oQfMCR2JkCfn+E3QO6l87RNVYws4vxO7oLUxqs02A+5HkmffhwZYI
	O
X-Google-Smtp-Source: AGHT+IG3MBNURabuDGXyBaUuxzKnC4IYrZQLyRMJSIaOzglHPMnCFJCoH6toE5x/eK7T1RxZcj5Skg==
X-Received: by 2002:a50:a402:0:b0:573:5c4f:27a8 with SMTP id 4fb4d7f45d1cf-57851a1ed5emr7722421a12.35.1716836459874;
        Mon, 27 May 2024 12:00:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57868fbbd8dsm3996346a12.8.2024.05.27.12.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 12:00:59 -0700 (PDT)
Message-ID: <ceab83fe-b741-4f9e-8b0c-9de3ca79fc55@linaro.org>
Date: Mon, 27 May 2024 21:00:57 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
To: Sylvain Petinot <sylvain.petinot@foss.st.com>,
 benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240521162950.6987-1-sylvain.petinot@foss.st.com>
 <20240521162950.6987-2-sylvain.petinot@foss.st.com>
 <2110ba34-658e-4d60-b524-2f5ead6c8d3e@linaro.org>
 <77fa3ed3-2341-4106-adf2-ec8bd9de91ff@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <77fa3ed3-2341-4106-adf2-ec8bd9de91ff@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2024 15:14, Sylvain Petinot wrote:
>>
>>> Signed-off-by: Sylvain Petinot <sylvain.petinot@foss.st.com>
>>> ---
>>>  .../bindings/media/i2c/st,st-vd56g3.yaml      | 132 ++++++++++++++++++
>>>  MAINTAINERS                                   |   9 ++
>>>  2 files changed, 141 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>>> new file mode 100644
>>> index 000000000000..22cb2557e311
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-vd56g3.yaml
>>
>> Why duplicated 'st'?
> 
> Legacy : our first st-mipid02 driver was upstream this way few years back.
> 
> We have 3 options :
> 
> 1- keep this unpleasant naming to keep consistency with st-mipid02 [1]
> and st-vgxy61 [2]

? Unpleasant?
Please follow generic rules. Filename must match compatible and
compatible must follow vendor,device format.

> 2- rename this driver properly ('vd56g3') and keep the two others the
> old way (I personally don't like this option)

We do not talk about driver here. Does not matter.

> 3- rename this driver properly ('vd56g3') and in a second patch rename
> the two others drivers.
> 
> I would be interested to get Sakari's opinion on this subject.

About what? Renaming drivers?

> 
> [1]:
> https://elixir.bootlin.com/linux/v6.9.1/source/drivers/media/i2c/st-mipid02.c
> 
> [2]:
> https://elixir.bootlin.com/linux/v6.9.1/source/drivers/media/i2c/st-vgxy61.c

Howe are these drivers anyhow related to the *binding*?


...

>>> +
>>> +  st,leds:
>>> +    description:
>>> +      Sensor's GPIOs used for external LED control. Signal being the enveloppe
>>> +      of the integration time.
>>
>> More information is needed. GPIOs coming from LED or SoC? What's the
>> meaning of values?
> 
> The vd56g3 image sensor provides 8 GPIOS that can be used for different
> use cases (external led controls, synchronization between master/slave
> sensors, external sensor trigger, etc.). This submission supports only
> the first use case: the control of one(or multiple) external LED.

What your driver supports is not really relevant. Describe hardware.

> 
> The vd56g3 sensor family are optimized for visible and near infrared
> scenes. In NIR, external IR leds are generally used for illumination.
> 
> With such use case, a led (or a led driver) can be connected directly to
> one of the 8 GPIOs of the sensor. On the driver side, when a led is
> configured in the dt, the driver will configure the sensor accordingly.
> It will also offer an optional "V4L2_FLASH_LED_MODE_FLASH" control to
> start/stop the external control.
> 
> Different signal modes are supported by the HW, but the default
> (implemented) one is a "strobe" mode where signal is the envelope of the
> integration time (IR led is on while image sensor is integrating).

You did not explain the meaning of the property. Please describe the
hardware and the meaning of values used in this property.



Best regards,
Krzysztof


