Return-Path: <linux-media+bounces-18769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF89989CCF
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 10:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6951F220EC
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 08:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D74E17BEBF;
	Mon, 30 Sep 2024 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NzHFNN7G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B5C43156
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727685132; cv=none; b=pIDAFa1fvFxS1Q9eeS9NqLPpBeyh/1vNYk5vNuvjeM2J6EKf7V881kr1zfKV39urzuE7jULViVtYcsxalK2dAi1N8tJhLZD8WCZli1Kx9Pgn8AL3wWMNGUCUYRFlfMgN3xohzZxg7RN+fn8kTi0xyY339m1poNC66YsMW1LxVmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727685132; c=relaxed/simple;
	bh=vjDswGq6qzpL0ELCkjz11cU+d1yIUQWLyrv7G9cBs7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ub6oSwIf5+pG8r1h9HSpIk8i5FM/A4Fd8hyTV7kA4sUMU4YRjKjSvNncyv7bCgGwMJc+mQFadOy0bLz+HppjJFdNH58I0WA9FrHV3dmONgk17RgHvcjyLPd/iHqx3nN4Sa3U+bchjsDj7TvYs7KF1Xwr5X+EB1xd91r3UDuu6yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NzHFNN7G; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5398bc32bd9so263941e87.3
        for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 01:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727685128; x=1728289928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bda1ujvEw2DtigO9xhXKOUzZtK+oOjtZGeAQ6Cgn92c=;
        b=NzHFNN7GsOmIU4AyHXXROunwO6L2BEFWOJ7jw7ZSqQG7BLOYYqbdVg29kPidBT25/A
         0rd17z6m8PbTJ7GY3P/xXk/VCNgg+EZ1BzFAviRg/JD5AvnTV1FORSQSjV/DhsyjDr5G
         JzM6pxT//AlZj3RFyb0tKpO9IIqiO7LFRPRPaXLJBvQYgQU/lKTk1M8wpcomJxtY1o4g
         4xpg7OLA6tz8qlklMFDpT4eqjpiC4EgGuJcIEw15kYuuWsg2cqaEtqlW5rBvFqxlhwPC
         +pmF5YxNMY7+jJDf30kT5a2tE+Wexg96k9mB4LwSQOkBvKC5R4VuiYOOvWEtqoZR4Z9h
         HQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727685128; x=1728289928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bda1ujvEw2DtigO9xhXKOUzZtK+oOjtZGeAQ6Cgn92c=;
        b=BBmIJVSEwJwg2U1Gws5wYArTKRG3K31UXuJsGkxB5N55Kb/kilmreypDh+CV5zI/au
         HMIno0aB1HTFBpnpeW48UcS4ZOZbvn2/cKamVvMAtTD+Y7UCGypftl8s0kNngQJtAI3K
         2BwXzqYEiC74dGZ74Wui0RYLx0JZVpapFa8JbIqr9JegICie2/C16zmNDr5XrL0QSL30
         0RUBwszqBqMgRdPwktMraz3cmV3Qe6i9z3QyHKKzNPAGcITwmTxao3xoZfRxJ8G2Dekp
         s/PF+27v6pjWw7IxLZL+aITavORY4BefVx+toeg8WXTs8udC+srbatIMMmjt/l5BF/OB
         y42A==
X-Forwarded-Encrypted: i=1; AJvYcCXnN+w0uk9VjXh6eGXA3Wf4gdwBLAtv2bEH6T8+02wD/1EBxjrbPn3ZmFBq+uObriRpM8imvuR2nqO9Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx93Py0Cf5LFnOivpQcc5iCprFs3fSBsH6rbibMin2HU9QDcLp9
	u7aNc9Vx6AxeNIhGdVqTYBIVz9vvQPC5Xzv5Uk13AMjiKO7GYTOh22TVWZhfpA0YLK1RFtg3Ld8
	z
X-Google-Smtp-Source: AGHT+IH0lDtASpU4Bz/yJJ+DPMxpJva/WXZEzaaUSKmBmARfPfs62pt6dBtlPHX5lCsdiTR1si7/Fg==
X-Received: by 2002:a2e:a595:0:b0:2f1:75f4:a6a4 with SMTP id 38308e7fff4ca-2fabfc3725cmr9211601fa.3.1727685128428;
        Mon, 30 Sep 2024 01:32:08 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-538a043b060sm1157672e87.227.2024.09.30.01.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 01:32:07 -0700 (PDT)
Message-ID: <18fd8a2c-0563-49a0-b2a4-78f0005576e9@linaro.org>
Date: Mon, 30 Sep 2024 11:32:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Depeng Shao <quic_depengs@quicinc.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <9ed92660-5f42-4a1a-9261-b8800133972a@linaro.org>
 <ed012367-1bfd-4eef-931b-37e1ac839176@quicinc.com>
 <212c880a-9a09-4433-a049-eb15a0c32322@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <212c880a-9a09-4433-a049-eb15a0c32322@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/24 10:26, Krzysztof Kozlowski wrote:
> On 25/09/2024 17:13, Depeng Shao wrote:
>> Hi Vladimir,
>>
>> On 9/6/2024 11:56 PM, Vladimir Zapolskiy wrote:
>>
>>>> +            compatible = "qcom,sm8550-camss";
>>>> +
>>>> +            reg = <0 0x0acb7000 0 0xd00>,
>>>> +                  <0 0x0acb9000 0 0xd00>,
>>>> +                  <0 0x0acbb000 0 0xd00>,
>>>> +                  <0 0x0acca000 0 0xa00>,
>>>> +                  <0 0x0acce000 0 0xa00>,
>>>> +                  <0 0x0acb6000 0 0x1000>,
>>>> +                  <0 0x0ace4000 0 0x2000>,
>>>> +                  <0 0x0ace6000 0 0x2000>,
>>>> +                  <0 0x0ace8000 0 0x2000>,
>>>> +                  <0 0x0acea000 0 0x2000>,
>>>> +                  <0 0x0acec000 0 0x2000>,
>>>> +                  <0 0x0acee000 0 0x2000>,
>>>> +                  <0 0x0acf0000 0 0x2000>,
>>>> +                  <0 0x0acf2000 0 0x2000>,
>>>> +                  <0 0x0ac62000 0 0xf000>,
>>>> +                  <0 0x0ac71000 0 0xf000>,
>>>> +                  <0 0x0ac80000 0 0xf000>,
>>>> +                  <0 0x0accb000 0 0x2800>,
>>>> +                  <0 0x0accf000 0 0x2800>;
>>>
>>> Please sort the list above in numerical order, this will change positions
>>> of "vfe_lite0", "vfe_lite1" etc.
>>>
>>> Another note, since it's not possible to map less than a page, so I believe
>>> it might make sense to align all sizes to 0x1000.
> 
> And if Linux behavior changes then are you going to rewrite all the DTS
> for new size?

If Linux behaves properly with page size alignments today, then the selected
page size alignment for AMBA device IO memory regions is correct, hence any
future change from the correct IP device description to another one will be
invalid or noop.

There is nothing to worry about, I believe.

> No, the sizes reflect hardware register layout, not concept of pages.
> 

Absolutely they do. It might be a coincidence that both are aligned in
this particular case or another one.

> I don't think that we should be coming with more nitpicky ideas, one
> month after the patch was sent and reviewed.

The change is not yet ready to be accepted from the technical perspective.

--
Best wishes,
Vladimir

