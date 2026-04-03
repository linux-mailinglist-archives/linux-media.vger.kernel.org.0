Return-Path: <linux-media+bounces-58038-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePm3HK+Uz2nmxQYAu9opvQ
	(envelope-from <linux-media+bounces-58038-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 12:21:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B1339342E
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 12:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0588230490D4
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 10:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D29387566;
	Fri,  3 Apr 2026 10:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tsEgU0l0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C7137B3F2
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210978; cv=none; b=rxgQ37oxb5HQZM1jzXEpUWEwpScsa/ph3lby11fgzwab+AQISiScyBFaebf28vlao19uyxEVVPgrxKPjw6FabkPcUJB+bmxoVdQAzOuzIMqLZ0GvTr+g6oi5Q/ed+L3Ndm8+KWZ8M30QoHxkBHLzP3q5wmHQt9MGWEdOv3ajJo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210978; c=relaxed/simple;
	bh=TINvKdSrQ/NGl2be3nDTbiLQxZXwyhQucUzBFBqHyEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0L44C5I5n/iHYavJ//0DRvwZ7sdqYVXXCgZAq2VKWdzZj7OsjDAtjY2ItGAxZgK/gQFhsvS4wbvdc3WNqrrRLHLLQ/BD56qJXvIguEDObIiQcWqLS8c5zEAYqKRrucpvvGmdlPHrY7jCo9kDglx4nMLPt21hxdlckaPjyTosbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tsEgU0l0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e6ab06167so294780e87.0
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2026 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775210973; x=1775815773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3jZs1YU/5kS4rEiiUTRNMXO5M8WRI2oxv3zjAIg5U4=;
        b=tsEgU0l0kF1/msz4dw2bxWLbKMzYXq1+HWVudjh0DErkZ9jgjVDcVykWi03Oukpath
         wX7xprz0wCEK7rrH3lNlq2yrxbhfd8CsmKaE3OcMK9lEZPSLyueGpdRT/TxRna4KRIJV
         KxfGzU2PukP1Op2KKP0iAq5w/pZM3GnV5rD/81+1+0BVAzQH832G5cT1RC+004ZzdXTp
         DuLxEipQQCdgVMll7OJZvBsd+LKuU79N5kHp7VHEHv1fpH0cllvTK+dOhUBxXDfq3I7r
         PbDe0HC388F0NDrKODP9MN5mRn0Osgyno2DAZ4RJo/VDPIL4Lno44NbzuRbaBJbOaVSL
         1DxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210973; x=1775815773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3jZs1YU/5kS4rEiiUTRNMXO5M8WRI2oxv3zjAIg5U4=;
        b=Bl3ms0SrvgfLOfAY68vgD2PLLdCjXJAlbRbVO9ZiXVxypY1jEseIqdiDHrV9Ujac3v
         I1FBSbIOpqURJ3w2VOPbjIfss79Hlb6itK0cePpfcbX6YnVffEifs4vx2eMbv3yGqtaF
         Y745uoRBzMVGfzKTAXfS91vF50rX47jcUEiP47zzFyu+zN8GIhMVAXGg8GEzfO5ddkb0
         7nRDiSPsVjz2eIaToQFeVVeXgiqvu4vRhR2thB0XXlYa/rNpByOUxBzFUdKbP5qbON7R
         z56r78FoSB1U3mCT0ssAjyqvIJDf5qnPAfdPGIumt1bHKmE9F2v45yXL0NpxPeuwkQB5
         xb/g==
X-Forwarded-Encrypted: i=1; AJvYcCXLoVVHwdaWsffpTtzoh3FOMG+dZg/LwfWTlTHasYNczPcx6NOU6b9IyFduc7e5B3LXBuyOQATgzKZTgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPYUFeAvwPm4IYJUx+ijNWLJXQW+ll86daQRtIKXTH/2OJ2tD
	L5wVIcgeyiR1SomdU6Yb8LU8RDMz3SWtWYFtHYPB7lXjXy7xROwHeFy2MVQ8nC34c0o=
X-Gm-Gg: AeBDies7NioHb422R6Uprf8KuiPOVBo81YXIN2QLaR5eB3JBYAZgx6Hhq8X1z6HKcxM
	IECkoBVXs8u9vv0C29X1tKqyo9WxBKHfUX5n4FYESlSbyv+jvT1Z33j2hrZhniea85mo7PBgA+a
	Ub2z+5NaT4JMIajWZLhqawPg/0qKj9wKdrSNDhauBD/CuxTf6qgYilZ7CGftMjrE+iCaPgIb+Ib
	ONmMoLZ6pvDpU9ruBK+joDnKT98AwsLzefVeAnFsfoabVmmmFqpka0qfSJPB/OOwpBgqvldktm/
	6Fnf3A9ozukuRBsTGecAMOg6iby6uU1iOfJHWCXUxD4dfUX2kxjcDy0uzAKu2CwZovuL89hRjZP
	yoePygib8FjCTEjOPv/wWTNR+D3BKIjFjON9Bl7bnvEPyW4DZ1JR/8/N1JBQjiH/1zj5EVoeptt
	SlttqPUVI0UNl370OMI6IP2TnMr0gdbiJDhjHpjix2JvQEx6FOgtldd063aYD/AoP8neNCrF6Yp
	111lA==
X-Received: by 2002:a05:6512:23a2:b0:5a1:38c4:424e with SMTP id 2adb3069b0e04-5a33758e02emr390883e87.7.1775210972916;
        Fri, 03 Apr 2026 03:09:32 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6033sm1374630e87.48.2026.04.03.03.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:09:32 -0700 (PDT)
Message-ID: <40e9f0f5-8b22-4535-a1e0-6c5073ef94d6@linaro.org>
Date: Fri, 3 Apr 2026 13:09:31 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add CAMSS support for SM6350
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <2a108976-374a-46e1-968d-7befa4369a74@linaro.org>
 <DHJD7P2TXQTH.1TQ4YQQ21A6CS@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <DHJD7P2TXQTH.1TQ4YQQ21A6CS@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,lists.sr.ht,vger.kernel.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-58038-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5B1339342E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca.

On 4/3/26 11:09, Luca Weiss wrote:
> Hi Vladimir,
> 
> On Tue Mar 31, 2026 at 12:49 AM CEST, Vladimir Zapolskiy wrote:
>> Hi Luca,
>>
>> On 2/16/26 10:54, Luca Weiss wrote:
>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>> SM6350 SoC.
>>>
>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>> far as I can tell.
>>>
>>> Though when stopping the camera stream, the following clock warning
>>> appears in dmesg. But it does not interfere with any functionality,
>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>> while the clock is on, and 'off' while it's off.
>>>
>>> Any suggestion how to fix this, is appreciated.
>>
>> I've looked at CAMCC recently, and I do notice that SM6350 CAMCC does not
>> set '.use_rpm = true' flag for whatever reason.
>>
>> If you find a free minute, can you test the change below?..
> 
> Unfortunately that change does not resolve the "gcc_camera_axi_clk
> status stuck at 'on'" warning.
> 
> fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.clock-controller/power/runtime_status
> active
> 
> fairphone-fp4:~$ cat /sys/bus/platform/drivers/sm6350-camcc/ad00000.clock-controller/power/runtime_status
> suspended
> 

So it seems to be a technically deeper issue, once given insights by Imran
likely to be very relevant:
https://lore.kernel.org/linux-arm-msm/caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com/

>>
>> ----8<----
>> diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
>> index 7df12c1311c6..ba880e4edcaf 100644
>> --- a/drivers/clk/qcom/camcc-sm6350.c
>> +++ b/drivers/clk/qcom/camcc-sm6350.c
>> @@ -1880,6 +1880,7 @@ static const struct qcom_cc_desc camcc_sm6350_desc = {
>>    	.num_clks = ARRAY_SIZE(camcc_sm6350_clocks),
>>    	.gdscs = camcc_sm6350_gdscs,
>>    	.num_gdscs = ARRAY_SIZE(camcc_sm6350_gdscs),
>> +	.use_rpm = true,
>>    };
>>    
>>    static const struct of_device_id camcc_sm6350_match_table[] = {
>> ----8<----
>>
>> This change could be considered to be included in any case, I believe.
> 
> I guess this change is now the way to enable pm_runtime, I had this
> series 3 years ago in February 2023:
> https://lore.kernel.org/linux-arm-msm/20230213-sm6350-camcc-runtime_pm-v3-0-d35e0d833cc4@fairphone.com/
> 
> But I never followed up due to me not understanding pm_runtime well and
> no direct need for it.
> 
> But I guess reviving that with use_rpm = true, add power-domains &
> required-opps to dt-bindings and sm6350.dtsi should be a good idea?
> 

It should be, if SM6350 CAMCC is known to belong to an on-SoC power domain,
then devm_pm_runtime_enable() will be called on .probe to embed the
controller driver into the runtime PM framework, see commit c0b6627369bc.
Power domain management of devices is handled inside the runtime PM.

-- 
Best wishes,
Vladimir

