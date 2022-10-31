Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3477D61339A
	for <lists+linux-media@lfdr.de>; Mon, 31 Oct 2022 11:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbiJaK2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Oct 2022 06:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbiJaK2Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Oct 2022 06:28:25 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392CCBF71
        for <linux-media@vger.kernel.org>; Mon, 31 Oct 2022 03:28:23 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 37FBB240007;
        Mon, 31 Oct 2022 10:28:20 +0000 (UTC)
Date:   Mon, 31 Oct 2022 11:28:19 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi
Subject: Re: [PATCH v2 14/16] media: i2c: ov9282: Add support for 1280x800
 and 640x400 modes
Message-ID: <20221031102819.sm3u4hom3tuddtax@uno.localdomain>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
 <20221028160902.2696973-15-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028160902.2696973-15-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave


On Fri, Oct 28, 2022 at 05:09:00PM +0100, Dave Stevenson wrote:
> Adds register settings for additional modes.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/ov9282.c | 103 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 102 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index a520d9fef0cb..c169b532ec8b 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -246,11 +246,44 @@ struct ov9282_reg_list common_regs_list = {
>  	.regs = common_regs,
>  };
>
> -#define MODE_1280_720		0
> +#define MODE_1280_800		0
> +#define MODE_1280_720		1
> +#define MODE_640_400		2
>
>  #define DEFAULT_MODE		MODE_1280_720
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
> @@ -282,8 +315,57 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
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
> +	[MODE_1280_800] = {
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
> +	},
>  	[MODE_1280_720] = {
>  		.width = 1280,
>  		.height = 720,
> @@ -307,6 +389,25 @@ static const struct ov9282_mode supported_modes[] = {
>  			.regs = mode_1280x720_regs,
>  		},
>  	},
> +	[MODE_640_400] = {
> +		.width = 640,
> +		.height = 400,
> +		.hblank_min = { 890, 816 },
> +		.vblank = 1022,
> +		.vblank_min = 22,
> +		.vblank_max = 51540,

While hblank_min is adapated to match the limits for full resolution
mode (1280 + 250 - 640 = 890; same for the 816 non-continuous version)
vblank_min is shrinked, giving a min frame length of (400 + 22)
compared to the full-res min frame length of (800 + 110). Is this
intentional ?

> +		.link_freq_idx = 0,
> +		.crop = {
> +			.left = OV9282_PIXEL_ARRAY_LEFT,
> +			.top = OV9282_PIXEL_ARRAY_TOP,
> +			.width = 1280,
> +			.height = 800
> +		},
> +		.reg_list = {
> +			.num_of_regs = ARRAY_SIZE(mode_640x400_regs),
> +			.regs = mode_640x400_regs,
> +		},
> +	},
>  };
>
>  /**
> --
> 2.34.1
>
