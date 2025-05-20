Return-Path: <linux-media+bounces-32875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB2AABD23A
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27A4C3A9A04
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 08:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16EC264626;
	Tue, 20 May 2025 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0Vw/Gvg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81707261568
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730686; cv=none; b=kxhpZOvsC5ZI4ivybSyp+LcHquMiTBh9/nb6obpnG5tHP4t6GiTk7qrxoBppLDPe1VNiNP2I+xaGs1KPyFdwkEkHGQ7Cpf+pRp/NUHmgMZzCCnosQNeLogU7CohhlwI8EKnkBAL7Be/wsxSK8IFkuCjJWpRONfSzXXXFYwhG6Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730686; c=relaxed/simple;
	bh=0Xj5LvDMQmjQ3ns62cVS3HXkgT/48XqUKBDRmHe1VEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrJPgXb+CDKC5j8xabhXWdZGLPTdNGqLSJY/en/PjRsv1jpGAPiH9Oi/DgK6j/47ESnIGNH33cehIbaHkOGPofwBmZE3yNhLQGsM0cwyebFW8EpBmJOjrXy9NiUbY+lUo15B5tB7aG535E0iOfu/emdQ6gGOZ5iOmbW4ypyVtEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z0Vw/Gvg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442fda876a6so35087875e9.0
        for <linux-media@vger.kernel.org>; Tue, 20 May 2025 01:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747730683; x=1748335483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWeDYPzer5lvmBWhpmwPGHZjl/AR9knlnJlWeNFa6z8=;
        b=z0Vw/GvggXMPg5Tb7PfNlyIZwPymP/sKOoMu8WZ2eMbyNYg7fiskP31/hH9+eV6Ngn
         +z5n+YmFDLJVS2IYejKgoculwr2ItvEz5K6GEymJM9TGr4JDJ+cg6+RiKvk+u4dfLUht
         3GvL+m8tmAdG7LQR+eJOpgL4wdt7tOZvwLEzYir+dOcEFmWqJy260+iAgfa1jr4aMhrK
         ZA+ZSXxneX8U9n03i6Y0ZI6lLCWDDur2Dx4KXLzkGTwWaOyjiaX/0Ooow8Br5U9Z8WGM
         8sGhZk+PeJx6g561GNwNAopYpF5G19HlQ6fW9G0jY3PDZGOhUkQzEERHyjhgOSMIgSBH
         QutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747730683; x=1748335483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWeDYPzer5lvmBWhpmwPGHZjl/AR9knlnJlWeNFa6z8=;
        b=CHo+F1ML73Hh2k7shTLdYM2K1GA22V/0iXVkLS3yp3qllXLAnAAgMdTQoOEU3V7xqY
         d8mwWnEcbT1jLwGa3Qt7Kc0FInx+XXpmwIAuYlCwrCXt6AmGsnksYUQ/2o57nfxcMI5e
         tyATsLC4iaVqWegtHtGVMDho0j/WrbT0lQN6WBNyRG1zfK+MUfE/mr94CRXjW7+5CFrq
         AS/osnFzWZEP8O9maPHF27+gFPEDzSKLyl5mTyTVlbl1P9rPFCzOqHOGNvxB4FUhgL/A
         VQ5e0CjRJTKP1CJ48dqUztYZkox/YrIrvDM2m2Ey3WAYp6u2BtgLAZcTuWGRlj8gJnhM
         CcYg==
X-Forwarded-Encrypted: i=1; AJvYcCXmCNNNm7jO4cbEsYjV4F0odMIgYkPO1D58D1lA3SVnM9BFUR7CaQNpUiI8NzLqpVaf5VoucChyrQ/INQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1bXLAGH10lXWzDQnwPkiKh2VMTNRoZSgKwnQfoTsTJCb1Chwh
	R/6MyI+WzjuU03fkJ9JEA7VcytPBDEihANS6mFZGIUBa2AFqHuRFuUPFVPwBJwINyUQ=
X-Gm-Gg: ASbGncsr9qhQTESJ5BIS4ybXGQ6bNYDdySetVgoGwcq8ewLSUMvv2SF+fDoGMgm0S23
	NSwCVDYwHKWIU0GMFMsLzu3dl5cE/COpz9aWU3zVF1A6OX07Gxhr/m3HgBrJtLoW9vHMjme5j8o
	wxiluvjdC4ppDUox2yq94PjrmfepKG7J67ZR2KMMxrvO1Usd8EBE7T34sVkC1rJC9CbYR9Nchac
	I1OMuqFljvlXd9RBoIzNN7GxsauyZ8qppj1nAHjAhnkVaEDl3LoYzi9ZvRlefmwdzhmy4+kOpgb
	2VfgnMyLh9+nBvM0/QTZiXVjxRHt26c8OlAlluETpiTZ+wYAObqGDsGF+Rfgd94Yo+ROMLwQGpl
	rAS1MjSwU+nUn53q1qIl8RTjkrXM=
X-Google-Smtp-Source: AGHT+IF6NhADUfXiocDJ+6PeTfYhBqXsTDb3TbAMg5ZVulgBv551nMiYfKj8WbDC+p8XrLioJ6C1Bw==
X-Received: by 2002:a05:600c:1e1c:b0:442:c98f:d8cf with SMTP id 5b1f17b1804b1-44302934f7bmr139974495e9.16.1747730682773;
        Tue, 20 May 2025 01:44:42 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm21711235e9.23.2025.05.20.01.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:44:42 -0700 (PDT)
Message-ID: <f4de3ab5-b40a-4d87-916b-8d1a1fb607b2@linaro.org>
Date: Tue, 20 May 2025 09:44:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
 <aCw09Vci12txhYj-@hovoldconsulting.com>
 <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>
 <aCw78CRda6VS6ost@hovoldconsulting.com>
 <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 09:30, Krzysztof Kozlowski wrote:
> On 20/05/2025 10:23, Johan Hovold wrote:
>> On Tue, May 20, 2025 at 10:02:32AM +0200, Krzysztof Kozlowski wrote:
>>> On 20/05/2025 09:53, Johan Hovold wrote:
>>
>>>> Spamming the logs as the driver currently does is clearly broken and
>>>> should be fixed. Keeping a hw version dev_dbg() is generally perfectly
>>>> fine, though.
>>
>>> My main argument, expressed in the commit msg to which no one objected,
>>> is that this debug is 100% useless: deducible from the compatible,
>>> always known upfront, always the same.
>>
>> To me that deduction does not seem straightforward, at least not without
>> access to internal qualcomm docs, for example:
>>
>> 	compatible = "qcom,sc8280xp-camss";
>>
>>          qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
>> 	qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
>>          qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
>>          qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
>>          qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
>>          qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
>>          qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
>>          qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
>>
> 
> I understand that deduction is not straightforward, but it is also a
> fixed one, meaning it will be always sc8280xp -> (vFOO, vBAR), thus the
> only usefulness of above is to map each compatible to pair of two HW
> versions. This can be done via debugfs interface once and stored in
> public docs. No need to do that mapping every time driver probes and my
> patches drop nice chunk of code, including indirect function calls.
> 
> At least so far no one objected that same compatible maps to same pairs
> of HW versions.
> 
>> Whether the hw version is actually useful to anyone debugging this
>> driver I can't say, but keeping it printed *once* seems perfectly
>> alright if someone wants to keep it (e.g. as we have a long history of
>> working around hw bugs based on revision information like this).
> 
> Now if you claim that one needs access to qcom docs to deduce it, I
> claim this version would be useful only to qcom people (or
> qcom-NDA-access-to-HPG) folks.
> 
> 
> Best regards,
> Krzysztof

I find the debug prints useful in that I know the hardware block has 
been powered on, clocked etc. I agree the number of those prints seems 
excessive.

The reason it is printed out multiple time is the blocks get powered on/off.

Personally I agree with Johan - it would be nice/useful to print it out 
once with DEBUG on, so that we know we have successfully powered-on and 
identified the blocks once.

Doing it over and over again is excessive as failure to power-on will 
surely produce error messages anyway.

---
bod

