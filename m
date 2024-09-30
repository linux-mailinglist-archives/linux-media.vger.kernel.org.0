Return-Path: <linux-media+bounces-18777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE398989D96
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 11:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F2D1C21A7A
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E6C188007;
	Mon, 30 Sep 2024 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pTURRH2G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD79185B6F
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727686987; cv=none; b=sWBRdYRRlnH3dMsjMiRF7G00QOfvGyLfqU036v/JFd26BG91SzY1GHivqkVDAlkSKvCgS/D3IUaSmrkbZpw/2WvO8trqcmCiIaSZMfX8pRUn0AqdxzLQCYVp6vWq25W+s35Vhy3O/00NNIMSBCiZsjPsCFFf0MMJH0RIo5Qcntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727686987; c=relaxed/simple;
	bh=gokyK1fF6w0xDQpaD8M5t9y0+r4rkwiHiGo4dRQk/bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmTgvOkAgC9fg8cVYZSEJQ6BlZj5Soq9TUIoA+w5SDoGspnpNAYjfHgDRlZKQUGnUAw49baButfaD6LCrIBvgFZkdLdAxVDgj2Oan+AlwZoPoPAoSRM+2Hr4+LU4AB+DyC+fZYj4Psy96bn7QqaOUofsYUHEh/GDc/z7FKvU6bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pTURRH2G; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c87853df28so4602116a12.3
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727686984; x=1728291784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T9oI5Ky/TnuJmGwmRVM6MU17OzxCNKafr+pgaSjGfPw=;
        b=pTURRH2Ga6h7Gf4meuMOaFz6gckakdZorHLCdd8w9G0jAxHtn/a4OiJ6IWeUCeKXYs
         rF0v+GawhRbkWt6lbhUUAeIoNlj6bFlVhR8sLk7BCPs7wHF/5qspem/APmEEfhrywyRK
         KrZWqxzQOB2ae7sLxPInfdIHVMs8DuWc0V9iKff4aid0Qp03jHuDLHx2q/Tj8LIsv62C
         Rba7w6adE1p3rx4FFQAc2cYXe0pT9js3R4ITDkAGAFbSn/XT05vKl3Wrt2Xi9o3p1BmA
         7jpJhytzEyEHJySuJW84KSD5kJA6e/W4gY/aa7KlHvH9+uIyj0gveCgmfVjF+/zurpIr
         xGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727686984; x=1728291784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9oI5Ky/TnuJmGwmRVM6MU17OzxCNKafr+pgaSjGfPw=;
        b=rhfX0cNgyJ/B+TAY6kzsrWtzVKADtXeC+Bky+jrB9enq5nQX9ZmYTN+Xjd3SwAaK/f
         70+EcnPUR09CwEJRudQYu5m/BP7voDy+FmMLJVBP5U4SQgsuRv1P4K3riEwUVL7kg0RN
         JJJReyJVbgiMeum+m4iOIH2re3hAoPHI0X67rvHN6Euw4rc3d2hOSl1/v2Jr5cnMmniE
         qH0zLDnysjQqVSvjlf7oU3KenCvbgL+qmfGBts5tTnurt0lsGGcp2YqUlxbu4/yub27q
         uce08uCIieffpLVtzidulDUop1lKtiqZCK2rfxl8QaaawbLVkbOfHNDk5WKGu02qMV/A
         E5eg==
X-Forwarded-Encrypted: i=1; AJvYcCUFsYLbVaXpUgvMj2XapdPWXl8YKxRZ4ThD4qWtb/UgFcZhAu9XkcdeFRm9A4YnndZHHyu7yG1/7wiFLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjy9e9Sc6RGSR7THEU6va3BKMu/d5UgUMnXuTd42r5J4sGHJE+
	Go5hxAL/itJK/0MGfA8DgMgIY1MXAEcWvB3KcdJ4jvZnO447An/q/2x3yRJ8dRA=
X-Google-Smtp-Source: AGHT+IHj+vzIiJr3dV5T2DwDEVx5jBE4DpOpRqS3Ik1nFllpGGVCstMsUdlRE1tkoBkSMi62Km8/2A==
X-Received: by 2002:a17:907:1b05:b0:a8d:4b02:3351 with SMTP id a640c23a62f3a-a93c4a682d3mr1119122566b.50.1727686984130;
        Mon, 30 Sep 2024 02:03:04 -0700 (PDT)
Received: from [192.168.0.15] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297b788sm496612166b.163.2024.09.30.02.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 02:03:03 -0700 (PDT)
Message-ID: <05f845a4-599d-47cf-9209-33f086c30f5c@linaro.org>
Date: Mon, 30 Sep 2024 10:03:02 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Depeng Shao <quic_depengs@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <9ed92660-5f42-4a1a-9261-b8800133972a@linaro.org>
 <ed012367-1bfd-4eef-931b-37e1ac839176@quicinc.com>
 <212c880a-9a09-4433-a049-eb15a0c32322@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <212c880a-9a09-4433-a049-eb15a0c32322@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/09/2024 08:26, Krzysztof Kozlowski wrote:
>>> Please sort the list above in numerical order, this will change positions
>>> of "vfe_lite0", "vfe_lite1" etc.
>>>
>>> Another note, since it's not possible to map less than a page, so I believe
>>> it might make sense to align all sizes to 0x1000.
> And if Linux behavior changes then are you going to rewrite all the DTS
> for new size?
> 
> No, the sizes reflect hardware register layout, not concept of pages.
> 
> I don't think that we should be coming with more nitpicky ideas, one
> month after the patch was sent and reviewed.

Agree.

1. My understanding has always been:
    - Map the entire register bank extent
    - The main reason for that is today you might only use
      1/4 of the registers in a given bank but tomorrow you might
      add in new functionality - like the HardISP in which case
      you'd want the full set of registers not just the 1/4
      or the 4k aligned version of that bank.

2. Pages can be all sorts of sizes so aligning to a page
    makes no sense. 4k isn't special.
    https://en.wikipedia.org/wiki/Page_(computer_memory)#Multiple_page_sizes

---
bod

