Return-Path: <linux-media+bounces-7432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2238814FB
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 16:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A32E91F21E94
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 15:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A059654FAD;
	Wed, 20 Mar 2024 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jZIHFm1y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C6F54BF7
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710949995; cv=none; b=Pg4FulWPl352vxrdN+y4stdkmJP00X+p80QSIOKUR9VDSSjpHxALPcTMEAs81nqt7V19MA0OM9alb/6rgUUFH4c+PAUOau+cj5157fecaZ6qyvRdnzPtsmgnX1bYuapk9H1DE81LnyuuYK+vhogu5QlBk7Lvlmw17vbyEZtZRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710949995; c=relaxed/simple;
	bh=MfcBgDfPvff0AWarnVaEuRLv0qFXgnBjoPJHUPjUFo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTqHJoGg90baKN706Q+tUdfGx6pPNMVBM2PN1Df6LdlmS7LBT7Irb1kvOF/whal4JoiEAX+K19/IXTD2AdUaRHzCX0U7DstzQaLApQk/6EvsoKU4izJz2Foj9f2JjlVXSop82RNkh13X+09c61Zg+BjZ2rZRKoZ+6ZAhwDLqcgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jZIHFm1y; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4146e9eadfaso3946875e9.3
        for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710949991; x=1711554791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JIWKVzwazGNc+LuikEYYEkUxdrkXemxYcbgcBcqPCCc=;
        b=jZIHFm1yHz+9JOS161pahJX3TXTU9y4LsKqeLTZhAFtfIMzAUExtrf7LEKYBZOLtNU
         Zb03jRcW25WU2o9EYoeAfVXVCRrDpvFoK7UMC7DQRjuAEBoC1yhhS8ptSW77N8Sw+ANL
         FBTda9OPXSM/dfPbE2/DtCjVSdbqvJ0NWYBaV1aVHI4K/VO3n8HEqAgqnZEQgWmH2HX7
         4ZyNOfqgHf7wE08fFIqYiBtCZ5GPaLI6tI7YlvBzFx12VMfatRFuzHM/vAkIMFOb6+zV
         XqXw1yTsv4VYNUNaWLD7pxEl32UFonAiTlmIwJOwoYuXOJ0D2GEnL1Y3OJipCv5YA77D
         QgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710949991; x=1711554791;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIWKVzwazGNc+LuikEYYEkUxdrkXemxYcbgcBcqPCCc=;
        b=wyEXFn+LG4TB7aSCcNU8L6r2Olnre2S3/b+i64NQPMr/eyIc42SFbo1XXlNoNzHDON
         FVIEfeLQHpvY3JMVWR2U6kCkvsz5qoID+7Iit9Q6uUoJ2D9Olfi0A1yLaOo0+fQDnDgf
         PhDyqcRPbCb6lheMENjlVLjy7/8aNQBw55RjFiEDA+kn/Zc5S6sH9VdzGVfOAGdYGsUH
         W5gUau54qAxF5+76NrJpt0DnjS4TXRGkV44clJRsLBXZc45mCFMzGvN4YsiLZpPEMg5Q
         0mE98TRhgiKBTM0JhR3EHNHp3DxxGibE1fKfr/ANwBZPzCgqCpWQwfi77xvakcwJ36Cr
         3GHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSkqMXQkOc+kp5NbJhHmbIpxj0cRoUoiKZyvYQiS3YjAqynJ5XP1xDeury8Iiw1lTCMPLwzlndkQ+inRV26MFEYKtZjpFd9FCWuVE=
X-Gm-Message-State: AOJu0YyxjRo2P2zcP5SszkIlaA3Kr8ToTyQMjh2kOjQijY46GTAsEG0R
	Je10tcEW9KQYA/P//UsWWFx4lPm/4ywSqDX/ZcbsLZwGFY27z+CMrakdyaX5xME=
X-Google-Smtp-Source: AGHT+IFfMuzR4KHJ23h9jEnJ0HAxseLpTPp/jJ+UgXkwTsmnSYdXQFyHKchgjH73mFjGxjSbpHvsLg==
X-Received: by 2002:adf:db4a:0:b0:33e:7831:8f69 with SMTP id f10-20020adfdb4a000000b0033e78318f69mr4517054wrj.32.1710949990870;
        Wed, 20 Mar 2024 08:53:10 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id bw11-20020a0560001f8b00b0033e7a204dc7sm4401564wrb.32.2024.03.20.08.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 08:53:10 -0700 (PDT)
Message-ID: <059af407-8c12-4773-810e-09dc66e31d39@linaro.org>
Date: Wed, 20 Mar 2024 15:53:09 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: qcom: camss: Add CAMSS_8550 enum
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-2-quic_depengs@quicinc.com>
 <bef76969-17df-42d0-82aa-59a75a488cb0@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bef76969-17df-42d0-82aa-59a75a488cb0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/2024 15:51, Krzysztof Kozlowski wrote:
> On 20/03/2024 15:11, Depeng Shao wrote:
>> From: Yongsheng Li <quic_yon@quicinc.com>
>>
>> Adds a CAMSS SoC identifier for the sm8550.
> 
> Why?
> 
>>
>> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
>> ---
>>   drivers/media/platform/qcom/camss/camss.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
>> index ac15fe23a702..2f63206a8463 100644
>> --- a/drivers/media/platform/qcom/camss/camss.h
>> +++ b/drivers/media/platform/qcom/camss/camss.h
>> @@ -78,6 +78,7 @@ enum camss_version {
>>   	CAMSS_845,
>>   	CAMSS_8250,
>>   	CAMSS_8280XP,
>> +	CAMSS_8550,
>>   };
> 
> What is the point of this patch alone? What does it change? Why adding
> enum? In the next patch, are you going to add one line to some
> kerneldoc? Another patch, one function?
> 
> Best regards,
> Krzysztof
> 

Yeah true enough, you could also add this enum where you use it..

---
bod

