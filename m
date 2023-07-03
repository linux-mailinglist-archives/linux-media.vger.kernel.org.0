Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8AD745606
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 09:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjGCH0s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 03:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbjGCH0p (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 03:26:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570A7E4F
        for <linux-media@vger.kernel.org>; Mon,  3 Jul 2023 00:26:33 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C72627C;
        Mon,  3 Jul 2023 09:25:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688369148;
        bh=t69wOI4eIm1A0yJ5I65tNyZpqn/ljTy9tXlLq0Z2nC4=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=TifY27obrpISKj5nWQfP2r3usMxLZnMx6f8Uct024paVDQh8/D/iW1p+UHZ40dMsI
         3Dx1kFWVr0AqDXjCjQo6e+o2Q8AJTjuvxPUaeJNr+DtzQMh9FJuf+c6n9PuOa3l4+H
         p/TOZswDv0VKlmJYyUWnol95MtdO+V4IAVxSpTPg=
Message-ID: <f76a4dff-0507-5236-20ed-0ae464e6d359@ideasonboard.com>
Date:   Mon, 3 Jul 2023 08:26:28 +0100
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
 <20230627131830.54601-19-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 18/29] media: ov2680: Fix ov2680_enum_frame_interval()
In-Reply-To: <20230627131830.54601-19-hdegoede@redhat.com>
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


On 27/06/2023 15:18, Hans de Goede wrote:
> Fix and simplify ov2680_enum_frame_interval(), the index is not
> an index into ov2680_mode_data[], so using OV2680_MODE_MAX is wrong.
>
> Instead it is an index indexing the different framerates for
> the resolution specified in fie->width, fie->height.
>
> Since the ov2680 code only supports a single fixed framerate,
> index must always be 0 and we don't need to check the other
> fie input values.


But in this case the user could ask which single frame interval is supported for a frame size that 
is _not_ supported, and be told that the driver can give them 30fps. I think we still need to check 
the validity of the other inputs and return -EINVAL when they're invalid.

>
> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/media/i2c/ov2680.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index b011dadbb98a..7ca70877abf1 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -532,17 +532,13 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
>   			      struct v4l2_subdev_state *sd_state,
>   			      struct v4l2_subdev_frame_interval_enum *fie)
>   {
> -	struct v4l2_fract tpf;
> +	struct ov2680_dev *sensor = to_ov2680_dev(sd);
>   
> -	if (fie->index >= OV2680_MODE_MAX || fie->width > OV2680_WIDTH_MAX ||
> -	    fie->height > OV2680_HEIGHT_MAX ||
> -	    fie->which > V4L2_SUBDEV_FORMAT_ACTIVE)
> +	/* Only 1 framerate */
> +	if (fie->index)
>   		return -EINVAL;
>   
> -	tpf.denominator = OV2680_FRAME_RATE;
> -	tpf.numerator = 1;
> -
> -	fie->interval = tpf;
> +	fie->interval = sensor->frame_interval;
>   
>   	return 0;
>   }
