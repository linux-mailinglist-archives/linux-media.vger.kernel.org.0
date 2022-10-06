Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35DF65F6377
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbiJFJRj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiJFJRi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:17:38 -0400
X-Greylist: delayed 51053 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 06 Oct 2022 02:17:35 PDT
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD04915F8
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:17:34 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id C2F151C000B;
        Thu,  6 Oct 2022 09:17:31 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:17:30 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 04/16] media: i2c: ov9282: Remove pixel rate from mode
 definition
Message-ID: <20221006091730.mtphbem33dufubd4@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-5-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-5-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave

On Wed, Oct 05, 2022 at 04:27:57PM +0100, Dave Stevenson wrote:
> The pixel rate is determined by the PLL setup in the common
> registers, not by the mode specific registers, therefore
> remove it from the mode definition and define it for all modes.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 1c77b77427f0..798ff8ba50bd 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -53,6 +53,10 @@
>  #define OV9282_LINK_FREQ	400000000
>  #define OV9282_NUM_DATA_LANES	2
>
> +/* Pixel rate */
> +#define OV9282_PIXEL_RATE	(OV9282_LINK_FREQ * 2 * \
> +				 OV9282_NUM_DATA_LANES / 10)

This will work as long as there's a single Y10 supported mode.
I haven't looked at the rest of the series yet but if Y8 gets
supported it might be worth dynamically re-computing the PIXEL_RATE
when a new mode is applied.

For now this is good, and if Y10 remains the default format is fine to
initialize PIXEL_RATE assuming 10 bpp

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> +
>  #define OV9282_REG_MIN		0x00
>  #define OV9282_REG_MAX		0xfffff
>
> @@ -92,7 +96,6 @@ struct ov9282_reg_list {
>   * @vblank: Vertical blanking in lines
>   * @vblank_min: Minimum vertical blanking in lines
>   * @vblank_max: Maximum vertical blanking in lines
> - * @pclk: Sensor pixel clock
>   * @link_freq_idx: Link frequency index
>   * @reg_list: Register list for sensor mode
>   */
> @@ -103,7 +106,6 @@ struct ov9282_mode {
>  	u32 vblank;
>  	u32 vblank_min;
>  	u32 vblank_max;
> -	u64 pclk;
>  	u32 link_freq_idx;
>  	struct ov9282_reg_list reg_list;
>  };
> @@ -118,7 +120,6 @@ struct ov9282_mode {
>   * @inclk: Sensor input clock
>   * @ctrl_handler: V4L2 control handler
>   * @link_freq_ctrl: Pointer to link frequency control
> - * @pclk_ctrl: Pointer to pixel clock control
>   * @hblank_ctrl: Pointer to horizontal blanking control
>   * @vblank_ctrl: Pointer to vertical blanking control
>   * @exp_ctrl: Pointer to exposure control
> @@ -138,7 +139,6 @@ struct ov9282 {
>  	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *link_freq_ctrl;
> -	struct v4l2_ctrl *pclk_ctrl;
>  	struct v4l2_ctrl *hblank_ctrl;
>  	struct v4l2_ctrl *vblank_ctrl;
>  	struct {
> @@ -269,7 +269,6 @@ static const struct ov9282_mode supported_mode = {
>  	.vblank = 1022,
>  	.vblank_min = 151,
>  	.vblank_max = 51540,
> -	.pclk = 160000000,
>  	.link_freq_idx = 0,
>  	.reg_list = {
>  		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> @@ -1006,11 +1005,9 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
>  						1, mode->vblank);
>
>  	/* Read only controls */
> -	ov9282->pclk_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
> -					      &ov9282_ctrl_ops,
> -					      V4L2_CID_PIXEL_RATE,
> -					      mode->pclk, mode->pclk,
> -					      1, mode->pclk);
> +	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_PIXEL_RATE,
> +			  OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
> +			  OV9282_PIXEL_RATE);
>
>  	ov9282->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
>  							&ov9282_ctrl_ops,
> --
> 2.34.1
>
