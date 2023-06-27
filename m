Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6147173FE80
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 16:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjF0OlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 10:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjF0OlU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 10:41:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 017733590
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 07:40:53 -0700 (PDT)
Received: from [192.168.144.60] (90-182-211-1.rcp.o2.cz [90.182.211.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33BD410A;
        Tue, 27 Jun 2023 16:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687876809;
        bh=YHiu8DHNTNkAIafKqmBUmEE2RM5OWafhR18eWVejASM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gzXtpwqjKdjJrPuIrySQ/cg4kkMzxkjmBSbd1DFdpgAwl8NI5dG/WOIvootPDqS0e
         7ojn5cXY4AkpYrNCiWw7jaYWwvbQy4lZJpKzKu6a4NOnjCpADqTcSlK1qD/CKR9Meq
         5xua2BN0Xxo5CIW21V6ahXnlBLfyjOmdC8dj6TPU=
Message-ID: <08701132-eab4-fc44-d14d-6dc72ec5c4c4@ideasonboard.com>
Date:   Tue, 27 Jun 2023 16:40:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 11/29] media: ov2680: Check for "powerdown" GPIO con-id
 before checking for "reset" GPIO con-id
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
 <20230627131830.54601-12-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230627131830.54601-12-hdegoede@redhat.com>
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

Hi Hans

On 27/06/2023 15:18, Hans de Goede wrote:
> The datasheet of the OV2680 labels the single GPIO to put the sensor in
> powersaving mode as XSHUTDN aka shutdown, _not_ reset.
>
> This is important because some boards have standardized sensor connectors
> which allow connecting various sensor modules. These connectors have both
> reset and powerdown signals and the powerdown signal is routed to
> the OV2680's XSHUTDN pin.
>
> On x86/ACPI multiple Bay Trail, Cherry Trail, Sky Lake and Kaby Lake models
> have an OV2680 connected to the ISP2 / IPU3. On these devices the GPIOS are
> not described in DT instead the GPIOs are described with an Intel specific
> DSM which labels them as either powerdown or reset. Often this DSM returns
> both reset and powerdown pins even though the OV2680 has only 1 such pin.
>
> For the ov2680 driver to work on these devices it must use the GPIO with
> "powerdown" as con-id, matching the XSHUTDN name from the datasheet.
>
> As for why "powerdown" vs say "shutdown" the ACPI DSM -> con-id mapping
> code is shared, so we must use standardized names and currently all of
> the following sensor drivers already use "powerdown":
> adv7180, gc0310, isl7998x, ov02a10, ov2659, ov5640, ov5648, ov5670,
> ov5693, ov7670, ov772x, ov7740, ov8858, ov8865 and ov9650 .
>
> Where as the hi846 driver is the lonely standout using "shutdown".
>
> Try the "powerdown" con-id first to make things work, falling back to
> "reset" to keep existing DT setups working.
>
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/i2c/ov2680.c | 29 ++++++++++++++++++++---------
>   1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 824e2962e7d5..0de047c49c31 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -96,7 +96,7 @@ struct ov2680_dev {
>   	u32				xvclk_freq;
>   	struct regulator_bulk_data	supplies[OV2680_NUM_SUPPLIES];
>   
> -	struct gpio_desc		*reset_gpio;
> +	struct gpio_desc		*pwdn_gpio;
>   	struct mutex			lock; /* protect members */
>   
>   	bool				mode_pending_changes;
> @@ -180,19 +180,19 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
>   
>   static void ov2680_power_up(struct ov2680_dev *sensor)
>   {
> -	if (!sensor->reset_gpio)
> +	if (!sensor->pwdn_gpio)
>   		return;
>   
> -	gpiod_set_value(sensor->reset_gpio, 0);
> +	gpiod_set_value(sensor->pwdn_gpio, 0);
>   	usleep_range(5000, 10000);
>   }
>   
>   static void ov2680_power_down(struct ov2680_dev *sensor)
>   {
> -	if (!sensor->reset_gpio)
> +	if (!sensor->pwdn_gpio)
>   		return;
>   
> -	gpiod_set_value(sensor->reset_gpio, 1);
> +	gpiod_set_value(sensor->pwdn_gpio, 1);
>   	usleep_range(5000, 10000);
>   }
>   
> @@ -350,7 +350,7 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
>   		return ret;
>   	}
>   
> -	if (!sensor->reset_gpio) {
> +	if (!sensor->pwdn_gpio) {
>   		ret = cci_write(sensor->regmap, OV2680_REG_SOFT_RESET, 0x01,
>   				NULL);
>   		if (ret != 0) {
> @@ -742,16 +742,27 @@ static int ov2680_check_id(struct ov2680_dev *sensor)
>   static int ov2680_parse_dt(struct ov2680_dev *sensor)
>   {
>   	struct device *dev = sensor->dev;
> +	struct gpio_desc *gpio;
>   	int ret;
>   
> -	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> -						     GPIOD_OUT_HIGH);
> -	ret = PTR_ERR_OR_ZERO(sensor->reset_gpio);
> +	/*
> +	 * The pin we want is named XSHUTDN in the datasheet. Linux sensor
> +	 * drivers have standardized on using "powerdown" as con-id name
> +	 * for powerdown or shutdown pins. Older DTB files use "reset",
> +	 * so fallback to that if there is no "powerdown" pin.
> +	 */
> +	gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
> +	if (!gpio)
> +		gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +
> +	ret = PTR_ERR_OR_ZERO(gpio);
>   	if (ret < 0) {
>   		dev_dbg(dev, "error while getting reset gpio: %d\n", ret);
>   		return ret;
>   	}
>   
> +	sensor->pwdn_gpio = gpio;
> +
>   	sensor->xvclk = devm_clk_get(dev, "xvclk");
>   	if (IS_ERR(sensor->xvclk)) {
>   		dev_err(dev, "xvclk clock missing or invalid\n");
