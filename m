Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2936D56B4
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 04:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbjDDCZl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 22:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjDDCZk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 22:25:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611741BEF
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 19:25:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp [118.241.147.243])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CECD7F8;
        Tue,  4 Apr 2023 04:25:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1680575137;
        bh=i9klPCWMa8/2rFc4/MSCGVBV7ZJdrrxvQYjM9CpoxKA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cCN+0G6GlL5pcWmwq0HzLpI+zrqBCdBCIwul27p7cX8yeUamNafK3g2iQSt80pWg5
         I9lMjCivTk04VKcuFrweOg4a1VqP2a/5FmEU3/Rpx36mxJM5ASM1gfj64gQ20WlcLj
         OgLF2l4BiMnKRRQ8hHIzQ7YWKfGFqgxlYMJXQzAw=
Date:   Tue, 4 Apr 2023 05:25:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel@pengutronix.de
Subject: Re: [PATCH 13/24] staging: media: omap4iss: Convert to platform
 remove callback returning void
Message-ID: <20230404022545.GB16648@pendragon.ideasonboard.com>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-14-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403154014.2564054-14-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Uwe,

Thank you for the patch.

On Mon, Apr 03, 2023 at 05:40:03PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/omap4iss/iss.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
> index fa2a36d829d3..0c4283bb48ad 100644
> --- a/drivers/staging/media/omap4iss/iss.c
> +++ b/drivers/staging/media/omap4iss/iss.c
> @@ -1323,15 +1323,13 @@ static int iss_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int iss_remove(struct platform_device *pdev)
> +static void iss_remove(struct platform_device *pdev)
>  {
>  	struct iss_device *iss = platform_get_drvdata(pdev);
>  
>  	iss_unregister_entities(iss);
>  	media_entity_enum_cleanup(&iss->crashed);
>  	iss_cleanup_modules(iss);
> -
> -	return 0;
>  }
>  
>  static const struct platform_device_id omap4iss_id_table[] = {
> @@ -1342,7 +1340,7 @@ MODULE_DEVICE_TABLE(platform, omap4iss_id_table);
>  
>  static struct platform_driver iss_driver = {
>  	.probe		= iss_probe,
> -	.remove		= iss_remove,
> +	.remove_new	= iss_remove,
>  	.id_table	= omap4iss_id_table,
>  	.driver = {
>  		.name	= "omap4iss",

-- 
Regards,

Laurent Pinchart
