Return-Path: <linux-media+bounces-57904-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIARFxpxzWmadgYAu9opvQ
	(envelope-from <linux-media+bounces-57904-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:25:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9470937FD09
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2DBF30293D4
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 19:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8988233263A;
	Wed,  1 Apr 2026 19:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUyaXfaS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36D610785;
	Wed,  1 Apr 2026 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775071224; cv=none; b=N0ZbNG7Mz+Bn58Oz15ZQJ4o9fEvXgqv2vwZFTej1QWhp0bbdgWzCrZwTHdZXZ8BEeu6vyxa3iJlo/MsV1O385lwlDrZeB1h5Ce8k78n7iFZ+hu0+/rGSBFo7LMWn+4CrHtXkzvg2op85kZdg5kidpQgJREYxop8I6dHT0upac54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775071224; c=relaxed/simple;
	bh=OuenldaDpgWS3ji+/XQGWuMq2n/E7oit7oh2Jm14lOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNaubXq2jOVZu2fHYE1BG7x6n9Z9yijHDmT21rGj9wgTRYmtYL4HFq7cseryySJlcWVvuoZ5VpaJiH62o3G9a+Zlr41xGIccihd3T/Kt4mSyf4K+AF8IkaKxkKnTADuohPXzUHuvFp1h8KBeSlgo8fMdC4HHJ2Z0s5cshTkE3+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUyaXfaS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFADC4CEF7;
	Wed,  1 Apr 2026 19:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775071223;
	bh=OuenldaDpgWS3ji+/XQGWuMq2n/E7oit7oh2Jm14lOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CUyaXfaSE4ijY/mRJeZFn3KIiE45z0kXyHmD1a0775u5zpshCO0uFShCcbIdfW/3W
	 XUTxupGDSnydbUMd+hu3jn41xgpRVo+i3Wkl0emFi1pY5/nGiNhCb8Kz1Rzcw+Jq9n
	 1A4vgBB90LIM4AmbiYqQRXFkoL9+UoMeGq0VXXT4kJadimBzUDYB5iQdkQASVMaHsM
	 RL1ykoPL9L7EfgvXgxXnlDd1kjmlk6dT4sPPOLmyaoRRJ+bLQGimXSq/xKTeDh1+P0
	 If3226zbtn/AdDAf7HsRNkm4Xp7pUC7ZucEWCMm21wJ1Vl+akdk3YUApbUrwuPalTl
	 l4qocE27NNZTg==
Message-ID: <404149fe-761e-4c8c-90f0-12850c5b049c@kernel.org>
Date: Wed, 1 Apr 2026 21:20:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: i2c: gc0310: Use devm_v4l2_sensor_clk_get()
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401181657.654055-1-sanjayembedded@gmail.com>
 <20260401181657.654055-4-sanjayembedded@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260401181657.654055-4-sanjayembedded@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57904-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9470937FD09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 1-Apr-26 20:16, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Several camera sensor drivers access the "clock-frequency" property
> directly to retrieve the external clock rate or handle the external
> clock manually in the driver. While this is valid on a subset of ACPI
> platforms, implementing this logic directly in drivers is deprecated
> and can lead to inconsistent behaviour across drivers.
> 
> This driver supports ACPI platforms only. It currently retrieves the
> external clock rate from the "clock-frequency" property and fails
> probing if the rate does not match the expected value, which is the
> correct policy for ACPI platforms.
> 
> Switch to using the devm_v4l2_sensor_clk_get() helper to standardise
> clock handling. This preserves the existing behaviour on ACPI
> platforms that specify a clock-frequency property without providing
> a clock. On platforms that provide a clock, the helper will program
> the clock to the rate specified by clock-frequency, which is also
> consistent with the driver's expectations.
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/i2c/gc0310.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
> index e538479fee2e..e9e67bd73f51 100644
> --- a/drivers/media/i2c/gc0310.c
> +++ b/drivers/media/i2c/gc0310.c
> @@ -6,6 +6,7 @@
>   * Copyright (c) 2023-2025 Hans de Goede <hansg@kernel.org>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/gpio/consumer.h>
> @@ -84,6 +85,7 @@
>  #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
>  
>  struct gc0310_device {
> +	struct clk *clk;
>  	struct device *dev;
>  	struct i2c_client *client;
>  
> @@ -634,7 +636,6 @@ static int gc0310_check_hwcfg(struct device *dev)
>  	};
>  	struct fwnode_handle *ep_fwnode;
>  	unsigned long link_freq_bitmap;
> -	u32 mclk;
>  	int ret;
>  
>  	/*
> @@ -646,21 +647,6 @@ static int gc0310_check_hwcfg(struct device *dev)
>  		return dev_err_probe(dev, -EPROBE_DEFER,
>  				     "waiting for fwnode graph endpoint\n");
>  
> -	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> -				       &mclk);
> -	if (ret) {
> -		fwnode_handle_put(ep_fwnode);
> -		return dev_err_probe(dev, ret,
> -				     "reading clock-frequency property\n");
> -	}
> -
> -	if (mclk != GC0310_MCLK_FREQ) {
> -		fwnode_handle_put(ep_fwnode);
> -		return dev_err_probe(dev, -EINVAL,
> -				     "external clock %u is not supported\n",
> -				     mclk);
> -	}
> -
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep_fwnode, &bus_cfg);
>  	fwnode_handle_put(ep_fwnode);
>  	if (ret)
> @@ -684,6 +670,7 @@ static int gc0310_check_hwcfg(struct device *dev)
>  static int gc0310_probe(struct i2c_client *client)
>  {
>  	struct gc0310_device *sensor;
> +	unsigned long freq;
>  	int ret;
>  
>  	ret = gc0310_check_hwcfg(&client->dev);
> @@ -697,6 +684,16 @@ static int gc0310_probe(struct i2c_client *client)
>  	sensor->client = client;
>  	sensor->dev = &client->dev;
>  
> +	sensor->clk = devm_v4l2_sensor_clk_get(sensor->dev, NULL);
> +	if (IS_ERR(sensor->clk))
> +		return dev_err_probe(sensor->dev, PTR_ERR(sensor->clk),
> +				     "failed to get clock\n");
> +
> +	freq = clk_get_rate(sensor->clk);
> +	if (freq != GC0310_MCLK_FREQ)
> +		return dev_err_probe(sensor->dev, -EINVAL,
> +				     "external clock %lu is not supported\n", freq);
> +
>  	sensor->reset = devm_gpiod_get(sensor->dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(sensor->reset)) {
>  		return dev_err_probe(sensor->dev, PTR_ERR(sensor->reset),


