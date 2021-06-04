Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F331E39BA68
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 15:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhFDN7w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 09:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhFDN7v (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 09:59:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AEDC061766
        for <linux-media@vger.kernel.org>; Fri,  4 Jun 2021 06:58:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7D842A3;
        Fri,  4 Jun 2021 15:58:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622815084;
        bh=hdP5kly/zNcS89xG+ahuKafNi8f7q9etlmA6gO7HZUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aVXBaR5/PUEtgo0pyq/szOturml632wpYNx5yJGGJ305wAyje5vgi04NJUtvSy2T6
         UBCRD6NcBfesdGhNMITvQaSRbrwDZH6VWhg3qLWa85DOde2wWfduetSsQRJDgLeyQd
         6IeI8rG7hmsn+cZ2N2pYYAmDxyBy//hmsDwy5NEY=
Date:   Fri, 4 Jun 2021 16:57:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 31/38] media: ti-vpe: cal: fix queuing of the initial
 buffer
Message-ID: <YLoxX8G9w45rFJ6f@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-32-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210524110909.672432-32-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, May 24, 2021 at 02:09:02PM +0300, Tomi Valkeinen wrote:
> When starting streaming the driver currently programs the buffer
> address to the CAL base-address register and assigns the buffer pointer
> to ctx->dma.pending. This is not correct, as the buffer is not
> "pending", but active, and causes the first buffer to be needlessly
> written twice.
> 
> Fix this by assigning the buffer pointer to ctx->dma.active.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/ti-vpe/cal-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index d06488cb8c36..efa08a9ccbd5 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -731,7 +731,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  	spin_lock_irq(&ctx->dma.lock);
>  	buf = list_first_entry(&ctx->dma.queue, struct cal_buffer, list);
> -	ctx->dma.pending = buf;
> +	ctx->dma.active = buf;
>  	list_del(&buf->list);
>  	spin_unlock_irq(&ctx->dma.lock);
>  

-- 
Regards,

Laurent Pinchart
