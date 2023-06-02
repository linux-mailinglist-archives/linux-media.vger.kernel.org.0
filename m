Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D11E172039B
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 15:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235248AbjFBNmI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 09:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbjFBNmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 09:42:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC8F136;
        Fri,  2 Jun 2023 06:42:06 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BD3127C;
        Fri,  2 Jun 2023 15:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685713302;
        bh=sM6LEWwnaH3STtCfMkXcuovpQUh0+i6isNjE66dEo9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GWoGpED5rlR2ezwntsHSqoPCWnhd/0bDmD4QvMoWb04maCakHLjzhQ8QdeW0D9xcU
         7u80Srgg6vrcVis/JRjRdqS+UntIBUsbIqrTQqOX7vINrCkeez75J4qBIGrNOrOk/U
         y8a5QDjJucbck+TbBFNpXAVS3eS1RPEUSzll/n1U=
Date:   Fri, 2 Jun 2023 15:42:01 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 15/21] media: i2c: imx258: Issue reset before starting
 streaming
Message-ID: <syixdev7upf4nj2b2qsgvquzizty7lr6ztubmgdllnucdow3ko@i2dqfkf6ur23>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
 <20230530173000.3060865-16-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530173000.3060865-16-dave.stevenson@raspberrypi.com>
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

On Tue, May 30, 2023 at 06:29:54PM +0100, Dave Stevenson wrote:
> Whilst not documented, register 0x0103 bit 0 is the soft
> reset for the sensor, so send it before trying to configure
> the sensor.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx258.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 1e424058fcb9..7d6528f9ca4d 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -20,6 +20,8 @@
>  #define IMX258_MODE_STANDBY		0x00
>  #define IMX258_MODE_STREAMING		0x01
>
> +#define IMX258_REG_RESET		0x0103
> +
>  /* Chip ID */
>  #define IMX258_REG_CHIP_ID		0x0016
>  #define IMX258_CHIP_ID			0x0258
> @@ -1084,6 +1086,14 @@ static int imx258_start_streaming(struct imx258 *imx258)
>  	const struct imx258_link_freq_config *link_freq_cfg;
>  	int ret, link_freq_index;
>
> +	ret = imx258_write_reg(imx258, IMX258_REG_RESET, IMX258_REG_VALUE_08BIT,
> +			       0x01);
> +	if (ret) {
> +		dev_err(&client->dev, "%s failed to reset sensor\n", __func__);
> +		return ret;
> +	}
> +	usleep_range(10000, 15000);

Is the reset delay documented as well ?

up to 15msec seems a long time. Also, you can use fsleep() if you
don't have very precise constraints..

> +
>  	/* Setup PLL */
>  	link_freq_index = imx258->cur_mode->link_freq_index;
>  	link_freq_cfg = &imx258->link_freq_configs[link_freq_index];
> --
> 2.25.1
>
