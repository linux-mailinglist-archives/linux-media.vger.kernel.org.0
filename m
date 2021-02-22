Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B598C320F03
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhBVBVJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 20:21:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54618 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhBVBVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 20:21:08 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83BDD517;
        Mon, 22 Feb 2021 02:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613956826;
        bh=1R6CPlY5akEJ3QQme3Uw0ejikPnQfE4Ykqrs0zToIpQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OjSgZ5ocM4OXTOSZ5DaAEKVoIut1+/FchkPjosm/9lpa44fSlZBEaQLIDhUs54SWG
         v7Rm7XpJ3oxfJ7X8n2XDWifYVw6hgKhIBOZeNmJtHJxam2dvujWU5KNwZt51B29aL7
         Xr6G235l1XlOlAKWlY+mbNEZ6YKB2vSlPebw0ajA=
Date:   Mon, 22 Feb 2021 03:20:00 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/16] media: i2c: max9286: Adjust parameters indent
Message-ID: <YDMGwL6mJuHWwsWq@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-9-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216174146.106639-9-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 16, 2021 at 06:41:38PM +0100, Jacopo Mondi wrote:
> The parameters to max9286_i2c_mux_configure() fits on the previous
> line. Adjust it.
> 
> Cosmetic change only.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 6fd4d59fcc72..1d9951215868 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -287,9 +287,8 @@ static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
>  
>  	priv->mux_channel = chan;
>  
> -	max9286_i2c_mux_configure(priv,
> -				  MAX9286_FWDCCEN(chan) |
> -				  MAX9286_REVCCEN(chan));
> +	max9286_i2c_mux_configure(priv, MAX9286_FWDCCEN(chan) |
> +					MAX9286_REVCCEN(chan));

I feel obliged to say I would have written

	max9286_i2c_mux_configure(priv, MAX9286_FWDCCEN(chan) |
				  MAX9286_REVCCEN(chan));

:-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
