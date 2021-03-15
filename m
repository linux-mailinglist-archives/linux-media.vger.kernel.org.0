Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705BC33C888
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 22:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbhCOVgd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 17:36:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41514 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbhCOVgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 17:36:05 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7458316;
        Mon, 15 Mar 2021 22:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615844164;
        bh=OKXwsoWOva8CxqYRDjKdME5vOD+J25qkJxxU4SMQlRw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TT5z+dzqbN+kSqrKB4gPE0Q36f1t7Otr+QqkcU3YWh1gUCJS3UqC50BCLAduEqMnf
         cRiiOY/G+dWXKGGiJiFLexDZTGjPlQmJAaVrH4vwTC3OGSv/ogWqIhg4k/pUSlQbP2
         yMqU2+svWPz8ToXvmHnQThMKOm2Jru96O5JKsWPo=
Date:   Mon, 15 Mar 2021 23:35:28 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 01/18] media: i2c: rdamc21: Fix warning on u8 cast
Message-ID: <YE/TICclRHGaf8be@pendragon.ideasonboard.com>
References: <20210315131512.133720-1-jacopo+renesas@jmondi.org>
 <20210315131512.133720-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315131512.133720-2-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 02:14:55PM +0100, Jacopo Mondi wrote:
> Sparse reports a warning on a cast to u8 of a 16 bits constant.
> 
> drivers/media/i2c/rdacm21.c:348:62: warning: cast truncates bits
> from constant value (300a becomes a)
> 
> Even if the behaviour is intended, silence the sparse warning replacing
> the cast with a bitwise & operation.
> 
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/rdacm21.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index dcc21515e5a4..179d107f494c 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -345,7 +345,7 @@ static int ov10640_initialize(struct rdacm21_device *dev)
>  	/* Read OV10640 ID to test communications. */
>  	ov490_write_reg(dev, OV490_SCCB_SLAVE0_DIR, OV490_SCCB_SLAVE_READ);
>  	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_HIGH, OV10640_CHIP_ID >> 8);
> -	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, (u8)OV10640_CHIP_ID);
> +	ov490_write_reg(dev, OV490_SCCB_SLAVE0_ADDR_LOW, OV10640_CHIP_ID & 0xff);
>  
>  	/* Trigger SCCB slave transaction and give it some time to complete. */
>  	ov490_write_reg(dev, OV490_HOST_CMD, OV490_HOST_CMD_TRIGGER);

-- 
Regards,

Laurent Pinchart
