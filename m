Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2A1500921
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 11:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241442AbiDNJEc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 05:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241861AbiDNJEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 05:04:10 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE0C6C1C8;
        Thu, 14 Apr 2022 02:01:43 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 6FFA92008B;
        Thu, 14 Apr 2022 12:01:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1649926900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=idRDYG7j6wMRNuATuHnpnG/Sptc3vRd5VhKEifdUNE8=;
        b=K1bYOElJEWrhJFbeyb8fkrqCwDE89asINkQQv7j0Gt4ay/uGCFox1lKJJVWZFp0LmOlEbm
        /m4lnlYDGMLwq1ykalnEYW/O3UqBRqUwGntHcDsTgDRQsz6bhPywIVhsLtpAeKW/RNbvhq
        TVfngc2eqSApuBzqw+s+Q2QWXv6RBvk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9EE5F634C91;
        Thu, 14 Apr 2022 12:01:38 +0300 (EEST)
Date:   Thu, 14 Apr 2022 12:01:38 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robert.foss@linaro.org, hfink@snap.com,
        jgrahsl@snap.com, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v2 2/2] media: i2c: imx412: Add bulk regulator support
Message-ID: <Ylfi8ra54GCl6qd+@valkosipuli.retiisi.eu>
References: <20220411013131.3553098-1-bryan.odonoghue@linaro.org>
 <20220411013131.3553098-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411013131.3553098-3-bryan.odonoghue@linaro.org>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1649926900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=idRDYG7j6wMRNuATuHnpnG/Sptc3vRd5VhKEifdUNE8=;
        b=ryabw/Evbw1WAgFaXt3/1vrAtjJwHdHDg2bEW6OPC8Npzqx2T4ZVSQExmFvka87fw1JHsU
        cEsZrRhHmFUrllT9mRlO0bbuC1IhQ1oz9IDCEHmX93wp6JH/ughhNsETUvflD44+taYseX
        ze+IYdTFD7kWWsjB3aVKqnqhnf4iRAc=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1649926900; a=rsa-sha256; cv=none;
        b=oImgpLbkxD35k7rqA0YvTY5qmocwKrsx7+SIohR2OBD3glHOufihG+Mm0/lK3AWqwHRGCS
        tSK/1aSxVqC9O9ipJQmK+RIlVd94SbL2s67Uuxo+tlm9TjJS/arDkApWEXSHJuohwMSZka
        3M4c1ojV33mPm0WoRws02YAJ2UH4P4U=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bryan,

Thanks for the patch.

On Mon, Apr 11, 2022 at 02:31:31AM +0100, Bryan O'Donoghue wrote:
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
>  drivers/media/i2c/imx412.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index be3f6ea55559..44b92718b6cf 100644
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
> +	int num_supplies;

unsigned int

>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *link_freq_ctrl;
>  	struct v4l2_ctrl *pclk_ctrl;
> @@ -946,6 +955,17 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
>  		return -EINVAL;
>  	}
>  
> +	/* Get optional DT defined regulators */
> +	imx412->num_supplies = ARRAY_SIZE(imx412_supply_names);
> +	for (i = 0; i < imx412->num_supplies; i++)
> +		imx412->supplies[i].supply = imx412_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(imx412->dev,
> +				      imx412->num_supplies,

Fits on previous line.

> +				      imx412->supplies);
> +	if (ret)
> +		return ret;
> +
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>  	if (!ep)
>  		return -ENXIO;
> @@ -1011,6 +1031,13 @@ static int imx412_power_on(struct device *dev)
>  	struct imx412 *imx412 = to_imx412(sd);
>  	int ret;
>  
> +	ret = regulator_bulk_enable(imx412->num_supplies,
> +				    imx412->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		goto error_reset;

You can return here, without touching the GPIO.

> +	}
> +
>  	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
>  
>  	ret = clk_prepare_enable(imx412->inclk);

Please do disable the regulators if clk_prepare_enable() fails.

> @@ -1044,6 +1071,9 @@ static int imx412_power_off(struct device *dev)
>  
>  	clk_disable_unprepare(imx412->inclk);
>  
> +	regulator_bulk_disable(imx412->num_supplies,
> +			       imx412->supplies);
> +
>  	return 0;
>  }
>  

-- 
Kind regards,

Sakari Ailus
