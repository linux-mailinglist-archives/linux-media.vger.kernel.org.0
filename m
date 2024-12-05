Return-Path: <linux-media+bounces-22740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F339E5B1C
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 17:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BE8F1884E66
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 16:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C992F29;
	Thu,  5 Dec 2024 16:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w3lwyvht"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521C522146B
	for <linux-media@vger.kernel.org>; Thu,  5 Dec 2024 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733415319; cv=none; b=Z5W49De1r8FulwZsSFmA2tg8loSvP8JeYjax+p7wA8Ue/ilg+xr1Rnb9/d7v7w8bqrFpz4oa8bUt6loUWTbYf4LT8YWM8okMehNnIWqZkLVr2tUwJlOlFAg32+CO268oC3pD/h+okwJ0B41m2nrV5VBJdtMgLIBoE9mIX6Iy3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733415319; c=relaxed/simple;
	bh=+3gG4uJcVlIlPvsLI7IW3b/75AREOrmUQVixXgnblsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvF1CoKUKVUxgpoMdSRm4hpQyb0FaXlJjkbSTsgGc7J09lL93BQ5FgXfpVOXFyAQwWzckSy6hZYH0nRLJPmTikryG4R+11yFKIyQ95Qo3J1+/HqMaY0Et8ak39sDshmuF7bjXHp3sQDgZQ62+6p0y+2V2Y81z4qEQpU4QEqFch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w3lwyvht; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a099ba95so11653165e9.0
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2024 08:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733415317; x=1734020117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z+4sz3zUp9yAyBKceZM/QXuubslWEL7HdKcdLFSmW0E=;
        b=w3lwyvhtO1pjEyuF7+RCa07bfIDjKpD0CrUI38Hlab/rZnqp6e5LTBu6WY74hOwJ5+
         ep0fp7rarwiDxyod8Q/c1K73vijnVZ9EJSVPdfWD9xtxBObEOy8l16MFeddgsmwkLgz8
         BEtkm2I4hfsO3/7XSAs2Ki5C9EzkxfyACz1zsTrbk/GscfOhjItB5MQ2EnI70/LphnXL
         83xxN+3YbRVT0Vqdq0dtvHcI16vcdseBn07pm0xXXMh+iLj/5JivyRmIEeOQkdzIqlYT
         mwYDe5gojD18uTHE8E7pxoO+mDCh9Pu6ZwT8ArWkD5KW0iYdXZ0uMwl2ddDIosXtb7+G
         nSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415317; x=1734020117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+4sz3zUp9yAyBKceZM/QXuubslWEL7HdKcdLFSmW0E=;
        b=HFRp2uSi3xgMN9aJnFwet3bKxdBeVI8Rm49jCZa2l01EeqpuRXMJdRSMC27ITPi6jc
         nKax/rdHixM/mclB1R6mhyftGdv/M/+TP2CUJhbEQ0QlkTv/VSM5mjSZOLh6GEbUiBll
         UANqV2FeqfJrXhr7yIMrKVRQBZNIGOuHDkRPGASTsrnmBtmLnSlBHFhauBZDz4DBkPb9
         FbRCxqR0RCmhKOStZtvDmgZAriIc05715RYUHahxj6U/7rSu3J/VMxMoEBVEnBC8hEAK
         N3OwOuXiQmYBkPQOawQhRAeYicEVtnZrdaSkzc0Nl4p+VdUiXU1r3G/ziZMxzp/OhZnS
         id3A==
X-Forwarded-Encrypted: i=1; AJvYcCWKI9xdEsFyXpeSBZ6pRm5Reuxlm+rdU/Rnoq/rH6nhgEfOu79JCtuArgDA8dNGa2vw5FBi/9yWaItwFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4KlEH7pIjfl5BiyIXAOOnzxXtLGk0CbqXeC+EGcDbuH8iBJEy
	obHPC9pgcut2pCHrqMycO5Mr7JkdMoCM1nc/q79Lrjpo2m/5fnGq7WS1kEBdqik=
X-Gm-Gg: ASbGnct6FdLuyLk8ti72U9cKZuFShVtaJ86b1aiTnxrLdp49DAwInfgvxJ/2+sIZdv3
	wTMJQcC6WS2LYXlbm5sZ2vA7uq8QgomaIQ1Uxo6tSD6Z+ce57n4Xb7pRSV/uULC4GGd/QTDlKWX
	6edhxZsBgHYjc9LZyI+oRh7TbY3Zcbqg8gY7w8DHM4RiFTyRBHicJAWs9rh5bf93kXThi7yIbk7
	v7sc2br6elgpzkuyooiz7+DUnfXdcGvn4zPXH4ztAp9yXHuE4laMR+SQhjXJ9g=
X-Google-Smtp-Source: AGHT+IGn7Hvj07Cs0jWrqjLNAu3oDpw3AlP4WiWdrNwS4OjjHvXSuA/a+BBjhbpaScxT9yE28vtaZg==
X-Received: by 2002:a05:600c:3550:b0:42c:b1ee:4b04 with SMTP id 5b1f17b1804b1-434d0a0ece4mr77886305e9.28.1733415316729;
        Thu, 05 Dec 2024 08:15:16 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d26a3sm28879855e9.1.2024.12.05.08.15.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 08:15:16 -0800 (PST)
Message-ID: <85166c63-1e8f-4f80-abb7-5426383b4641@linaro.org>
Date: Thu, 5 Dec 2024 16:15:14 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] media: qcom: camss: csiphy-3ph: Add Gen2 v2.1.2
 two-phase MIPI CSI-2 DPHY support
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241205155538.250743-1-quic_depengs@quicinc.com>
 <20241205155538.250743-15-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241205155538.250743-15-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2024 15:55, Depeng Shao wrote:
> +	{0x0E90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},

Please uppercase your hex.

---
bod

