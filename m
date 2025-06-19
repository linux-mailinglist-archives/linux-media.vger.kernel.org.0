Return-Path: <linux-media+bounces-35229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B10ADFF70
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 10:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D659717F7F9
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 08:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED312609FC;
	Thu, 19 Jun 2025 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckGS5+M0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C25E261584
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320410; cv=none; b=BEoJaQ3oiyRvxOhlduxFiT8o7Hzjzv18r8No5ndeNerxlQdYqCLP5rOfTpL5DHwMYmCEx5o/koUCq0btYqaHtRXRI/K8QXOP4H5CT6Sb7zmikhYOMmIGpXKg0umAVObHNgKxloGBG1I8qaG6zgV7BQcmO5c1/TzaxbOwoJPT/Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320410; c=relaxed/simple;
	bh=a+rcVLKG5LogbRwc+21ftsMiRlVNjgK1wni99iSuW3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxjqUjzgIskKhIwgh7bJbEeq02oj0FFrcea8RpNQKqm5Mj7Tbw4a2Uee6NB8MeFmSY4HnpU17XUV5IgYDutl+h2slPKYcDceEo9fAXMZBm89D8BCLw+gSMjG4An84RIW799K35ce1emrWA17A0JYeXs4nfEckXEHzDWREVlaQgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckGS5+M0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so3981805e9.3
        for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 01:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750320403; x=1750925203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=salczjjRssYDH2+0mmcRfcDYi7Wgd3Z2sKQXxoQU/+k=;
        b=ckGS5+M058gnTKUMG9RLGD96zj326GLXJa9omuttPur7zjwxhgPk9TniSH8spzi2V9
         uHXvKcgMlSmqCIwNxDDW+U2kN5aHUR68n9Kk7S7BlMG82MgeEVMm2YJbBXCHxNq+hCyE
         UQY2qPAQegXZ1ghDFEx2J7vBVspeB6aBEC65wS2iFVt29LvxCNsh+/dsmYlvcM2O67zI
         fU+e43gInjYIh2TxYsmEQ8fVC3O+S+MlupvQdfXWbqF8+MqWLd9NmJ2y3DTmsYV/Ku62
         caFygxMhnvKe6VQaAPNu+IuzulGLpuiT+jDim5h9bdaWeuqIDB/Zve+b2yA7aZGaCVrc
         5+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750320403; x=1750925203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=salczjjRssYDH2+0mmcRfcDYi7Wgd3Z2sKQXxoQU/+k=;
        b=uH2JNY1Oo4LlyEIhSfTpLrDyCI05UGXIUxxbCHIc6n2ORkWJ04sxsD5hE703q5U68k
         XmSutgNbPf7HOFjysRDo6fLkeuWroQ15iQb7RCDA22SUvo59IUwRrdl9wIR1XMP5wL07
         A/hLEuqZO7/gKpXeXsJIV1az1uYSiQu+qrquHREGa369KemICDmTqDnXU/MM0Nw3kspQ
         HcVSHaWUPeqjs7X6ChtG3q6d/RNeLhnXPiCXBW2Pf1gdx2RVzRD8LEPN6ywNoB3Pf75e
         Y9xbI2EddNm0eerOEiPHlqrsvuEIJPlhoTNt7I4oSyRqtpEYg2VMz+F9rDy9xNZzIlu3
         8DpA==
X-Gm-Message-State: AOJu0YyVbHvD8kHc/MxJohtOYdwhPlP8X77YaaPiAP/K0znRnBLRlgp/
	/hAaSY1umD42frhBxsS5x5iFjhN9Ldk6izRXahyiEnmyPbupu3XBF8vsNA8EP/OeWeA=
X-Gm-Gg: ASbGncv0+VtDFMtC/hZrQ+cy0/N2ALBo3NkweVjzYLl7TULLNo+XUZkwu5QW4B7WycA
	Higy3GxE8Y9QqX6C30LPSVEzec5gxUCUIKepxoJOvQxcz0c1Bn1W62mq50kPP4RkwOqACLDpMj2
	PUZy/VbaYzQG2IUr5WuJsc4M+ndc0/sOsQi0ZI/xe/ZNmEYlbnM6XRixL91waU6LrBP4y91utmT
	XBUg3YFj1UKI5nTjKIeLQgHOXkpZcxx8aWJKO2QXUTdFoWhWUCPdLFUI+DolFSavd3vOtBSSmcX
	bFZSdUj71vcjrboqEMr6SorV0LP86NXv2S+q+VuEe8S15mmOds6ggDbbmJAUGQjZjVMYaROr9Dl
	RysPRHnA8YRBdItVQ9WGcKCNBe0M=
X-Google-Smtp-Source: AGHT+IFWX8/s2AmWjw7FnW4683L5SDBApq2DrAPvcaPvOV+s02ya9PajScAuugPZCDr89km6tcZARw==
X-Received: by 2002:a05:600c:8b51:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-4533cad630amr205407535e9.16.1750320402887;
        Thu, 19 Jun 2025 01:06:42 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e99cdcdsm20490695e9.34.2025.06.19.01.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 01:06:42 -0700 (PDT)
Message-ID: <af44846f-8e1b-493f-8023-b96348a95df4@linaro.org>
Date: Thu, 19 Jun 2025 09:06:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: hfi: explicitly release IRQ during
 teardown
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2025 08:48, Jorge Ramirez-Ortiz wrote:
> Ensure the IRQ is disabled - and all pending handlers completed - before
> dismantling the interrupt routing and clearing related pointers.
> 
> This prevents any possibility of the interrupt triggering after the
> handler context has been invalidated.
> 
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
> 
>   v2:
>      disable the handler and block until complete.
>      allow devres to release and free the allocated irq
> 
>   drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea879950..ed003adb0282 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
>   	venus_interface_queues_release(hdev);
>   	mutex_destroy(&hdev->lock);
>   	kfree(hdev);
> +	disable_irq(core->irq);
>   	core->ops = NULL;
>   }
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

