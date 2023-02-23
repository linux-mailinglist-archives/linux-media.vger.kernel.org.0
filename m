Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B2F6A0E5B
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 18:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBWRJx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 12:09:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjBWRJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 12:09:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE403B0D7;
        Thu, 23 Feb 2023 09:09:48 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBE6A496;
        Thu, 23 Feb 2023 18:09:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677172187;
        bh=YmI4bePew5s3iR1SwM70b3C4XVKZZhwCBWDJWMAo3ys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MZAwOID6CizODhmxXPwbNkZucge1abyxa5+aWB1pf8wJGed1gSXZpVjpr60UeePBd
         A5rEeu9qY2myOvIsM4J646cgMbWhsinDMBmBm06KL7VX2DceKOIRMHbOyPebtjF3K8
         gLe1zrgRpU9UV5APHbr+1yyvqClShJErUf1VW0lE=
Date:   Thu, 23 Feb 2023 19:09:45 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx296: fix error checking in
 imx296_read_temperature()
Message-ID: <Y/ed2Z/gobzgo1cb@pendragon.ideasonboard.com>
References: <Y/Yf19AE78jn5YW7@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/Yf19AE78jn5YW7@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Wed, Feb 22, 2023 at 04:59:51PM +0300, Dan Carpenter wrote:
> The "& IMX296_TMDOUT_MASK" means that "tmdout" can't be negative so the
> error checking will not work.
> 
> Fixes: cb33db2b6ccf ("media: i2c: IMX296 camera sensor driver")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/imx296.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
> index 3c12b6edeac9..bb0c896f3d67 100644
> --- a/drivers/media/i2c/imx296.c
> +++ b/drivers/media/i2c/imx296.c
> @@ -931,10 +931,12 @@ static int imx296_read_temperature(struct imx296 *sensor, int *temp)
>  	if (ret < 0)
>  		return ret;
>  
> -	tmdout = imx296_read(sensor, IMX296_TMDOUT) & IMX296_TMDOUT_MASK;
> +	tmdout = imx296_read(sensor, IMX296_TMDOUT);
>  	if (tmdout < 0)
>  		return tmdout;
>  
> +	tmdout &= IMX296_TMDOUT_MASK;
> +
>  	/* T(°C) = 246.312 - 0.304 * TMDOUT */;
>  	*temp = 246312 - 304 * tmdout;
>  

-- 
Regards,

Laurent Pinchart
