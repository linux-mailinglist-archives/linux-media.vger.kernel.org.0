Return-Path: <linux-media+bounces-24604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3FA08DC2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 11:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E60613A6107
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726C120ADD6;
	Fri, 10 Jan 2025 10:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JqAXHnic"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1077B1CDFD4
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736504588; cv=none; b=SK6qLzzf31vB9BKFejv8R3bsWCp6RfCffULtlRNuzVtwUtxgjdm/kMn4rihOJK1shq52BjMKYg26Wr/Nt4YKCl9f5bitln+qkzqVi9UcgCgB7oc9Aukxy8KIPy+VMb8VypBsLwwiSWkwIcvonDlnZvzritA/Q68yU7mxGLtDhxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736504588; c=relaxed/simple;
	bh=AaLSMFpXQN5ObzdrWI8hkh1o+6LliBRIKJil7KvSsFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kf6YKziUSwD5fSTNx6fr0xtmg6fGiZDvZLm5pxExVE+/FgZE0GlDPnL7As2PIxdkdmKpH1o+cMr0lQfiY+UHwFtYQrDGWgZE7FoxdKu2c5bPtkJgfgF8FOLn0odMU48DIYVWEk/mgCsOwnk/8cmo+kWUHaBh73GaoIiwWwN986E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JqAXHnic; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43635796b48so12159975e9.0
        for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 02:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736504585; x=1737109385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOQcs/BUpMG1GetoUSUruhzTj23IRUyYA474CRjCg6Y=;
        b=JqAXHnict9PBmbNxzhoUhpXqJBlVHWVjmGTYI1jagfGRAWfIuVR4+ZpckaNR/ExSFl
         MUlYD1kXKP3vtukpYjnRw0FD5A3ZPgBc66saMX/7hQaMH7sZ9cuQjHLIVFmoFLhFc/YP
         2QlVENZwGcLylLKOTVSIeLDmvDz2idgFSvy3vh2hONgR//E9OOebrJKcatHWPD7u70ha
         ImFkXM/r0JtlxaYewDM6FqwWWvxRfSIRrSDNjbkD8sZzAf5Op9KUAqt3BS4hB8Sivs/J
         9ehgSSUMHCpzaQPvpSbUPkwF9W+xnvpJDPIZ5lNiMviWbI6kfr7HdpGQc5rmm0CrarR+
         37eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736504585; x=1737109385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOQcs/BUpMG1GetoUSUruhzTj23IRUyYA474CRjCg6Y=;
        b=fKPC7NCS6gyNhA4mOnoy59ViOjBqAHB117DQ2doc5ky48KWw2b3roUs7+DwGbVzF8v
         5t5F6TjHfn80fHAb2LIDoD3Y/GyWCEKgXyVP2MS0QLinivF2J03X3IL3K5aBlq5NT+Bx
         9L7pjUNxNzZNi+lzvcGWCSDFTIqHRoFOWiOrujSA0rFR4tVIMINGUYTbfTVXWcc782kx
         HYZPrp9foHDjM0ogTloFkAUrOF2Uw8gyFJYHhpfmgD2mKmKG+8a/A0zuWNz7ntC9dPvm
         tT/JBbYCJCm84CCqBmjGE6gN4t5Uclg0gAyI3+uwROXZrH7/+X3AyP6hqiwojHSAuxgx
         ESQA==
X-Forwarded-Encrypted: i=1; AJvYcCWnLzGkLuWFQxn1EQ7Y/I6lE7OPuuN+emUkSC3IXh+aW4SrTJZ+A4kBc/k7G61LhHz66Vgx2O+68QnoLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzB2xxWJ66OKDi2+I0FGRLFoKylztEcgxx1TzLIqo7SoQk41x7
	T6OV5QW3rrS6T0WJ+WgLvfkg719UuMcsRefYPmuy5WIEV7ssqvEMDPrhNxg7GO0=
X-Gm-Gg: ASbGncu4p1XCEmUFTJwPHtoxdCnk0pdFiSu3azJ7/f/W8i6BS3mdHtVH72mi6mo+1Hp
	9XCR2DtZ9Y43LgJ2xq1iIfAbzSAaRu6HyiiZK3SBpIchbC2Vv4zZg4HtdjQI88+C+6Rpsi1UA9G
	MPbBuTSk/roMUqRHeupN3NHb+k+it3be20DOnJ522DOGGHlIPX+8isrDSo6eJtEny8ccm4yusVM
	uB7FudVUv0RgmtXFwWnH4EqzLr2MC8iJyxtz4k75P1VZqN7LGP7s10AZ+eUMjL6jgSMUA==
X-Google-Smtp-Source: AGHT+IEqPeEva8t8aIuGS7AHqE4lsUUrSSdJZnhnWe9VyyYcMqxHOP6YsMx5V27mV38w2qozIVgwog==
X-Received: by 2002:a05:600c:3b86:b0:434:f3d8:62db with SMTP id 5b1f17b1804b1-436e9d6963amr49896535e9.2.1736504585417;
        Fri, 10 Jan 2025 02:23:05 -0800 (PST)
Received: from [192.168.0.43] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03e5fsm47422925e9.18.2025.01.10.02.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 02:23:05 -0800 (PST)
Message-ID: <21b9612e-dba3-4483-a55c-94e5e30df510@linaro.org>
Date: Fri, 10 Jan 2025 10:23:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] media: ov08x40: Don't log ov08x40_check_hwcfg()
 errors twice
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <20241220144130.66765-11-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241220144130.66765-11-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2024 14:41, Hans de Goede wrote:
> All ov08x40_check_hwcfg() error-exit paths already log a detailed reason,
> logging a second generic "failed to check hwcfg" error is not useful, and
> in case of the fwnode check failing with -EPROBE_DEFER this is outright
> problematic flooding the log with:
> 
> [    4.557059] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
> [    4.559636] ov08x40 i2c-OVTI08F4:00: failed to check hwcfg: -517
> etc.
> 
> messages.
> 
> The one exception to all ov08x40_check_hwcfg() error-exit paths already
> logging an error is on v4l2_fwnode_endpoint_alloc_parse() errors.
> 
> Make ov08x40_check_hwcfg() log an error in that case too and drop
> the duplicate "failed to check hwcfg: %d\n" error logging.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov08x40.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index e7012ee84822..c2a399e3bb41 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -2164,7 +2164,7 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
>   	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>   	fwnode_handle_put(ep);
>   	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
>   
>   	ov08x->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>   						    GPIOD_OUT_LOW);
> @@ -2251,10 +2251,8 @@ static int ov08x40_probe(struct i2c_client *client)
>   
>   	/* Check HW config */
>   	ret = ov08x40_check_hwcfg(ov08x, &client->dev);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to check hwcfg: %d\n", ret);
> +	if (ret)
>   		return ret;
> -	}
>   
>   	/* Initialize subdev */
>   	v4l2_i2c_subdev_init(&ov08x->sd, client, &ov08x40_subdev_ops);

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

