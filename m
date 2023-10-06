Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F057BBB97
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 17:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbjJFPSX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 11:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbjJFPSW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 11:18:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E95683
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 08:18:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E5F82E4;
        Fri,  6 Oct 2023 17:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696605391;
        bh=Jz2vynyinThR7h3LBbI/KDvOLvRBbWxK7PUJrXAfniE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MubInQyHVhKIaWb+mZAlKC3jptltIDveyEKC8SAolQB0CuwYH3QaelB7zdx7X5KQm
         njDzh4Ov0nZvIajYc3mivRXqtATD1i5xd6vi+RPvp8fyHo/GygbdBC6s1OCSJC2dQm
         FP6C/9RVgpWUxBhlr++LGM3vIQJG7UvE5tOqIL4I=
Date:   Fri, 6 Oct 2023 18:18:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 8/9] media: i2c: mt9m114: goto proper error path
Message-ID: <20231006151826.GB5121@pendragon.ideasonboard.com>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <6e2b3d5971905c1cf63184e7c3cd269c10151bb7.1696586632.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e2b3d5971905c1cf63184e7c3cd269c10151bb7.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Fri, Oct 06, 2023 at 12:08:49PM +0200, Hans Verkuil wrote:
> In two places the probe function returns instead of going
> to the correct goto label.
> 
> This fixes this smatch warning:
> 
> drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've already submitted
https://lore.kernel.org/linux-media/20231003192043.27690-1-laurent.pinchart@ideasonboard.com

> ---
>  drivers/media/i2c/mt9m114.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
> index dae675e52390..ac19078ceda3 100644
> --- a/drivers/media/i2c/mt9m114.c
> +++ b/drivers/media/i2c/mt9m114.c
> @@ -2367,7 +2367,7 @@ static int mt9m114_probe(struct i2c_client *client)
>  
>  	ret = mt9m114_clk_init(sensor);
>  	if (ret)
> -		return ret;
> +		goto error_ep_free;
>  
>  	/*
>  	 * Identify the sensor. The driver supports runtime PM, but needs to
> @@ -2378,7 +2378,7 @@ static int mt9m114_probe(struct i2c_client *client)
>  	ret = mt9m114_power_on(sensor);
>  	if (ret < 0) {
>  		dev_err_probe(dev, ret, "Could not power on the device\n");
> -		return ret;
> +		goto error_ep_free;
>  	}
>  
>  	ret = mt9m114_identify(sensor);

-- 
Regards,

Laurent Pinchart
