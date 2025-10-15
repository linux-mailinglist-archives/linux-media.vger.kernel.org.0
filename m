Return-Path: <linux-media+bounces-44623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E627BE052C
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 21:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D548E428104
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 19:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B4C283686;
	Wed, 15 Oct 2025 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJG/aXgq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5DF325480
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760555547; cv=none; b=YD9CSb+c6KNOi+nOBCDukerOA5X/cd1jKdcPBaQKN2pGiKjkdt16mmmSWUSXE9RWRVNBFfekdYSn3o/aRZUbEFYxRiEKSRuqGyWGx1kda/ak7kuwr7Nr0+iDsTpR4Pw906IULC3CcGIZX25UR+gkCyMgGrDiEq4uI0gLcoXH3ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760555547; c=relaxed/simple;
	bh=4QK2T6kGZyFylzPYSzPxH+9bXfmmQQta6fIUzxi82kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpS/+ccwCMswY9/SxsOUuaJ6NQ+62QpsBzmlOueR37tRtsPlJSsk/TddoRZms4xM4i9aMcWqwFr3KRIEoc5aLELAsG/o2wJdbK49ar4lgql0OgWNA7ahZp8EpVnfHslU20YsKt7QS6jdC9EABM6tU5CpZ1MP3f523/hmPxmLjaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJG/aXgq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so70896725e9.2
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 12:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760555544; x=1761160344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zX0FQJMNOkesxTSiczvMscK9aHeUEgUhQXWADwrmqhs=;
        b=pJG/aXgqTPZ6GB70+XnOb3h9OZZnIcsS0otLdSaGUVnkmYKNx3qz8fuMEtTm+nec2i
         356bG56xys9klBWxh+4vX/HXlMhSQesz0UeFhRVLfCd86ms8XizN40N8lANcmaQ5cggX
         PWVdsrcL85RtAIW15UT+Xw+fE+JssJhyDjAMydB5o2wcIA8XIeVg8fEhCTYQTG/DmYoU
         RMWyfK43dGV5ApmMTKCg5zZg2q1RR1rjVZG2FMJ1DziiKwmRvEmr4BCFvCEeR1jJ56uq
         GrBOfA0e+EJg+3VQSbQYmQq74bOpbyYcSeh/3e6KTt/KyaEnkEHj5RjdpV4m4F0Pjcqt
         Euvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760555544; x=1761160344;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zX0FQJMNOkesxTSiczvMscK9aHeUEgUhQXWADwrmqhs=;
        b=jPeRLCPKLzK+m6QPNd0mpdHN5/9hnP1LqWo+IPq2QYkKrp/GNqx/WGW2+PbVZgCGH3
         55fEuRSd/XzmmBjgWvEu6OL4NccmN38+7G71xzT0STrYUkOXVJgl+n6fs5lIbjiJ3DG9
         kyWd2HZ3AX8k5XYrdSsrABRv7TIrzY60Of6fspK+Ux/O4IUzeAwkV8cdGMLRn/CYugOJ
         HvJNg0IG3aFErdMg054dWGYgK/W+0dUqHzu7ASFtU3RXlwHYWlqqJcrUa0u1McOEr7Y7
         lEmZB45ZqDk3PEi1YtBEXETGqIWC1rgHLXyjkVTbcbwXmjHGKLrFAteLf8HNNO3wzOV0
         UjNw==
X-Forwarded-Encrypted: i=1; AJvYcCVji7edpFrVyIGyTVqkrBENMGn8pJijbXcIRENdPxmPMT9ltonBXxS1vlYkmLuX08iskwCgBeekPGhaIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeZfsz+D24EKnEzR8xeKlJ6HIq3dvFfRVMNNkoVm6wH2LuanzQ
	OzgHK/7pNOyVmQQlx60rKzEKwNV6vWIef/Gpk8GzU8Oro4vLwlE2V+x9WohW+hFJp9s=
X-Gm-Gg: ASbGncsbU9cnETmPX8NKGgTpfUT9UyKmo/3qGprTGdVKSLwE5QqOOGIaO6AgQu2G+4D
	XKtQJqfGM3beSQ7dFQV8+gk+GxK6kYMucnxcgyT4w83CBqLlW5znHKrlL881qdzN2RWlfCs3H5P
	sR4EOs6tNf7ZhPYpBkXY8A1HeNvgcYMqfVq0GfqaQGpbSSlI3s2VB3+HZ5lGE/+mrhUU5rqBYc/
	IA5sDYH7gdOyqx2+FSpdB5N6h1XFxdI7K9JUC4bp49JJMTB8sCe+x2gRg90Xc199L+dITvdHomD
	r3aq90V2JfsguuroqxOTHKfh0bpj/+VElwtfPWRLyzq1HNim1muBOMIUajEJrOsD1OSDS7NMhw+
	hosjBps5QkF8jYfSi5cW9yblrO8Uk5C+qoB6E4HpcmemiQ5qRovT/QetfOUkHWZ0jByJvujOUWW
	1q/3hgTDeLF4zubk8mA4ZqDw==
X-Google-Smtp-Source: AGHT+IHbd0cW44W3/gflLhZW99H6UzVn2a320v+osYcGxzgftCt49JmvdlRHRiYyZeC4FCtJAzNpwA==
X-Received: by 2002:a05:600c:6383:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-46fa9a8b48dmr229438345e9.6.1760555543790;
        Wed, 15 Oct 2025 12:12:23 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm32016093f8f.10.2025.10.15.12.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:12:23 -0700 (PDT)
Message-ID: <15b35191-eaff-4971-bae5-2d5a8cb9f864@linaro.org>
Date: Wed, 15 Oct 2025 20:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
 <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/10/2025 19:41, Vladimir Zapolskiy wrote:
> On 10/15/25 16:01, Vikram Sharma wrote:
>> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
>> CAMSS binding to reflect camera sensor hardware requirements.
> 
> What are "camera sensor hardware requirements"? You do add properties
> to the ISP.
> 
>>
>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300- 
>> camss.yaml
>> index 80a4540a22dc..dce0a1fcb10c 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>> @@ -120,6 +120,14 @@ properties:
>>       items:
>>         - const: top
>> +  vdda-phy-supply:
>> +    description:
>> +      Phandle to a regulator supply to PHY core block.
> 
> What is "PHY core block" here?

I mean come on, I think the meaning is clear.

>> +
>> +  vdda-pll-supply:
>> +    description:
>> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> 
> This is a copy-paste example of a known to be wrong pattern.

You're right about the name, please align with this commit

git show cba308979b012664c7fe7c5baa818fcb68e86363

Thanks for spotting.

---
bod

