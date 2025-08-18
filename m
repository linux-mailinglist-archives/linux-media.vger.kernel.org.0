Return-Path: <linux-media+bounces-40142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA58EB2A130
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA5BC5E4CC6
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 12:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2634319847;
	Mon, 18 Aug 2025 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L+61y+Sg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5F430DEA5
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 12:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755518946; cv=none; b=c+OvFiDflGl5w137hyMowwHAJ+Hl9psHSLSzaLuWQiy+HkUjJJlkcCT7UFrzzRrJ0g0QeniTIxy4j6lquL+bZk2DxRRyI/CwAjFfS/r14VJmgcvR7xdwdWlYWIdb+2cFaHRNAsY3tIg3NiZb/5fxJvsCtOPKuaXNbb4hu9oUUPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755518946; c=relaxed/simple;
	bh=zhQlJd80zNi92fHJAP62i7dk7OewyujHJUO3nPQQmXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pm6hio/YT4w3TXjPX5Q2V8cqQsE+8px/MIOzynGXG9xh4GfXFfT7oFhsAPhxvMcP742+0/v+idMzhPE49Wk7jyYta2Il4eB8UH3cfKc4yAnbBYrr5c2eTxZTX+lNDHTPtuokp0pQcQL9uI6ql1eNNMSnC0Xu04CMt6vGjJ1pJE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L+61y+Sg; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7a01426so69465366b.2
        for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 05:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755518943; x=1756123743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/wf4XEW96LfYgNJS81FI5VbVkVliDM/dqMzkSgUY1Y=;
        b=L+61y+SgfSbpy2xnI3KHytoQeZxOUBF4Ef93L8sOTnUK7VFe0+Weekh7QB2mq3s38L
         3PPHtKgo5cIm29V+IYSJmj8gclpz2KUV6hG4kHBfGLU7VfjsC1MJk747HOUV+gnkTzJb
         Kg4mDbwK2gn/FPNfiLyobsvTKpPSihBE91ytQHoI4kNm57rMf/7Dv9oeiAMCh/IunUz7
         jquyJYAcHGy4wOx/nJVuc8dpuRTi6YmtxAAyNcsV35yYZfM310z1S5equZV/axoAKY2Y
         9Xr8scUQtX53ODLetgqsPjxcLRYIzz9tfFm7lghsFzcsljTUZlwbeSX6jEy9sSeWnyE8
         7CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755518943; x=1756123743;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7/wf4XEW96LfYgNJS81FI5VbVkVliDM/dqMzkSgUY1Y=;
        b=D+5ETfbB5dNMEsCyoFRmb9exzBoOmurXUy7XDDYv5W/FieCxZVkGfnsngMNS3nJ+gN
         kqHdPTxD+fnkn5U8w7341Co/ymDh03qzBDYoFCWDzHBeyiTybVh95WHf6rF6aqgnE3TP
         5j5FH25+h+HQBjgfOhKHlb2DTB1YtAwLH4WolztaURp8GCODu0EnJC2U1hjJWanmB8+q
         1LcHLJqYlPfDuDsVusJtj5lOnliEO15SLxxcAI4bP8w3P8vOQ2YOvc25MfzZrwc3ZqWF
         vIajcNw4eW7y65/IgQLDLEhVNhs99djsWMvHGCXcVAr/QsVRy5G+nn+l8lXzjVr6ARoj
         Xdyg==
X-Forwarded-Encrypted: i=1; AJvYcCVEt3LHp7yjbu2BhMaMTuT263JubasyDBF++XH1H4ouQNYehB8ztmfX0LFrmwC0G4wO6EyR7qMt1EIbXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/bK1c+zn9apUFtY9AcQvoQX30oOHE8x+OXRO8XVpcZ9Tv+nP
	X7ZiELvkL00SMSKThqz/xKOUGxklTYmjpmFgGwoxWFcmRIKB+Il4Yc8kqdibHT703/Y=
X-Gm-Gg: ASbGncvKs0jN0XYoPj0JvQ3oud6UUGpbL3CLi/MlUK1K7QB2T8ZEVGWjTp9D6+9n1CM
	gIxa13CbiEte58QE1/MYXT7dKEr3YblScER2q2d1vsgEsBjWL46KcuO2KGRW8UIkmX+NsUSJLjP
	+NFR6Un0cL3OfCvdj6gH6Dktq2p3dWac5vmhum+ld3JolFuh+THhFecrlcST+bKKMdlNM0oC5aA
	xm3HO/6nxpZta5jbZrvIcCY3YpZsuJG2mKcIwm2yhS89N+dmhRy8fRxt5AUtuKnfn6IC3HT8+L6
	etGwQ6kKUqEMPwaZCHp2lykA0T52xGYzfAN77oXJ09p+oPadk9s1h82WbctKmw94ajqLaAEN3kM
	S8VYVcpYIYDIaRsioX2MPTIYsLN99IrSzCabwrvBJg0E=
X-Google-Smtp-Source: AGHT+IGRMfpFIZvZ7u29pacmvJz4C0owYxR5kq96xs19isCciYLvnmOhz9IJXUPk4ZUiUsTh++K2ag==
X-Received: by 2002:a17:906:6a0f:b0:af8:fd22:6e28 with SMTP id a640c23a62f3a-afcdc29e30cmr498595566b.7.1755518942902;
        Mon, 18 Aug 2025 05:09:02 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm797994966b.35.2025.08.18.05.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 05:09:02 -0700 (PDT)
Message-ID: <2cc1cee7-5580-48cc-bb63-cb993643f2bc@linaro.org>
Date: Mon, 18 Aug 2025 14:09:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx: Add note to prevent buggy code re-use
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Leon Luo <leonl@leopardimaging.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250817084824.31117-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250817084824.31117-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/08/2025 10:48, Krzysztof Kozlowski wrote:
> Multiple Sony IMX sensor drivers have mixed up logical and line level
> for XCLR signal.  They call it a reset signal (it indeed behaves like
> that), but drivers assert the reset to operate which is clearly
> incorrect and relies on incorrect DTS.
> 
> People in discussions copy existing poor code and claim they can repeat
> same mistake, so add a note to prevent that.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/media/i2c/imx219.c | 4 ++++
>  drivers/media/i2c/imx274.c | 2 ++
>  drivers/media/i2c/imx334.c | 4 ++++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 3b4f68543342..9857929a3321 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1034,6 +1034,10 @@ static int imx219_power_on(struct device *dev)
>  		goto reg_off;
>  	}
>  
> +	/*
> +	 * Note: Misinterpreation of reset assertion - do not re-use this code.


Typo here: Misinterpretation

I will send a v2.

Best regards,
Krzysztof

