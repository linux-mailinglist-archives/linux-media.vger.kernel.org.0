Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637B826A512
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 14:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgIOMZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 08:25:28 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:33897 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgIOMYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 08:24:36 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A8CB8C0014;
        Tue, 15 Sep 2020 12:24:32 +0000 (UTC)
Date:   Tue, 15 Sep 2020 14:28:23 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: max9286: Fix async subdev size
Message-ID: <20200915122823.m5aaz5ghirkrnxpw@uno.localdomain>
References: <20200914155749.183030-1-jacopo+renesas@jmondi.org>
 <20200914233008.GF15543@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200914233008.GF15543@pendragon.ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Sep 15, 2020 at 02:30:08AM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Sep 14, 2020 at 05:57:49PM +0200, Jacopo Mondi wrote:
> > Since commit:
> > 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
> > the async subdevice registered to the max9286 notifier is dynamically
> > allocated by the v4l2 framework by using
> > the v4l2_async_notifier_add_fwnode_subdev function. In order to allocate
> > enough space for max9286_asd structure that encloses the async subdevice
> > paired with a pointer to the corresponding source, pass to the framework
> > the size of the whole structure in place of the one of the enclosed async
> > subdev.
> >
> > Fixes: 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index c82c1493e099..746c411b79a0 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -579,8 +579,7 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
> >  		struct v4l2_async_subdev *asd;
> >
> >  		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
> > -							    source->fwnode,
> > -							    sizeof(*asd));
> > +			source->fwnode, sizeof(struct max9286_asd));
>
> I'd write
>
> 		struct v4l2_async_subdev *asd;
> 		struct max9286_asd *masd;
>
> 		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
> 							    source->fwnode,
> 							    sizeof(*masd));
> 		if (IS_ERR(asd)) {
> 			dev_err(dev, "Failed to add subdev for source %u: %ld",
> 				i, PTR_ERR(asd));
> 			v4l2_async_notifier_cleanup(&priv->notifier);
> 			return PTR_ERR(asd);
> 		}
>
> 		masd = to_max9286_asd(asd);
> 		masd->source = source;

I considered the same, but then decided that indent was not that bad,
but I can indeed change it, I like this version better after all.

>
> just to be able to avoid the ugly indentiation, but that's really
> nitpicking :-) With or without that, sorry for breaking the driver in
> the first place, and
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks
  j

>
> >  		if (IS_ERR(asd)) {
> >  			dev_err(dev, "Failed to add subdev for source %u: %ld",
> >  				i, PTR_ERR(asd));
>
> --
> Regards,
>
> Laurent Pinchart
