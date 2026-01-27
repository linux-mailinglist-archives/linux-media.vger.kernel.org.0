Return-Path: <linux-media+bounces-51622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hC48GQKXeGkWrQEAu9opvQ
	(envelope-from <linux-media+bounces-51622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:44:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D142F9304E
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A88103085866
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 10:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D5C343207;
	Tue, 27 Jan 2026 10:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXKeeRae"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E978341AC1;
	Tue, 27 Jan 2026 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510445; cv=none; b=gHnNGu2Peh5BhXW/CGfWTQgiVwq3Sqx8nmqU8npXzydTw4XOuaxVmxGNAvTb5DnEBhwlw0PCDTiqQ+TrKAvDfhucDYlbOMUEoOOQVCh+73PNKLFud8Nb0rOAA7N/bB5F1CQRXaG4LhoZOTIl9jsH6pYDzcKksgK9Tp2Iypqj8bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510445; c=relaxed/simple;
	bh=gGflqOaL8p4Id94b1PtqvgAFr04CYKkhnbDZF17fd+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1J58k6jDS+TiVsuYiWtZAcidfuqv9wMSaHuceOjWocX/McjCh5bWpfUgJ7jMFNjLGE4Z54fG7ALaX9JIfaW8KS4qDUzIYYyw/G04K+utL2he7MYNFn/vyVrqpD/bu1vj5HjOS4CgYFCq3/dxwH9yPEMvc0kJh0TssnQkxyWSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXKeeRae; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705A8C116C6;
	Tue, 27 Jan 2026 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769510445;
	bh=gGflqOaL8p4Id94b1PtqvgAFr04CYKkhnbDZF17fd+A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OXKeeRaeHKk7lGpAJHJZgCFWNi5huKZVVLkpAmMXMsHymQp055RN3eEZG9eZZaMPv
	 zgeIYxQOzC5qQ3s73ievelXldlqTLxSdZyV4bGhOwNfOwrG5sGCsckWZngh9Koo5PM
	 TrOlTz7qERAqs0GlA5XbfTCJSyyRFg8VzpMYW7FQb6bFOR6kBWUG+8fxZeNwxBp/Dm
	 y1nl2Sngj6mCLvSZwFGiNKIbfa1scUwJ8s84FXiD69ik66PVvQZ98v3AZTW0JzQzDV
	 FB3CoIkRuQN0lN/k8Kl14+mSKd11rKUc2QWvAyHjiJKpCeFyisXUhD9Pg5hsKNVC+y
	 uh6i+7kL9rW2w==
Message-ID: <a1108367-30dd-49fb-8a36-bab9a242bd51@kernel.org>
Date: Tue, 27 Jan 2026 11:40:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: i2c: ov02c10: Correct power-on sequence and
 timing
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bryan.odonoghue@linaro.org, bod@kernel.org, vladimir.zapolskiy@linaro.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
 <20260126173444.10228-3-bjsaikiran@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260126173444.10228-3-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51622-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D142F9304E
X-Rspamd-Action: no action

Hi,

On 26-Jan-26 18:34, Saikiran wrote:
> 1. Assert XSHUTDOWN (reset) for 10ms (T1 >= 5ms) before enabling power.
> 2. Enable regulators and wait 20ms for ramp-up stabilization.
> 3. Enable clock and wait 10ms for stabilization.
> 4. De-assert XSHUTDOWN.
> 5. Wait 20ms (T2 >= 20ms) for sensor boot before I2C access.
> 6. Perform software reset (0x0103) to ensure clean state.
> 
> This eliminates potential race conditions and stability issues during cold boot initialization.
> 
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/media/i2c/ov02c10.c | 57 ++++++++++++++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index fa7cc48b769a..ba8bbb4f433a 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -22,6 +22,8 @@
>  #define OV02C10_CHIP_ID			0x5602
>  
>  #define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
> +#define OV02C10_REG_SOFTWARE_RESET	CCI_REG8(0x0103)
> +#define OV02C10_SOFTWARE_RESET_TRIGGER	0x01
>  
>  #define OV02C10_REG_HTS			CCI_REG16(0x380c)
>  
> @@ -616,6 +618,13 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
>  	if (ret)
>  		goto out;
>  
> +	/*
> +	 * Delay before streaming:
> +	 * Give the sensor time to process all the register writes and internal
> +	 * calibration before we assert the STREAM_ON bit.
> +	 */
> +	usleep_range(2000, 2500);
> +

Why? I've never seen any sensor driver do this and AFAICT this
is also not mentioned as a requirement in the datasheet.

>  	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
>  out:
>  	if (ret)
> @@ -660,13 +669,13 @@ static int ov02c10_power_off(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>  
> -	gpiod_set_value_cansleep(ov02c10->reset, 1);
> +	if (ov02c10->reset)
> +		gpiod_set_value_cansleep(ov02c10->reset, 1);

No need to add this if (), gpiod_set_value() will happily
take a NULL gpio_desc * and ignore it.

> +	clk_disable_unprepare(ov02c10->img_clk);
>  	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
>  			       ov02c10->supplies);
>  
> -	clk_disable_unprepare(ov02c10->img_clk);
> -

Why? All datasheets say that the clock may be enabled either
before or after the regulators there is no need for this change.


>  	return 0;
>  }
>  
> @@ -676,27 +685,53 @@ static int ov02c10_power_on(struct device *dev)
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>  	int ret;
>  
> -	ret = clk_prepare_enable(ov02c10->img_clk);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to enable imaging clock: %d", ret);
> -		return ret;
> +	if (ov02c10->reset) {
> +		gpiod_set_value_cansleep(ov02c10->reset, 1);
> +		usleep_range(10000, 11000);
>  	}

Ack for asserting the reset for 10 ms here, that is the only part
of this patch which seems to actually be useful.

>  
>  	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
>  				    ov02c10->supplies);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to enable regulators: %d", ret);
> -		clk_disable_unprepare(ov02c10->img_clk);
>  		return ret;
>  	}
>  
> +	/* Allow PMIC to ramp and stabilize */
> +	usleep_range(20000, 22000);


If the regulators need a delay before stabilizing that should
be done by the regulator driver, not here.

> +
> +	ret = clk_prepare_enable(ov02c10->img_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
> +		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> +				       ov02c10->supplies);
> +		return ret;
> +	}

Again no need to change the clk vs regulator enable order.

> +
> +	/* Let the clock stabilise */
> +	usleep_range(10000, 11000);

Same as with regulators if this is necessary it should be
handled by the clk driver.

> +
> +	/* Release hardware reset */
>  	if (ov02c10->reset) {
> -		/* Assert reset for at least 2ms on back to back off-on */
> -		usleep_range(2000, 2200);

Ack for dropping this usleep() since this is now done before
enabling the regulators.

>  		gpiod_set_value_cansleep(ov02c10->reset, 0);
> -		usleep_range(5000, 5100);
> +		/*
> +		 * Wait for sensor microcontroller to stabilize after reset release.
> +		 * 20ms prevents black frames during rapid power cycling.
> +		 */
> +		usleep_range(20000, 22000);
> +	}

Why? this is not what the datasheet says.

> +
> +	/* Perform software reset to ensure clean state */
> +	ret = cci_write(ov02c10->regmap, OV02C10_REG_SOFTWARE_RESET,
> +			OV02C10_SOFTWARE_RESET_TRIGGER, NULL);
> +	if (ret) {
> +		dev_err(dev, "failed to send software reset: %d", ret);
> +		return ret;
>  	}
>  
> +	/* Wait for software reset to complete */
> +	usleep_range(5000, 5500);
> +

Please drop this whole sw-reset thing. We've just hw-reset the sensor
so there is no need. Also this should be done in a separate commit
if it were to be done at all.

Regards,

Hans



