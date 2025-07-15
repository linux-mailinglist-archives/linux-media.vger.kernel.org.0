Return-Path: <linux-media+bounces-37739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B7BB052B6
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 443DD7B5239
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C89A27511B;
	Tue, 15 Jul 2025 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LLrX8kvu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A63026FA69
	for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 07:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563895; cv=none; b=g+6eACGHNs5rq7oOvODwkdsmrEVpIIG6GOw9nengZsJxZOWrMPXuzQfymtsYdJDQ7eM4o63IAAFHvA9o9f+TGSeqjjD5NxjuAZ8R6XxdlwnDin129sBD/q9gWZ0oL+Tzvrscz6TLp+UBtDSAFVDN3Cy0CAfkNNe/bBcqYvTDcdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563895; c=relaxed/simple;
	bh=pq4qPjXVpgUjBJmnQzQjpgG5xzJVvJ48cZBGLci/lyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHS/T6ngtODo+FuKWmSZXJHtSIo9Wa0MFQAQgDcnH5Hnj1TAN9W/AMspT93Kp0Tj3IaqbjyWaz+pQSRLHo4S+9LtiGEYQLQ9BjatcHXGm0qO0HrS+lb05pnzyA1+ncGsPNAQ6XyvePk34Gxj0dwCqnZqqrOR4s+KhWa0UNvsclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LLrX8kvu; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607fbf8acb6so579675a12.3
        for <linux-media@vger.kernel.org>; Tue, 15 Jul 2025 00:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752563891; x=1753168691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G5dG62nJKHy3JNLJeLbZlQQxrEBXl/7039zhJtdDQQA=;
        b=LLrX8kvu8gONSRaq+oZST09DB8+yEBdsTl5TMalFEjujx8a3ofQ+/sakmE8GtY1LDt
         FTZOCCg5QJHbxM+KIX8nPJTSq+g1aF6eJ9XdJ+6tDhiLEN6Df8t3f9VzBl8kTu+Zi3AH
         KslamLnmikvERaRwDtAXs54oaHVSPpVoEJ506RItQzBsoG34LgEG9/MetfFtoRfU+4fa
         TSSh5Jj4JkoWLG/U03XP8bk0GBUp8p45y0FwZQ2zwbVVlGoXhVDhB2QtXlwBYjbJzwE7
         fUBqrlgEdOAJhMP1ucv6Wan62mEatjYWVXeHerA12vgYrQ3DTJeU4OWSXMSSuERw5jv7
         vJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563891; x=1753168691;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5dG62nJKHy3JNLJeLbZlQQxrEBXl/7039zhJtdDQQA=;
        b=t+F7uuMcgG4GK+XFCDVqjBatwZT8ZQ8XkZIRFYpJKA3+eKlYfOPfnWUYdWkTfx/LL7
         3RRvgvhnr1nCqvGAxFN0756rf9XOGOWKjlmM16U2jQET1ED2lWJwZnyG9/Whb4W+6zWo
         XB2H1pcZIfRs7yA5tlLqbGe4cw7vJQAH76IArdfviMfOx5Oyh2RqQT6vViW5phdCs4XA
         8amHp0CbDksfL68mTerr9N01Ce33OZO8tRaY+hobXCr5mGUSemYUPw8/CXx261ul1qyB
         lvWUwwBE6irXJQAuh5gSBo8Zg7gkm/dH+5dz5u3IHD2xeeVgWsVtXS9m4cJqzb+HGkRE
         tqVg==
X-Forwarded-Encrypted: i=1; AJvYcCUsf83bivr6teew2BwDyhD0o8Qf9VHhdMnYz34Hl+gtDAi5NelxN6H2hNi9NN5Y4+DGwi/Jm7cZKMV3VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5OTCdDJf/c8c4u333Sh7sFvr4+bnVi2FcFP6D2HaWTxNt9cYJ
	QVHVjlWpUGdgXcaO4ZyUh2BGNPjo2geVlTGp1/3wUbqK4xhAhJek3H1z9xU3UC8VNWULNY2/Edi
	k+W1T
X-Gm-Gg: ASbGncsa9zC65TN9TNGZfd6sxQZGAH/LAMCyE7qIESXsi5QCTBaUvMqYUI61lMXsCfd
	KiCw0mN5Bh0y8mvylGVVBK6yPCWhRtE63Cbf9TctlCztFlqgguHzKKeDwJBXLcMb558GoNWqjDz
	vp5nItTSuJJeQPK8N5mtTQouqAhbdRy4v8DJ0qR6sayECed0UM1SiGkdfomrf/CpAGDQnflvtVC
	R+Cy/v/NROwc/XYVvgXJ4V7bs/vMgMCAhDw2EGgOWvm0rXyA7skVgbsSCXnzwt3ajsAcRonNT/N
	pEQQxVqe8PkthYtdDS/kNuz0g5iiUQMUDGkQfMwxgXKob8xSgvu7s3AhX6mQTQ0vWV1AXXNOOuu
	aEGtMDOnphksJekGrKXg8tSklXeKYife+EmvNZ65mWQ==
X-Google-Smtp-Source: AGHT+IH/qZkwrC7OZM3xmSqAHpfki0t5TNJyqjR/yOvI0eMFnZOYnC+1qxnw0thUbaKHow8h5NGdIQ==
X-Received: by 2002:a17:906:6a01:b0:ade:902e:7b4b with SMTP id a640c23a62f3a-ae9be9dd4a5mr20443366b.7.1752563890699;
        Tue, 15 Jul 2025 00:18:10 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee4478sm969007966b.56.2025.07.15.00.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 00:18:10 -0700 (PDT)
Message-ID: <f1283a01-db49-417d-b4f5-2488aad2d237@linaro.org>
Date: Tue, 15 Jul 2025 09:18:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
To: bryan.odonoghue@linaro.org, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/07/2025 17:16, Krzysztof Kozlowski wrote:
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 40831ae42296..f56e40d9b3c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20678,10 +20678,10 @@ F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
>  F:	drivers/regulator/vqmmc-ipq4019-regulator.c
>  
>  QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
> +M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  M:	Vikash Garodia <quic_vgarodia@quicinc.com>
>  M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
>  R:	Abhinav Kumar <abhinav.kumar@linux.dev>
> -R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>


I think it would be good to add here also T:. Bryan, do you use your
kernel.org repo or the freedesktop repo from last pull request?

Best regards,
Krzysztof

