Return-Path: <linux-media+bounces-37573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0571BB03094
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 12:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA10A4A0A31
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966D42777E8;
	Sun, 13 Jul 2025 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LKK1uQv6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4050D262D29
	for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752400992; cv=none; b=bCkpK5ARSv7wdFHupK9qlu9cJ74wL8Z0ZiSZppD/6tDi6u+IQJpvsUj/R8cE/hAzf4XEoqzBN60fjGzZf5wjREBINR8CGGC85FFGzH8r7AZFpMqQ/GgQhWSJIA1uwr4kHp5SaXkIHusvc9lX0gJLSxMaS8U6nshJXqJFjojMtO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752400992; c=relaxed/simple;
	bh=yI4e5EU+WXdCIsSgVlMloztDlKZt34IWoZVb+f2BjIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0HfDejbROm6G1MunMYxXjt2GStG+Wdt3gm0QtrromIfZCoghcqnaKvy6X49o8nvvOCWLJnWg8XeisV+i5LYGwMPFKYYjipS5110KYPTKEHeyk1WWbawfCLpFqSz6Hshuc0+/nSDqZrxln5QbpUMlpkNsJL0RZM3h1YhWBsEv9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LKK1uQv6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso507635f8f.2
        for <linux-media@vger.kernel.org>; Sun, 13 Jul 2025 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752400988; x=1753005788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iSOmaij8G1VwCPJGgqqFfFMB6O4oojRVRsHHWzuhQt8=;
        b=LKK1uQv62E5C/ShCTMVkSTl5vjw/jgugX47N/Qqx5zSlgRu3iNm4AijtD53OORL+Ka
         QXU7kyI2hJuDGRS+uSeiDWu1wuc0OSiSc/Gl9rihM2WKEaI9RMhreo1x64Uc/v+sjsAd
         18RVG1trZF69BGdIKLkgbhFn1vSnPSNRlWFgbFE39ByThiQlPoeMxUTK2KL81cpbEggL
         lqOr0vQyq2PX+u7qQw8mGLVfDioSAd8DRrMFzB7dzZk+3itBWIHDBf+3vpmHiZhZLfBC
         Yv0FhFGkgVvx2GT9NOb+WpA/FTM2H7xZtSah3QSfjO236/MfBzFiW16rq8u9u9XFltML
         QGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752400988; x=1753005788;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSOmaij8G1VwCPJGgqqFfFMB6O4oojRVRsHHWzuhQt8=;
        b=Fm51KumNFfVpzym3jZ3kxDmw7Pn+kGDnD/x+y6vT8XrGhQE4cupupbQpFSiMJGu3Iu
         p8pgW2A2IHpxlEfFqOcvYcy/gJ8t694hYZwxJbEqcPysUQ6c53/md0N9FDjb3s8DcSxO
         fh62X2crzoJq4wQ92N5gPFdMybRGY8SVgvD21KHB1jRTWTcA5GMbrEZhYhUY7YA0eYjs
         W1ydHCMMrA31Q7NqtelhGhwSRbufLmY3fzbZoJfJyeP/beiIFBf4NV7Jn201/rWRtzyg
         fKCmLATKl/TtCWPwXHx7i0xxfBuHvd/rtOHk4tIiQgMEuy23wrCwFTAOHPnjKbpXL/9g
         JbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSY3g2Bz/W+QT/4223l/9u8nO6qTuzrYj1jZOJ9ATIUGOGX2hAxNPQdLiqlmWMuxWBzsB3JJMpFriTFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOrmB+JyHYO8BDR2iZfJ8kWtOkBm22NiyHTdTZBi78Nry1KopX
	UdnEyDBX97/cNRJovT9noIE3m95gx8YSh3sjfc6QgJSWusCULtgPjZ0NEoPN/lxCDW0=
X-Gm-Gg: ASbGncukmGnvDmHO6DVdKUZ8x/wX2tckB5T2TRxOi3uEVz1ye9cZtxRSIyhjoDEYH2o
	WfSY3CDD1O+ZO+gWps/+UkXHACcrI4hCg0dw6XPJ4f8/VNNzgHYzuJWhFYZxyWB8VQS090FNWkk
	0eNR7L3+/2IoRxBm2LGPm2xU/yiAl7mQsS/G9YK3/bURbm7BKu/7teubv9fhEkSiK/MrDINjfmf
	+DIRWNN1h2p0N9iFaUyAvOwQsVf9q9ibpPpZJMZx59Bc3mYCsU5dYkKaOAoe09tIWhzpB9jLTNZ
	uA9cBRBC9Ll8rnBj+xK/kv3kbW2yknuZKl6EgCeYxQFP/SWN3sUxb12A1j6+Mc0kteR13GUc/PZ
	IoIeF1KFz6CwMx9nRzzcGU7n/wrR7TlzzL08iLOWD3Q==
X-Google-Smtp-Source: AGHT+IFka09qRa1+4/KM76B8yjceAq/uhTOOqvAr78eg7iv1qSyy1tU9ZOWg2Eba/IA0K3ucDbsp/w==
X-Received: by 2002:a05:6000:2a82:b0:3a5:8abe:a265 with SMTP id ffacd0b85a97d-3b5f188d6a7mr2116798f8f.10.1752400988472;
        Sun, 13 Jul 2025 03:03:08 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26c97sm9540431f8f.90.2025.07.13.03.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 03:03:07 -0700 (PDT)
Message-ID: <87e7ede4-0f3f-4955-a3f2-d92850873cf8@linaro.org>
Date: Sun, 13 Jul 2025 12:03:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/15] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
 <3376b0fb-f3c6-464a-9c35-30a3f589b856@linaro.org>
 <eac19ad2-78dc-44e9-bc02-517272ba737d@linaro.org>
 <3506d911-da9f-4639-9c83-aee0a637e9b4@linaro.org>
 <352421e6-f151-435b-8dce-6c02a6d0e747@linaro.org>
 <63e538bf-16ac-4f57-9578-2ae855f5727f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <63e538bf-16ac-4f57-9578-2ae855f5727f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/2025 11:48, Bryan O'Donoghue wrote:
> On 13/07/2025 10:39, Krzysztof Kozlowski wrote:
>> Lack of in-kernel DTS is a good argument in your case, but you must
>> mention ALL OTHER USERS:
>> 1. All drivers in Linux
>> 2. All other upstream projects, BSD, U-boot, everywhere upstream
>> 3. ... all possible other users of the ABI, so out of tree DTS and out
>> of tree kernel folks. This one is close to impossible to prove...
>> Luckily we assume this point does not apply here at all. No one out of
>> upstream trees uses these new bindings.
> 
> OK, if I get your meaning here.
> 
> More comprehensive commit logs and cover letter - including doing to the 
> work to look into BSD and u-boot to make sure the change doesn't break 
> things for them, which I'm nearly 100% sure is the case, is what you 
> need here ?

Yes. Just say that ABI change has no known impact because of this and that.

Best regards,
Krzysztof

