Return-Path: <linux-media+bounces-44686-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 210E2BE20C6
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 09:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BEA8D4FB07C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 07:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3921E2FF145;
	Thu, 16 Oct 2025 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvuSWFrX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C988323C4F4
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 07:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760601267; cv=none; b=lYN9x9rTvL9raKsdVUnVYj770E3lWj/cBVn0y7hITMWc3lXZ8CzCs7thiUAQA5IzcbKMQgJKFd+MN3xnJcNeQJTnM6Nb+izu2PgE24eI0Lul/XEcTKY3SWjYQa0XPYNTKz4/UlvYtmO2Tb0eGnBMSBEPqm5YZhWBQzKtcBHSiPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760601267; c=relaxed/simple;
	bh=CfvRVCErtGHXBxkKWgrElBI+QODUT4a0FK4sms8pPYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUNgA0KXjs2hIYmM4zfXBP+DiKBf3/qIGGUTaYYD3f+U64VOEoJAP7648Hge3U1mI97TJZ/E/tH02/jVoMlWogQn+HKVf3IuaxKOm42ArowmkTSBPWXIrjuLN3wmj40Jcri7uZCg9WzxJCclVTOvdDNGtMCZK0MtM5qG4b8bkto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvuSWFrX; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-57e3cad25e8so74840e87.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 00:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760601263; x=1761206063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmVtWvRHyMhniNi0gQhG72brgXAlVXx/qF66DGWagrQ=;
        b=yvuSWFrXE6/c//r6iPe3nmYPuruGcDQEh/hVuSV76sMAWvB4s2p/+1XOHNnS08yCaT
         TRIgu5DeJ3SUuncJYc+cZaqdl9lhpZVd+A7V1yTSaBH9Mk0bN/LiLRIzu35s0rDqu3GU
         yyDDDutpEz4w0tnKWQNp4Z21ZJs05qbBSi50SJK0SdcEGLbwoxFPwy98qHEypjcjobkq
         qnQDuDmXbYtAXDRKNCe3SQ2ablYRg8Wt+/rL9RsUUP5vPJ8luLIGjOT0MYG+bvE0pt83
         wHzcV5df3zkCFy4N0PPXK0VZrq+1OB2ULg2WXWtsHHGivcoVKzFbF78xrzY51dKdbZYi
         qRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760601263; x=1761206063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QmVtWvRHyMhniNi0gQhG72brgXAlVXx/qF66DGWagrQ=;
        b=EQht34bXAJWznKkmYPtzWe/2t8QwtjolqYcuNWmwQzZ3DMXmucvcquSOniTeEXhKOp
         P3a06gfK6mEStdEzr+rfAEPXpoa+IXRgJE1wVMqxr3qKcgOuTMigKME+7kUSPM7MrRep
         QgZ9V6BLgvsP0g/fxuVCK6HpJCjN0F4h1n0H+LgQaaYPn/8/ZHhFlUHuXhGpNb3UuAMO
         ULfpvWcgS1/TSp4pNG8Yj6rs8ZG3s7fMQNFXG2R8XirxKH7COW+uilBunDSV/Lnxss1/
         1fjqTKDroDVEOrN8eka0qIJ6OMhwHa9NokCNpjTJcGxcwy6torhV7ZOgpuclGtrK28s9
         wJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCVDxFOHK+TWcO72+G9fJk8qPWclUXsy3rUUP/rKKv+xyoGUvVV7PSFuvpnBm+akyE4g2zlOLLdTps4wyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDSP15NwpsLSKWiXLKW8dWPbakvLGIlfQiJztD/6kkSyX5TVA3
	GqYRikbVn3rcsMUudM2H/EUyZ/Sdxv5u5HAfbNPtW1fYDoQQDuljTtw7cwh12umScVk=
X-Gm-Gg: ASbGncu1zL8oEUZfyHH+8Azllon5K2E2h8UhLl3gXwzZGhXzQZAE6S9mVdhjgA2oOIv
	qCKMqa4V03MA4+mweQXeWxxyTnWfsSqrsbh4RLvR1NcwOKum6GyLAWZ9Mp5ibLTOU6XHrdaGmZW
	VasZ2HUVwo7ox7ZLnDeqsqbY0ciEayVtEoYmmvR7kQ6BD+0p3fi+jXEz4DSeUOENOkV1A1VovqO
	ErOrg9GS2jJPW0y765c4sKZwWs5AMv4p3e/WZXALLJGNmYOfLfRl2V4BvotenUrsglJSZJb4nSI
	npoO7aQowaiLW83blypLXMecW8Jbk79mcHaB+OfGAulU/upNLrM4qxiW3LkPk4Uef+LbgemYLKI
	hzKjCFEaRO+ZHTsRAnHwLL7YaSaNiAOlVel6FmIKR9T3AxKutw84P9uk6dvqHLCe47ncIYLD2/b
	CfxuCj8agADrAiGLn14PZqz4yZsXRU28PnZV1pSnLLw21MZYz0AN5SfmRVH7Y=
X-Google-Smtp-Source: AGHT+IHsX/HilH4EoOWx6EsAJ+ylfUI4lAvcSrs8mZEm+Ft9+c6g8wGISR6HPEd0aILkxc47HsTiOQ==
X-Received: by 2002:a05:6512:3d11:b0:579:a9d2:6636 with SMTP id 2adb3069b0e04-5906d87bba2mr5552348e87.1.1760601262815;
        Thu, 16 Oct 2025 00:54:22 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe50csm6904428e87.33.2025.10.16.00.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 00:54:22 -0700 (PDT)
Message-ID: <46776a87-8038-42b3-8982-0cf83f8ba1c5@linaro.org>
Date: Thu, 16 Oct 2025 10:54:20 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-1-f5745ba2dff9@oss.qualcomm.com>
 <e2c43a8c-a9cc-46a1-9ddd-5d6dfc7e917b@linaro.org>
 <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <49eaf7ec-ac71-4bf3-9a4e-25fa633d815e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/16/25 04:56, Hangxiang Ma wrote:
> On 10/16/2025 3:30 AM, Vladimir Zapolskiy wrote:
> 
>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
>>> of clocks for Kaanapali requires its own compat string 'cam_top_ahb',
>>> aggregated into 'qcom,qcm2290-cci' node.
>>>
>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> ---
>>>    Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> index 9bc99d736343..0140c423f6f4 100644
>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>>> @@ -25,6 +25,7 @@ properties:
>>>          - items:
>>>              - enum:
>>> +              - qcom,kaanapali-cci
>>>                  - qcom,qcm2290-cci
>>>                  - qcom,sa8775p-cci
>>>                  - qcom,sc7280-cci
>>> @@ -128,6 +129,7 @@ allOf:
>>>            compatible:
>>>              contains:
>>>                enum:
>>> +              - qcom,kaanapali-cci
>>>                  - qcom,qcm2290-cci
>>>        then:
>>>          properties:
>>> @@ -136,7 +138,9 @@ allOf:
>>>              maxItems: 2
>>>            clock-names:
>>>              items:
>>> -            - const: ahb
>>> +            - enum:
>>> +                - ahb
>>> +                - cam_top_ahb
>>
>> Why is not to give the clock "ahb" name like on QCM2290?
>>
>> On QCM2290 the macro in front of the vlaue is GCC_CAMSS_TOP_AHB_CLK,
>> and name "ahb" is good for both, I believe.
>>
>>>                - const: cci
>>>      - if:
>>>
>>
> 
> On Kaanapali the macro has been changed to CAM_CC_CAM_TOP_AHB_CLK. GCC
> clock domain doesn't manage the AHB clock but CAMCC does. I think it's
> better to create a new and more complete clock name to denote the
> differences between them.

Remember that you do not match the macro value here. Please provide an
explanation why the intorduced "cam_top_ahb" is anyhow better than the
already exisitng "ahb" name, or please stick to the existing name.

-- 
Best wishes,
Vladimir

