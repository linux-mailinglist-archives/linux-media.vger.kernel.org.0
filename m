Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAFF2B4B17
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 17:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732110AbgKPQ2i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 11:28:38 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:50521 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730795AbgKPQ2i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 11:28:38 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B2E4C40010;
        Mon, 16 Nov 2020 16:28:35 +0000 (UTC)
Date:   Mon, 16 Nov 2020 17:28:38 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] rcar-vin: Do not try to stop stream if not running
Message-ID: <20201116162838.opj7nfpvmfvup6cq@uno.localdomain>
References: <20201112225147.1672622-1-niklas.soderlund+renesas@ragnatech.se>
 <20201112225147.1672622-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112225147.1672622-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Thu, Nov 12, 2020 at 11:51:44PM +0100, Niklas Söderlund wrote:
> Do not attempt to stop the streaming if the stream is not running.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 5a5f0e5007478c8d..eae25972ed7df2b6 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1302,6 +1302,11 @@ void rvin_stop_streaming(struct rvin_dev *vin)
>
>  	spin_lock_irqsave(&vin->qlock, flags);
>
> +	if (vin->state == STOPPED) {
> +		spin_unlock_irqrestore(&vin->qlock, flags);
> +		return;

Do I read it right that, in case a double stop is attempted, returning
here is not enough as the caller:

{
	rvin_stop_streaming(vin);

	/* Free scratch buffer. */
	dma_free_coherent(vin->dev, vin->format.sizeimage, vin->scratch,
			  vin->scratch_phys);

	return_unused_buffers(vin, VB2_BUF_STATE_ERROR);
}

Are the potential double call to dma_free_coherent and the buffer
return procedure harmless ?

Thanks
   j

> +	}
> +
>  	vin->state = STOPPING;
>
>  	/* Wait until only scratch buffer is used, max 3 interrupts. */
> --
> 2.29.2
>
