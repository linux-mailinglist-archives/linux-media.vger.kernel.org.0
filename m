Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F6A46DAB7
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 19:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238589AbhLHSMa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 13:12:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56212 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238595AbhLHSMa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Dec 2021 13:12:30 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAE02B6C;
        Wed,  8 Dec 2021 19:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638986935;
        bh=cVwKBuf2ylTjXOyFg6YXy2e0YGftv+YEhXfIrIDfRgU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QAjspCf1lUmofvxxtNuquqh+ZmXAPNNYidftziel2UJud67rX0raVtoXejp2ikNbI
         1YcyJNgeCh84qiQPDuE/nVc8dpwdrz65U4ho8KWI0XaM0wG9O29SZqRrl79mG6P938
         qbsTS2VZBy/5fJJ71CY/bqx7iuJBQS4JNa9hSTS4=
Date:   Wed, 8 Dec 2021 20:08:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] media: i2c: max9286: Use dev_err_probe() helper
Message-ID: <YbD0mpnMA4Gqx1RJ@pendragon.ideasonboard.com>
References: <20211208121756.3051565-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdX+ogLKoyinu1taCm1BjmiKo8bnFh3Z+Df18jonKT6nKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdX+ogLKoyinu1taCm1BjmiKo8bnFh3Z+Df18jonKT6nKA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 08, 2021 at 01:29:57PM +0100, Geert Uytterhoeven wrote:
> On Wed, Dec 8, 2021 at 1:18 PM Niklas Söderlund wrote:
> > Use the dev_err_probe() helper, instead of open-coding the same
> > operation. While at it retrieve the error once and use it from
> > 'ret' instead of retrieving it twice.
> >
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I guess that's too much credit for me ;-)
> 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -1295,11 +1295,9 @@ static int max9286_probe(struct i2c_client *client)
> >
> >         priv->regulator = devm_regulator_get(&client->dev, "poc");
> >         if (IS_ERR(priv->regulator)) {
> > -               if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
> > -                       dev_err(&client->dev,
> > -                               "Unable to get PoC regulator (%ld)\n",
> > -                               PTR_ERR(priv->regulator));
> >                 ret = PTR_ERR(priv->regulator);
> > +               dev_err_probe(&client->dev, ret,
> > +                             "Unable to get PoC regulator\n");
> 
> You can even combine these two, as dev_err_probe() was designed
> to streamline error handling, and thus returns the error again:
> 
>     ret = dev_err_probe(&client->dev, PTR_ERR(priv->regulator),
>                         "Unable to get PoC regulator\n");

With or witout that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >                 goto err_powerdown;
> >         }
> 
> Regardless:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

-- 
Regards,

Laurent Pinchart
