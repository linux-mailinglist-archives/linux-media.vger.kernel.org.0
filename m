Return-Path: <linux-media+bounces-30006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A75FA85643
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 10:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F4918C4FF2
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 08:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D5D293B70;
	Fri, 11 Apr 2025 08:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GPRDJ/7F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC8F1F0982
	for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359247; cv=none; b=cW0G2lCJFpIGBrS16onYZXr4B0z4DIPxvUXfuJHCswiOAQ7aBkjMI89CYjNjLUMB3Ef82hVFuC1YfZczGmVLC5uumfzgS9aliBKc+2WyGnLA6utmOF7r2uPrQtuRM1sPrvrrRtmEhOmmeA7dNnDk7IDcY4Fnamyg8hlXHRSyUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359247; c=relaxed/simple;
	bh=h30t4wZt4Pjn6cUP+0NNMHJSghHGv88Eq9PNP5TL56A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=p2KB0Xryh0HBSCBtM80yFU2UYCpzRCEDaFQRlmh3s2SPNyDQMvRjsXA2ielD82DEg9eeNmD0s0pl1oz3F3RmO7s8Q9f+bpg2I5sjDcnanG1OvEnPw35wjYMCJkhsjUNREBoD5ofUzffisaxrMVTkCOarPFgycBbXDS5p9muAL4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GPRDJ/7F; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so18463985e9.2
        for <linux-media@vger.kernel.org>; Fri, 11 Apr 2025 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744359244; x=1744964044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpmSli+/PRnesyTG8X3uYfMysLWZm74irwD8jDox6I8=;
        b=GPRDJ/7F+uxa9gcIrHizf1wZL5K4q+erIKbiKiS/ewb+sMkI0MrQGtw0tzxiU9FVgx
         vjhkpRlcUZvKcv1SMIL3pIUJ+zOA0teoDS37fr54gCyppF4OR1JBRWUQMvahF0g3qsKf
         SEPRnLd/QkbVqEYQYT9ke/ojksobw2LDLo7pFIMJvnubnDrUtW3PtVTIFxaF6vl5CLUC
         Ii7zoqUXn+vrJ4lWRgNqqKYVRupuf/+I+Drv04blAcXGo2sCLVmY8FO6AXMCRX5G8/44
         a26wfE9C06fxUAuw7AhVpXjDUprDmt/vEqV/Wh4Ni6/mndEaeXRh7D7TA4qlwWG6JJjF
         crlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744359244; x=1744964044;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jpmSli+/PRnesyTG8X3uYfMysLWZm74irwD8jDox6I8=;
        b=MH32QGvMra76gscjLxtMoZiwAqbffHtnybd5PekN29vyTtaiQXUHlAcg/Y/AaCzU/f
         Yc96wyHhow3n6QRRhtIpespvjmMIf4KBCifYMGnZPIGz2ZBZMKvoD0vCZ44bTqRaQz4R
         FE/bF0eSe3cj55eE+d6HRbLyIK8wtcE2p+6pACGLuiuE8seqKh2yw8hf4KAPxHuui4LT
         6LmFnM+5VfE2IrcmeaTHB5YN8k6Km9K/EHk+Cog46WhwIAdsc5+3xUbavndm19vWskap
         Py1B03WhhINKNiF7THfUE4S154vw1fW9M+/dnvBg2uRKH+3ZiJFZzhFG3Mjci+zTSEyf
         pH9w==
X-Forwarded-Encrypted: i=1; AJvYcCVaEDszthZG67bptQqV1vDlkeGn3Be3z2j7alIC/MIdOsDSd1f8DLa3RLjN3e0NwntUEYrscoTmo3T7Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTL/sgJPoUM7GsMwj+RtFUrMcJATbl/BERZpaixtJ9hXM9GccN
	YFwiRMwbFr5e/ojq113b6UUUz4pOt9qy2KnID/rF3GgKQUDWNGcJe5oSM+JwYkM=
X-Gm-Gg: ASbGncsADt3Dkhbq2w3J9U88VDp/PPdaUYOg6ysOIR1T5KB5KsgTW8IrNAk3hoGzhYz
	u4Xfn2K9THfbrWgpzAWznEjmbznf92iYbR50auj4T3u4xkzLwRlmJvdFVA9zrhiAh5nL5O74+cM
	gF3e208rqfucchAeN70vXtMubUylK19vzi1MHHf2SD5qVR/mmTJHwfx/jUdsRyx1xPgECPKeHaJ
	81euHyOpeEDb4+GRFDAdpIFxQQXH96CqQegh5Q+hobpAKNFv8TRTHwQA+9VjUBF4OGVBYvdzQiz
	wmXuw+ntyTcnjEcGQ9PJWbzCrQvix0hDWrFWlsSsINAuKRxyZCv54x7gSFtpX0yr3GkA1rDW83n
	pRucf0SHuV5rEs4iE8g==
X-Google-Smtp-Source: AGHT+IErTQ838bnzLuDWG7azdU/wnoTrkbk2g3cUSADDKy2JWtzBM+/zA8Adup+DY2KRAXkZ7TqHCw==
X-Received: by 2002:a05:600c:8707:b0:43e:ee80:c233 with SMTP id 5b1f17b1804b1-43f3a9b485amr11552465e9.32.1744359243661;
        Fri, 11 Apr 2025 01:14:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c8fb4sm79096785e9.35.2025.04.11.01.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:14:03 -0700 (PDT)
Message-ID: <f637965b-dff5-45d4-b6be-de8c68c6c397@linaro.org>
Date: Fri, 11 Apr 2025 10:14:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
 <vhfuhjruok7gupoeo2uloe525k7oycd5gkh67zzz4wbiwrczpt@i3qknymfu4px>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <vhfuhjruok7gupoeo2uloe525k7oycd5gkh67zzz4wbiwrczpt@i3qknymfu4px>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2025 21:44, Dmitry Baryshkov wrote:
> On Thu, Apr 10, 2025 at 06:30:00PM +0200, Neil Armstrong wrote:
>> Re-organize the platform support core into a gen1 catalog C file
>> declaring common platform structure and include platform headers
>> containing platform specific entries and iris_platform_data
>> structure.
>>
>> The goal is to share most of the structure while having
>> clear and separate per-SoC catalog files.
>>
>> The organization is based on the current drm/msm dpu1 catalog
>> entries.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/Makefile          |  2 +-
>>   .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
>>   ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------
> 
> I'd suggest _not_ to follow DPU here. I like the per-generation files,
> but please consider keeping platform files as separate C files too.

This would duplicate all tables, do we really want this ?

I want just to add SM8650 support, not to entirely rework the
whole iris driver.

Neil

> 
>>   3 files changed, 89 insertions(+), 76 deletions(-)
>>
> 


