Return-Path: <linux-media+bounces-24603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A548AA08DC1
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 11:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2123A61A5
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB8F20ADCE;
	Fri, 10 Jan 2025 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Th+sYge6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6364C1CDFD4
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504540; cv=none; b=jIhFDQhaD6UwTXGIKG3Ee8HnucTPql3sRuyCjVW0wJet+aUPnjP/j9cTZY/X4nGIvEx07L70aVadsnaZYudfcAwpDLRgwX5DpUqpJAh5Cb/sVWAf3TUBbrowLeHNOnQag77KIBSIPuF8+X12A8iP+1ib/wzw5/2f1YsC5EL1t6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504540; c=relaxed/simple;
	bh=jkgZYCDnrrXPT5z7QzEnGtrWkLKfgzHa2OhgO/MvyuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHHg4anf56L29ha/UJxKhzjd5DrHvIExhhndACX16nJVU95JDRlduJ6uKSqfmEP03qrqJJkK0mTgOI8NPZa6fWrMBLst2DYvfCPtjwtAPB0wgjNN5JK3Ic43z/UFPZry051qRhYZJlvhZkb9PDzTxNbieBh/b7xyC2thqRUQgPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Th+sYge6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso3029985a12.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 02:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736504536; x=1737109336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ccxv5RdLevLwXqQRYPe9C1G4LzXnEKeAJXNv+icNns4=;
        b=Th+sYge6ozNybXkg6+5jfbaqWHO0Mi2/TUMbZdPylQmIJ0uvdf9qtTETzip+SIeth1
         6y98P8/MCX5JypNv9iiciaWM6qNDvIKuMXJ6M+quiE0ulWq/CmBuJdJXl+hj7fIzO7VY
         1biChC6uo2lqD6I+8S7y6emXNsnJHNknSIkvD6RB3T1eZMaBOwuALzWGBYDao3ugm0hE
         Gyhjrt3ozJpuTWpem6ab1wGzseiPCIIWhfTbpJWSwm0UaBqdJLPo31b2xDfm4lnHu1yc
         S/NecFKF99omn7hzuLSf6cAM9ybvha1kO9U+Aug/Xbg06XJtr7D/4g1ytwi+NHVjp2/W
         zKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504536; x=1737109336;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ccxv5RdLevLwXqQRYPe9C1G4LzXnEKeAJXNv+icNns4=;
        b=mwUwbODFSO0j0c96atYtCrw+pgjIFqC/+hO2lao70EpDE1enDXmPnoFQQ8KsLneV6z
         qlCAcYz+QcB1+AgDDOv3z+AdeP+idb9yydV2X1hQj+tenbR+WWr0nJbNw4VM2DlpyIxS
         y5zAwIgPFLb78lHCiq0F9MedMwb/q0uVc/bDZkQYHMUN3P5NYUZND64FZks6TRtbNpK+
         fpiuhw9dZKXDC9PwyqPKy4F7yZRghThrZL8SNx1ej0S6hmSkF8R8YIm1qGeqYG8mRUcz
         amGXiD0u9x/0gWP85RTk+Fl3lYXpBfTUBsi+kPsR1Jhw/3iYBiDF2ZTkcVPeUpc8sntA
         2xNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv1JhzJZVOb6xVoiQZlg9nF6LZRxOs3B0fcUkoLcl65tde09BnXvzQn8JJclmq6CfLNnT0jdV/28hsNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0jq4hpGz4ahm59q6hNzRGOen94R9yCEXa88JxX9IfvRXNUTBQ
	JOo14ydHx8BiQW+HsxOiDLedLrfzrCfo67yFNJLfqR7SdF1CWMOw0DMKS5aaBAM=
X-Gm-Gg: ASbGncuQreDhukI0HjZprWvJNXFzQGmSS+8QeqZQVRRVOBxUvBwqkqE3m3c+SMrAsnS
	9edF+kVdZB0uQklbv38J7hJDm0OQpQV588ZejGIQDYQa6bcUWepWNcnizt/VcdHmtYJvuG7/6kD
	ULrgHLMPMt5jvXLsIe/6RQlOIWpALxEXb9kfbcem2hmSx2ed8PoAmJJ1UDL3QoIfbNF9V44lqpl
	gW8xSjK0zU5WOrXPcTV6O13SfHWTBj84whzRqw3erBMCcD4SWirTWVUknhnpXs3RRWW2A==
X-Google-Smtp-Source: AGHT+IEg2+ZxRWgC0IJaz/JkTMrzXVZIMdJfVI/kM3evUUjmP8izRyFqaSUeOOxdmi4Sa+/dGe85kg==
X-Received: by 2002:a05:6402:354b:b0:5d0:f830:ef5b with SMTP id 4fb4d7f45d1cf-5d972e6e0famr8188758a12.29.1736504535687;
        Fri, 10 Jan 2025 02:22:15 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c2fffsm1558383a12.43.2025.01.10.02.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:22:15 -0800 (PST)
Message-ID: <4ecc4bd8-0140-459f-a440-281487071b37@linaro.org>
Date: Fri, 10 Jan 2025 10:22:13 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] media: ov08x40: Add missing '\n' to
 ov08x40_check_hwcfg() error messages
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <20241220144130.66765-10-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241220144130.66765-10-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2024 14:41, Hans de Goede wrote:
> A number of dev_err() error messages miss a terminating '\n', add
> the missing '\n' to these.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov08x40.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index 7d00740222c1..e7012ee84822 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -2194,27 +2194,27 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
>   		ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>   					       &xvclk_rate);
>   		if (ret) {
> -			dev_err(dev, "can't get clock frequency");
> +			dev_err(dev, "can't get clock frequency\n");
>   			goto out_err;
>   		}
>   	}
>   
>   	if (xvclk_rate != OV08X40_XVCLK) {
> -		dev_err(dev, "external clock %d is not supported",
> +		dev_err(dev, "external clock %d is not supported\n",
>   			xvclk_rate);
>   		ret = -EINVAL;
>   		goto out_err;
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
> @@ -2227,7 +2227,7 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
>   		}
>   
>   		if (j == bus_cfg.nr_of_link_frequencies) {
> -			dev_err(dev, "no link frequency %lld supported",
> +			dev_err(dev, "no link frequency %lld supported\n",
>   				link_freq_menu_items[i]);
>   			ret = -EINVAL;
>   			goto out_err;
> @@ -2252,7 +2252,7 @@ static int ov08x40_probe(struct i2c_client *client)
>   	/* Check HW config */
>   	ret = ov08x40_check_hwcfg(ov08x, &client->dev);
>   	if (ret) {
> -		dev_err(&client->dev, "failed to check hwcfg: %d", ret);
> +		dev_err(&client->dev, "failed to check hwcfg: %d\n", ret);
>   		return ret;
>   	}
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

