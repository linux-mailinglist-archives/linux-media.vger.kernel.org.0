Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5FC572B8AD
	for <lists+linux-media@lfdr.de>; Mon, 12 Jun 2023 09:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbjFLHfB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jun 2023 03:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234633AbjFLHey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jun 2023 03:34:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D8619B7
        for <linux-media@vger.kernel.org>; Mon, 12 Jun 2023 00:34:20 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89724547;
        Mon, 12 Jun 2023 09:22:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686554529;
        bh=8sD7aDM68A4FaoODFuPjGxz8YQq6VfaQfrrxt0cgnHM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=waViUL5uYNT56xICjhfbfuwxhuVX0UiWnsJttjmLVZIgV7CxeJlu5pKpe+YvWrljQ
         kgWaIw+ITxrNdU66hzEmJKoSu2z1wpLDzWWZycSbCt1KqK0Fk6JO2Sll5D5Y4K15Je
         H1+ggPTVcpwbY+tRuj9j8Gvv9pjqnog45Ux2M0Sk=
Message-ID: <b2955815-832b-82bf-bc2d-1a3135048931@ideasonboard.com>
Date:   Mon, 12 Jun 2023 08:22:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 02/28] media: ov2680: Fix ov2680_bayer_order()
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-3-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230607164712.63579-3-hdegoede@redhat.com>
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

Hi Hans

On 07/06/2023 17:46, Hans de Goede wrote:
> The index into ov2680_hv_flip_bayer_order[] should be 0-3, but
> ov2680_bayer_order() was using 0 + BIT(2) + (BIT(2) << 1) as
> max index, while the intention was to use: 0 + 1 + 2 as max index.
>
> Fix the index calculation in ov2680_bayer_order(), while at it
> also just use the ctrl values rather then reading them back using
> a slow i2c-read transaction.
>
> This also allows making the function void, since there now are
> no more i2c-reads to error check.
>
> Note the check for the ctrls being NULL is there to allow
> adding an ov2680_fill_format() helper later, which will call
> ov2680_set_bayer_order() during probe() before the ctrls are created.
>
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/i2c/ov2680.c | 27 ++++++++++-----------------
>   1 file changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 02204e185e2f..9a9c90c8a949 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -315,26 +315,17 @@ static void ov2680_power_down(struct ov2680_dev *sensor)
>   	usleep_range(5000, 10000);
>   }
>   
> -static int ov2680_bayer_order(struct ov2680_dev *sensor)
> +static void ov2680_set_bayer_order(struct ov2680_dev *sensor)
>   {
> -	u32 format1;
> -	u32 format2;
> -	u32 hv_flip;
> -	int ret;
> +	int hv_flip = 0;
>   
> -	ret = ov2680_read_reg(sensor, OV2680_REG_FORMAT1, &format1);
> -	if (ret < 0)
> -		return ret;
> +	if (sensor->ctrls.vflip && sensor->ctrls.vflip->val)
> +		hv_flip += 1;
>   
> -	ret = ov2680_read_reg(sensor, OV2680_REG_FORMAT2, &format2);
> -	if (ret < 0)
> -		return ret;
> -
> -	hv_flip = (format2 & BIT(2)  << 1) | (format1 & BIT(2));
> +	if (sensor->ctrls.hflip && sensor->ctrls.hflip->val)
> +		hv_flip += 2;
>   
>   	sensor->fmt.code = ov2680_hv_flip_bayer_order[hv_flip];
> -
> -	return 0;
>   }
>   
>   static int ov2680_vflip_enable(struct ov2680_dev *sensor)
> @@ -345,7 +336,8 @@ static int ov2680_vflip_enable(struct ov2680_dev *sensor)
>   	if (ret < 0)
>   		return ret;
>   
> -	return ov2680_bayer_order(sensor);
> +	ov2680_set_bayer_order(sensor);
> +	return 0;
>   }
>   
>   static int ov2680_vflip_disable(struct ov2680_dev *sensor)
> @@ -378,7 +370,8 @@ static int ov2680_hflip_disable(struct ov2680_dev *sensor)
>   	if (ret < 0)
>   		return ret;
>   
> -	return ov2680_bayer_order(sensor);
> +	ov2680_set_bayer_order(sensor);
> +	return 0;
>   }
>   
>   static int ov2680_test_pattern_set(struct ov2680_dev *sensor, int value)
