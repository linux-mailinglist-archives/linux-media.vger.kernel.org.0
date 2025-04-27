Return-Path: <linux-media+bounces-31132-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E87A9E4BA
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 23:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D69D178125
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 21:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2971FFC5F;
	Sun, 27 Apr 2025 21:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TzxNj1Po"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADBB433D9
	for <linux-media@vger.kernel.org>; Sun, 27 Apr 2025 21:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745790754; cv=none; b=SeiQU2g0FyhNVHzmdica0b1j6H3eEh9zfDwhS1AJkGMxqTYt7QAdaO+VqtYfvnRLr0sl7msN44Iy5bRG/pf9iz+y8BdlkFc95TRviJLcFg95qLZZApVRDvvVW7oxakApe08DW32g3cIsnOpyM8tgTqlPkjtx4yji5332OHSYe8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745790754; c=relaxed/simple;
	bh=NLCEKxqfnuKPb5qhY6v1wHEJ3q7ORDM42IQIZbtYrhM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rcx69+o4IHYFBGSofAmqZ97U4CMKbhnooxID/yldMzesWiDET7RfCGMpTUSF0buM8s4ywK8z4/ytpP66qA3SIJuEpB6TQNdJ7ym/emSo1XaShXNR+ESZEJ7RvMB2tmh/1CB+8UNA+FAWUIX4qpf/FejkLj020OIZU2KZRv/M64E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TzxNj1Po; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so26609995e9.0
        for <linux-media@vger.kernel.org>; Sun, 27 Apr 2025 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745790751; x=1746395551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zP6Vr5wl96BWIJPHe0GcdZz6u57VK+LDg/4JZWIexRo=;
        b=TzxNj1Pojr7RTolJ10dsd6eT9YAdZyQxrutENJJtTaFcL6dnXfl2VfA4flUmLn9Y6O
         IA2VCJesCJZ0o+FNl+wc9PuCLi34SD9SM9htndynSGPDlZ1Y3HT/euRXNKqpBpRBtb2T
         vwvRk/PjAin6KorHfoc7H/nqoCt8FNBe4kkusgjQzSXLTftuBp5i+Ovj9oJwkKGKExl/
         GZ7B8CSBSSKzmf/0iRmqlodqsmBl2yjn+kpE98m5NsQr/93xFj2je091lhtW7kPQJAHO
         V1gpn5Udyuij0schJhvNotXZCFyUcr2MLZHg5T+upNOtdCd1MnrkQebwgFNRKF2RH/tC
         TEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745790751; x=1746395551;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zP6Vr5wl96BWIJPHe0GcdZz6u57VK+LDg/4JZWIexRo=;
        b=F1sk+Y4MLvvVU3IcgwEj3iWI6gkxJ/pKEZBxe+HUGI6TdF+sVQeZFLI2O1HRlFem54
         TRlVQtxYny1H6ZKfBwSJb489DL6MnWD2DIaHszcgPvfaiKHTdnzOZYyJWKCBn9XxWGAA
         uJEP7Ym9z/sOXMLFSmhaWLgoUqKigBLvNHN+RHM2gijzWfjLVmz7AkjB9UVLT3FSbK9/
         QdBc1QpvnImm5rSHaWWQPrBoGLFpuqzxIjj7sno3rw/t7hX5OqGwMe8BanUQSvRDzk6G
         NsFeGLWBhV+aBrDyeJIF4xsjFiOwXiL2JepjYE6lc1l6LTSPsQdlze6ZC/ek+2rZUKXE
         k1QA==
X-Forwarded-Encrypted: i=1; AJvYcCW2x47wH3h28eG1Pr5snFrtIQw9SLKxMjFfJQnI0cqDCeMAfT+RMY163G9ieMf47VezJesnF4epA/7HvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPARVixJ1mTVXSSG1Ldmz/uLn0D0qYvPl4mWqK9lOz8Zp2/Z2T
	AR5wzJ5jPeCwJjgSMCgyMq3/6tmZYmdAK8qojGsKtp8a6mqKWO/Uf9SztA4owhM=
X-Gm-Gg: ASbGncsPlJAbE/WE7VMhs/JFnU8uhHSdITVxnz0dZx0xlXMaghz+YxBWkU2JgrTvj6y
	wFzEMdzZiltQewNpB6ffgnB4qaSYNxRusvEPojvqcTTJf+MAdOV94B7aNQ1sbwH0lJpi2hJTD+N
	k6op1Tna3+svNUQbR2f2mguSUV9fv3KwYlhZy4G/6A1fWn9QlKiHg+GGWPrcGn5cXN0rauLec/M
	rYu94leD7gWHjl702D2WyN+yb/qy3tCRH6X27lhDDIcg/5w2UyjqGF6ShMYBmYKiWlIuJF4ACYB
	/Ly19vnglMaa/Ffpjr0BwTlPGXwpzqH2hsI8N49igTTLugPgSHVs0se66dGiXqRTHwClnPmypJx
	qN2Bpc6KymrmbR7dR
X-Google-Smtp-Source: AGHT+IF9NtTwXVCry4ECIh7ifDI7xSXFecW32O3JGgQylC/n1HXWQ9lefOctYA70jHd9LbL7GdOPxg==
X-Received: by 2002:a05:600c:1d8d:b0:440:59eb:bfc with SMTP id 5b1f17b1804b1-440ab848458mr54631495e9.23.1745790751367;
        Sun, 27 Apr 2025 14:52:31 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a1544sm138759515e9.11.2025.04.27.14.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 14:52:30 -0700 (PDT)
Message-ID: <fcf5eb3c-a2c4-41ec-8c6b-d8aee5a9f906@linaro.org>
Date: Sun, 27 Apr 2025 22:52:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com>
 <20250424-qcs8300_iris-v5-4-f118f505c300@quicinc.com>
 <47dtgkfqcpalixg36vxcurkmh5z52kdp7rbcvwl56wsyjsisdo@ylmmrvwde4nz>
 <d8db0361-b8d9-4ed5-0f92-f66f280f62e6@quicinc.com>
 <00fb511e-80b5-494b-acce-23093932c4ad@linaro.org>
Content-Language: en-US
In-Reply-To: <00fb511e-80b5-494b-acce-23093932c4ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/04/2025 13:20, Bryan O'Donoghue wrote:
> On 24/04/2025 11:28, Vikash Garodia wrote:
>>
>> On 4/24/2025 2:51 PM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 24, 2025 at 02:20:48PM +0530, Vikash Garodia wrote:
>>>> Add the IRIS video-codec node on QCS8300.
>>>
>>> Nit: you can not "add support for the video node". You can either add
>>> video node or add support for video en/decoding.
>> Makes sense. Will wait for any other comments, before resending.
>>
>> Regards,
>> Vikash
>>>
>>>>
>>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++ 
>>>> ++++++++++++
>>>>   1 file changed, 71 insertions(+)
>>>>
>>>
> 
> Unless you get another comment, there's no need to resend.
> 
> I can fix the commit log for you on the way in.
> 
> ---
> bod

Oops this is isn't one I can fix for you - dtsi.

---
bod

