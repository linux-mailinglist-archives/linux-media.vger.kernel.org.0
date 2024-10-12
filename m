Return-Path: <linux-media+bounces-19496-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6C99B59B
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 16:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 077FB283B70
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 14:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685BD197A8B;
	Sat, 12 Oct 2024 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="0T1zPl0Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5860E1E526
	for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 14:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728744055; cv=none; b=tKFBXdFtFRsGrK+h4MBCOQ6eR0D6plM9MVn/ZuLZGrH+lRp8MDvPyunFBseTs//uFqvmyI6KPZtdU437rAArcU6aipYZrNuIwSDTSezBVYrcBjIzvqss2wVqyC0KQ1vXYel85nheNe1FSiTOGYVw3JOEp9JyWXUdPYCks6ttwiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728744055; c=relaxed/simple;
	bh=sRLZ9CLpowLsGcWu/gYPl0EC8fbwZ2Qq5z1488P+nUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hrf8PSOLsxcO/uy1pi5dMZWSL4rpzeAIavGgrUoWs2uYEH8F3c1kR3iCkz7hp7SwR78pP9taH+z31KnMPm4VL4eqq/Z0TC+fhjuVh6t845hHbociu0jvuAhLl1zCi9eCnjN/b4TNBwIcdYvP6wBjHPCK5J9AVHWqy+hPELuUQAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=0T1zPl0Q; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9952ea05c5so448640766b.2
        for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1728744051; x=1729348851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6XN65SUyVYJarZTA2v6ST6nDCX277X4NXgiJQlfeeqM=;
        b=0T1zPl0QXEIg5Li13IFtYx6haZ2QBEu7TZAj3+Kv6weFxcagPIgvSD9u8zo7lKQjXG
         tk9tFbBOZe5ch/QOb/vCVxB4onMm+xFyh4n7gvcnLkL614yw6UElAcwA35NHxs2wDfqS
         z0j7b8QV8DzrYLlYBKbvE4HXTWM0IwUYGO46oqa/TDEfzZiI9La0RlJL2dxpn/Y7XYU9
         b5huIJjD6wTxYT4J0XrMT4o0L+46Svkv6w9Q4fhjbQjpIyNDqLQZ6WgKCV53p8vjhakc
         MiC7YQlh80eNOssKg6bWs5AGqDAhkhSneJOYpBU61j1qtxdqnrgYfDkd2j0dg9d3fQxS
         vLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728744051; x=1729348851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XN65SUyVYJarZTA2v6ST6nDCX277X4NXgiJQlfeeqM=;
        b=jF2iaPm6xAxQ4EbHDa3QBywY6GnIbqBNYl20z6yUuaw5lT2QuTjvWI3o3BwHu3xV9b
         k2u0Rer4XBZV4SyeCBGdZolmnv5bTRLU+65IenOzEgVfw5LTtDOTSwuEvMoLlhjh7Z9u
         2V+T9zi79yoOnChQdXIL5ElhDNd2/+VZqZ9aDnJNq2ewgltdtCuKRz8oeWta6H7Bmv1L
         Zq4BalPTreSkekPSjwSK6gL7SvNE0DvWyEvT4HGXr+m5HcpgQdjUaqASsNrdM+6R1jOU
         jrssJkN+9XvLbPfFjxYpgUWh4SMDHHq0loA4Qs3K4HRu6NncAp2G0B3Sdb3pComlePvA
         JTWA==
X-Forwarded-Encrypted: i=1; AJvYcCVSGdobE1Y73wTFBWir7VWplMKfTeQV3/9FjtI2AbFAH1V8qOqCXi/fO8MXNtRUoD1Hv8auu4/QczUJ6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu7i1gYxCLqV1YY4uuuIzmo34OQz9bIV8tLu7DPTUv3HgWDWVH
	P1bML3zydqJzbfJoxSN+6Su01SuaF8OcuJ6C4cYb4mvnswuSvLt8h4v9FA51jPc=
X-Google-Smtp-Source: AGHT+IGgR90NqXsCm1d02CggGS8G6PBK4FoveREGXZ6fO+s016flFkbQkEBREEyPRZqcr5SWlQ1Z5Q==
X-Received: by 2002:a17:907:f19f:b0:a8c:78a5:8fb7 with SMTP id a640c23a62f3a-a99b9630cb2mr565251066b.45.1728744050930;
        Sat, 12 Oct 2024 07:40:50 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5d0b6sm328057466b.97.2024.10.12.07.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 07:40:50 -0700 (PDT)
Message-ID: <c95ad051-78c7-43cc-ade1-298b1200cfd9@nexus-software.ie>
Date: Sat, 12 Oct 2024 15:40:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov08x40: Add missing '\n' to
 ov08x40_check_hwcfg() error messages
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241012115236.53998-1-hdegoede@redhat.com>
 <20241012115236.53998-2-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20241012115236.53998-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2024 12:52, Hans de Goede wrote:
> Add '\n' to the dev_err() error messages printed on ov08x40_check_hwcfg()
> errors.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov08x40.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index c0dc918edc3c..610fb3ef46c4 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -2087,14 +2087,14 @@ static int ov08x40_check_hwcfg(struct device *dev)
>   	}
>   
>   	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV08X40_DATA_LANES) {
> -		dev_err(dev, "number of CSI2 data lanes %d is not supported",
> +		dev_err(dev, "number of CSI2 data lanes %d is not supported\n",
>   			bus_cfg.bus.mipi_csi2.num_data_lanes);
>   		ret = -EINVAL;
>   		goto out_err;
>   	}
>   
>   	if (!bus_cfg.nr_of_link_frequencies) {
> -		dev_err(dev, "no link frequencies defined");
> +		dev_err(dev, "no link frequencies defined\n");
>   		ret = -EINVAL;
>   		goto out_err;
>   	}
> @@ -2107,7 +2107,7 @@ static int ov08x40_check_hwcfg(struct device *dev)
>   		}
>   
>   		if (j == bus_cfg.nr_of_link_frequencies) {
> -			dev_err(dev, "no link frequency %lld supported",
> +			dev_err(dev, "no link frequency %lld supported\n",
>   				link_freq_menu_items[i]);
>   			ret = -EINVAL;
>   			goto out_err;
> @@ -2129,7 +2129,7 @@ static int ov08x40_probe(struct i2c_client *client)
>   	/* Check HW config */
>   	ret = ov08x40_check_hwcfg(&client->dev);
>   	if (ret) {
> -		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
> +		dev_err(&client->dev, "failed to check hwcfg: %d\n", ret);
>   		return ret;
>   	}
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

