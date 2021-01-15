Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA1532F7757
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 12:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbhAOLOj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 06:14:39 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:51591 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbhAOLOj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 06:14:39 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2AA501C0004;
        Fri, 15 Jan 2021 11:13:56 +0000 (UTC)
Date:   Fri, 15 Jan 2021 12:14:15 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] rcar-vin: Do not try to stop stream if not running
Message-ID: <20210115111415.po6tljlkx4plt72i@uno.localdomain>
References: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
 <20210115002148.4079591-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210115002148.4079591-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Jan 15, 2021 at 01:21:45AM +0100, Niklas Söderlund wrote:
> Do not attempt to stop the streaming if the stream is not running.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

With the comment on v1 clarified for the double stoppage case:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/rcar-vin/rcar-dma.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 48280ddb15b9b0ee..f30dafbdf61ca15f 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1301,6 +1301,11 @@ void rvin_stop_streaming(struct rvin_dev *vin)
>
>  	spin_lock_irqsave(&vin->qlock, flags);
>
> +	if (vin->state == STOPPED) {
> +		spin_unlock_irqrestore(&vin->qlock, flags);
> +		return;
> +	}
> +
>  	vin->state = STOPPING;
>
>  	/* Wait until only scratch buffer is used, max 3 interrupts. */
> --
> 2.30.0
>
