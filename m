Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7285320F14
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 02:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhBVB2i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Feb 2021 20:28:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhBVB2e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Feb 2021 20:28:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87ECC061574;
        Sun, 21 Feb 2021 17:27:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0608A517;
        Mon, 22 Feb 2021 02:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613957272;
        bh=DvouH4As8+RR+VV2xQsF4c0eG8ofBC2VwV6/+LxrUTk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=szb1MosGWvFTvscWxXgqQr0mIBnedrBb/TsUgTnJioe28FKhQNg0DGwA3VHZuQXEX
         pU7DViEkW0xWYy/iYn8CJzGa2ohJvjz+1g8w2DpsZBxvow1/nVFlh+4pFMOBx8YUqY
         gmfOZ3QUDp9P7wJhjcJGEZ+Pft4mS7pC0wMdTODo=
Date:   Mon, 22 Feb 2021 03:27:25 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/16] media: i2c: rdacm21: Re-work OV10640 initialization
Message-ID: <YDMIfTtc7ottA6Ir@pendragon.ideasonboard.com>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
 <20210216174146.106639-10-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210216174146.106639-10-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Feb 16, 2021 at 06:41:39PM +0100, Jacopo Mondi wrote:
> The OV10640 image sensor reset and powerdown on signals are controlled

s/ on//

> by the embedded OV490 ISP. The current reset procedure does not respect
> the 1 millisecond power-up delay and releases the reset signal before
> the powerdown one.
> 
> Fix the OV10640 power up sequence by releasing the powerdown signal,
> waiting the mandatory 1 millisecond power up delay and then releasing
> the reset signal. The reset delay is not characterized in the chip
> manual if not as "255 XVCLK + initialization". Wait for at least 3
> milliseconds to guarantee the SCCB bus is available.
> 
> This commit fixes a sporadic start-up error triggered by a failure to
> read the OV10640 chip ID:
> rdacm21 8-0054: OV10640 ID mismatch: (0x01)
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/rdacm21.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index b22a2ca5340b..c420a6b96879 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -333,13 +333,15 @@ static int ov10640_initialize(struct rdacm21_device *dev)
>  {
>  	u8 val;
>  
> -	/* Power-up OV10640 by setting RESETB and PWDNB pins high. */
> +	/* Power-up OV10640 by setting PWDNB and RESETB pins high. */
>  	ov490_write_reg(dev, OV490_GPIO_SEL0, OV490_GPIO0);
>  	ov490_write_reg(dev, OV490_GPIO_SEL1, OV490_SPWDN0);
>  	ov490_write_reg(dev, OV490_GPIO_DIRECTION0, OV490_GPIO0);
>  	ov490_write_reg(dev, OV490_GPIO_DIRECTION1, OV490_SPWDN0);
> -	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);
> +
>  	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_SPWDN0);

Shouldn't this be OV490_GPIO_OUTPUT_VALUE1 ?

> +	usleep_range(1500, 3000);
> +	ov490_write_reg(dev, OV490_GPIO_OUTPUT_VALUE0, OV490_GPIO0);

I'm a bit puzzled by why this patch would improve the ID read issue,
given that it sets GPIO0 to 1, then sets GPIO0 to 1, compared to
previously setting GPIO0 to 1 following by setting GPIO0 to 1 :-) Maybe
it's the additional delay ? In any case, it would probably be a good
idea to perform additional tests after fixing this.

>  	usleep_range(3000, 5000);
>  
>  	/* Read OV10640 ID to test communications. */

-- 
Regards,

Laurent Pinchart
