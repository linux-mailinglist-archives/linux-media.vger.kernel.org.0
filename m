Return-Path: <linux-media+bounces-30941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2DEA9AD28
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 14:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FE4E9255E5
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 12:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5E022F75E;
	Thu, 24 Apr 2025 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Suw1LZxz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963AA502B1
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497237; cv=none; b=VR7tT7HoAlgb7Lv4Pb4Bteml/pDpwWBc2aLxGBDpDv7D0wHqULGqr5wQsvclI+YFUoFCRk7pHiRt2qEsGLXO+BOKNixkHJq8lrTqVxX/KReqxkKo54vFxOkwwCnj5HfLLpgkDxbrsjrYH7K7JRYdXjkoZ7pbLSEqpMmP5KbKRpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497237; c=relaxed/simple;
	bh=bL8XZJpIQ328FckjzxCTkScUdzNQtFOutrtggIAGvho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YwrZrjZk66afRqvCeWYR4384wRRP0TPEuOvoQrXKyN8+IoV5LVn1oqb+XMM0WjS8yYQzId0Wy40souXCPVKakASCe8aKpaMz9xq5x0awIuLOBm/596oxsMARRH7KQ4KSqR+gb3QsdKILjAKj8ynV3+Fb24ni5BEAm/bQD8aVHIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Suw1LZxz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso623495f8f.0
        for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 05:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745497233; x=1746102033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u50Yy5Vg8srr8Se1a2fDdmj5mgoY3leB+NYiaQ0tKb4=;
        b=Suw1LZxzxoOoMZRlMgxKMu1qNBFbVt8fWs5AsneTXtfH7gNAf3SADchKKJdj2Qtkk6
         R/tWdiYKrYdtTEANlwpYvO6rWYSP0J4uqmU7i13FIGQ5ZkmYyf9uG39MoRrnuvPXWFxa
         Ll7Mk5yzRQgfl1W1Tq+622z0uLfPgF21YB+I2HpYEHtPs2iLLiGJwlrpJeNErtHiRTF6
         KgUhm3gPVAdhZtOIdxM1Q6vWYrNEX8DUOGF7WpT6E+8kC+U2lpAWUsIiB6Z3vNuczVQ1
         UweEmiHzHQ9opntm2TTGfWjBlkYIMXixUO45fVYi5fg+SuyKTgRHs9n0A3I1PUl16rjV
         ZxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497233; x=1746102033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u50Yy5Vg8srr8Se1a2fDdmj5mgoY3leB+NYiaQ0tKb4=;
        b=G3c5hVqUOqOOfwcCn6Q0v4e7cbwQdLu/phaPf4tdL2V1ljqJsedxvKyM6qrTStXO3m
         v/ZUroHMHtP3MsUU6z04ew9tN8dbN0tpOXWN0tWsJp/0hgzGygW17lbS+TbAsnv0E3LX
         NrwEpBk1ROCXnlbUtlITDK5b3FECTRl8nol8YvZbsgDsvFfqxYGGEge/jyX9JzCQoHkt
         b36iw+jUppg4IxTcoQ7sEhK19OZrqO6pu7CTwaNYm74BD61qqkwATEOOcoEm9uAgKiz+
         8ef0LRvZHzIgktSF7cCkpwVdXmAgepc5fORQNdPuv+aXq+kzzXBWED2YRKrE1ui9ok1i
         uofQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5reecMMfPovqlLu+dkM3ICgp3C+BolbKPhoFCKAnhmRZqxig8pJBFHM30vStYk0tdIHw3d/uy+Jnurg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxa+NtwQgrxFeVyqty4zyBnrkCnRBfo/ts1UFCvP4cMaaUoL7W
	EhEttIQSoh7UQeDOlhfEQymzobsayx1v7XL0UguV0qeWbUvrVUuJhzj7S4SCXbk=
X-Gm-Gg: ASbGncvRQDdHCObbDRnLhfE5gmlMnMg/tjJSonj/f1tWnL43pR5ZqOcV+kK4QoC+JDr
	vZr80r3mga7ix7E65s8b8wCZ86xHs9pvN5l+TO1BHYHY0+ev4ewwUz0FTmAUIzdE7zr6uNCXvmp
	9+LSwLqd4ukE1JzqkFM522FqSQRD7NRDrpCYKdUGoFOtCHid5qbk+yId2TqDXyX9qlKbuaCalc+
	QtNdxrnFqWBZP8Q+MJwwyTP1M90i6FblOZlOPf6cmQ9fw6MLgx6uxibl+7KSxVHoT8wXJuUh1QK
	arZV5j7Fp/YTPgPmaq/4JP+a5PyUaenqD7h72mcNCmRnfMWVKy7R1DVNXThHh+naIFvIXbVB+Sx
	jkpHZhg==
X-Google-Smtp-Source: AGHT+IErGqD7SWmT3PoP2Qcfi8RzPWJTMPf2UDlu9jVrXtYNixkU0DJW45avJrW+b31pNkThEJFAjQ==
X-Received: by 2002:a5d:64cf:0:b0:391:20ef:62d6 with SMTP id ffacd0b85a97d-3a06cf4a80emr1986260f8f.11.1745497232880;
        Thu, 24 Apr 2025 05:20:32 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54c031sm1884747f8f.84.2025.04.24.05.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:20:32 -0700 (PDT)
Message-ID: <00fb511e-80b5-494b-acce-23093932c4ad@linaro.org>
Date: Thu, 24 Apr 2025 13:20:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add support for video
 node
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d8db0361-b8d9-4ed5-0f92-f66f280f62e6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 11:28, Vikash Garodia wrote:
> 
> On 4/24/2025 2:51 PM, Dmitry Baryshkov wrote:
>> On Thu, Apr 24, 2025 at 02:20:48PM +0530, Vikash Garodia wrote:
>>> Add the IRIS video-codec node on QCS8300.
>>
>> Nit: you can not "add support for the video node". You can either add
>> video node or add support for video en/decoding.
> Makes sense. Will wait for any other comments, before resending.
> 
> Regards,
> Vikash
>>
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 71 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 71 insertions(+)
>>>
>>

Unless you get another comment, there's no need to resend.

I can fix the commit log for you on the way in.

---
bod

