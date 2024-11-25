Return-Path: <linux-media+bounces-21983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 947609D8630
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2EDEB32041
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C43F19E961;
	Mon, 25 Nov 2024 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Km27Eue9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48986199EB7
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732536900; cv=none; b=X+UqXzZoRF6Lzq9xVqjdNnQv/KIf3c7gdZayn2aE1Q4TyNfhcAZwxOVp97G5Hg3x534mT+uSvrqFn+Bjt4+LKh2wwhtYQ9jHueiVRKYvIXRf0gdKQRMh2vOV3BIGv6kZ3iq1IeYT0Y0VrE7XzWLZGk3fYtl2qRTeoDsxvSZciyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732536900; c=relaxed/simple;
	bh=5+CH4sdSb4Czej5uXH8PynFRcfA8UNoarY82ZAm5vwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umwE6lT7gGY/aa2vcXIC+9ktiib1gKEBKMxaQCd87Tbv0gowUmhNcFIpfhHUVT+u2DFaxFktZax/2AcAtCklO3IZRkd/l4xyOiJoyJBD49q4yMP4gvpcyluoNf1gIfQwigsCRu8Xo4jVgjD94iBxNDWoQPeoIOx3CWRzdoOtGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Km27Eue9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3823eb7ba72so2961533f8f.0
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 04:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732536896; x=1733141696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X6UVB80JNVzlmdkqfMX+y9fwa3r9eW7MOnFP/RliVH8=;
        b=Km27Eue9f+xnKzXMhunMfFzRbkQ38cPP596xux8urUzBxt+EGdSnIGTSDc8l+fNQJs
         59TckWYXVh5nGMMSKH+3EY9Q1TS2WXKnZTb29xLmv56a6BB7v25acmcSJrRdPIuY5EoP
         +q318zKzddV9bWKbl0b2+w97EmKWNNuBS/4raj7oojWHP4DDaDIhsUmYKjLPmByQerIq
         AU/FuJIyPHlplHOPAHkr3mPqv/hK4TnmHfV7IKVuIO0Tn7blZZLAHmIB2tj29qQhcWBv
         iGyNsJy5sXELgvzpLcekSjHU+O23DL+zLiTJX7bvNOGn76E45znbEqfjwGPyiZDpD0zQ
         h38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536896; x=1733141696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6UVB80JNVzlmdkqfMX+y9fwa3r9eW7MOnFP/RliVH8=;
        b=kMQoviS7eDV7oKTb2WQoU1+vIrN8Ysb9dEn22Tmmd92e6Y4rTxBY5vgiegilSAmHQ2
         k+Vy8tHylrCaWVdi70deQwW6iJUPBG65/CH49HY2ENxTpc0y+ePw7e77lQxrqDkv1qm3
         fRNobFoNUnWfwuj6gm85obtQsRLgbLHJGxa9ljF692+Jm0eaeCpn7/z/QKkhkAvA3nrB
         bl/TqnhYStu6j4qRxoPXHUhOuZOXuiWkezKOIC9CUPF7GUk0pHkir+d6ZvCZz0999j7f
         tolykEJjzPmEnXIHciKOz3FavLxxZfeQNv3RyVN4kX9B0iu3+Xk8888aHIdbZsjYFDYL
         tNNw==
X-Gm-Message-State: AOJu0YyYY8iI70obMoCuABp8sZJehdb/vUyLbgIGCB8LSYPnwSyWC0bl
	az3hDpaumecR++nmr1Q+JpC1zLxkbMdcngmPX3i8cYyPc9303xNaP23kiS01LSY=
X-Gm-Gg: ASbGncux5/1P/SdxJtYzIUtmGxh/DYCCsYVQBP63JGjJ/xF6t3vidQBawlvD93ZCwnY
	GONMIlKWOiNFs6VaOTLrUtCSBKvgwgAEjTxz+xrG0VpR3fqUddK36AfQEEMMFH/jpCNUiYQ6uoL
	M7OaPj4Muixi3rFn00RoRoGDxSPKehVNAhyTjMdvRH6Sq06F8tQugL5JsVe0aKku1d/Ex42vBlv
	SHwhKunnx9lJtpKrnZ7b55l0fVNQbQo+HckAiv959bmda5ea8EjAICH0PLbruM=
X-Google-Smtp-Source: AGHT+IHL5n7/E+eTCV55LW/mwE4Unl+wX5kIFsw4BH4g92rF5oirei1LF7bH/yT5C4hccVwg6ZNDEg==
X-Received: by 2002:a5d:6d05:0:b0:37d:49a1:40c7 with SMTP id ffacd0b85a97d-38260b7843amr11618659f8f.28.1732536896598;
        Mon, 25 Nov 2024 04:14:56 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825faf9a5asm10212032f8f.23.2024.11.25.04.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:14:56 -0800 (PST)
Message-ID: <310ec20b-3fbd-4c0f-8705-cff96bb6e4d3@linaro.org>
Date: Mon, 25 Nov 2024 12:14:55 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] media: qcom: camss: Re-structure
 camss_link_entities
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com
References: <20241125103457.1970608-1-quic_vikramsa@quicinc.com>
 <b27fe267-c722-4133-ad7c-bdb1ff573ee7@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b27fe267-c722-4133-ad7c-bdb1ff573ee7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 11:57, Vladimir Zapolskiy wrote:
> Hi Vikram,
> 
> On 11/25/24 12:34, Vikram Sharma wrote:
>> Refactor the camss_link_entities function by breaking it down into
>> three distinct functions. Each function will handle the linking of
>> a specific entity separately, enhancing readability.
>>
>> Changes in V3:
>> - Broke down the change in 2 patches. first one to functionally
>> decompose link error message. second to restrcture the link
>> function.
>> - Removed the declarion of camss_link_error from header file.
>> - Link to v2: https://lore.kernel.org/linux-arm- 
>> msm/20241112133846.2397017-1-quic_vikramsa@quicinc.com/
> 
> as I said last time I don't see the value of these changes.
> 
> Since the changes are non-functional, then hopefully there should be
> no issues with them, however I really miss the point of adding 65
> lines of code for a questionable reason and at the price of increased
> complexity.
> 
> Is there a good reason not to drop the series?
I think there is value in both functional decomposition and tidying up 
code - for example removing circuitous if/elses in favour of more 
discreet and easy to read functions, so I'm inclined to accept this series.

---
bod

