Return-Path: <linux-media+bounces-16357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470F953C9C
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 23:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64FE287626
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 21:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7403A14B960;
	Thu, 15 Aug 2024 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T2u84iGk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC014D2A6
	for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 21:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723757470; cv=none; b=Ks+E/ZKJOnmzGPsuBpGD/ISRqTLpPVUhr7WDQ7LfiSi+QY103PzJglWpRfTte0ugIb5MMrd5owodARxB0cHQYyHLTB5qtWP7HRaNkKbCRZ3iXAu2TlEg5cGfb3OcKHU4vvY9hNzsgtbZaFkYaGBiBLRPhWt/NNEiH9d0KNainnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723757470; c=relaxed/simple;
	bh=bBhD2UVKdIi/pLUo9qeSoZ/3rVNP5+ExM5I1cdnBsSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRb6c0WatJCO8qhdjx0hSO1LkzqO6jHISJ4NZwg6mMprFvE0yXSQlInd4Bqdc3+oN2LIq3R8F6WzCcDIwa4ndZooY+L0rIGU91lIaE9U6/MW1w4j/jwk3zAoWt3ulu54L/IqYoeHK6WKY6vgHZdQBFXqFTTtem18GXiSTzoJ49Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T2u84iGk; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef2687d604so1354111fa.0
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 14:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723757467; x=1724362267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aj3ozXYdzeekQq7OfG9J9RbzOXbJtbjXaVZN/oAjRbU=;
        b=T2u84iGkowlz/SwNVxNYKFsjD/Sx/5r0rsqOlhSMeBQMjkPnha1oGnk7z9SXTSxwMy
         T/cCUdJmr9kCEIYXet0OkAQwqbspYxfhp4Rwa6287XNJNAPiUZfw6czYjbMUREKfGjkQ
         oHDA1kmRmWaBL/dqS22KEIymi8ovPZlMuep66oLsOOLHExRh7OTaRfJpymvKhpVCiZAZ
         FnbbbsdAE3ty5HYtKc9MF27zBq2vXGeGjaawJMqsbOwJ7qbVQAPZ8U8teM1OifmGJgiD
         XK8xs5Xr+Eu2O2gjWc5zLqeluqpbfFXJpoOUolzTnFlYciAcM+coq2NCmZNk5hTu7D9q
         AWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723757467; x=1724362267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aj3ozXYdzeekQq7OfG9J9RbzOXbJtbjXaVZN/oAjRbU=;
        b=Dd3bTdwReGh9qNiMBUpJRSLu7vO78RJXM3Z+zMhlvYsZpuukIThudwTcZvef/y3swx
         +2D1eY238eUqm2mB9cLKQMX5YE7Oji0EqyREWaTV6U5whC8+E8d1hcORK3SbCfv7jgzG
         +D+lMHSB/vSdaS90Gd9zjgZHfGmnFDjFOjN7lszYGTSxnEHMV+72X0g5K3/TuCZH52bi
         7tLbCpFmqaejqvPdYr7pN3CAbheUx6RHvOBAWp08LJg+HtL8fHMdKLBIwb4Y70k3hL33
         FucA9f/UDXIiU/DlJ7CnL3mPr3ijkHlkQwOB9jKHK8xYaiKzT6lQhbLcuT9iSRecoM7q
         otZA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Z0mpT+PCRWTCLEwUfSJZQoCqVgc3hMjjOUFtXAm6GogHbv5T3mK2jKCoaLT+sqgRi5Zn7lQi3QpjqWmQhbiHOuPJs5b30oZqU3E=
X-Gm-Message-State: AOJu0YxsR+Z7AyKKJ7IsdIXBSfoIDxGO9l8iKCFZDUK38ZEdxJDSPAcj
	iD9XmNJ17vna7aWTibkA6HXHxxrDKhGm6HTDSkDzjBsgj2WltOpm1moGuo7C66c=
X-Google-Smtp-Source: AGHT+IHtyuhBpS1ajBq71Vtt7+Xvd1FZ6TXLAEnoHPJ7SGlONaTy9h3p1wttBpPuhwPk8SEcEyX1XQ==
X-Received: by 2002:a05:651c:19a9:b0:2ef:23af:f1f2 with SMTP id 38308e7fff4ca-2f3be78709cmr3161651fa.9.1723757466681;
        Thu, 15 Aug 2024 14:31:06 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f3b774b2adsm3268241fa.133.2024.08.15.14.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 14:31:06 -0700 (PDT)
Message-ID: <56211603-de02-4b8f-a7c6-a4d80ace4e2f@linaro.org>
Date: Fri, 16 Aug 2024 00:31:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <4b745c1a-33d9-472a-97af-153a2a7c8721@linaro.org>
 <2de0b7a8-b879-49e9-9656-ec86f29ce559@quicinc.com>
 <b0787142-0f85-4616-9895-72e33f21c2da@linaro.org>
 <82200889-a98d-4815-bc31-f81b15d02513@quicinc.com>
 <7130beef-7787-42a1-85c8-f27574241ba7@linaro.org>
 <5ecbcd10-d9b7-4134-9666-6df790527b1f@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5ecbcd10-d9b7-4134-9666-6df790527b1f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Depeng.

On 8/15/24 18:43, Depeng Shao wrote:
> Hi Vladimir,
> 
>>>
>>> Thanks for the confirmation, even though I add the rup_update and
>>> buf_done function in later commits, it is still called in platform
>>> specific code(camss-vfe-780.c), so I will keep as it is done today.
>>
>> let it be so.
>>
>> I have another ask about it, please move new camss_reg_update() out from
>> camss.c into camss-csid.c, and camss_buf_done() from camss.c into camss-
>> vfe.c
>>
> 
> The cross direct call has been removed by below commit, so it looks
> strange if I add the cross direct call.
> 
> media: qcom: camss: Decouple VFE from CSID
> https://lore.kernel.org/lkml/20240522154659.510-9-quic_grosikop@quicinc.com/

This I don't understand, please elaborate. I don't ask for a "cross direct
call", but you do introduce a CSID specific function in the generic camss.c
and another VFE specific function in the same camss.c

What I ask is just move the current versions of camss_buf_done() and
camss_reg_update() out from camss.c to the files, which are related to the
sub-IP blocks, and of course move the function declarations from camss.h
into camss-vfe.h and camss-csid.h respectively.

If possible there shall be no CSID or VFE specific specific code in camss.c,
and that fact is that it's possible.

> I use the v4l2_subdev_notify to do the cross communication in v1 and v2
> series, but Bryan said, "The subdev notify is I think not the right fit
> for this purpose within our driver.".

As far as I see all of that is irrelevant.

> Then I add an internal notify interface in camss structure, but Bryan
> suggested to use direct call, so I add these functions directly in camss.c
> 
> https://lore.kernel.org/all/236cfe43-8321-4168-8630-fb9528f581bd@linaro.org/
> 

--
Best wishes,
Vladimir

