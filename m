Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75286502C63
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 17:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354879AbiDOPO4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 11:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354869AbiDOPOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 11:14:55 -0400
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2E0AACB5;
        Fri, 15 Apr 2022 08:12:25 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 9C41D20007;
        Fri, 15 Apr 2022 15:12:19 +0000 (UTC)
Date:   Fri, 15 Apr 2022 17:12:17 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v5 4/4] media: i2c: imx412: Add bulk regulator support
Message-ID: <20220415151217.syr3vtmtsrwoelol@uno.localdomain>
References: <20220415115954.1649217-1-bryan.odonoghue@linaro.org>
 <20220415115954.1649217-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220415115954.1649217-5-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Bryan

On Fri, Apr 15, 2022 at 12:59:54PM +0100, Bryan O'Donoghue wrote:
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

Thanks
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Cheers
   j

> ---
>  drivers/media/i2c/imx412.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 84279a680873..1795a6180d60 100644
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
> @@ -128,6 +135,7 @@ struct imx412 {
>  	struct media_pad pad;
>  	struct gpio_desc *reset_gpio;
>  	struct clk *inclk;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(imx412_supply_names)];
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *link_freq_ctrl;
>  	struct v4l2_ctrl *pclk_ctrl;
> @@ -946,6 +954,16 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
>  		return -EINVAL;
>  	}
>
> +	/* Get optional DT defined regulators */
> +	for (i = 0; i < ARRAY_SIZE(imx412_supply_names); i++)
> +		imx412->supplies[i].supply = imx412_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(imx412->dev,
> +				      ARRAY_SIZE(imx412_supply_names),
> +				      imx412->supplies);
> +	if (ret)
> +		return ret;
> +
>  	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>  	if (!ep)
>  		return -ENXIO;
> @@ -1011,6 +1029,13 @@ static int imx412_power_on(struct device *dev)
>  	struct imx412 *imx412 = to_imx412(sd);
>  	int ret;
>
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx412_supply_names),
> +				    imx412->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
>  	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
>
>  	ret = clk_prepare_enable(imx412->inclk);
> @@ -1025,6 +1050,8 @@ static int imx412_power_on(struct device *dev)
>
>  error_reset:
>  	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
> +			       imx412->supplies);
>
>  	return ret;
>  }
> @@ -1044,6 +1071,9 @@ static int imx412_power_off(struct device *dev)
>
>  	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
>
> +	regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
> +			       imx412->supplies);
> +
>  	return 0;
>  }
>
> --
> 2.35.1
>
