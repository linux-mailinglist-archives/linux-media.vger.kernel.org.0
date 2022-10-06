Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D263F5F63CD
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 11:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiJFJs0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 05:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiJFJsY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 05:48:24 -0400
X-Greylist: delayed 1110 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 06 Oct 2022 02:48:23 PDT
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE4C558DB
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 02:48:23 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B01E16000B;
        Thu,  6 Oct 2022 09:48:20 +0000 (UTC)
Date:   Thu, 6 Oct 2022 11:48:18 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 14/16] media: i2c: ov9282: Add support for 1280x800 and
 640x400 modes
Message-ID: <20221006094818.setqogqevtjpfvo6@uno.localdomain>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-15-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221005152809.3785786-15-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 05, 2022 at 04:28:07PM +0100, Dave Stevenson wrote:
> Adds register settings for additional modes.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 97 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index d892f53fb1ea..ec1599488f21 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -251,6 +251,37 @@ struct ov9282_reg_list common_regs_list = {
>  };
>
>  /* Sensor mode registers */
> +static const struct ov9282_reg mode_1280x800_regs[] = {
> +	{0x3778, 0x00},
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x00},
> +	{0x3804, 0x05},
> +	{0x3805, 0x0f},
> +	{0x3806, 0x03},
> +	{0x3807, 0x2f},
> +	{0x3808, 0x05},
> +	{0x3809, 0x00},
> +	{0x380a, 0x03},
> +	{0x380b, 0x20},
> +	{0x3810, 0x00},
> +	{0x3811, 0x08},
> +	{0x3812, 0x00},
> +	{0x3813, 0x08},
> +	{0x3814, 0x11},
> +	{0x3815, 0x11},
> +	{0x3820, 0x40},
> +	{0x3821, 0x00},
> +	{0x4003, 0x40},
> +	{0x4008, 0x04},
> +	{0x4009, 0x0b},
> +	{0x400c, 0x00},
> +	{0x400d, 0x07},
> +	{0x4507, 0x00},
> +	{0x4509, 0x00},
> +};
> +
>  static const struct ov9282_reg mode_1280x720_regs[] = {
>  	{0x3778, 0x00},
>  	{0x3800, 0x00},
> @@ -282,6 +313,36 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>  	{0x4509, 0x80},
>  };
>
> +static const struct ov9282_reg mode_640x400_regs[] = {
> +	{0x3778, 0x10},
> +	{0x3800, 0x00},
> +	{0x3801, 0x00},
> +	{0x3802, 0x00},
> +	{0x3803, 0x00},
> +	{0x3804, 0x05},
> +	{0x3805, 0x0f},

I assume this mode is then binned as the analog crop rectangle is the
same as the other modes, right ?

> +	{0x3806, 0x03},
> +	{0x3807, 0x2f},
> +	{0x3808, 0x02},
> +	{0x3809, 0x80},
> +	{0x380a, 0x01},
> +	{0x380b, 0x90},
> +	{0x3810, 0x00},
> +	{0x3811, 0x04},
> +	{0x3812, 0x00},
> +	{0x3813, 0x04},
> +	{0x3814, 0x31},
> +	{0x3815, 0x22},
> +	{0x3820, 0x60},
> +	{0x3821, 0x01},
> +	{0x4008, 0x02},
> +	{0x4009, 0x05},
> +	{0x400c, 0x00},
> +	{0x400d, 0x03},
> +	{0x4507, 0x03},
> +	{0x4509, 0x80},
> +};
> +
>  /* Supported sensor mode configurations */
>  static const struct ov9282_mode supported_modes[] = {
>  	{
> @@ -306,6 +367,42 @@ static const struct ov9282_mode supported_modes[] = {
>  			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
>  			.regs = mode_1280x720_regs,
>  		},
> +	}, {
> +		.width = 1280,
> +		.height = 800,
> +		.hblank_min = { 250, 176 },
> +		.vblank = 1022,
> +		.vblank_min = 110,
> +		.vblank_max = 51540,
> +		.link_freq_idx = 0,
> +		.crop = {
> +			.left = OV9282_PIXEL_ARRAY_LEFT,
> +			.top = OV9282_PIXEL_ARRAY_TOP,
> +			.width = 1280,
> +			.height = 800
> +		},
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_1280x800_regs),
> +			.regs = mode_1280x800_regs,
> +		},
> +	}, {
> +		.width = 640,
> +		.height = 400,
> +		.hblank_min = { 890, 816 },
> +		.vblank = 1022,
> +		.vblank_min = 22,
> +		.vblank_max = 51540,
> +		.link_freq_idx = 0,
> +		.crop = {
> +			.left = OV9282_PIXEL_ARRAY_LEFT,
> +			.top = OV9282_PIXEL_ARRAY_TOP,
> +			.width = 1280,
> +			.height = 800
> +		},

This seems to confirm it.

I would have ordered them, but this will change the default mode
unless we define its index and use it at initialization time

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_640x400_regs),
> +			.regs = mode_640x400_regs,
> +		},
>  	},
>  };
>
> --
> 2.34.1
>
