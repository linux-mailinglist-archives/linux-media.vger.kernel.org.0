Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD9F7A0C27
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 20:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjINSEB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 14:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjINSEA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 14:04:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F95B9
        for <linux-media@vger.kernel.org>; Thu, 14 Sep 2023 11:03:55 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B20AF15EF;
        Thu, 14 Sep 2023 20:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694714541;
        bh=+2zprCJ4dduF4uGcqbdggTNzfdP1DVtdATRccjoxkXo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KZDQkQPgFqbIyOAnsxDg6UTlycubG5LkjN80Re+rPyoJwsPWYSECGokpzJZVHz2JP
         n8nkmmliHF6UwjO11eZx5+aCyNeWGd0TEmf/Rcgi18PblfWIo/MqjZHlnL65e1pqSc
         2PC3Gdi/vPWjfe2fbZsMvbe1wytzRaTh+qXkJPKg=
Message-ID: <cba07ecc-74ba-3b87-f149-875e3b16b730@ideasonboard.com>
Date:   Thu, 14 Sep 2023 19:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] media: i2c: ov5693: Drop the unused streaming flag
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Daniel Scally <djrscally@gmail.com>
References: <20230914174508.785-1-laurent.pinchart@ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20230914174508.785-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent - thanks for the patch

On 14/09/2023 18:45, Laurent Pinchart wrote:
> The streaming flag in the driver's private structure is set but never
> used. Drop it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   drivers/media/i2c/ov5693.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 488ee6d9d301..d6836725ced7 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -154,7 +154,6 @@ struct ov5693_device {
>   		unsigned int inc_y_odd;
>   		unsigned int vts;
>   	} mode;
> -	bool streaming;
>   
>   	struct v4l2_subdev sd;
>   	struct media_pad pad;
> @@ -996,8 +995,6 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
>   	if (ret)
>   		goto err_power_down;
>   
> -	ov5693->streaming = !!enable;
> -
>   	if (!enable)
>   		pm_runtime_put(ov5693->dev);
>   
>
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> prerequisite-patch-id: e46ede71d8cba61ae5bf7721eb35338b9e2d36d0
> prerequisite-patch-id: 4cfba8929058f17ab103d38ea1b447126e645935
