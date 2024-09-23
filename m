Return-Path: <linux-media+bounces-18471-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA37397EBAC
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 14:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82CBBB2127A
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 12:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCDB1991AC;
	Mon, 23 Sep 2024 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPoZVdMw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B48D73451
	for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727095446; cv=none; b=o+HAOUoZcMnBJ4ZKwoFPDf8/zAeLkLaeh2Rmcf6Fxs+M9+StRfUSwanQBc8qiy7xbJusXgt4W23DAPrZfVA1PXks/twpSPDdpLqwURN+LNXUaeufqDY4yFYJtcUdjefxxXVhhvdPYLRocPmDIOuPRLvQ2XjbWUUqiUBrLTbOO9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727095446; c=relaxed/simple;
	bh=TVLtiVvW5vaCL46NINDK8Adww8W/D9+l6DqTY+m8VUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtGta3xVspD0z3AVrNMCctk26Ie+y03e9I4r3Pm1ouC2Ha9mvxyiyi52LoACbOdlAD8HJdrYCUubKQnZTr6Eg/kKJfYL//F/AxfZZP5CIfhiiY5BUOzc0ieh4oywfgrB+r8mkKoTWDcvoM6kKhYzsTJ4x2WMboaKziUNkRGJEAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VPoZVdMw; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c2561e8041so5999159a12.2
        for <linux-media@vger.kernel.org>; Mon, 23 Sep 2024 05:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727095441; x=1727700241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6bIma9HKr/eXg0lAgMWRo2b9ll54v4t077yr94CrZ8=;
        b=VPoZVdMw2E9eWKDXEBGvqOWGlHg6+TMjU2RGC20e+DSbZuu1M/QBXhPWRM2REt4beX
         3UD0U0Q7dScxby8PwQxgxY1xpC2DGfdFdfIGFBXQD8XR1mVoTVosWu6oTbiy36Ws+w/w
         1yKzAbtSiffRLLr6jxQOzWovS3Tow4hE3hT/7Vk6nsOkoVXLSh3f/bOtLd+Exqhr5nlF
         Sy1Lc3+CynSsDR2hoPN96kIzaQewTgAocDVt6KUx63eEOqwm3/DN0YwpHiM2FwBlwSxh
         0CCzU3eZaQUyrjfhAhysNi/WSraPPfnXjRHPDRv+cWrIVztsy+8+JIniB/GqpedS3CW0
         IbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727095441; x=1727700241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6bIma9HKr/eXg0lAgMWRo2b9ll54v4t077yr94CrZ8=;
        b=T3Oj6NqTyiDbAoBqJuKMHm+pYtkTv4YWawvV3TWtSqibik7K/sZEE97HERqa3Ncw1F
         PrYI0Y/vd4YL3MbxJ67EKhjynIDeH8bWeRflydMKnyhjWG9kXpolHvETrN/FqMCC8rnA
         7kO/rPzOxBqdiR/XT0MEmRG0iTa84O7RDRRvsPVX9FLOhkpG9vtaFkxMuZrqS4wR5sv0
         H368/YxNM1KxUSBXyTsRWmufyXXKQIGxLdgriTIdaN/L51Bt/NTIbB6eAKGLrBnhjI/m
         yMQ+nF9mQgpDugdw6HnSnBnAFrQZ2ohrKMv8Pj58jYRDaVFVKrYvUDclVvR/XIWPg0Av
         /Krg==
X-Forwarded-Encrypted: i=1; AJvYcCWSvX9E/IJOR6+TUlvjinp4RNKRg+mka+8ttAjeSkd7IcxVSYFHba/8lCHdjnh81JhYet75H1q6p2C2Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzffxZguq86jcmJeHArM1fJzhvw7ONCkQNV0JkHjpvvf4hvC8T3
	M2yTFgSJy67LcFhr0XxpGXroDaHRbvzOiGZk5eCoLdYeQhU9cv+F0jsvnk6VZ5E=
X-Google-Smtp-Source: AGHT+IEVAj1HE3hb6jZE4BzB+CcLNa8iY01RAmuxlz+j9hb4CloAziZ26qigCmGcnprsyLA3FBALmA==
X-Received: by 2002:a17:907:f706:b0:a8d:4e24:5314 with SMTP id a640c23a62f3a-a90d4ffe7dbmr1058725566b.24.1727095441259;
        Mon, 23 Sep 2024 05:44:01 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610f429bsm1211494966b.61.2024.09.23.05.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 05:44:00 -0700 (PDT)
Message-ID: <5ec1aca4-c690-49c9-9432-96b9852de86f@linaro.org>
Date: Mon, 23 Sep 2024 13:43:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: dt-bindings: media: camss: Fix interrupt
 types
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2024 08:28, Vladimir Zapolskiy wrote:
> It was discovered that on a few Qualcomm platforms types of interrupts
> do not match both downstream code and a type requested by the CAMSS driver.
> 
> The mismatched interrupt type between firmware and the correspondent CAMSS
> driver leads to known problems, which were discussed previously:
> 
>    https://lore.kernel.org/lkml/20220530080842.37024-4-manivannan.sadhasivam@linaro.org/
> 
> Here the situation is right the same, namely a repeated bind of camss device
> is not possible due to a wrongly specified interrupt type, and it may lead
> to an issue in runtime manifested like this:
> 
>    irq: type mismatch, failed to map hwirq-509 for interrupt-controller@17a00000!
> 
> Changes from v1 to v2:
> * added gained Acked-by, Tested-by and Reviewed-by tags,
> * per patch review requests from Krzysztof deduplicated "media:" from subjects.
> 
> Link to v1 of the changeset:
> 
>    https://lore.kernel.org/all/20240905164142.3475873-1-vladimir.zapolskiy@linaro.org/
> 
> Vladimir Zapolskiy (6):
>    dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
>    dt-bindings: media: qcom,sdm845-camss: Fix interrupt types
>    dt-bindings: media: qcom,sm8250-camss: Fix interrupt types
>    arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
>    arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
>    arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts
> 
>   .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
>   .../bindings/media/qcom,sdm845-camss.yaml     | 20 +++++-----
>   .../bindings/media/qcom,sm8250-camss.yaml     | 28 ++++++-------
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 40 +++++++++----------
>   arch/arm64/boot/dts/qcom/sdm845.dtsi          | 20 +++++-----
>   arch/arm64/boot/dts/qcom/sm8250.dtsi          | 28 ++++++-------
>   6 files changed, 88 insertions(+), 88 deletions(-)
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

For the series.

