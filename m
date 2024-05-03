Return-Path: <linux-media+bounces-10703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFFB8BB08A
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 18:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0B2A282E8B
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 16:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B37F4AEE5;
	Fri,  3 May 2024 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnNwcbKa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F714153BD2
	for <linux-media@vger.kernel.org>; Fri,  3 May 2024 16:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714752389; cv=none; b=VuIdtMgxUcLv2nYzYR2r8sHK+afIqjCMvEHURGDGdSHAWa4F4+bb2ail6zC6rFQvQnRcEh1o1+logJ27TShdhOwR3tTpW0JZg+nzd29hj/vEJvQ6007NFYZ2DpnWYHtrhHkEEZzxc9xnvNJdgo24X3B1GRtvYMgBarPuCI1c20M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714752389; c=relaxed/simple;
	bh=TouCGH5BPok4oaVsl/yEX4vdXHswWErpY8YWDlTAscY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q2RuPzldCinJAfJmBVxIlfmD4vpcq91Gks89npxQWTgmEj6m11vYVQWBxoSgd3GO5F2QetTyBtNoXKjdcOugGjEPasO9SGdPPArDXu4Pmt5QVnPDpxSMGyTV2x8zJ6mxJT6dRfVmkVfkN/EY+I+U0znH1YL2kQOS87b58aosnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnNwcbKa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41a72f3a20dso65501515e9.0
        for <linux-media@vger.kernel.org>; Fri, 03 May 2024 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714752386; x=1715357186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RbupB7f3aV2sszX3kEEkcJM0tmBKeeypaOUtnM8Pcmw=;
        b=jnNwcbKaijluQc96eVkjZ0OO+P4S3adRgV0cpdWD8C9JcjkWp5ycMidRkCyFZxRdY+
         Tjx82vmWTFjSAx1+xTuho6RZoh5sdLKDcSbfJ3FUke9yHzsExvkHV/b+AWGyf+Lpt0Lt
         JNB7j31w+vVaaN4foyUwv/9DzHozEh+q9Aj2Bwo/k7sK3ETZuOwPkllEfoJ6up5yLMYq
         8HqaKgCDyzncqj8jr0OUu33B4C17YTbmtConr/cRSNitRpDxtXQEiG6CofVWpiipb9ET
         KYAm2njEURbpaWwWaAfvb9bsInPvIsO1suakIOgYtLHSZArTlHwVgO4EKnUlxibl4qd9
         0bHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714752386; x=1715357186;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbupB7f3aV2sszX3kEEkcJM0tmBKeeypaOUtnM8Pcmw=;
        b=e9B2hJyg5c2zOyKA9Ln/zJi+qbNbe0ZgLfNvWRp09vzEUH6ogehSMp7eFiyqC6YWQg
         jzLY8XdoK9zWkkB42+hB+ftIkoZYPd7PkpS6qtgHLu88/Y1SwFczgniQ3OV22xq21ELQ
         6hyz1o2wxzDfYOT+sAjYLAybIeBabMhWrlhA/lYmchd2fUOyCjcj81H1TzAd5wm8oJnt
         CbX2YnkW5LVmEYBI5CqabRPNs94hxSDoTT6JyqFbBHvYYxD9z8K762krjpTDU+txfLG7
         IfnSnMCiZ5+bXuSM52LU8rdGpuIO0ljh5x98VTfK2h2/+830obbftXLUAQicYo4MsQmA
         f0GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdgStK8zadj6bhQuHQ1aafDMz6RK9ehw1RLUOhVowF69ij2dfxCO03cikKTlhqcc0GdfDWpsTONQdtjdn4RI1f3eFwzV2s/AG9MWE=
X-Gm-Message-State: AOJu0Yz30iR3U6BFPUM3OVU4HpRcWzI10iYQ5YwlntnE2G+T5afBvvq0
	iTeEE9bfn10GMnl9EoYsX6smB0BOHbNLUKxpC1RV8Is3UnJ9tps0inGRXbGozkk=
X-Google-Smtp-Source: AGHT+IExGOjq7cHgzt7HF328hWxDKfwf6uLJ3xTaEx61jCcmDImDNnnQkRoi1An+uovmvkneIPE69Q==
X-Received: by 2002:a05:600c:34d2:b0:41c:3e1:9dbd with SMTP id d18-20020a05600c34d200b0041c03e19dbdmr2238169wmq.40.1714752386391;
        Fri, 03 May 2024 09:06:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id u21-20020a05600c139500b004190d7126c0sm9847463wmf.38.2024.05.03.09.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 09:06:25 -0700 (PDT)
Message-ID: <4a75aae4-9ed6-4e7e-883f-23ffdc1354ec@linaro.org>
Date: Fri, 3 May 2024 18:06:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: Add ST VD56G3 camera sensor
 binding
To: Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Rob Herring <robh@kernel.org>
Cc: benjamin.mugnier@foss.st.com, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240417133453.17406-1-sylvain.petinot@foss.st.com>
 <20240417133453.17406-2-sylvain.petinot@foss.st.com>
 <20240418130916.GA1016598-robh@kernel.org>
 <e38eeaab-f3dd-4129-86aa-9f6bb03bdc40@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <e38eeaab-f3dd-4129-86aa-9f6bb03bdc40@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/05/2024 10:25, Sylvain Petinot wrote:
>>> +...
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 7c121493f43d..991e65627e18 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -20868,6 +20868,15 @@ S:	Maintained
>>>  F:	Documentation/hwmon/stpddc60.rst
>>>  F:	drivers/hwmon/pmbus/stpddc60.c
>>>  
>>> +ST VD56G3 DRIVER
>>> +M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>> +M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
>>> +L:	linux-media@vger.kernel.org
>>> +S:	Maintained
>>> +T:	git git://linuxtv.org/media_tree.git
>>
>> This should be covered by the media maintainer entry.
> 
> I'm really sorry but I don't see what you're referring to. Can you point
> me to the correct direction please ?
> 

Find the media maintainer entry. Do you see Git tree there? Then it is
done. Otherwise, do you have write commit access to above Git? Are you
going to commit to that Git?


Best regards,
Krzysztof


