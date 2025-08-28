Return-Path: <linux-media+bounces-41254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD76B3A108
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 16:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEB7E1C84CC9
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 14:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C87221FD4;
	Thu, 28 Aug 2025 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQEG9M4h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7092063E7
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389907; cv=none; b=TyN74Ue2UAweZMkQ3OSmJkAcbsPyrZH0FCyViuufbh9XzliI2EflwRPFaewV8anCgkVcaI0d72kUOM7gbck36caNyCUFjPZLs58d8LGwpemIWB0w5AAJxmz6nu9eO55luschSzwxm7btwLkm2pmh9KFayQw6k3jpgOxGjfFsf0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389907; c=relaxed/simple;
	bh=Ob7cgHawVeLlSxaNzv2Xwps0oc1eFzlVl25O0Cn6+AA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qFheHO9lUgsPPM+XQMC+H+T0duh/73Ey8v7KCifaL3ZWOD1Xi6m+572f3WlkaHMEe1PqFGXftd8Uq4mFvqA4B7WBHZlfmiMuLxkQFDsFgLzSY5+Pxabo8C9Bt98jnt7kWyk/qlubXJw4zwPptqc0Ryd6o2EQqY4uVF2g4OTC3vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQEG9M4h; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afe8493a5b7so12997666b.1
        for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756389904; x=1756994704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=++SnKNfJZI3i5RdiciJJxrgEPYiRHAHp5qRoKyT5o8E=;
        b=pQEG9M4hqqQGJCs2bUKk5V3tFcfWnORfqPGVyclOGkL+9uW4KzFmx+782Si31RW/io
         gcIdsi3Fo/H2jpaV0YinRuSG7Tz8nuO4wGscHFmAENHjdHtoV/gzqtMg0IxDKkQ2c6OF
         GehW0qLfv3n3XHnVdGjDAg5906gniNsjB5oa3srnT6skPseX3Dv+57cOgzVlwUntJDtS
         WwmP4/8LHAL9adn0tM3qOpVVjO8cQpKfaR3CKDeTV4XPKa52exIAckIiv8NZ+lqNuzdX
         YW7XVpO5DC0mBUxmagmelTwoWE3FoUlKLc8QwFwvQGkgaL5+VK4E/RqkpCun+id4JD81
         ZtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756389904; x=1756994704;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++SnKNfJZI3i5RdiciJJxrgEPYiRHAHp5qRoKyT5o8E=;
        b=u125JlyMQ7+FxyDoP4k57y+HFZIxQCRXy0jHPjok956Qn7WxJUrZ7qZTwe871ZtUe0
         Ax5GXsylDMG/mLHRXM66iGEMWZzCvyArF4yQAyGuw85j838BnWfTOXYJEb/uqbNeZ5Il
         +Ms8QwdKVQutFMi6rAdTKXP/dvQhOFIatuf3QBgJtj4HmEDMEIYq6L4xiz/YWcErJghy
         0XoKO5XPcMGi3b22PACavZbFOh8R+Z8OEUOLUFE4DnbHsa9RWy0v+LooPvN3FC8IQA+q
         AURbD8Z9KSGL099ZMSovDgOlzTobZnTacGGuW+Ieja5njOt/9djO4eB1f6h67GNjkGMt
         GDWw==
X-Forwarded-Encrypted: i=1; AJvYcCXX0PkcijrrT0hffhmqYFeL8NAKNoh3tuXUCifOh4X/KlwKDf7q0vTYYcMfDYP+cXnrJsd61cEazBW9jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YygM1+Yob5qf3YOHGoVNOAOAr5n7tLbHBXNwX8nanw8WlWtibmY
	3xO4ogY8IFAEKDJD+WO+TT8knax3I5kGipWSRNhRmt9hINq/3vXwhhJlMbCETezmMiw=
X-Gm-Gg: ASbGncuoJe7JGqC4twGrL1r/hXg4ptZ+GTjwHua/LEw4X6ngV9Om0WPTzTP38JbIVUY
	psiPYK8B0zAPWvh0rcGoWQXpeuYyJZnQ4BOPYuAez/+uRnrov8Wp4w/a9UFHO5OK6kTjHDz2Qge
	Fuli6OIHfShEvvqUTlKqqCkUkDoSlU8JxIP/u/Fkay8mvbz0JCBt/GkAk0azdLhR8OGqt+mBdkU
	onQzunGxNrUfqLImgD7CfPy+ifoOoQZkbFS5Cfq69/mdSHrWJN+MQJxr9BR4kW+p1nSaby7lrkA
	PaRqcYzaH1R+QRcYU5s3Mpz1mYdQClJTK3pBSDnqZvm/lVlksbpRw/LYGFxGWelNtvNc8E6MNf4
	d6MmRqAFN8c/QmfA39PrdbMC3M2CVKf8YPB9Q85C4PmE=
X-Google-Smtp-Source: AGHT+IFxvA08aKiKdOb9kyhRP2mCTNEB2/2jCXheNlBU+IV/WvVYUmeMH1RDS8++YDDexc5DMEhdVQ==
X-Received: by 2002:a17:906:8f8a:b0:afe:c2e7:3707 with SMTP id a640c23a62f3a-afec2e74279mr315983966b.4.1756389904023;
        Thu, 28 Aug 2025 07:05:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7d5553c3sm911915066b.76.2025.08.28.07.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:05:03 -0700 (PDT)
Message-ID: <ad128aee-c9d3-4b2c-84bc-65c1c8d9300c@linaro.org>
Date: Thu, 28 Aug 2025 16:05:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250823155349.22344-2-krzysztof.kozlowski@linaro.org>
 <20250825113734.iekrgyvctamhb5y7@hu-mojha-hyd.qualcomm.com>
 <a3325bf1-2a3f-416a-ba2a-4fb1e9f85e61@linaro.org>
 <05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com>
 <46f5d11d-8bed-4d01-9151-35a24cdacfa5@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <46f5d11d-8bed-4d01-9151-35a24cdacfa5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2025 15:57, Krzysztof Kozlowski wrote:
> 
>> break, just that there are no in-tree DTS user means no ABI break ?
>> Would appreciate if you could point to any guidelines if my understanding is not
>> correct, i am currently referring to [1]
> 
> There are hundreds of discussions describing this and I am not going to
> do your homework.
> 
> In none of other qcom media camss/iris/venus patches affecting ABI you


And the proof that you talk about ABI only when it is convenient for you
- where are any comments from you in these threads affecting ABI:

https://lore.kernel.org/all/20250121120901.1841142-2-quic_vikramsa@quicinc.com/

v1-v6:
https://lore.kernel.org/all/20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-3-ef7e5f85f302@linaro.org/

https://lore.kernel.org/all/20211206151811.39271-3-robert.foss@linaro.org/

https://lore.kernel.org/all/20250426-b4-media-committers-25-04-25-camss-supplies-v3-1-19e5e72ffc3e@linaro.org/

> raised that problem. Even remotely, so I cannot understand these
> questions here differently than just spreading some sort of FUD over
> this patch just to keep that broken video-firmware design for future users.


Best regards,
Krzysztof

