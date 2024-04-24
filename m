Return-Path: <linux-media+bounces-9965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A89D8AFD40
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 02:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4AB91B21605
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 00:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CA81FDD;
	Wed, 24 Apr 2024 00:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SgRe/ixf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7A0634
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 00:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917791; cv=none; b=pt15UjJFKrDX838Fe2vA6NvX9wYgdqY9WQIRMFq9b4i0hlddgQsHFI/Z6iIasGj1m93bwq0zbkjOc4h0bZkoGfuebhNvSQhW7W02uZ86jhm9ugsIVJPnkXezGpIPiG1qZ2xhJApnE8UjPQVAYNwTkIBk3g/ikLxxZQBFl06f6p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917791; c=relaxed/simple;
	bh=vH8TUXVp14Y1tF11bj35c1Q3PKT0zOfhWqOZP+37v2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LjKSnS4CWrT781gcDBVVPcR5FQ9J1fF8GmNAz7cWb2A+CAAyAmPlV19BDy/irRQd9w/jnDHyCP9uM+eqGMU70nSD/uZyeSwsjigR9KQUP4afuIerFBXIzBnP4dcVVQqRXDTmJvJNJpoblnryk8I2GU8kFuJzP5sxLAxS3OdQ46M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SgRe/ixf; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-34a7e47d164so3833112f8f.3
        for <linux-media@vger.kernel.org>; Tue, 23 Apr 2024 17:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713917788; x=1714522588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K0pUZMSUM0wS5UBOCyyIVV0VM1ykC5stPfsCzESY0oc=;
        b=SgRe/ixfPOk59310t0N5QalDW8DZpec+r65x+LzVsAmJFfN4kh8Sq+sszWFZyPmPjd
         ykwAten+rOEUGEXA/8pu1NwvG/B9oAuxzb1ChKyX5KDhpHYCqnhvSIIUXpyKISWefGXa
         K+mezNTHO+M5u6VrAvIyytqEGflXH8LLzFNkg3PTduTZy5/Com0yi3DXYy+iAhIGThna
         hSfyADLeyCn0H+CglLPnKnA/codueF0LRhjimpWsaBQFUvbbXccgiM7tu0Im5S3WndDJ
         QbGq4TPnuDpsHaVx+QqAmASo7SSCandYRRdgNRmi+Fd45VM+IWDhAJic10UkVJkEbghz
         08Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713917788; x=1714522588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0pUZMSUM0wS5UBOCyyIVV0VM1ykC5stPfsCzESY0oc=;
        b=sxqbjxwtyQb3aks1qcVs7B+gC5qZzY8D0f0DfRfKQA4nOBWOioJ7LYfc+GEzlV3BhE
         o9Vb6x33TUR7QbHiyCi1V6cd+xqr5QDK3nS13AX3teBGovJsGE66lNWHDEfmRyF3HjZ7
         hK+OIsf+OAXAAZlBM/1cltnzhQekA8Bsh8wYqRcugK+GDH2JAQOtkWWnVYn5GoQjZAlJ
         iCIbx3l8CsKxAuPYvwX7zFJf/Ys5BvoIKRwKlsgkY7m3t2DeFBNo3h07w6CXITMwkFHB
         VlaOmSC1+7Khc8MseeUFBhVRcEaIEk4IbqYUjtyV18jc5PSZ5gZJGwbl3qkwrwQuBBmF
         gVTw==
X-Forwarded-Encrypted: i=1; AJvYcCW8rnv+K+2+lVsQXGl2ewbbh9XkkDGX46RKzKa6xUijrLsZDNOihVgbcdfqKFk7AHUtihUrIdeJG9kFx12Uja3kvOvgjjfLOZXqbSE=
X-Gm-Message-State: AOJu0YzAkV8+09Q+5krAZpHLlBlhMllR4zvYdp1U5sDpQnTMJOZZvXrP
	oxBaBY+OLtUK9T9pHmKOXlVRBTaBNLrkPlLTLRJL3x/+vg2WEkEuBJu2HXhy0tY=
X-Google-Smtp-Source: AGHT+IEBbsQv7MvHH+05WRyjPm/vcH5Gi/IkbhrXGGTHpSm/YU5rg7c2JJdbV16cVdR9Q8PVRh8I8A==
X-Received: by 2002:a5d:504e:0:b0:33e:363b:a7dd with SMTP id h14-20020a5d504e000000b0033e363ba7ddmr469809wrt.20.1713917787851;
        Tue, 23 Apr 2024 17:16:27 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a3-20020adffb83000000b0034b32e5e9ccsm5235364wrr.64.2024.04.23.17.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 17:16:27 -0700 (PDT)
Message-ID: <a522f25f-bb38-4ae1-8f13-8e56934e5ef5@linaro.org>
Date: Wed, 24 Apr 2024 01:16:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 RESEND 5/5] venus: pm_helpers: Use
 dev_pm_genpd_set_hwmode to switch GDSC mode on V6
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
 <20240413152013.22307-6-quic_jkona@quicinc.com>
 <5c78ad52-524b-4ad7-b149-0e7252abc2ee@linaro.org>
 <b96ef82c-4033-43e0-9c1e-347ffb500751@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b96ef82c-4033-43e0-9c1e-347ffb500751@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/04/2024 15:52, Jagadeesh Kona wrote:
> 
> 
> On 4/14/2024 6:09 PM, Bryan O'Donoghue wrote:
>> On 13/04/2024 16:20, Jagadeesh Kona wrote:
>>> The Venus driver requires vcodec GDSC to be ON in SW mode for clock
>>> operations and move it back to HW mode to gain power benefits. Earlier,
>>> as there is no interface to switch the GDSC mode from GenPD framework,
>>> the GDSC is moved to HW control mode as part of GDSC enable callback and
>>> venus driver is writing to its POWER_CONTROL register to keep the 
>>> GDSC ON
>>> from SW whereever required. But the POWER_CONTROL register addresses
>>> are not constant and can vary across the variants.
>>>
>>> Also as per the HW recommendation, the GDSC mode switching needs to be
>>> controlled from respective GDSC register and this is a uniform approach
>>> across all the targets. Hence use dev_pm_genpd_set_hwmode() API which
>>> controls GDSC mode switching using its respective GDSC register.
>>>
>>> In venus V6 variants, the vcodec gdsc gets enabled in SW mode by default
>>> with new HW_CTRL_TRIGGER flag and there is no need to switch it to SW
>>> mode again after enable, hence add check to avoid switching gdsc to 
>>> SW mode
>>> again after gdsc enable. Similarly add check to avoid switching GDSC 
>>> to HW
>>> mode before disabling the GDSC, so GDSC gets enabled in SW mode in 
>>> the next
>>> enable.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>
>> When I tested this out on sm8250 a few months ago it was broken.
>>
>> I don't quite see in your commit logs, how the breakage was addressed.
>>
>> Can you provide some details ?
>>
> 
> Thanks Bryan for your review!
> 
> In earlier series, venus driver is switching the vcodec GDSC to HW 
> control mode before disabling the GDSC by invoking 
> vcodec_control_v4(..., false) in poweroff_coreid(). Due to this, the 
> subsequent GDSC enable from venus driver is failing while polling for 
> GDSC power ON status, since GDSC is under HW control mode and HW can 
> keep the GDSC in disabled state.
> 
> Now a check is added in poweroff_coreid() to avoid switching the GDSC to 
> HW control mode before disabling the GDSC for Venus V6 variants that use 
> this new API. Hence during the next GDSC enable, GDSC will be in SW mode 
> and GDSC will powerup properly.

Right so the intention is to have HW GDSC control during playback only - 
and then revert to SW control when no stream is active, right ?

I tried your series on today's -next.

Here is -next without your changes

https://drive.google.com/file/d/1PFuLOlEp582rBQUvuwc9PNZUBxn1ioYf/view?usp=sharing

and here is -next with your changes

https://drive.google.com/file/d/1PHR4rZnWUH9Wp2B-itT5yCUXIMOMZrwM/view?usp=sharing

The first time I tried that test the stopping/stuttering was worse.

So yes the original crash was fixed but, this looks like a performance 
regression to me.

Here's the tree I tested with.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-24-05-23-review?ref_type=heads

---
bod


