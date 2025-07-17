Return-Path: <linux-media+bounces-37994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 644C0B08B5E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C93B3B271F
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D447329AB0E;
	Thu, 17 Jul 2025 10:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e5GA65ov"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BDD299A9C
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749702; cv=none; b=l5ir2rN99F7LridShI761hmqGvwpaDQr3l/TRJMTCQyKxsO2Y6THgDSk0f/azycjAC50zzc6d1saKLSTgeX5VE0d1TF4kCsnlulkF90DIPu9iHGB4IY1+IWXzuKwURg7Nku2ge3w0PhzWfjHG6Lg0l6ZNaDw59Ok/jIlaSFYeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749702; c=relaxed/simple;
	bh=Er25eTzwhi8ZiwEYoPbsGQZZpz06nKKfV0nAiBsFy44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+1DPAQnIpnIEVe6SG/17yC5m2F9s1v1KpQ3Y1WGNAlbuEGTfezkuujbLNdvc90/wUpCFINv17wr2LuQYC8OFovWt267BiCpaoOhIgHjoW1NEmn8u8lXVBVVjrwNUd1emDrF5G7XqLvRpAwVh6/atSihltkTFcrsJiyEEo3ilrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e5GA65ov; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-606aadc1433so126694a12.2
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 03:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752749698; x=1753354498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/V2MviyGAzT/JN6dxCVLQJ7uBRHRVUnw2NP1iPLU0LE=;
        b=e5GA65ovXnMAnDImbcYA83CXS3PENHytNF2AD3+Jy6V2yywjlVPdXkZuIcGL+ZohNm
         CGFSmnsqHYOWd4ehnGCJ7HFgu0qOs9ILAAdayMmF7K5igsL23GfDC7/N4LxGXaWS6oPQ
         J/hYfXKWASx74vuO0NvqTaFvo3Kx6CY5H7y2y+G6lBI2krOEHNX7eu2pN3mAkqvXSxEz
         QsVf7OClKlXfg6rw3LVrdoWitlG3TePZTZxiOfbM98Y7U+FL5GAI1PBWIbWBE/92E7d4
         npInmz7AD203MYY2ElXDkyvH5Eo+mlt1IEXXWi4n7Xd6GWqxrmG8q9ECY1uQHtqv3Kkj
         qXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752749698; x=1753354498;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/V2MviyGAzT/JN6dxCVLQJ7uBRHRVUnw2NP1iPLU0LE=;
        b=VzTD+THVVxYCvnZUfHOqxIYtb8TmFYIhuu4K7m/r+Bvr4cUc0R/BWXCmTTxrMTwtAf
         L66BSkovMRaL7sIAH9/doG9Q9SB1T1Wb9QbsIiJUJ0YnMVY+aWk0GHdPsYuqguwcC5G0
         xHmQf1iNmflLG+PudHtnZJJraTt3XCp4UDwddjrw9zDWnjyOqJUNcSQZZKfS7Y4rKkXp
         w6A7klfLZaG86oefOSoYFn7FBWe9ROphG0LHCGbeK6E9arrjbTKGKXlStxFoaXsizwX0
         cGfSF+iRD076XnWU+jyvaVsORTXqE94rtD6Xl9DGMKl5yenP7HycGTnP+XRYe0DyGT0K
         L5Lw==
X-Gm-Message-State: AOJu0YzTX4U/TSk5ftok3JQYAHYRXUuThrb7cc0VruZVt0kgzfTVldgK
	dUMLr1O/jBgfFIrkIyeFHY3rNyxx2AFsksZd4CXx+fKZqLiJPriV2bXtI0xpkqUv5KY=
X-Gm-Gg: ASbGncs1hiWKj00s5qnzufjcoH9VonRDpIFlXBXeBegSGGhGbi53dEbLH0HafJx5d4P
	wLRHH3O9AvvV/ME3c9zkfvCxcA73vjvcbwrfAA0OOsX1vtdDjP7OxihMHdcujVxbMrVruzIttG3
	XM0y4gWSpg1oLoHFz6OXjsAnkT1ZCtNXOWCJk8DmxV57cezoiS4bEMd9uaeafCQQZYTqIii5vyG
	m5Tdzj/J/mxUEuHXE4Yu08EJKZEsGjlyH9iglum6Hp8TfybrmYetsNx3mxbMnk5hsYmeKaLk6zL
	0B196whsCz8hXdknIMrHrwWrJkhHZh8TBTgbcLVwPYbv6+hBwUVf0Eup5vZD+0swoGyvOJ3ouVS
	VCbG6Zl9XoP1UG5n4SXG+AwCzIVIzw4HDAFDyq4UBlQ==
X-Google-Smtp-Source: AGHT+IGu2OLq/BsPAi+TAE2zw+MF9bSuniM2AmRmTWHU6pTb8+Im+klOA44xCQaGUsS4YEodFOYiIg==
X-Received: by 2002:a17:907:980e:b0:ad8:89c7:61e2 with SMTP id a640c23a62f3a-ae9c9a1f649mr257220566b.8.1752749697708;
        Thu, 17 Jul 2025 03:54:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee45ebsm1339994066b.43.2025.07.17.03.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:54:57 -0700 (PDT)
Message-ID: <f6f86227-8d26-400b-9ad6-605cee966b56@linaro.org>
Date: Thu, 17 Jul 2025 12:54:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: iris: Add support for SM8750 (VPU v3.5)
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250714-sm8750-iris-v1-0-3006293a5bc7@linaro.org>
 <20250714-sm8750-iris-v1-3-3006293a5bc7@linaro.org>
 <7b0a984f-b62a-ac4d-74bf-a6e839c59272@quicinc.com>
 <d4c39f2c-9f95-4e65-87a3-78173b39adf1@linaro.org>
 <1c5df071-7000-ab45-dbc6-4384d883ba24@quicinc.com>
 <a6dbca7e-4d49-49a6-987c-8cd587501c98@linaro.org>
 <3a87c37b-b392-598a-736f-bb01e4c311e1@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3a87c37b-b392-598a-736f-bb01e4c311e1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 12:50, Dikshita Agarwal wrote:
>>>>>> +	for (i = 0; i < core->iris_platform_data->num_vpp_pipe; i++) {
>>>>>> +		ret = readl_poll_timeout(core->reg_base + VCODEC_SS_IDLE_STATUSN + 4 * i,
>>>>>> +					 val, val & 0x400000, 2000, 20000);
>>>>>> +		if (ret)
>>>>>> +			goto disable_power;
>>>>>> +	}
>>>>>> +
>>>>>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>>>>>> +				 val, val & BIT(0), 200, 2000);
>>>>> what are you polling here for?
>>>>
>>>>
>>>> This is not different than existing code. I don't understand why you are
>>>> commenting on something which is already there.
>>>
>>> Which code are you referring to?
>>
>> To the existing vpu33 which had Reviewed-by: Vikash Garodia
>> <quic_vgarodia@quicinc.com>
>>
>> You understand that everything here is the same, everything is a copy
>> while adding just few more things?
>>
>> My patch is not doing in this respect anything different that what you
>> reviewed.
>>
> 
> It seems to have been missed in vpu33 power off sequence as well and should
> be fixed.
> 
> Still, as mentioned earlier as well, your reference should be
> HPG/downstream driver of SM8750 not the previous generation (SM8650).

Yes and partially no, because we write upstream code matching or
extending existing upstream driver. As you said earlier, downstream is
not the truth always:

"That shouldn’t be the case. The downstream design is different, which
is why the driver requires the above code to move the GDSC"

so here I built on top of SM8650 and re-iterate whatever mistakes are
there. The best if someone fixes VPU33 and then I rebase on top,
re-using fixed code as my base.

Best regards,
Krzysztof

