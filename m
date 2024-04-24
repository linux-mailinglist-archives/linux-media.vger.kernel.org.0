Return-Path: <linux-media+bounces-10011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6AD8B093B
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 14:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA6FF288ED3
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 12:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2E515B10D;
	Wed, 24 Apr 2024 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IO7gDWt7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9B415ADB4
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961384; cv=none; b=MGLiXXRJm83qYS68CrDLGn5DQOyH+VEqhsFHtyBMS9RMvz7zbfLEZYpFa512Mo7BlkeAPAtVj3KOgGofMBL+fXeRnia/NgEk/FSjOlPy/eyy3p8jIAxe9AoDyWqt4jfZ7iznPgW3sC2tU4as4GFAlk+21/zlrjr+ZE0tvw8snQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961384; c=relaxed/simple;
	bh=7EVAxZ43e6M9EqakVg8G5iPomQiclYYtKEY7SU0BQVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ufm/KfHLHocYccr+7Yg+FCJlPB+3R0+S8LTFdTRg3gRtgZfQJaVZOvYJAojoNtk8VyJ9UBdsfhejxK0og4BsqWLDeKrKmyi+uKCvLYz8HKhBha7kXl6D4ACFkSsw8ThSl0m8FcXsaQQ7EVZWfrD7IRqx5qcDsyt7XvKU+JlisS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IO7gDWt7; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so7079721e87.1
        for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 05:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713961381; x=1714566181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wrwSu6K9f3l7AxMNZgK7qc0Fh0lkJOEbmkGCWsVk/v8=;
        b=IO7gDWt7YQAFaTBUpD7YgRJeYIb4RLs7YrftnlHEi8vQcQvHYxZMwATIpGG5vKCEjy
         nTbiAoVLeUtzlKPPqZL1sLjk32domfv5Kau6Kd7wWBNeGeYzMR7stBkG4aiSMu/pNe9b
         VTRFp7yCdzniirClYlowH7FuJyL/tFNNwTT+dTNBXMINQqeUyrMmoBkmvNlbomUaWnem
         l/e/1QUARtc9ovYmbaOLF1pGhYO/QNiLsfetP7kGKRcyIgAp4R6UbU6WhSVWPlV+xvD1
         AYzwQg/P/wHL4WBYl5FGNYLutz4XYF+pJr31oI6nuEZ8wk4yjUwQn1JZKKlob244UAOb
         33wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713961381; x=1714566181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrwSu6K9f3l7AxMNZgK7qc0Fh0lkJOEbmkGCWsVk/v8=;
        b=FRK+9S5BAbvKCHo7eJouMxuw6zRi5/gscccFKac+O2kCoTq6Eybrs2BGP74q293R4r
         /5D3B0aDqnDzChGBH6hCzcsRBPOz1l3UdQLexcVBtkuOJQ3yYwcOqst5/XqlxYcvTlQZ
         mgtmKuAS6cTHUWajC/MHvpWq/7EmmE8OqsQVH0DpdhgU2nvkIB5yngg0olLS79QvwmTF
         i4nOvzrpgoTBMNOP2iQYlUXVEszC8ZGiMHhnXIYLDrH654R0g2TvcshKF4ysBk1MHr7d
         hkNW+p8VpOGKrEFIYe5RUQyqB/vV7Wa68KmZzLUcCSQxKtYC+jGBuIHbdmVB3K1sbwK+
         wc+w==
X-Forwarded-Encrypted: i=1; AJvYcCUZKyjHUlK1EBPvJvVhqUQslJL7P8sqAD0wSYL7f2/+m2hInhI/AX5TDQmrfHfx0avR0El5WvhMFZ1glvdC5oKQVK4KA4IN7rKS0S4=
X-Gm-Message-State: AOJu0YzFt9QVC0rD9P1fTAT/lbI37MGoH7WcS95f9zgZ/oqR5V+4MXRa
	zFwEoUH70EFWMU64A0+n3/UUshbIGBwJ/EtTeKaeaXk/VZGA/JBxUMY164Q7tjE=
X-Google-Smtp-Source: AGHT+IFPa5xFHlLbe7/2cfOYqt4jxQXFvqOImOxBURYIRzLe89/MJtqrwwDMGKE5c0ccdXdD4aJkJg==
X-Received: by 2002:a05:6512:310d:b0:51b:1f12:4844 with SMTP id n13-20020a056512310d00b0051b1f124844mr1876706lfb.64.1713961380616;
        Wed, 24 Apr 2024 05:23:00 -0700 (PDT)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t3-20020a056512068300b0051b5835f3f9sm831432lfe.278.2024.04.24.05.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 05:23:00 -0700 (PDT)
Message-ID: <603aef24-a8ad-4c39-8c5a-846139f77a77@linaro.org>
Date: Wed, 24 Apr 2024 14:22:54 +0200
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
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Gross <agross@kernel.org>,
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
 <0ed739d8-7ef6-4b0d-bd61-62966c9a9362@linaro.org>
 <2e8f5e93-1f24-4451-ab9f-ad1e7d98bc65@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2e8f5e93-1f24-4451-ab9f-ad1e7d98bc65@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/24/24 12:27, Jagadeesh Kona wrote:
> 
> 
> On 4/24/2024 3:25 PM, Bryan O'Donoghue wrote:
>> On 24/04/2024 10:47, Jagadeesh Kona wrote:
>>>
>>>
>>> On 4/24/2024 5:18 AM, Bryan O'Donoghue wrote:
>>>> On 13/04/2024 16:20, Jagadeesh Kona wrote:
>>>>> Some GDSC client drivers require the GDSC mode to be switched dynamically
>>>>> to HW mode at runtime to gain the power benefits. Typically such client
>>>>> drivers require the GDSC to be brought up in SW mode initially to enable
>>>>> the required dependent clocks and configure the hardware to proper state.
>>>>> Once initial hardware set up is done, they switch the GDSC to HW mode to
>>>>> save power. At the end of usecase, they switch the GDSC back to SW mode
>>>>> and disable the GDSC.
>>>>>
>>>>> Introduce HW_CTRL_TRIGGER flag to register the set_hwmode_dev and
>>>>> get_hwmode_dev callbacks for GDSC's whose respective client drivers
>>>>> require the GDSC mode to be switched dynamically at runtime using
>>>>> dev_pm_genpd_set_hwmode() API.
>>>>>
>>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>>> ---
>>>>>   drivers/clk/qcom/gdsc.c | 37 +++++++++++++++++++++++++++++++++++++
>>>>>   drivers/clk/qcom/gdsc.h |  1 +
>>>>>   2 files changed, 38 insertions(+)
>>>>>
>>>>> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
>>>>> index df9618ab7eea..c5f6be8181d8 100644
>>>>> --- a/drivers/clk/qcom/gdsc.c
>>>>> +++ b/drivers/clk/qcom/gdsc.c
>>>>> @@ -363,6 +363,39 @@ static int gdsc_disable(struct generic_pm_domain *domain)
>>>>>       return 0;
>>>>>   }
>>>>> +static int gdsc_set_hwmode(struct generic_pm_domain *domain, struct device *dev, bool mode)
>>>>> +{
>>>>> +    struct gdsc *sc = domain_to_gdsc(domain);
>>>>> +    int ret;
>>>>> +
>>>>> +    ret = gdsc_hwctrl(sc, mode);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>> +    /* Wait for 1usec for mode transition to properly complete */
>>>>> +    udelay(1);
>>>>
>>>> A delay I suspect you don't need - if the HW spec says "takes 1 usec for this to take effect" that's 1 usec from io write completion from APSS to another system agent.
>>>>
>>>> You poll for the state transition down below anyway.
>>>>
>>>> I'd be pretty certain that's a redundant delay.
>>>>
>>>
>>> Thanks Bryan for your review!
>>>
>>> This 1usec delay is needed every time GDSC is moved in and out of HW control mode and the reason for same is explained in one of the older gdsc driver change at below link
>>>
>>> https://lore.kernel.org/all/1484027679-18397-1-git-send-email-rnayak@codeaurora.org/
>>>
>>
>> Right.
>>
>> If that is your precedent then you seem to be missing the mb(); between
>>
>> gdsc_hwctrl();
>>
>> /* mb(); here */
>>
>> and this
>>
>> udelay(1);
>>
> 
> Sorry, earlier I shared the link to base patch series which has mb() used, but in the mainlined series of the same patch mb() is removed as per the review comments.
> 
> Please find the mainlined series link:-
> https://lore.kernel.org/all/1485145581-517-1-git-send-email-rnayak@codeaurora.org/

Mostly because mb is a solution to a different problem. See this talk
for more details:

https://youtu.be/i6DayghhA8Q

Konrad

