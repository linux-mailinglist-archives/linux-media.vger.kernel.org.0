Return-Path: <linux-media+bounces-18051-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9D972C13
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 10:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BDEC1F24FB5
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2024 08:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3026F186284;
	Tue, 10 Sep 2024 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eol374oi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D981B17E8F7
	for <linux-media@vger.kernel.org>; Tue, 10 Sep 2024 08:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725956649; cv=none; b=mqxXNPwjmh+tCeIe9iokARCcXr4/BfXEnc9sJ0darAlWXOvfJuSsc3/Xd5S+OLKPQjcQCJXs2ovJYoPc4qlZovOqsDCm4dY/OgbA0u4GH9Vf8KZS7DeU95MBkrISqMzqbRKApeZ0Evasm7C+OSZG0W9ymY8IpBfmzN/rCz/q3+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725956649; c=relaxed/simple;
	bh=JO7Zcf3xFEx+3pZDTNr7dvUrfiSzuGyzVOjmOuceKso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbgrLcNdBC6WJCiZIB61IvAi/ud8f2RemCGCL1+mGh5jFWkxUQerMhSVUj07jcM9dndPwLVSE3n5O6dz5u8XwI8/sksesZMQux6ARFG7O75OlB57VS+ZEmahMveyLcgmoejWrlqD5ycAEmrmoHGZOkqxnYrlHscjwxnIQiDWuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eol374oi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76A2EC8A;
	Tue, 10 Sep 2024 10:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725956569;
	bh=JO7Zcf3xFEx+3pZDTNr7dvUrfiSzuGyzVOjmOuceKso=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eol374oiammYV6ItramHytv1bWweb7XrKV0gCeu/13RVuqDBZQpNrxDWPfjB2VkNH
	 wxmh3j578obs70gvcpVzH1N23sfDaX/JQxESWJHtklqvWPKdB+pjHr3gQQkA2c2+Ug
	 hoGTc1Lw3SYLOIXD+ps0RQNSJQZby5ZezGuE2ruQ=
Message-ID: <f1d92693-427a-4aa9-8795-4acc30049e7f@ideasonboard.com>
Date: Tue, 10 Sep 2024 11:24:03 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: i2c: ds90ub960: Convert IC specific variables
 to flags
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20240830070008.9486-1-eagle.alexander923@gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240830070008.9486-1-eagle.alexander923@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/08/2024 10:00, Alexander Shiyan wrote:
> This patch converts chip-specific variables into generic flags that
> can be used to easily add support for other chip types.
> 
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>   drivers/media/i2c/ds90ub960.c | 48 ++++++++++++++++++++++++-----------
>   1 file changed, 33 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index ffe5f25f8647..e9f9abf439ee 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -402,12 +402,18 @@
>   #define UB960_MAX_EQ_LEVEL  14
>   #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
>   
> +enum chip_type {
> +	UB960,
> +	UB9702,
> +};
> +
> +#define FLAGS_HAS_FPDLINK4			BIT(0)
> +
>   struct ub960_hw_data {
> -	const char *model;
> +	enum chip_type chip_type;
>   	u8 num_rxports;
>   	u8 num_txports;
> -	bool is_ub9702;
> -	bool is_fpdlink4;
> +	u32 flags;

Let's drop the is_fpdlink4/FLAGS_HAS_FPDLINK4. It's only used in one 
place, and just checking for the model == UB9702 is fine.

While you're at this, can you go through the code for ifs/selects for 
chip_type, and change the code so that we don't have plain "else" blocks 
there. I.e. in each chip_type test we would be explicitly testing for 
matching chip types, and _not_ do things like:

if (ub960)
	xyz-for-ub960;
else
	must-be-ub9702;

Also, with the above change, and adding UB954, I wonder if it would make 
the code simpler if we added a "chip family" property. The UB960 & UB954 
are clearly part of the same family, whereas UB9702 (and other FPD-Link 
4 desers which the driver doesn't support) are another. As we don't have 
a good name for them, maybe just FAMILY_FPD3 and FAMILY_FPD4.

  Tomi

>   };
>   
>   enum ub960_rxport_mode {
> @@ -1654,7 +1660,7 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
>   
>   	ser_pdata->port = nport;
>   	ser_pdata->atr = priv->atr;
> -	if (priv->hw_data->is_ub9702)
> +	if (priv->hw_data->chip_type == UB9702)
>   		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
>   	else
>   		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
> @@ -1785,7 +1791,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
>   
>   	ub960_write(priv, UB960_SR_CSI_PLL_CTL, speed_select);
>   
> -	if (priv->hw_data->is_ub9702) {
> +	if (priv->hw_data->chip_type == UB9702) {
>   		ub960_write(priv, UB960_SR_CSI_PLL_DIV, pll_div);
>   
>   		switch (priv->tx_data_rate) {
> @@ -2140,7 +2146,7 @@ static int ub960_init_rx_ports(struct ub960_data *priv)
>   		if (!rxport)
>   			continue;
>   
> -		if (priv->hw_data->is_ub9702)
> +		if (priv->hw_data->chip_type == UB9702)
>   			ub960_init_rx_port_ub9702(priv, rxport);
>   		else
>   			ub960_init_rx_port_ub960(priv, rxport);
> @@ -2509,7 +2515,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>   
>   		case RXPORT_MODE_CSI2_SYNC:
>   		case RXPORT_MODE_CSI2_NONSYNC:
> -			if (!priv->hw_data->is_ub9702) {
> +			if (priv->hw_data->chip_type != UB9702) {
>   				/* Map all VCs from this port to the same VC */
>   				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
>   						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
> @@ -3217,7 +3223,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
>   		return -EINVAL;
>   	}
>   
> -	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
> +	if (!(priv->hw_data->flags & FLAGS_HAS_FPDLINK4) &&
> +	    (cdr_mode == RXPORT_CDR_FPD4)) {
>   		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
>   		return -EINVAL;
>   	}
> @@ -3796,6 +3803,7 @@ static int ub960_get_hw_resources(struct ub960_data *priv)
>   static int ub960_enable_core_hw(struct ub960_data *priv)
>   {
>   	struct device *dev = &priv->client->dev;
> +	const char *model;
>   	u8 rev_mask;
>   	int ret;
>   	u8 dev_sts;
> @@ -3830,8 +3838,19 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>   		goto err_pd_gpio;
>   	}
>   
> -	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
> -		rev_mask);
> +	switch (priv->hw_data->chip_type) {
> +	case UB960:
> +		model = "UB960";
> +		break;
> +	case UB9702:
> +		model = "UB9702";
> +		break;
> +	default:
> +		model = "Unknown";
> +		break;
> +	};
> +
> +	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", model, rev_mask);
>   
>   	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts);
>   	if (ret)
> @@ -3851,7 +3870,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>   		goto err_pd_gpio;
>   
>   	/* release GPIO lock */
> -	if (priv->hw_data->is_ub9702) {
> +	if (priv->hw_data->chip_type == UB9702) {
>   		ret = ub960_update_bits(priv, UB960_SR_RESET,
>   					UB960_SR_RESET_GPIO_LOCK_RELEASE,
>   					UB960_SR_RESET_GPIO_LOCK_RELEASE);
> @@ -4013,17 +4032,16 @@ static void ub960_remove(struct i2c_client *client)
>   }
>   
>   static const struct ub960_hw_data ds90ub960_hw = {
> -	.model = "ub960",
> +	.chip_type = UB960,
>   	.num_rxports = 4,
>   	.num_txports = 2,
>   };
>   
>   static const struct ub960_hw_data ds90ub9702_hw = {
> -	.model = "ub9702",
> +	.chip_type = UB9702,
>   	.num_rxports = 4,
>   	.num_txports = 2,
> -	.is_ub9702 = true,
> -	.is_fpdlink4 = true,
> +	.flags = FLAGS_HAS_FPDLINK4,
>   };
>   
>   static const struct i2c_device_id ub960_id[] = {


