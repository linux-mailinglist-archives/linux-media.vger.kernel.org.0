Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED68B5776A0
	for <lists+linux-media@lfdr.de>; Sun, 17 Jul 2022 16:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbiGQORP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 10:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbiGQORO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 10:17:14 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A0C1180A;
        Sun, 17 Jul 2022 07:17:12 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 2A1801B00101;
        Sun, 17 Jul 2022 17:17:10 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1658067430;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/kMXMX8oa0OJ7fGnZGI9sxfK1LJJ9gRI8v1eMS+NVeM=;
        b=FNMJPeBmPBR8BFUhJTUe99beI0J7EUtLlY+ZxDSagJDsBaSYt5K3Am7jIxKUw/molVB0HG
        nWb7r4AVQ1GAETeil4yDifEF7++ALBy5c85Ynyg4VM9Tj008wrpEkEhUPZSzT0uByw6Z2o
        2qM/AaetOS+Eaq+wi7x6+X5E3bFPJTjHMm2IxC4W2H+IOfukzCSsou0B6IU3NsCFyAwTVy
        ATwGxI8iAZtgzGq4+8wHaoSUzujahZxI28i18XGH2RaZqB6mTgzpOP7sZ2HpFb58n9eUbD
        s7JeMcdB8gKcOvDFo67KWwyDm4HmH1BBfWYWfo2E017nSLX2s0ocaAJlkc83jw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C0CA7634D5F;
        Sun, 17 Jul 2022 17:17:09 +0300 (EEST)
Date:   Sun, 17 Jul 2022 17:17:09 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: i2c: ov9282: Add regulator support
Message-ID: <YtQZ5TD+pc7lPLI0@valkosipuli.retiisi.eu>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
 <20220715074858.875808-6-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715074858.875808-6-alexander.stein@ew.tq-group.com>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1658067430; a=rsa-sha256;
        cv=none;
        b=g4tD1XaW2nrnr9OnU87Lp5/sZRQZBgCf3jdXju3RS9iTsIaemo+540q4V2W9/uphOobkL8
        vympmPbxKS7f+omCiEzYvGsRW9yGSa5CO3sl0iH9RQ7Gj29MLlcQlsLfV9mmuj6fTtJEzm
        +ZKwRH2Pfe6E8W4E+3aczRpq8CAg/ZJa+9JOCsDXGcPiWlMiICphmrJrK1mgxDrM25Lr1z
        fqXBCmELCAuliH41QYA58B56QkOkkA0q7xMmu4WyHemgDIJk2xYTPHlMep/QVOLz3hNeQF
        onlzFUzXwd3q5rs+aVYSWNld4omgRTzQt4KtGiwPBUnO61L3g9j6zSLwmausVA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1658067430;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/kMXMX8oa0OJ7fGnZGI9sxfK1LJJ9gRI8v1eMS+NVeM=;
        b=E8dj7nnKTVpoW0cox/hkVnrTMiQDprzDQaNwPQyi+LuATwOcEaM+Uy8bnL9ldfS8Y/lCc7
        5+IHdAIFpMXErkDCd64Lw2c+q5YNJJOhGHSsJSmvypm1g57BzykPlJDpL7X5yORk//vV9P
        dIRrBKnSmvIfUD0+bM065Yz+9F0ElexH6urqFdB1lAPu825YS5Qa23Q1V4OFfClIPrPDoB
        AnfRNvsgRovu623ioLEb0JQZ7nTAI69/KzXAmwrhpayPh4gj06r21peVtd0jN+/tXMOrJp
        hMp2ucb4+ASUVOXciYXghtIqBOwjYxrxMSGlCtKqusBm0DfWl/uuqY1fJWK39w==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

Thanks for the set.

On Fri, Jul 15, 2022 at 09:48:57AM +0200, Alexander Stein wrote:
> Need in case the sensors is supplied by a switchable regulator.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Remove error message for failed regulator_bulk_disable()
> * Rename ov9282_configure_regulators to ov9282_get_regulators
> 
>  drivers/media/i2c/ov9282.c | 39 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 04fda8222e07..263cdffc558f 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -11,6 +11,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
> @@ -55,6 +56,14 @@
>  #define OV9282_REG_MIN		0x00
>  #define OV9282_REG_MAX		0xfffff
>  
> +static const char * const ov9282_supply_names[] = {
> +	"avdd",		/* Analog power */
> +	"dovdd",	/* Digital I/O power */
> +	"dvdd",		/* Digital core power */
> +};
> +
> +#define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
> +
>  /**
>   * struct ov9282_reg - ov9282 sensor register
>   * @address: Register address
> @@ -127,6 +136,7 @@ struct ov9282 {
>  	struct media_pad pad;
>  	struct gpio_desc *reset_gpio;
>  	struct clk *inclk;
> +	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *link_freq_ctrl;
>  	struct v4l2_ctrl *pclk_ctrl;
> @@ -883,10 +893,18 @@ static int ov9282_power_on(struct device *dev)
>  		goto error_reset;
>  	}
>  
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov9282->supplies), ov9282->supplies);

Please run the set through:

	./scripts/checkpatch.pl --strict --max-line-length=80

> +	if (ret) {
> +		dev_err(dev, "Failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +
>  	usleep_range(400, 600);
>  
>  	return 0;
>  
> +disable_clk:
> +	clk_disable_unprepare(ov9282->inclk);
>  error_reset:
>  	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
>  
> @@ -903,6 +921,9 @@ static int ov9282_power_off(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov9282 *ov9282 = to_ov9282(sd);
> +	int ret;

ret seems to be unused.

> +
> +	regulator_bulk_disable(ARRAY_SIZE(ov9282->supplies), ov9282->supplies);
>  
>  	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
>  
> @@ -996,6 +1017,18 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  	return 0;
>  }
>  
> +static int ov9282_get_regulators(struct ov9282 *ov9282)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ov9282->supplies); i++)
> +		ov9282->supplies[i].supply = ov9282_supply_names[i];
> +
> +	return devm_regulator_bulk_get(ov9282->dev,
> +				       ARRAY_SIZE(ov9282->supplies),
> +				       ov9282->supplies);
> +}
> +
>  /**
>   * ov9282_probe() - I2C client device binding
>   * @client: pointer to i2c client device
> @@ -1022,6 +1055,12 @@ static int ov9282_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> +	ret = ov9282_get_regulators(ov9282);
> +	if (ret) {
> +		dev_err(&client->dev, "Failed to get power regulators\n");
> +		return ret;
> +	}
> +
>  	mutex_init(&ov9282->mutex);
>  
>  	ret = ov9282_power_on(ov9282->dev);

-- 
Kind regards,

Sakari Ailus
