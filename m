Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD57239BA8A
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 16:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhFDOGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 10:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbhFDOGu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 10:06:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC52C061766
        for <linux-media@vger.kernel.org>; Fri,  4 Jun 2021 07:05:04 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96DBF2A3;
        Fri,  4 Jun 2021 16:05:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622815502;
        bh=APqxrIj9Dooa3A2VKHJ0QvsCcloPfJ5Br/2EbI3pXDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p+zc7ALTwoQU6jxQrm5l09cX6CaTIQs+3COY4X+6nXlw8pu86Rpg5eul8scHIBbF7
         Emff60c67NLWcALIGc0X+obhrbZc6OfUlXVsUs0Ef2m5kYLKAOeGtYTQobck4hnVL4
         VEWCknufJuJZPgO3kfaQCXZfH9wAvQmxfUYcouD8=
Date:   Fri, 4 Jun 2021 17:04:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 32/38] media: ti-vpe: cal: use CSI-2 frame number
Message-ID: <YLozAqLmoKnHzQEi@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-33-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-33-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:09:03PM +0300, Tomi Valkeinen wrote:
> The driver fills buf->vb.sequence with an increasing number which is
> incremented by the driver. This feels a bit pointless, as the userspace
> could as well track that kind of number itself. Instead, lets use the

s/lets/let's/

> frame number provided in the CSI-2 data from the sensor.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 7 +++++--
>  drivers/media/platform/ti-vpe/cal.h | 1 -
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 888706187fd1..62c45add4efe 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -493,7 +493,6 @@ void cal_ctx_unprepare(struct cal_ctx *ctx)
>  
>  void cal_ctx_start(struct cal_ctx *ctx)
>  {
> -	ctx->sequence = 0;
>  	ctx->dma.state = CAL_DMA_RUNNING;
>  
>  	/* Configure the CSI-2, pixel processing and write DMA contexts. */
> @@ -586,6 +585,10 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
>  static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
>  {
>  	struct cal_buffer *buf = NULL;
> +	u32 frame_num;
> +
> +	frame_num = cal_read(ctx->cal, CAL_CSI2_STATUS(ctx->phy->instance,
> +						       ctx->csi2_ctx)) & 0xffff;
>  
>  	spin_lock(&ctx->dma.lock);
>  
> @@ -607,7 +610,7 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
>  	if (buf) {
>  		buf->vb.vb2_buf.timestamp = ktime_get_ns();
>  		buf->vb.field = ctx->v_fmt.fmt.pix.field;
> -		buf->vb.sequence = ctx->sequence++;
> +		buf->vb.sequence = frame_num;

We'll need something a bit more complicated. The CSI-2 frame number is
not mandatory, and when used, it is a 16-bit number starting at 1 and
counting to an unspecified value larger than one, resetting to 1 at the
end of the cycle. The V4L2 sequence number, on the other hand, is a
monotonic counter starting at 0 and wrapping only at 2^32-1. We should
thus keep a software sequence counter and

- increase it by 1 if the frame number is zero
- increase it by frame_num - last_frame_num (with wrap-around of
  frame_num handled) otherwise

>  		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>  	}
>  }
> diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
> index 400f95485d7c..ad08c189ad3b 100644
> --- a/drivers/media/platform/ti-vpe/cal.h
> +++ b/drivers/media/platform/ti-vpe/cal.h
> @@ -217,7 +217,6 @@ struct cal_ctx {
>  	const struct cal_format_info	**active_fmt;
>  	unsigned int		num_active_fmt;
>  
> -	unsigned int		sequence;
>  	struct vb2_queue	vb_vidq;
>  	u8			dma_ctx;
>  	u8			cport;

-- 
Regards,

Laurent Pinchart
