Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024CA4888ED
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 12:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235333AbiAILls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 06:41:48 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:44747 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235337AbiAILlr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 06:41:47 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id B5D37100005;
        Sun,  9 Jan 2022 11:41:44 +0000 (UTC)
Date:   Sun, 9 Jan 2022 12:42:45 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>
Subject: Re: [PATCH v2 11/11] media: i2c: max9286: Select HS as data enable
 signal
Message-ID: <20220109114245.nihfmnnhgk2eh7qd@uno.localdomain>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-12-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-12-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Jan 01, 2022 at 08:28:06PM +0200, Laurent Pinchart wrote:
> GMSL can transport three synchronization signals: VSync, HSync and Data
> Enable. The MAX9286 can select either HS or DE as a line valid signal.
>
> Not all serializers (and transmission formats) support the DE signal.
> The MAX9271, used by the RDACM20 and RDACM21 cameras, doesn't document
> DE support. Nonetheless, the max9286 driver selects the DE signal as
> line valid in register 0x0c (by not setting the DESEL bit). It's not
> clear why this works. As HS is a more common line valid qualifier, set
> the DESEL bit by default. This is needed to support the onsemi MARS
> cameras.
>
> If a camera requires usage of the DE signal in the future, this will
> need to be made configurable.

Tested-by: Jacopo Mondi <jacopo@jmondi.org>
On Eagle V3M with RDACM20

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/i2c/max9286.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 07ebb01640a1..446fc238d642 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -563,9 +563,12 @@ static void max9286_set_video_format(struct max9286_priv *priv,
>  		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
>  		      info->datatype);
>
> -	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
> -	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
> -		      MAX9286_HVSRC_D14);
> +	/*
> +	 * Enable HS/VS encoding, use HS as line valid source, use D14/15 for
> +	 * HS/VS, invert VS.
> +	 */
> +	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_DESEL |
> +		      MAX9286_INVVS | MAX9286_HVSRC_D14);
>  }
>
>  static void max9286_set_fsync_period(struct max9286_priv *priv)
> --
> Regards,
>
> Laurent Pinchart
>
