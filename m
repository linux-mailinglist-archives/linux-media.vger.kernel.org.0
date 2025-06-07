Return-Path: <linux-media+bounces-34287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026BAD0C12
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 11:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11373188EBDB
	for <lists+linux-media@lfdr.de>; Sat,  7 Jun 2025 09:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF65620B1F5;
	Sat,  7 Jun 2025 09:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NaGkKhYZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B896206F23
	for <linux-media@vger.kernel.org>; Sat,  7 Jun 2025 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749287826; cv=none; b=WuyiSLWrmL2OlyzHTpXps9Mx97LXp/4LgFlhXRJ7anYku6GIoasPdAfi502fu87F8ImkuN0X+wcfrWJ4P5QA6ArTSYEqjL3JGL9F5rITNoqa3KXcoTNiz9cAocFznW/T5rxtAFI69ZtegEwCz8QUT153qi2q+mYf1goAVY7VoWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749287826; c=relaxed/simple;
	bh=eeiSOCGD1Qf0WEJDz2vodAFCYclFaLExwW+hwWMLokI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orCrd5pTJikbkzlBNWU5pY0BLvfb3S2YoICU8fIOK4yWcqGu+JGZujO5oiYw5CGPxeb8Vd3Y7qEsYS0ZqqUVrRLvsL9pzAohAI+NfGfuCCW2Z6XUV+52rkdA/cwLx4XIogg2pEJezd5cgGhbfqv/qJ71/1fyKyF+V1RC84cDntI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NaGkKhYZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cf214200so25944125e9.1
        for <linux-media@vger.kernel.org>; Sat, 07 Jun 2025 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749287823; x=1749892623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64ZjZfRA6hvF+wvTtcr61AIc5qhdm0mhnYYGvLYBTAc=;
        b=NaGkKhYZOpB8njkfofHiE6yVtjAYwzixHav/S9McBw7Dkh+lEeYQMGHUHgVWswTLwV
         J1Bz95qglpgE6DlaVKhx31/n4eZxFfWootyqPNAGCGoijOe8ErkWUmI9GhW/HUxCavju
         7oH0/XV05iOBr9kbKdYDBI8siUMBJ7drDzYfTy5Y57VK9JTh/pE22qvgIQbdKhpZKTQu
         VtAUrB3iuvvJK500oZ1QOWK0l5H+cunhP8IezZcNYO/dna2+OL8JxFI2RVj0g0uWoZTj
         Lyvu7Ec8+tpwpPjrZZMS1shfM1pgF/dVMsz62GWhKK4ALcKqN+smYGLq6Ot9FGAlwBB4
         knmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749287823; x=1749892623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64ZjZfRA6hvF+wvTtcr61AIc5qhdm0mhnYYGvLYBTAc=;
        b=c6gmrjKuo8qHrpqxRmzsrNK+caMp9puAonVce3ExCX2WtfC6uR/+Xd1Yh4J3/aSOcI
         +a2R1diA9aiI1BGL9PSM8x4jTY9+vwCSFiXMumZYwQ31eaY4DuZHIxiy4hPcnXzsOz16
         NVn1m3oWz6S1KD/WErw5RfvpWK+CGwna6ZTyyIzQtcJSBG2jGPHaODQUrLcX2AgTLEG0
         XeMaeyQiNsnhHkWFzSXM1FstZPjOz3qJoniIPp167VVCmVXGWUA1rfyIb8fFZjQWSbBt
         ZsaNkXeLXfV9X165b9KzUOcaEIs3kx16a/7cyBlipthEL/WlsLRA1fkmjFqIUULdUjad
         DiXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrg6VBU27AypfmLQqPxylF9z6Bzk0FO/MWMrIGR/yMVuDQTqULB0sVciewcVqGShEUq5nHd+MsShdopA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xqhnargI/8Nh+5SQPKLTJALtb2D6u39ujLQTwDODVygLcFK4
	B6+MmVszi/U3fgtfZ2P9RFH8yJKWHYzuExg1jDMHOAfEVGW+jwyRhq2ND+6daZ/Mji4=
X-Gm-Gg: ASbGncuF9zQwR7ODWagWczsRs/e4aV2j9TNYgqraIb40kizsaAoRXC6APdquJc/3UoH
	aYBNNk8oSPldB0yQiiozpeSj20ehVhoyufl4y1QNDf4f2vp81OKRA8EPoenf18++Thc9XJPaF2P
	c0I2PLWVVEeJQ8JvwAefjYFjdbluXSOzV3W+vSxPIAknOeQ3a8oCFJb5WNdh7hENafgEa27utSP
	lDHW8HwDN8YkywqnTQ4mDLi2UZOy1XrN7ktoTUDPareQQWX2PIzLIQyCgSOIEfc1XcuB7Fyxr0B
	BOijAHTx4GphEv0QeB19rRniCrCjzJMGDsEd9etqifxpPZXhZaSXNbKAOt445iNbTbO1zRehybp
	/5fCFxV2AQkVu3S/F
X-Google-Smtp-Source: AGHT+IEeHEg+Hg4x2iy77C3/j05y23jbIyhzffYAMnvjZeeaQdFPQuoxmXUZU55UnAxgWdjFJ4co/g==
X-Received: by 2002:a05:600c:c178:b0:442:dcdc:41c8 with SMTP id 5b1f17b1804b1-4520147f531mr53614315e9.19.1749287822790;
        Sat, 07 Jun 2025 02:17:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e055ff5sm50162105e9.8.2025.06.07.02.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 02:17:02 -0700 (PDT)
Message-ID: <6e3646d8-24be-41c2-9aab-d4397ab3afb3@linaro.org>
Date: Sat, 7 Jun 2025 10:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] media: venus: protect against spurious interrupts
 during probe
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: hans.verkuil@cisco.com, stanimir.varbanov@linaro.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 16:25, Jorge Ramirez-Ortiz wrote:
> Make sure the interrupt handler is initialized before the interrupt is
> registered.
> 
> If the IRQ is registered before hfi_create(), it's possible that an
> interrupt fires before the handler setup is complete, leading to a NULL
> dereference.
> 
> This error condition has been observed during system boot on Rb3Gen2.
> 
> Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   v3:
>      Added Fixes tag
>   v2:
>      Fix authorship
>      Fix spelling mistake
>   
>   drivers/media/platform/qcom/venus/core.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index d305d74bb152..5bd99d0aafe4 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
>   	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
>   	init_waitqueue_head(&core->sys_err_done);
>   
> -	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> -					"venus", core);
> +	ret = hfi_create(core, &venus_core_ops);
>   	if (ret)
>   		goto err_core_put;
>   
> -	ret = hfi_create(core, &venus_core_ops);
> +	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
> +					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					"venus", core);
>   	if (ret)
>   		goto err_core_put;
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

