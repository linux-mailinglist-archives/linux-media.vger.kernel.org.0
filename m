Return-Path: <linux-media+bounces-35430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B851AE0E25
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 21:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C19533B6966
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 19:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A42244E8C;
	Thu, 19 Jun 2025 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EA3XkhQS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0265F24467D
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362231; cv=none; b=sutC1bZRzqZgOIyl5ikcF2BdEfmIBrAtUYY3ISf3T+3lwOoIUvqnepGSwcmFEFKNtx0vNwmyfVk3ZC5RBNeZGSt27STyL+xsmBsKdT2vv/bL0aWiUnXnvwMgLn/lgHKH2xAn0Q09KYySfj2DBth8aX6ZNn7szzGQVreGDM7olx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362231; c=relaxed/simple;
	bh=yDEbu7+KEppseRvMkdEiO0Gls82wPynGcYQ2oizwVTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxZbXo0hhbjlK8p4sBiN//gVT+Nfyv8Wv3yVkLdwPSRYyEtYYcUjV+RViBtVKaKyxElwBjnvJ4lAx+ytOrcAEHpIc9X3VrpP/O+la5j+M8G2jO60TVkXBinXximHziB9mlz6XBMJr73K5xsTmBzVEj6UDoe8OETQwFGtEyZSZ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EA3XkhQS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a528243636so732204f8f.3
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 12:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750362228; x=1750967028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hy+M3MYJ3Ebzf/cWNhjwsSRZ1HHszVPNpmoBuK91md4=;
        b=EA3XkhQShm5QOlJrvcPhaGqYpTte8mVjKWzHtAM7heVMiqLnn1gQEkaAhxGAUg8BKM
         k51TLJGME70IBQqcebcbS8VWFMvQthlQpc6YHxrXeL4zlcsb7U2Y4k1hLG6dF10Y8TAg
         K7IQA18NeUZQ0U8zrIfQ1NgYjctiq/9JMKeASZZOfAB8v2wLfKgPauXq09p6KhfU3UtF
         DJJIcIzsFTnYaN/DVCGTvtAr+xuH22Yu+Bu62s9dDsL0R7kmXuX/ggTnKAVqyq0z7zo7
         VyGt58nPxvXNwt5YHlBpxqQLdnT/iCGm86z3WteZHYhT48PJgoMyrSVqzKPzOb8x4kJw
         mcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750362228; x=1750967028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hy+M3MYJ3Ebzf/cWNhjwsSRZ1HHszVPNpmoBuK91md4=;
        b=JWWEBX4hKItiAdZmTgA52ZCIrg2Q9vdjsKtbnmp5b1vvaHkkoFWJ3BrXIh+1xLONpR
         9kl83ronGgdO9KGl5KXWU1Ui1alTc+ErfU+T4I2gjlHY5Zt4A9aPqHKbjPcQzVHXiH0J
         kGFiSe0XNtfyGiU5ZkA9pmkC2jcD87jq/mH+Rp2vV2g2KtikmVaNqgMH4Hc2Ro6hV6EM
         iZ2V0pgrWjjvZGNhf7mEK6t4mMQU0UZrCETv44LMBQD7WWYPbnV5QsUfLQR6jO64Rwoe
         2aqSszVq2V3LC3BnAxBC05Zmkw5BJLY+x3L42ysMBg3OsoxoF4e9jXpqgtb30eKRd8vs
         3ixg==
X-Forwarded-Encrypted: i=1; AJvYcCWipXv6EJ4Ml5znwJ/6UP1DhCfBedit1eIZZvCuKKoD1rSpt/j4OUuL6hnbUhYJW+K/0ASrwa6cNk9Q6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh1chOeGYGyibZj6IeIpIcQhI0WOgcZSdBC7ks6KMC1viHg1cu
	aCbepUwU3YyMorHnY/LT2pmALBZCYFFkUucuBrJNnXdiyxoNIzsL3L8nL/AHV9M0D1A=
X-Gm-Gg: ASbGncsN58GynaAgGP+n2hsLNBttRtm+b9lfr3zAcZ4+wGJ8KiTyzCg4NZB4MDG9IQV
	i5IFUba9aSekAX48Rzz13EAAVyrFzk2SJM2WQ0GvA3Jqyet7ZUZI22wTADG4FeCzGC2w0WYCT7R
	AX1aHyhXIXMr6a+jITZzaRbOB9dFXys3PEjIJUCvrUL/+IlEltnzgZZDK1yV6lU6PK9q2jO17ST
	9Qcyn3K17cDxfHDvEztMBTYDlvi3qEQNzP5FZxliB6//ssze33BndwXZBhy5lz+9vGs6pGvdCgt
	mFUP05ncUE8o5dfvLiNxfM/qrwoOZm8UcYZ+1DgEN/W/Zit7T4gCapRlqWVQeHYKVthZifVG3gq
	+Z/3AVaqhbHfDjqODcqty5J0AwC/g4oZxZLiNiw==
X-Google-Smtp-Source: AGHT+IEJqMT3RaOTaO3Ou2VXZG5oilq/ABPQu3IFKnDHY2NkDCpck/QpOvFVGuHA2IM7O/SjWVxtww==
X-Received: by 2002:a05:6000:461e:b0:3a4:c75c:efd5 with SMTP id ffacd0b85a97d-3a6d12e6431mr212173f8f.46.1750362228349;
        Thu, 19 Jun 2025 12:43:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18152sm214537f8f.27.2025.06.19.12.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 12:43:47 -0700 (PDT)
Message-ID: <66edbe65-a137-4661-b0c8-8a6813635c44@linaro.org>
Date: Thu, 19 Jun 2025 20:43:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: venus: Add QCM2290 support with AR50_LITE
 core
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, stanimir.k.varbanov@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250619142012.1768981-1-jorge.ramirez@oss.qualcomm.com>
 <672b5db1-e045-4625-bad6-83224c27c07f@linaro.org> <aFQg6x+FxXDY4P5m@trex>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aFQg6x+FxXDY4P5m@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 15:38, Jorge Ramirez wrote:
>> WARNING: Argument '_1' is not used in function-like macro
>> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
>> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
>>
>> WARNING: Argument '_2' is not used in function-like macro
>> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
>> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
>>
>> WARNING: Argument '_3' is not used in function-like macro
>> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
>> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
>>
>> WARNING: Argument '_4' is not used in function-like macro
>> #42: FILE: drivers/media/platform/qcom/venus/core.h:546:
>> +#define GET_MACRO(_1, _2, _3, _4, NAME, ...) NAME /* _1-_4 are ignored */
> 
> about the warnings there is nothing that can be done - those parameters
> as per the comments are necessarily ignored - that is the way the macro
> is supposed to work.
> 
> can we not live with them? otherwise I cant do it in a nice way.

For preference I'd like to avoid adding warnings.

Let's just stick with your first version instead.

---
bod

