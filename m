Return-Path: <linux-media+bounces-41999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1B6B48DD0
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 14:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A4983A1E6E
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 12:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557202FF64E;
	Mon,  8 Sep 2025 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKeGQabn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AF02F83BE
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757335189; cv=none; b=YYRl8SPBQJO849TLG0f4B5mAjzPAJsP1IyuHjlI+U8qMOJWIe/NdnTMeUFH/6ZUS35MD4m8i9qzHKxfu9nBx/aIR5H4xS3Q1XjEEXauXJt0MsXmxt9wv/MGkLBiht2UY/HB3p+3K3rxKgyRzs32ecltwegixponTA93QXCWPrdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757335189; c=relaxed/simple;
	bh=zkCovvdvkGJf66RNvpZWl8A4T7ecGjNF4suroGD86PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpItAExJJnDb/65sFvbcp6+TP/TDb5I21StkDYuj3BC3RiIt5Mo5SJShHUb5NbktEXKfrET11tRDaCx+hZYz9Os/ms4AdwSMghDQMkkdFSGbzSJHPHRKmLKd7N389J/N4BhWzryZzd8bpfqGqPvkK8EGRDoTTgHjvBlIuhcoZJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DKeGQabn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dde353b47so7562465e9.3
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757335186; x=1757939986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOQbjYa7uTeN/Rir/miu4y3FOUbT0e3+50z0qSPwvr8=;
        b=DKeGQabnLpjFLsf3NgRsbfXutC+fyekBLLD5dst7zLEn4zXOKkyiHbglQ7GcDPcICL
         FnhS+49BcY0yz+0U7JNPpfGEO4CTWAPtuMtQu7O8hgqU+A+xUXjE2TW3pk+IG1leXoBZ
         H2siObePW/LMMbBffb7/7AnfoUF1JAG5KgHv8+qfeA+c81PibbH8qIbmxefM6ueP3RPK
         tKPCQuQb44o0rwj5jpt0a2C/uDcyzIiNzER+vbSzC9asuizf1PD59yytCkir1ETCO15+
         ECbdyyHGz3GgSWFgyAu58zkyzVxME9tgNvMPxZCGc2vpYlwcxMisSm/2PknrpuLf+IUt
         tcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757335186; x=1757939986;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOQbjYa7uTeN/Rir/miu4y3FOUbT0e3+50z0qSPwvr8=;
        b=ost/Nd1v7vO1HMjWTMjjN9M9FbGy4kyR+0NjgMmiIhP46k6TNZfe0lanOOFD+ioVla
         p90Sw1kUwAslsrwxVrDwSP8uWBLTtgG/WAO0eU8X1wqNiGEHi02C6ITCnceJZYF0nril
         Nf/mqTckOnaERrBzWClINBFhBRJN743y0Jg3zs9Cyzpz6AWoIkfcCN8VGBmt8C1EUayK
         GKH6ZgDzm7VNZZhcriocjCwx8dX3xs6veSruimfGUhrXPNSoiI7J1g3zhdDHcodY+5+h
         vqnZ3MLt9u30rEk7/loWH/aFPl/jTIrcV9RXZnFBkI8vkadYOlYrzjgXAWGnYFKuIt5C
         UFhA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5pGmWVllWYXbOgcG+MtLnEfWm8i9RnWvgvqXis7r/F45NTeqxKnxeNo92rRpP9aXDYN3La1ZQSpoQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8LrUoSPoYMz1+ZFr4yY+TwqIwkLY9l48TSI8s0v7RBj6CX5KI
	FVSdTGGRGJovIqK5b7vM405O9Cau5++wrTI3OPfKeDCzNg4i9oUKVuZrdE2kOvgIJUs=
X-Gm-Gg: ASbGnctAv0LsaqSvsOjL6JG/f7Ev1/ctpZlNeiFT9x385DhWV6Lz0+/6Y5pm9gfEpOk
	pRutL8dvAb5uVtSSXAUGRO0tK6EYZ048L3XNyXvq7E1iYni1J6oxEVIYryow3UDuM06v7R0eUX4
	ZRYNP6vOsSr1pP/JaM6rqWe/E/vXMoiHs0aADOzb4dxpVUOgDR9nqHJ77KaLPE4eLFNkL4dMPhM
	zhq7tL8fVSmyGaGcz6EJBBL/I+d8VeaYmo0DWOQ8cvHX+BnHgzpPIAkb3yjMudJxeXAj3/8mYU/
	mHOQSaSdjvLkTKYwmbFvcb213RfnT6WzRGcZDGOFEruKO6SQl0EdOUOCtrqsCtuLH9fO/6Dd7ti
	cjkMsqGHvGT9++bz1oFrAe8g6dq+j1iaoiD3aB/wsu43uzfD7CAF2/emVpQhM5DtTK+Vykec04R
	xapget+vY0jokSR911XuA0AVnbbJk9GQ==
X-Google-Smtp-Source: AGHT+IGssgEgPQqCY5JjfftBjqLsflmfRf1S+VhLNRLQln8IEtOgWUXb4qCkr0a+b8vMCtFJRylKsQ==
X-Received: by 2002:a05:600c:4fc1:b0:45d:d5df:ab39 with SMTP id 5b1f17b1804b1-45ddded614bmr64755625e9.26.1757335186245;
        Mon, 08 Sep 2025 05:39:46 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm437835175e9.19.2025.09.08.05.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 05:39:45 -0700 (PDT)
Message-ID: <49d0d369-7e08-42f0-b587-88779dc6938c@linaro.org>
Date: Mon, 8 Sep 2025 13:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: qcom: camss: use a handy
 v4l2_async_nf_add_fwnode_remote() function
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
 <20250903002255.346026-6-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903002255.346026-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 01:22, Vladimir Zapolskiy wrote:
> Another code simplification makes parsing of remote endpoints easy.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index be1c62d27e2b..4909dbdef1ea 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3038,18 +3038,9 @@ static int camss_parse_ports(struct camss *camss)
>   
>   	fwnode_graph_for_each_endpoint(fwnode, ep) {
>   		struct camss_async_subdev *csd;
> -		struct fwnode_handle *remote;
>   
> -		remote = fwnode_graph_get_remote_port_parent(ep);
> -		if (!remote) {
> -			dev_err(dev, "Cannot get remote parent\n");
> -			ret = -EINVAL;
> -			goto err_cleanup;
> -		}
> -
> -		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
> -					       struct camss_async_subdev);
> -		fwnode_handle_put(remote);
> +		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
> +						      typeof(*csd));
>   		if (IS_ERR(csd)) {
>   			ret = PTR_ERR(csd);
>   			goto err_cleanup;

Similarly, I think this change will conflict with moving to a real phy 
driver.

---
bod

