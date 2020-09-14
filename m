Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946EF2699B4
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 01:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgINXat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 19:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgINXas (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 19:30:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB1BC06174A;
        Mon, 14 Sep 2020 16:30:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E2CF275;
        Tue, 15 Sep 2020 01:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600126236;
        bh=8lbUZdd+rlg5rzRakXPlDFd0J7whEsHXno1IFZUb2A0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EBEDg9qCngY9Kz3JEaaaJ4JDBOZ11G4AslbXWADML23u4h4wyOE+elli9IZ377O9W
         xeYBbJ9Ke6wOKjCIyk2aAX6fHVC8o4lJZD84ezDXr0+zdyoYJc/rUDpWy0HLvL1Eqg
         fkVvOOZH94weHNUzi/scUGmlp1qayOaIoqvT4Bu8=
Date:   Tue, 15 Sep 2020 02:30:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Fix async subdev size
Message-ID: <20200914233008.GF15543@pendragon.ideasonboard.com>
References: <20200914155749.183030-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200914155749.183030-1-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Sep 14, 2020 at 05:57:49PM +0200, Jacopo Mondi wrote:
> Since commit:
> 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
> the async subdevice registered to the max9286 notifier is dynamically
> allocated by the v4l2 framework by using
> the v4l2_async_notifier_add_fwnode_subdev function. In order to allocate
> enough space for max9286_asd structure that encloses the async subdevice
> paired with a pointer to the corresponding source, pass to the framework
> the size of the whole structure in place of the one of the enclosed async
> subdev.
> 
> Fixes: 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/max9286.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index c82c1493e099..746c411b79a0 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -579,8 +579,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
>  		struct v4l2_async_subdev *asd;
> 
>  		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
> -							    source->fwnode,
> -							    sizeof(*asd));
> +			source->fwnode, sizeof(struct max9286_asd));

I'd write

		struct v4l2_async_subdev *asd;
		struct max9286_asd *masd;

		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
							    source->fwnode,
							    sizeof(*masd));
		if (IS_ERR(asd)) {
			dev_err(dev, "Failed to add subdev for source %u: %ld",
				i, PTR_ERR(asd));
			v4l2_async_notifier_cleanup(&priv->notifier);
			return PTR_ERR(asd);
		}

		masd = to_max9286_asd(asd);
		masd->source = source;

just to be able to avoid the ugly indentiation, but that's really
nitpicking :-) With or without that, sorry for breaking the driver in
the first place, and

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		if (IS_ERR(asd)) {
>  			dev_err(dev, "Failed to add subdev for source %u: %ld",
>  				i, PTR_ERR(asd));

-- 
Regards,

Laurent Pinchart
