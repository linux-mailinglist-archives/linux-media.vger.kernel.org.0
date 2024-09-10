Return-Path: <linux-media+bounces-18052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBDD972C5A
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 10:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7DCDB2572F
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 08:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46311183CB0;
	Tue, 10 Sep 2024 08:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z5XjA4xq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B4D18593C
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725957621; cv=none; b=FD62ZFK0pGQsXN6iZqs7lnAwyXq8KGDUO8RtEnsl9dDl3gmSc4H7ftJUJJ7JdcNteAFocFzYaipNgO4wQs19hePeqCK2/ww53MVRFOVSWs2W4c2uTCxopS8WODOVIG3acN55d9jE/6+epRFmJvsoBYXUZC2bxZ+MGi7VTGwBR0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725957621; c=relaxed/simple;
	bh=ewWcvYN9HJYaotRGCi3VfVSfRsqWTRZ7PgOlQLbhBAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2OoUgWJ6yXiAcoHWU7SEZHdoN8DTNM5zHkrIDYdaRc+fN8mtY/+Ft/yZeGJMGUXdPK40U58p42M54kUSCR1hIjVfQX4meJOmNYu51F/EZwafqGxIQ3S9dZoJ+xPf8JriJjc4K9/qe1gyz5Uj3wTo6La/mkNazQsnxa5NBhxY6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z5XjA4xq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61558C8A;
	Tue, 10 Sep 2024 10:39:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725957541;
	bh=ewWcvYN9HJYaotRGCi3VfVSfRsqWTRZ7PgOlQLbhBAo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z5XjA4xqFxBmVP+f/50sAbUQ5ZPQb8net/GR9C4Kv01LVmdmrELZwnkHa19kd2KaM
	 MVS6nye6EbMzbnau3HP6FjBI/hFF/MT4EKgFN8gQPf5wb4TPyiYtnIqWE54QJzFtMF
	 JtUc03HRGrE4qaUiusuAy2qHV7SJvUllFvAYpNMM=
Message-ID: <25fc667c-1170-4b8b-b2ba-578758c78804@ideasonboard.com>
Date: Tue, 10 Sep 2024 11:40:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: i2c: ds90ub960: Add DS90UB954 support
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20240830070008.9486-1-eagle.alexander923@gmail.com>
 <20240830070008.9486-2-eagle.alexander923@gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240830070008.9486-2-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/08/2024 10:00, Alexander Shiyan wrote:
> Add support for TI DS90UB954 FPD-Link III Deserializer.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>   drivers/media/i2c/Kconfig     |  2 +-
>   drivers/media/i2c/ds90ub960.c | 52 +++++++++++++++++++++++++++++------
>   2 files changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8ba096b8ebca..18766898280b 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1604,7 +1604,7 @@ config VIDEO_DS90UB960
>   	select V4L2_FWNODE
>   	select VIDEO_V4L2_SUBDEV_API
>   	help
> -	  Device driver for the Texas Instruments DS90UB960
> +	  Device driver for the Texas Instruments DS90UB954/DS90UB960
>   	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
>   
>   config VIDEO_MAX96714
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index e9f9abf439ee..9edc7e8ceebd 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -403,6 +403,7 @@
>   #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
>   
>   enum chip_type {
> +	UB954,
>   	UB960,
>   	UB9702,
>   };
> @@ -1154,10 +1155,17 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
>   	priv->tx_link_freq[0] = vep.link_frequencies[0];
>   	priv->tx_data_rate = priv->tx_link_freq[0] * 2;
>   
> -	if (priv->tx_data_rate != MHZ(1600) &&
> -	    priv->tx_data_rate != MHZ(1200) &&
> -	    priv->tx_data_rate != MHZ(800) &&
> -	    priv->tx_data_rate != MHZ(400)) {
> +	switch (priv->tx_data_rate) {
> +	case MHZ(1600):
> +	case MHZ(800):
> +	case MHZ(400):
> +		break;
> +	case MHZ(1200):
> +		/* UB954 does not support 1.2 Gbps */
> +		if (priv->hw_data->chip_type != UB954)
> +			break;

Here, and in a few other places, don't check for model != UB954, but 
rather check for model == UB954. Otherwise if we add a new chip model 
these won't necessarily go right.

> +		fallthrough;
> +	default:
>   		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
>   		ret = -EINVAL;
>   		goto err_free_vep;
> @@ -1419,7 +1427,7 @@ static void ub960_rxport_config_eq(struct ub960_data *priv, unsigned int nport)
>   
>   	if (priv->strobe.manual)
>   		ub960_rxport_set_strobe_pos(priv, nport, rxport->eq.strobe_pos);
> -	else
> +	else if (priv->hw_data->chip_type != UB954)
>   		ub960_rxport_set_strobe_pos(priv, nport, 0);

This looks odd. Manually set strobe pos is ok, but not the default?

What is the reason for this if?

>   
>   	if (rxport->eq.manual_eq) {
> @@ -3807,7 +3815,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>   	u8 rev_mask;
>   	int ret;
>   	u8 dev_sts;
> -	u8 refclk_freq;
> +	u8 refclk_freq[2];

Instead of an array, I think the code will be clearer if you just add a 
new variable (refclk_freq_new?).

>   
>   	ret = regulator_enable(priv->vddio);
>   	if (ret)
> @@ -3839,6 +3847,9 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>   	}
>   
>   	switch (priv->hw_data->chip_type) {
> +	case UB954:
> +		model = "UB954";
> +		break;
>   	case UB960:
>   		model = "UB960";
>   		break;
> @@ -3856,12 +3867,26 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>   	if (ret)
>   		goto err_pd_gpio;
>   
> -	ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq);
> +	ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq[0]);
>   	if (ret)
>   		goto err_pd_gpio;
>   
> +	/* From DS90UB954-Q1 datasheet:
> +	 * "REFCLK_FREQ measurement is not synchronized. Value in this register
> +	 * should read twice and only considered valid if
> +	 * REFCLK_FREQ is unchanged between reads."
> +	*/

The coding style says the multiline comments are like:

/*
  * Foo
  */

> +	while (priv->hw_data->chip_type == UB954) {
> +		ret = ub960_read(priv, UB960_XR_REFCLK_FREQ, &refclk_freq[1]);
> +		if (ret)
> +			goto err_pd_gpio;
> +		if (refclk_freq[0] == refclk_freq[1])
> +			break;
> +		refclk_freq[0] = refclk_freq[1];
> +	};

This is potentially an infinite loop, which is not a good idea. Also, 
don't loop with "while (priv->hw_data->chip_type == UB954)"... Just use 
an if for the chip_type, and loop with a proper condition.

> +
>   	dev_dbg(dev, "refclk valid %u freq %u MHz (clk fw freq %lu MHz)\n",
> -		!!(dev_sts & BIT(4)), refclk_freq,
> +		!!(dev_sts & BIT(4)), refclk_freq[0],
>   		clk_get_rate(priv->refclk) / 1000000);
>   
>   	/* Disable all RX ports by default */
> @@ -3923,7 +3948,8 @@ static int ub960_probe(struct i2c_client *client)
>   	 */
>   	priv->reg_current.indirect_target = 0xff;
>   	priv->reg_current.rxport = 0xff;
> -	priv->reg_current.txport = 0xff;
> +	/* Avoid using UB960_SR_CSI_PORT_SEL register for single TX channel */
> +	priv->reg_current.txport = priv->hw_data->num_txports > 1 ? 0xff : 0x00;

No, don't do this. Just do a proper check in ub960_txport_select() and 
skip the reg write there.

  Tomi

>   	ret = ub960_get_hw_resources(priv);
>   	if (ret)
> @@ -4031,6 +4057,12 @@ static void ub960_remove(struct i2c_client *client)
>   	mutex_destroy(&priv->reg_lock);
>   }
>   
> +static const struct ub960_hw_data ds90ub954_hw = {
> +	.chip_type = UB954,
> +	.num_rxports = 2,
> +	.num_txports = 1,
> +};
> +
>   static const struct ub960_hw_data ds90ub960_hw = {
>   	.chip_type = UB960,
>   	.num_rxports = 4,
> @@ -4045,6 +4077,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
>   };
>   
>   static const struct i2c_device_id ub960_id[] = {
> +	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
>   	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
>   	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
>   	{}
> @@ -4052,6 +4085,7 @@ static const struct i2c_device_id ub960_id[] = {
>   MODULE_DEVICE_TABLE(i2c, ub960_id);
>   
>   static const struct of_device_id ub960_dt_ids[] = {
> +	{ .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
>   	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
>   	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
>   	{}


