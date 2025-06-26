Return-Path: <linux-media+bounces-35949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EA7AE9CBE
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 13:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 679035A0152
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 11:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A0227510E;
	Thu, 26 Jun 2025 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/bBJboM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B917BA5
	for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938072; cv=none; b=sj8xHyOf1Zdrl6AJCkUJ8hsIl5Gc3kEj1OqlC89Pgmua6kx4h3dV1cA7V1y9+AWLAMKKzHL+bqyet6PGd4BwbCAMbci3B4eTEVCrJOhUJ3xaXwL+huxcVJy61EefOLtH4GMvUoCyW8jR5DhlKGfOaZ7l1RRRpRp7RC2Mms306lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938072; c=relaxed/simple;
	bh=23sqk4v2eqYQR4dH0ahZ30jSvULJQQx9I0FVKFqv0Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=II+pVO4RwrjRChng6BizrbI+ohw7T5NCU+kcs+/QvWdt32du62I76wFHypdNyxhUeLQpnTjHmjJXTLDJh6wHCdSrXJUorCPw8FjpzN4pNXiclHD2GTvPqRSMWCvFZGVzjBdSXBpk3axW+qmJYRsLANclD96fJfHc7M860kN0+vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/bBJboM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a365a6804eso516858f8f.3
        for <linux-media@vger.kernel.org>; Thu, 26 Jun 2025 04:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750938069; x=1751542869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P84028oJYeMHhuu45/JE+9IuzDSe16FA2FfJuutHg1I=;
        b=k/bBJboMSoALuPjjYq5/Itd8MYr70oapxNIzIRTF9Kyp2NiznggJN0g7q16l+XKPAX
         U6oGdAhZOQWpNfHHmaUzOmz8Chw8DjLKb8/UAAWh1EjQ8RaoKKPFqrdBF007HAyWJk/J
         kkTVf++od09pmO3GFCz88q8ECvlZ6V6zmZcozGG5NGlC0aHQRy9PuC3CVhlALgT+6Da0
         NwsYbpS6N4TFC1jFEPOdUW2wFGyxthVz8FspVsOpMqDhhmhyzTLRHXGkgzGB/EOo/TdG
         Bf6a8/VzCwqhNnPbCFrPJ14hvyAGYGfcb7I7/vlVCjVwVG3jylLTuTso1e9a+a9Zl5ID
         7kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750938069; x=1751542869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P84028oJYeMHhuu45/JE+9IuzDSe16FA2FfJuutHg1I=;
        b=ZOaEflBtSN+ccz894EaOV4YP0E9BR136bea0LLIochETY4pvwugSf1QWtTllVPmHwO
         j+w1GoDf09E83qNy5b5C5kAtaoj0fQdPLCIiE2ff8mVQJlXyWrrWchN39JqLjYoc/gZJ
         AP8PMfz1Z8ywtp+W7mqHqRMvxTk/SttkZXI8BFzomXVuJOeKpVr9MwzfzNU2OQpOb9yf
         2oifczVmspxJADOvx6Q/JKeYROvhy6xkQ7idfUG8QMPqBHJio/pkY4mLZYkcK/ssCugk
         59UF+MNs4HIxg50tA+S8CgHlZjdQLcdCIVf2sy9cgJW5Hs2GcKYZl5OfgvX/qwzaJ1l8
         SHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGwGfwCBqCt7oKZQEsAC2MnvVcQHDvZeZHBQyxxOJpedpUX7NmCL7z7reyNI19+XN4bikKkf7ALKWaVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ9FEdh1EGqXZsFcCtuGyYdVdz0W95dnyZm4GWEe4u0RszFqzO
	kzAKRi81rnVgxIZr0XStAcDamDcCLDWE3OHBWR1r/ufUOum53McTUcqy1WphruZUToeYa682Kw7
	hSwPxxrn2Xw==
X-Gm-Gg: ASbGnctvsrHrLg5Hjmt/6kyMjVuRm7APR2C9KRjeTxfDeE6kqtep26GfMwMcSuCJz2J
	PsjduUkbIBcOIqY+FG+LyKtlsnfegZB4/i2EhbnTEShOSKQ/9HFuxMxWshgv6pU44Q0ChEdfzvi
	SaqsuebwiZL6f4hKEEqkGBSd0mEo4HZ2ukiQm/2mU0tgssnTNY6AC6gEbdlXjP3fgTBMtSl6iu1
	pE8glNG6jOuUvxXY4Btu69U2gPD8rVvSaEq0efmPoz5X0QZ69831Q5FYNUk8hAGPKodO2hN8QJH
	4UlGNU1uOFrUEhTfzFf6ZXcI727BNrjS40hw2CJ7r1PENUYZ2wqNKmo9G8v2/ghwKT46ERTKolG
	9GwF8z8QKYtM+eJDuadCHeRv0acs=
X-Google-Smtp-Source: AGHT+IEAvEe3QKbPqlojOnT5cd4wj/eJjPvaq56kQ0jC31K9fVvjUgwpQpVgZdXHuSVMcKcEFAeyxA==
X-Received: by 2002:a5d:64e5:0:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a6ed675141mr5949708f8f.56.1750938068846;
        Thu, 26 Jun 2025 04:41:08 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm47204785e9.6.2025.06.26.04.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 04:41:08 -0700 (PDT)
Message-ID: <8c83b5c1-b7ca-4fc8-9246-a950c356214c@linaro.org>
Date: Thu, 26 Jun 2025 12:41:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, vincent.knecht@mailoo.org,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
 <50fa344c-d683-420c-a3b5-837ec6d8e93e@kernel.org>
 <e928a7c5-56d5-4f2b-b667-bdbefb506d1f@linaro.org>
 <0e030c09-0a89-4883-b958-85ddd6831407@kernel.org>
 <d1b0b5c1-a031-4429-bb4b-ad8bc914c971@linaro.org>
 <ea5d7622-ef9d-4bfc-af64-87bd19664333@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ea5d7622-ef9d-4bfc-af64-87bd19664333@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 12:17, Vladimir Zapolskiy wrote:

> What's about MSM8953 then?

Should be fixed up to match 8916. We don't have an upstream user and we, 
I, did the wrong thing.
> Please see commit c830aff08d51 ("media: dt-bindings: Add qcom,msm8953- 
> camss").
> 
>> x1e has a particular order if a new device x1e+1 comes along with a new
>> register then
>>
> 
>>
>> I think I personally haven't understood what was meant by "devices of a
>> class" but its clearer now.
>>
> 
> And I still didn't get it, how to read this "devices of a class"?
> 
> In particular why is MSM8939 a device of MSM8916 class and MSM8953 is
> not?
> 
> For sake of simplicity I list only accepted CAMSS dt bindings:
> 
> qcom,msm8916-camss.yaml
> qcom,msm8953-camss.yaml
> qcom,msm8996-camss.yaml
> qcom,sc7280-camss.yaml
> qcom,sc8280xp-camss.yaml
> qcom,sdm660-camss.yaml
> qcom,sdm670-camss.yaml
> qcom,sdm845-camss.yaml
> qcom,sm8250-camss.yaml
> qcom,sm8550-camss.yaml
> qcom,x1e80100-camss.yaml

I mean some old commits in Linux wouldn't make it through the 
upstreaming process now.

8953 is not right and can be changed.

8250, 845 may have bindings we wouldn't accept now but they have users 
so we live with them.

> I kindly ask to select a number of class defining IPs from the list,
> so that all next ones will derive from those only, and not from
> "another class". It's a task for a DT maintainer I presume.
> 
> Before completing this and getting a common understanding all next
> work to provide CAMSS suppor for new platforms is not directed by
> any policy, because the policy "do as it's been done before" is
> applied inconsistently.
> 
I think I personally am clear on the rule from the DT people, even if I 
may not get it right on subsequient submissions.

The sort order thing is a red herring, in simple terms. We should be 
consistent in device classes.

For example TITAN 680 and 690 should look pretty similar, TITAN 340 and 
990 probably can have greater divergence.

Either way the sort order thing is a dead end, anything upstream on that 
basis like x1e is probably fine because it is of its particular class of 
device.

8953 and 8939 should match their device class of 8916.

---
bod

