Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0FB2F776C
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 12:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbhAOLRv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 06:17:51 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:18339 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhAOLRv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 06:17:51 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2DD18240016;
        Fri, 15 Jan 2021 11:17:08 +0000 (UTC)
Date:   Fri, 15 Jan 2021 12:17:27 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] rcar-csi2: Do not try to recover after transfer
 error
Message-ID: <20210115111727.wj6s2aiiprf72lyl@uno.localdomain>
References: <20210115002148.4079591-1-niklas.soderlund+renesas@ragnatech.se>
 <20210115002148.4079591-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210115002148.4079591-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Jan 15, 2021 at 01:21:48AM +0100, Niklas Söderlund wrote:
> Instead of restarting the R-Car CSI-2 receiver if a transmission error
> is detected inform the R-Car VIN driver of the error so it can stop the
> whole pipeline and inform user-space. This is done to reflect a updated
> usage recommendation in later versions of the datasheet.

I wonder if there's any userspace component that relies on the
auto-restart procedure.

>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

If this aligns the behaviour with the manual (and it seems also saner
than attemping a restart) I think it's good.

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index 945d2eb8723367f0..a7212ecc46572a3b 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -773,21 +773,19 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
>
>  	rcsi2_write(priv, INTERRSTATE_REG, err_status);
>
> -	dev_info(priv->dev, "Transfer error, restarting CSI-2 receiver\n");
> -
>  	return IRQ_WAKE_THREAD;
>  }
>
>  static irqreturn_t rcsi2_irq_thread(int irq, void *data)
>  {
>  	struct rcar_csi2 *priv = data;
> +	struct v4l2_event event = {
> +		.type = V4L2_EVENT_EOS,
> +	};
>
> -	mutex_lock(&priv->lock);
> -	rcsi2_stop(priv);
> -	usleep_range(1000, 2000);
> -	if (rcsi2_start(priv))
> -		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
> -	mutex_unlock(&priv->lock);
> +	dev_err(priv->dev, "Transfer error detected.\n");
> +
> +	v4l2_subdev_notify_event(&priv->subdev, &event);
>
>  	return IRQ_HANDLED;
>  }
> --
> 2.30.0
>
