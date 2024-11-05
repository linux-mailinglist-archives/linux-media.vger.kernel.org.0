Return-Path: <linux-media+bounces-20919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1459BCBD3
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 12:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF52C2841DB
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 11:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9901D435C;
	Tue,  5 Nov 2024 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vW3PXFcn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE201CB53A
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730806038; cv=none; b=rWLC4xAdHCl9J9Ehylq2v9f/3q96+nXt0N5LBsv8iv9Ed3r7NEtCGY+g8tU+IB2ntln4UAagV0koWkpF/J4fFqLu//pUOu4n6GMe34w35Puukf8WVCCm1dWswcWUvDXwmOjaFvvtNu4EKATrLwHgePmLt08nP0wzM2k4SZiSDLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730806038; c=relaxed/simple;
	bh=t+wcayOuOFWui3ZrTMmgaqfBOeZYb+S+1dfjI7oaAJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8Q7a4ejCQevv8ugXDnuPi5AJ9JeUI9VaEwe6Z1aXEnrwAoldc2hnIJ7dVlshklR3GsUJ0gE/Y/1n13fBzhop1KVZfkh1Ak/yAJrl48ufuADPfpF/bF2PXzPaCu0tPyslWdWwdpr1jxrqQlDn3cb8cnWMuhClIRhpAeSIs8s/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vW3PXFcn; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so6049209e87.1
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 03:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730806035; x=1731410835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iD+xUYXyW3j/17XwwT1x0rwQmfQGKFXfNjXAKsnJrMQ=;
        b=vW3PXFcnjsAEE2NJ2n353O9Kw/MMGQlrxEwR50DwbYySOfTLWFcefrRsAmPhRb5I5i
         Z7/1xnSy2YsRYGq7PBh/1q9aPSjJKs7QfmhthM4TbYoRKuRfj65ckeG6G2QK6eYSZgWh
         RQUsLSIAMIhEtLbVnBwDuxmFPFUl1+eGyUDM0ICkamJZbMLqyGGSJEdjIP58bS9VNmxs
         ydiM3iULHE0imlBx9q5DCDQgjVuYnVj/IVHC03tim+MmLExiStAMA7ywkSTKBh98Seli
         d4YfNMFp1JfP+F75J1hDKYltO9yxNM/5+irj9CDWA9LVpl7d4gg6z2S5f1ZjG8nObdAu
         MxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730806035; x=1731410835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iD+xUYXyW3j/17XwwT1x0rwQmfQGKFXfNjXAKsnJrMQ=;
        b=gE4GAOqT1H38vh8d6yIFcwam7iKmv36932jNVfK7IhME/TyIC5s9T5eGYaxP0qX7O6
         fc7HoFI7dN+pmRuD0tu5y8W1qC+AV9OrTUqXAle8T3aCvnjkFhG/1CNTI2hBU5BZXlGw
         sz8sbAo3UZvjto+8EZh1ZD8zimrcR5ltXBaPsujmsh/F3/Pl1mqDR5mve0zZNaoZ9YG6
         XYkAlwtCV/Yjk5Arn8NsnXvratlgBaDTKk5qSPUXLIvshLGPpRxScwoa5kmqI9+Yk0PH
         LUyQia4Yjgzj5bMT/1nN4FGpl3OFHgWtoOf/aKD6Y54zViDKv76I0MRNYjb4zpFfgbYy
         A3vg==
X-Gm-Message-State: AOJu0YxlsZC0acMpgYbXJ8dnKghc09dmWdIc+mPjZsCfc7VInWB0Pjt/
	kVvD6gIZBmPb8xRW33MJQVpIUfCgg0yNv2XzTWsrpZnUM1kBR/3dggpH+KBsXVY=
X-Google-Smtp-Source: AGHT+IGRLlDbqNxsoLi87Nc6zewG08qTiA2jLORs6DC+oWcOtwio/WsZTF9GgEWch9+RqZOZLvwHMg==
X-Received: by 2002:a05:6512:1390:b0:539:e6bf:ca9a with SMTP id 2adb3069b0e04-53b348b7e12mr18452412e87.6.1730806034904;
        Tue, 05 Nov 2024 03:27:14 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432a6b4fd08sm9096735e9.12.2024.11.05.03.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 03:27:14 -0800 (PST)
Message-ID: <a71e75e2-14fb-449f-bb27-2770261708ea@linaro.org>
Date: Tue, 5 Nov 2024 11:27:13 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: venus: hfi: add a check to handle OOB in sfr
 region
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-4-8d4feedfe2bb@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241105-venus_oob-v1-4-8d4feedfe2bb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 08:54, Vikash Garodia wrote:
> sfr->buf_size is in shared memory and can be modified by malicious user.
> OOB write is possible when the size is made higher than actual sfr data
> buffer.
> 
> Cc: stable@vger.kernel.org
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 50d92214190d88eff273a5ba3f95486f758bcc05..c19d6bf686d0f31c6a2f551de3f7eb08031bde85 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1041,18 +1041,23 @@ static void venus_sfr_print(struct venus_hfi_device *hdev)
>   {
>   	struct device *dev = hdev->core->dev;
>   	struct hfi_sfr *sfr = hdev->sfr.kva;
> +	u32 size;
>   	void *p;
>   
>   	if (!sfr)
>   		return;
>   
> -	p = memchr(sfr->data, '\0', sfr->buf_size);
> +	size = sfr->buf_size;
> +	if (size > ALIGNED_SFR_SIZE)
> +		return;
> +
> +	p = memchr(sfr->data, '\0', size);
>   	/*
>   	 * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
>   	 * that Venus is in the process of crashing.
>   	 */
>   	if (!p)
> -		sfr->data[sfr->buf_size - 1] = '\0';
> +		sfr->data[size - 1] = '\0';
>   
>   	dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
>   }
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

