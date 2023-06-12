Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A61A72B8BB
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 09:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbjFLHiT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 03:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbjFLHiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 03:38:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1803F170B
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 00:37:26 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB9ACDA8;
        Mon, 12 Jun 2023 09:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686555153;
        bh=EjfvJt0aee3v6JglzZv1NdrbgRXzy8NHVpBT9SS6Ljg=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=C2RkEWQiNI2ORq/OfpievTEIBeT00189qt0GJ6hzItVrD7eH3of2HcphUbQgmvuAF
         Us735ytS2DCSw8izRgA5RAihsIp1u3LBmkRSf33N2NA4/mzpwqoSkQeNs0hRzBby+X
         bASRtz5ToeUKHqna0419SK2nG6iRH8CUZfrlcEBY=
Message-ID: <a128069f-bd3c-5170-68aa-0f196d48205f@ideasonboard.com>
Date:   Mon, 12 Jun 2023 08:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-4-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 03/28] media: ov2680: Fix vflip / hflip set functions
In-Reply-To: <20230607164712.63579-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans (and everybody else)

On 07/06/2023 17:46, Hans de Goede wrote:
> ov2680_vflip_disable() / ov2680_hflip_disable() pass BIT(0) instead of
> 0 as value to ov2680_mod_reg().
>
> While fixing this also:
>
> 1. Stop having separate enable/disable functions for hflip / vflip
> 2. Move the is_streaming check, which is unique to hflip / vflip
>     into the ov2680_set_?flip() functions.


I think the code in the patch is good, but I wonder about the right way to deal with the changed 
pixel ordering following a flip/mirror. None of the other Omnivision sensor drivers I've looked at 
disallow a flip/mirror whilst streaming, but of course doing so wrecks the colours. I don't think 
that there's any reason we couldn't make the equivalent calculation to ov2680_set_bayer_order() 
within libcamera though and configure the ipu3-imgu appropriately, and so properly support a 
flip-whilst-streaming...but quite possibly I'm missing something. So I'm leaning towards "let's just 
drop the is_streaming check", but I'm interested in what everyone else thinks.

> for a nice code cleanup.
>
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov2680.c | 48 +++++++++-----------------------------
>   1 file changed, 11 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 9a9c90c8a949..c1b23c5b7818 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -328,11 +328,14 @@ static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
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
> +	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1, BIT(2), val ? BIT(2) : 0);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -340,33 +343,14 @@ static int ov2680_vflip_enable(struct ov2680_dev *sensor)
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
> +	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2, BIT(2), val ? BIT(2) : 0);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -719,19 +703,9 @@ static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
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
