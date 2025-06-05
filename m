Return-Path: <linux-media+bounces-34125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E257ACEF62
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4EE73AD0C7
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DB81F5823;
	Thu,  5 Jun 2025 12:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QIITwvXC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE4E212FB0
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127209; cv=none; b=nYRDS5oxaG5gOza9qOUsSoC9dfo44QMRgNgfZHkV8drGu3hIOM2gKYvNAJ+3WaUvlKJMV0nkPosazcfrgF6N/hoaYUYv6sRvHVhQrHCduz4ynLxUQnykwrzJuQ3D0KfwDnkclp51HwywKosOVk80RRuQVjaJsCDCexO7+YBLwiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127209; c=relaxed/simple;
	bh=nCUKXO6dCKnHu7IzoBDjMlKdgxKzmF/UGOro8VhrZ4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8cTkyj+97OHWgt/GleVZIlrhWbAuehauV02I1Nl/rfrXV+hNEmsBEkGBr82lrknpFUF6Iuvcr8rJdJ/hSLKfd4hYBlKTmDb3mzGS4uW7W9+SKsYaeMS0aJp2w9z8EJs+w8TmFCZgyRHZ81mIGzfAt5bNnSWzwm6UE1UqDiz5gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QIITwvXC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442ea341570so5970735e9.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749127206; x=1749732006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jleYuFzLzfRA5MPpLBL/znJ4nBJa4J0zBphZ1LfbvF4=;
        b=QIITwvXCjlewtNIKy8GsOeU2pqzswByg3eg25LHXsOHirndubtlBEfEYqRlMHn8Ji0
         ECwuB0e+yZha+dO3oPZ25wsUvvWrWXlEMnJtM5gz+RbeglE5vBRK6ahd5xiZqf3PkWWc
         qQW8/GQjsT3/vqTD1Y4dpg9nMNpLa14LA5ZfOHXTi1tvVzZG0nEb1pW+P2sIDB5joYcr
         bbmp2hN1ngpzEzvCHjqkm/JU4RQKjIWv4YY1tMmA45hxnYuThF+yBSVSSI4tP/4yTicu
         l6CPaydk0sgZTbR2jFaobbBmi+CkOKIKhP7L9o/MCZ+CQH00AyWMwHZckpBieERthEVL
         GHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127206; x=1749732006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jleYuFzLzfRA5MPpLBL/znJ4nBJa4J0zBphZ1LfbvF4=;
        b=BsWVUIndHbfhhwQJFd9ixNHEJcffkZ7XBOWPCFKYLytxApS5ixscXmbV3ZMW9leuMp
         +5AHyFcPwrZCNZP1esC3C1nut49Yiia/Iz2BuiZvmEMNuHNRHzQDpeYc05c2qrI4mNv0
         vXUiKIp17BL9J6gnGud880QUpniuJnebHEXGjm4/BnZ+Hz1BJxhhE2lhP0HNbrfYrxCh
         6+qYmBuUQohBsWEMiioI5iqZeOPALdDdQgYRNAnKzIj3AtS5gMuPIEUcEvl9Ei6jdZmX
         FAvQGbewsJdHBvJjM32Oblh7QooSLNCzAVSMRx7QlvmuTw0+NCnK9geYwPifeYyobLTO
         VUmA==
X-Forwarded-Encrypted: i=1; AJvYcCW7/yRdIXWPqklYSzeDPLHeOlVL5UkEqFZU8zABpyPsgyNRObnVGwkhtvo8uk+mqbrDpSr+6eVARDZWlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI6PUVKAVPXMvPU8Mf93JUEi3QQGpck6s3cYsvHfmJYk1fSB/A
	OSJoaZMKWQhIGM6lRj8V1tgq7NmRyikXP9GitUKH3lP+qsviNfKARVkRi3lC2W+DOEY=
X-Gm-Gg: ASbGncth50MaoO9isqZY1FCAJdDv60syeS33V7JWWm0i5V+wwWsMikJW0LocHaKG8Zx
	YrMIjF33hwYA2B7j5fjxw9tVVOokj3Jnx7yN+jCqXwb3yjtZporrmV59abp42E98s8PhQx/2HSz
	c0Fn5Ny3mKiVbhCopBTqRQcICoNDYYL/XOo4YnpK0CKwEuDmiKzb3+PjvCgjl54uUhMWuydnZQx
	mAOoqFs2vp0tqqOGbLG0OqZDrNx1vo93wFLjRsSfVNTZmsWELkCZILyPeOW0+CpVg0l1FL8Dake
	YlezmzwZcziQIBaUotPoQBXMcwtifJwiuR3Xxl0VyegQKqepTdde12bnNS7jfavH1oL9F8wByf9
	e28LNXFfgLJjZrXHe
X-Google-Smtp-Source: AGHT+IEsxxsTElehsXiy/j9gvQgKD6AbOSqheG88RGHTrVgmb0CU8UNDkYtrV/BImx3zQJlDwaL0EA==
X-Received: by 2002:a05:600c:a42:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-451f0a8d601mr68257205e9.14.1749127206162;
        Thu, 05 Jun 2025 05:40:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb169309sm18073265e9.4.2025.06.05.05.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:40:05 -0700 (PDT)
Message-ID: <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
Date: Thu, 5 Jun 2025 13:40:03 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/06/2025 13:33, Krzysztof Kozlowski wrote:
> On 05/06/2025 14:30, Dmitry Baryshkov wrote:
>> On Thu, 5 Jun 2025 at 13:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 02/06/2025 08:16, Dmitry Baryshkov wrote:
>>>> On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
>>>>>
>>>>> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
>>>>>> On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
>>>>>>> QCS615 uses the same video core as SC7180, so reuse the same resource
>>>>>>> data of SC7180 for QCS615 to enable video functionality.
>>>>>>>
>>>>>>> There are no resources for the video-decoder and video-encoder nodes
>>>>>>> in the device tree, so remove these two nodes from the device tree. In
>>>>>>> addition, to ensure that the video codec functions properly, use [3]
>>>>>>> to add encoder and decoder node entries in the venus driver.
>>>>>>>
>>>>>>> Validated this series on QCS615 and SC7180.
>>>>>>>
>>>>>>> Note:
>>>>>>> This series consist of DT patches and a venus driver patch. The patch
>>>>>>> 1/3, which is venus driver patch, can be picked independently without
>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>>>>> DT patches, still depend on [1].
>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
>>>>>> on QCS615 over(?)clocked.
>>>>> Agree, so we need to make sure that the driver patch is not picked after the
>>>>> DT patch.
>>>>
>>>> Worse: we need to make sure that the driver patch is present in the
>>>> branch which picks up DT patches. Otherwise building & testing that
>>>
>>>
>>> Well, that's a NAK then (although depends what you mean by DT).
>>
>> I mean qcs615.dtsi. I'd suggest an immutable branch for the driver
> 
> Sorry, but no, DTS cannot depend on drivers. You CANNOT merge them into
> one branch.
> 
>> patch. Or just merging the patches in two consequent releases.
> 
> That's a new device nodes, new hardware so it should not be blocked by
> any driver patch. This is just totally broken process / patchset / work.
> 
> Best regards,
> Krzysztof

Reading this thread, I don't think that is the case.

I don't see how patches 2/3 or 3/3 depend on 1/3.

The frequency table is a fallback in the driver and the DT changes are 
completely straight forward.

TBH, I think we are hitting an email comms/social barrier here, not a 
technical one.

@Renjiang can you please confirm that freq_table is a fallback, qcs615 
will work without OPP table and the DTS stuff doesn't depend on the driver.

TBH, I don't see how the DTS can or should but...

---
bod


