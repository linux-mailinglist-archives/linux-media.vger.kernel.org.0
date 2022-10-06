Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D00C65F6360
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbiJFJPS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:15:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiJFJPJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:15:09 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B559027DC3
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:15:07 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DDC426000F;
        Thu,  6 Oct 2022 09:15:03 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:15:02 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 02/16] media: i2c: ov9282: Split registers into common
 and mode specific
Message-ID: <20221006091502.nmapvfotolb5imto@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-3-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-3-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Oct 05, 2022 at 04:27:55PM +0100, Dave Stevenson wrote:
> Currently only one mode is supported, so all registers were
> dropped in one list.
> In preparation for adding more modes, split out the common registers
> from those which configure the mode.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I don't have the datasheet but I can confirm all registeres removed
from the common part are now part of the mode

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

> ---
>  drivers/media/i2c/ov9282.c | 77 +++++++++++++++++++++++---------------
>  1 file changed, 47 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 2c13bcd59c2a..9842080cf66f 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -157,8 +157,8 @@ static const s64 link_freq[] = {
>  	OV9282_LINK_FREQ,
>  };
>
> -/* Sensor mode registers */
> -static const struct ov9282_reg mode_1280x720_regs[] = {
> +/* Common registers */
> +static const struct ov9282_reg common_regs[] = {
>  	{0x0302, 0x32},
>  	{0x030d, 0x50},
>  	{0x030e, 0x02},
> @@ -189,13 +189,49 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>  	{0x372d, 0x22},
>  	{0x3731, 0x80},
>  	{0x3732, 0x30},
> -	{0x3778, 0x00},
>  	{0x377d, 0x22},
>  	{0x3788, 0x02},
>  	{0x3789, 0xa4},
>  	{0x378a, 0x00},
>  	{0x378b, 0x4a},
>  	{0x3799, 0x20},
> +	{0x3881, 0x42},
> +	{0x38a8, 0x02},
> +	{0x38a9, 0x80},
> +	{0x38b1, 0x00},
> +	{0x38c4, 0x00},
> +	{0x38c5, 0xc0},
> +	{0x38c6, 0x04},
> +	{0x38c7, 0x80},
> +	{0x3920, 0xff},
> +	{0x4010, 0x40},
> +	{0x4043, 0x40},
> +	{0x4307, 0x30},
> +	{0x4317, 0x00},
> +	{0x4501, 0x00},
> +	{0x450a, 0x08},
> +	{0x4601, 0x04},
> +	{0x470f, 0x00},
> +	{0x4f07, 0x00},
> +	{0x4800, 0x20},
> +	{0x5000, 0x9f},
> +	{0x5001, 0x00},
> +	{0x5e00, 0x00},
> +	{0x5d00, 0x07},
> +	{0x5d01, 0x00},
> +	{0x0101, 0x01},
> +	{0x1000, 0x03},
> +	{0x5a08, 0x84},
> +};
> +
> +struct ov9282_reg_list common_regs_list = {
> +	.num_of_regs = ARRAY_SIZE(common_regs),
> +	.regs = common_regs,
> +};
> +
> +/* Sensor mode registers */
> +static const struct ov9282_reg mode_1280x720_regs[] = {
> +	{0x3778, 0x00},
>  	{0x3800, 0x00},
>  	{0x3801, 0x00},
>  	{0x3802, 0x00},
> @@ -218,40 +254,13 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>  	{0x3815, 0x11},
>  	{0x3820, 0x3c},
>  	{0x3821, 0x84},
> -	{0x3881, 0x42},
> -	{0x38a8, 0x02},
> -	{0x38a9, 0x80},
> -	{0x38b1, 0x00},
> -	{0x38c4, 0x00},
> -	{0x38c5, 0xc0},
> -	{0x38c6, 0x04},
> -	{0x38c7, 0x80},
> -	{0x3920, 0xff},
>  	{0x4003, 0x40},
>  	{0x4008, 0x02},
>  	{0x4009, 0x05},
>  	{0x400c, 0x00},
>  	{0x400d, 0x03},
> -	{0x4010, 0x40},
> -	{0x4043, 0x40},
> -	{0x4307, 0x30},
> -	{0x4317, 0x00},
> -	{0x4501, 0x00},
>  	{0x4507, 0x00},
>  	{0x4509, 0x80},
> -	{0x450a, 0x08},
> -	{0x4601, 0x04},
> -	{0x470f, 0x00},
> -	{0x4f07, 0x00},
> -	{0x4800, 0x20},
> -	{0x5000, 0x9f},
> -	{0x5001, 0x00},
> -	{0x5e00, 0x00},
> -	{0x5d00, 0x07},
> -	{0x5d01, 0x00},
> -	{0x0101, 0x01},
> -	{0x1000, 0x03},
> -	{0x5a08, 0x84},
>  };
>
>  /* Supported sensor mode configurations */
> @@ -663,6 +672,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>  	const struct ov9282_reg_list *reg_list;
>  	int ret;
>
> +	/* Write common registers */
> +	ret = ov9282_write_regs(ov9282, common_regs_list.regs,
> +				common_regs_list.num_of_regs);
> +	if (ret) {
> +		dev_err(ov9282->dev, "fail to write common registers");
> +		return ret;
> +	}
> +
>  	/* Write sensor mode registers */
>  	reg_list = &ov9282->cur_mode->reg_list;
>  	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
> --
> 2.34.1
>
