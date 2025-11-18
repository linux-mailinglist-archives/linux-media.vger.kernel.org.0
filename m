Return-Path: <linux-media+bounces-47256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D5C688F6
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 10:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id C587A2A497
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 09:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A36317707;
	Tue, 18 Nov 2025 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+2GtTlk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891EA3168FB
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763458422; cv=none; b=Fw3QiqUSjRccpxZspPxfhrJB7c0VfcBcBIRdArf0MPI6jSXuiIxb4xGXAkSkrl5FhBxDZncBQGCPMpNYn+fiGXmu/r1l9ScsbfxNYTyRKU2UnS0zy+QT0veM3UnDvsyvvFMYpZDHseHeQOubshrx8daqsOs9+UspSIXFcxSQFsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763458422; c=relaxed/simple;
	bh=+50Ey2th+tvNWLHYjF3fekOQvXPxWkgWTW4J+kjkuuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DHGUJl2mFWIcpdbsLTCOzgwdQHzm2EYqxDpl1JxCtFgqy3gngJ/ofoYphSHLEcQkgQFGcqbg76F6Sfn/dUkdxjPn6hIW+Mst3nJIGxqtKwDwimdoxLSi4+gojNop68GfyeX1xAOKVPFugNhakvMRbAFW3Ah50Z92B61MxTkXd/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+2GtTlk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477aa218f20so3202745e9.0
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763458419; x=1764063219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lTOCRDtXGRsyXp0u8jNTz0TfJTFFmawtdeFt+8GZM68=;
        b=Y+2GtTlkNQxatit+63DAyzp440oXvf+KzxiB5+dz9/PGKW5mAQa6emkJG4aBVaL4na
         NtHlFYbXEl3qsbfF59W7vq8Ls++edU5LajSij7+f7MB/c+X2bdJJ+8Kj4rOVihpYaxWx
         BsM9vOWPBcsaJ+Xo44z2msIr/jk5DjkAEWsbwte4CxeBKGvdxme2MjCK8qPo7N3zZXFY
         hznAhrA98Q9NdvZh/0pV1tjrlDgukY4boCOdn6kkw5WspKYpSGv9F/Yc5Xt4i4H8L3fl
         N9VMro/eyoXpDHHKJZHtZBHOvhVG9KDzknz6FggTTob3S3RKtcQ4s/oi6nk8ztMjRE/H
         7d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763458419; x=1764063219;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTOCRDtXGRsyXp0u8jNTz0TfJTFFmawtdeFt+8GZM68=;
        b=KndTl6uV8Xbdhbxl4aRQUBWyqsjuawesh6D2fP1Jh/nPs4xTfILzqPlNitHF5FY5TL
         7z0x1+mFZZjoublwuYY669eh8KL6lG10Cg8aCchz1rks/7wpbzUOQWaTXX6kbtKy68Y/
         wmCzZ+1BBI/grWPbZLmnvBi4Q+Ez2+E8LUNFhQQklEeE47QbPjdMz2HhDqakmfsSZDJW
         fpaZZrGKwoo1jbmHniwg/r/KQjkhbK/pvAqX48dsHp5DSBrHsNV1d4EQ9EnXeAHGWRvu
         iwM0pF5bIeEL0TqM+fMROEk0+u5G1dz56rlvXfecxWG5himex0yJdAcFDY6WPcrhih7g
         TqzA==
X-Forwarded-Encrypted: i=1; AJvYcCWdligbk1tUYR3RNh0Qt9kQR59ggBOMQMlcmNRBZD7xP1ySR4FfPn3N0QUHB4i65OrzRx/F6LIBSvt/4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YydBoGySTe2512MDHIG26M4lGP/4tHoU0oynyjoIncjCayR5W2u
	ouio6oqWZXlNj4eAiGITh9JugkzP5n2mb24ujcnx4z1aNwBDSJWA2AlA1UgW+1nQDlBR2dZUX4G
	wJNs+Z8g=
X-Gm-Gg: ASbGncuwgtLRwi4wjqK2qSBo+3pQvF4RYr4uF/Jl4McwU97z/a+Mr/wPL1wv6qF0RqE
	Yty5lHDtt6xhrBoSiu3Icvgmn56iatLNpnq+ClhSbb3zYwVBG3EK5hI/aBaBBqW/EZ03dgcBQch
	6hrV6UEHh8hwCwIAb8Z9WuXug1Dz0ELfafTfDKpy+kEYF+F+vQw8bEjO5eu9XrpswkOaR+6U7tr
	Oj9+iyuqhBRraagXDF0u8xshnfqUgre8JAqcBm8tR6BugGG5uIJzOIpRllRKID9l+2uzwhEYLml
	EozdIQp1i9/KHR0OEcDGOCt/CCRUkurnlM3/5/b+Uhkz7UNbBwOlZVdW8/hdDwhzZvPK85u/5FY
	5ht+lFlbI/hcinac7EQft1ZbWrnRwtzmOivET0RjAA0ffeXx2od5ND6LzBID0aIs0uRT16AVeZ4
	Ez6/GuzHUysFIbRNGyeutkLJK0JSGqzbDddqdg3YSmgbQSHR8XzZnWyRV6mPe0Sx31xxLyxg/Om
	g==
X-Google-Smtp-Source: AGHT+IGjvYXGcM8w+Yy+Mw51ltxXu22tj1ZNHWr9tLZbYKT9LQg2FaVpLbb1z4I+LQJU8q7Yzr3yiA==
X-Received: by 2002:a05:600c:1caa:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-4778fe0694amr165159625e9.0.1763458418772;
        Tue, 18 Nov 2025 01:33:38 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9df99d3sm11797575e9.12.2025.11.18.01.33.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 01:33:38 -0800 (PST)
Message-ID: <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org>
Date: Tue, 18 Nov 2025 09:33:35 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>, Bryan O'Donoghue <bod@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid>
 <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com>
 <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org>
 <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com>
 <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org>
 <893b97ad-7d2b-4408-bab5-2cd63fdaa33b@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <893b97ad-7d2b-4408-bab5-2cd63fdaa33b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/11/2025 12:53, Konrad Dybcio wrote:
> On 11/16/25 3:30 PM, Bryan O'Donoghue wrote:
>> On 14/11/2025 15:59, Luca Weiss wrote:
>>> On Fri Nov 14, 2025 at 4:51 PM CET, Bryan O'Donoghue wrote:
>>>> On 14/11/2025 11:15, Luca Weiss wrote:
>>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>>> SM6350 SoC.
>>>>>
>>>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>>>> far as I can tell.
>>>>>
>>>>> Though when stopping the camera stream, the following clock warning
>>>>> appears in dmesg. But it does not interfere with any functionality,
>>>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>>>> while the clock is on, and 'off' while it's off.
>>>>>
>>>>> Any suggestion how to fix this, is appreciated.
>>>>>
>>>>> [ 5738.590980] ------------[ cut here ]------------
>>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>>> [ 5738.591049] WARNING: CPU: 0 PID: 6918 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
>>>>
>>>> Do you have a full and complete kernel tree we could look at here ?
>>>
>>> Sure, this branch has everything in:
>>>
>>> https://github.com/sm6350-mainline/linux/tree/sm6350-6.17.y/
>>>
>>> For further refence, at least two other people have tested this branch
>>> in postmarketOS, nothing particularly exciting to report from there,
>>> apart from that the sdm-skin-thermal thermal zone (thermistor right next
>>> to SoC) is currently configured with 55 degC as critical trip, which is
>>> quickly achieved when starting a video recording, but that's not really
>>> an issue with camss, but will need some tweaking regardless.
>>>
>>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/7281
>>
>> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
>> index a4d6dff9d0f7f..229629ef82809 100644
>> --- a/drivers/clk/qcom/gcc-sm6350.c
>> +++ b/drivers/clk/qcom/gcc-sm6350.c
>> @@ -908,9 +908,7 @@ static struct clk_branch gcc_camera_ahb_clk = {
>>
>>   static struct clk_branch gcc_camera_axi_clk = {
>>          .halt_reg = 0x17018,
>> -       .halt_check = BRANCH_HALT,
>> -       .hwcg_reg = 0x17018,
>> -       .hwcg_bit = 1,
> 
> No reason to drop the hwcg description
> 
>> +       .halt_check = BRANCH_VOTED,
> 
> It'd be useful to explain why we should ignore the hw feedback in this case
> 
>>          .clkr = {
>>                  .enable_reg = 0x17018,
>>                  .enable_mask = BIT(0),
> 
> Konrad

vfe170 is what we have on sdm845

So I'm just asking Luca to try the sdm845 method of waggling this clock 
since what we have doesn't work.

---
bod

