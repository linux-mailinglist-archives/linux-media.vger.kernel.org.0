Return-Path: <linux-media+bounces-34463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E611AD3C6B
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 17:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3810C3AB5E5
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77784235064;
	Tue, 10 Jun 2025 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uNo1kwLA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1526235047
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568238; cv=none; b=VgsV9OW59iFvzMRCaaVGldZpDElp+Tky29TSnLroICbNukfHzl4WxPGZt8zpYxWkeMC2bMbH+jJcHtMpT0GabLfTXotk20WNUeke6xv1hbUpWjCYfB+lBUdEj+dMAfeyw0RkdzR3joPL7/A27h48//hfYKDOrGSDYcENxg5cp3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568238; c=relaxed/simple;
	bh=K16qniHpP1rKeMQwwTwoeEHkNwIBAmZZGNj2G/YDHZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nL8cMqJTkn8cUezfyj4O+SCc3M+CYMvpYrTQPYJa1tKqkeL7ak6AotdFhrjmGlBFbgE6pMBDbruDIrom3nuwzXFdmI9dhjzPD5q8cBx9KWvqjSeb1cF4pmDcxKhpoNQ4tCsynULfkPgggpIQq0aTZj6SvNYI8k6v/M9Vf5tk1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uNo1kwLA; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5532f3b51f7so564913e87.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749568235; x=1750173035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/NJem0CCXpUoiew+hmOOEKe+Dga4CVHATU4U2OxMVQ=;
        b=uNo1kwLAv51ceXp833OhKyCYE5ERoiUMYBBtdbZv8rluN18y5Yhiv9PG0q7nCrhOk4
         iP7Qvec0ck/nxLmKITDjdKGx7sl8uiJet0UOryS+NxWlfpBADQZtKCajzAUJw7LyVI3O
         8ZCzpeT+9+MiZilXNz/5VCPT3iOlqX8WWokLKCH9HfiBeHQO+aHceC3HPrH4LVexSMRz
         47KT2VR2Uz3nLMiH3uJ2kVXtCTHtJqzr5OzP0BdYNUUEvrM8KuEij5cgDu5Is9gq0uha
         h8X6ot4/v024E7Ryjpkkbd8cbIsEckzJo8IJj5wAPZCXpkD49paxMKCWn1LLpnR2vv+b
         PCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568235; x=1750173035;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/NJem0CCXpUoiew+hmOOEKe+Dga4CVHATU4U2OxMVQ=;
        b=jKA2A7nd9qz1EVnyc9s9o81U92rHA6RW/Hm93yYAK6cEX+vnkRFu1Ky6uqPmDxIrbL
         SrYwTaSUP18dDso3JLsGcrAxnL+zLvt4dKqIzmIxpbuWCwRC4tLobeLgoFgyO725LucM
         /7bZhcb+NlZxTCUurI59f7b7KXuD4OJJ6c+ptdRuv3gXWrlsHjXolujKT3a5le6pEkQG
         TTKKC3x1gTTc7zdaBbsGrBuNGqOLzdsZDwoamW1TLbFEolNQWepFL7lqrnUnyu/N1l0t
         gVSpvBz066EI2ByLpGDsw9Wroah/4CaADWjV6cKH8c41IqHZ7QKPRGKz5KMeNmdKBLD+
         QKdA==
X-Forwarded-Encrypted: i=1; AJvYcCVB+N4u0v/ISTYXXf5dTp2VDSlrpABWCL+x0kRL1HkRhre8gdszjoWzxaxh0oWvCuwW5t8XzN2aUDofvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCt66ORXSTXQ3+tavUlczADAp0DGcNqIUo7x/ORY/Sd6hXhkuA
	pL21WW3K8weHbFo1p8x+A88RfGQc6Qv9kfYwp7UYLiW1OUYyDkZs3aB7EtbUuZ79hfk=
X-Gm-Gg: ASbGncvz9+Ex48y3FOxP0SKgpbYrcruzLo49dVb9Fio9yD0Dx7zTVOx5fVs9+SkSTAt
	dQ35nv8fIojvYW3ZxHysJAjtBeIeMnApRl5robq0CxzW6RQ3vjl/6VZqVa6VdhD8zTj4nFeliQL
	mbfShPBZqPwfmZzgZbRgQE4wmr6iNTi8l281WgvX9X+q/P/+l7RGL39fUdOfBLRsoOYTOSf8r+y
	77UoBX0n4nk5J3f2KhmBJ6L/cgnbFfOfFTnl/PwBJim9KcAz/MZxmAYznidhuobLl1w3ogOTfAy
	48yqw9Pf5HwJl8pfgBBr/FVGTeLRubbQdHMMBO6ifNCTgphRDXOxTi9BeLL3+hJplcrs04QbREQ
	yXrWXa+xV9OcdoaySPEvM9JAqxWjN2QPO8ciR8bhV
X-Google-Smtp-Source: AGHT+IGWP0mYIM0V+jmKRvUZVJcYGowyFpThgb2g5qr9J0zY4ATJ9nMZs6lGrCBfIU9ObrVo71xwwA==
X-Received: by 2002:a05:6512:3e1b:b0:553:391f:2554 with SMTP id 2adb3069b0e04-5536860f8a4mr1434711e87.5.1749568234994;
        Tue, 10 Jun 2025 08:10:34 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677222aasm1578146e87.105.2025.06.10.08.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:10:34 -0700 (PDT)
Message-ID: <97e51ab0-737b-496e-81df-b73c9f598bb0@linaro.org>
Date: Tue, 10 Jun 2025 18:10:33 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
 <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
 <3e8f8220-1fad-437e-9fa4-5eb628891110@linaro.org>
 <ae364f1c-5d64-4178-b26c-e58e352feee0@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <ae364f1c-5d64-4178-b26c-e58e352feee0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/25 18:02, Bryan O'Donoghue wrote:
> On 10/06/2025 13:45, Vladimir Zapolskiy wrote:
>>>
>>> How is this a Fixes: ?
>>
>> I call it the fix to the dt-bindings documentation, then what is this
>> change, if it's not a fix?..
>>
>> Anyway, if there is a strong disagreement about if it's a fix or not,
>> the Fixes tag can be dropped from the change, since it's so secondary.
> 
> Since we don't have a committed upstream user I don't think this is an
> ABI break.

Well, Dmitry says it's an ABI break... It would be beneficial to come to
a common understanding here.

> But I also don't think it warrants a Fixes: tag either, there's no bug.

There is no bug, but there are Documentation/ changes with Fixes tags,
it's okay.

I will resend the changes with whatever updates requested by both of you,
if they do not contradict to each other.

--
Best wishes,
Vladimir

