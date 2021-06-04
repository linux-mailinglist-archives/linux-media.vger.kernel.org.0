Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9675639BA5D
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhFDN5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbhFDN5f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:57:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15865C061766
        for <linux-media@vger.kernel.org>; Fri,  4 Jun 2021 06:55:49 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8662E2A3;
        Fri,  4 Jun 2021 15:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622814947;
        bh=Bc9RKGJwXk6DslkpJT5wzzuPrEIgi0atu8gAwMKdtw8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iJQ0epSJG/ej+RvQ4ahrnwQS5YWJEaAtLTIbnnPsrY0yQbAltfGnNMlfEi0yY96ww
         j9mBky7ySfumX9L49/3vA2erg1q32zE9a3cKo09AFO33ZAZ1QhnVcD9pXe7ox5tOLN
         Mm0EZ7QgVKkAQpWM5ucBio7m6N1/kdqeSwFhbluA=
Date:   Fri, 4 Jun 2021 16:55:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 30/38] media: ti-vpe: cal: fix ctx uninitialization
Message-ID: <YLow19vNPjmGXfPH@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-31-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-31-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:09:01PM +0300, Tomi Valkeinen wrote:
> Somewhere along the way the context uninitialization has gone a bit odd:
> 
> * We have cal_ctx_create() but no matching destroy call, but we still
> need to call cal_ctx_v4l2_cleanup() for each context.
> 
> * We have cal_media_cleanup() which calls cal_ctx_v4l2_cleanup() for all
> contexts, but cal_media_init() is not where the contexts are created.
> 
> * The order of uninit steps in cal_remove() is different than the error
> handling path in cal_probe().
> 
> * cal_probe()'s error handling calls cal_ctx_v4l2_cleanup() for each
> context, but also calls cal_media_clean(), doing the same context
> cleanup twice.
> 
> So fix these, by introducing cal_ctx_destroy(), and using that in
> appropriate places instead of calling cal_ctx_v4l2_cleanup() in
> cal_media_clean(). Also use normal kzalloc (and kfree) instead of devm
> version as we anyway do manual cleanup for each context.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index bb99d0ce796f..888706187fd1 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -894,11 +894,6 @@ static int cal_media_init(struct cal_dev *cal)
>   */
>  static void cal_media_cleanup(struct cal_dev *cal)
>  {
> -	unsigned int i;
> -
> -	for (i = 0; i < cal->num_contexts; i++)
> -		cal_ctx_v4l2_cleanup(cal->ctx[i]);
> -
>  	v4l2_device_unregister(&cal->v4l2_dev);
>  	media_device_cleanup(&cal->mdev);
>  
> @@ -915,7 +910,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>  	struct cal_ctx *ctx;
>  	int ret;
>  
> -	ctx = devm_kzalloc(cal->dev, sizeof(*ctx), GFP_KERNEL);
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return NULL;
>  
> @@ -934,6 +929,13 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
>  	return ctx;
>  }
>  
> +static void cal_ctx_destroy(struct cal_ctx *ctx)
> +{
> +	cal_ctx_v4l2_cleanup(ctx);
> +
> +	kfree(ctx);
> +}
> +
>  static const struct of_device_id cal_of_match[] = {
>  	{
>  		.compatible = "ti,dra72-cal",
> @@ -1148,7 +1150,7 @@ static int cal_probe(struct platform_device *pdev)
>  
>  error_context:
>  	for (i = 0; i < cal->num_contexts; i++)
> -		cal_ctx_v4l2_cleanup(cal->ctx[i]);
> +		cal_ctx_destroy(cal->ctx[i]);
>  
>  error_camerarx:
>  	for (i = 0; i < cal->data->num_csi2_phy; i++)
> @@ -1176,11 +1178,14 @@ static int cal_remove(struct platform_device *pdev)
>  	for (i = 0; i < cal->data->num_csi2_phy; i++)
>  		cal_camerarx_disable(cal->phy[i]);
>  
> -	cal_media_cleanup(cal);
> +	for (i = 0; i < cal->num_contexts; i++)
> +		cal_ctx_destroy(cal->ctx[i]);
>  
>  	for (i = 0; i < cal->data->num_csi2_phy; i++)
>  		cal_camerarx_destroy(cal->phy[i]);
>  
> +	cal_media_cleanup(cal);
> +
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
>  

-- 
Regards,

Laurent Pinchart
