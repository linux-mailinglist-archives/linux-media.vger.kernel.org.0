Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8AD272033B
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236040AbjFBN1E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235284AbjFBN1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:27:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B361B5;
        Fri,  2 Jun 2023 06:27:01 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D52BC27C;
        Fri,  2 Jun 2023 15:26:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685712397;
        bh=el4KbGDxHXmAq1JF0OzjnJcJFKD7nSDz/uxWbNmUFy0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tAgKmtwLgb8hafIkvQG+2VVK1RqhiQwiIiG4EKkcRQkNqvcL3Yral8F/Ef1wNWUBd
         eNN6yjMsU3AOibP4VKE/M/9a+bL9cVe23EZ53i1dWy6U0ClDyfiLDw5K1BRBkJQIdK
         g6fSeFbACG3zM+U55P/1UVU3SbxdFiBRVOCLZa1I=
Date:   Fri, 2 Jun 2023 15:26:56 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 12/21] media: i2c: imx258: Allow configuration of clock
 lane behaviour
Message-ID: <oxixqip6yhr3huqg4odozxqrtb6zqpbnla6eytrcdpeurclwor@z6dvre5jgji4>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-13-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-13-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:29:51PM +0100, Dave Stevenson wrote:
> The sensor supports the clock lane either remaining in HS mode
> during frame blanking, or dropping to LP11.
>
> Add configuration of the mode via V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK.

Assuming a follow-up patch for DT
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 1fa83fe82f27..b5c2dcb7c9e6 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -72,6 +72,8 @@
>  /* Test Pattern Control */
>  #define IMX258_REG_TEST_PATTERN		0x0600
>
> +#define IMX258_CLK_BLANK_STOP		0x4040
> +
>  /* Orientation */
>  #define REG_MIRROR_FLIP_CONTROL		0x0101
>  #define REG_CONFIG_MIRROR_FLIP		0x03
> @@ -634,6 +636,7 @@ struct imx258 {
>  	const struct imx258_link_freq_config *link_freq_configs;
>  	const s64 *link_freq_menu_items;
>  	unsigned int nlanes;
> +	unsigned int csi2_flags;
>
>  	/*
>  	 * Mutex for serialized access:
> @@ -1072,6 +1075,15 @@ static int imx258_start_streaming(struct imx258 *imx258)
>  		return ret;
>  	}
>
> +	ret = imx258_write_reg(imx258, IMX258_CLK_BLANK_STOP,
> +			       IMX258_REG_VALUE_08BIT,
> +			       imx258->csi2_flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK ?
> +			       1 : 0);
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to set clock lane mode\n", __func__);
> +		return ret;
> +	}
> +
>  	/* Apply default values of current mode */
>  	reg_list = &imx258->cur_mode->reg_list;
>  	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
> @@ -1486,6 +1498,8 @@ static int imx258_probe(struct i2c_client *client)
>  		goto error_endpoint_poweron;
>  	}
>
> +	imx258->csi2_flags = ep.bus.mipi_csi2.flags;
> +
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
>
> --
> 2.25.1
>
