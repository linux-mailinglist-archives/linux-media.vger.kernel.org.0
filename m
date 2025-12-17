Return-Path: <linux-media+bounces-48951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1ACC5E3B
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 04:21:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EDA6302CBA5
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 03:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B40256D;
	Wed, 17 Dec 2025 03:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vlyrhOjI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D735E5464D
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 03:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765941653; cv=none; b=sbIYOdbkhhRfEXpRm6pOGfLH2OtbXkPi6stg4uYSwJPNR5RUfBuIvAdPjmduIcF8MBHydF7VX1N90W4EK1V2wfcZPEJPRzKjcMF1PFUxilzYh6DeUm/CY7sBmM5fLF2s2teDHYfxL9R9JuzgGpx0o0XPWmx7zQcDL180Ka20u4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765941653; c=relaxed/simple;
	bh=11SzZGEklYXvWWCXktsoGz8Ujricuu3/IviZe0raxmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEg0EhuKQsbOq7XMWqUXwLYOqi8bf8D5sTBiRd+yi/1KC4SkW4a5mzMI+VUxDeYkjhCQIPGra9+drUM7DQMFeNpcUaUzzUP2lF1Vgh6/AyFE+V1sMiiaRzLGxtpGbaaaFzwY7JVKsmzuUaQp0cgZjNgpuC8aEsSDejYpnI6KVxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vlyrhOjI; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8b9d2e33e2dso819224685a.3
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 19:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765941651; x=1766546451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdPq35EZwyBF6PB3EjhFF/RUlsGDMSd3+ptll7BKMJo=;
        b=vlyrhOjIA8mMPnTVFIdzzZwNWV3q7xEJ1Mp8yYnRC9PXTRuvkfWOQll17jOtcSU89f
         mJ1kAIntFZubtMtlPsrsB0yryf29oJwoCSQciCuUF/MYE4XpVqYKYCGdZ0fWQdjgdUJc
         r7iua4OHNVO8hrSmm5893DSD2fLlkUpJAY1IXLvNwvubaMffqtFF7PQY3f8ER8Ig82oZ
         sgLwDoKl0XP+vZAwQeu+Bo4wybgczBsQxfrwowPzb1WQzm4baJ/B74Rrg8Ko5UvuHzYM
         8sqTDK/x1UOnANwKk5y4JtRO9PVsjH9V7N4RNAHoZ+516AeosSTOC0bVodTRgwVeigSR
         V7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765941651; x=1766546451;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdPq35EZwyBF6PB3EjhFF/RUlsGDMSd3+ptll7BKMJo=;
        b=fmns+UGRs1IkJu60Z/+LWNbXFXdZU+Aa9xCY+lEtKOELrl2Q4on4B3ScNwnhYx/Hws
         abBKKd8M/PjS9uXRdPUIVHaCegFq11sBFq1sP7/uq5FGP9i43wFxD04BQDbfpULlVAMG
         +wS4Kw06RvqrZt5qmopEUFcVgWpBMgXoBqjcQou26K+OKUuYZBBJHyRlbCfrsfk71TRA
         hQtPA/zXTQ19V2i2i+kprMYCJyVYbcLOesD4x0g4lPNB7nNXL0UMR/We0U3TaV8Iq3dW
         DEwSfhMmvx7HVlCOoOWJPaDhtopMVDeP/MdYdgO4Rg7hP835SbNVEoYJcsiP9KdcvGg+
         GmqA==
X-Forwarded-Encrypted: i=1; AJvYcCUVO+oMTl1CVufzTi0Qy9EfQhoE8GK2MWnLtoKsgKvC4JHiDGSgA9nGVQDdQXaH3THSqEdfyB/VfJwyQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZITgJIq/T/nVrJNsSHyW2vEayiAGWOVsJZzC190MSUBK0XVp1
	ff7u+bd7rL77wviIFN67gcJu4zBBKAqqefAKZ9manw/nSNrTT6+Fko2kqteNT7iogVM=
X-Gm-Gg: AY/fxX5EKJ8YoCYCq2K2ct20dKR8z9Wa2UaTVz4n6iLFhFg+XK0/J1mEfDQ8nKNIPjQ
	mnTyzWDkbgOhjjC3uBTaZNRVnV+G+HzAzCpT+3eLJj666/wlTnqgaiD/4Ev9MasYOgnSTnP4BM7
	wnOWCZxinubd9Ye2CzmZ9YODYqEvoIgp7X+1W1Wv330LTIaz5SaYKoevXaQnKEVYeVZj0MOoqau
	WNESqBwsUHhpUYMNSxy0nI4e90+zYRGVZNvldffNp5gd1BihjZkG/Za4Csx5b2Ij3ypOAqvxZ+m
	kEPyZ/B7LWL+5KTfxIlRSadfSvkzyrIIGxMl3+xCa0xkneySf2JWvP2PFa4LNoZjZDq5nhl6FsO
	YEp4RAjFcArwqvpEflhCztpu20LRL0kqm8WwWBRXOh4/B6HOp5JkULwaMOtAzbNGbSRgRJRN13g
	OKFiVGNiqMveeYrPkgwOwrPOHS/rBwGl5LNXqweYn0Kz5q+noJQXs9
X-Google-Smtp-Source: AGHT+IFaGnoSZCS0t3YmUC++ILPu25bvfOSLGRvm0PzeBOimFe4SOFuPXflo7ePtL0X0orV37jQbPg==
X-Received: by 2002:a05:620a:1917:b0:84a:71fc:a16a with SMTP id af79cd13be357-8bb3a0bdfe0mr2215601085a.37.1765941650716;
        Tue, 16 Dec 2025 19:20:50 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88993c659d3sm88437006d6.24.2025.12.16.19.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 19:20:50 -0800 (PST)
Message-ID: <01034cce-3657-4765-a42f-6b082fb2de1d@linaro.org>
Date: Wed, 17 Dec 2025 03:20:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vladimir Zapolskiy <vz@mleia.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2025 12:49, Vladimir Zapolskiy wrote:
> 
> If the ICP register block is added now, then it will practically exclude
> an option to run hardware demosaic on Kaanapali.

Why ?

---
bod

