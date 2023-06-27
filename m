Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE9B73FDF0
	for <lists+linux-media@lfdr.de>; Tue, 27 Jun 2023 16:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjF0Ofw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jun 2023 10:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjF0Oft (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jun 2023 10:35:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 062592D6A
        for <linux-media@vger.kernel.org>; Tue, 27 Jun 2023 07:35:48 -0700 (PDT)
Received: from ideasonboard.com (unknown [193.85.242.128])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 406DE10A;
        Tue, 27 Jun 2023 16:35:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687876507;
        bh=qgXqsmC2nHodK0zceId2tC4YjP6hHIj22nFsqgutDb8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lL0Ki9E6oT8j/UjT79N8W4zKJxWPkJZ066T6qYxHxiIQn1+laUY+o3kbiARKkk7xZ
         uEV5TMKcPJRCUSWa5wDfQ9sUQRSclKqtkMQIohWZn93PBnCD9523TGIP+vsppaVWBe
         6AanSWZph1XBiKgaYkLR+JAdwo8xojl2ngVoH+z8=
Date:   Tue, 27 Jun 2023 16:35:43 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 03/29] media: ov2680: Fix vflip / hflip set functions
Message-ID: <swuf2k4tatjfsjjta2ul36ph7xncs3l5vq2jby4hf2zww3s4k5@6lqbvl2vkxkc>
References: <20230627131830.54601-1-hdegoede@redhat.com>
 <20230627131830.54601-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230627131830.54601-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

On Tue, Jun 27, 2023 at 03:18:04PM +0200, Hans de Goede wrote:
> ov2680_vflip_disable() / ov2680_hflip_disable() pass BIT(0) instead of
> 0 as value to ov2680_mod_reg().
>
> While fixing this also:
>
> 1. Stop having separate enable/disable functions for hflip / vflip
> 2. Move the is_streaming check, which is unique to hflip / vflip
>    into the ov2680_set_?flip() functions.

The patch looks good, but one little question on the controls update
procedure.

Usually s_ctrl() handlers checks for the sensor power state, like the
driver here is already doing by testing the is_enabled[*] flag, but they
usually call __v4l2_ctrl_handler_setup() unconditionally at
s_stream(1) time, not only if a new mode has been applied by calling
s_fmt(). Controls could be updated by userspace while the sensor is
powered off, and new values should be applied regardless if a new mode,
has been applied or not.

Does it make sense to you ?

[*] or better, if the sensor is ported to use pm_runtime first (by
dropping support for the deprecated .s_power(), or do you need
s_power() on your platform ?) you can use pm_runtime_get_if_in_use()
instead of keeping track manually of the is_enabled flag.

>
> for a nice code cleanup.
>
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 50 ++++++++++----------------------------
>  1 file changed, 13 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 2001e08253ef..c93810f84ed7 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -328,11 +328,15 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
>  	sensor->fmt.code = ov2680_hv_flip_bayer_order[hv_flip];
>  }
>
> -static int ov2680_vflip_enable(struct ov2680_dev *sensor)
> +static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
>  {
>  	int ret;
>
> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(2));
> +	if (sensor->is_streaming)
> +		return -EBUSY;
> +
> +	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1,
> +			     BIT(2), val ? BIT(2) : 0);
>  	if (ret < 0)
>  		return ret;
>
> @@ -340,33 +344,15 @@ static int ov2680_vflip_enable(struct ov2680_dev *sensor)
>  	return 0;
>  }
>
> -static int ov2680_vflip_disable(struct ov2680_dev *sensor)
> +static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
>  {
>  	int ret;
>
> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(0));
> -	if (ret < 0)
> -		return ret;
> +	if (sensor->is_streaming)
> +		return -EBUSY;
>
> -	return ov2680_bayer_order(sensor);
> -}
> -
> -static int ov2680_hflip_enable(struct ov2680_dev *sensor)
> -{
> -	int ret;
> -
> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(2));
> -	if (ret < 0)
> -		return ret;
> -
> -	return ov2680_bayer_order(sensor);
> -}
> -
> -static int ov2680_hflip_disable(struct ov2680_dev *sensor)
> -{
> -	int ret;
> -
> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), BIT(0));
> +	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2,
> +			     BIT(2), val ? BIT(2) : 0);
>  	if (ret < 0)
>  		return ret;
>
> @@ -720,19 +706,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_EXPOSURE:
>  		return ov2680_exposure_set(sensor, ctrl->val);
>  	case V4L2_CID_VFLIP:
> -		if (sensor->is_streaming)
> -			return -EBUSY;
> -		if (ctrl->val)
> -			return ov2680_vflip_enable(sensor);
> -		else
> -			return ov2680_vflip_disable(sensor);
> +		return ov2680_set_vflip(sensor, ctrl->val);
>  	case V4L2_CID_HFLIP:
> -		if (sensor->is_streaming)
> -			return -EBUSY;
> -		if (ctrl->val)
> -			return ov2680_hflip_enable(sensor);
> -		else
> -			return ov2680_hflip_disable(sensor);
> +		return ov2680_set_hflip(sensor, ctrl->val);
>  	case V4L2_CID_TEST_PATTERN:
>  		return ov2680_test_pattern_set(sensor, ctrl->val);
>  	default:
> --
> 2.41.0
>
