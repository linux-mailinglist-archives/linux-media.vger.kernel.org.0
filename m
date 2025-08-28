Return-Path: <linux-media+bounces-41252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A19B39F78
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 15:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 791307C161D
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 13:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE3C31062D;
	Thu, 28 Aug 2025 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ub6EQEAz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB33120469E
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 13:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389451; cv=none; b=ppvBb+Uf7y5QlWf8ClkxEEKRc2hu+9znrHGzcyJjuG5bNhz8PcUiCo0aXH/eMbJYybBf485PnW9XCYzvHPpkiYiylaO32OI/WLdCXfuJQh8WTWQ8Z360RDMEg1h4uTW0QCLlKXGJMyMKADDt3sHsVroELtQciyszl6Eujkm+jw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389451; c=relaxed/simple;
	bh=Lga8eUmvTypnU+N8xf2bcKYX2aN4L/PZ63SC9x2UnKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOCUKFKrRyKSy6WLZP7OKHo0OJcDgFt+1xWuYsItqeErvQ9T6+Ep7I+M/H0tLivB3EJC55IZfkBMqo5paJYL6i8T050znF9QJL3Z5fJ8m42rRrym2ksmeEZrZzYwPtXjBikfHWsY5bgid1aoTKtISTK9krQ6lDaSpezDIEdzDJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ub6EQEAz; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61ce79fc30aso76039a12.2
        for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756389448; x=1756994248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ry5BAM4eGzyoMNqwVqMz8Kcq7nPsJJxRcXsSOxb+jRw=;
        b=ub6EQEAzzVnFNhEamrg2lwBo88xZ1Go6BTbeMa5P0dscbLvkyBGtFS8tPxJ9KbUPHp
         JynDVZ2O1+txIR95tgzM1mrN9MqzChRBLGw9fphSQ1+R9tCLvPNlDcvNaoAsddbaMnoG
         M64WT79jiXyrsAP+oRmqZ6SoKRdxYqPlMgMGsNpJMYVJ9aALHw7a9KXVRXIDp66tcxCF
         x7+uC7Vz8HgG5Yl4eiDyJzyJt4V5fTO2mHhEORRxficWT2ikPXL+aSVKni+FT0GOQF7L
         9HmHOn6i6aYNSkTTTz+SmslJZhbNTM4wDo2IW2s+7kDt+UymQi3p7N0JLZoPeZMhBKvY
         xrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756389448; x=1756994248;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ry5BAM4eGzyoMNqwVqMz8Kcq7nPsJJxRcXsSOxb+jRw=;
        b=fapMw9/h65POF3aWdRTw+fJ5eZhXcWkn5Rs3YQ1906vHHP1WxS8/IFqwvRLhRm5GpA
         M8dLt+bF9iZVtDI+4SHOpaeP27KN4B8WLoB0NSqvsYVh77GKY2MGOTPeDwXLFJy+asU5
         OyfH1C57n+CHhfjqqL6UbdV3M5XXJnZPatudIie046SjbfbLY40FYTay48EBGLVdZWy9
         mdFlWdlzPMLJ6MNU4SUEuctbla3gTGXPNlBOaVoNgbnvg69fVhiBviCTjCQJr+2nPgRw
         D7jozCd8bzi99EcWt4W1rwaWbci8745iYjJ9LxFohF8EVp2uewiortkFWu8Yh50GyDyw
         cvRA==
X-Forwarded-Encrypted: i=1; AJvYcCXhj7aV8rk0lO9k7oExop3suPIEVGa/xHKO7f1LEZ02XgGM2Zl1dcYEGnE/cVC4Bu0c7q01gUqpnFhRGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5vPaf84ma43YGBwg+8fdsUjTdldOA6JaX7CH3lsB7Hd0EAlyH
	OhVCe5tz/NHrsovOU5YP91gAbJH5kFEUJ9G+3mbD32B4njXogzPd3EeslS7BTOlgYg4=
X-Gm-Gg: ASbGnctC51mNSVrQQeZJLMOkCCc85bHHzZVzRSJjrysKVe+1kQW6EZKPh3M1fSQJ0VM
	4l3vHlcm4XKOYTVPIzBc/OaCyRPOEM51ClRG6sh97FbOfGaWBl3QOybVhBzlMlphlXhmkTRkjkt
	pcTSpRY0jKB+otOaKyZmGhM6SfdOQw+appMBLQqc4Nu8/jhpkXyWEMXoofgA5KiBgqjQUOLKJNQ
	BuS0aRL9/U9Cl+hxtvEFei1NUwQ3OXTRSdENaZXRH46nANHVWFyRY/hnntjKDunEJ3eJrWTU5mM
	1yKKLMFxh2LheLsD2Don13i5Yv990B/ze/IWeInmmeTf4iDDDRSOhDkHezmFAXyKHGIsypmjihI
	HERN591AaBVH4hzR6ufZI7aSM5gJ2nw4PCxR1ef57gig=
X-Google-Smtp-Source: AGHT+IGiTDx72Ct0qq6LfR78hlyca9TI5FhuYQdGlgAMQ9n+t1eXNexwlAt4NBGtyPNmUoOOUbw4QA==
X-Received: by 2002:aa7:d9c9:0:b0:61c:bd9f:7242 with SMTP id 4fb4d7f45d1cf-61cbd9f7594mr1690901a12.8.1756389448227;
        Thu, 28 Aug 2025 06:57:28 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c90ffd657sm5610219a12.44.2025.08.28.06.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:57:27 -0700 (PDT)
Message-ID: <46f5d11d-8bed-4d01-9151-35a24cdacfa5@linaro.org>
Date: Thu, 28 Aug 2025 15:57:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: qcom,sm8550-iris: Do not reference
 legacy venus properties
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2025 15:49, Vikash Garodia wrote:
>>>
>>> Whether removing will not break any ABI as initial binding enables the IRIS
>>> related code to use video-firmware, now we are removing it.
>>> I believe, removing binding always break ABI ? or is it depend on driver
>>> code not using it ?
>>
>> There is no single user of this, out of tree (I briefly checked) and
>> in-tree, so there is no ABI impact. I am changing the documentation of
>> the ABI, but there is no actual ABI break because impact is 0.
>>
> 
> My understanding here is that the interface "video-firmware" is already defined
> in the binding. There could be possible out-of-tree users of it, might not be

There are no such.

> possible for us to look into all of those out=of-tree users.

We both know there are no such so you claiming "maybe not possible" is
quite misleading. Qualcomm does not use it and that's the only possible
case. We can verify it and I did verify this.

> I support such cleanups, but also need to understand how this is not an ABI

You are just making up fake obstacles.


> break, just that there are no in-tree DTS user means no ABI break ?
> Would appreciate if you could point to any guidelines if my understanding is not
> correct, i am currently referring to [1]

There are hundreds of discussions describing this and I am not going to
do your homework.

In none of other qcom media camss/iris/venus patches affecting ABI you
raised that problem. Even remotely, so I cannot understand these
questions here differently than just spreading some sort of FUD over
this patch just to keep that broken video-firmware design for future users.

>> I am really sorry but it seems you ask about basics of DT, so please
>> first get into docs and other existing discussions.

Again, read the docs and existing discussions. I am not going to do your
homework.

Best regards,
Krzysztof

