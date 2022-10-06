Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B74095F6393
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiJFJZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiJFJZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:25:02 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C191C134
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:24:59 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C37BDC0004;
        Thu,  6 Oct 2022 09:24:56 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:24:54 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 08/16] media: i2c: ov9282: Add selection for CSI2 clock
 mode
Message-ID: <20221006092454.lzgioagtrcomp6lq@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-9-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-9-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Wed, Oct 05, 2022 at 04:28:01PM +0100, Dave Stevenson wrote:
> The sensor supports either having the CSI2 clock lane free
> running, or gated when there is no packet to transmit.
> The driver only selected gated (non-continuous) clock mode.
>
> Add code to allow fwnode to configure whether the clock is
> gated or free running.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index abb1223c0260..334b31af34a4 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -46,6 +46,9 @@
>  /* Group hold register */
>  #define OV9282_REG_HOLD		0x3308
>
> +#define OV9282_REG_MIPI_CTRL00	0x4800
> +#define OV9282_GATED_CLOCK	BIT(5)
> +
>  /* Input clock rate */
>  #define OV9282_INCLK_RATE	24000000
>
> @@ -138,6 +141,7 @@ struct ov9282 {
>  	struct clk *inclk;
>  	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
>  	struct v4l2_ctrl_handler ctrl_handler;
> +	bool noncontinuous_clock;

Nit: I would move this down after the controls, where vblank is

>  	struct v4l2_ctrl *link_freq_ctrl;
>  	struct v4l2_ctrl *hblank_ctrl;
>  	struct v4l2_ctrl *vblank_ctrl;
> @@ -211,7 +215,6 @@ static const struct ov9282_reg common_regs[] = {
>  	{0x4601, 0x04},
>  	{0x470f, 0x00},
>  	{0x4f07, 0x00},
> -	{0x4800, 0x20},
>  	{0x5000, 0x9f},
>  	{0x5001, 0x00},
>  	{0x5e00, 0x00},
> @@ -684,6 +687,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>  		return ret;
>  	}
>
> +	ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
> +			       ov9282->noncontinuous_clock ?
> +					OV9282_GATED_CLOCK : 0);
> +	if (ret) {
> +		dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
> +		return ret;
> +	}
> +
>  	/* Write sensor mode registers */
>  	reg_list = &ov9282->cur_mode->reg_list;
>  	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
> @@ -861,6 +872,9 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
>  	if (ret)
>  		return ret;
>
> +	ov9282->noncontinuous_clock =
> +		bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
> +

The patch looks good
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

>  	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV9282_NUM_DATA_LANES) {
>  		dev_err(ov9282->dev,
>  			"number of CSI2 data lanes %d is not supported",
> --
> 2.34.1
>
