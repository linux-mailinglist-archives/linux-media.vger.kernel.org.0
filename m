Return-Path: <linux-media+bounces-43306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE483BA7989
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 01:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9898B3B12A6
	for <lists+linux-media@lfdr.de>; Sun, 28 Sep 2025 23:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE353275111;
	Sun, 28 Sep 2025 23:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YA3Mtz9l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF153594C
	for <linux-media@vger.kernel.org>; Sun, 28 Sep 2025 23:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759103803; cv=none; b=ZpIoPtVcwsxl9YaeLM6Gpkjd3e8Mv0mWTRgKmLFaE0w7Hd76HuuYzm7tc91Ks0rQGtYDsKrUChO9RPTsxGD1QV/s+oe+clhS29FabYmdHXpQZwy9Go4wOzEgDwQl7Ra8JGXabFuVcIgwxpt0kQfSn9e9o0JI441zsOZUM6nCb+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759103803; c=relaxed/simple;
	bh=PBXcdUFXV2smj1ifaK+LoGQlD79BEM5RKJP30S7aDQM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nlEUaNMsasv/wolsePWY/eseVxaXy0R80pnK6qBw7B5rpMr/Ca8oBufPMZRHCHu3D+yS4G893egtQqNk2ALQQoQRcNnAU1ncfCIwGMTXgSPcwpLEflacXx2PBuigjsLG0xM/DVg7SKDUmUKjVAfIUTmvPXkYn3puPiBRDTzBdqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YA3Mtz9l; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57a8b00108fso712437e87.3
        for <linux-media@vger.kernel.org>; Sun, 28 Sep 2025 16:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759103798; x=1759708598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbaERkJpuwwW2s0GTceO+zDUT/u2ovHBQ/LYQFgCFf8=;
        b=YA3Mtz9lp8WYOSmFrudhBWi8vzYu4Z1BF/jVUhu+kBx8y+v6YWH5ODtzpkIcPLJTNG
         CVYAOb/wH7AYEItgHcvVx94Kpz6JzBf0IEHFIrOcncuA/JvD9ay4MQW/b6vWkF1jeZub
         3GqFgfK3wJUe7vB2laoSuAqe9R2fFq15eSOr/qZbKgiIhKY8ymK0O3VmXzxkww0sPAj2
         trVqm8xINp72QCdwIWyTyrRFmMK/2EnrtDvN9K/FqtQH+ojqbniTNHNw8uya3mhoclbF
         HCtxZJNGdy/R9pMjTtYz7WsY1DyxMLRvldAZEV5oSzfJaTzsYsl7aOiF5grroj1jLNiM
         4onQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759103798; x=1759708598;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DbaERkJpuwwW2s0GTceO+zDUT/u2ovHBQ/LYQFgCFf8=;
        b=jXNKSjpYXPFilB2U02Z1IXmVm7hysRyfXtK/FhHNFhdbb0KlnoXTwr9Ly8ID7K4AKV
         4Nzo2bzq/8h36f7T79y28MSh+zbXoNMUJpgjkwzm/mxj9RaNeZPaShIYJdepGWUUI9fO
         V6IGdd2DEUqQS3cYZTDcRcwQqrppIqhPGd2M6EZnJngTwxgRzTe9jhvYA/pt6wvbKmB9
         EoPnpzVfC6pf5HGsn/B3J03MM3LB2QsMPTfVaydTH7kqserjgAnjom3whd5YpRlFrrMe
         UEC1nF11PnulzFZngxSNZgiMCmZyPRh2Z3sMTWvdFryOg4s+qxZaLt5QdL2BVOijlZfo
         5sgA==
X-Gm-Message-State: AOJu0Yy4rhsICBQo6+lzoz8KGVq0SDuZyLN1NshKkwqJg21QnG70nv8I
	SLpIT5f77oEuBDSSAe3g9hWbAMqs4tnN+MPVylUuqI8ngfKX74BHd94P5s3pQwzVGdqbd+eZH/A
	sfI8i
X-Gm-Gg: ASbGncsOHqds0aEYyL3HO5O1W1fpJKoXUGZ6BAwpWfbLJvndcjzZgvzskE3KR6s+wlP
	5c3+4glEHREVv+81m09LlWMBVUelixUj1D6b4oeWP3ElOneZN32shkaFt5YiChusOCEwt0vjRz5
	8t9x33fMd1WNd98qMd10S330wyRRwTM7W5DYkvDn3sj7rDJjAK/RQiCcvpx5F4bHr/37r443PHt
	9evPU+uI16IVvl9caGIg9NqxFxmLCNmz9Cc4BkZooTSkGzPPWFxWC0ko4RspekvgDdi+bdIZuMP
	oDme8JmEJJc73X+QbrbUAaSDzCH+iKSNSY09YlTZKmKsMziMNDyMqWwVosZLXDKzMTDDNsdJ6Ok
	YYDD1V6Rjpntg9Ze0OLXZiC3sUy3xPP5Kj29GFLhH1OhW+tUypCvUZzukHWQJ/14VV3eomay2Rj
	j6Tw==
X-Google-Smtp-Source: AGHT+IEniNh/lC6fMtQqG7+hId5XHSg1wAZFEUUvL+8ztnzI/asQEKfDgprBwMaVnstmR6eSJxzAxg==
X-Received: by 2002:a05:6512:230a:b0:578:f613:ed9b with SMTP id 2adb3069b0e04-582d267c1d8mr1996930e87.8.1759103798319;
        Sun, 28 Sep 2025 16:56:38 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a32217sm3610507e87.115.2025.09.28.16.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 16:56:36 -0700 (PDT)
Message-ID: <99f2de20-054f-4122-82d7-dbbb2ee32482@linaro.org>
Date: Mon, 29 Sep 2025 02:56:33 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: add Samsung S5KJN1 image sensor device
 driver
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20250928200956.1215285-1-vladimir.zapolskiy@linaro.org>
 <20250928200956.1215285-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250928200956.1215285-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/25 23:09, Vladimir Zapolskiy wrote:
> Samsung S5KJN1 is a 50MP image sensor, it produces Bayer GRBG (2x2)
> frames in RAW10 output format, the maximum supported output resolution
> is 8160x6144 at 10 frames per second rate.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

<snip>

> +
> +#if 0
> +	/* V07 */
> +	ret = cci_write(s5kjn1->regmap, CCI_REG16(0x001e), 0x0007, NULL);
> +	if (ret)
> +		goto error;
> +#endif
> +

That's an unpleasant leftover, I'll remove it in v2 since it's been
tested that this commented out setting has no noticeable effect.

-- 
Best wishes,
Vladimir

