Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC13733391
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 16:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345504AbjFPO1e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 10:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242043AbjFPO1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 10:27:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD95330E3
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 07:27:32 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42AC2C67;
        Fri, 16 Jun 2023 16:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686925619;
        bh=zLi90lQFtrxYxC7yb7TQtpEmOKBT+eP3vfXUSWkplOY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=rQJgbZkKgqTUMLWP4zXCUscQbHFK2HQGDRVPwYlM9oj3ZHSdt0JFNLSvQdEdLeYPm
         GCVH9XEZgvwYvbCg3gWc8nArEdN55kCERmYzICWjLp/fcyVI6aFbM3lCaShLrtKs+/
         1x6PUP8Jd46GTe1oOvVW9qH7R0mey5Itmwc+ILXM=
Message-ID: <85a2d382-573d-c65f-8f1f-c50e0391e54d@ideasonboard.com>
Date:   Fri, 16 Jun 2023 15:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 08/28] media: ov2680: Fix regulators being left enabled
 on ov2680_power_on() errors
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
References: <20230615141349.172363-1-hdegoede@redhat.com>
 <20230615141349.172363-9-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230615141349.172363-9-hdegoede@redhat.com>
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
> When the ov2680_power_on() "sensor soft reset failed" path is hit during
> probe() the WARN() about putting an enabled regulator at
> drivers/regulator/core.c:2398 triggers 3 times (once for each regulator),
> filling dmesg with backtraces.
>
> Fix this by properly disabling the regulators on ov2680_power_on() errors.
>
> Fixes: 3ee47cad3e69 ("media: ov2680: Add Omnivision OV2680 sensor driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/i2c/ov2680.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 7fc4b39ebb37..55fc56ffad31 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -475,7 +475,7 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
>   		ret = ov2680_write_reg(sensor, OV2680_REG_SOFT_RESET, 0x01);
>   		if (ret != 0) {
>   			dev_err(dev, "sensor soft reset failed\n");
> -			return ret;
> +			goto err_disable_regulators;
>   		}
>   		usleep_range(1000, 2000);
>   	} else {
> @@ -485,7 +485,7 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
>   
>   	ret = clk_prepare_enable(sensor->xvclk);
>   	if (ret < 0)
> -		return ret;
> +		goto err_disable_regulators;
>   
>   	sensor->is_enabled = true;
>   
> @@ -495,6 +495,10 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
>   	ov2680_stream_disable(sensor);
>   
>   	return 0;
> +
> +err_disable_regulators:
> +	regulator_bulk_disable(OV2680_NUM_SUPPLIES, sensor->supplies);
> +	return ret;
>   }
>   
>   static int ov2680_s_power(struct v4l2_subdev *sd, int on)
