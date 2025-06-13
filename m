Return-Path: <linux-media+bounces-34784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B30AD9180
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941521BC41D6
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2591F3FC6;
	Fri, 13 Jun 2025 15:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GyJq3AGI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587DA1F418E
	for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828989; cv=none; b=dcI7ePVdkMUgXucViBd0KYDdISHyQvo5cMv6cW5eDgORlw+Pq/1yWMG96YjyfRO7Tb4+Y1+AplGCn9462FEL9NV5E1B3hKebDbtnWx/Veec2DVDNcNvaLqtNsDlq7vlByXZVIwA3LSKPWfl7Hl6j1dfYRw4pXwX1o57ZaS4P9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828989; c=relaxed/simple;
	bh=mQPr3lx+oLsQJZVsqTLtsRDGu+1Ha23dzIO1vBurXIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fh8769je+dJPWVcvEzeZ8N+JFnwqrINOaCTZeurxTrUNfHt4bggaCHuKYB8Ss2sX45EXfFthIY/uAMbmbqLdZ4SnXg2yB1HnkqYKd2hI5p1vD0kclIrd5iiNZTdGbuzBr/juaQz5phSE817651gVktLIYnVhhZ6DP2uluk8RUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GyJq3AGI; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so1416255f8f.1
        for <linux-media@vger.kernel.org>; Fri, 13 Jun 2025 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749828986; x=1750433786; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWv4UeFVj2hILiovDcCHvWzMoWMBEkghmUzZ6WsdBWo=;
        b=GyJq3AGI6b8mYByxX5TlBcvjJ2lmuHO0xrCsukpP6gEyhVfZUsOVwdTSyTfAHFXBCR
         fabh2eXpz6aPF+QESWBIm1zVZXD+CfdFcNwzkITHvCWXQMiKzel8IqgYeG68L50C8cZu
         Gj+BIHrX7xctNLG0gFKKHQ6Ypdhp1dZUiztCmrAU506PO8O8B7FzOLHbwO5bs34Txl2r
         q/TZeoixowfh3yBeMbOrek1yjJeW3je5vG+WuO4/q3snquXRsf/2MwS/sRvrvSiIw6lO
         Zp7/WB4JlUprOv5KtlWmST95Zt2T2x2gK+0WOpVDF2VXukYgTlwLFTBgI7RjHRga0BaY
         AI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828986; x=1750433786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWv4UeFVj2hILiovDcCHvWzMoWMBEkghmUzZ6WsdBWo=;
        b=E4ziby6+n1gXZjHTBVmzJSq23LmEO7Kbkb+x0Jtfbn7UIGz3Gg4znxpzx4+2Y8HlY5
         u7AVCPu3CvN1CDVkoiNgxm2vc/VUn7XgVsd63FCCbS8YkJYFLezGNeSAGwuzqyTq3MwF
         r2n9EcyxYRyWeHUajog1KjwRbJSpCheFjC3+OEDXFTG3hfoCmQe1ireGOZilgf6eTyPR
         rIzycDrVG7Tej5jT4RJECgWDbR9MfuwJGFc+S/ivFN6aNDMxzwYGoLaUptx3kREN7QTV
         XUNP0gNqymNROm1Y0OpLVqKOS8T3s7EKHQQOnsFl1rWy4jrKru65yWOu5n59QhgVoSHE
         Z0PA==
X-Gm-Message-State: AOJu0YxhQIbpL3dM3YSkPkb5hNUHx4A1gzh73mFObQx+w45ISUxfzw4D
	mYa9sAlpARUCX4FqMhq+yNNjixlSMTC7uiWI4fPo76bJzeJwBD3a902KT7LpoitRn4BcMMzxMKN
	C14wv3Ws=
X-Gm-Gg: ASbGncuZduCMu8L+krOdsQ60nxungzmyG0+x9OSpVE9NY3O3L7/LVjUebcuElCceuEM
	COotk5Yfdu7j3SRr2p6Him4uD4wwiEqrJHf79ZtDIKvJqR6ZtX0ScwXOFYuRe9PabXo1Gf9YEv7
	UyygQ1TlERVxxGmKH/6JJcxl6vZr1ZuaqIXF0fwvUwPfNLGH9Keghm7zgtW/xf0DE4ETRAKXPEk
	oFv9UbkK0dtuDmePppZiUHIZEVQIf6P6pJlCEh/mdyeVCm5/3OKM765qv2sSId5UtwaHY1CA9Bp
	+qKFQR164aIO09xrN8TApQ6tOQQksYymKb10OOn2/+Vj53yCUnZOazL3uPzw07q/s3jviuH6cqD
	DUIYLM5UFjTS6AXaYUax7j34K3E4=
X-Google-Smtp-Source: AGHT+IEdPQZ+kMct/mFrIqWxhQP7ARSC+kL3lHuKH4nuAFPPB0GmSIcXahH+K6ef7TZ3V7gCc7y8vA==
X-Received: by 2002:a5d:5c84:0:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3a572e92c50mr144867f8f.50.1749828985372;
        Fri, 13 Jun 2025 08:36:25 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2a6a5sm2644199f8f.74.2025.06.13.08.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:36:24 -0700 (PDT)
Message-ID: <0798f626-0ed7-47ad-bd9c-39732cd4aa19@linaro.org>
Date: Fri, 13 Jun 2025 16:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] media: qcom: camss: cleanup media device allocated
 resource on error path
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <QSZ_UJl8EdHC4ZGWyIbBtFJFp1xi6HoqNXYRJCBhInwieOERlOo8Wkk-NERxAYIY_WJ9rWwnlGR31zI25yVqcg==@protonmail.internalid>
 <20250513142353.2572563-2-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250513142353.2572563-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
> A call to media_device_init() requires media_device_cleanup() counterpart
> to complete cleanup and release any allocated resources.
> 
> This has been done in the driver .remove() right from the beginning, but
> error paths on .probe() shall also be fixed.
> 
> Fixes: a1d7c116fcf7 ("media: camms: Add core files")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 06f42875702f..f76773dbd296 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3625,7 +3625,7 @@ static int camss_probe(struct platform_device *pdev)
>   	ret = v4l2_device_register(camss->dev, &camss->v4l2_dev);
>   	if (ret < 0) {
>   		dev_err(dev, "Failed to register V4L2 device: %d\n", ret);
> -		goto err_genpd_cleanup;
> +		goto err_media_device_cleanup;
>   	}
> 
>   	v4l2_async_nf_init(&camss->notifier, &camss->v4l2_dev);
> @@ -3680,6 +3680,8 @@ static int camss_probe(struct platform_device *pdev)
>   	v4l2_device_unregister(&camss->v4l2_dev);
>   	v4l2_async_nf_cleanup(&camss->notifier);
>   	pm_runtime_disable(dev);
> +err_media_device_cleanup:
> +	media_device_cleanup(&camss->media_dev);
>   err_genpd_cleanup:
>   	camss_genpd_cleanup(camss);
> 
> --
> 2.45.2
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

