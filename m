Return-Path: <linux-media+bounces-24030-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4E59FBADA
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 10:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8A131884B2F
	for <lists+linux-media@lfdr.de>; Tue, 24 Dec 2024 09:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F632190470;
	Tue, 24 Dec 2024 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Becd+Mro"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17088EC0
	for <linux-media@vger.kernel.org>; Tue, 24 Dec 2024 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030881; cv=none; b=tM5sJkGRFiUKGMstrldgdBzFUR8t2tUbWxcsysBf0W/ICBuEVdz3GgsEe/x559yzRo8vD//eeilRrLYt/76zqIQQeEANj4jxfVoTH9QUCtCXL7EZs9nPbUeoLrgZDFxNgcUVMT7gxYaRzmyR8DYuCVhJDRjyrOWr/cjlEAvKBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030881; c=relaxed/simple;
	bh=l9heioVeOzEuPAjjFbsVIxVeeOdtM60CIli35hh1UJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSzoTydVRZWZ9yxpGb3FP16Rbm8hQ9ShhYxd6cmPBIucYmbeK3lCRMKn6Ez53Ox3bDlA1ICTh3O4dvzCYhFKYL87tI1GTkhIzFe3oOl5DAPBeiRWXp45MRGuSJpwerOdNbnpmifB7v9rgMtIbZ2HAdHZgdWZlsgiTh1+DNE2UQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Becd+Mro; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30032baf9d3so3254151fa.2
        for <linux-media@vger.kernel.org>; Tue, 24 Dec 2024 01:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735030877; x=1735635677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f5AG8QMUtbvBzSiU43An6Att8E4YlaSSFClBM2LiJfc=;
        b=Becd+Mro/kIMrNyze8nXo78PzA4N1TwkfGaiU/UQaTn3OUBzhWrm3Y5r9jAhud+2A7
         aRd2J5Q+/9MxYzD44nJJcRKRRUhtcWoS5sYwYmivqZwK7NuZmS6vIjDy7YtQiDnecMHV
         oRF+LVMmr6dceH+00iOFppRw0wLJ0inkQtHd00ffTfxcftxczKb7wrLrpQ67DV50fUcV
         cfLPAe7HBxUqnyRUGgZ7P047X8SghvnMBb8+FAPNRAyfxuDue0sCBXK1DX2VkK9IPUgZ
         iu6oyZgyt7EihEYB4Niq68NY82FWoehGeSPFopfHbtLyRZQMYuxq3kgUp+UruOj/ZVg2
         E0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030877; x=1735635677;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5AG8QMUtbvBzSiU43An6Att8E4YlaSSFClBM2LiJfc=;
        b=nWIRlQmYp+icZvxHwyMgLuRhRLrMdKiqx/OElwvQmTO1vFUjnWsta5mtwoXWyIgFiT
         Sd2W3rWlm6W7W64WTk6dsoQXdnOKz4gknpmAfh/1EvJ6rMTIJ9ZFF5lHoqHIgM/FcdFS
         Y5uS2FuFOkbYrx97XnzMwtcpobqvcnvRoxjg16gQtOAgVDe41r/44gs5uMeNC2RDs17t
         xZRKmLVFOL3YV6YtvpsNztCkL7uHauYorw3pTQyEFai9KgssDgP59I6FC1lF5+uy2ZVr
         ab0jZHKuk2QYkCViye5v2Zl9A6RlIvUnouc3M8XLqkKrcM2HyRsWIkwYwBTZwZccOXGn
         qg5w==
X-Gm-Message-State: AOJu0YxB96cXA9fcZOrSCYFYUk6QFtyZN0EvlXsmPWxRDe5OVBdQUxmc
	kXMvR+8FFxHPJL6dgYyJioa88ymiDzOdyYVFjVlHNVpYmQXNiwOEnfTeeDTU5Qo=
X-Gm-Gg: ASbGncshVjWC/iJTFXROM8081+nxiW9FEn8TgDdW57sv45t8wzWdTyUwJOb6X3Del3O
	xiOsqhpUKw9yb8GpRuKAi+X9NP3ta2etbHXhMytL3VRf1idgzDoQGMyjfINbUtvr3pNvoLwqvMV
	HBG+MQBQ4aAsetu0R30flz4Q7WeX7vi3rtImspoaQH4vs8T7YwP0VQrXf2RT0euhjMWCPaLlXaa
	0K6Lan5cniD5HYQpgcJiswnHzn6POB3vCJ48OjyDL6STy6ylC4+7WTeuBHkLx+yhkYwUi8t+1m6
	f0xRfhrWY/DX0WPNxdfxV86vks+M3t/Q4lM=
X-Google-Smtp-Source: AGHT+IEkE/3s0TKAM9KieDA+4ucBCYqr37jx0CxUqXiD1peYo8BUVKo5tuHxft9Aa0DdzKXFtPLx9g==
X-Received: by 2002:a05:651c:2224:b0:300:3a15:8f1b with SMTP id 38308e7fff4ca-304685cd1d3mr20149361fa.10.1735030877109;
        Tue, 24 Dec 2024 01:01:17 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c5absm16214791fa.16.2024.12.24.01.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 01:01:15 -0800 (PST)
Message-ID: <9ac372b7-1f29-432a-8a25-0ed1a918edbf@linaro.org>
Date: Tue, 24 Dec 2024 11:01:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: imx: fix OF node leak in
 imx_media_add_of_subdevs()
Content-Language: ru-RU
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, slongerbeam@gmail.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, gregkh@linuxfoundation.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: linux-media@vger.kernel.org
References: <20241224035411.2220404-1-joe@pf.is.s.u-tokyo.ac.jp>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241224035411.2220404-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/24 05:54, Joe Hattori wrote:
> imx_media_add_of_subdevs() calls of_parse_phandle() and passes the
> obtained node to imx_media_of_add_csi(). The passed node is used in
> v4l2_async_nf_add_fwnode(), which increments the refcount of the node.
> Therefore, while the current implementation only releases the node when
> imx_media_of_add_csi() fails, but should always release it. Call
> of_node_put() right after imx_media_of_add_csi().
> 
> Fixes: dee747f88167 ("media: imx: Don't register IPU subdevs/links if CSI port missing")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>   drivers/staging/media/imx/imx-media-of.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
> index 118bff988bc7..bb28daa4d713 100644
> --- a/drivers/staging/media/imx/imx-media-of.c
> +++ b/drivers/staging/media/imx/imx-media-of.c
> @@ -54,22 +54,18 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
>   			break;
>   
>   		ret = imx_media_of_add_csi(imxmd, csi_np);
> +		of_node_put(csi_np);
>   		if (ret) {
>   			/* unavailable or already added is not an error */
>   			if (ret == -ENODEV || ret == -EEXIST) {
> -				of_node_put(csi_np);
>   				continue;
>   			}
>   
>   			/* other error, can't continue */
> -			goto err_out;
> +			return ret;
>   		}
>   	}
>   
>   	return 0;
> -
> -err_out:
> -	of_node_put(csi_np);
> -	return ret;
>   }
>   EXPORT_SYMBOL_GPL(imx_media_add_of_subdevs);

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

