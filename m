Return-Path: <linux-media+bounces-37570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B1EB0307B
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 11:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B170189614A
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 09:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F471EA7EC;
	Sun, 13 Jul 2025 09:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fvh58qfK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8515B0EF
	for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752399266; cv=none; b=Z7XKlV3ZvhiLLLRpaPwCxT/l2e3f1s/wwskiwLIZaOeReXrVxKhOr1C4Ntem+9wIqW7kS6A9tzxXXenkTxYim+Pow0v0CNDk6FeEwAO5Sddwg3US/GRnKeqThjVLGqlDaoWuxVWWXJAQ4eN3F2GkHXw9lXEH5wgTf5u7PSqHei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752399266; c=relaxed/simple;
	bh=nvYWDpwOyIKO8lUvECljv0v3IuZgo2JS4glB0ZiVqsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9dSGTig0zXWdVSiznCHRFooO2Zde6f7m26iQ7RRrAMAteJ2LeRs//+K+flGm0vJmxHC5BJlj9p7te+HyEZVqtc7LL1ztqQtF672nh7hjIoZIGfeZYhvdJw8W4rPNG3oGJUMtEvHs48pXdCkcc9ZqG4cr0CnvRo5clFjsItOhG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fvh58qfK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso487136f8f.1
        for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752399262; x=1753004062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=45s3aw7y5fpK20LsiI9PskSV8w/X1Mx3/1QFBvNQhok=;
        b=Fvh58qfKxje30bW2bkeaR1sTpxfp3K/m6lj2aPOjN709dQrSPe1YecU6fncsmHDA2s
         K5BGklrb8wVArlzSJ265bIPYxz4AaBop17ddbOA/J2ygksooyzxedZ2YJYQLlE0/v0mb
         Tr3NDjtkqSSOnchQo71DrvJCvBW9s+JSeRq89S8jwXJQnXpvc2/x2nv4Tg+NDJr8hY4V
         QuX84UsH/8BjpS7qZD9Md6dSPa5Jgu8bXncRxdsRsYtw6f2eqBS2xc+N9Ap0cn0hZ9am
         rtkk8oDJlAOiomKGABiEIzw3hxwEuWyGRrOWSnEC615Bp5dWS2bA0IB+MCGN7kFfhBeI
         2sZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752399262; x=1753004062;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45s3aw7y5fpK20LsiI9PskSV8w/X1Mx3/1QFBvNQhok=;
        b=UASPMGw7rdxzsTjkSKfzMS1sI+G+h91zzHlOULoMOn+hOLcOTVbi0LPUQcKkC00cv8
         pJeeUi3HsxhZYALAlWiWenhwgsPwPidtE0BlefbgLdnUKHbRqAtK4WLCm9qcPxC7VTbd
         t1928R5W2sG0KEKRhXTkgKuwsB/0gr9V9ZWokquhOtp2d85yoaj1vY60RNv8cNfokzM3
         yhcP3Gfwt9PJ/7cYPD1sh42YTV+5XxQc11NoJxMmoVL6qJfIUz0H7+nSgT2Z968iqtXG
         h+7sHjQsE6to1Nm9Uxqu3FzWoJIhiAHy46hFtgu3Z2u8ABYQxezckr4Rg+ubB0z5y2TH
         mu3g==
X-Forwarded-Encrypted: i=1; AJvYcCUcMSu1udNDavxUjS91G4qllaCg5GrQf5aYMzY3JZQyz7wwzNrRihus0WMq+7d0gRUbzmMKoAFdKmXQlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkD+oJJU9kpESesTD63+/gK+WZzTT+ZJCqCfeNtwYPIR4Dn+Xf
	3c53vgBbdnv5GGNX53ydYbaEynBhZlFxegWN2agPAYgNmWW5udzxnslJzDvplhmNjwU=
X-Gm-Gg: ASbGncv7MdcBgusrq25FBKn9HLPVwoJPamEZqKRIa153437IuQwa6BFUAPTFX82i41n
	VR2e6skhT6gG2c+i+5bjTsUx7slP+Wg7v7A47hjXlnXbyyOw3lpSy6rh/e/+d52ClB8C0ObE74e
	TxvX5sUCTsl8+M8spLfS0eY4zhFLk3dlTcJdyjrw+0o6LfbuMOHJxHtEByKcPkyia4Xx4ZxQo0a
	RNgCfEg1HxpjcvvPEqziw5RjhV/yjGNh1ORnpApjilV6QyYVCAQGCrk9Rql3lr4qBbrb8I5agIa
	tHgx3qJxCtnAm+LNyYWC6qp8n7EWEtg57YXVvxCKAzdgEBWBPt8eNVL8BqjbuuvUW4RvFg85d48
	fKH02hgsa8CEX9RH67e7d0s80cbdUeSu4L9tnMGSfnA==
X-Google-Smtp-Source: AGHT+IHpGXWacaJnxOWB6dpQstz/rFAG1xykJjgK5RpjaY2n6Qir2rqS2Xejka+NEUqYuDBLcH9g6Q==
X-Received: by 2002:a05:600c:3b0e:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-454ec169c83mr37004085e9.3.1752399261864;
        Sun, 13 Jul 2025 02:34:21 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5050d34sm139469995e9.9.2025.07.13.02.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 02:34:21 -0700 (PDT)
Message-ID: <03ba99cb-18ef-48eb-9504-cbce752c85fd@linaro.org>
Date: Sun, 13 Jul 2025 11:34:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/15] dt-bindings: media: qcom,x1e80100-camss: Assign
 correct main register bank to first address
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-1-0bc5da82f526@linaro.org>
 <f4fd544b-bd5e-49eb-83d9-290f77e503ef@linaro.org>
 <6ca1b24b-5f9d-48e7-9afd-7dac47b486b1@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <6ca1b24b-5f9d-48e7-9afd-7dac47b486b1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/2025 11:12, Bryan O'Donoghue wrote:
> On 13/07/2025 09:15, Krzysztof Kozlowski wrote:
>> On 11/07/2025 14:57, Bryan O'Donoghue wrote:
>>> The first register bank should be the 'main' register bank, in this case
>>> the CSID wrapper register is responsible for muxing PHY/TPG inputs directly
>>> to CSID or to other blocks such as the Sensor Front End.
>>>
>>> commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp unit address")
>>
>> I have next from few days ago and I don't have this commit.
> 
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/1da245b6b73436be0d9936bb472f8a55900193cb
> 
>>> assigned the address to the first register bank "csid0" whereas what we
>>> should have done is retained the unit address and moved csid_wrapper to be
>>> the first listed bank.
>>
>> This is confusing. Did that commit change entries in the binding?
> Fixed the unit address.
> 
> What we _should_ have done is put csid_wrapper as the first entry.

That's different problem then. The commit fixed only DTC warning and it
was perfectly fine from that point of view. I would not refer it,
because it just makes impression that commit was not correct or even
complete.

> 
> 
>>
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>>> index b075341caafc1612e4faa3b7c1d0766e16646f7b..2438e08b894f4a3dc577cee4ab85184a3d7232b0 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>>> @@ -21,12 +21,12 @@ properties:
>>>   
>>>     reg-names:
>>>       items:
>>> +      - const: csid_wrapper
>>
>> Anyway, this is ABI break, so needs some sort of explanation in the
>> commit msg. We don't break ABI for cleanup reasons, unless it wasn't
>> released yet etc.
> So I since we haven't added the node to a dts yet which to my 
> understanding means no ABI break.

In-kernel DTS is one of the users, but not the only one. The kernel
drivers implement the ABI and for them your DTS does not matter. You
might not have DTS at all and still break the ABI. As mentioned in
second patch - the ABI, expressed by dt docs, once released in final
kernel version becomes the actual explicit ABI.

This is the one which you should not break.

Kernel drivers can sometimes imply ABI (e.g. undocumented one) and
that's another story.

Best regards,
Krzysztof

