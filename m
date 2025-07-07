Return-Path: <linux-media+bounces-36970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E483AFAFB6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 11:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 451A51AA2050
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FC6291C10;
	Mon,  7 Jul 2025 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wahg4mq8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181FE28F955
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880602; cv=none; b=XDiQ9T0iDWWSJG9KFJYR1zt/X/n6P6XQzyp+YGk5+Cy7zvZI9O8USljtfDIi9+7KVmgfVx5X4ORBkMeZkzKFd9LjKPm+2S980ih3q11Qj/Eykm1r/6Rq515NYe4jg3OGUp5ilLD/WzQCGM7+9Gyu1atWvtjjmM0krlqFf/pnATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880602; c=relaxed/simple;
	bh=Tcz/ZSON6tyal3jWImYScvZPwBqGMsZpcQToQ5CN7DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KlxqkVxPnplaGyRVd3GdomMBArPHZCDVfl7nGbbuxTbIr+mzsyT0owJb2L5Hwj1Mw3DBsHHnVzD2/XHPP2JY+HhdIlBYV6K7T7CW3FF2O3ZN7l4XFgBDF6FvZ34R/Pfd318CytZcvhBdG7M4J/UiUW/bmAETyRbgSvTjnZZElhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wahg4mq8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so1772002f8f.2
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751880598; x=1752485398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IG5Dp7YEckX2tzrC76ZgnO2aWG2ab/HrAoOTloA/d6s=;
        b=wahg4mq8wZ3AoWxrd8aqF0xLGbOmgqzToBp7PaAZi/yW4e07Ky64sXpFueo7mF9ptp
         n66O2IBKAUiSNnA1HaBPThAiSQn4nxrCedyHkzoMNUSLn8lS5g9aEpJFGwSnbm/EAv9P
         yKEzOSugrv28+S8KJOefZwfvVrKwtUqZdsKjvjkMvEfYhmSl1d1ltM2kSYkZ570zF0OL
         zNqLrAMw28uXZWhtnEO6Ryn0vMF4hDPT1lEWVWkEktAObBtdfyRLHgPIWEwbKpx2twNC
         AzXEMz28dnVkZGBysQKzw1nwMMd4X4/WEZNLEKchGonDEgihp18q3qcF32toZzeBMEfw
         3www==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880598; x=1752485398;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IG5Dp7YEckX2tzrC76ZgnO2aWG2ab/HrAoOTloA/d6s=;
        b=QRby+ZlO1W1N/nQoEEfasmO1TnqUH/Z7NdfnRo+tB2OrsA1e8fw+avfoxCuvlWJUpa
         hDj0D7RBKnMdFQ/ERTwysKyADPfMU9cmdFU8JrPz36Uf/owstYw+pgCekA7W4boTWv1m
         bQYnBoKknoCAYmYZtji9fQ+kAaD74LvXCQ1oX18QgTHFBr0QfG2G0dYhgA5Fy0e0HLjC
         z1zTJjArniVc9dP/WF+a0P5EdvcIGWzHtVb7klNDNkdVTKw6hjEqz1GdvTrFG7OYcXrt
         dimvCkdLEKrIhOayIl14D8T28hGKuTdmqghUbQDT6qKXa7lrPM0h1MNR8EQmW0/fO2BK
         aP6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRqUfupdurMxj+TXi+DuLHmzCrdyEHfut/BuHLdAp+k82FTIsIavEfvGawP1WIu888rMW9V1Q7yRUwdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzlv4oRILgrUidsFLnfYrzgBkrutBh0LjP8Ds6x//4W78yU42j
	pxfYX/2SLVF3ieEho70kgC8Sp9oxRAvzs42aVVNOdqwz2EAaj9AoARhVq/mJxW22Ebw=
X-Gm-Gg: ASbGncuVTCojryBvE9AKFog18MJQ9Ig40zejSInRO+j74gNtZ3o9z/++8L/iS/QTQg1
	Q71eQicaxtfeg5LoZbMQQRCRTDTfkKbuZMPQfKyFJ5WQ44d9ydD7AT1axZgPfjzRJdr6/V+nSNJ
	lepRbaSTwmVwUubkZXFzX70JdXYonpMHclQW86rSPGV6ZVVNxrd4jJHA0XtJCUWPZ++fylSomQ6
	JOAQf8m/P3n2k7jwlpcoFFlnysMv1e+ELKMFqQwQJbki+1yh++LIny9nUYGVK2qCbpuHiErV7hq
	pOjj1sz1iul8KqR9SfL4/2iRkSOLup7XUQZkrxW/dx5QS8C/deMtjHCMlMhoANAR0dcGkVy9PSF
	hRgKDYukuYde8+n3YWBSH90CiW4RCq6BQTjVDww==
X-Google-Smtp-Source: AGHT+IH6vBe89bzij44XDEItcxOcNLjzsQbkPRwS+ZfcpIFZigGMShngtte+AasQfadHQ7sAC2jgvw==
X-Received: by 2002:a05:6000:430a:b0:3a6:d403:6e75 with SMTP id ffacd0b85a97d-3b49a9fed4emr4082140f8f.4.1751880598209;
        Mon, 07 Jul 2025 02:29:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b46d4c8619sm9520972f8f.0.2025.07.07.02.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 02:29:57 -0700 (PDT)
Message-ID: <cce7a38c-a90b-4f9d-b1cd-06dfadef2159@linaro.org>
Date: Mon, 7 Jul 2025 10:29:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
 quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com> <aGuOMrjfQBNYAjmF@trex>
 <aGuS1X+RfX38krpf@trex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aGuS1X+RfX38krpf@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2025 10:26, Jorge Ramirez wrote:
>>>> +    maxItems: 5
>>> 2 should be good to support non secure usecases. 5 not needed.
>> ok
> isnt it better to just leave 5 here - thinking of the future support for
> secure buffers - and just update the dts?

It should describe the real capabilities of the hardware, not the 
expected use-cases.

---
bod

