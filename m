Return-Path: <linux-media+bounces-39059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08967B1DA8F
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 17:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBF1E625F88
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 15:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B626E265623;
	Thu,  7 Aug 2025 15:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgxtn1mY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805225CC4D
	for <linux-media@vger.kernel.org>; Thu,  7 Aug 2025 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579250; cv=none; b=ZQVM/xZku7s/PvyiMN2Eqcw8U4W0e+1glk9r2Cn75ia3qrOmWYPgmziGRTN4E27+0zOmWEh4k4HFxIAAPif7ZOV93o+EI49nEK/T24gtXuIUjYqXLig0TiIo0PdU3pajoWWsNfyGZYXY0Lkb+mcjG/W7tqqQJZOqWAZkqAECGFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579250; c=relaxed/simple;
	bh=igUCIrrVeGDZErz4UxdMxyeKYvyk5C5rg69rGcCFkFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJHs7dE0yBXXTphnixTH0QRj9krPZ+yAwWQTIB+VCZbRmSmWmNe8UJYA2u4BhTA57cMF7+dW1L0N+5ZBm+I3vlYsa3Lw7emSTryESmhUZLOqDKnm3jHwL2YWNsrOJT1ZnAH1uenhe7pbWZyIoY99+fVmN60IhOjB69HIxQA4SIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jgxtn1mY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so7782245e9.1
        for <linux-media@vger.kernel.org>; Thu, 07 Aug 2025 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754579247; x=1755184047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgzYIUCs5H0EjucoUMdBhHY0eYxFj3kegJfd7p4lHyw=;
        b=jgxtn1mYLafJXNX4H96Umxia0R7Z9LwqBKvFX17OnrSb0ECn1aMJ0fMuWuT1kb2ZSi
         +B6XuanWdg2Tzc9eDvBdqJcPSwwXfR1zUP74RfRswjwH4eIeOJV1sSm6dwOKvlOV6nNX
         k48bpJaQ/CSiNTnIKJuv34An7PONJJ4Sonn0QZd9gp+UC47Rf5NYk5lxOvpSQOT+ShW6
         3xZWF5JtewtqbgfwhoG++Sdq5ztYc0Jfjcj1Q70b8J9ES0af96qAxQwqF+EfyHdfvuU6
         Tp7/UWFSGa4Lve6sab7mcogHFzC5Fd31RSlAByJiA8PdAAmrHK3tM9vf/gHEvQJCsjek
         K6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754579247; x=1755184047;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgzYIUCs5H0EjucoUMdBhHY0eYxFj3kegJfd7p4lHyw=;
        b=mUaU5wnlUkN7Ir2Q2v7vcozY8Jd0bm6q90o3lAvm2DOUzqHHNmNPl8aPspQ86qd7AM
         sVo2SuGyT28OWG4rOBUAzhvTUsEGTxgwa0LAH4CoyL8dg3hCQS9CC/SBwpdSH9HvAQMU
         Azs17sh27sal20ZmQkU/J0KeFHVmFe90tCjSLHIbH3Od3H9v3HKAhVY71YI0+07shzyc
         iZrkU0Blc31Z8+pQE6SnQGst3uBJCOynWmKGdaIPXKCqDou+cNu4gEn91i/LE8X8CI1L
         Vn1dWjafQAO/B3REaLqZ0zRbMqy6O7+feCntbUj8kzkr1gsTNXJsC4INxFpteO+iW4p3
         hefA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Eg6a3IQEe03F8hIfmdHVKlCSgZNzWs+CtE0ttbHLLxCqd0cTadV03Raid8Vp3jkOLojgDl52mX7AMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybn85r3t7nLVtw3SF41m4HwNRqXKwwaPquk0m0YYtaAdGPtUfc
	Byc3JI4uWgRoN99NIpyMhqhV/c0XPcV54JteMdZeIJgdmT1biA5OH4WHko3A/HWxuro=
X-Gm-Gg: ASbGncs+/oZalmqWSPDr/tCgyFh+ZFVslssJHvis7JxYA9QdUIUe0kyKlIDghq0+2lo
	R7FOAWZdlfhnISxzhSOlGC93C6ERVW1S41XOSHRPvGySdg05r/o4fDmPKMqPRQGz1A/0Ivo5mqw
	nzSDbSjSL+eJvMckCYZWQ3tmcmLp7hLcgaRfePcby2Hl2aO2tcqvrG+R+qipEGjQiCRP3hL76SW
	gHtrWAxoXUeVkNL10TpTGSgAdn1+pSJr486VtgG2IEp1Dh/7x7qWVU8vaEi+npAhyg71iZfP+ek
	yDckEWbSK/rmbcnqpCrtiizY21Vkrg1/l5LVScztPFpkmLnLK8uf+czxzOycWzs0bXr4BTDOd2z
	HF8o+VQ+5kZoUxUiA5FbeRyVHYUtHnCR8JYUmMQbU6ILmwykZJoMoHnSioIP9Vc8=
X-Google-Smtp-Source: AGHT+IHbhigFLzcg3fsj4+0TiFhPaNiMmWn7iuuNGJLANEcANPokPhbhdIImZT953oUB7uv8oVzyaQ==
X-Received: by 2002:a05:600c:3b03:b0:459:da89:b06 with SMTP id 5b1f17b1804b1-459e70eeaffmr72328125e9.16.1754579246485;
        Thu, 07 Aug 2025 08:07:26 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm93498145e9.11.2025.08.07.08.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 08:07:26 -0700 (PDT)
Message-ID: <63ce3c8b-51a3-45a7-a40e-330839d7dbf3@linaro.org>
Date: Thu, 7 Aug 2025 16:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dcc33f04-1b19-47d7-aca2-03d38173b6b6@linaro.org>
 <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <eb42d052-1fe0-49a2-9a83-05c5a5b7394e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2025 15:17, Neil Armstrong wrote:
>>
>> https://lore.kernel.org/linux-media/20250711-b4-linux-next-25-03-13- 
>> dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org
>>
>> V2 of the CSIPHY above will incorporate feedback from Neil and 
>> yourself on adding endpoint@ to the PHY however I think we need to 
>> have a conversation about standards compliance at attaching two 
>> sensors to one CSIPHY without VCs or TDM.
> 
> The PHY is able to setup 2 lanes as clock and connect 2 sensors over the 
> 5 lanes available, like for example:
> - lane0: cam0 data0
> - lane1: cam0 data1
> - lane2: cam1 data0
> - lane3: cam1 clk
> - lane4: cam0 clk
> 
> Any lane mapping is compliant. There some Meta slides about that at:
> https://www.edge-ai-vision.com/wp-content/uploads/2024/09/T2R10_Kumaran- 
> Ayyalluseshagiri-Viswanathan_Meta_2024.pdf slide 13

Hmm so that would require splitting the CSIPHY between two CSI decoders 
which I'm not sure would work on our hardware, perhaps yes, perhaps no, 
or routing both sensors into the one CSI decoder and then separating the 
data-streams either in the driver or in user-space.

For such an esoteric setup I think my initial suggestion would be to 
push it into user-space, even assuming you have gotten the PHY to 
co-operate with having two simultaneous clock lanes per the above link.

Looking at the PHY regs, I guess you can set the bits but obviously the 
analogue component of the PHY can only really operate from the one clock 
lane....

Interesting.

---
bod



