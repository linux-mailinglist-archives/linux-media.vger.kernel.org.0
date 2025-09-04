Return-Path: <linux-media+bounces-41764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E07B4386C
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 12:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26C397B340A
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 10:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42F92FE060;
	Thu,  4 Sep 2025 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WV+yoPqS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACD82E7F03
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756980936; cv=none; b=TZt0MCT+ySrzoiGP/H03IJKcX3rD6NmG0L8beoqlx8JA1AcB4ieq49gsMJIAvVndzWlmLIOaoUQVsu/K6agoU06gscMwpUCtGGXvrAI2XKKVXyIkzIRSP4cdIFBb6Iej0wE13CfDaqXqshZVg8jvYHn/0CixX/ojTtdAg3jQTr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756980936; c=relaxed/simple;
	bh=02YS+hRybT7AYqzhQAWsNOqiFU614c1kM6JJq7QCT0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcxlQZBKT16ZDqi4Cag55Is88fwF/f4tXBtaye9UOqIhNSu57wM8XxDL5JDWDkQis2IuUbCn3mh7SuaveccEp7XnxEN2URK6a+unuY1eKZSQauIIE7k9Ng6qr/WZ3jZkUM6oeooYANldBbXaoybiIMZA8VpCPDYYTg/Kmzf4l4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WV+yoPqS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3e2055ce973so206235f8f.0
        for <linux-media@vger.kernel.org>; Thu, 04 Sep 2025 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756980933; x=1757585733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITTyrcjLlcY8/CcZ1bPQJZjvz7X9rDFNo6l00OOhKdM=;
        b=WV+yoPqS60xk0I/piZS1i+p49G2TEReiEaB/x1gL4RFBqnaDX0opfpvFt5QPecLeEl
         jIqdRyQCaBfHM/jQHLb3Sc4AaJErVNpvGRFu9w0b2OgfimTMOY5gUHB9JCiJwkzeoDdx
         OG6bxAkSbHF2YNlWVYOGRkxNS2+pIZRnZkmXgLCfDBzziqteIqhJ/hsEZsLGFA4VX8qo
         UeBs+c1WhDUXX6rJfESsyFgn4ublXrYm2pwpi+NrX3p91fWuw+Q7pN1r0UGUGvrycTrR
         IduUPP+B709hmBc3Q3QOpFEaapV6RLlHAdyBDqLxAwG1CxUgB5QOVFTmcIEXW9BcZkMy
         MoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756980933; x=1757585733;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITTyrcjLlcY8/CcZ1bPQJZjvz7X9rDFNo6l00OOhKdM=;
        b=WChL6sTpT8nMbdS+9TuI/1eUp7QOFbuiKw/Rv05D3appZmxOK19G/yLPX+6u30k16d
         xzlyMEeXQcDZJKybMQa1g181IwduOukrHQVm6Ppzs5qPlJTm1fOzDLUXYggVYtzLWbGK
         gOMzT9GFfEi52Gle1zr1cNYf2L8rrG1A8kKCXqETk/i3XDZ7RUbyMNmmjH070FQ+DcoY
         /cyUjskFA1pDKveK8ChGxKWN09fN6KC5fDDk8V3VIVMaoBTSa7h1C40BgPoovJPSmZdH
         uUleL9Wxg3dlCOmbSj+mc3Pu8knOiDBxzzJF6es8i0fc5ouC6bJHFJvhu0jDd9+6DXTJ
         i/YA==
X-Forwarded-Encrypted: i=1; AJvYcCUuv6TTRza/hw7gBIsvj48yPjBcqjUhW0+XBuBkD3HFyA58wXetl+VFBXxAoaIIrZ+4XUpKntCivzAW+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hHSLcTGisWWieTgNLwaScy5IFjaoP5NgOpzwTquMzyD4zKe1
	IRwHOIrKKxNqt+St7gLhSD3d0JupvrWQe1C+hoQhj7gEtCa56OedvLF8Nc1W53wNbKY=
X-Gm-Gg: ASbGncsg12NGUzno1tEgi9caa6kSsto9p5BG2WHgDp+ZoHUzAykhhA3uPQw7xb/csdU
	lMV+5rtimPPGd1wn21QgQo4qheC1ffUnkClE9d7wtI5eDPJ5WcaqSPWRYFG5PCMrBLonw1VkIHi
	OQdzny46riGg4VQQXZ0n5/GNQs1SNEaaj7ockrzAvLJ6oUtOghWr/zJDslpMTbMXpy+JTpSAUL/
	VDYbUzD9GS9R1IFok2auF1qILaGfRFBQQd55hTCxlNUYSxWNnV8YTb1SkaWbg4Ahk7qeJzzebsC
	uzpKyOTKIQdSWdwWoo75p5uSnzvtLZQolLVlyP+WqoObPh2BZJNE7QWcyz9ZEN/jQ2+i+pvhvuV
	6Sx7HjLXWpk6z7sGv2ddO4Ked0ztHW4aO6UoGdtBsOaKflfUCJ9ui67JD19niHF0HqVINH8RICg
	Do7OZnx2txhpWpeI+x6hc=
X-Google-Smtp-Source: AGHT+IHN3+S37G8tZIj+/ejyO1j55iGkRMCn39gBM1gwQQqKT5FKmj84TFJBcgmeeHOEkPQvZICy+g==
X-Received: by 2002:a05:6000:1449:b0:3df:c5e3:560e with SMTP id ffacd0b85a97d-3dfc5e36062mr2281362f8f.7.1756980932655;
        Thu, 04 Sep 2025 03:15:32 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d21a32dbc5sm24323510f8f.11.2025.09.04.03.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 03:15:32 -0700 (PDT)
Message-ID: <a793c2ff-3f06-4ed4-90f4-4b2a11e714e0@linaro.org>
Date: Thu, 4 Sep 2025 11:15:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-3-mukesh.ojha@oss.qualcomm.com>
 <0b4472cb-0c73-4eb8-a360-22b40aae44f5@linaro.org>
 <20250904095215.ekkhrt5ql65ap74k@hu-mojha-hyd.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250904095215.ekkhrt5ql65ap74k@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 10:52, Mukesh Ojha wrote:
>> So is it really the intention of this patch to change the callsites where
>> qcom_mdt_pas_load() away from the init version to the no_init version ?
>>
>> Maybe its a symptom of patch collision but hmm, having a hard time
>> cherry-picking this to test.
> My intention is to unify all subsystems whether it's remoteproc, video,
> or others using Secure PIL, so that they all use the same set of APIs
> via context (cxt).
> 
> Like, we first initialize the context, and then use it for other PIL-related
> SMC calls such as pas_init, mem_setup, auth_and_reset, or even for the
> new rsc_table SMC call. This way, everything is connected, and it
> becomes clear which functions need to be called and it will also be
> extensible via a small handling for SHMbridge on gunyah absence. Similar
> changes would also apply to the MDT loader APIs.
> 
> That's why I asked here after "---" in this patch if this approach is
> preferred, I will apply it consistently and eliminate redundant APIs.
> 
> Let me know your thought.

For me its a question of digesting the change.

Your series says "Add context aware qcom_mdt_pas_load()" but, it does 
more than add - it changes logic.

At a minimum I'd suggest splitting the addition of the function from the 
changing of the existing logic so that the two could be disambiguated.

The other comment I have is, is this change really required to enable 
pil loading @ EL2 ?

You could for example structure this series to implement the changes you 
need for EL2 - and then have a last patch at the end to make the code 
"more beautiful" or even a second series to do that.

So I'd suggest one of

1. Splitting the addition of the new helper and its use into
    separate patches in the same series.

or

2. Doing the full EL2 conversion and then applying the
    "make the code look nice" patch last.
    So that we could for example take 11 of 13 patches

or

3. Making the EL2 conversion and the posting a second series
    with your proposed tidy up

Either way for me splicing both the addition and the usage here is a bit 
hard to parse, especially since I can't seem to find a public SHA where 
this series cleanly applies.

---
bod

