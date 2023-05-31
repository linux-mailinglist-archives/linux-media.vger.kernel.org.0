Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC8C77185C9
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 17:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjEaPLn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 11:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjEaPLm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 11:11:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B56398;
        Wed, 31 May 2023 08:11:41 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07B5D844;
        Wed, 31 May 2023 17:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685545879;
        bh=2erwBLSNvjq5RTLDHj3pdKLpmajzY7di3aYquz7xyk4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zx7MGUJxDybYML60jM/CLl4KzZ3D8j1NvDV2OeKHzieryZgkAYGOUUHnUi5xYxswc
         MZVf4GBP2KRZ3pJ/Dk48pOjmzFyy4a0Cky4DsBkeUqYS8OX4BOtE20eSPqKA5Zk1md
         SjDEoZ9bjI6/2ZyAmoCjXbPfZm1JEGsmIOJHdHnA=
Date:   Wed, 31 May 2023 17:11:38 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 05/21] media: i2c: imx258: Add regulator control
Message-ID: <6s6fafip54y5er63qy6ac3wp5gnvryczxz5sxtvyy3ctxla5bk@okfxvbuenvla>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-6-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-6-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Tue, May 30, 2023 at 06:29:44PM +0100, Dave Stevenson wrote:
> The device tree bindings define the relevant regulators for the
> sensor, so update the driver to request the regulators and control
> them at the appropriate times.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 42 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index b695fd987b71..30bae7388c3a 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -7,6 +7,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -507,6 +508,16 @@ static const char * const imx258_test_pattern_menu[] = {
>  	"Pseudorandom Sequence (PN9)",
>  };
>
> +/* regulator supplies */
> +static const char * const imx258_supply_name[] = {
> +	/* Supplies can be enabled in any order */
> +	"vana",  /* Analog (2.8V) supply */
> +	"vdig",  /* Digital Core (1.2V) supply */
> +	"vif",  /* IF (1.8V) supply */
> +};
> +
> +#define IMX258_NUM_SUPPLIES ARRAY_SIZE(imx258_supply_name)
> +
>  /* Configurations for supported link frequencies */
>  #define IMX258_LINK_FREQ_634MHZ	633600000ULL
>  #define IMX258_LINK_FREQ_320MHZ	320000000ULL
> @@ -614,6 +625,7 @@ struct imx258 {
>  	bool streaming;
>
>  	struct clk *clk;
> +	struct regulator_bulk_data supplies[IMX258_NUM_SUPPLIES];
>  };
>
>  static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
> @@ -999,9 +1011,19 @@ static int imx258_power_on(struct device *dev)
>  	struct imx258 *imx258 = to_imx258(sd);
>  	int ret;
>
> +	ret = regulator_bulk_enable(IMX258_NUM_SUPPLIES,
> +				    imx258->supplies);
> +	if (ret) {
> +		dev_err(dev, "%s: failed to enable regulators\n",
> +			__func__);
> +		return ret;
> +	}
> +
>  	ret = clk_prepare_enable(imx258->clk);
> -	if (ret)
> +	if (ret) {
>  		dev_err(dev, "failed to enable clock\n");
> +		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> +	}
>
>  	return ret;
>  }
> @@ -1012,6 +1034,7 @@ static int imx258_power_off(struct device *dev)
>  	struct imx258 *imx258 = to_imx258(sd);
>
>  	clk_disable_unprepare(imx258->clk);
> +	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>
>  	return 0;
>  }
> @@ -1260,6 +1283,19 @@ static void imx258_free_controls(struct imx258 *imx258)
>  	mutex_destroy(&imx258->mutex);
>  }
>
> +static int imx258_get_regulators(struct imx258 *imx258,
> +				 struct i2c_client *client)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < IMX258_NUM_SUPPLIES; i++)
> +		imx258->supplies[i].supply = imx258_supply_name[i];
> +
> +	return devm_regulator_bulk_get(&client->dev,
> +				       IMX258_NUM_SUPPLIES,
> +				       imx258->supplies);

nit: fits on 2 lines

> +}
> +
>  static int imx258_probe(struct i2c_client *client)
>  {
>  	struct imx258 *imx258;
> @@ -1270,6 +1306,10 @@ static int imx258_probe(struct i2c_client *client)
>  	if (!imx258)
>  		return -ENOMEM;
>
> +	ret = imx258_get_regulators(imx258, client);
> +	if (ret)
> +		return ret;

Is dev_err_probe() useful here ?

> +
>  	imx258->clk = devm_clk_get_optional(&client->dev, NULL);
>  	if (IS_ERR(imx258->clk))
>  		return dev_err_probe(&client->dev, PTR_ERR(imx258->clk),
> --
> 2.25.1
>
