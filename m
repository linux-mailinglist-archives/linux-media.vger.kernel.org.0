Return-Path: <linux-media+bounces-37957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB547B08888
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E34F3B2E04
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 08:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57809288C26;
	Thu, 17 Jul 2025 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l34pL4WV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE39287257
	for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 08:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752742513; cv=none; b=qv3FGSR4XtF77ah+FjCJxT7yP6fz+8JJ7Zr43hMCCxh2rMNbjKf+fSVR4DPGSedi0bzMVTwDyoVaWOKMA8NWt1gsRF8b3iUQAwlE5EtJ1+VKar7Cjm8SQMEmVLr3sVWNcbq/CXtlJRUj+5lhmuhxioMK3CnjI0GKo2r16PWW470=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752742513; c=relaxed/simple;
	bh=rbIIA+uoDdZAEIgKsdmKjYPcHyPTYEdiNYPoVlrPAE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imb6xyTg8fJFgWs9rUc9mK7i3cwp0pe40mRda2fvCc2CbiyUVg3hoooj2PmlrVfv8JZHSKnOBOIz/58i0Tys+495SitiIxgec+b8jYA5mb8Lfd+nQse9+VM/bYa7cGb5K3et5CKddZs2s6tpf1KGdSRVfbc4C5wi776pZ0eOaDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l34pL4WV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso471542f8f.1
        for <linux-media@vger.kernel.org>; Thu, 17 Jul 2025 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752742509; x=1753347309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHyAjDbsre/mZct+WSYi9l0BRn1nHEnZ/fQqOqSdaGM=;
        b=l34pL4WVyS2W6tlt8ETKp9nRVppmXlqC7VmC+HDOO4mdNlMnrbheZPsmFirNNmKHiv
         V3mKCbTXjSQTnIr4gso6JNhenwdxx3XrbM73eroFkTDecyPExWQddM/AX5cvoYkprVRu
         SGoia6qcxvcYgKmahiFVGv52oAuQWV+KhNT6raYlDHpWxv1DLSFvyQ5TvuJfwDFOfkBd
         8Y8jr7wGjE3svZIqPWYW8zs2YSgtBfUKLkFSF12Zc14j36N6eorm5D5bBKA8BjLZ0G2u
         9czyNs9zdnKgnUsBmGGaB14McJzz09qbUrtoPjBVQc8iZ0q7XXkcIzJy9suB3DrkN/aO
         tWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752742509; x=1753347309;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHyAjDbsre/mZct+WSYi9l0BRn1nHEnZ/fQqOqSdaGM=;
        b=M5I+ZTAAMfBuZpZlayUA1q8Dv2Ix3krooFLvuWCeuYD6QhdEV/GYTRt/YndaUyJ9Yw
         +8hNZWzOdLj6Z2LiQu75Fej/d6GSj5CWkC42in1wRRStYUixNqqztWhlL1HcmBnK9NuO
         2ta2HNaQ+JDoj1nnv9FsZrHSwulLe/5jqzyBewdvAU91kTwZS0DoFHdCczlwBGgph9GD
         zoW68SftR1YBZQfRYK6l8evFi/K24iZpvZ9VRDMt6K+tphdV8tXW2usjyUI8cOsQf96h
         viiYT4dvGUnJiswW9C5doROl1Hk74Ob4bvabB8LGnwRAdd5pWyb7O+tWoA85Mnxj/z4r
         ihIw==
X-Forwarded-Encrypted: i=1; AJvYcCWcmKTNYrMhYpSZQr9gPUK3g3Kmop3Sj6cSJE1Iz4luXss/kN+rLWWNGy0ihiteO96GIyv6Gw+bowEvBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKoatSmtMbYDQbkJvuQfzzaCBLvLr5KT+Pcu5KlApFqFEVyA8Z
	26JuF9EyaX+bibDkVfRrfBL7aHnqFncpxLYBJeSAw3glWJcnATPseaSBdO80dgK3HZw=
X-Gm-Gg: ASbGncvm29Pjuqv/OUQqA4jT72eCtoUf3slZMcnLFcZZ5iy7rGtCpg/Ifl1G8ZRLjq5
	mM02az1kEYv45hwuvwlX9k5gtEz5EN9iyOYbza1ZPZ2uoqGAGbWRCM62Ez93umU36GvPhd0ncW6
	1nmtrNmiHOLMUZOqRYX/lAD6tEE+74VPy3I+6Qxb5QMGFnqovG2VTCWHJb06KC4mvaKzpTA7ozS
	f2MNmKTSlKHA2F7U8eOFvkocLvmM9izru+DjLWJPFNdYNXCKYrxTiTzuNY3UpitT3JdtJlXsU25
	2PcuLSPnEJbKE6RMTUJchdqT+8/J8NjB8RYbnXSEtWXvFuMPYl+qcdg8JtpIrLvdUv0soc0j2Qg
	cvoHwvWs+K1FzmDb6jza4LQpB3HsN1bFhVeIRbCeEtoEk3yEJaarBv2eoMWuiFnQ=
X-Google-Smtp-Source: AGHT+IFMm0W0LQqlI5lThEKnMDzqLJnnMlbCWXLCSWUwxD5DZzq8lnEWSxHzAIvoCTmvHbvmXRcHwg==
X-Received: by 2002:a05:6000:26cc:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3b60e50ff10mr4505999f8f.34.1752742509169;
        Thu, 17 Jul 2025 01:55:09 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634fab0f3sm15804915e9.35.2025.07.17.01.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 01:55:08 -0700 (PDT)
Message-ID: <0dd1f38e-eaba-4c99-b386-4ff8fade5b9b@linaro.org>
Date: Thu, 17 Jul 2025 09:55:08 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] media: venus: Conditionally register codec nodes
 based on firmware version
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-3-jorge.ramirez@oss.qualcomm.com>
 <2fd0d1a7-70ee-43ac-af84-d2321c40e8f8@linaro.org> <aHidibqhMyexExXJ@trex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aHidibqhMyexExXJ@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2025 07:51, Jorge Ramirez wrote:
> On 17/07/25 00:37:33, Bryan O'Donoghue wrote:
>> On 15/07/2025 21:47, Jorge Ramirez-Ortiz wrote:
>>> The encoding and decoding capabilities of a VPU can vary depending on the
>>> firmware version in use.
>>>
>>> This commit adds support for platforms with OF_DYNAMIC enabled to
>>> conditionally skip the creation of codec device nodes at runtime if the
>>> loaded firmware does not support the corresponding functionality.
>>>
>>> Note that the driver becomes aware of the firmware version only after the
>>> HFI layer has been initialized.
>>>
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>> ---
>>>    drivers/media/platform/qcom/venus/core.c | 76 +++++++++++++++---------
>>>    drivers/media/platform/qcom/venus/core.h |  8 +++
>>>    2 files changed, 57 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>>> index 4c049c694d9c..b7d6745b6124 100644
>>> --- a/drivers/media/platform/qcom/venus/core.c
>>> +++ b/drivers/media/platform/qcom/venus/core.c
>>> @@ -28,6 +28,15 @@
>>>    #include "pm_helpers.h"
>>>    #include "hfi_venus_io.h"
>>> +static inline bool venus_fw_supports_codec(struct venus_core *core,
>>> +					   const struct venus_min_fw *ver)
>>> +{
>>> +	if (!ver)
>>> +		return true;
>>> +
>>> +	return is_fw_rev_or_newer(core, ver->major, ver->minor, ver->rev);
>>> +}
>>> +
>>>    static void venus_coredump(struct venus_core *core)
>>>    {
>>>    	struct device *dev;
>>> @@ -103,7 +112,9 @@ static void venus_sys_error_handler(struct work_struct *work)
>>>    	core->state = CORE_UNINIT;
>>>    	for (i = 0; i < max_attempts; i++) {
>>> -		if (!pm_runtime_active(core->dev_dec) && !pm_runtime_active(core->dev_enc))
>>> +		/* Not both nodes might be available */
>>
>> "Neither node available" the latter for preference.
> 
> what about "One or both nodes may be unavailable" ?

Ah great that actually explains it then, as you can see I didn't get the 
meaning from the comment.

>>
>>> +		if ((!core->dev_dec || !pm_runtime_active(core->dev_dec)) &&
>>> +		    (!core->dev_enc || !pm_runtime_active(core->dev_enc)))
>>
>> Is this change about registration or is it a fix trying to sneak in under
>> the radar ?
> 
> I think this functionality - the ability to enable or disable individual
> encode/decode nodes based on firmware capabilities - should be standard
> across multimedia drivers.
> 
> For example, on the AR50_LITE platform, the _current_ driver/firmware
> combo does not support encoding as it requires secure buffer handling
> which is not yet implemented in the kernel (changes to iommu, etc)
> 
> So, rather than disabling Venus entirely, I think it makes sense to
> expose the decoder node, which remains fully functional and unaffected
> by the secure buffer requirement.
> 
> Hence this commit (so yeah, I am not trying to sneak a fix, I swear!)

grand so.

> 
>>
>>>    			break;
>>>    		msleep(10);
>>>    	}
>>> @@ -202,7 +213,8 @@ static u32 to_v4l2_codec_type(u32 codec)
>>>    	}
>>>    }
>>> -static int venus_enumerate_codecs(struct venus_core *core, u32 type)
>>> +static int venus_enumerate_codecs(struct venus_core *core, u32 type,
>>> +				  const struct venus_min_fw *ver)
>>>    {
>>>    	const struct hfi_inst_ops dummy_ops = {};
>>>    	struct venus_inst *inst;
>>> @@ -213,6 +225,9 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
>>>    	if (core->res->hfi_version != HFI_VERSION_1XX)
>>>    		return 0;
>>> +	if (!venus_fw_supports_codec(core, ver))
>>> +		return 0;
>> Its not really a codec you're checking there, its a version.
>>
>> The name should reflect that.
> 
> but the check isn't just about the firmware version: it is about whether
> the firmware in use supports a specific coded based on the firmware
> version knowledge built in the driver.

No OK "codec" is the right word.

---
bod

