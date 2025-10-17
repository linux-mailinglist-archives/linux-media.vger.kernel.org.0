Return-Path: <linux-media+bounces-44839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699BBE7358
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 10:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BFF84E6737
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586142BDC10;
	Fri, 17 Oct 2025 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMsbfSx2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05951296BB4
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760690280; cv=none; b=LTB503YgpadcGnPpuiCGkQp60OMUtQexBg+x1AUaPxA0+mgTkZx5qaw1t90pWQOKjqkUSqRqoiu7GYsweWWQ2+6iF1nEMFTOj8crdEeo6+fmpweieEeTUHVKfPjRDTYfaWxd1enNXMAJl/v2OQGAMas4KFTZ3EPWwXUG+fngbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760690280; c=relaxed/simple;
	bh=lU+1cO3Zwc0zGD7w3qerML6V2Pgt4on4weQv6NRLb7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f4bhN+gnmwG9StMJuFpKTcghuCfz5j9vufzmZlv2ZZhPN3YMhboh/xLAxTZF6f1ALaXRsfJZz/XfC1LHMG6aR0rmwIWq4ji+/L8VpURETjkvd0xgf3UEpz/3k6/jkFn8jmeI+iSkOZe7IA7vUAiXb+P9rWrBSQpJTAjzjAFJmis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aMsbfSx2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47112a73785so11808995e9.3
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 01:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760690276; x=1761295076; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=om9V2LjmdpVk1UDFsC2kQmy7iCE3RSKHplIPxsp5GZE=;
        b=aMsbfSx2yq9Lz6ljpzhUmmQ0rH/icVRAlrvz4o4wiI5HwIvGZvEPRtN5NotRhjiT1m
         Ij5kNUegHtQ27tSIsJDDzgDuoxW22IR+7m/zONlVu8Ar5xEmdtC1uDEaY3UMcvzFxVkE
         /CsW3kNHCk3m74wo9GviaF/kg6KdYKQ/0wEI+E90TnXxcm4O2eM4ugRxpfwVMjiPwE9e
         7r/t9afbq7d5AooWuaxa3JtRWjJ/Hwbp4PovINmxSFvrDMg+Jj4zjcYHFqynk5ujsK5X
         Ch2x3zDtjirhyRz67ilpt40evUTst24eavc+Xg0zTSbNZKKund94P/OxbKahQLRsdZFJ
         3k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760690276; x=1761295076;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=om9V2LjmdpVk1UDFsC2kQmy7iCE3RSKHplIPxsp5GZE=;
        b=ELUTk6CCR5+4iR1ZBhR3KAiyAQH+zNwx0dnCAOAVjEODaN/BaZRNIj0DI49vQIzg3d
         hUsSkb8zJEYl4+4nhGYQIEkxFAtf7iNsL3YzRjyoyN9i/nVSD4We6lVbgKfDmIcBAQxb
         2cDOqb5+ulFim0rpl7bFLyt6xpF7IsU7yo66tOawgMRA3hbW7t5rdUKRCG5bx9YxYMoB
         kbANZn09paWAyB3d4+ZQ0MKQDkuGIfUkL0Egt/qLfybnZQzDOmwuD/UUIYJipZwDkuom
         MmjPdLeDvYg7mUrLBbGkfmUfinlroIrSaGBJOuxKfvRMdcXm7Gb8O8JsOn7zORjyYrgA
         ebOA==
X-Forwarded-Encrypted: i=1; AJvYcCXGZ9iYd5w1KYBOWoi1+8qr8yCCuffhyH/K1R/R5VrQhKapDHmYWIGnOKLPpVen7/JI38WDLUH5TvQgVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHsY7skkul71m26iODdXZ1fSNqWbXB9dxn+g1EplSpRqwCr4P2
	XQVZ2XsXaXYvhw14XWcTDJwv0s7GlRpng8U0RvsgvCdvvrRnWexEpNsdiDuRNDi0Gf4=
X-Gm-Gg: ASbGncvcNF0sxwCSprNpBz0rOSEkJw3z0DTuQIr2mtd09Gtoyk/VsZW8vH+x5wObGbS
	2KoLmpaNye6aZvL/zSj79/shqWylSlCXltTbpBFuFQvL58O6fuMv6cOvWQsiNOVvaj3upAajvcG
	IUUOZzvf7Yr/RhOYutPJm09vAO2T5Lb/01yg5UaflRhiNbwA9SJEXxZ2r9rD6d7UOkwmCdfyfyU
	MlayyCFuyEjg11gCTzE6yUKjF5laQpQZmA8kG5guLVYwYfTiGVb9IiwIftRVvd1ZS9Kae+YRn2q
	Jm+IRSl/a6cZYOexZzblrdpZDp0ZgF2Zw21d9TMhROuVozWyTULxV6bpHt6G6IB+GNOxeDQelKz
	r3bS2OnNMncii0AHjpCO2FBYlZBZx/LptytdszAM8TbPeVWJtjoZf3PZO1pdDoRCzEGwbzqPiaN
	cVYswOQ2jkwrdSK41RISgObDeaxum932p2qZB8NthWB7iZUSOtAaw8
X-Google-Smtp-Source: AGHT+IEoeP6jDjWGte8b53CU1YTjsBnCCSNfMgJsOHoHblW0l/uJG1CiY59Ep03ULPmXcMaAMIM+Cw==
X-Received: by 2002:a05:600c:3492:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-4711791cadfmr28504945e9.32.1760690276296;
        Fri, 17 Oct 2025 01:37:56 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710fa76fd0sm38682415e9.11.2025.10.17.01.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 01:37:55 -0700 (PDT)
Message-ID: <41f3b22c-2882-42e7-bbf1-91e8cf93ba21@linaro.org>
Date: Fri, 17 Oct 2025 09:37:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: drop unused module alias
To: Johan Hovold <johan@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251017060435.8524-1-johan@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017060435.8524-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 07:04, Johan Hovold wrote:
> The driver has never supported anything but OF probing so drop the
> unused platform module alias.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index d9d770e5e7c6..c93aeeb5ab20 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4545,7 +4545,6 @@ static struct platform_driver qcom_camss_driver = {
>   
>   module_platform_driver(qcom_camss_driver);
>   
> -MODULE_ALIAS("platform:qcom-camss");
>   MODULE_DESCRIPTION("Qualcomm Camera Subsystem driver");
>   MODULE_AUTHOR("Todor Tomov <todor.tomov@linaro.org>");
>   MODULE_LICENSE("GPL v2");

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

