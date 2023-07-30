Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6411768843
	for <lists+linux-media@lfdr.de>; Sun, 30 Jul 2023 23:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjG3V1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Jul 2023 17:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjG3V1y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Jul 2023 17:27:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93141703
        for <linux-media@vger.kernel.org>; Sun, 30 Jul 2023 14:27:52 -0700 (PDT)
Received: from [192.168.1.109] (unknown [103.251.226.29])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D80592B3;
        Sun, 30 Jul 2023 23:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1690752409;
        bh=zBZPIjsrlMtDJu7ZtCOl+ruznd7gDx/iboDDGi1gXkk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=epPXg1RobruY6tvHh3nojq/9lawXMYVr8xM0BjYZR7U2ZfQgBcjvyhhGVXJpSBTem
         P7qMCZRlE6byO0CDDE+roVs+kFcDJcpIxIm+yMng8Y/5bEfA3MDgi33etQm4R4Or4u
         Qa+mAYnQwEs4LLhNh7CmTKm3ZMMCB1M6qwdXym7k=
Message-ID: <a30d512d-d485-cf31-5e6f-0f5fe0cbe899@ideasonboard.com>
Date:   Mon, 31 Jul 2023 02:57:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 7/7] media: i2c: imx219: Simplify code handling in
 s_fmt
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
 <20230710155203.92366-8-jacopo.mondi@ideasonboard.com>
From:   Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20230710155203.92366-8-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On 7/10/23 9:22 PM, Jacopo Mondi wrote:
> The imx219_set_pad_format() function adjusts the media bus code provided
> through the v4l2_subdev_format parameter to a media bus code known
> to be supported by the sensor.
>
> The same exact operation is performed by the imx219_get_format_code()
> function which called by imx219_update_pad_format(), which is in the
> imx219_set_pad_format() call path.
>
> Remove the duplicated operation and simplify imx219_set_pad_format().
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   drivers/media/i2c/imx219.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 4f214f10846c..a1136fdfbed2 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -750,21 +750,13 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>   	const struct imx219_mode *mode;
>   	int exposure_max, exposure_def, hblank;
>   	struct v4l2_mbus_framefmt *format;
> -	unsigned int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
> -		if (imx219_mbus_formats[i] == fmt->format.code)
> -			break;
> -	if (i >= ARRAY_SIZE(imx219_mbus_formats))
> -		i = 0;
>   
>   	mode = v4l2_find_nearest_size(supported_modes,
>   				      ARRAY_SIZE(supported_modes),
>   				      width, height,
>   				      fmt->format.width, fmt->format.height);
>   
> -	imx219_update_pad_format(imx219, mode, &fmt->format,
> -				 imx219_mbus_formats[i]);
> +	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
>   	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
>   
>   	if (imx219->mode == mode && format->code == fmt->format.code)

