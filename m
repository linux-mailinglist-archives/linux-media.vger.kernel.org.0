Return-Path: <linux-media+bounces-42198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3168B51600
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63DA43BCF1F
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42FE30DEB0;
	Wed, 10 Sep 2025 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxVDaAsh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9CD30CD92
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757504516; cv=none; b=jpm3TzQ+3IHyu9EyNBWN1Kj9UArAxe3xyIp7pNlMD/is49Zb6pZiJXtdQR6LmMcJR0vi3or/VZpiRDRWlyOjRzj4On9nbaeInHnAalGft4zd2LBGgd742nz2zTO8FsEokUiBLJFoWOp7AcpmMnztkae+6f5zTS430lPxXkXZnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757504516; c=relaxed/simple;
	bh=R80lrQS1hQJF0roYzz0DTf0dlLu6IexIel/iumK3y4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCUnJ0eV0Tv+T5BKb/G77x3vCBEnrTMsv1HFTUq94fGUbNnFXVmLmQPLm3YN0gPGU9f6Ava3rKMlfA6+fQSunclnrPvWR1c9YFTyYxSqffvjgS8o7IOp62uTKUknHPX+/SA7Kl7y0daBFJeOvlklxqUs6gofs505Dej2DWFLiqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxVDaAsh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45de56a042dso23668135e9.3
        for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 04:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757504513; x=1758109313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shZJxLtW9iAiaEf/F/KUNA4WoMg1VvumYYY6r6PZJkc=;
        b=NxVDaAshFsgaAK4X7xC9jxYSWMowcAJt7SLKmBRMmhNAQEr1YYAECr02V3Iewd3s2h
         S6X4FWxwRYoTbwwBqfC7M7+nc4QtEHfoE1qDena3ps3yUqC5QMZeNSVakbzDUUxbdUmd
         AHW5VBPcc5wTkG75SFllmTawOnCnrcKf8sPQJwIKgE5w7z8jWurQ3ULvVjTcfubU7ysT
         4ARK2gNFwpwSJo4dOHrTJq4Ch8J5JmKLlVY71tZT23h+Uj69vC5mNavLWLSHxuYp4Bz5
         +LFDsuFnMyQi0Zz9bjJ0AK0T8kBqCYc1TsgYbNVmUYoDCIrNyfKKflltQcHH30G8MX5F
         q02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757504513; x=1758109313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shZJxLtW9iAiaEf/F/KUNA4WoMg1VvumYYY6r6PZJkc=;
        b=tz+IpMPA9MW62EF5xfcaIXVjT/H19B7Co4XUZsTwcLCJOx62EqOMy87n46xM8n8wMZ
         Lp01bwoqbcrCAr4rqj3eKkQhyjevZL7iVttLp1d//F5bJs43PornfmDHM0QbRKs1iz8z
         ZgAd7k5v4n81Hi9hTG55JjFPEP9pEUz9Hx0KdZzDIGCfAV+sivB29HFIfjdV8MgZ21Rd
         mG5NsWC51+VtPFmpYS41nDSYz2cSxrMjlCqcvsxdcsnglNhAxLsvgju3vieBtW3n8zjA
         9z8rzs7LeH6blHKnoWqgmUTyg61ZlGRXkMjZ0loHbP8ea6vrtF7+FIg64JnbiQOVvPsN
         lmKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUlbR6sx4TPvPdfmpBijInz+naFeXuVbdrIKoocWrXD+y/oTh33qKmPgLigx0OV+3qs6/+dCDJYR1//g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZxoShe/5GDI4lilpc2zhoOX9hKsRb47ALgx0m5PP+hMVHhA9f
	m/YZC+fjKAPKDHXuuL9l9I3uTy0j7QznyfQyN0gEewPj7YzTrMASzpd9MnJWKQa8zPI=
X-Gm-Gg: ASbGncvIo94ZP4qSpwhuD8TLe+kAwAoq9dDp54dvQqOyaMko5VXC9a0Dv2bzYe46Tpr
	iyryWb2rKQMvwj1xenmshHqmL1SGH3nb06XG10ON9f6lVbBbYWcgD9XbEYfNBmfmV1oaI8URczP
	6+yQG7yKUJl1Ei7NFe9BW3V83tqOsHvuESHKiSXCzWecZgO9DgdirxnzTAkOXXF2FORAWr+I7VO
	Ttgc11P8hKpDusNVaKHhleWzaBIXcy6YA8P8REHV04FqPI51r5OorwPkaAXXoVXsdEFgKLdLRoI
	n3ULiRndtIF3f7jw4W86hxa6jsbbVwaQj2a3uLY/BD9O2R/SPL/nLKoURKV2HsaFQC7e36kP8R0
	xpxc26ANcI1P8fT27oScF/1qeDjdx+K6a/QJJq9hRy1CWiFMHZPiUhr7dV+Cnp5PhAWhlg5AMWr
	4pG1LXy0edwThnlWCRuC8=
X-Google-Smtp-Source: AGHT+IGlxSt/xs7I3D7ZMakn9Gr+X1/Zuc0c5vvYIA/kLFFFxTaanjZmiqDr4kYOYkKHuiNeNUlj3A==
X-Received: by 2002:a05:600c:4453:b0:45b:9c37:6c92 with SMTP id 5b1f17b1804b1-45dddef02f7mr145102055e9.31.1757504512855;
        Wed, 10 Sep 2025 04:41:52 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8259524sm24547495e9.21.2025.09.10.04.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 04:41:52 -0700 (PDT)
Message-ID: <61b562ad-eb67-4917-a449-f5556c43ceef@linaro.org>
Date: Wed, 10 Sep 2025 12:41:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: media: camss: Add qcs8300 supplies
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-5-quic_vikramsa@quicinc.com>
 <e4d3c2a3-e395-4f60-8cff-fbb9a1611ec2@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e4d3c2a3-e395-4f60-8cff-fbb9a1611ec2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2025 08:02, Krzysztof Kozlowski wrote:
> On 09/09/2025 13:42, Vikram Sharma wrote:
>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>
>> Add vdda-phy-supply and vdda-pll-supply to the qcom,qcs8300-camss binding.
>>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
> 
> There is no such file. Why are you not fixing the patches on the list?
> 
> 
> Best regards,
> Krzysztof

The easiest thing for me to do here is to take this patch and send out 
another PR.

I can fix the commit log too.

---
bod

