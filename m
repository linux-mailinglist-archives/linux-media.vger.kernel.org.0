Return-Path: <linux-media+bounces-54011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P93GvxPpGmDdQUAu9opvQ
	(envelope-from <linux-media+bounces-54011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 15:41:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F81D03D5
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 15:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1B30301A921
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 14:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF2C32D0CC;
	Sun,  1 Mar 2026 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Oddi+EJV"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F886181334;
	Sun,  1 Mar 2026 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772376049; cv=pass; b=pWIVg5cu4fRX92b4s5Ou12/HmMd3vUMsGE+hxURrsnmjjhQyUyZNGvza2XC0H61wgqontagal6EKs7jplDFKy/vJhZXPLKN4XBLYNW9XlyxuZS4jhRA6WjFP01FkqciD4qaURwDlQECJd7hm+4Z09wcReX2+VIqrQrcHRQ4V6H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772376049; c=relaxed/simple;
	bh=hDq2Z3S4l/uLjkFrW43kIKVTo8Qx8aOZU/HNUj/wL+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7ftK+ww9Jjg0Z1lJiBIHuY6yICv/rIB6CsV9PjadCyDHny0ZdkvYpONOvAOiel8FLzzsEkBe3iO3hrwYQ3wYwwXwq5gL05PAtPnNW6mXzZfSdXZgv4/N4XclMkHqfKoj5xLnxttCY0uusGWFjrv0oX4EAQL9xRauIl6ty0riBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Oddi+EJV; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4fP4Vh1kw5z49Pxf;
	Sun, 01 Mar 2026 16:40:44 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1772376044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XcNvIsc33i89i8jfh7osFVbIilPJYX0/arFi5M0mSvo=;
	b=Oddi+EJVGovQxpYgwgC56b/Yw3DoFupvfgr3932BH/7jtoLqhAyoXbx9u/ziA59ZtoVCyO
	oaF27i/PKVLsyTHNCtUfesVW+3gcMV2gmFpW7RflVFY6T6VJv5nsziIsHATAWSmF0VP3sU
	stQo8McYUGtUIGRxYC78R0PX738OoTcD3/lhzzDc/54XsyuwbhbkfDazwPEIVi5emQX63N
	ax6HlQjMX2HSGUFEkg3i84IZsLTc52mtdJDC7Kp1WBooeMpT/wOoLNEr0mjGOdUU8dNIBe
	G7t17TWLyo+4WFEig4aydIki8qLPwj/qffXOQV/WBLIv9tM706iggJhBJoUJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1772376044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XcNvIsc33i89i8jfh7osFVbIilPJYX0/arFi5M0mSvo=;
	b=TTJ+J9ps303qXHCAPXuPMVkl4pLOzDJJq7Hfo01eoxZeWOx7pVazl3Kpa+uaamO6VzyB9n
	/TwEYrGiQdr71zIN31piyw2GAdbdy/WUiaGsIGL4HGe7A/EXMzgn9mjbLoUukk5r2nxESl
	vo6L2HzLU7ZfDeXibhw1eerOvYbWRw5Zc4X9tWchjGp7hJHBFaDjWfdIqmapsxZZEJApYP
	fNSepesawm6DZDhIW/MdwPmF/t2J8CoG7ibDwOXLiTKcjWnZOj8IaYCbDLPRmhJ/XAhZ6B
	49MAzyBZIiJgwR71bA03vPvPPqkYBnbHVpg66gQWeNKvdhttqEF0D3sA2aPRfw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1772376044;
	b=Sl63egrukFAoL2JSk0oJY9Fe66mmAm0PS/uc5uqMkBVVXCDh6MhSEroSLy8TJO+/m4Nfbv
	z9k8AkR0IGpiYw/56JOPa+lQsPMhOENNxj3ZJqVMDexPKOZct7fOd8S0CieLMkehK/iT9O
	BhRuENq19qPyXpVZIe6piE7MK1yvpeYU8N73ZqTvQJfkhFPL+HNI8GMwp2/ca8g10zwj6+
	/BeuCbAKYPwmeTPrOtqApeW41f2cUcksmTTYCjTMmqV06WHYN+cobglB/ChIXPlTXiBJt2
	jn/s3N/zA/DGAMGvB+ZNtEVYbfCVRHFisbacDCqCMRe6DU2ULBKOSl6W4FJTAw==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id ED6FC634C50;
	Sun, 01 Mar 2026 16:40:43 +0200 (EET)
Date: Sun, 1 Mar 2026 16:40:43 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Arun T <arun.t@intel.com>
Cc: mehdi.djait@linux.intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: ov13b10: Support tps68470 regulator
 and gpio
Message-ID: <aaRP66mojNIsNCiR@valkosipuli.retiisi.eu>
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260227133542.970820-1-arun.t@intel.com>
 <20260227133542.970820-3-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227133542.970820-3-arun.t@intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	TAGGED_FROM(0.00)[bounces-54011-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valkosipuli.retiisi.eu:mid,iki.fi:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: B53F81D03D5
X-Rspamd-Action: no action

Hi Arun,

On Fri, Feb 27, 2026 at 07:05:42PM +0530, Arun T wrote:
> Ov13b10 sensor get clock and regulator from TPS68470 PMIC.
> Added tps68470 regulator/gpio names in power_on

Sentences end in a period. Also rewrap this one.

> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>  drivers/media/i2c/ov13b10.c | 47 ++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 5421874732bc..228ffe5ada70 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -11,6 +11,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> +#include <linux/regulator/consumer.h>

Please arrange alphabetically.

>  
>  #define OV13B10_REG_VALUE_08BIT		1
>  #define OV13B10_REG_VALUE_16BIT		2
> @@ -699,6 +700,13 @@ static const struct ov13b10_mode supported_2_lanes_modes[] = {
>  	},
>  };
>  
> +static const char * const ov13b10_supply_names[] = {
> +	"dovdd",        /* Digital I/O power */
> +	"avdd",         /* Analog power */
> +	"dvdd",         /* Digital core power */
> +};
> +

Extra newline.

> +
>  struct ov13b10 {
>  	struct device *dev;
>  
> @@ -708,7 +716,7 @@ struct ov13b10 {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  
>  	struct clk *img_clk;
> -	struct regulator *avdd;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov13b10_supply_names)];
>  	struct gpio_desc *reset;
>  
>  	/* V4L2 Controls */
> @@ -1194,9 +1202,8 @@ static int ov13b10_power_off(struct device *dev)
>  	struct ov13b10 *ov13b10 = to_ov13b10(sd);
>  
>  	gpiod_set_value_cansleep(ov13b10->reset, 1);
> -
> -	if (ov13b10->avdd)
> -		regulator_disable(ov13b10->avdd);
> +	regulator_bulk_disable(ARRAY_SIZE(ov13b10_supply_names),
> +					ov13b10->supplies);
>  
>  	clk_disable_unprepare(ov13b10->img_clk);
>  
> @@ -1214,14 +1221,12 @@ static int ov13b10_power_on(struct device *dev)
>  		dev_err(dev, "failed to enable imaging clock: %d", ret);
>  		return ret;
>  	}
> -
> -	if (ov13b10->avdd) {
> -		ret = regulator_enable(ov13b10->avdd);
> -		if (ret < 0) {
> -			dev_err(dev, "failed to enable avdd: %d", ret);
> -			clk_disable_unprepare(ov13b10->img_clk);
> -			return ret;
> -		}
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov13b10_supply_names),
> +					ov13b10->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		clk_disable_unprepare(ov13b10->img_clk);
> +		return ret;
>  	}
>  
>  	gpiod_set_value_cansleep(ov13b10->reset, 0);
> @@ -1473,7 +1478,7 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
>  static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>  {
>  	unsigned long freq;
> -	int ret;
> +	int ret, i;

unsigned int, please, and you can declare this just for the loop.

>  
>  	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(ov13b->reset))
> @@ -1481,6 +1486,7 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>  				     "failed to get reset gpio\n");
>  
>  	ov13b->img_clk = devm_v4l2_sensor_clk_get(ov13b->dev, NULL);
> +

Unrelated change (and no, I wouldn't do it).

>  	if (IS_ERR(ov13b->img_clk))
>  		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->img_clk),
>  				     "failed to get imaging clock\n");
> @@ -1491,15 +1497,14 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>  				     "external clock %lu is not supported\n",
>  				     freq);
>  
> -	ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");
> -	if (IS_ERR(ov13b->avdd)) {
> -		ret = PTR_ERR(ov13b->avdd);
> -		ov13b->avdd = NULL;
> -		if (ret != -ENODEV)
> -			return dev_err_probe(ov13b->dev, ret,
> -					     "failed to get avdd regulator\n");
> -	}
> +	for (i = 0; i < ARRAY_SIZE(ov13b10_supply_names); i++)
> +		ov13b->supplies[i].supply = ov13b10_supply_names[i];
>  
> +	ret = devm_regulator_bulk_get(ov13b->dev, ARRAY_SIZE(ov13b10_supply_names),
> +					ov13b->supplies);

Indentation.

While at it, could you run

	$ ./scripts/checkpatch.pl --strict --max-line-length=80

on this?

> +	if (ret)
> +		return dev_err_probe(ov13b->dev, ret,
> +				     "failed to get regulators\n");
>  	return 0;
>  }
>  

-- 
Regards,

Sakari Ailus

