Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A737768000
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 16:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbjG2OUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jul 2023 10:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjG2OUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jul 2023 10:20:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A66830F3
        for <linux-media@vger.kernel.org>; Sat, 29 Jul 2023 07:20:48 -0700 (PDT)
Received: from [192.168.1.108] (unknown [103.238.109.7])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA93B8D;
        Sat, 29 Jul 2023 16:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690640385;
        bh=HLYjHYdZ772OLdLIpQRuWPLVG41uJi1KmuthYIHbBQo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IsViRk+ko7tXuBTHw75r3mQDw46dCuMcQrybfKC97FKooP8+DLUd/yt5UxVAeBmAR
         uTG73CpYeBZRdU+TVYPCV+520jzvqMtr/WHd8VXk516ct/BP2a/OQnUe4y9BA2teP3
         tkWhZXguZ9mc2y19z5UekG/mV9QHen6zLP6U9Au0=
Message-ID: <ce91edfa-7f42-248f-ab91-99be7227aa87@ideasonboard.com>
Date:   Sat, 29 Jul 2023 19:50:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] media: i2c: imx219: Complete default format
 initialization
Content-Language: en-US
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
 <20230710155203.92366-4-jacopo.mondi@ideasonboard.com>
From:   Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20230710155203.92366-4-jacopo.mondi@ideasonboard.com>
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

Hi Jacopo,

On 7/10/23 9:21 PM, Jacopo Mondi wrote:
> Complete the default format initialization in init_cfg() filling in
> the fields for the colorspace configuration copied from
> imx219_set_default_format().
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   drivers/media/i2c/imx219.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 45b219321d98..cd43a897391c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -714,6 +714,12 @@ static int imx219_init_cfg(struct v4l2_subdev *sd,
>   	format->code = imx219_get_format_code(imx219,
>   					      MEDIA_BUS_FMT_SRGGB10_1X10);
>   	format->field = V4L2_FIELD_NONE;
> +	format->colorspace = V4L2_COLORSPACE_SRGB;
> +	format->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(format->colorspace);
> +	format->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(true,
> +							     format->colorspace,
> +							     format->ycbcr_enc);
> +	format->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(format->colorspace);
>   
>   	/* Initialize crop rectangle. */
>   	crop = v4l2_subdev_get_pad_crop(sd, state, 0);

