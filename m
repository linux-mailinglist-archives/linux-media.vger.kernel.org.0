Return-Path: <linux-media+bounces-55412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPadJAx9sWmACAAAu9opvQ
	(envelope-from <linux-media+bounces-55412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 15:32:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EA62656C1
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 15:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A24830185CB
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48223C343B;
	Wed, 11 Mar 2026 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdQt1krN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473EA1EE7C6;
	Wed, 11 Mar 2026 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239519; cv=none; b=JwoK+9/9/9s3XCA9UbjK1oVd/SbPlq2v8PnsBzz0S/IAP1f5xroNH6TobXhpOgkHNTvUE+OcmF/6q6ZnLVBGTTV2FTy7QXOnh6sAP75q/hGMwUo/EfKS6uejVWxMKD8Y/vWs7PCs3HN6hoOc2koMFFMHwTQkc8yopIUDChB1nsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239519; c=relaxed/simple;
	bh=+yDeGyAn4bdaYY63kwMKzncIhw5lh41uUd1DQ9dYGLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBdeSdw//CapV1Dktwb6XmM7EstT/yCrLhfJIbOhoHDxpqdF+UQF7gKJrO+ZsWk9SoH3MvgPv+/mGC7UHibT5qVeI9RRIPN/Km+thvfRAFQHiYOJP+XUvGBQWuaw/h0C4upo/yV4YeP1iRaHLEamDWj1vy3KNOe36KhfeSH0nh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdQt1krN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B6AC19421;
	Wed, 11 Mar 2026 14:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773239518;
	bh=+yDeGyAn4bdaYY63kwMKzncIhw5lh41uUd1DQ9dYGLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QdQt1krNaWvCL2QfbpyazxbJSLHxPSREMXl7jsGIOFyV2E3OFl4MKlTRjfWFuvyki
	 079CQhIN1ss5x0r0vohm8QaoD9Qg0Lv7zkmmpGIBoSE5tSV0LKYMSxDO7P+PCY2HEO
	 7MYPZqJOGxdChpvhAFb/y9aHlVqOvol6rlbJjHI1BTTGmu+mD+u1rVI6BvkgUGheFL
	 PiMxFbjUnHlU27kBvXql3eboYotlmWzsAFc6UFcY+8oaFMlmQievR3/E5rH+I48TbH
	 l0IVS87AQJqkZ8Z/UbytLjZarble2zkHDHA/7USD8yvmdqg3FsvQRbtviaBtqsT8qN
	 HoR6RLleIQRsA==
Message-ID: <54015794-95d2-49c2-b0ef-8c0c79b16cf8@kernel.org>
Date: Wed, 11 Mar 2026 15:31:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: i2c: ov5675: Wait for endpoint
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, dan.scally@ideasonboard.com,
 ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org,
 hao.yao@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com,
 kees@kernel.org, ribalda@chromium.org
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
 <20260311131910.835513-2-antti.laakso@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260311131910.835513-2-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55412-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 91EA62656C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 11-Mar-26 14:19, Antti Laakso wrote:
> Defer probe if endpoint is not yet available. And do it before acquiring
> clock, gpio and regulators.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/i2c/ov5675.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index ea26df328189..508149485248 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1181,17 +1181,26 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>  	if (!fwnode)
>  		return -ENXIO;
>  
> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
>  	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
> -	if (IS_ERR(ov5675->xvclk))
> -		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
> -				     "failed to get xvclk: %pe\n",
> -				     ov5675->xvclk);
> +	if (IS_ERR(ov5675->xvclk)) {
> +		ret = dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
> +				    "failed to get xvclk\n");
> +		goto check_hwcfg_error;
> +	}
>  
>  	xvclk_rate = clk_get_rate(ov5675->xvclk);
>  	if (xvclk_rate != OV5675_XVCLK_19_2) {
>  		dev_err(dev, "external clock rate %u is unsupported",
>  			xvclk_rate);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto check_hwcfg_error;
>  	}
>  
>  	ov5675->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> @@ -1199,7 +1208,7 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>  	if (IS_ERR(ov5675->reset_gpio)) {
>  		ret = PTR_ERR(ov5675->reset_gpio);
>  		dev_err(dev, "failed to get reset-gpios: %d\n", ret);
> -		return ret;
> +		goto check_hwcfg_error;
>  	}
>  
>  	for (i = 0; i < OV5675_NUM_SUPPLIES; i++)
> @@ -1208,16 +1217,7 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>  	ret = devm_regulator_bulk_get(dev, OV5675_NUM_SUPPLIES,
>  				      ov5675->supplies);
>  	if (ret)
> -		return ret;
> -
> -	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> -	if (!ep)
> -		return -ENXIO;
> -
> -	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> -	fwnode_handle_put(ep);
> -	if (ret)
> -		return ret;
> +		goto check_hwcfg_error;
>  
>  	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV5675_DATA_LANES) {
>  		dev_err(dev, "number of CSI2 data lanes %d is not supported",


