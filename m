Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A862126CB06
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 22:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgIPUV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 16:21:26 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:60768 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbgIPRa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 13:30:57 -0400
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 55EE63AA95C;
        Wed, 16 Sep 2020 11:20:03 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 90FEE6000A;
        Wed, 16 Sep 2020 11:14:40 +0000 (UTC)
Date:   Wed, 16 Sep 2020 13:18:32 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] media: i2c: max9286: Fix async subdev size
Message-ID: <20200916111832.sdjfvc6tfyi33jzh@uno.localdomain>
References: <20200915123914.22807-1-jacopo+renesas@jmondi.org>
 <82d2c47e-9197-776d-b78b-6ca7cdecb94c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82d2c47e-9197-776d-b78b-6ca7cdecb94c@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On Wed, Sep 16, 2020 at 12:00:53PM +0100, Kieran Bingham wrote:
> Hi Jacopo,
>
> On 15/09/2020 13:39, Jacopo Mondi wrote:
> > Since
>
> Does 'Since' really need it's own line ;-)
>

If you don't want to break the following one (which I understand is
better on a single line) yes

> > commit 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
> > the async subdevice registered to the max9286 notifier is dynamically
> > allocated by the v4l2 framework by using the
> > v4l2_async_notifier_add_fwnode_subdev() function. In order to allocate
>
> A newline before 'In order to' would be nice to split 'what happened'
> from 'what is going to happen'. Oh, in fact it doesn't describe what
> happened though...
>
> > enough space for max9286_asd structure that encloses the async subdevice
>
> for "the" max9286_asd...
>
>
> > paired with a pointer to the corresponding source, pass to the framework
> > the size of the whole structure in place of the one of the enclosed async
> > subdev.
>
> That's quite hard to parse though, and I don't think describing the
> contents of max9286_asd really matters here?
>
> How about:
>
> Since commit 86d37bf31af6 ("media: i2c: max9286: Allocate
> v4l2_async_subdev dynamically") the async subdevice registered to the
> max9286 notifier is dynamically allocated by the v4l2 framework by using
> the v4l2_async_notifier_add_fwnode_subdev() function, but provides an
> incorrect size, potentially leading to incorrect memory accesses.
>
> Allocate enough space for the driver specific max9286_asd structure
> (which contains the async subdevice) by passing the size of the correct
> structure.
>
> > Fixes: 86d37bf31af6 ("media: i2c: max9286: Allocate v4l2_async_subdev dynamically")
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> The code is fine though, so with any commit message updates you deem
> necessary:
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Ok, better than mine, I'll take it in.

Thanks.
    j

>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/i2c/max9286.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > index c82c1493e099..6852448284ea 100644
> > --- a/drivers/media/i2c/max9286.c
> > +++ b/drivers/media/i2c/max9286.c
> > @@ -577,10 +577,11 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
> >  	for_each_source(priv, source) {
> >  		unsigned int i = to_index(priv, source);
> >  		struct v4l2_async_subdev *asd;
> > +		struct max9286_asd *masd;
> >
> >  		asd = v4l2_async_notifier_add_fwnode_subdev(&priv->notifier,
> >  							    source->fwnode,
> > -							    sizeof(*asd));
> > +							    sizeof(*masd));
> >  		if (IS_ERR(asd)) {
> >  			dev_err(dev, "Failed to add subdev for source %u: %ld",
> >  				i, PTR_ERR(asd));
> > @@ -588,7 +589,8 @@ static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
> >  			return PTR_ERR(asd);
> >  		}
> >
> > -		to_max9286_asd(asd)->source = source;
> > +		masd = to_max9286_asd(asd);
> > +		masd->source = source;
> >  	}
> >
> >  	priv->notifier.ops = &max9286_notify_ops;
> > --
> > 2.28.0
> >
>
