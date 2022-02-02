Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 513184A734F
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 15:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235226AbiBBOgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 09:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiBBOgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 09:36:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D1CC061714
        for <linux-media@vger.kernel.org>; Wed,  2 Feb 2022 06:36:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57C37D88;
        Wed,  2 Feb 2022 15:36:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643812579;
        bh=1I+wo8Dk6fkDf7t67WQ0GtJVsAfCRsrAUD4/Al4W38M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UfzB0mZqK/Ct/nKJSFgl1s8L0Pb5Gjp178QVWgRu9kjKJifrBuZn1SaJtVeNuO4Gx
         IRpW2QYO/SSjLz6lumuYJEDXglwm6oZfIakXrH7tqi6m0xKstiMZORnGRf83tcNhyg
         gYygOu99RKTJvim1RLQOwVlqAwLFun56SlS0GTog=
Date:   Wed, 2 Feb 2022 16:35:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: i2c: ov08d10: Unlock on error in
 ov08d10_enum_frame_size()
Message-ID: <YfqWzIyK+dX4+AVf@pendragon.ideasonboard.com>
References: <20220202141121.238930-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220202141121.238930-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 02, 2022 at 04:11:21PM +0200, Sakari Ailus wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> 
> This error path needs to drop the mutex to avoid a deadlock.
> 
> Fixes: 7be91e02ed57 ("media: i2c: Add ov08d10 camera sensor driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I want RAII in C :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov08d10.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
> index 1f42dd714ef6..e5ef6466a3ec 100644
> --- a/drivers/media/i2c/ov08d10.c
> +++ b/drivers/media/i2c/ov08d10.c
> @@ -1264,8 +1264,10 @@ static int ov08d10_enum_frame_size(struct v4l2_subdev *sd,
>  		return -EINVAL;
>  
>  	mutex_lock(&ov08d10->mutex);
> -	if (fse->code != ov08d10_get_format_code(ov08d10))
> +	if (fse->code != ov08d10_get_format_code(ov08d10)) {
> +		mutex_unlock(&ov08d10->mutex);
>  		return -EINVAL;
> +	}
>  	mutex_unlock(&ov08d10->mutex);
>  
>  	fse->min_width = ov08d10->priv_lane->sp_modes[fse->index].width;

-- 
Regards,

Laurent Pinchart
