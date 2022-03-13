Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1CD4D75E6
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 15:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbiCMOho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 10:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234647AbiCMOhn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 10:37:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EFA111092
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 07:36:35 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D183475;
        Sun, 13 Mar 2022 15:36:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647182194;
        bh=/oJLkdUPJoByl4T19Vgu8mo2ISYmU5WDbKNM0+TDSpo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KYDgrYhrsBFFezB6p92iJRa/J3AowNuyz0yPPpfsZM1N6MaRZod2ocg3TV78Cbd9S
         AKoTIv/j+/2sFdE6O12rm6TV4DLtvzZcVceRvLu4oKAnpQ7OxYlDZXikX4TonUBE+t
         tBlc47UwRZr9u3mCElsUkQUGzle4xe/P6Ywa75D0=
Date:   Sun, 13 Mar 2022 16:36:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 4/6] media: i2c: ov5670: Probe GPIOs
Message-ID: <Yi4BYeVvF3/TSbP2@pendragon.ideasonboard.com>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220310130829.96001-5-jacopo@jmondi.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Mar 10, 2022 at 02:08:27PM +0100, Jacopo Mondi wrote:
> The OV5670 has a powerdown and reset pin, named respectively "PWDN" and
> "XSHUTDOWN".
> 
> Optionally probe the gpios connected to the pins during the driver probe
> routine.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov5670.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index cba310aec011..ca5191d043ce 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -1842,6 +1842,10 @@ struct ov5670 {
>  	/* Regulators */
>  	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
>  
> +	/* Power-down and reset gpios. */
> +	struct gpio_desc *pwdn_gpio; /* PWDNB pin. */
> +	struct gpio_desc *reset_gpio; /* XSHUTDOWN pin. */
> +
>  	/* To serialize asynchronus callbacks */
>  	struct mutex mutex;
>  
> @@ -2494,6 +2498,23 @@ static int ov5670_regulators_probe(struct ov5670 *ov5670)
>  				       ov5670->supplies);
>  }
>  
> +static int ov5670_gpio_probe(struct ov5670 *ov5670)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
> +
> +	ov5670->pwdn_gpio = devm_gpiod_get_optional(&client->dev, "pwdn",
> +						    GPIOD_OUT_LOW);
> +	if (IS_ERR(ov5670->pwdn_gpio))
> +		return PTR_ERR(ov5670->pwdn_gpio);
> +
> +	ov5670->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_LOW);
> +	if (IS_ERR(ov5670->reset_gpio))
> +		return PTR_ERR(ov5670->reset_gpio);
> +
> +	return 0;
> +}
> +
>  static int ov5670_probe(struct i2c_client *client)
>  {
>  	struct ov5670 *ov5670;
> @@ -2522,6 +2543,12 @@ static int ov5670_probe(struct i2c_client *client)
>  		goto error_print;
>  	}
>  
> +	ret = ov5670_gpio_probe(ov5670);
> +	if (ret) {
> +		err_msg = "GPIO probe failed";
> +		goto error_print;
> +	}
> +
>  	full_power = acpi_dev_state_d0(&client->dev);
>  	if (full_power) {
>  		/* Check module identity */

-- 
Regards,

Laurent Pinchart
