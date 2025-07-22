Return-Path: <linux-media+bounces-38212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A218CB0D772
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 12:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 544111C250F5
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 10:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD14A2E3AF2;
	Tue, 22 Jul 2025 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vdww0zWn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9DD2E174B
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180641; cv=none; b=eoq4BSzuO1zXifPPpGMCBWm0DN8c2Kq/cXzEuzhqbfab8V81qUv1fitlfxqQSEsSeBTP7B43qDzcJFTx2QhJ56v7c4VCMdNhvTk7qQwmnEEYLvEUjWhe660JOM6VHkQmcgbrRJaqHLkQgmO9OKqfXha4fhUuCZfJGaQSW73fNfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180641; c=relaxed/simple;
	bh=EcaPmOZF17vzAybqgUPsCVqCSYrKhcslVWazMxbu63M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTpVBFS1ZzpCKEsbBJ3tFPL8/DQCbPF6SdoN1FeJBfZXc+eZ0ZtQAB8TcKZrhWms45nICsIgdAt6FjfL7TgypW4iFkT3Um5c7MxZNo8QIpsK2j8eFN4MV+xJMdwU+iNTrCbCPpv43w7++CciUnORWC5xPeXq+n9rCLE2uB/af7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vdww0zWn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2591474f8f.0
        for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753180637; x=1753785437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Y4ZK31qukkhLkAHxdpW7gih6/ZCt1oA0i9NknuiOE4=;
        b=vdww0zWnoWp9QeU1u00mPbHHCE6Vq4Dszs2UlBmvmeWgey68lOYoQJnaur6eL3KcFv
         0/+0RPu9W91z6Q3ecq4lE6WyCvswGAqgyIXkGWc4N8QlvXw2+Glzldt8KvssKewDUvj2
         AyUJJ8y4pVZGU8GlvkrWyd3w2GOO5VrfBLw22K+KT08m+OevW7xqIcZSXScCbxAcX/Qc
         xTQeXTIJOPa6+PIj23bDw236w5oaHfrMg/+WG7lCIvR5v1Z3ycsXL28iai6H11IlZB43
         aLzrvNmbs8073u+Zd1Y2d2zfDnulnM8BvS54LdYeBxG0wND9tGGPf2PQYtgDTY5zxNB3
         CDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180637; x=1753785437;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Y4ZK31qukkhLkAHxdpW7gih6/ZCt1oA0i9NknuiOE4=;
        b=RF5U4WPjCvM+iJbYXtQ/RfvD/jzabR6dsF64gLqq2enSKFDn/SIARuas+LadrCnVv8
         el4gb84xMioqcCtEDJpCZFp14Yh867QJpdIT9JVi4JUGkIw3mGH7Rdt175w2gg/Js3Nb
         QovDWX7jheyp4gPCII3Az7hin6at5/T3yUgBN9/E6JpsaJupE8PNVKcSRvsROCx83Xo4
         cD2wbmmcTK2ARlvjqgU0xXmTtq0Sm3zkUaouZlntWKxEUS2vHsqAclknHgaH4vtjbGDI
         FZXAAbUDMZQ7DkAQpWzROiSrhoX6ICYhnX0fOx3hk5BNw64VOTun9hp8VrhmdRulvct6
         mqFA==
X-Forwarded-Encrypted: i=1; AJvYcCVcXwtyDcctAQSgQvoNN2qGy+e6xEcm3uY5/+BtBI0OGivy0xeMZYEob5xQlOXG9dWA2FOuHFMqXv4ZnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx4KgmFnBqZPFuSQPvYoz6QAZJiRJyCGjoYqWs5xESmKGsVDPU
	p4NGc7ssKpxc30FI5oHnvUsmLFPjKyk0MmHh7NyV7x84ZQvZEfNAGTIwVyxcquZZ7u0=
X-Gm-Gg: ASbGncvyW2fmcL+SFNNBltHzGZsP7yWIBCTFg8UBXhI9OMXYbXSVDiT+rYUs4DC7h/m
	44h5nvC3Ib312hFhgG+jh9TYptx+qogU7X6YiuYpII3evXIKzuSMKOgwcDzsHLS0BXDLqoRGrJ9
	G3kDRBT/rnSh/+7OPVnVfDV+6hXXF6g51AvmXSy56tRB56pzlTHSL8HQuxM6gMOmjFL8yoqEzYX
	sm1zjD0OkFVwfTU6d6KJzatoeo1zxQKDI3/dMf36ZsSdY60qGP3ZDzKWAt//7XCLbwLPserd+/1
	btLlvnlP64e2fmX0KtT0ErwI13eF1htWIsDFf+ZeqVodvz15364YDHBn5aLxM/Qc1ZozevYw6on
	zKENbM4mGyDWyAg5zYUFIJl3f7G01gXsfnSGaF2z/s+4lETqvnjcBvZ7cvpI43Vo=
X-Google-Smtp-Source: AGHT+IGTCim13XVcGSW21AueFsi3fYd4EJtmzmvQeTtBGNVJD3KZN4i5HjdFzRy4dW3lSossDfE26A==
X-Received: by 2002:a05:6000:288b:b0:3a5:8934:493a with SMTP id ffacd0b85a97d-3b60e51bb18mr20015822f8f.44.1753180637147;
        Tue, 22 Jul 2025 03:37:17 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4d581sm12938939f8f.64.2025.07.22.03.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 03:37:16 -0700 (PDT)
Message-ID: <7e1073da-6773-489e-80f5-97409f013acc@linaro.org>
Date: Tue, 22 Jul 2025 11:37:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
 <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
 <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
 <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
 <427548c0-b0e3-4462-a15e-bd7843f00c7f@oss.qualcomm.com>
 <3UXVZ6ANM9mDjVdMV4SXsiIx_pT3S1lp3RC_Q7mh_o7jF2dpYsni1Sl2TAWv6OCMCRTFmi9aE6BxDquGkOnwEg==@protonmail.internalid>
 <8b908a20-0bf3-447d-82ea-a5ecee1bf54c@linaro.org>
 <57501e81-7e9c-4cb1-9a37-18307d1e06ca@linaro.org>
 <33d76d7f-ab14-4e76-8ffb-eb370901a046@linaro.org>
 <4edefe21-27b6-4884-befa-ddb451bb9376@linaro.org>
 <84eea632-02d8-4b7f-a4ca-36ce7159a170@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <84eea632-02d8-4b7f-a4ca-36ce7159a170@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2025 10:59, Neil Armstrong wrote:
> On 22/07/2025 11:08, Bryan O'Donoghue wrote:
>> On 22/07/2025 09:32, Neil Armstrong wrote:
>>> The whole key point here is the combo mode, as I understood the combo 
>>> mode feature
>>> makes the PHY lanes available as 2 separate streams, like if you got 
>>> 2 "controllers"
>>> attached to the same PHY. So in fact, the PHY should have a single 
>>> node, but 2 PHY
>>> interfaces in combo mode.
>>>
>>> This makes all this controller/phy model very complex to handle and 
>>> add a lot of
>>> logic in the camss side. Moving the "csiphy" as an independent media 
>>> device that
>>> can declare up to 2 endpoints in combo mode makes things much 
>>> simpler, and allows
>>> us to attach each "csiphy" stream to any "controller" side of camss.
>>
>> I think there should be a generic extension to PHY/linux-media to 
>> support that instead of something Qualcomm specific.
> 
> Can you point out what's missing ? AFAIK it's more a matter of proper 
> representation of all
> the CAMSS components with a proper ports/endpoint graph design that 
> adding new kernel APIs.

Perhaps I'm not understanding the pushback.

Vlad's design puts the CSIPHY nodes under CAMSS and doesn't use the 
upstream PHY API, which if I've understood right is done to facilitate 
multiple sensors on the same CSIPHY.

If the kernel APIs or standard representations of CSIPHYs in the 
upstream kernel are insufficent to facilitate this model, then I think 
that change should be done separately so that all of the existing 
upstream stuff can benefit.

CAMSS should have a standard PHY interface. That's what this series 
provides.

If multiple sensors on the CSIPHY can't fit into that standard model, 
then we need a series to rectify.

I've given an example of how two sensors could be routed to one CSIPHY 
in DT. Another possibility is virtual channels.

I don't know if your sensors support VCs, have you explored that ?

If the message is "we need a custom PHY interface in CAMSS for multiple 
sensors" then I think in fact what that points to additional work that 
needs to be done in CAMSS and perhaps in the kernel linux-media and PHY 
layer to facilitate.

Like I say I'm happy to help you guys do that, ship me some hardware.

---
bod

