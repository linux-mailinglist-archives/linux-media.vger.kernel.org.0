Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA8812906AA
	for <lists+linux-media@lfdr.de>; Fri, 16 Oct 2020 15:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408134AbgJPN4N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Oct 2020 09:56:13 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:59825 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408115AbgJPN4M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Oct 2020 09:56:12 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id CC685200005;
        Fri, 16 Oct 2020 13:56:08 +0000 (UTC)
Date:   Fri, 16 Oct 2020 17:55:53 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] rcar-vin: Remove handling of user-space buffers when
 stopping
Message-ID: <20201016155553.d775wpr6bb2c5zwo@uno.localdomain>
References: <20201015231408.2399933-1-niklas.soderlund+renesas@ragnatech.se>
 <20201015231408.2399933-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201015231408.2399933-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Oct 16, 2020 at 01:14:05AM +0200, Niklas Söderlund wrote:
> When returning buffers to user-space it's no longer needed to examine
> the buffers given to hardware as recent changes guarantees the only
> buffer present in the hardware registers when the driver is not in the
> running state is the scratch buffer.
>
> Remove the special case and rename the function to better describe it
> now only deals with buffers queued to the driver but not yet recorded in
> the hardware registers.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 31 +++++-----------------
>  1 file changed, 7 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index ca90bde8d29f77d1..680160f9f851d8a3 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1051,27 +1051,10 @@ static irqreturn_t rvin_irq(int irq, void *data)
>  }
>
>  /* Need to hold qlock before calling */
> -static void return_all_buffers(struct rvin_dev *vin,
> -			       enum vb2_buffer_state state)
> +static void return_unused_buffers(struct rvin_dev *vin,
> +				  enum vb2_buffer_state state)
>  {
>  	struct rvin_buffer *buf, *node;
> -	struct vb2_v4l2_buffer *freed[HW_BUFFER_NUM];
> -	unsigned int i, n;
> -
> -	for (i = 0; i < HW_BUFFER_NUM; i++) {
> -		freed[i] = vin->buf_hw[i].buffer;
> -		vin->buf_hw[i].buffer = NULL;
> -
> -		for (n = 0; n < i; n++) {
> -			if (freed[i] == freed[n]) {
> -				freed[i] = NULL;
> -				break;
> -			}
> -		}
> -
> -		if (freed[i])
> -			vb2_buffer_done(&freed[i]->vb2_buf, state);
> -	}
>
>  	list_for_each_entry_safe(buf, node, &vin->buf_list, list) {
>  		vb2_buffer_done(&buf->vb.vb2_buf, state);
> @@ -1271,7 +1254,7 @@ static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
>  					  &vin->scratch_phys, GFP_KERNEL);
>  	if (!vin->scratch) {
>  		spin_lock_irqsave(&vin->qlock, flags);
> -		return_all_buffers(vin, VB2_BUF_STATE_QUEUED);
> +		return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
>  		spin_unlock_irqrestore(&vin->qlock, flags);
>  		vin_err(vin, "Failed to allocate scratch buffer\n");
>  		return -ENOMEM;
> @@ -1280,7 +1263,7 @@ static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	ret = rvin_set_stream(vin, 1);
>  	if (ret) {
>  		spin_lock_irqsave(&vin->qlock, flags);
> -		return_all_buffers(vin, VB2_BUF_STATE_QUEUED);
> +		return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
>  		spin_unlock_irqrestore(&vin->qlock, flags);
>  		goto out;
>  	}
> @@ -1291,7 +1274,7 @@ static int rvin_start_streaming(struct vb2_queue *vq, unsigned int count)
>
>  	ret = rvin_capture_start(vin);
>  	if (ret) {
> -		return_all_buffers(vin, VB2_BUF_STATE_QUEUED);
> +		return_unused_buffers(vin, VB2_BUF_STATE_QUEUED);
>  		rvin_set_stream(vin, 0);
>  	}
>
> @@ -1358,8 +1341,8 @@ static void rvin_stop_streaming(struct vb2_queue *vq)
>  		vin->state = STOPPED;
>  	}
>
> -	/* Release all active buffers */
> -	return_all_buffers(vin, VB2_BUF_STATE_ERROR);
> +	/* Return all unused buffers. */
> +	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
>
>  	spin_unlock_irqrestore(&vin->qlock, flags);
>
> --
> 2.28.0
>
