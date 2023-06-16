Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67CDD733278
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 15:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344366AbjFPNru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 09:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjFPNrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 09:47:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBAB2702
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 06:47:46 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCF729CA;
        Fri, 16 Jun 2023 15:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686923233;
        bh=kxSgii5wYKbUrBKncX9ci1jAFsRefsazujs7S9Z/myo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VWDh1x24C4r4FMyHd3qtguwfEQF7CnonuHNDvcmt9NivZpf5zbu0BSAfSjbfsc2SG
         QOxjvP94OWyvacl9msQukzpQtgFJH9GRFFDNAX3Pb1dLAtS3QKqlOjNWFBgVyZ8THR
         trGywlvR6u7gh860HxSlWszCJoa69U9MBCPplnNQ=
Message-ID: <a175a52c-e52f-f71f-a7bb-5dfd67cf7016@ideasonboard.com>
Date:   Fri, 16 Jun 2023 14:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/28] media: ov2680: Fix vflip / hflip set functions
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230615141349.172363-1-hdegoede@redhat.com>
 <20230615141349.172363-4-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230615141349.172363-4-hdegoede@redhat.com>
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

On 15/06/2023 15:13, Hans de Goede wrote:
> ov2680_vflip_disable() / ov2680_hflip_disable() pass BIT(0) instead of
> 0 as value to ov2680_mod_reg().
>
> While fixing this also:
>
> 1. Stop having separate enable/disable functions for hflip / vflip
> 2. Move the is_streaming check, which is unique to hflip / vflip
>     into the ov2680_set_?flip() functions.
>
> for a nice code cleanup.
>
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Thanks for the detailed explanation in the last version


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/i2c/ov2680.c | 50 ++++++++++----------------------------
>   1 file changed, 13 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 2001e08253ef..c93810f84ed7 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -328,11 +328,15 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
>   	sensor->fmt.code = ov2680_hv_flip_bayer_order[hv_flip];
>   }
>   
> -static int ov2680_vflip_enable(struct ov2680_dev *sensor)
> +static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
>   {
>   	int ret;
>   
> -	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), BIT(2));
> +	if (sensor->is_streaming)
> +		return -EBUSY;
> +
> +	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1,
> +			     BIT(2), val ? BIT(2) : 0);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -340,33 +344,15 @@ static int ov2680_vflip_enable(struct ov2680_dev *sensor)
>   	return 0;
>   }
>   
> -static int ov2680_vflip_disable(struct ov2680_dev *sensor)
> +static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
>   {
>   	int ret;
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
>   	if (ret < 0)
>   		return ret;
>   
> @@ -720,19 +706,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>   	case V4L2_CID_EXPOSURE:
>   		return ov2680_exposure_set(sensor, ctrl->val);
>   	case V4L2_CID_VFLIP:
> -		if (sensor->is_streaming)
> -			return -EBUSY;
> -		if (ctrl->val)
> -			return ov2680_vflip_enable(sensor);
> -		else
> -			return ov2680_vflip_disable(sensor);
> +		return ov2680_set_vflip(sensor, ctrl->val);
>   	case V4L2_CID_HFLIP:
> -		if (sensor->is_streaming)
> -			return -EBUSY;
> -		if (ctrl->val)
> -			return ov2680_hflip_enable(sensor);
> -		else
> -			return ov2680_hflip_disable(sensor);
> +		return ov2680_set_hflip(sensor, ctrl->val);
>   	case V4L2_CID_TEST_PATTERN:
>   		return ov2680_test_pattern_set(sensor, ctrl->val);
>   	default:
