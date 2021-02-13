Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33BA731AA93
	for <lists+linux-media@lfdr.de>; Sat, 13 Feb 2021 09:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhBMIxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Feb 2021 03:53:42 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:49885 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhBMIxm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Feb 2021 03:53:42 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5AA9FC0005;
        Sat, 13 Feb 2021 08:52:54 +0000 (UTC)
Date:   Sat, 13 Feb 2021 09:53:19 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: rdamc21: Fix warning on u8 cast
Message-ID: <20210213085319.e5zrkkgyn5f25yai@uno.localdomain>
References: <20210208132749.97738-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210208132749.97738-1-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Mon, Feb 08, 2021 at 02:27:49PM +0100, Jacopo Mondi wrote:
> Sparse reports a warning on a cast to u8 of a 16 bits constant.
>
> drivers/media/i2c/rdacm21.c:348:62: warning: cast truncates bits
> from constant value (300a becomes a)
>
> Even if the behaviour is intended, silence the sparse warning replacing
> the cast with a bitwise & operation.
>
> Fixes: a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

I don't see this last fix for this window collected in the most recent
media tree.

Is it too late already ? It's really a trivial fix but silences a
sparse warning, so it might be worth collecting it ?

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
> 2.30.0
>
