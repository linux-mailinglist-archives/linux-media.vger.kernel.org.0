Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0464357DAA
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 09:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhDHHyd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 03:54:33 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56347 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhDHHyc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Apr 2021 03:54:32 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 923ADC0004;
        Thu,  8 Apr 2021 07:54:18 +0000 (UTC)
Date:   Thu, 8 Apr 2021 09:54:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rdacm21: describe better a truncation
Message-ID: <20210408075455.42ym6cd2sdpfziqk@uno.localdomain>
References: <b6f139947e93fec1ade5faf3517dfb2b3b9bcd41.1617867599.git.mchehab+huawei@kernel.org>
 <b64509683e6d3e24c32795f3cad9b3046de6e2a0.1617867599.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b64509683e6d3e24c32795f3cad9b3046de6e2a0.1617867599.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro

On Thu, Apr 08, 2021 at 09:40:03AM +0200, Mauro Carvalho Chehab wrote:
> As warned by sparse:
>
> 	drivers/media/i2c/rdacm21.c:348:62: warning: cast truncates bits from constant value (300a becomes a)
>
> the intention of the code is to get just the lowest 8 bits.
> So, instead of using a typecast, use a bit and logic.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Please see
https://patchwork.linuxtv.org/project/linux-media/patch/20210319164148.199192-11-jacopo+renesas@jmondi.org/

Whatever gets in first it's fine, so you can add my
Acked-by: Jacopo Mondi <jacopo@jmondi.org>
to this one too

Thanks
  j

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
> --
> 2.30.2
>
