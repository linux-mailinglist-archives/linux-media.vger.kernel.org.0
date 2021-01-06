Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3FC2EBF9B
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 15:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbhAFO3w convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 6 Jan 2021 09:29:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbhAFO3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 09:29:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36333C061358
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 06:29:12 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9oE-0007Nd-Si; Wed, 06 Jan 2021 15:29:10 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kx9oE-0002V2-JZ; Wed, 06 Jan 2021 15:29:10 +0100
Message-ID: <e427ab2b8d666eca43e22076411fbbab7d8b903a.camel@pengutronix.de>
Subject: Re: [PATCH 13/75] media: imx: capture: Remove capture_priv stop
 field
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Wed, 06 Jan 2021 15:29:10 +0100
In-Reply-To: <20210105152852.5733-14-laurent.pinchart@ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
         <20210105152852.5733-14-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-01-05 at 17:27 +0200, Laurent Pinchart wrote:
> The stop field in the capture_priv structure is only set, never read.
> Drop it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/staging/media/imx/imx-media-capture.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index dd3861a96cb8..4f9cff62eb1f 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -45,8 +45,6 @@ struct capture_priv {
>  	spinlock_t q_lock;			/* Protect ready_q */
>  
>  	struct v4l2_ctrl_handler ctrl_hdlr;	/* Controls inherited from subdevs */
> -
> -	bool stop;				/* streaming is stopping */
>  };
>  
>  #define to_capture_priv(v) container_of(v, struct capture_priv, vdev)
> @@ -573,8 +571,6 @@ static int capture_start_streaming(struct vb2_queue *vq, unsigned int count)
>  		goto return_bufs;
>  	}
>  
> -	priv->stop = false;
> -
>  	return 0;
>  
>  return_bufs:
> @@ -595,10 +591,6 @@ static void capture_stop_streaming(struct vb2_queue *vq)
>  	unsigned long flags;
>  	int ret;
>  
> -	spin_lock_irqsave(&priv->q_lock, flags);
> -	priv->stop = true;
> -	spin_unlock_irqrestore(&priv->q_lock, flags);
> -
>  	ret = imx_media_pipeline_set_stream(priv->md, &priv->src_sd->entity,
>  					    false);
>  	if (ret)

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
