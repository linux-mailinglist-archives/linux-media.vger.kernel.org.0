Return-Path: <linux-media+bounces-34258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 192BDAD0434
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 16:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B80189DE33
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 14:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D001AA7A6;
	Fri,  6 Jun 2025 14:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwoObaS4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8F51448E3
	for <linux-media@vger.kernel.org>; Fri,  6 Jun 2025 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220985; cv=none; b=QkjrKq65zBMz2JcOdeiuLwhz3KJEMcPm7nVqQc4K1yyFt1d8EofqGl8pOeoG0mo/L/dXsZmCzOWhQGqkWOUUyv8nUoRLypREzcj45GIRrsLHHbPSrHUsXLDg0bNQfqEJQNQfPcSKhSc9yNH8C8jgqDozHWelr/p+srf5Z/0ZgKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220985; c=relaxed/simple;
	bh=MRHAloECyV7awIn1pBF28oHNT8VJoNKSlHgGIP6nbFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIwlDKRKIbNPldE7Z2EpRJqdR8YjJrX1b7MrkX+GEYYhFD7qpFxOYlyvUWjRR4NVQpU3wGcZ6IeTLerYMJpvMz2opiF6dmcGGTcRB/A4sbtFjqinz7q4KeorM3aIpTxWu42zr+kpp7qkPPtHHee5AISo6CuhtLB21M2Fctz5FOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwoObaS4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so1350287f8f.0
        for <linux-media@vger.kernel.org>; Fri, 06 Jun 2025 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749220982; x=1749825782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jkwyvK78VqUgKCW7wfISBRdrqwzf1Kodzs7ruamvtIU=;
        b=cwoObaS4BzQehWQumYqgocJlbTJAEpXMJa53n5GnofXR4emR1zCbH6SNhnT0hPNZUS
         11Xw1kw0Tp6Gr7RTHif21ygLkuzP8K4YWE611IrJi2JRnwP5buDhj+4lEz4i0oYXsK0J
         vhgnRzRLZ+4yLjz6MYVTF2ClHoxMiNWb2dfq8HRq/r+CMty9v3jLMOsc9/0Tq6tny9e4
         MYBAUb5vfUQtFwVl5LmmWpMof0SmVv4Eq872qTePhyyGS4YSPiZ16bYSUuhUMe9/U/rF
         pR1+enHWoRRsBpeHomOZmCLFlo7hRx+iuhInNWtcO2+4ismsXKNCjHi5w8xaW+g/II7M
         cW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220982; x=1749825782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jkwyvK78VqUgKCW7wfISBRdrqwzf1Kodzs7ruamvtIU=;
        b=kuMGUSOyYRuYXydoA1MkEGqowQJ+aaiI2JjuTniKNQ2m5CQyHQ135/APO97hv6/vyW
         GU4uhk11aVAnjf1ZGFh6nUXcz/Jpg9xKcfEP6r3QxQXY1rwZc0XOHA6Py6XybsW7ewN8
         V9TzqcjfWeg4N8EdnsIHE0dwHQBtXj/2P8qCh/z1dQuFBO7a7WG1VGxyQq0lDzDgBna2
         WECpt11L6C1FATQmI/wQNLVGnO2Fe78/axDhji1kGj4E95vk8suhbhyfmXhzj7qjbpdj
         4osIA/M7hmTbbWtmQJJ137R+7I3/wtjpUU3YymPDLKiUOHf6eXCZ3csMvMbLn3PlOYay
         mjbQ==
X-Gm-Message-State: AOJu0Yz4bTAcC23pPa5PgjNPBrxvpnEhch8hjwYBiV9bhvyRkfFNXYh8
	bo6ep5jACWSb9XjndjKX+R+w+9RMBfqVhLWMrrMF0S63t0Wyac0+JWf670Gz36jA2h/+AuWdjMh
	NVOFvkug=
X-Gm-Gg: ASbGncvOeUBvge7jYi6EustgWyy/KYfk4pYzt+Ra5pOn2Q+7Pg19Y0ZV2fG4W0y5Goy
	S+aTWIc+7Zi0bwGgs3jfWEsGHuCtgzI5uyzi7gEyb/h9jg3RMbK1lIEofN/6NNc0AQS0GHZmw6u
	/wboOXjWciwl6/oBw7ViW7l7KXxxM4pJJAROK16vPzWE+mykD1vz8sRMx1HTHrYDJ5PIHdJ/IVc
	56NqiCNFWfglFfTZKLVbeqhHggr7QcPw7UXer2XBA+XKq85XiKy9xMS4iolsRfCUeH+/CEgtd2v
	Wx/NQF6Mov8SF6o83tI3L10QisgZ822FWvAX4bjQtpB6sYI6ExzIkW0ctjNSn7GOyRYokdJefIP
	+8KR1E1qba1b4ZGKKXaagt37jjgOa+C37dQ3KgA==
X-Google-Smtp-Source: AGHT+IGS7Wybf+10qczHDb+s/ZW1EOGQH6Fn273BtwmHQS/UKM1PO+aqhbN+skEAkwby7IIV0ZcOkw==
X-Received: by 2002:a05:6000:26cc:b0:3a5:2ec5:35b8 with SMTP id ffacd0b85a97d-3a5319ba427mr2457378f8f.11.1749220982107;
        Fri, 06 Jun 2025 07:43:02 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229df09sm2085274f8f.6.2025.06.06.07.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 07:43:01 -0700 (PDT)
Message-ID: <2ce9f14e-b0cf-41f4-84f0-6e80749b9504@linaro.org>
Date: Fri, 6 Jun 2025 15:43:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] media: venus: protect against spurious interrupts
 during probe
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606123334.4114123-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250606123334.4114123-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 13:33, Jorge Ramirez-Ortiz wrote:
> Make sure the interrupt handler is initialized before the interrupt is
> registered.
> 
> If the IRQ is registered before hfi_create(), it's possible that an
> interrupt fires before the handler setup is complete, leading to a NULL
> dereference.
> 
> This error condition has been observed during system boot on Rb3Gen2.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   v2: fix authorship
>       fix spelling mistake
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

Please add a Fixes: tag.

---
bod

