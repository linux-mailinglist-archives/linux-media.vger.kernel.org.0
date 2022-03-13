Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC66E4D75E3
	for <lists+linux-media@lfdr.de>; Sun, 13 Mar 2022 15:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbiCMOgl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Mar 2022 10:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbiCMOgk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Mar 2022 10:36:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F8ED7E580
        for <linux-media@vger.kernel.org>; Sun, 13 Mar 2022 07:35:32 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B380475;
        Sun, 13 Mar 2022 15:35:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647182130;
        bh=G8wsS/RtES4Y/zkU55o1qAgpLuFY0fyRo/VRI4jpUIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SWWGCEwM6eB1o6kb+J/GiOnloYk8zWoSb3gdRGK1Wn6Cxq8zQOuhXUESFitm1Em3G
         DHYpmAWCCsOOkT0GDyESX3KX9cuh0CIzGow8cmMJTafTDQGQhropwmxMWDYNujtK4i
         8lsAeXCzgF+ZbbtuTtAUHEbjRMpVhbtf5GYHL57E=
Date:   Sun, 13 Mar 2022 16:35:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 3/6] media: i2c: ov5670: Probe regulators
Message-ID: <Yi4BIk7A8dyObRh8@pendragon.ideasonboard.com>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-4-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220310130829.96001-4-jacopo@jmondi.org>
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

On Thu, Mar 10, 2022 at 02:08:26PM +0100, Jacopo Mondi wrote:
> The OV5670 has three power supplies (AVDD, DOVDD and DVDD).
> 
> Probe them in the driver to prepare controlling with runtime_pm
> operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/i2c/ov5670.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 39786f3c9489..cba310aec011 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> @@ -85,6 +86,14 @@ struct ov5670_link_freq_config {
>  	const struct ov5670_reg_list reg_list;
>  };
>  
> +static const char * const ov5670_supply_names[] = {
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital power */
> +	"dovdd",	/* Digital output power */
> +};
> +
> +#define OV5670_NUM_SUPPLIES ARRAY_SIZE(ov5670_supply_names)
> +
>  struct ov5670_mode {
>  	/* Frame width in pixels */
>  	u32 width;
> @@ -1830,6 +1839,9 @@ struct ov5670 {
>  	/* Current mode */
>  	const struct ov5670_mode *cur_mode;
>  
> +	/* Regulators */
> +	struct regulator_bulk_data supplies[OV5670_NUM_SUPPLIES];
> +
>  	/* To serialize asynchronus callbacks */
>  	struct mutex mutex;
>  
> @@ -2470,6 +2482,18 @@ static const struct v4l2_subdev_internal_ops ov5670_internal_ops = {
>  	.open = ov5670_open,
>  };
>  
> +static int ov5670_regulators_probe(struct ov5670 *ov5670)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
> +	unsigned int i;
> +
> +	for (i = 0; i < OV5670_NUM_SUPPLIES; i++)
> +		ov5670->supplies[i].supply = ov5670_supply_names[i];
> +
> +	return devm_regulator_bulk_get(&client->dev, OV5670_NUM_SUPPLIES,
> +				       ov5670->supplies);
> +}
> +
>  static int ov5670_probe(struct i2c_client *client)
>  {
>  	struct ov5670 *ov5670;
> @@ -2492,6 +2516,12 @@ static int ov5670_probe(struct i2c_client *client)
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
>  
> +	ret = ov5670_regulators_probe(ov5670);
> +	if (ret) {
> +		err_msg = "Regulators probe failed";

That's not common.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		goto error_print;
> +	}
> +
>  	full_power = acpi_dev_state_d0(&client->dev);
>  	if (full_power) {
>  		/* Check module identity */

-- 
Regards,

Laurent Pinchart
