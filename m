Return-Path: <linux-media+bounces-19500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9C999B5CC
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 17:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDFAA1C21FD8
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 15:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030D9199932;
	Sat, 12 Oct 2024 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p+UvzMAz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D715B0EE
	for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728745822; cv=none; b=VCR1ECB6a07vCYVUmPhX0W012YE4wtvNq8ftrkcfw3E8oi9s0eiZZ7TqpD68JUJvqPaFade7JUe6QABsCAg/XfIJLoyvwVx6YfO64JESKQAK8xqE1WI+EvEAOF8O5kf3tEHu2M5T+BF6V2XeVQ+uQ9L8IYAptRiQBRNG4gj6NS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728745822; c=relaxed/simple;
	bh=X8Rhvh4mKFBxpwU77V/+JqUzN9bEF8vcASYtStw76u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lt0624xOBd73ezpxxFeT7Tf+OvRRxmwyM3H9ZRpvsJldol1UZ3dxiFf7VrbNwUDTNhragWPdmOoumOATmu59rVrnjGC/2pdHhZZL9KUtRVDCtfE7R9oGW9sHrYgx74y6Tzra7F1SV33tpYRudws8tUbtXAFX5pLkI/eTEQG4OIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p+UvzMAz; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99eb8b607aso72102166b.2
        for <linux-media@vger.kernel.org>; Sat, 12 Oct 2024 08:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728745817; x=1729350617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ou6YTiCQF2ZOtSA69/XVUJtrSa5WUO0u/5tYLgIbHfs=;
        b=p+UvzMAzoTf9T8Bm4/cbBKaLkUzQ1o9gQiBBPudg4w3/enhW54yCSsgVCcjHNzhdGT
         UIbl3ZI+LKRhdVaZfBoAPoj0vV0fC5oefs1EhO+Ib9a8md+MGHn9pe2xjNP8J/G6BzYq
         V8waf/2TSCE7P+jHjqNz63cxyoKAYYctZ4WPCVuMX4NxzAVF5AugANMsQbCABTU1hrSf
         qnS9LeuyG6fiCuP7DH0UBhNN9Q66h44USH6D5ILeFWh030OXQGeI1MedgDBArkR6N2KG
         oAW31CBdgbtTiRKPyOJFUOLMYjWsVqOYAWF2292MZ9Ax/qucVrrFTgb6L11obloD/0t0
         1kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728745817; x=1729350617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou6YTiCQF2ZOtSA69/XVUJtrSa5WUO0u/5tYLgIbHfs=;
        b=UkynBVJOTmIjX0cDyz1MNBkjrt4V+rhWhZQaORSmrUD6pZnmi6npiTMwvUdooNPsFT
         I7+osJCEeW1sRQd/UusuBAIRNLbDh2C29FvsHMRJzCdw4TitoSTFwJ49sh/2wCeCOJG5
         yXeiSWpNfg9bZe7mB9NZiGPuGmsl5DV1lnS5HgrBJzaKT0bFmoIUx5rWNh7ZJRz4mww8
         +mw7q0dVmW7g28YFv5XVuVXACv+IOvHgajQFL2q+kKmhwGydFHxrWRhbUoomAQQVb3lt
         7S4sZT/EcLvbtSDOT6FxedHmKpXX1HKJLVHAHDSpobGHa2MqZ0mr/HvmkBYV3ZOZX36a
         uz4g==
X-Forwarded-Encrypted: i=1; AJvYcCUi6f/v2xkWN1Y+YrJuEqRwPNUfDFsLVm0zQ1HvKzpAxBEqNs8vQo3yNUPKGnhL4AK3VOc2JCBv1hfWvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaCWQ3HTnr2Ch2dBmd4VB/jPzug/UCnlUGxWD2jfLw2lyvc3JZ
	uoYMjljciNGfEuBsLxkhKnXsfPtj6meAT15rHu6hq5dwg2DjF5mB3SM1za0mYhI=
X-Google-Smtp-Source: AGHT+IH6FUUI1ZGyfqwWJs/5ZXlkctdkuUH5jFuBwINCBOCnooF6RLunK+kqVhjkeUNlF4QJr56JzA==
X-Received: by 2002:a17:906:f59b:b0:a99:f7df:b20a with SMTP id a640c23a62f3a-a99f7dfb8ecmr78174666b.62.1728745816834;
        Sat, 12 Oct 2024 08:10:16 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711ab3asm2968695a12.30.2024.10.12.08.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Oct 2024 08:10:16 -0700 (PDT)
Message-ID: <ac006721-6122-482d-9daf-2281f7e4f384@linaro.org>
Date: Sat, 12 Oct 2024 16:10:14 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: ov08x40: Move
 fwnode_property_read_u32("clock-frequency") call down
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241012115236.53998-1-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241012115236.53998-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2024 12:52, Hans de Goede wrote:
> If the bridge has not yet setup the fwnode-graph then
> the fwnode_property_read_u32("clock-frequency") call will fail.
> 
> Move the fwnode_property_read_u32("clock-frequency") call below
> the fwnode_graph_get_next_endpoint() call and return -EPROBE_DEFER
> if the latter fails.
> 
> While moving the fwnode_property_read_u32("clock-frequency") call also
> switch to dev_err_probe() for logging when it fails so that the error
> code gets logged.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov08x40.c | 35 ++++++++++++++++++-----------------
>   1 file changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index 7ead3c720e0e..c0dc918edc3c 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -2060,31 +2060,32 @@ static int ov08x40_check_hwcfg(struct device *dev)
>   	int ret;
>   	u32 ext_clk;
>   
> -	if (!fwnode)
> -		return -ENXIO;
> -
> -	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> -				       &ext_clk);
> -	if (ret) {
> -		dev_err(dev, "can't get clock frequency");
> -		return ret;
> -	}
> -
> -	if (ext_clk != OV08X40_EXT_CLK) {
> -		dev_err(dev, "external clock %d is not supported",
> -			ext_clk);
> -		return -EINVAL;
> -	}
> -
> +	/*
> +	 * Sometimes the fwnode graph is initialized by the bridge driver.
> +	 * Bridge drivers doing this also add sensor properties, wait for this.
> +	 */
>   	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>   	if (!ep)
> -		return -ENXIO;
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "waiting for fwnode graph endpoint\n");
>   
>   	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>   	fwnode_handle_put(ep);
>   	if (ret)
>   		return ret;
>   
> +	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &ext_clk);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "reading clock-frequency\n");
> +		goto out_err;
> +	}
> +
> +	if (ext_clk != OV08X40_EXT_CLK) {
> +		dev_err(dev, "external clock %u is not supported\n", ext_clk);
> +		ret = -EINVAL;
> +		goto out_err;
> +	}
> +
>   	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV08X40_DATA_LANES) {
>   		dev_err(dev, "number of CSI2 data lanes %d is not supported",
>   			bus_cfg.bus.mipi_csi2.num_data_lanes);

20241010-b4-master-24-11-25-ov08x40-v6-4-cf966e34e685@linaro.org

One of us will have to rebase for this change.

---
bod

