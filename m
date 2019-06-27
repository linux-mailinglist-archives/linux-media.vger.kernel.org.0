Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F8F5870A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 18:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfF0Q16 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 12:27:58 -0400
Received: from retiisi.org.uk ([95.216.213.190]:52760 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726315AbfF0Q15 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 12:27:57 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 4153B634C7D;
        Thu, 27 Jun 2019 19:27:43 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hgXFO-0000bP-I7; Thu, 27 Jun 2019 19:27:42 +0300
Date:   Thu, 27 Jun 2019 19:27:42 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        todor.tomov@linaro.org, ezequiel@collabora.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] media: ov5645: Use regulator_bulk() functions
Message-ID: <20190627162742.t2ehnbrqaorv7v6v@valkosipuli.retiisi.org.uk>
References: <20190626235614.26587-1-festevam@gmail.com>
 <20190626235614.26587-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626235614.26587-2-festevam@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Wed, Jun 26, 2019 at 08:56:14PM -0300, Fabio Estevam wrote:
> The code can be simplified by using the regulator_bulk() functions,
> so switch to it.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/media/i2c/ov5645.c | 94 +++++++++-----------------------------
>  1 file changed, 21 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 4e302dc15177..a37ae5d5ff12 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -58,6 +58,15 @@
>  #define OV5645_SDE_SAT_U		0x5583
>  #define OV5645_SDE_SAT_V		0x5584
>  
> +/* regulator supplies */
> +static const char * const ov5645_supply_name[] = {
> +	"vdddo", /* Digital I/O (1.8V) supply */
> +	"vddd",  /* Digital Core (1.5V) supply */
> +	"vdda",  /* Analog (2.8V) supply */
> +};
> +
> +#define OV5645_NUM_SUPPLIES ARRAY_SIZE(ov5645_supply_name)
> +
>  struct reg_value {
>  	u16 reg;
>  	u8 val;
> @@ -82,9 +91,7 @@ struct ov5645 {
>  	struct v4l2_rect crop;
>  	struct clk *xclk;
>  
> -	struct regulator *io_regulator;
> -	struct regulator *core_regulator;
> -	struct regulator *analog_regulator;
> +	struct regulator_bulk_data supplies[OV5645_NUM_SUPPLIES];
>  
>  	const struct ov5645_mode_info *current_mode;
>  
> @@ -529,55 +536,6 @@ static const struct ov5645_mode_info ov5645_mode_info_data[] = {
>  	},
>  };
>  
> -static int ov5645_regulators_enable(struct ov5645 *ov5645)
> -{
> -	int ret;
> -
> -	ret = regulator_enable(ov5645->io_regulator);
> -	if (ret < 0) {
> -		dev_err(ov5645->dev, "set io voltage failed\n");
> -		return ret;
> -	}
> -
> -	ret = regulator_enable(ov5645->analog_regulator);
> -	if (ret) {
> -		dev_err(ov5645->dev, "set analog voltage failed\n");
> -		goto err_disable_io;
> -	}
> -
> -	ret = regulator_enable(ov5645->core_regulator);
> -	if (ret) {
> -		dev_err(ov5645->dev, "set core voltage failed\n");
> -		goto err_disable_analog;
> -	}

This appears to change the order in which the regulators are enabled. Is
that intentional? Does the sensor support this order as well?

> -
> -	return 0;
> -
> -err_disable_analog:
> -	regulator_disable(ov5645->analog_regulator);
> -err_disable_io:
> -	regulator_disable(ov5645->io_regulator);
> -
> -	return ret;
> -}
> -
> -static void ov5645_regulators_disable(struct ov5645 *ov5645)
> -{
> -	int ret;
> -
> -	ret = regulator_disable(ov5645->core_regulator);
> -	if (ret < 0)
> -		dev_err(ov5645->dev, "core regulator disable failed\n");
> -
> -	ret = regulator_disable(ov5645->analog_regulator);
> -	if (ret < 0)
> -		dev_err(ov5645->dev, "analog regulator disable failed\n");
> -
> -	ret = regulator_disable(ov5645->io_regulator);
> -	if (ret < 0)
> -		dev_err(ov5645->dev, "io regulator disable failed\n");
> -}
> -
>  static int ov5645_write_reg(struct ov5645 *ov5645, u16 reg, u8 val)
>  {
>  	u8 regbuf[3];
> @@ -676,15 +634,14 @@ static int ov5645_set_power_on(struct ov5645 *ov5645)
>  {
>  	int ret;
>  
> -	ret = ov5645_regulators_enable(ov5645);
> -	if (ret < 0) {
> +	ret = regulator_bulk_enable(OV5645_NUM_SUPPLIES, ov5645->supplies);
> +	if (ret < 0)
>  		return ret;
> -	}
>  
>  	ret = clk_prepare_enable(ov5645->xclk);
>  	if (ret < 0) {
>  		dev_err(ov5645->dev, "clk prepare enable failed\n");
> -		ov5645_regulators_disable(ov5645);
> +		regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
>  		return ret;
>  	}
>  
> @@ -704,7 +661,7 @@ static void ov5645_set_power_off(struct ov5645 *ov5645)
>  	gpiod_set_value_cansleep(ov5645->rst_gpio, 1);
>  	gpiod_set_value_cansleep(ov5645->enable_gpio, 0);
>  	clk_disable_unprepare(ov5645->xclk);
> -	ov5645_regulators_disable(ov5645);
> +	regulator_bulk_disable(OV5645_NUM_SUPPLIES, ov5645->supplies);
>  }
>  
>  static int ov5645_s_power(struct v4l2_subdev *sd, int on)
> @@ -1089,6 +1046,7 @@ static int ov5645_probe(struct i2c_client *client,
>  	struct device_node *endpoint;
>  	struct ov5645 *ov5645;
>  	u8 chip_id_high, chip_id_low;
> +	unsigned int i;
>  	u32 xclk_freq;
>  	int ret;
>  
> @@ -1146,23 +1104,13 @@ static int ov5645_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> -	ov5645->io_regulator = devm_regulator_get(dev, "vdddo");
> -	if (IS_ERR(ov5645->io_regulator)) {
> -		dev_err(dev, "cannot get io regulator\n");
> -		return PTR_ERR(ov5645->io_regulator);
> -	}
> -
> -	ov5645->core_regulator = devm_regulator_get(dev, "vddd");
> -	if (IS_ERR(ov5645->core_regulator)) {
> -		dev_err(dev, "cannot get core regulator\n");
> -		return PTR_ERR(ov5645->core_regulator);
> -	}
> +	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
> +		ov5645->supplies[i].supply = ov5645_supply_name[i];
>  
> -	ov5645->analog_regulator = devm_regulator_get(dev, "vdda");
> -	if (IS_ERR(ov5645->analog_regulator)) {
> -		dev_err(dev, "cannot get analog regulator\n");
> -		return PTR_ERR(ov5645->analog_regulator);
> -	}
> +	ret = devm_regulator_bulk_get(dev, OV5645_NUM_SUPPLIES,
> +				      ov5645->supplies);
> +	if (ret < 0)
> +		return ret;
>  
>  	ov5645->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
>  	if (IS_ERR(ov5645->enable_gpio)) {

-- 
Regards,

Sakari Ailus
