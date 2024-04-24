Return-Path: <linux-media+bounces-9994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8939E8B069E
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 11:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD982B227D1
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 09:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB6815990E;
	Wed, 24 Apr 2024 09:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldn2y5pj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDDF1598FD
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713952554; cv=none; b=DVeGUfrqeYsWdJa3bbNP4a/oI6NyKXN+NAcz0KBAby6/DD9TCFxW1nhplPIYTIFecIyUUMaNBv1+fhurn5la6ySBwkbgJ4MsmLf6n7rdVKF06J1GPLpZvFzN3yIesTz+5Wkr1/2yyLn2cAvqXr6xdP6T6zTWUoqrioo51ENjK0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713952554; c=relaxed/simple;
	bh=gmI75FS6suiOP9ogaWAXodFk+XJnFCT0SIL9OaoUmpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PleiNI/GGaDPSlueuZLaU5lpLFaSI4Kj4UkNVm/Pp0THAXviwhoXTHccWOjr8C2aBahSyFIgS32EjPgHBTU8DaYLfuD8tjDDtcvC/3HA3jMTEiUpVt/pRCnY0kMqGutMkU9Btv1bojmYw89/0zUSr3zUBUT1XQe/EACxZEE3b48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldn2y5pj; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-34b64b7728cso1615526f8f.0
        for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713952551; x=1714557351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ynqVW3ECGmeDU6rhv1zDweO2ynf/w2KtnDZdanRG0w=;
        b=ldn2y5pjcWxgv6cAavX+wIWBX1kLtZXBgibAdDCEENCFGNa2MM2tIfMkdB3TuyrJt1
         ASuxgBNwhGW0cBydZ9nPEMA4KY/R1fFre1VtCXddX9+KRuC0YuIQhgaUI/KAoLGUv3OL
         ep8uzNNOXTaYcKTFQ6EIsFkGRHv1V+RAaECJF5OPaLmOkEq3aSnezibaSH1jowAMP3SS
         8DV3YnXitsDlQ7JeXKqFS7xJ+Byyw9TmLOqrNylhETjIIw6IY9QnhgL5yXUd5PjWAGcZ
         XJGn+FKoEDG5VESmQ1LuAtEFub2NIb/qDOGV/XpZxLc9vHbr04MjDzdaRozKfMToh0py
         bUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713952551; x=1714557351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ynqVW3ECGmeDU6rhv1zDweO2ynf/w2KtnDZdanRG0w=;
        b=O1lNf56qo15MA8X53m8RMMeWbT6D8uNfLjM3wZMvKUKxcJr+g8Dcv/Az7FOSJjfbUX
         CxeHW86VkZ8XrseLn+XAbvseqV/TYRTw4l/kU/ritOoPJ+dtjIOCYyXV3gN4Q5/NP8Br
         sL58j5BQeKwvcD+/FWoQgXEys4W9040GLHWBTwqjifKHzVsGdxZn0dVMLiWExSSwJn7U
         CyFfh2+HSHLiLT+wYYGnq/sF6VTz+tajBLlpGvYgTtCLeINCOC+I1yK9iJHV/EIvLuI2
         93ODag9RVulmB9QFB5BJLM/MWXra/A5ZJrxS/5bMpysp9K7zsW0Ms8CJFQZWzcPCfzRQ
         7KZw==
X-Forwarded-Encrypted: i=1; AJvYcCX0qCUfEXACNUhsv7BewVq6wXm62UWxHn5Wi5GYe6UGN9rYiYTai5Sf9SUM7UjfHlv54Q3DMqOZmM3KnPSVF+noXgbj5ZHXpSTYU8E=
X-Gm-Message-State: AOJu0YxPCoTe+Bt94xW1ZSUSwTwpQILvJ2bw16ZSUjdX+vNpDVrNLPzX
	UaPYaXNfScou0yDU15BixvvlzkLsmxBAzfJ2VYR1q+qkW/bTwCjzh3je5vAdPMM=
X-Google-Smtp-Source: AGHT+IER1NTCPzuaWHubHqGos8XIu7OovuLjFb7xeldMSGmt424IGSpa3xxPOXaFqAnVbEx42dlPCw==
X-Received: by 2002:a5d:56c6:0:b0:347:f6f8:5088 with SMTP id m6-20020a5d56c6000000b00347f6f85088mr1231675wrw.54.1713952550949;
        Wed, 24 Apr 2024 02:55:50 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id d14-20020adfe88e000000b0034b86548582sm3233617wrm.102.2024.04.24.02.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 02:55:49 -0700 (PDT)
Message-ID: <0ed739d8-7ef6-4b0d-bd61-62966c9a9362@linaro.org>
Date: Wed, 24 Apr 2024 10:55:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 RESEND 3/5] clk: qcom: gdsc: Add set and get hwmode
 callbacks to switch GDSC mode
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>
References: <20240413152013.22307-1-quic_jkona@quicinc.com>
 <20240413152013.22307-4-quic_jkona@quicinc.com>
 <e70e0379-cab0-4586-825e-ade6775ca67c@linaro.org>
 <e419c6aa-6bb2-48ff-bacb-17a2e85856ea@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e419c6aa-6bb2-48ff-bacb-17a2e85856ea@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/04/2024 10:47, Jagadeesh Kona wrote:
> 
> 
> On 4/24/2024 5:18 AM, Bryan O'Donoghue wrote:
>> On 13/04/2024 16:20, Jagadeesh Kona wrote:
>>> Some GDSC client drivers require the GDSC mode to be switched 
>>> dynamically
>>> to HW mode at runtime to gain the power benefits. Typically such client
>>> drivers require the GDSC to be brought up in SW mode initially to enable
>>> the required dependent clocks and configure the hardware to proper 
>>> state.
>>> Once initial hardware set up is done, they switch the GDSC to HW mode to
>>> save power. At the end of usecase, they switch the GDSC back to SW mode
>>> and disable the GDSC.
>>>
>>> Introduce HW_CTRL_TRIGGER flag to register the set_hwmode_dev and
>>> get_hwmode_dev callbacks for GDSC's whose respective client drivers
>>> require the GDSC mode to be switched dynamically at runtime using
>>> dev_pm_genpd_set_hwmode() API.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>   drivers/clk/qcom/gdsc.c | 37 +++++++++++++++++++++++++++++++++++++
>>>   drivers/clk/qcom/gdsc.h |  1 +
>>>   2 files changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>>> index df9618ab7eea..c5f6be8181d8 100644
>>> --- a/drivers/clk/qcom/gdsc.c
>>> +++ b/drivers/clk/qcom/gdsc.c
>>> @@ -363,6 +363,39 @@ static int gdsc_disable(struct generic_pm_domain 
>>> *domain)
>>>       return 0;
>>>   }
>>> +static int gdsc_set_hwmode(struct generic_pm_domain *domain, struct 
>>> device *dev, bool mode)
>>> +{
>>> +    struct gdsc *sc = domain_to_gdsc(domain);
>>> +    int ret;
>>> +
>>> +    ret = gdsc_hwctrl(sc, mode);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* Wait for 1usec for mode transition to properly complete */
>>> +    udelay(1);
>>
>> A delay I suspect you don't need - if the HW spec says "takes 1 usec 
>> for this to take effect" that's 1 usec from io write completion from 
>> APSS to another system agent.
>>
>> You poll for the state transition down below anyway.
>>
>> I'd be pretty certain that's a redundant delay.
>>
> 
> Thanks Bryan for your review!
> 
> This 1usec delay is needed every time GDSC is moved in and out of HW 
> control mode and the reason for same is explained in one of the older 
> gdsc driver change at below link
> 
> https://lore.kernel.org/all/1484027679-18397-1-git-send-email-rnayak@codeaurora.org/
> 

Right.

If that is your precedent then you seem to be missing the mb(); between

gdsc_hwctrl();

/* mb(); here */

and this

udelay(1);

---
bod

