Return-Path: <linux-media+bounces-10475-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B698B7C89
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 18:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D510B1F21C88
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 16:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C79B176FBE;
	Tue, 30 Apr 2024 16:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhmNEwU4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36E171E67
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714493609; cv=none; b=lvFVTirHZ8Lmx76fr+Tb8ZDQ7//7Z9pl16cULsaPQ47uqqD9Zs/cGVZHOQHZgJrpfZvOXfeY4zK6dDuSWF9Ooo30fRI1QmeSFS987CWqrbemIfohS3LwmrIX+vfiKth7OBOUPHkEX/Xafh8Vc0Xz+KOK6CHfEZDreobXAwZRjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714493609; c=relaxed/simple;
	bh=v0I4WACRzWoFLEt+EnflqJq92RbYpfXlMEKr6znQT+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gClMTjfImK9ySZ056/KLv5NOA2lWolqc7HKwCmClgAglgHHAh78SuJ1Kzt7oPMqG0yZ8TEKbxd8QzmHSHQuy0X2o72vTMK+AWm+aMJzbhnThGUdoukQZHtMUjMnEM4Vq0aHKbPP0nVc2akNfa/EmbfFCXXDA2ZpNTpRdJGvNs/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XhmNEwU4; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e0a2870bceso29031321fa.2
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714493605; x=1715098405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWo1TcYro3pL4dgiwtpsnDJiZTAwfQDcqvW7sK2kOC4=;
        b=XhmNEwU4EctSKZcaSw0BtchLWKijuqK1nqOzclhiYeRcD6FBZVCD5w/Z8OUD1WSPVd
         RFiidd0Gzir6/fuUULDfoe1ZId/eo+Mq+qrCZ/1HuNqElywIAHJodsp57AfZBji+J5sJ
         lNI7Ea6V3rbIcKrqC2gxJn7cmLFaCuC+ntK3F0jmd/m1PpfE54WCZuGGll6foeMHDEXW
         m8nEXmpDQqkU4Cj4BE24b/owoDyIyHsY8VoWv7ANBZpvV/KyOPHs3/xqECQc457Jk70n
         c1xyzkQB3jHkeq5fe5L/C/XOVCwIeif3clvdWtcMqx4aMgQioWK1ARCGXymtMx1JZXJs
         1A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714493605; x=1715098405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWo1TcYro3pL4dgiwtpsnDJiZTAwfQDcqvW7sK2kOC4=;
        b=Q5+zXxmiimKJ0R8kuRUHvmgKyX+vrOKn22A1nodYL2vLEKDg0Rdi0gStpuXdZEtINF
         PZVkt3/dWXpynFqhOhlehdteHuR0yVa/uGBNLGjAArq66dDmjTMNqgEzero5+/oMFFkG
         im7dWugn4gPnSa8VpuAZZXiCKH+cI+QX5Fve1X1Lzn44/7HGyanFOih4FNX4Lp/CMrs2
         BtHt4IJUj5ldslfA8o9XI0FmIU7gKES6S7ajWPTSLbR4wyv8tx0JeSqkpZt/o+IhwI+F
         SHSKHwxjhKxCYW52sjyPWAEGSJJh0mOeBAkzO20NybHLXGGa61hUhWxXyb0Cx7Jsiwlt
         +Nog==
X-Forwarded-Encrypted: i=1; AJvYcCXy4Z8GCjLaxJ+aWT+Vw7d2YYOWIFtEI6M6bbUW1MUMUxDGShGs+aQdlI5aKWeHdcRzX3+q9uUAR1HZYo3wR+qsNWk+aO4RXQlBgsg=
X-Gm-Message-State: AOJu0YwOGcj4SLfQlC2ybJPj3WWfdkO6Nyc3c5vZRCz+z8qMZeS74Ylk
	wfGBuitvZ4sfEBkKj2Ars1cx5DF/2DJuy7FBYoB+n2wTV/LBn6G5YdQ/lXsnQro=
X-Google-Smtp-Source: AGHT+IEY7G1lHMyEaxZFAtk5xhpPUSUsQu1jhpNiXrYgjpnY0dlXl8SgCmdltOmoGrbTxqo+MUAfxw==
X-Received: by 2002:a05:651c:4cd:b0:2e0:ed2:7e22 with SMTP id e13-20020a05651c04cd00b002e00ed27e22mr126868lji.39.1714493605431;
        Tue, 30 Apr 2024 09:13:25 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b0041a9fc2a6b5sm29008449wmo.20.2024.04.30.09.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 09:13:25 -0700 (PDT)
Message-ID: <d84f9d36-198b-4085-bf42-e6b4d26f81d1@linaro.org>
Date: Tue, 30 Apr 2024 17:13:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: add qcom,msm8998-venus
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
 <4f99f0a1-1fae-42cf-a8ea-0f859e9818b9@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <4f99f0a1-1fae-42cf-a8ea-0f859e9818b9@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/04/2024 16:30, Marc Gonzalez wrote:
> msm8998 has the same video encode/decode accelerator as msm8996.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>   Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> index 3a4d817e544e2..56c16458e3bb4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
> @@ -18,7 +18,9 @@ allOf:
>   
>   properties:
>     compatible:
> -    const: qcom,msm8996-venus
> +    enum:
> +      - qcom,msm8996-venus
> +      - qcom,msm8998-venus
>   
>     power-domains:
>       maxItems: 1

Yes, we're supposed to rearch venus to remove encoder/decoder blocks.

That's going on for 6+ months now, I'll post an RFC to address since I 
don't think we should forever gate new SoC additions on a patchset that 
appears to not be happening.

In the meantime.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

