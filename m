Return-Path: <linux-media+bounces-3213-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F428244EC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jan 2024 16:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA33A286CD3
	for <lists+linux-media@lfdr.de>; Thu,  4 Jan 2024 15:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D598241F5;
	Thu,  4 Jan 2024 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldJYBbwd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464E241F6
	for <linux-media@vger.kernel.org>; Thu,  4 Jan 2024 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40d5a41143fso5246275e9.3
        for <linux-media@vger.kernel.org>; Thu, 04 Jan 2024 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704382072; x=1704986872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtdq0SrgO0k3fu2GrlQuTjv3qKZgCLrSfrhsu6oYX/o=;
        b=ldJYBbwdRLZRG4AruKy4uGnHTmGgjCtXHHg0HWVgiGVOTmDN/z7ZcGx/9uxBrdUieg
         VaXTCXB+SB6ZAziwGQP7NVcWA7EmfzPfCKUEOs5PeaFVmoTGzXF2DJJjDAoNselQzymM
         meuR18i/0EXRTfSL5E2O/8pN8HKm84FV+y/HajE3Tub6W5sm/S5HMY03E9PiVKe6OE5N
         ryi6P0OgxSDPma/zvHdFB2qcLA+xteA7XXIo3GFbAyA0CvUTp/V/FFKl5pHxDdLRcWJ6
         RItKfCPxuGqQ7Hnzmhq177yN2IPNGLD3evL7MRGoKJh6ruRapHPpVT6MzpSMpL/E4g5r
         A1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704382072; x=1704986872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtdq0SrgO0k3fu2GrlQuTjv3qKZgCLrSfrhsu6oYX/o=;
        b=GUTD4/bVlSDb+pv/2aG9NxO/u6dQzsz0BVLUSRWdeRI5XGWGCJM5i91Wto06ZENIB/
         sktNit0CaOTEHa9vp9fLOE3ie/wn+BKJFO9NgPYE3kv12JUuNf71fTO6YWUJmxrLfu9a
         T7rjtm86nB6E8SJdouDCr9505i7/i/eolIcrr/xFCzWUU5zDBbk757YMw33MdF+lyGzI
         dHEQRFOkJ4bzoCvv5oLuUUlDyJ6xVQmw6EGEq3ReGUzvb+sdQNYs+7Wbh5QPb5AL0yI8
         uX4/EwRDgTX9nN4A6iE/EWKGBZGk8tCYug0j4lyEz0WdMkrS/xDPEX92dCNEETyKGjBn
         DBdA==
X-Gm-Message-State: AOJu0Yy4GGrxd21xI55/rVOxAn9wE8X1Wy4xGMPHqvhzmeFrJm84pu9A
	5Lu/CEfvACSzklbVLpwXD7xSpULi7nKgAQ==
X-Google-Smtp-Source: AGHT+IFmi1/jiWhUQs7PjY7Dh23Nh9Tlpcyy34mUPD3sb3aLzgD0Jvux4q5yB79GBUpKiBF7aD/FmA==
X-Received: by 2002:a05:600c:219:b0:40d:60a5:b34e with SMTP id 25-20020a05600c021900b0040d60a5b34emr409320wmi.109.1704382072426;
        Thu, 04 Jan 2024 07:27:52 -0800 (PST)
Received: from [192.168.100.125] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c35d000b0040d7b1ef521sm6122802wmq.15.2024.01.04.07.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 07:27:52 -0800 (PST)
Message-ID: <7744ff07-80e4-4010-b7af-0d6d74ae31db@linaro.org>
Date: Thu, 4 Jan 2024 15:27:51 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sc8280xp: Add CAMSS core dtsi
 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240103-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1-0-abacaa63a961@linaro.org>
 <360ff767-e48f-4a02-a2cf-f6c99048fd93@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <360ff767-e48f-4a02-a2cf-f6c99048fd93@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2024 12:42, Krzysztof Kozlowski wrote:
> On 03/01/2024 03:18, Bryan O'Donoghue wrote:
>> This series adds the yaml, CAMSS and CCI dts definitions for the sc8280xp.
>>
>> 4 x CCI master busses
>> 4 x VFE
>> 4 x VFE Lite
>> 4 x CSID
>> 4 x CSIPHY
>>
>> Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-01-02-sc8280xp-camss-core-dtsi
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>> Bryan O'Donoghue (3):
>>        media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
>>        arm64: dts: qcom: sc8280xp: camss: Add CCI definitions
>>        arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition
>>
>>   .../bindings/media/qcom,sc8280xp-camss.yaml        | 512 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 563 +++++++++++++++++++++
>>   2 files changed, 1075 insertions(+)
>> ---
>> base-commit: ab0b3e6ef50d305278b1971891cf1d82ab050b35
> 
> BTW, this also does not help, when used on random commit or random tree:
> 
> $ git show ab0b3e6ef50d305278b1971891cf1d82ab050b35
> fatal: bad object ab0b3e6ef50d305278b1971891cf1d82ab050b35
> 
> Best regards,
> Krzysztof
> 

That's a b4 thing I think, not sure what it uses it for.

---
bod

