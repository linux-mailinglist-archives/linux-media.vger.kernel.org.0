Return-Path: <linux-media+bounces-34707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81691AD853A
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CEC87A7904
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FD919D8A7;
	Fri, 13 Jun 2025 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EsU2OSJH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5898E2DA74E
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802003; cv=none; b=Bzyh5g47pZzIMmOOfhsoREmssedzjmwTQ4Yf8j28QRUzOwrx/92RcUuIRQ/kquu223oIy2gencbl61NM9Jdb/7YT+ILlTa/n52GYA3n9kWiv6j+xBoYyK2aLn8qwNNpSg7HOPffZS1ms0gtdp9bKJdh5s1DZ9lsX2LffVJaBzjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802003; c=relaxed/simple;
	bh=SS6GUy7+iSGrMAI8Lio5hdVZyVEhieiGp9O0m4ddPPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HA0n2zjchwhll3DoCydy6Y+9bsD5ShVFfpK/Wlexv7EE+tQrbwyFSZVz1ZiZjBnPDvv7wMZui2HwVsrGImHpTY1qV4OJ9+rMqYvz8ZM7aVOC3usTZa/Wxi5cPPsz7J/k5Na37nJdsZt5ysSJe6nQelz2ZUre15KoFh9/nqriDJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EsU2OSJH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a5123c1533so1184679f8f.2
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749802000; x=1750406800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkqDFUZXCEB8bR8DaJ2XDhGAG8e6Iv9Jz4tCnxztU5U=;
        b=EsU2OSJH8aW92PaxpbLI9nQ0uktIgs64bW6Q/7YE+yj5YTwjEP5wr/44RSb4s4PT9Z
         i0JrxeE95LjFUAm84dOodnUN2O47ha1oJV5BDUm7TboIxCel4kdWE1AZ148oqQYVNV0X
         V35e42BUX38VqqzxxlLSAsxopnYvwsHKlyWO8Uy9D1KkE6c95rJLKjqLwZbnyFyBpqWT
         XCA0PbRQz0tnDtigC25LeOxgVoCmZ5Es11wBvWvH5W+finrYiZA7fqCSsKsQzzpU4rF/
         qcs3DgYtWDqR0j2Ec+HTfRTHI7+gjxzs5CItLEYzeFuhX3pVXiTR4EOo2BFh8lcu7H3v
         25/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749802000; x=1750406800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkqDFUZXCEB8bR8DaJ2XDhGAG8e6Iv9Jz4tCnxztU5U=;
        b=RI2ENBqlFJ2qFnDy0srFh0ZklXEWESmYxWow7sRZ7H89Jy7R8uF2kYnic1SJx9kvvA
         2vW7TYbzTeCLZc2Sg1qwv+GhKAuD8f0aYHLR3lCZ8NMWvl6DKuavp3Hw6ChjN7e59RMl
         BZn5zNn4j2Dr4E/cXN4gqvlBh08RatIqH0PijX8hsbYz4HxWr5QB/cHr+BFO7z8CO3JV
         oURGwrpw9uGl/B5vw5MsA5LvT2X7fWTqUgVR8w2XlqjIgy3biWr2Bq2EdmhjoW/3Sh0A
         EWk6IDmScqts4xwZ+kVCEIeTPWJ7x7yd9hzHBTDjj2I4T9I8ZiLDKxlpg+F7Gcn02od9
         cQOw==
X-Forwarded-Encrypted: i=1; AJvYcCU9XQ5hlB2BqonasSQyaD0/zfLwDRBxdXurMkfqiJy+yx12tOjo0Gtj1a12hbcwI7Xdtu/2lCQTe5XBkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrGS0VfNrZz0aLHxmT6jMjhw+0fQaosZ2Lk4mCbKv0PdjTgZfd
	TwQmsx8zCM5dNqXZshjFgOxhWMGK2G4+ar0va4h5jVNvm321tRRXdiaLvsHDJZES4g4=
X-Gm-Gg: ASbGncttBmZ8aq5lAcp6uujxUT89pz5JG78OQa8bW7Rk+7AaXpNTyDvCcFN8JP+mylW
	I7fd5IGvbyVxrdzRuYsioRIlE9KfrPZkDf6OmCp7tNeXeyA3+4Gxy/rr2QHGxrWaEq87C6Nu5Sx
	kE+v7R9PozsGCnKM/QIjV9+L0GhN9n4tpzLw1dxGW7iZb1ckHdkF1gfwqmw3ZXyriv5jBFgew/S
	btfVTCpcFTTSXjSjJgw59e7DwTkvdjZV7vxMAYQzSGqMj1xpbs4PDDRzL6TQ09gvkJ2BEDidgZP
	B+3eyjiqENbve8srCM1ZMSG/gdcrlSoHR0pf8Cjje5lPFhzoe6SQshUx+zEjZGSFszTBMV7abMG
	tYKGPQVs/K/r4xAxJHHeBYIQQLbg=
X-Google-Smtp-Source: AGHT+IG/O5UhDJVykXf2VjbwfD0QSNx5aG0GPegjXalhCDoQfY+0ubOtvsqOybm9J5xA3EHEjqAziQ==
X-Received: by 2002:a05:6000:3103:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3a56871e167mr1902935f8f.56.1749801999608;
        Fri, 13 Jun 2025 01:06:39 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4ba58sm1540669f8f.84.2025.06.13.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:06:39 -0700 (PDT)
Message-ID: <03f54bb4-ddbb-4be8-9f9b-8328fdb98443@linaro.org>
Date: Fri, 13 Jun 2025 09:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: qcom: camss: Add support for MSM8939
To: Vincent Knecht <vincent.knecht@mailoo.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250602-camss-8x39-vbif-v4-0-32c277d8f9bf@mailoo.org>
 <20250602-camss-8x39-vbif-v4-2-32c277d8f9bf@mailoo.org>
 <877a72fa-cdae-4a66-9991-5ea86ef76aac@linaro.org>
 <e73d676ba1901437d471a2a633e94a07b19a3e05.camel@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e73d676ba1901437d471a2a633e94a07b19a3e05.camel@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/06/2025 22:43, Vincent Knecht wrote:
> Le vendredi 06 juin 2025 à 13:59 +0300, Vladimir Zapolskiy a écrit :
>> Hello Vincent.
>>
>> On 6/2/25 20:27, Vincent Knecht via B4 Relay wrote:
>>> From: Vincent Knecht <vincent.knecht@mailoo.org>
>>>
>>> The camera subsystem for the MSM8939 is the same as MSM8916 except with
>>> 3 CSID instead of 2, and some higher clock rates.
>>>
>>> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
>>> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
>>> This fixes black stripes across sensor and garbage in CSID TPG outputs.
>>>
>>> Add support for the MSM8939 camera subsystem.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
>>
>> There was a preceding and partially reviewed changeset published on
>> linux-media [1] before v1 of the MSM8939 platform support in CAMSS,
>> due to a merge conflict this platform changeset should be rebased IMHO.
>>
>> [1] https://lore.kernel.org/all/20250513142353.2572563-4-vladimir.zapolskiy@linaro.org/
>>
>> --
>> Best wishes,
>> Vladimir
> 
> Thank you, I'll look into it
> 
> 

I think I will take 8939, plus any of the other now 3 SoCs waiting to be 
merged with RBs.

Bindings consistent with the last 10 years can go ahead. Its not 
reasonable or in the interests of the community and developers to gate 
any further.

---
bod

