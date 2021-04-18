Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F29F363585
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhDRN3j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRN3i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:29:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66E3C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 06:29:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4167649B;
        Sun, 18 Apr 2021 15:29:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618752549;
        bh=yg9Z2S42VG61yS0em8eDxgJTJZ8SxklIb9FLJZgMeOQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S1+w3FMHsapspnCMihq5PqQrp8xVXFAahSVrmDj8ZcvmfPPANCgB3dd4MsZd3vjKG
         sqCC58WhTdOTXLpU21+cdRPJiKj7DvW8UuM6gqSbfiesIJGrfU3ciIVc0IqfZngURX
         BlYkX1WBnkfwnDjU4inECykZmc/zxV18f8fm+FwQ=
Date:   Sun, 18 Apr 2021 16:29:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 28/28] media: ti-vpe: cal: support 8 DMA contexts
Message-ID: <YHw0IqEHbct3PcqR@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-29-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-29-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:57PM +0300, Tomi Valkeinen wrote:
> The current driver only ever needs 2 DMA contexts (one per PHY), but we
> need to use more of the 8 contexts to add support for multiple streams.
> 
> Change the code so that we allocate DMA contexts as needed, which at
> this time is 1 per PHY, but could be up to 8.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 38 ++++++++++++-----------------
>  drivers/media/platform/ti-vpe/cal.h |  5 ++--
>  2 files changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 91d2139adc9b..781fb14f4c7a 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -657,7 +657,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>  		/* Clear Interrupt status */
>  		cal_write(cal, CAL_HL_IRQSTATUS(1), status);
>  
> -		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> +		for (i = 0; i < cal->num_contexts; ++i) {
>  			if (status & CAL_HL_IRQ_WDMA_END_MASK(i))
>  				cal_irq_wdma_end(cal->ctx[i]);
>  		}
> @@ -671,7 +671,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
>  		/* Clear Interrupt status */
>  		cal_write(cal, CAL_HL_IRQSTATUS(2), status);
>  
> -		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> +		for (i = 0; i < cal->num_contexts; ++i) {
>  			if (status & CAL_HL_IRQ_WDMA_START_MASK(i))
>  				cal_irq_wdma_start(cal->ctx[i]);
>  		}
> @@ -741,10 +741,8 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  	unsigned int i;
>  	int ret = 0;
>  
> -	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> -		if (cal->ctx[i])
> -			cal_ctx_v4l2_register(cal->ctx[i]);
> -	}
> +	for (i = 0; i < cal->num_contexts; ++i)
> +		cal_ctx_v4l2_register(cal->ctx[i]);
>  
>  	if (cal_mc_api)
>  		ret = v4l2_device_register_subdev_nodes(&cal->v4l2_dev);
> @@ -846,10 +844,8 @@ static void cal_media_unregister(struct cal_dev *cal)
>  	unsigned int i;
>  
>  	/* Unregister all the V4L2 video devices. */
> -	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
> -		if (cal->ctx[i])
> -			cal_ctx_v4l2_unregister(cal->ctx[i]);
> -	}
> +	for (i = 0; i < cal->num_contexts; i++)
> +		cal_ctx_v4l2_unregister(cal->ctx[i]);
>  
>  	cal_async_notifier_unregister(cal);
>  	media_device_unregister(&cal->mdev);
> @@ -896,10 +892,8 @@ static void cal_media_cleanup(struct cal_dev *cal)
>  {
>  	unsigned int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
> -		if (cal->ctx[i])
> -			cal_ctx_v4l2_cleanup(cal->ctx[i]);
> -	}
> +	for (i = 0; i < cal->num_contexts; i++)
> +		cal_ctx_v4l2_cleanup(cal->ctx[i]);
>  
>  	v4l2_device_unregister(&cal->v4l2_dev);
>  	media_device_cleanup(&cal->mdev);
> @@ -1048,7 +1042,6 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
>  static int cal_probe(struct platform_device *pdev)
>  {
>  	struct cal_dev *cal;
> -	struct cal_ctx *ctx;
>  	bool connected = false;
>  	unsigned int i;
>  	int ret;
> @@ -1132,12 +1125,14 @@ static int cal_probe(struct platform_device *pdev)
>  		if (!cal->phy[i]->source_node)
>  			continue;
>  
> -		cal->ctx[i] = cal_ctx_create(cal, i);
> -		if (!cal->ctx[i]) {
> -			cal_err(cal, "Failed to create context %u\n", i);
> +		cal->ctx[cal->num_contexts] = cal_ctx_create(cal, i);
> +		if (!cal->ctx[cal->num_contexts]) {
> +			cal_err(cal, "Failed to create context %u\n", cal->num_contexts);

Line wrap.

I would have kept indexing the array using i though. This code will be
reworked later, and for now I think it would make it more readable to
avoid this particular change.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  			ret = -ENODEV;
>  			goto error_context;
>  		}
> +
> +		cal->num_contexts++;
>  	}
>  
>  	/* Register the media device. */
> @@ -1148,11 +1143,8 @@ static int cal_probe(struct platform_device *pdev)
>  	return 0;
>  
>  error_context:
> -	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
> -		ctx = cal->ctx[i];
> -		if (ctx)
> -			cal_ctx_v4l2_cleanup(ctx);
> -	}
> +	for (i = 0; i < cal->num_contexts; i++)
> +		cal_ctx_v4l2_cleanup(cal->ctx[i]);
>  
>  error_camerarx:
>  	for (i = 0; i < cal->data->num_csi2_phy; i++)
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 7f35ad5ceac2..783876d7cf40 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -29,7 +29,7 @@
>  #include <media/videobuf2-v4l2.h>
>  
>  #define CAL_MODULE_NAME			"cal"
> -#define CAL_NUM_CONTEXT			2
> +#define CAL_MAX_NUM_CONTEXT		8
>  #define CAL_NUM_CSI2_PORTS		2
>  
>  /*
> @@ -182,7 +182,8 @@ struct cal_dev {
>  	/* Camera Core Module handle */
>  	struct cal_camerarx	*phy[CAL_NUM_CSI2_PORTS];
>  
> -	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
> +	u32 num_contexts;
> +	struct cal_ctx		*ctx[CAL_MAX_NUM_CONTEXT];
>  
>  	struct media_device	mdev;
>  	struct v4l2_device	v4l2_dev;

-- 
Regards,

Laurent Pinchart
