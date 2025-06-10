Return-Path: <linux-media+bounces-34474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D077BAD426C
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 21:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 970C917B2D5
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 19:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC0C25DAE8;
	Tue, 10 Jun 2025 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tkNyE+SH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDB625DD12
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 19:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749582168; cv=none; b=p+cwFZJbIFnpvGz/WtGFM57rzHx9mAFRuxT5LLr3l7VtueacDD4daUZAAmFHIW/4VFg6u6rFNCsIAlsdYSsm5P8LgY/juCceiXW4q1w4AiGJdsxrx8AO0w2u2x765GXhMvi9jJwL+kG1hiBBELdzFylXtBdfMnshPDP8qP0xHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749582168; c=relaxed/simple;
	bh=rVgCB7d7YXT7wIutQuTOIOcSHXIfRaLciYLBxJ/BQ+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rohkWTk9IrnUjUV3Ws95QRVK4yaRvZKYYUlQvHk1my1L+U2n7MKRHzawu1yv7pK9W8e13Xyz2ERTeBmRqDTfKo2wQRAAi7Sa3+zkP5NCbGhzENpPiAt+gKy2Fb02C9ttjNEeDHV3rGQNzdWXCI8ksl1Mss3F6Stw3Ys46hWuQvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tkNyE+SH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so825275e9.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749582165; x=1750186965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0B62z85gJOzviEKEobgsDAJxP79FoIq671m5PuGPz8=;
        b=tkNyE+SHO/Fhy64hJhu5/hPcHaFrMEYeizRhKYv0ev/fqpw4zW9kVf61EFaX8SZuJ4
         bdiial7zjsftKx5H0ygPk2lVicILHo+DV0lRaeV1kYfIrmO8sTcGXg13AM/yGCLv0DME
         DFLXrWJ2zy8iZjlnqkjk2K7DU0D9uR1fZi+/uArnBhW8FDPo5mHGTJTp6yyrrBgvUgu7
         1v6N1QkM4cVZyz7SJ4KsEVng0lxxfzF48F6HB+xlecVg8Gt8uJk6gDYvtUwyRkR0QHQe
         0RbwhEvLW9siuXaIf/HeoYJQUx3WEPYlLIzokSlc9V1h06I0epzd/bz7o02NRoAjZeBR
         PEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749582165; x=1750186965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0B62z85gJOzviEKEobgsDAJxP79FoIq671m5PuGPz8=;
        b=Jhtu6omWX7nuZZJBsXD3fTJbpd1WCPw1toB8F6oDP7Wbm8kPsxGbd/bu76lwCTk13C
         +o0xfFwmUFf8TeDT/SfWNSjvPhx8yUgaQAAGgaYlRZJB6pWXzG667dRYxAfhaZnvusV4
         7utiDlBUeqP2GzJl0IKBRqIGbUHlxCDybzBS6lA/VZOkZ33BliL+aBQ5hRkZskjA8OEx
         Iq1adk0FQlOXIefegzscv5GFFAdEH/OfE6LbmDJrtOYDQ0+sBMVchVWRUWNQnSxRHXmh
         ScHVAjI7gMWrCVL0/mvUZiB18gurnTZ5seharymGuyNqMi/z1XmXgLCdlIOgR3aL4DUD
         kaog==
X-Forwarded-Encrypted: i=1; AJvYcCVUyEUYMqpiAjmGoTQfh0sHuVcjqlJWzcqq4TFA3+nCxMn72/LPd2MKIkl5UdDrNKvVxYIbPwuCFVb3Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz094VzdyX8Iw4HXSJZmbNfQ+28TFz4ZsYYtpxrIg5GOWRLhOzb
	GPCWrg8ZnihhHvZ8nuHF4zF74QsdiN6jRcR+1+J+eyt3wxczvnXxpZNqQTzqHhMMEGw=
X-Gm-Gg: ASbGncsYhrpSbtiZ9s/O1ubYPiKjnm/oVm87T+Mkr3XljvaHxT15khk0D3x1JCRpHhx
	F6UeiytjSQ9TNLjtlS2ZYFsTuo4kcByhso1U/hJ2XAsA7+pm1oQi0vbVHIu4R3uTzxzkh7ndRBK
	CF8DCVTbxpviyElEEpDHcMR0fTBZHcyzFOtaWDqsC2aI6lmY7gIjSmoIIr+0f+sc7qk9sXfPa1y
	kTc+1DCH03pjHUdCSOq13YCD+8/v10x+4pgyYWAA6c/tHJhQg0HeRBkQr3uyCa67Lo+lnMMQ3/L
	MnqK4YBJsMeN8P77IEJSPfP8cF3Xa5CCrqSpBSgL9q+lzBl2M1zToNKUweNRl7qxdgU9StePRWE
	U/KnexQ5G7q03EeiIcHpvaRi7oQ8=
X-Google-Smtp-Source: AGHT+IFwHj1Ai6p+bfN7fWQ4SsvEeoKINwwWMCKycaDl0KtYSEyjI42LVgjGupK18UiLTuO2p2Q3dg==
X-Received: by 2002:a05:600c:c494:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-4532426d53bmr4645735e9.2.1749582165343;
        Tue, 10 Jun 2025 12:02:45 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209ce1afasm151989555e9.10.2025.06.10.12.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 12:02:44 -0700 (PDT)
Message-ID: <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
Date: Tue, 10 Jun 2025 20:02:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>
>> List feedback from DT people is isp@ is the correct prefix.
>>
> 
> My bad, but I don't understand this comment, it seems irrelevant...
> 
> The expressed concern is about the novel label name.

I mean to say the feedback from Krzysztof was that we should use isp@ 
not camss@ and I agree.

---
bod

