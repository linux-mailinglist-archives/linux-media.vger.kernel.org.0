Return-Path: <linux-media+bounces-44879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6BBE86E2
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1EE818858C6
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 11:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4033332EBA;
	Fri, 17 Oct 2025 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woRynFul"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C5332EB0
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760701207; cv=none; b=o8LWI0Z9YJCtWQhFmp40i9UOKO2t+21CICG2lrAiV/dL2e0XmGxf5fR8gKbLWoR/g1iSX5gh1F7Qagh5/4GyOdwYjHA4R4rckn/x75Zi22zhoETv18DGADlRhsG+TLYKAu2fgTp005ULjHakb4vHXKFNFATLrrQfg8yQvuDM1R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760701207; c=relaxed/simple;
	bh=pBvCaNFbLjL1ajs/K+mrwrVvhl65E2/fbRYjA+GaWuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmbgKFpor3OeV2aIjbm8ucMMZk+YGBpehGr+W1Ovc5RJXljwBNko3CT03C7WOUHhLOXVI/vMeU19gdLEHqLk9Lz1fJzFJYMiUhnRTXAcosTM9IUHjd8G/6Hz5sxiclqJv5I7fREkHCesly8OWGvZLWA2nCopc34bS9guXIZJ/w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=woRynFul; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47103b6058fso13628385e9.1
        for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 04:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760701202; x=1761306002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zD2JbSDE6RoiAIBCAlIlJSpe5ld/inYGH7z8Pk883Ok=;
        b=woRynFulPYG0Oyk7grDerpZBVFi0OHeYTlxv/VZU+8PE6+QUwKajZzudAaL2CzLuCh
         BgFs4sbqH8kLEZ/Utlk+EIg9ZaR3PXs4vsJPB0JfHMtadstQuhKwBFub9itB86UWlVZ0
         h66HboCFhzyliKKepOgSYgllzOrMyTZ8Rh3SpbyOVOp53odhX337sAjS7nh3RfpqoaBq
         JwGsDhN8yEb7iFkZMdveP5+R+hpBJGOYZpSnQpP1AWaBINDoTIPrYkHQBhtfVIJqZrhL
         XWi/xmDQ3tBDl8p/Hrx8qeE3umfR4d7C13BjImb1+rTFAovtbFJh5NaPrSfdAxJf0Eqt
         5wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760701202; x=1761306002;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zD2JbSDE6RoiAIBCAlIlJSpe5ld/inYGH7z8Pk883Ok=;
        b=YA/M+/ClWBpQpX8WkCKj0P+TLmdqduMcGuG7tG/xszyRqur2LKuYqVQhfhLED03oGJ
         AIjrlberENOEL++5WK1PNdfoRMAy2DXmI9wBPcHjoBY/qh2jD4Xgdo2gVvwwJk3VeSCE
         qjDCStaLD1PsH3mJeaSMUfCtcZQIUzUhlEsqyjPx3ldO6Z7DW6C/iFRVn1bfymLvYlXO
         el29i+7pVQuhAm5NmlpbNN+vqo/sZ8BDILKQkAqP/8If43ztcaf8nNVbQTx3Fyewy+Qf
         SRQzxGPBlvsPFM3LQPNfOkSyCGkAlEg2w2XY6Tq2VPcyMqX0PhtGn0tmUUNYkRwU6BLa
         5KKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/JlZ4Yg3JLZdxG/kfXk4DjfH6Us1UeJ/FuBkAY/yhLKVX6v4I60wT9PVCnAgQO32nrFOcT2547hD5EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylfgxIW4gsL+IUII2go/lBM56Vsho5sdUcCxdNXWYQlliKSPbL
	FYczq+ooRZhcMdmFSYl+EZ0ZlUxOF021lX2gXb+qaPEFRnJvFvj4eRderJJUxfxmfHwg/ATvq2u
	HdHzA
X-Gm-Gg: ASbGncuFog1PRkVgG7Sy3RbaFVd+Fn4Ld6ocGrMvuyU9rd4hFzUUlGHAxc/zuUTADPs
	JTmgnV77Tz3Jpqaqil41swfo3QG3bG4q4hbnjLhpxp3fL3kwGmPJrmdC/E/G3lyhDaR442XjXVw
	UDt8LMGiJh6ljlqodgSyrq1ionvzw02U16ljlOX+LHwwfM7EXkaRI5BfkKYon56bIEtft1YIeZM
	+fVQpcsdGsUSoOmteWCILKpMumZnFOxtCyIaoRfCtsgjJQ6eu6IzcFWLhbjIwtkutEledvBp0HX
	G9/38+7KML14zFuwiBQsFY2rW582haqsNCKeTPrFt+nIzJYE5MjbOCH/th9ahfroF1HLODaPsXJ
	klm36CA+mNvTFkwLaeIOHosVsr0aGbe76AdobxZfrTaY43MLG5pWGxMtiDo/oJ8mKoXgn6SV0Du
	iLgvehZM1QymqvOJNQSnDcnj5GftMsyYyXbrICAgjlgw==
X-Google-Smtp-Source: AGHT+IE/DIOgsfLCWQQMCTsozZIv5WTDmox6lYMK+/kj99Jcq4cHsKuIYoT1ShbMmlzr64nB2z1jRQ==
X-Received: by 2002:a05:600c:6290:b0:46f:b42e:e38f with SMTP id 5b1f17b1804b1-47117345ffdmr32045745e9.19.1760701201703;
        Fri, 17 Oct 2025 04:40:01 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426fb279857sm11190319f8f.20.2025.10.17.04.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:40:01 -0700 (PDT)
Message-ID: <ecf63295-e92d-426e-933f-4efbc667b9af@linaro.org>
Date: Fri, 17 Oct 2025 12:40:00 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: drop bogus probe deferrals
To: Johan Hovold <johan@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <iRhdXfjORNkpF-OnZ5iafGKrZq5VC_n5X3M_wEBMSzbXpgAoQxgdKIfdAWbBt_oC7p_b1pa226Awh5cp-kR95w==@protonmail.internalid>
 <20251017055809.8037-1-johan@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017055809.8037-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 06:58, Johan Hovold wrote:
> The encoder and decoder platform devices are registered by the venus
> driver as children of the venus device, but even if someone were to mess
> this up no amount of probe deferring is going to conjure up a parent.
> 
> Relatedly, the venus driver sets its driver data before registering the
> child devices and if this ever breaks we want to learn about it by
> failing probe.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 5 +----
>   drivers/media/platform/qcom/venus/venc.c | 5 +----
>   2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 55c27345b7d8..2d822ad86dce 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1778,12 +1778,9 @@ static int vdec_probe(struct platform_device *pdev)
>   	struct venus_core *core;
>   	int ret;
> 
> -	if (!dev->parent)
> -		return -EPROBE_DEFER;
> -
>   	core = dev_get_drvdata(dev->parent);
>   	if (!core)
> -		return -EPROBE_DEFER;
> +		return -EINVAL;
> 
>   	platform_set_drvdata(pdev, core);
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index fba07557a399..f1abd2bdce6b 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1560,12 +1560,9 @@ static int venc_probe(struct platform_device *pdev)
>   	struct venus_core *core;
>   	int ret;
> 
> -	if (!dev->parent)
> -		return -EPROBE_DEFER;
> -
>   	core = dev_get_drvdata(dev->parent);
>   	if (!core)
> -		return -EPROBE_DEFER;
> +		return -EINVAL;
> 
>   	platform_set_drvdata(pdev, core);
> 
> --
> 2.49.1
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

