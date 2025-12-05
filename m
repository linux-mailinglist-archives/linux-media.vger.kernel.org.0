Return-Path: <linux-media+bounces-48321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A2CA751F
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 12:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73AFD3027731
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 11:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC8732D0CD;
	Fri,  5 Dec 2025 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H3GgpSYX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820352F692F;
	Fri,  5 Dec 2025 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933052; cv=none; b=T2NYSi+ECa3eI1GJV/bJMsozX9KJmw6GbHyy2gTnpCIwKNu9cvKAO9w5L2KaKNP6EKNJ2fgn7d2BNos7lOtYCfW8PiWv/cq+4LU9SsMFlJbxxRx6ACQgh5Jsyl5brp5vtodapNZOLwQft0FF1WgMo8+9JPX1keSR60LxBoFxt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933052; c=relaxed/simple;
	bh=7/jdxAGyLizEv+MMB75f57qgu8yKlN9khKDAOCWpMyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sx4yyL44j+sH7jqlO/myostbLrU85UCpd1o7zykQrLsMLLO+SLrHiBJQcW6WNJAuECN0CbPIbsXGalbJJCWVpHbutuflnPNu8yQ0oT40+/BRbVtdsHzenmfmdqjGH1Fe01yVcd4mbzic+pZEUDFaRZdv0IIRwgVzDzt/boAiaAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H3GgpSYX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01687E7C;
	Fri,  5 Dec 2025 12:08:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764932898;
	bh=7/jdxAGyLizEv+MMB75f57qgu8yKlN9khKDAOCWpMyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H3GgpSYXo1vjVfoiRI92RDBD004gpMS9lDrfaAWk4eBYVUMK6uM07qfnxql7OaxIB
	 7cJHRo+jFa1DQ4LbR/RUjlwLJtQUABr3H5lt2mlKt6ifNE3vpbhxASDYyImrHRhGAX
	 1fl1F8x9bWiifiLbvKoDkqF6Bk4R4HHmn7cy8CM8=
Message-ID: <c387b053-82b1-4de4-946a-5f2b9270224f@ideasonboard.com>
Date: Fri, 5 Dec 2025 13:10:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] media: i2c: ds90ub960: Add support for
 DS90UB954-Q1
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
 <20251202102208.80713-5-y-abhilashchandra@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20251202102208.80713-5-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/12/2025 12:22, Yemike Abhilash Chandra wrote:
> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
> compatible with DS90UB960-Q1. The main difference is that it supports half
> of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX port.
> 
> A couple of differences are between the status registers and the
> strobe setting registers. Hence accommodate these differences in
> the UB960 driver so that we can reuse a large part of the existing code.
> 
> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Refer table 5.2.1 STROBE_SET Register in [1] for DS90UB954 strobe
> setting register.
> 
> [1]: https://www.ti.com/lit/an/snla301/snla301.pdf
> 
>  drivers/media/i2c/Kconfig     |   4 +-
>  drivers/media/i2c/ds90ub960.c | 165 +++++++++++++++++++++++++---------
>  2 files changed, 125 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 745819c625d6..52104f76e371 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1703,8 +1703,8 @@ config VIDEO_DS90UB960
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
>  	help
> -	  Device driver for the Texas Instruments DS90UB960
> -	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
> +	  Device driver for the Texas Instruments DS90UB954, DS90UB960
> +	  FPD-Link III Deserializers and DS90UB9702 FPD-Link IV Deserializer.
>  
>  config VIDEO_MAX96714
>  	tristate "Maxim MAX96714 GMSL2 deserializer"
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 45494fcaf095..7d3e5a87bb17 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -396,6 +396,12 @@
>  #define UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(3)
>  #define UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(2, 0)
>  
> +#define UB954_IR_RX_ANA_STROBE_SET_CLK_DATA		0x08
> +#define UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY	BIT(3)
> +#define UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(7)
> +#define UB954_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK	GENMASK(2, 0)
> +#define UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(4, 6)
> +
>  /* UB9702 Registers */
>  
>  #define UB9702_SR_CSI_EXCLUSIVE_FWD2		0x3c
> @@ -455,6 +461,7 @@
>  #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
>  
>  enum chip_type {
> +	UB954,
>  	UB960,
>  	UB9702,
>  };
> @@ -1000,6 +1007,10 @@ static int ub960_txport_select(struct ub960_data *priv, u8 nport)
>  
>  	lockdep_assert_held(&priv->reg_lock);
>  
> +	/* UB954 has only 1 CSI TX. Hence, no need to select */
> +	if (priv->hw_data->chip_type == UB954)
> +		return 0;
> +
>  	if (priv->reg_current.txport == nport)
>  		return 0;
>  
> @@ -1424,10 +1435,11 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
>  	priv->tx_link_freq[0] = vep.link_frequencies[0];
>  	priv->tx_data_rate = priv->tx_link_freq[0] * 2;
>  
> -	if (priv->tx_data_rate != MHZ(1600) &&
> -	    priv->tx_data_rate != MHZ(1200) &&
> -	    priv->tx_data_rate != MHZ(800) &&
> -	    priv->tx_data_rate != MHZ(400)) {
> +	if ((priv->tx_data_rate != MHZ(1600) &&
> +	     priv->tx_data_rate != MHZ(1200) &&
> +	     priv->tx_data_rate != MHZ(800) &&
> +	     priv->tx_data_rate != MHZ(400)) ||
> +	     (priv->hw_data->chip_type == UB954 && priv->tx_data_rate == MHZ(1200))) {
>  		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
>  		ret = -EINVAL;
>  		goto err_free_vep;
> @@ -1551,22 +1563,44 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
>  	u8 clk_delay, data_delay;
>  	int ret;
>  
> -	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> -			     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * DS90UB960 has two separate registers for clk and data delay whereas
> +	 * DS90UB954 has a single combined register. Hence read accordingly
> +	 */

Why do you read the single register twice? In any case, I don't think
the comment is needed, as it's quite clear from the code. Unless there's
some extra complication with the registers.

> +	if (priv->hw_data->chip_type == UB954) {
> +		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> +				     UB954_IR_RX_ANA_STROBE_SET_CLK_DATA, &v, NULL);
> +		if (ret)
> +			return ret;
>  
> -	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
> -			    0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
> +		clk_delay = (v & UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
> +			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
>  
> -	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> -			     UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
> -	if (ret)
> -		return ret;
> +		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> +				     UB954_IR_RX_ANA_STROBE_SET_CLK_DATA, &v, NULL);
> +		if (ret)
> +			return ret;
> +
> +		data_delay = (v & UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
> +			      0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
> +	} else {
> +		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> +				     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
> +		if (ret)
> +			return ret;
>  
> -	data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
> +		clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
>  			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
>  
> +		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> +				     UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
> +		if (ret)
> +			return ret;
> +
> +		data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
> +			      0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
> +	}
> +
>  	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v, NULL);
>  	if (ret)
>  		return ret;
> @@ -1590,8 +1624,17 @@ static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
>  	u8 clk_delay, data_delay;
>  	int ret = 0;
>  
> -	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
> -	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
> +	/*
> +	 * DS90UB960 has two separate registers for clk and data delay whereas
> +	 * DS90UB954 has a single combined register. Hence assign accordingly.
> +	 */
> +	if (priv->hw_data->chip_type == UB954) {
> +		clk_delay = UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
> +		data_delay = UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
> +	} else {
> +		clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
> +		data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
> +	}
>  
>  	if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
>  		clk_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
> @@ -1602,11 +1645,25 @@ static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
>  	else if (strobe_pos > 0)
>  		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>  
> -	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> -			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
> -
> -	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> -			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
> +	/*
> +	 * DS90UB960 has two separate registers for clk and data delay whereas
> +	 * DS90UB954 has a single combined register. Hence write the registers accordingly.
> +	 */
> +	if (priv->hw_data->chip_type == UB954) {
> +		ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport),
> +				      UB954_IR_RX_ANA_STROBE_SET_CLK_DATA,
> +				      UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY,
> +				      clk_delay, &ret);
> +		ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport),
> +				      UB954_IR_RX_ANA_STROBE_SET_CLK_DATA,
> +				      UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY,
> +				      data_delay, &ret);

Here, too. It's a single register, why write it twice?

And I don't think this is correct at all... Did you validate this? The
above only sets the EXTRA_DELAY bits, not the values at all. And the
code that sets clk_delay and data_delay use UB960's bit positions, which
are not the same on UB954.

> +	} else {
> +		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> +				UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
> +		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
> +				UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
> +	}
>  
>  	return ret;
>  }
> @@ -4176,33 +4233,40 @@ static int ub960_log_status(struct v4l2_subdev *sd)
>  		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
>  			 v & (u8)BIT(0));
>  
> -		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport),
> -				   &v16, NULL);
> -		if (ret)
> -			return ret;
> +		/*
> +		 * Frame counter, frame error counter, line counter and line error counter
> +		 * registers are marked as reserved in the UB954 datasheet. Hence restrict
> +		 * the following register reads only for UB960 and UB9702.
> +		 */
> +		if (priv->hw_data->chip_type != UB954) {

It is better to check for the chips that have the registers, unless
we're sure that this particular chip, ub954, is and will be the only
outlier.

> +			ret = ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport),
> +					   &v16, NULL);
> +			if (ret)
> +				return ret;
>  
> -		dev_info(dev, "\tframe counter %u\n", v16);
> +			dev_info(dev, "\tframe counter %u\n", v16);
>  
> -		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
> -				   &v16, NULL);
> -		if (ret)
> -			return ret;
> +			ret = ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
> +					   &v16, NULL);
> +			if (ret)
> +				return ret;
>  
> -		dev_info(dev, "\tframe error counter %u\n", v16);
> +			dev_info(dev, "\tframe error counter %u\n", v16);
>  
> -		ret = ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport),
> -				   &v16, NULL);
> -		if (ret)
> -			return ret;
> +			ret = ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport),
> +					   &v16, NULL);
> +			if (ret)
> +				return ret;
>  
> -		dev_info(dev, "\tline counter %u\n", v16);
> +			dev_info(dev, "\tline counter %u\n", v16);
>  
> -		ret = ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
> -				   &v16, NULL);
> -		if (ret)
> -			return ret;
> +			ret = ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
> +					   &v16, NULL);
> +			if (ret)
> +				return ret;
>  
> -		dev_info(dev, "\tline error counter %u\n", v16);
> +			dev_info(dev, "\tline error counter %u\n", v16);
> +		}
>  	}
>  
>  	for_each_rxport(priv, it) {
> @@ -5023,6 +5087,9 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>  	}
>  
>  	switch (priv->hw_data->chip_type) {
> +	case UB954:
> +		model = "UB954";
> +		break;
>  	case UB960:
>  		model = "UB960";
>  		break;
> @@ -5039,6 +5106,11 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>  	if (ret)
>  		goto err_pd_gpio;
>  
> +	/*
> +	 * UB954 REFCLK_FREQ is not synchronized, so multiple reads are recommended
> +	 * by the datasheet. However, we use the same logic as UB960 (single read),
> +	 * as practical testing showed this is sufficient and stable for UB954 as well.
> +	 */

I think the important point is that the clk rate is only used for a
debug print.

>  	if (priv->hw_data->chip_type == UB9702)
>  		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
>  				 NULL);
> @@ -5198,6 +5270,13 @@ static void ub960_remove(struct i2c_client *client)
>  	mutex_destroy(&priv->reg_lock);
>  }
>  
> +static const struct ub960_hw_data ds90ub954_hw = {
> +	.chip_type = UB954,
> +	.chip_family = FAMILY_FPD3,
> +	.num_rxports = 2,
> +	.num_txports = 1,
> +};
> +
>  static const struct ub960_hw_data ds90ub960_hw = {
>  	.chip_type = UB960,
>  	.chip_family = FAMILY_FPD3,
> @@ -5213,6 +5292,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
>  };
>  
>  static const struct i2c_device_id ub960_id[] = {
> +	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
>  	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
>  	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
>  	{}
> @@ -5220,6 +5300,7 @@ static const struct i2c_device_id ub960_id[] = {
>  MODULE_DEVICE_TABLE(i2c, ub960_id);
>  
>  static const struct of_device_id ub960_dt_ids[] = {
> +	{ .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
>  	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
>  	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
>  	{}

 Tomi


