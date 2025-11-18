Return-Path: <linux-media+bounces-47263-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF2BC68FC4
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C8AD4E81A3
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 11:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEB634E75C;
	Tue, 18 Nov 2025 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zBJLxkuJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16337330B13
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464087; cv=none; b=KhsaS1j2aH4gLivr1np4fS6ScvXpna5b3pqLHVkIw/RxRaCpChk/R8TxuXxSBv3IMR3an8f6R9Thd70Kyl1Eqcx41B31pvXK2uyPzsTzAh+I0Ebj95rwvmU5DHC9ePRhcSfwbEVb5cGVZA66/uaB4wz7GImlHFT6uVgV2xmNSTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464087; c=relaxed/simple;
	bh=OQF0sk46s2hLmjrUOiUzHeID2ZztqA4oI0bB6vj5ooQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvtXhuhSpgY2nxg47hwrLs3zP5Vt5yXlfgVbePYxjsZetMGp0CR4jNLRzJxTObRG/gF4F9xJiR895K4RUsLr54QDI5/XqLJ0bJtATvkeQUfVdp3nEwsS06GCwFh7OMVLlcOConfDceEscifaEeZ6NHqy3CosEeCS2ysyxEr9MPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zBJLxkuJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47774d3536dso44237085e9.0
        for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 03:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763464083; x=1764068883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoB6bHmy3Gr2c9dl9LxyC0mWmZ5xq1v+qI2e+g/jvls=;
        b=zBJLxkuJLSYviU4ISl3zDgXfKnxH6/z2ryxkLAWaBI067G7ryVkL62V2vinvocVscv
         W3bsMtUOmcDBzSDSeb+HB7bDPVRVbF6POYgOFGOEBPVi8mk5oj8rXjxl1Py14U+u8oF0
         bSfJi2V2NSXk1+DQSo2JQO29iR/AxVCEyoRTV+sjxzICIjyDlTsncHomUy4Qm55m75zP
         xq2ytQkpxea7WClkvYeoY+1/fbjbdzN51oQK4u7a3LcaoY8xnL/gt2Pk+6Q57nH+JRLu
         Wnmx5O1iz98fW/Uk1KFAoUvOmUH8vq0tJG6bBLEQLl/+W1SzSdk399P/XY427/SanQs6
         Rjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464083; x=1764068883;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AoB6bHmy3Gr2c9dl9LxyC0mWmZ5xq1v+qI2e+g/jvls=;
        b=sryKmzeoyaqeuX1IxPMgObkggyB7iPhXN1jL1ylVrVILMb6094CkVCno/ki/3fRlEj
         Sd5tV7j/9vSVkGcXw72XluodiI3leYRRctgzmbF9LKnOwTrbnU3fu961oNlnbN4Q6Vmp
         Ib3je5uL779kf5Cw20kJ+qvFloHuFEpsUMAJdzF1116EWy9CCXNDdIE7fQECR5Sub3/g
         epBKX7X8A8vXViksVdaXI2Rg2UZl9WCwZBToznAJ01DyRsfRlDnZU4RIfA7OQXtYulc0
         NWaov9RldcWFEaPgM9Y6FWaJtCmm5babJk9os0EtL3pTipEBfC1GNsW5OvSF1y03f/cY
         yrbg==
X-Forwarded-Encrypted: i=1; AJvYcCUCeSm3Z2v6vshgV+1BBBwFI2O9YyzTm7MMfhhahH74lHsIxFODGadsWEPniyT6QLdKwXVm8ln94qGOMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxihoZa4abbWx4FpmUsmBuYbG1tSPyjOVJihYPMUjsXfD/qxbl3
	hrquYo/gui0NsStStBkqLaNFVeyGskfuf0cxZ15E9xsATqIzkZQFVtnH7IdXHCUM2rE=
X-Gm-Gg: ASbGncvd2Jj1TvTMwRJN+z348zHlWhLdgBek/dQhQOb8Hoj3XoFM5IM7s7oQWcRr8TV
	7GiU5BRTCbFj8fY6kB38vsW348OjZ/YqoZifjYx3/Iy4jg4psxEY6fvpPDTwFfuzvPO86Lwqq0P
	o1+AuSCSHts83FiQd2dMrqj3deQ57qas0Ds9H22AclUZyhUVEuhUwgmv49/qd8fpAgtqXSXXz1/
	1MFu2shomHu18OFmaS3Ky1rAYzHXF3w3/mSRwNB1wrTLVYptgJUj8cW3sexvzMRErP3VsgB27bj
	xQNhk3EBye6rrH0S4l3wVNaNHQQ8IYiM0xJAA3GjkjXyp6nrDBgDMEdGYI1VpKm1zNsr/UT65hR
	/pw3E8lqDbdhz+t0oqdVLukE/5dBL+sDaqyB5rjYTtkxrOROjQn5cQZROLn8xa+X6JhFRe99xdm
	2NqlhaE1j8TJzH92+9T74gd3WnTwqLZO8IgTMH+pS/tg==
X-Google-Smtp-Source: AGHT+IFwBfUbutDFVGFhG/tpcbmLbS1ovbAuX60wD/D/mUkwyiz6bbGTHlNaOEa8ByNTSBTIa85fWA==
X-Received: by 2002:a05:600c:524e:b0:475:dadd:c474 with SMTP id 5b1f17b1804b1-477a94e88bcmr26303945e9.10.1763464083352;
        Tue, 18 Nov 2025 03:08:03 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779a684202sm180035855e9.10.2025.11.18.03.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:08:02 -0800 (PST)
Message-ID: <0a114896-ffca-427a-8761-977dafa73ea5@linaro.org>
Date: Tue, 18 Nov 2025 11:08:01 +0000
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
 <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org>
 <a15bbbf1-549d-4603-ad6d-3a578b548184@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <a15bbbf1-549d-4603-ad6d-3a578b548184@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2025 10:06, Konrad Dybcio wrote:
>>> Konrad
>> vfe170 is what we have on sdm845
>>
>> So I'm just asking Luca to try the sdm845 method of waggling this clock since what we have doesn't work.
> It's of course going to work because this way you're not calling the
> code that throws this error
> 
> I was curious whether you know the actual reason why this is being
> done in some other GCC drivers
> 
> Konrad

No notion at all, perhaps as a workaround to this very problem.

---
bod

