Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A3C501C3B
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 21:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345991AbiDNT4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 15:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234846AbiDNT4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 15:56:22 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E30DA6EC;
        Thu, 14 Apr 2022 12:53:56 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id E891DE0004;
        Thu, 14 Apr 2022 19:53:50 +0000 (UTC)
Date:   Thu, 14 Apr 2022 21:53:48 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org
Subject: Re: [PATCH v4 2/3] media: i2c: imx412: Add bulk regulator support
Message-ID: <20220414195348.xmss6eqf376oaoo3@uno.localdomain>
References: <20220414141108.1365476-1-bryan.odonoghue@linaro.org>
 <20220414141108.1365476-3-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220414141108.1365476-3-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Bryan,

On Thu, Apr 14, 2022 at 03:11:07PM +0100, Bryan O'Donoghue wrote:
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
>  drivers/media/i2c/imx412.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index be3f6ea55559..6d0746d6c634 100644
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
y>  	struct clk *inclk;
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

Just one drive-by comment: is num_supplies needed ?

It seems to be initialized here and never changed. I think you can use
ARRAY_SIZE(imx412_supply_names). Or since the macro is also used to
initialize the 'supplies' array, define a IMX412_NUM_SUPPLIES or
similar.

Thanks
   j

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
> @@ -1011,6 +1030,12 @@ static int imx412_power_on(struct device *dev)
>  	struct imx412 *imx412 = to_imx412(sd);
>  	int ret;
>
> +	ret = regulator_bulk_enable(imx412->num_supplies, imx412->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		return ret;
> +	}
> +
>  	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
>
>  	ret = clk_prepare_enable(imx412->inclk);
> @@ -1025,6 +1050,7 @@ static int imx412_power_on(struct device *dev)
>
>  error_reset:
>  	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
> +	regulator_bulk_disable(imx412->num_supplies, imx412->supplies);
>
>  	return ret;
>  }
> @@ -1044,6 +1070,8 @@ static int imx412_power_off(struct device *dev)
>
>  	clk_disable_unprepare(imx412->inclk);
>
> +	regulator_bulk_disable(imx412->num_supplies, imx412->supplies);
> +
>  	return 0;
>  }
>
> --
> 2.35.1
>
