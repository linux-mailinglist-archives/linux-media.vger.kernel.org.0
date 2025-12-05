Return-Path: <linux-media+bounces-48320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E616ACA73BD
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 11:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF223301139D
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D2F315D47;
	Fri,  5 Dec 2025 10:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uvLWsUpC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF626329361;
	Fri,  5 Dec 2025 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931594; cv=none; b=o5m3+MxcTVMcJiLnDyQwJDvdkwrKPU+beLoF5jsgN4/aIH8ZIZqj6HgGUpujDXbViasKrG7u3vHOwPQleQuo+vxB1Tx8wg5TXAtXPEc3wcxwq5/wqI6+Tk+Tfi4F+GjO7ffBVZ7shlBcaD10sCWwtMBDZUJeljmrasyI4pEmijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931594; c=relaxed/simple;
	bh=wiiGOHoRmff2Ap6D9e0QCetLOYf/pjSo9XmfM4DWCjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZP9+4wA3f0AGUXltOjfhj+bR2uUOsOXli5lvRmgaKaIESl/gCdPMD1euSDpxYlxcTCqiNV6P4TRTMG6dhiP/RbCCywfLzCE9XWyoAlSWkux0EF/veBnW77ZhSZ9HWMPJymZptvkCsmYj3WE2aYKjCXToONM28h7TU+LKC6lW2Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uvLWsUpC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3F8EE52;
	Fri,  5 Dec 2025 11:44:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764931447;
	bh=wiiGOHoRmff2Ap6D9e0QCetLOYf/pjSo9XmfM4DWCjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uvLWsUpCh2REH9myZGZG5iJktcTBW/A8X0qroVQC5s3pgXBs3aREniP8GU0ORBdSY
	 +n4vNsa9aEsRcQBbXq8F57+O7airp5enXFAoRK4NvVChsjBA5r3qlohx2imZonC0fG
	 IrdlHii2McYnuigqbrKvXN1EUZiZEKiABAK/E3k4=
Message-ID: <3fb1b12c-2f54-4bdf-8a33-a42b4852d651@ideasonboard.com>
Date: Fri, 5 Dec 2025 12:46:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] media: i2c: ds90ub960: Use enums for chip type and
 chip family
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: hansg@kernel.org, mehdi.djait@linux.intel.com, ribalda@chromium.org,
 git@apitzsch.eu, vladimir.zapolskiy@linaro.org,
 benjamin.mugnier@foss.st.com, dongcheng.yan@intel.com, u-kumar1@ti.com,
 jai.luthra@linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hverkuil@xs4all.nl, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com
References: <20251202102208.80713-1-y-abhilashchandra@ti.com>
 <20251202102208.80713-3-y-abhilashchandra@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251202102208.80713-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/12/2025 12:22, Yemike Abhilash Chandra wrote:
> Replace chip-specific boolean flags with chip_type and chip_family enums.
> This simplifies the process of adding support for newer devices and also
> improves code readability.
> 
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  drivers/media/i2c/ds90ub960.c | 56 ++++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 5a83218e64ab..45494fcaf095 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -454,12 +454,21 @@
>  #define UB960_MAX_EQ_LEVEL  14
>  #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
>  
> +enum chip_type {
> +	UB960,
> +	UB9702,
> +};
> +
> +enum chip_family {
> +	FAMILY_FPD3,
> +	FAMILY_FPD4,
> +};
> +
>  struct ub960_hw_data {
> -	const char *model;
> +	enum chip_type chip_type;
> +	enum chip_family chip_family;
>  	u8 num_rxports;
>  	u8 num_txports;
> -	bool is_ub9702;
> -	bool is_fpdlink4;
>  };
>  
>  enum ub960_rxport_mode {
> @@ -1933,7 +1942,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
>  		if (ret)
>  			return ret;
>  
> -		if (priv->hw_data->is_ub9702) {
> +		if (priv->hw_data->chip_type == UB9702) {
>  			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
>  				nport, ((u64)v * HZ_PER_MHZ) >> 8);
>  		} else {
> @@ -2195,7 +2204,7 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
>  
>  	ser_pdata->port = nport;
>  	ser_pdata->atr = priv->atr;
> -	if (priv->hw_data->is_ub9702)
> +	if (priv->hw_data->chip_type == UB9702)
>  		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
>  	else
>  		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
> @@ -2361,7 +2370,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
>  {
>  	int ret;
>  
> -	if (priv->hw_data->is_ub9702)
> +	if (priv->hw_data->chip_type == UB9702)
>  		ret = ub960_init_tx_ports_ub9702(priv);
>  	else
>  		ret = ub960_init_tx_ports_ub960(priv);
> @@ -3633,7 +3642,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>  
>  		case RXPORT_MODE_CSI2_SYNC:
>  		case RXPORT_MODE_CSI2_NONSYNC:
> -			if (!priv->hw_data->is_ub9702) {
> +			if (priv->hw_data->chip_type != UB9702) {

While the above is correct, I think it's better to do 'if
(what-we-need-here)'. So rather check for UB960.

>  				/* Map all VCs from this port to the same VC */
>  				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
>  						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
> @@ -4259,7 +4268,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
>  
>  		dev_info(dev, "\tcsi_err_counter %u\n", v);
>  
> -		if (!priv->hw_data->is_ub9702) {
> +		if (priv->hw_data->chip_type != UB9702) {

Same here.

>  			ret = ub960_log_status_ub960_sp_eq(priv, nport);
>  			if (ret)
>  				return ret;
> @@ -4417,7 +4426,7 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
>  		return -EINVAL;
>  	}
>  
> -	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
> +	if (priv->hw_data->chip_family != FAMILY_FPD4 && cdr_mode == RXPORT_CDR_FPD4) {
>  		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
>  		return -EINVAL;
>  	}
> @@ -4976,6 +4985,7 @@ static int ub960_get_hw_resources(struct ub960_data *priv)
>  static int ub960_enable_core_hw(struct ub960_data *priv)
>  {
>  	struct device *dev = &priv->client->dev;
> +	const char *model;
>  	u8 rev_mask;
>  	int ret;
>  	u8 dev_sts;
> @@ -5012,14 +5022,24 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>  		goto err_pd_gpio;
>  	}
>  
> -	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
> -		rev_mask);
> +	switch (priv->hw_data->chip_type) {
> +	case UB960:
> +		model = "UB960";
> +		break;
> +	case UB9702:
> +		model = "Ub9702";
> +		break;
> +	default:
> +		model = "Unknown";
> +		break;
> +	}
> +	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", model, rev_mask);
>  
>  	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts, NULL);
>  	if (ret)
>  		goto err_pd_gpio;
>  
> -	if (priv->hw_data->is_ub9702)
> +	if (priv->hw_data->chip_type == UB9702)
>  		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
>  				 NULL);
>  	else
> @@ -5038,7 +5058,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>  		goto err_pd_gpio;
>  
>  	/* release GPIO lock */
> -	if (priv->hw_data->is_ub9702) {
> +	if (priv->hw_data->chip_type == UB9702) {
>  		ret = ub960_update_bits(priv, UB960_SR_RESET,
>  					UB960_SR_RESET_GPIO_LOCK_RELEASE,
>  					UB960_SR_RESET_GPIO_LOCK_RELEASE,
> @@ -5111,7 +5131,7 @@ static int ub960_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_free_ports;
>  
> -	if (priv->hw_data->is_ub9702)
> +	if (priv->hw_data->chip_type == UB9702)
>  		ret = ub960_init_rx_ports_ub9702(priv);
>  	else
>  		ret = ub960_init_rx_ports_ub960(priv);
> @@ -5179,17 +5199,17 @@ static void ub960_remove(struct i2c_client *client)
>  }
>  
>  static const struct ub960_hw_data ds90ub960_hw = {
> -	.model = "ub960",
> +	.chip_type = UB960,
> +	.chip_family = FAMILY_FPD3,

I think we can keep the model name here. It's a bit duplicate with the
chip_type, but allows us to drop that switch-case from probe.

>  	.num_rxports = 4,
>  	.num_txports = 2,
>  };
>  
>  static const struct ub960_hw_data ds90ub9702_hw = {
> -	.model = "ub9702",
> +	.chip_type = UB9702,
> +	.chip_family = FAMILY_FPD4,
>  	.num_rxports = 4,
>  	.num_txports = 2,
> -	.is_ub9702 = true,
> -	.is_fpdlink4 = true,
>  };
>  
>  static const struct i2c_device_id ub960_id[] = {

 Tomi


