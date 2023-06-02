Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0887203B2
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235485AbjFBNs3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbjFBNs2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:48:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06481136;
        Fri,  2 Jun 2023 06:48:27 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B682C6E0;
        Fri,  2 Jun 2023 15:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685713682;
        bh=B6GOnRcCCw5xTwx7Uv6bEcueiLBpqZJvUsnrbDrHtzo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HMyvdXAvE/DXWj1T5uei6AdJxxqimyJBudaRsQPPA3vly0gfxPTa3pI1OA2pg6wBQ
         6AgzbLoh5TPS5CGvSBm38O/DpuNkDEQhICCmSvcYM3w7ny9gEvKPJLEZMQZ3q8+BRx
         ujCBEm+QVoIYsV+YD6V5Owey/fz0AfWWRDfT9rng=
Date:   Fri, 2 Jun 2023 15:48:21 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 20/21] media: i2c: imx258: Change register settings for
 variants of the sensor
Message-ID: <zawd5acdiwtrve2k2n7p347uv767htvg73eq356darbdvnppqx@throy5wedcvx>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-21-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-21-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:29:59PM +0100, Dave Stevenson wrote:
> Sony have advised that there are variants of the IMX258 sensor which
> require slightly different register configuration to the mainline
> imx258 driver defaults.
>
> There is no available run-time detection for the variant, so add
> configuration via the DT compatible string.
>
> The Vision Components imx258 module supports PDAF, so add the
> register differences for that variant
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 49 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 986757650378..98b5c1e3abff 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -6,6 +6,7 @@
>  #include <linux/delay.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
> @@ -320,8 +321,6 @@ static const struct imx258_reg mipi_642mbps_24mhz_4l[] = {
>
>  static const struct imx258_reg mode_common_regs[] = {
>  	{ 0x3051, 0x00 },
> -	{ 0x3052, 0x00 },
> -	{ 0x4E21, 0x14 },
>  	{ 0x6B11, 0xCF },
>  	{ 0x7FF0, 0x08 },
>  	{ 0x7FF1, 0x0F },
> @@ -344,7 +343,6 @@ static const struct imx258_reg mode_common_regs[] = {
>  	{ 0x7FA8, 0x03 },
>  	{ 0x7FA9, 0xFE },
>  	{ 0x7B24, 0x81 },
> -	{ 0x7B25, 0x00 },
>  	{ 0x6564, 0x07 },
>  	{ 0x6B0D, 0x41 },
>  	{ 0x653D, 0x04 },
> @@ -459,6 +457,33 @@ static const struct imx258_reg mode_1048_780_regs[] = {
>  	{ 0x034F, 0x0C },
>  };
>
> +struct imx258_variant_cfg {
> +	const struct imx258_reg *regs;
> +	unsigned int num_regs;
> +};
> +
> +static const struct imx258_reg imx258_cfg_regs[] = {
> +	{ 0x3052, 0x00 },
> +	{ 0x4E21, 0x14 },
> +	{ 0x7B25, 0x00 },
> +};
> +
> +static const struct imx258_variant_cfg imx258_cfg = {
> +	.regs = imx258_cfg_regs,
> +	.num_regs = ARRAY_SIZE(imx258_cfg_regs),
> +};
> +
> +static const struct imx258_reg imx258_pdaf_cfg_regs[] = {
> +	{ 0x3052, 0x01 },
> +	{ 0x4E21, 0x10 },
> +	{ 0x7B25, 0x01 },
> +};
> +
> +static const struct imx258_variant_cfg imx258_pdaf_cfg = {
> +	.regs = imx258_pdaf_cfg_regs,
> +	.num_regs = ARRAY_SIZE(imx258_pdaf_cfg_regs),
> +};
> +
>  static const char * const imx258_test_pattern_menu[] = {
>  	"Disabled",
>  	"Solid Colour",
> @@ -643,6 +668,8 @@ struct imx258 {
>  	struct v4l2_subdev sd;
>  	struct media_pad pad;
>
> +	const struct imx258_variant_cfg *variant_cfg;
> +
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	/* V4L2 Controls */
>  	struct v4l2_ctrl *link_freq;
> @@ -1134,6 +1161,14 @@ static int imx258_start_streaming(struct imx258 *imx258)
>  		return ret;
>  	}
>
> +	ret = imx258_write_regs(imx258, imx258->variant_cfg->regs,
> +				imx258->variant_cfg->num_regs);
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to set variant config\n",
> +			__func__);
> +		return ret;
> +	}
> +
>  	ret = imx258_write_reg(imx258, IMX258_CLK_BLANK_STOP,
>  			       IMX258_REG_VALUE_08BIT,
>  			       imx258->csi2_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK ?
> @@ -1490,6 +1525,7 @@ static int imx258_probe(struct i2c_client *client)
>  	struct v4l2_fwnode_endpoint ep = {
>  		.bus_type = V4L2_MBUS_CSI2_DPHY
>  	};
> +	const struct of_device_id *match;

This seems to be unused

>  	int ret;
>  	u32 val = 0;
>
> @@ -1565,6 +1601,10 @@ static int imx258_probe(struct i2c_client *client)
>
>  	imx258->csi2_flags = ep.bus.mipi_csi2.flags;
>
> +	imx258->variant_cfg = of_device_get_match_data(&client->dev);
> +	if (!match)

Here you could check for !imx258->variant_cfg

> +		imx258->variant_cfg = &imx258_cfg;
> +
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
>
> @@ -1653,7 +1693,8 @@ MODULE_DEVICE_TABLE(acpi, imx258_acpi_ids);
>  #endif
>
>  static const struct of_device_id imx258_dt_ids[] = {
> -	{ .compatible = "sony,imx258" },
> +	{ .compatible = "sony,imx258", .data = &imx258_cfg },
> +	{ .compatible = "sony,imx258-pdaf", .data = &imx258_pdaf_cfg },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, imx258_dt_ids);
> --
> 2.25.1
>
