Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B09E500E3C
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 15:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237154AbiDNNDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 09:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243733AbiDNNC5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 09:02:57 -0400
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA69B554B4
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 06:00:32 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 5B412203F3;
        Thu, 14 Apr 2022 16:00:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1649941229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kFwz5Msio1cTMEEDJvRcVry3FCU+gyhC2xRJtFNKA4Y=;
        b=mu6FJwnwVKvW18DChQXaYK1PG8zI10uhR0UeCf7xksk0POOvi1kY5CDDeO36u3zw++rehX
        qOi3KbUlNBQXDVQRp9EWR7G8eErtCDbrpXh4S8M7m8gV//KRwQU7QMR2oNkOijriAfZ9+m
        hpIJttgmK1Imqhukpho/2dSkkiPlRqk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C9621634C91;
        Thu, 14 Apr 2022 16:00:28 +0300 (EEST)
Date:   Thu, 14 Apr 2022 16:00:28 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robert.foss@linaro.org, hfink@snap.com,
        jgrahsl@snap.com, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v3 2/2] media: i2c: imx412: Add bulk regulator support
Message-ID: <Ylga7FVsbK6znD/+@valkosipuli.retiisi.eu>
References: <20220414124505.1329295-1-bryan.odonoghue@linaro.org>
 <20220414124505.1329295-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414124505.1329295-3-bryan.odonoghue@linaro.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1649941229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kFwz5Msio1cTMEEDJvRcVry3FCU+gyhC2xRJtFNKA4Y=;
        b=rU8S5VqeBosql2BMlpLAW1KE35ZdSg2+aXnphL9ODcHcQXT/0KiV9QIAoWv6RLjBPf+4T0
        e2gEh32ijQCIg0tBxBjwyycppleo3bFAvBULOIzSdUJ918zmURmkq3FS1hOAdScbcLRSVB
        HMYzQjq82jEW7ys6ZP0G1pHzhUl+oNQ=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1649941229; a=rsa-sha256; cv=none;
        b=ddqmKll5gbtfmdQ5zZ+t5ySsagFhY/Ze33BgdWUhkVhJCPJRwPqL3PRRjZlMHGEcoR8zZ2
        /se1aUoYeGV7TVhMA7eyMDD8ma3O6yQ4SBhbMVv3XQKmywLTKVhSqQOb1ZcDfxctCLk/RP
        k0Cc0pTFITXgaTGVOsYWThYqHvRdgnA=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Brian,

Thanks for the update. A few minor matters below...

On Thu, Apr 14, 2022 at 01:45:05PM +0100, Bryan O'Donoghue wrote:
> Depending on the platform we may need to enable and disable three separate
> regulators for the imx412.
> 
> - DOVDD
> Digital I/O power
> 
> - AVDD
> Analog power
> 
> - DVDD
> Digital core power
> 
> The addition of these regulators shouldn't affect existing users using
> fixed-on/firmware-controlled regulators.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/i2c/imx412.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index be3f6ea55559..27170e641b53 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -11,6 +11,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
> @@ -101,6 +102,12 @@ struct imx412_mode {
>  	struct imx412_reg_list reg_list;
>  };
>  
> +static const char * const imx412_supply_names[] = {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};
> +
>  /**
>   * struct imx412 - imx412 sensor device structure
>   * @dev: Pointer to generic device
> @@ -128,6 +135,8 @@ struct imx412 {
>  	struct media_pad pad;
>  	struct gpio_desc *reset_gpio;
>  	struct clk *inclk;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(imx412_supply_names)];
> +	unsigned int num_supplies;
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *link_freq_ctrl;
>  	struct v4l2_ctrl *pclk_ctrl;
> @@ -946,6 +955,16 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
>  		return -EINVAL;
>  	}
>  
> +	/* Get optional DT defined regulators */
> +	imx412->num_supplies = ARRAY_SIZE(imx412_supply_names);
> +	for (i = 0; i < imx412->num_supplies; i++)
> +		imx412->supplies[i].supply = imx412_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(imx412->dev, imx412->num_supplies,
> +				      imx412->supplies);
> +	if (ret)
> +		return ret;
> +
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>  	if (!ep)
>  		return -ENXIO;
> @@ -1011,10 +1030,19 @@ static int imx412_power_on(struct device *dev)
>  	struct imx412 *imx412 = to_imx412(sd);
>  	int ret;
>  
> +	ret = regulator_bulk_enable(imx412->num_supplies,
> +				    imx412->supplies);

Fits on the same line.

> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
>  	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
>  
>  	ret = clk_prepare_enable(imx412->inclk);
>  	if (ret) {
> +		regulator_bulk_disable(imx412->num_supplies,
> +				       imx412->supplies);

As the function already has an error handling section using labels, this
should go there as well.

>  		dev_err(imx412->dev, "fail to enable inclk");
>  		goto error_reset;
>  	}
> @@ -1044,6 +1072,9 @@ static int imx412_power_off(struct device *dev)
>  
>  	clk_disable_unprepare(imx412->inclk);
>  
> +	regulator_bulk_disable(imx412->num_supplies,
> +			       imx412->supplies);

Fits on the same line.

> +
>  	return 0;
>  }
>  

-- 
Sakari Ailus
