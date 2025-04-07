Return-Path: <linux-media+bounces-29488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8A6A7DAEC
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 12:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE68F189010D
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 10:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AE0230BE5;
	Mon,  7 Apr 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iDmpOHgo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BDB22B581
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021232; cv=none; b=UDvOY1RklhPMp0+ekIyaI4FiKMw7wQdXDDvIt41ftMlT0Ce8O5kckdgPHeQ0993cXNuMGNpTeWb+kEXRStbLZluMvsQWp2U0HpIpWYwPMUfymG8jlkbkW5wE6ivX8AwxtnpCfO3BQtqEockF6zFSyOi/Icms8CtYWWEdx7LDUgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021232; c=relaxed/simple;
	bh=JFVMB2yW22lXmwWMWcPmfPT4MtEe/YQP2YeKvV+tCEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPIhSgdPKiGN6Gl8Qr71lTjKO+s6rN/wcHPeAeRKKSdtT7K7VBgHy2Afz9+r0MTsxA+MA5EfOnstCC9CG7gbTeUreue8BmHZhePbeOhCot+zi0FShx16H+QELQYZfsFTFK1/TpOwodCFKjkbGBcSA4aZczvoTJViTOlYBybYCdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iDmpOHgo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3996af42857so3322007f8f.0
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744021229; x=1744626029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezQp2+U6ixHlt9GUKNzafIUfaIB4N3lwLkkdWaVaceI=;
        b=iDmpOHgold10PGwzlos/SaBDDmsBqEnI9/2trRkv4zQn6B4cmwv5swaH7VKmWxau30
         4Z9O2OwvTtbTnRmrrSI+ZuKjuA43G5AYwRboYjM580xPFGfo14z/gXdtCSqgRPsTpJ3H
         cOWyQiNsDk5IflFXHZaAszy9A7rWCKHfDA8ndCt6tOpYRLn0nUU9YOvTIaO+GRFAVvSy
         cg0lIia4YsEY78TaElZb8NKzHw+P7wkfqwDrcTtKsXDI56aTmgva2QMBE5UXPjiNS4VX
         jKsbYmSWLYyn6trnNEbCC0KlZweGl6by6AVLD8XNeusGjvRP4+tJOs4gHx/GdCHkoj9f
         CRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021229; x=1744626029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezQp2+U6ixHlt9GUKNzafIUfaIB4N3lwLkkdWaVaceI=;
        b=hp9pnuDYNSUr83v/pesyfQHOXieUTDpgv7C8tWEcok5ksxZNAw0kq75BJ2BHEh4AWC
         qRAXTl2zdR82pLPz0jIXiaN+pHPby+oI80fcOdLAS9WaeTqXl682EGVb8U2hR3NKnuvg
         vIM7ONjsiDZfG888X1e78Rp31+tUMrEL7Ek1UAcKjLDoSNtKDts3qCM+Azw1ZHqv1Eh2
         0gAnp126u/YFrKj6hX34w8FyaMyTZ6O6Zz1e2+O2CE0F7ytZ0soOVnRQ0OLHeG15lX2g
         ZjOr26HMKkHkhJL7ZwVQH90KryjZd1X0rxiAZz/HxEaoE7cM+iL0YnNCJ4+GAWYzDiNp
         LF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgMOVSky/33NKr6/QFfVl1aEmMwYMUtTTaYq2+2WTfni+uVA2UTqysUSVCRWmjUXoqloiU/d5ym1zi2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT5FDF6gj0bt+fQjr3NQZORujSS4HDOTYmqgbUSzmumOqn5jhB
	aCik7maegkW8oOD5vp9en9w314vfr3FhGg6b6OnQs2tygiTTkEh8/CcHk9kYUz0=
X-Gm-Gg: ASbGncsmbg6S+ZKTRn7NvFTdyKOtWNvZ1ePlLUttLKcHvnGlQe1pcMqrgYX9zHOZRcN
	dAXmzKtn3240RmS6QloLJTEA5hIvcaGE5PYHYHZjbYaBIkOm+P5e3FagmR7CBoMwdMSx4DMtdk6
	naVkvT0FfezNvwtuT7KsCZYkoTi3GtX2M8J2/I7HXqJZWpxntj3etu5qZguHCSkUZBHENlk/Alq
	3pA2hSdbNtK1phVVxUAmteCOItxQICl8u/JXaFe7CEkqaENlbP+bcZKEmPPvc1xXxrVB0dRc8rc
	VHPh+zA6CECee88oa0/ytb5hb0BsyVl6PLcD0pQDXvCSxGhufIznKC2HXcEwKlYAo6O7oaF6Qmo
	3DD3c1oxRmw==
X-Google-Smtp-Source: AGHT+IFBFVAvZvAQWJ5FKIazBfYYoIxt8b/d6GZyBtfy4dBPa0KMfqalT1E6OJFjYBvAIvbUjzNAlg==
X-Received: by 2002:a05:6000:400e:b0:39c:e0e:b6d1 with SMTP id ffacd0b85a97d-39c2e6112ddmr13566771f8f.12.1744021228977;
        Mon, 07 Apr 2025 03:20:28 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm11734041f8f.62.2025.04.07.03.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 03:20:28 -0700 (PDT)
Message-ID: <b8dde6e9-5e84-4e4b-921c-4a2e2b3c05f5@linaro.org>
Date: Mon, 7 Apr 2025 11:20:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
 <012b0381-a5d1-49bc-aa59-aae0d35aa034@linaro.org>
 <84fd283a-ca87-4689-8955-855f7275d6d1@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <84fd283a-ca87-4689-8955-855f7275d6d1@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 11:15, Wenmeng Liu wrote:
>>
>> Great to see this work.
>>
>> I think the TPG should be another type of PHY.
>>
>> ---
>> bod
> 
> Hi bryan,
> 
> Do you mean to handle TPG like CSIPHY and embed it into the CSIPHY driver?

I have some example code I can share with you, I'll dig it out.

---
bod

