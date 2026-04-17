Return-Path: <linux-media+bounces-59044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OTVD6Jx4mnR5wAAu9opvQ
	(envelope-from <linux-media+bounces-59044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 19:45:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68541DA98
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 19:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0380C301ABA7
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 17:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467F038F254;
	Fri, 17 Apr 2026 17:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vq9eSwDK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6813537F1;
	Fri, 17 Apr 2026 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776447663; cv=none; b=hmDJX82BD8Lhdxfv0iJc5m045K0kGoGTM4Rm72L2V7irzCLdcIUGV8JGINOIj/YBWgN05K12eKUv2JOE4Kbn2cyzcANPEgsNivfACUw0wlmESk98L+INISE69lRnmsJqUk2jZL6fxfyY0WFjJsj+HMsWNvBlkmf25blALRIbEvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776447663; c=relaxed/simple;
	bh=7ybCKw/ym/SQeb1GS9j1+XfxNIn/nv3S/3Wiks7Klcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjZKyCzCLprmoQddsVzCEUPzAGHkDC2pETN0QvHEdgY1QDcuPvAwlykio9N6ET3ZsHfcbGJOdaeFSAAP8h2X6FDGHuD6lVfMSzdKXLtmhhTAcA8/KNd1kcRoV1cI7Y8Xd+54A1oW5VzCVcqszOUFPUBN9bhnHDZAZWaB2/U95ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vq9eSwDK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D81C19425;
	Fri, 17 Apr 2026 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776447663;
	bh=7ybCKw/ym/SQeb1GS9j1+XfxNIn/nv3S/3Wiks7Klcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vq9eSwDKV7gCNew3Gysnyp4/gKuylthfjRWppFabtnlJHxVpSXMpeRsFAaSnBnSe2
	 SYdvDnQAeyqGluworPLl6aCCzU6SHRsHHLNmHVntqiHwyt+xJph7sMPelzp48F7Jkn
	 QIfhEWAzrwBxpCq0X2AccoVvZ6bu4qRzyn3t4T25dt5Op49pEyv03F5mndeQNyqf6h
	 E7/9N5Ycrc/b+hgEGrE7FhU+BYA5d/wOytgZ3GxZ7omfl5ly9CBFa4Ct8ok1ptsOdv
	 B6ZfViBSOydoAcj3e7Y9/yr6G4StnGHPvtG8DLw1kQgMa1dpE15Z6CYyHmQEgdZg71
	 kwC8myYWxhe4A==
Message-ID: <a799083e-6ac2-40f0-af49-44ffe875fe57@kernel.org>
Date: Fri, 17 Apr 2026 19:40:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] platform/x86: int3472: tps68470: fix clock
 consumer registration for Dell Latitude 5285
To: Thierry Chatard <tchatard@gmail.com>, linux-kernel@vger.kernel.org
Cc: lee@kernel.org, platform-driver-x86@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com, djrscally@gmail.com,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com,
 nicholas@rothemail.net
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
 <20260417163252.15603-3-tchatard@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260417163252.15603-3-tchatard@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59044-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,ideasonboard.com,rothemail.net];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB68541DA98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 17-Apr-26 18:32, Thierry Chatard wrote:
> The BIOS on the Dell Latitude 5285 leaves GNVS field C0TP at zero.
> With C0TP=0 the ACPI _DEP method on INT3479 (OV5670, front camera)
> resolves to PCI0 instead of the INT3472 (TPS68470 PMIC) device.
> 
> Because for_each_acpi_consumer_dev() walks the _DEP reverse-mapping,
> INT3479 is invisible to it: the clock consumer lookup entry for the
> front camera is never registered with the tps68470-clk driver, and
> the OV5670 sensor driver cannot acquire its MCLK.
> 
> Fix this without touching ACPI tables by adding optional static clock
> consumer fields to struct int3472_tps68470_board_data:
> 
>   unsigned int n_clk_consumers;
>   const struct tps68470_clk_consumer *clk_consumers;
> 
> When board data is present and n_clk_consumers is non-zero, probe uses
> the static list instead of for_each_acpi_consumer_dev() to populate
> tps68470-clk platform data.  Platforms that do not set these fields
> continue to use the existing ACPI traversal path unchanged.
> 
> The board_data lookup is moved before the clock-pdata allocation so
> that it is available for both the static and dynamic paths.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>

Thank you, this is much better then the AML parsing + GNVS patching.

Patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 29 ++++++++++++++++---
>  drivers/platform/x86/intel/int3472/tps68470.h | 10 +++++++
>  2 files changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
> index a496075c0..3364ef428 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -155,9 +155,31 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	if (!adev)
>  		return -ENODEV;
>  
> -	n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
> -	if (n_consumers < 0)
> -		return n_consumers;
> +	/*
> +	 * Look up board data before building clock platform data.  On platforms
> +	 * where a sensor's ACPI _DEP does not list the INT3472 device,
> +	 * for_each_acpi_consumer_dev() misses that sensor and its clock consumer
> +	 * entry is never registered.  Board data can supply a static consumer
> +	 * list to use instead, bypassing the broken _DEP traversal.
> +	 */
> +	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> +
> +	if (board_data && board_data->n_clk_consumers) {
> +		clk_pdata = devm_kzalloc(&client->dev,
> +					 struct_size(clk_pdata, consumers,
> +						     board_data->n_clk_consumers),
> +					 GFP_KERNEL);
> +		if (!clk_pdata)
> +			return -ENOMEM;
> +		clk_pdata->n_consumers = board_data->n_clk_consumers;
> +		for (i = 0; i < (int)board_data->n_clk_consumers; i++)
> +			clk_pdata->consumers[i] = board_data->clk_consumers[i];
> +		n_consumers = board_data->n_clk_consumers;
> +	} else {
> +		n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
> +		if (n_consumers < 0)
> +			return n_consumers;
> +	}
>  
>  	regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
>  	if (IS_ERR(regmap)) {
> @@ -176,7 +198,6 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
>  	device_type = skl_int3472_tps68470_calc_type(adev);
>  	switch (device_type) {
>  	case DESIGNED_FOR_WINDOWS:
> -		board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
>  		if (!board_data)
>  			return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
>  
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.h b/drivers/platform/x86/intel/int3472/tps68470.h
> index 35915e701..4aefb728e 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.h
> +++ b/drivers/platform/x86/intel/int3472/tps68470.h
> @@ -12,11 +12,21 @@
>  #define _INTEL_SKL_INT3472_TPS68470_H
>  
>  struct gpiod_lookup_table;
> +struct tps68470_clk_consumer;
>  struct tps68470_regulator_platform_data;
>  
>  struct int3472_tps68470_board_data {
>  	const char *dev_name;
>  	const struct tps68470_regulator_platform_data *tps68470_regulator_pdata;
> +	/*
> +	 * Static clock consumers.  When n_clk_consumers is non-zero these are
> +	 * used in place of for_each_acpi_consumer_dev() to build the tps68470-clk
> +	 * platform data.  Needed on platforms where a sensor's ACPI _DEP does not
> +	 * list the INT3472 device, causing that sensor to be missed by the ACPI
> +	 * dependency traversal.
> +	 */
> +	unsigned int n_clk_consumers;
> +	const struct tps68470_clk_consumer *clk_consumers;
>  	unsigned int n_gpiod_lookups;
>  	struct gpiod_lookup_table *tps68470_gpio_lookup_tables[];
>  };


