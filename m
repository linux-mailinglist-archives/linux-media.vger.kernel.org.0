Return-Path: <linux-media+bounces-57271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNCNE42fxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:17:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDCE3468D8
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 115703072394
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D77324B1F;
	Fri, 27 Mar 2026 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tiVv/Gpu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B906F31A81C;
	Fri, 27 Mar 2026 15:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624506; cv=none; b=L+8feFlvlaUipVJKzQuw8X8GhcsZ6hbPBQR+LMGsEuJCKArGWoowXwlVOjUAqBE43dtHtnOkkGIx6megVtn2iENedC4WX/hl/lASvQ+ruIvn3WDrp/OJmSAuuRWAtNZXNVs15yzMllg1AaY5sGVkr+PFuyZtxX6579jwmqMPxgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624506; c=relaxed/simple;
	bh=z2OLsPdwU6WXNIJjbj7df7R+ZhVI0vWG0K7L6hVeL/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYcIur0ZedP9ObWmATAWLpeDA/jeYbwtaouVhFC0/BVe0jyOoW6F7UkuF3Jb1nCpCRyFxBTL4JriUkHqIHbWv/lEcdqPH+2TI6911QwtOu2G+Te8ra8NqmGRzovIiLp7kzfSxDzmiX/s6q4gMFlhQwb5/H1x6EpY5oi313intF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tiVv/Gpu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7397F201C;
	Fri, 27 Mar 2026 16:13:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774624423;
	bh=z2OLsPdwU6WXNIJjbj7df7R+ZhVI0vWG0K7L6hVeL/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tiVv/GpuPxpihs09YFEN0eX46K+5V7FapLNxktwZ5h+DoDCNrLyIXEPtC4/EuXXvy
	 DRDrxAIxl8L3xNYbiVPKw5PtJw/4x6xpk/QCTUn+0D1EF0h3/4ccOEdMJzwLaOvtB+
	 CZb1XB+/4MfNYddRLsqQNAEQT6C4JFJjUyOB0Sjw=
Message-ID: <6c286871-656c-4790-a118-48e897d18839@ideasonboard.com>
Date: Fri, 27 Mar 2026 15:14:59 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] media: i2c: ov13b10: support tps68470 regulator
 and gpio
To: Arun T <arun.t@intel.com>, johannes.goede@oss.qualcomm.com
Cc: sakari.ailus@linux.intel.com, arec.kao@intel.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehdi.djait@intel.com
References: <20260327133905.3509868-1-arun.t@intel.com>
 <20260327133905.3509868-3-arun.t@intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260327133905.3509868-3-arun.t@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57271-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 7CDCE3468D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Arun, thanks for the revision

On 27/03/2026 13:39, Arun T wrote:
> The OV13B10 sensor obtains clock and regulators from the TPS68470 PMIC.
> Add TPS68470 regulator and GPIO names to the sensor power on

The commit message needs updating now really; it's changed since the early version. What it now does 
is switch to using the regulator bulk API to handle three regulators instead of just a single one. 
The GPIO changes are gone so you can skip mentioning them here. I would also not mention the 
TPS68470, as from the sensor driver's point of view it's irrelevant what device provides them. Maybe 
something like:

media: ov13b10: Support multiple regulators

The OV13B10 sensor driver currently handles a single regulator called "avdd", however the sensor can 
be supplied by up to three regulators. Update the driver to handle all of them together using the 
regulator bulk API.

> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>   drivers/media/i2c/ov13b10.c | 47 ++++++++++++++++++++-----------------
>   1 file changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 5421874732bc..4b7b17afb64c 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -3,6 +3,7 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/clk.h>
> +#include <linux/regulator/consumer.h>

Alphabetical ordering please; this should go after pm_runtime.h and before v4l2-ctrls.h

>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
> @@ -699,6 +700,12 @@ static const struct ov13b10_mode supported_2_lanes_modes[] = {
>   	},
>   };
>   
> +static const char * const ov13b10_supply_names[] = {
> +	"dovdd",        /* Digital I/O power */
> +	"avdd",         /* Analog power */
> +	"dvdd",         /* Digital core power */
> +};
> +
>   struct ov13b10 {
>   	struct device *dev;
>   
> @@ -708,7 +715,7 @@ struct ov13b10 {
>   	struct v4l2_ctrl_handler ctrl_handler;
>   
>   	struct clk *img_clk;
> -	struct regulator *avdd;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov13b10_supply_names)];
>   	struct gpio_desc *reset;
>   
>   	/* V4L2 Controls */
> @@ -1194,9 +1201,8 @@ static int ov13b10_power_off(struct device *dev)
>   	struct ov13b10 *ov13b10 = to_ov13b10(sd);
>   
>   	gpiod_set_value_cansleep(ov13b10->reset, 1);
> -
> -	if (ov13b10->avdd)
> -		regulator_disable(ov13b10->avdd);
> +	regulator_bulk_disable(ARRAY_SIZE(ov13b10_supply_names),
> +			       ov13b10->supplies);
>   
>   	clk_disable_unprepare(ov13b10->img_clk);
>   
> @@ -1214,14 +1220,12 @@ static int ov13b10_power_on(struct device *dev)
>   		dev_err(dev, "failed to enable imaging clock: %d", ret);
>   		return ret;
>   	}
> -
> -	if (ov13b10->avdd) {
> -		ret = regulator_enable(ov13b10->avdd);
> -		if (ret < 0) {
> -			dev_err(dev, "failed to enable avdd: %d", ret);
> -			clk_disable_unprepare(ov13b10->img_clk);
> -			return ret;
> -		}
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov13b10_supply_names),
> +				    ov13b10->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		clk_disable_unprepare(ov13b10->img_clk);
> +		return ret;
>   	}
>   
>   	gpiod_set_value_cansleep(ov13b10->reset, 0);
> @@ -1475,7 +1479,8 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>   	unsigned long freq;
>   	int ret;
>   
> -	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
> +	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset",
> +					       GPIOD_OUT_LOW);

I think you can just drop this change.

Thanks
Dan

>   	if (IS_ERR(ov13b->reset))
>   		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->reset),
>   				     "failed to get reset gpio\n");
> @@ -1491,15 +1496,15 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>   				     "external clock %lu is not supported\n",
>   				     freq);
>   
> -	ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");
> -	if (IS_ERR(ov13b->avdd)) {
> -		ret = PTR_ERR(ov13b->avdd);
> -		ov13b->avdd = NULL;
> -		if (ret != -ENODEV)
> -			return dev_err_probe(ov13b->dev, ret,
> -					     "failed to get avdd regulator\n");
> -	}
> +	for (unsigned int i = 0; i < ARRAY_SIZE(ov13b10_supply_names); i++)
> +		ov13b->supplies[i].supply = ov13b10_supply_names[i];
>   
> +	ret = devm_regulator_bulk_get(ov13b->dev,
> +				      ARRAY_SIZE(ov13b10_supply_names),
> +				      ov13b->supplies);
> +	if (ret)
> +		return dev_err_probe(ov13b->dev, ret,
> +				     "failed to get regulators\n");
>   	return 0;
>   }
>   


