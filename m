Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3B173FF00
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 16:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbjF0Oxc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 10:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjF0OxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 10:53:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88B4358E
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 07:50:57 -0700 (PDT)
Received: from [192.168.144.60] (90-182-211-1.rcp.o2.cz [90.182.211.1])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 069CA4DE;
        Tue, 27 Jun 2023 16:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687877414;
        bh=keDoJqjZtjRp7Ew2gzJJDdf5vgQ+Cug7yWhywM0+O1A=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=VCdYAJikzdj9w4nBpjV/IskPOsQeuWaMevzGdfcA3eN6Yb1KIHfbUZjqljDVcFLVO
         xPSQOnarRyMCa03HRcz8WHMY8gFTB63H7nUGhfOybsBbwIrVYkygSHtSTuq39cGuZC
         zH4I0qkYU+igazpS1hhBsmh4ePqeJ54Xon1Nz3Xc=
Message-ID: <df7e28e5-0ba8-7521-cea1-1f516a5ae340@ideasonboard.com>
Date:   Tue, 27 Jun 2023 16:50:50 +0200
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
 <20230627131830.54601-14-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 13/29] media: ov2680: Drop is_enabled flag
In-Reply-To: <20230627131830.54601-14-hdegoede@redhat.com>
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
> With runtime-pm it is guaranteed that ov2680_power_on() and
> ov2680_power_off() will always be called in a balanced way;
> and the is_enabled check in ov2680_s_ctrl() can be replaced
> by checking the runtime-suspend state.
>
> So there is no more need for the is_enabled flag, remove it.
>
> While at it also make sure that flip control changes while
> suspended still lead to the bayer-order getting updated so
> that get_fmt returns the correct bayer-order.


I think that this could benefit from a comment in the code - it's a departure from the usual and 
looks a bit strange. With that added:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov2680.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 56aaf67c1d82..b7c23286700e 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -100,7 +100,6 @@ struct ov2680_dev {
>   	struct gpio_desc		*pwdn_gpio;
>   	struct mutex			lock; /* protect members */
>   
> -	bool				is_enabled;
>   	bool				is_streaming;
>   
>   	struct ov2680_ctrls		ctrls;
> @@ -312,14 +311,9 @@ static int ov2680_stream_disable(struct ov2680_dev *sensor)
>   
>   static int ov2680_power_off(struct ov2680_dev *sensor)
>   {
> -	if (!sensor->is_enabled)
> -		return 0;
> -
>   	clk_disable_unprepare(sensor->xvclk);
>   	ov2680_power_down(sensor);
>   	regulator_bulk_disable(OV2680_NUM_SUPPLIES, sensor->supplies);
> -	sensor->is_enabled = false;
> -
>   	return 0;
>   }
>   
> @@ -327,9 +321,6 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
>   {
>   	int ret;
>   
> -	if (sensor->is_enabled)
> -		return 0;
> -
>   	ret = regulator_bulk_enable(OV2680_NUM_SUPPLIES, sensor->supplies);
>   	if (ret < 0) {
>   		dev_err(sensor->dev, "failed to enable regulators: %d\n", ret);
> @@ -353,8 +344,6 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
>   	if (ret < 0)
>   		goto err_disable_regulators;
>   
> -	sensor->is_enabled = true;
> -
>   	return 0;
>   
>   err_disable_regulators:
> @@ -541,26 +530,37 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
>   	struct ov2680_dev *sensor = to_ov2680_dev(sd);
> +	int ret;
>   
> -	if (!sensor->is_enabled)
> +	/* Only apply changes to the controls if the device is powered up */
> +	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
> +		ov2680_set_bayer_order(sensor, &sensor->fmt);
>   		return 0;
> +	}
>   
>   	switch (ctrl->id) {
>   	case V4L2_CID_GAIN:
> -		return ov2680_gain_set(sensor, ctrl->val);
> +		ret = ov2680_gain_set(sensor, ctrl->val);
> +		break;
>   	case V4L2_CID_EXPOSURE:
> -		return ov2680_exposure_set(sensor, ctrl->val);
> +		ret = ov2680_exposure_set(sensor, ctrl->val);
> +		break;
>   	case V4L2_CID_VFLIP:
> -		return ov2680_set_vflip(sensor, ctrl->val);
> +		ret = ov2680_set_vflip(sensor, ctrl->val);
> +		break;
>   	case V4L2_CID_HFLIP:
> -		return ov2680_set_hflip(sensor, ctrl->val);
> +		ret = ov2680_set_hflip(sensor, ctrl->val);
> +		break;
>   	case V4L2_CID_TEST_PATTERN:
> -		return ov2680_test_pattern_set(sensor, ctrl->val);
> +		ret = ov2680_test_pattern_set(sensor, ctrl->val);
> +		break;
>   	default:
> +		ret = -EINVAL;
>   		break;
>   	}
>   
> -	return -EINVAL;
> +	pm_runtime_put(sensor->sd.dev);
> +	return ret;
>   }
>   
>   static const struct v4l2_ctrl_ops ov2680_ctrl_ops = {
