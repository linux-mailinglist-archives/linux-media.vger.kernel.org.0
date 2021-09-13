Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8A94087B1
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:59:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238264AbhIMJBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:01:13 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:41439 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbhIMJBM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:01:12 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 72BB41C0015;
        Mon, 13 Sep 2021 08:59:54 +0000 (UTC)
Date:   Mon, 13 Sep 2021 11:00:41 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, jacopo+renesas@jmondi.org,
        morimoto.kuninori@renesas.com
Subject: Re: [RFC 2/3] media: tw9910: Allow the TW9990 to probe
Message-ID: <20210913090041.zqj4wsnli5dmnkv6@uno.localdomain>
References: <20210827130150.909695-1-festevam@gmail.com>
 <20210827130150.909695-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210827130150.909695-2-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Fri, Aug 27, 2021 at 10:01:49AM -0300, Fabio Estevam wrote:
> Currently the driver rejects to probe when the ID is
> different from the TW9910 one.
>
> Allow TW9990 to probe by allowing its ID too.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/media/i2c/tw9910.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
> index 04f3c2dbc1cc..0411b8ea9bda 100644
> --- a/drivers/media/i2c/tw9910.c
> +++ b/drivers/media/i2c/tw9910.c
> @@ -859,7 +859,7 @@ static int tw9910_video_probe(struct i2c_client *client)
>  	priv->revision = GET_REV(id);
>  	id = GET_ID(id);
>
> -	if (id != 0x0b || priv->revision > 0x01) {
> +	if ((id != 0x0b && id != 0x00) || priv->revision > 0x01) {

I would define these. Up to you!

>  		dev_err(&client->dev, "Product ID error %x:%x\n",
>  			id, priv->revision);
>  		ret = -ENODEV;
> --
> 2.25.1
>
