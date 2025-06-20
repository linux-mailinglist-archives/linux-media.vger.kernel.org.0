Return-Path: <linux-media+bounces-35460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C67AE136E
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 07:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 825957A8AA4
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 05:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C50221CFFD;
	Fri, 20 Jun 2025 05:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VtkAWQpe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925531AE877
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 05:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750398880; cv=none; b=GA1Q+cHJW4nLhu3Q/ZxgjKyknLTvhkbCbPKu08rJVtKxdfSeygjD8pLnzs1+xubBxju7sWusk4/zkgWSSyj3c6t6c6jU0XVdvnSDUBELkpIBE72WTuQddRVIoJ6nqh1T1P3Wg0fOPlpl0MayiR3uqJexm6n9aqYxSSK1kkGK8bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750398880; c=relaxed/simple;
	bh=SGm45xOdKQPaoT5i8e6fGV+CT0zn6lmG3bc/9qhEuyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BIhPYO0mtL+1hKUqXGANpAu5mn7js4X3/l7WVHOuHRUKnWG7Fv5l7QgbWJZzlKgU1qjV49NKjmIKV+92jzwrvkvFGsFnuEzo2LpdJTjCOwgOpjsnrQHxqxiFnZNaq16rBqHDvifmuJjqUsiz2vAs4+yUx4DFBA0UvTH8gX41Yv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VtkAWQpe; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a524caf77eso242232f8f.3
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 22:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750398877; x=1751003677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=59PVKiZdXIvx7Cm+uTcu8gotYU98Sb4nyV+OyfABkNo=;
        b=VtkAWQpe5FESQVNZeofYsm88L7n6VjLkVP9nbYYYEyHSnRph3B65gpXH/QXsA4RvFm
         cAARxldo/RaAQo8HKit92XEeag2ryMbYp+tMIk+LXwd37BKsOLTEp8GX/C3kGu7mTrkm
         TWUJh8mjTEvG2MF/jsI1ADUp6kbdXF8827ZvNBnOZI9nz1G5z8046bipm3dSJDk+8nyh
         TIiGeY+2q/Y4whMtormRWYF83wx0DfVjIZGezjTEnY8+xP32dFRYIjlgi57oEIJpOf0I
         KBq7JnBBBFh4atp43hBtbTyTry706ymr6qA7jMhBn/zKkgH5y5EQS1MdQmqyRJ7V9NBS
         xzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750398877; x=1751003677;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59PVKiZdXIvx7Cm+uTcu8gotYU98Sb4nyV+OyfABkNo=;
        b=oPAI8CVv0W1jRYwKgTzycCNL3dEciMPQhWrM19fJdqt83TjmOqBUnhwfe267xmlVj7
         BfhY56JHbzdKOp8hofL9nEFXNcTydOO6K97xiO8Va6Fb/QdzNwF2f9MgfEeI51toR06A
         66TUZY9jIKfNO7t4n7AT0TXvkD+UsR66egzHb7WqOlM3YKe4qQ5RZIq4cXU8a0mFNVSV
         auaJroRD+BlfZBlB5RdbZ5kcfe2o7r8txyeUkE6be0GEWlDaRPQwkF5zCbyZqBJcRLTj
         a+mgk784bHSzobEzJWLrBAd2cLNOdZIAiXdpNDZfBwo+Rkv8XORnhfsrKpJAlcvH1YN6
         Cvow==
X-Forwarded-Encrypted: i=1; AJvYcCUC4bEd6W7H+KHR7ZMAipwC8/NaDjDVQcMJe0F0+FBDeOaG1fwjNPCUM7UWFHZrL0L0mc9O8r6Co4b7YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymC8FP9aKcx5lPrdXjGs7uq7Ec5SK9HsdizbnDN8a05Z5zh6Z4
	EEvgB+bl4ovunSYjGhRPyhuM+tGW6O3/Q2zm2phwcTEHtQPbvU/RhgFklRcu2aFWq9s=
X-Gm-Gg: ASbGncseNgYw4pIcLe59eAaatPFQNpCyVR4NuIo4OUOZKYE2h8XvJ6KpvG2LFSYbfwh
	4pDtaKxLCkpCLewwOb1mOOPQvOc/azQTmOoDDyUIi4EZPPeVoyc21oRvBH8VUUSG7OwfVBA3vBT
	BidmqWge8zABorqqD3kD2ryfgOWmvwL09zFITTKJwWkJJAn+kujYGawv5LvRsvnN5Yl9LQh+Uku
	8+ny5ysZNEjlcy3JtWwpFUtYwjOW7ATuobVBKV2Tz9DTcdSHJCh2GTrUrW/4e9sWoBqcYZMP5Ne
	ucxj6oK+FXtdZJTLfxJXd3fNa4RXTXmi6maJ7k9S60C0dwJ8XUB+jy+LRAJyJZ63Oo6FI+7NEgF
	PHAWldWjLdWnOP1Qbfg==
X-Google-Smtp-Source: AGHT+IFcQ9MmxABcUgAA17Z5yhG8GD3yrVleUWb+QLqjuwBXbS596eXv/4SkhKPfSkMOcNjj8ogtDQ==
X-Received: by 2002:a05:6000:2dc3:b0:3a6:d30e:6fd3 with SMTP id ffacd0b85a97d-3a6d30e73bamr180338f8f.10.1750398876754;
        Thu, 19 Jun 2025 22:54:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1057esm1135424f8f.10.2025.06.19.22.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 22:54:35 -0700 (PDT)
Message-ID: <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
Date: Fri, 20 Jun 2025 07:54:33 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ming.qian@nxp.com
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-1-Frank.Li@nxp.com>
 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
 <aFORokzx/sImgDtA@dragon>
 <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/06/2025 19:16, Nicolas Dufresne wrote:
> Le jeudi 19 juin 2025 à 12:27 +0800, Shawn Guo a écrit :
>> On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
>>> Hi,
>>>
>>> Le mercredi 21 mai 2025 à 13:34 -0400, Frank Li a écrit :
>>>> Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
>>>> are backward compatible with "nxp,imx8qxp-jpgdec" and
>>>> "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
>>>> wrap and all slots together. Reduce minItems of power-domains to 1 for
>>>> i.MX95 and keep the same restriction for others.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>
>>> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>
>>> Krzysztof, will you take this one once the DTS part is ready ?
>>
>> dt-bindings is the prerequisite of DTS.  DTS patch looks good to me
>> and I'm waiting for dt-bindings part to be applied first.
> 
> I was waiting for sign of life on the DTS part, we usually get some ack,
> which is good sign we can take the bindings.

Such process never happens. DT bindings are the prerequisite here and
platform maintainers wait for bindings to be accepted before taking DTS
or even sometimes reviewing DTS. Why even bother to review DTS if it
follows entirely incorrect binding?

Best regards,
Krzysztof

