Return-Path: <linux-media+bounces-3207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B87528240BA
	for <lists+linux-media@lfdr.de>; Thu,  4 Jan 2024 12:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9EB61C238FB
	for <lists+linux-media@lfdr.de>; Thu,  4 Jan 2024 11:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927132111D;
	Thu,  4 Jan 2024 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bBvZK4SL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD5521A13
	for <linux-media@vger.kernel.org>; Thu,  4 Jan 2024 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-337520892f7so238179f8f.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jan 2024 03:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704368022; x=1704972822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DC8FuXj+Yfd4w0yOAOxJTVGPRfss2QedGHLzAZKsQQ8=;
        b=bBvZK4SL9Y3stgK+NYUDIzDaUjHm0YZhH1ZFp4tWTBvh8y6jjDgB2XJXhQmFQ8+uNZ
         eKWdZS03/DJKfUrHI0ZmaxMhOuamQcjwNxXGK7y/fbAGW0/QWMYl8DTd/KUrNA0ljk/a
         gZfahgI/+4zE7mPu1IJnzYGttGYdvYw8uYxD4HOMBBuqtfX760vQnM+Kim0BiAi6tPEv
         KhJqeyf0WopAwCMV6z9GHhuG7XgRvdmvDEzsp95AZKFMTG8Jh7QwfktXRF/2wkr8izC+
         jx30S7Q3LSSZYffJ7gqdqkkJoCtYZbr/g2ymvKgUu3sZY3DnHWQOCDPsqMl8QPZWBNF5
         ooYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704368022; x=1704972822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DC8FuXj+Yfd4w0yOAOxJTVGPRfss2QedGHLzAZKsQQ8=;
        b=VmUYLimO+lEZIBjp2XHmU3OVwevlW0e2QUU1kcZ/MdoUw/lB5AbAhs7ulYe0/GNLoE
         aBa6/sl2gyDIvBllvciOVRwS48gqkr1DgK76OflB475NAyCYXvaKlZoaAs/xAnO8ez/r
         NiVAAXJkOZ8Zp2Xv+O67ViuCR5/G3V37/U94ujEmOm326IhR4FAjwxACaCCKsv8KrjkR
         YaCZggKwG7RyLvMekZ95iykLbwzVswcS3bvXZdt3dK80vGBp9TcyXOGRyUfDmV7Yox1y
         UgpjRnAu7cKeOV9Oi7N55Du6Ij8qYX/S54iMZyr0gF2Z3kpyKakGEww4iwX3gINNhelT
         KMww==
X-Gm-Message-State: AOJu0Yz1t0dOprWUZ9nYTZC6+g1gKLynOnWH0FFAMDu5PTuYzR/6Fa5L
	bLySWaQvsMChO4IzPCcCrzG+rCU9sdsLFQ==
X-Google-Smtp-Source: AGHT+IGD4r3KBdjmMDQC/206M8Y09U4JqBN1jJbYyv/IfLlEKT9xl/HjGe2Mm9dS3S1KHV3z75Xs4A==
X-Received: by 2002:a05:600c:6026:b0:40d:388b:441b with SMTP id az38-20020a05600c602600b0040d388b441bmr290237wmb.105.1704368021856;
        Thu, 04 Jan 2024 03:33:41 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n4-20020a7bc5c4000000b0040d376ac369sm5323832wmk.40.2024.01.04.03.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 03:33:41 -0800 (PST)
Message-ID: <3627b156-a4e4-458e-9cf0-ca6c62366e7e@linaro.org>
Date: Thu, 4 Jan 2024 11:33:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: media: camss: Add
 qcom,sc8280xp-camss binding
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240103-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1-0-abacaa63a961@linaro.org>
 <20240103-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1-1-abacaa63a961@linaro.org>
 <87bcff40-b5ff-41c9-a33f-95f5e80a2f22@linaro.org>
 <62995a12-e835-40ff-966f-8522f2ab53dc@nexus-software.ie>
 <20240103175424.GA1440392-robh@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240103175424.GA1440392-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2024 17:54, Rob Herring wrote:
> On Wed, Jan 03, 2024 at 09:40:02AM +0000, Bryan O'Donoghue wrote:
>> On 03/01/2024 07:40, Krzysztof Kozlowski wrote:
>>> On 03/01/2024 03:18, Bryan O'Donoghue wrote:
>>>> Add bindings for qcom,sc8280xp-camss in order to support the camera
>>>> subsystem for sc8280xp as found in the Lenovo x13s Laptop.
>>>>
>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>    .../bindings/media/qcom,sc8280xp-camss.yaml        | 512 +++++++++++++++++++++
>>>>    1 file changed, 512 insertions(+)
>>>>
>>>
>>> This patch fails, as pointed out by Robot.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>>
>>
>> Ah its in Bjorn's 6.8 clock pull tree.
>>
>> I will repost when it hits -next
> 
> How is that helpful? It will still fail, and the media maintainers still
> can't apply this. If you work on linux-next, you'd better be
> aware of and explain the dependencies.
> 
> Rob

Well, it actually is in -next as at the time I posted this patch

https://git.codelinaro.org/bryan.odonoghue/kernel/-/blob/linux-next-24-01-02-sc8280xp-camss-core-dtsi/include/dt-bindings/clock/qcom,sc8280xp-camcc.h

per the branch referenced in the cover letter

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-01-02-sc8280xp-camss-core-dtsi

Looking at the name of the branch for your bot

20240103-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1-1-abacaa63a961@linaro.org

Does this branch name in the bot output 
"linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1" imply it built from 
the branch I referenced in the cover letter 
"linux-next-24-01-02-sc8280xp-camss-core-dtsi" ?

Am I getting the base of the build right ?

https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240103-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v1-1-abacaa63a961@linaro.org/

If not - what is the base of the build ?

---
bod

