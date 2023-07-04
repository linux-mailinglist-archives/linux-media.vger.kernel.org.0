Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB23746D35
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 11:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231888AbjGDJXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 05:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjGDJWb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 05:22:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC2D139
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 02:22:26 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2525D4A;
        Tue,  4 Jul 2023 11:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688462500;
        bh=9feSFhiSI+buCWE7AD7N8doRYH2hwVBbgMvWMlxQsAA=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=iMmOAATUO5iT7FZfHZ8bYn+/jvis8h50uWmNoCXyWjH7fN9d8Pwpd0LtGDlakSBfC
         8PIkVglU0KiEumqNBfu89nEBK7nJStxCFnNfr3SRVC0gxiM3kMQqIGO9t3nuFwD5r0
         F6ouDwvTJvS7bvzkd8yaNi7ebOzhFfcOtVCtw368=
Message-ID: <6f3d903c-acdc-983c-216b-45792a71d603@ideasonboard.com>
Date:   Tue, 4 Jul 2023 10:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-29-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 28/29] media: ov2680: Add link-freq and pixel-rate
 controls
In-Reply-To: <20230627131830.54601-29-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Morning Hans

On 27/06/2023 15:18, Hans de Goede wrote:
> Add read-only link-freq and pixel-rate controls. This is necessary for
> the sensor to work with the ipu3-cio2 driver and for libcamera.
>
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov2680.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 8bc542df1890..95d3152ddd22 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -75,6 +75,12 @@
>   #define OV2680_MIN_CROP_WIDTH			2
>   #define OV2680_MIN_CROP_HEIGHT			2
>   
> +/* Fixed pre-div of 1/2 */
> +#define OV2680_PLL_PREDIV0			2
> +
> +/* Pre-div configurable through reg 0x3080, left at its default of 0x02 : 1/2 */
> +#define OV2680_PLL_PREDIV			2
> +
>   /* 66MHz pixel clock: 66MHz / 1704 * 1294 = 30fps */
>   #define OV2680_PIXELS_PER_LINE			1704
>   #define OV2680_LINES_PER_FRAME			1294
> @@ -118,6 +124,8 @@ struct ov2680_ctrls {
>   	struct v4l2_ctrl *hflip;
>   	struct v4l2_ctrl *vflip;
>   	struct v4l2_ctrl *test_pattern;
> +	struct v4l2_ctrl *link_freq;
> +	struct v4l2_ctrl *pixel_rate;
>   };
>   
>   struct ov2680_mode {
> @@ -145,6 +153,8 @@ struct ov2680_dev {
>   	struct clk			*xvclk;
>   	u32				xvclk_freq;
>   	u8				pll_mult;
> +	s64				link_freq[1];
> +	s64				pixel_rate;
>   	struct regulator_bulk_data	supplies[OV2680_NUM_SUPPLIES];
>   
>   	struct gpio_desc		*pwdn_gpio;
> @@ -906,6 +916,12 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>   	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
>   					0, 1023, 1, 250);
>   
> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
> +						  0, 0, sensor->link_freq);
> +	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
> +					      0, sensor->pixel_rate,
> +					      1, sensor->pixel_rate);
> +
>   	if (hdl->error) {
>   		ret = hdl->error;
>   		goto cleanup_entity;
> @@ -913,6 +929,7 @@ static int ov2680_v4l2_register(struct ov2680_dev *sensor)
>   
>   	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>   	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> +	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   
>   	sensor->sd.ctrl_handler = hdl;
>   
> @@ -1030,6 +1047,12 @@ static int ov2680_parse_dt(struct ov2680_dev *sensor)
>   
>   	sensor->pll_mult = ov2680_pll_multipliers[i];
>   
> +	sensor->link_freq[0] = sensor->xvclk_freq / OV2680_PLL_PREDIV0 /
> +			       OV2680_PLL_PREDIV * sensor->pll_mult;
> +
> +	/* CSI-2 is double data rate, bus-format is 10 bpp */
> +	sensor->pixel_rate = sensor->link_freq[0] * 2 / 10;


I'm a little unsure on this one. My understanding is that the link frequency really ought to come 
from the endpoint properties (which in our case would be set by the ipu-bridge; though it doesn't 
for this sensor at the moment because I didn't understand it properly back then) because it's a 
platform specific thing. What the value should be, I have been determining by reading the PLL 
settings for the sensor whilst the laptop's running Windows. So whilst this is probably technically 
fine in supporting the link frequency that the driver already expects to configure for whatever 
platform this was originally designed for, my guess would be that the Miix expects a different link 
frequency and ideally we'd support that instead. For example see these commits for the ov7251:


ed9566ce1946 media: i2c: Add support for new frequencies to ov7251
df057b0dd99b media: i2c: Add ov7251_pll_configure()
1757b44eb6bb media: i2c: Remove per-mode frequencies from ov7251
cc125aaa5a78 media: i2c: Provide ov7251_check_hwcfg()


Which keeps support for the link frequency that the driver already configured and adds support for 
the new one, for both 19.2 and 24MHz input clocks.


What would be your thoughts on moving #15 and this patch to something like that?


> +
>   	return 0;
>   }
>   
