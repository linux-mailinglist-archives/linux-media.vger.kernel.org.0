Return-Path: <linux-media+bounces-51546-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPg5LhxDd2mMdQEAu9opvQ
	(envelope-from <linux-media+bounces-51546-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:34:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A687091
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 11:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E84AA300D26B
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 10:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54BA2D060B;
	Mon, 26 Jan 2026 10:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxWNJSzg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124E9330D26;
	Mon, 26 Jan 2026 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423551; cv=none; b=bRwAyVKex/Tfjk66ZHXxMaQ+OHaEB0S3DGsZeB/Z53qzDQvNDlY/smYP+mJwA4/eSQDUCvWa1lFE2h+c2fttaUftIial/FeQcG5xkCGdxMW4M4NiWZu1l5Gq9DWEoSiNbwQ+VuxfEPhNvdZPYp3f3cNST6Ht1CB6uPuqWkKDrXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423551; c=relaxed/simple;
	bh=CN74Bja5Ye/lkLAztwBVCiFcaEW/5o7kw6WYpDr5hw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RS7C/HcSOIRacK4E2Vfcb5qMFCovqF9PqXr16T1w7Jeg2T7SPIh2CWK5zUZ+TNBG3elXamRgR5pC+h9yaLIZXOLIsfylZNNtx1lo3MpxFsQVq+sOwsn4g0emun8nZiJlDdqwK20DvqE7xj/6HU8N2kBR7tU4sDiv1mO2eTkgKOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxWNJSzg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97364C116C6;
	Mon, 26 Jan 2026 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769423550;
	bh=CN74Bja5Ye/lkLAztwBVCiFcaEW/5o7kw6WYpDr5hw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hxWNJSzgZ7i/H98MmrBJdDwiWhlfTlNghUZWbW3rsMiEo8ICj2k7PGZE+kB6CLt6m
	 c/18aq4u27Lk9UK8787pPhI1NIzcyTANKNpHBmKXKfjhd04FuGoisxH0siTBdCXTUb
	 flCKmshCZ9KzeUHPwFaJD8kS/ol4PdK1tAsZ77xtNMBbgStnfpqAJK0TatvBAIgtjQ
	 mBIJlw4ljGzTOG987CKL4Bl8ZlY5BdDfDqzF42Oyhyeyd+fehAhkWWO1ctD32PowRM
	 M6zDpzXwv2y8PS7HEcjK7cpnxw3ASgSa4Cl0+1zjnmJEtLWISpIvy9SbOfCb6zn4oa
	 J51UJbLCuxCDg==
Message-ID: <8c864434-f5a7-40bf-8bf4-9d594177547a@kernel.org>
Date: Mon, 26 Jan 2026 11:32:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset
 for power management
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, bryan.odonoghue@linaro.org,
 bod@kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 vladimir.zapolskiy@linaro.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, stable@vger.kernel.org
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <20260126061528.63785-1-bjsaikiran@gmail.com>
 <20260126061528.63785-2-bjsaikiran@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260126061528.63785-2-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,kernel.org,gmail.com,linux.intel.com];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51546-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E58A687091
X-Rspamd-Action: no action

Hi,

On 26-Jan-26 07:15, Saikiran wrote:
> The OV02C10 sensor was experiencing brownout conditions during rapid
> power cycles (e.g., browser WebRTC permission checks) on Qualcomm
> platforms, causing the sensor to lock up and require a system reboot.
> 
> Root cause:
> The Qualcomm RPMh regulator driver does not support active discharge,
> requiring regulators to passively discharge via leakage current. This
> takes 2+ seconds on X1E80100 platforms. Without complete voltage
> discharge, the sensor's internal microcontroller does not fully reset,
> leading to I2C timeouts and a locked state.
> 
> Solution:
> Instead of power cycling the regulators, keep them continuously enabled
> and use reset signals to control the sensor state:
> 
> - power_off(): Assert hardware reset GPIO (keep regulators/clock ON)
> - power_on(): Release hardware reset + trigger software reset via
>   register 0x0103 (standard OmniVision software reset)
> 
> This approach:
> - Eliminates the 2+ second discharge delay
> - Enables instant camera reopening (~17ms vs 2.3s)
> - Properly resets the sensor state machine via reset signals
> - Maintains correct power sequencing on first initialization
> - Follows OmniVision sensor conventions (0x0103 software reset)
> 
> The first power-on still performs full regulator and clock
> initialization. Subsequent power cycles only toggle reset signals,
> avoiding the discharge delay entirely.
> 
> Tested on Lenovo Yoga Slim 7x (X1E80100) with rapid camera open/close
> cycles - no brownouts or lockups observed.
> 
> Fixes: 44f89010dae0 ("media: i2c: add OmniVision OV02C10 sensor driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>

Thank you for your work on this, both the root-cause analysis
and the code changes.

However I do not believe that this is the right approach.

This is adding platform (qcom regulator) knowledge to the sensor
driver where it does not belong.

If these qualcomm regulators need to be powered-off for at least
say 3 seconds before being powered on again then that should be
represented by setting struct regulator_desc.off_on_delay
to e.g. 3000000 (usec). On a quick check I'm not seeing a way
to set this in devicetree, so maybe this needs to be done
inside the qualcomm regulator driver.

Either way this does *not* belong inside the sensor driver.
We don't want this in the sensor driver from a design pov and
we also don't want it in the sensor driver because then it
needs to be repeated for all sensor drivers.

To avoid this 3 second delay everytime on rapid stream on/off
runtime-pm's autosuspend feature should be used with an
autosuspend delay of say 1 second. See drivers/media/i2c/ov2680.c
for an example.

This is a good idea regardless to also avoid unnecessary delays
on quick on/off related to the reset signal timing.

Regards,

Hans






> ---
>  drivers/media/i2c/ov02c10.c | 119 +++++++++++++++++++++---------------
>  1 file changed, 69 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 7e9454e8540c..08d268de60ec 100644
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
> @@ -390,8 +392,8 @@ struct ov02c10 {
>  	u32 link_freq_index;
>  	u8 mipi_lanes;
>  
> -	/* Power cycling rate limit */
> -	ktime_t last_power_off;
> +	/* Power management: track if regulators are enabled */
> +	bool powered;
>  };
>  
>  static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
> @@ -680,25 +682,16 @@ static int ov02c10_power_off(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>  
> -	/* 1. Assert Reset */
> -	gpiod_set_value_cansleep(ov02c10->reset, 1);
> -
> -	/* 2. Disable Clock (Stop sensor state machine) */
> -	clk_disable_unprepare(ov02c10->img_clk);
> -	usleep_range(1000, 1500);
> -
> -	/* 3. Disable Power */
> -	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> -			       ov02c10->supplies);
> -
>  	/*
> -	 * 4. Discharge Wait
> -	 * Wait for regulators to fully discharge before returning.
> -	 * This delay ensures clean power cycling.
> +	 * Keep regulators and clock ON to avoid discharge delay.
> +	 * Just assert hardware reset to put sensor in reset state.
> +	 * This allows instant power-on without waiting for regulator discharge.
>  	 */
> -	usleep_range(50000, 55000);
> +	if (ov02c10->reset)
> +		gpiod_set_value_cansleep(ov02c10->reset, 1);
>  
> -	ov02c10->last_power_off = ktime_get();
> +	/* Keep clock running - sensor needs it for software reset */
> +	/* Keep regulators enabled - avoids 2.3s discharge delay */
>  
>  	return 0;
>  }
> @@ -708,50 +701,63 @@ static int ov02c10_power_on(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>  	int ret;
> -	s64 delta_us;
>  
>  	/*
> -	 * Mandatory Cool-Down:
> -	 * If the camera was powered off within the last 3 seconds, ensure at least
> -	 * 2 seconds have elapsed to allow full regulator discharge and sensor reset.
> -	 * This prevents brownouts during rapid open/close/open sequences.
> +	 * On first power-on, do full initialization.
> +	 * On subsequent power-ons, regulators/clock are already on,
> +	 * so we just need to release reset and do software reset.
>  	 */
> -	delta_us = ktime_us_delta(ktime_get(), ov02c10->last_power_off);
> -	if (delta_us < 3000000) {
> -		dev_dbg(dev, "Enforcing %lld us cool-down period\n", 2000000 - delta_us);
> -		fsleep(2000000 - delta_us);
> +	if (!ov02c10->powered) {
> +		/* First time: enable everything */
> +		if (ov02c10->reset) {
> +			gpiod_set_value_cansleep(ov02c10->reset, 1);
> +			usleep_range(2000, 2200);
> +		}
> +
> +		ret = clk_prepare_enable(ov02c10->img_clk);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable imaging clock: %d", ret);
> +			return ret;
> +		}
> +
> +		usleep_range(2000, 2200);
> +
> +		ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> +					    ov02c10->supplies);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable regulators: %d", ret);
> +			clk_disable_unprepare(ov02c10->img_clk);
> +			return ret;
> +		}
> +
> +		ov02c10->powered = true;
>  	}
>  
> -	/*
> -	 * Standard Power-Up Sequence:
> -	 * 1. Enable Regulators
> -	 * 2. Enable Clock
> -	 * 3. Release Reset (with ample boot time)
> -	 */
> -
> -	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> -				    ov02c10->supplies);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to enable regulators: %d", ret);
> -		return ret;
> +	/* Release hardware reset */
> +	if (ov02c10->reset) {
> +		/* Ensure reset was asserted for at least 2ms */
> +		usleep_range(2000, 2200);
> +		gpiod_set_value_cansleep(ov02c10->reset, 0);
> +		/*
> +		 * Wait for sensor microcontroller to stabilize after reset release.
> +		 * 50ms prevents black frames during rapid power cycling by ensuring
> +		 * the sensor's internal state machine is fully initialized before
> +		 * software reset and register configuration.
> +		 */
> +		msleep(50);
>  	}
>  
> -	ret = clk_prepare_enable(ov02c10->img_clk);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to enable imaging clock: %d", ret);
> -		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> -				       ov02c10->supplies);
> +	/* Perform software reset to ensure clean state */
> +	ret = cci_write(ov02c10->regmap, OV02C10_REG_SOFTWARE_RESET,
> +			OV02C10_SOFTWARE_RESET_TRIGGER, NULL);
> +	if (ret) {
> +		dev_err(dev, "failed to send software reset: %d", ret);
>  		return ret;
>  	}
>  
> -	/* Wait for power/clock to stabilize */
> +	/* Wait for software reset to complete */
>  	usleep_range(5000, 5500);
>  
> -	if (ov02c10->reset) {
> -		gpiod_set_value_cansleep(ov02c10->reset, 0);
> -		usleep_range(80000, 85000);
> -	}
> -
>  	return 0;
>  }
>  
> @@ -924,6 +930,19 @@ static void ov02c10_remove(struct i2c_client *client)
>  		ov02c10_power_off(ov02c10->dev);
>  		pm_runtime_set_suspended(ov02c10->dev);
>  	}
> +
> +	/* Clean up regulators/clock if still enabled */
> +	if (ov02c10->powered) {
> +		/* Assert reset before disabling power for clean shutdown */
> +		if (ov02c10->reset)
> +			gpiod_set_value_cansleep(ov02c10->reset, 1);
> +
> +		clk_disable_unprepare(ov02c10->img_clk);
> +		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> +				       ov02c10->supplies);
> +		ov02c10->powered = false;
> +	}
> +
>  	v4l2_subdev_cleanup(sd);
>  	media_entity_cleanup(&sd->entity);
>  	v4l2_ctrl_handler_free(sd->ctrl_handler);


