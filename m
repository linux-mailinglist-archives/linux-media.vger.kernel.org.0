Return-Path: <linux-media+bounces-49667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB34CE8FF1
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1878F3002866
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F843002B3;
	Tue, 30 Dec 2025 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzCIdIFP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DD6275844
	for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082733; cv=none; b=Voa1YXQJLiDv1lrGa4Y5BQUzdearGtLUKLe0CxvW+oHcO9eQqFfmwow5IBwKSCZx3N3XgIwt986GK7G4DTYZK5gC5Ewf/y7BIw5vxUdX19JVVqtu3jyfSBbTqD0BpuSs1pTWNBfpt9iqwmnwyKwBn5iUCkVoPIToQtUzDm21fvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082733; c=relaxed/simple;
	bh=v8mrrc7yE3c9qhRU8zkJsHzZgCi7JoLcbMtMMJl130k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PSYmF1OQEzyBpXw2Pai9GOFdg7gSLt5yxMnCGwyrqcr4lpLJqp4YvWz1TPqX/EAoOTopIYF868pdLEHXpsqRO3+u354rhUhB6her3nQNaErENaJtcNQ3fdKg+AJFSH6a+2ztzyH77Opf9L/1IlBxBfD3P+FBNVn/YnjDaY+UtsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzCIdIFP; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59425b1f713so330100e87.0
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 00:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767082729; x=1767687529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oWwnUl9perZUOAgUEtwYqm9KF/RzvwLKJJUUYt/2Ds=;
        b=tzCIdIFP/SoeGxvCcY5c6Z16oIYaydRghhZsPZeivK0N4NniK2kDWnUiwlZ9cLpll1
         /DyLzlY/EdpC73xqWa1+Mu0FREzsQWpgTfAx3Q12C/DjHVsa8LYfmLm5uXENK/HshkPW
         +sbVpkOYkR9/kIVcGVm1uRZTzOvIma+kwUwslApW2XshPiDCsiFPdABxCLp0jb9bRUEn
         FVNUS8v2gVZDYpRioIA/V52rjqJPFVdbKdc7I+XtFUOYiocF4cUx+oNsI8+3G1IgIHE/
         KX4FRuB8mBVHadk7lmM6wWmLyZMOkCtBrvmugWcYHdnZWFMz6ORAUUhcZDN+AhgUR3TI
         gvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767082729; x=1767687529;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7oWwnUl9perZUOAgUEtwYqm9KF/RzvwLKJJUUYt/2Ds=;
        b=wHV3sAMvO4Tuk7V9no51/k6iJc4PQhb8d6zUNCYm4gs6VYSrM02UtR7FXWrh42994t
         go/dPp21slTfm8rJsrlosKWiEjXdDIGxa6gUDHalYhzeVc1eIwVtM+HCytKD3MOqAVqE
         3glzjIlh8UlT3oDM8wv+RqNaQ0WzngDI+jAgqfRJieVFXSEJvbPkSelRtSGlzS8gOy4j
         Bp5r3prGkZEqyychydwpiGHgtv3GLAi+sF32EI0BgSniooeV878SRetrm12oGuH+GRP6
         APyPJBuylcHwdvzN1EaC0rgb/Ao7oFVwF7oT2HK+nvyS6fKWl39OOEiakXPmk4f3OdAb
         f6nA==
X-Forwarded-Encrypted: i=1; AJvYcCXyU84MMIuPRnS74znRUmAyLjgi2BLUpLF8Pfpkwg/JzyJrleQSXziNafQ80aB4DFZyP1Vf7D6OW1zsPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTPOGmhjs8p8WvFun2dM0mUPEC+mnu/OhtzXI1P3paEQjKGBAZ
	/oUO62MxVdtMAqZfzpoq/SKnOVFfT0dmU3tc0tQ8I9+dxtBCyVhFXsYrWMajr7nQEbg=
X-Gm-Gg: AY/fxX4Lvz1R3OJLGcHQho10sC48EKUm6InUv7NMiBrrbB4V3prAOVIobI5Gs2ecjRM
	4o3OvrWRbw0Ow2/5ksnztXHZ24onYKkTIroHngM/Ikp9VtkTwJMUI4wj2k+yFLXzwGoCn7ZA5jA
	62CrGd7Ri0PnAwZsbIE0bi4yJBDzJh8h/ZwN22FDm0Z/kmANilAE4F26be5AP69ajOfEYYDVnEz
	rWpsax85MP/3o6m2a+deperQcaXP0o1PNbmZcbAsO4E24s4OsI40A8QWP2sFG8NWyfOhPTJVuwn
	8Hh6JuxYfBjLFGLvLRu1Zj3MC/lEYquwGKi5hjTjpX5NGboNarL2kKn81ggAyfU6gDXXO08hMQv
	ILuXEzk/BdiDfCFD1fofu8RtqkWRGTQEgXDXVjr4qPLbwBN3rQ44pFJ/iift3yrzAS/fusl/KR6
	j5QKvdx+cOFDv300PiaOPLfuEyhWIZl7EfMvSGP1HYJpXqhDy2SoX2DG+Wk7Rq8krUtg==
X-Google-Smtp-Source: AGHT+IGBKgEgA0DSoo96ohfu3tX0jdZSs0KRDNzH/uH1fTPEKyh004Q1HykeBKi833RCmFUzF1oqIg==
X-Received: by 2002:a05:6512:1321:b0:581:8db3:d5fe with SMTP id 2adb3069b0e04-59a17d70667mr6479215e87.2.1767082729178;
        Tue, 30 Dec 2025 00:18:49 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618a35sm10421379e87.66.2025.12.30.00.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 00:18:48 -0800 (PST)
Message-ID: <1fa74da9-bd3e-43c6-afbc-8cfcbb93af93@linaro.org>
Date: Tue, 30 Dec 2025 10:18:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
To: Richard Acayan <mailingradian@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20251230022759.9449-1-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251230022759.9449-1-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/25 04:27, Richard Acayan wrote:
> This series adds support for empty endpoint nodes. It is currently RFC
> because it continues an ongoing discussion on how to selectively connect
> some CAMSS ports to cameras and leave others disconnected.
> 
> The SDM670 patches are for a full example. If agreed on, this should
> expand to SoCs that have CAMSS.
> 
> Example SoC dtsi:
> 
> 	camss: isp@00000000 {
> 		...
> 
> 		status = "disabled";
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
> 
> 				camss_endpoint0: endpoint {
> 				};
> 			};

I do not see this device tree node layout as a valid one. A 'port' provides
an interface description (an option), and an 'endpoint' declares a connection
over a port (the accepted option).

 From dtschema/schemas/graph.yaml:

     Each port node contains an 'endpoint' subnode for each remote device port
     connected to this port.

This is violated in the example given by you above, when a remote device along
with its ports is just missing, thus there is no connection. A forced alternative
reading may (or will) break the legacy, so in this particular case you shall
start from making a change to the shared graph.yaml documentation, since it's
all not about CAMSS or even linux-media specifics.

-- 
Best wishes,
Vladimir

