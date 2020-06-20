Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB49202768
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 01:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgFTXlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 19:41:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58924 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgFTXle (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 19:41:34 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C4CC532;
        Sun, 21 Jun 2020 01:41:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592696492;
        bh=64Ex6QSN20b7CWoXFvgsKTlNsxft73dNO4ygmiaB5QM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tm2C7m3zO6XKNc/0EU2l64UuY+4RlIfOdt35330ZNCiEdJ1zbk6tHj0rJWUd0w2x7
         7g8VuTmgkdJQtW7C454OUDqDSLba51IUDh14tqcgHif2z2oB94nMR0i4stnfn4clyz
         +0l/dZBRk7SPuLAkDJdgaP6GtnNyIq6/CUv1NU+Y=
Date:   Sun, 21 Jun 2020 02:41:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] media: v4l2-async: Log message in case of
 heterogenous fwnode match
Message-ID: <20200620234108.GC20179@pendragon.ideasonboard.com>
References: <20200318002507.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200318002507.30336-4-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdUDr2XRUuMxCn3W7BCscEDhaVAsX7fP6MBhKXDB4n3Eag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUDr2XRUuMxCn3W7BCscEDhaVAsX7fP6MBhKXDB4n3Eag@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On Wed, Mar 18, 2020 at 10:16:37AM +0100, Geert Uytterhoeven wrote:
> On Wed, Mar 18, 2020 at 1:26 AM Laurent Pinchart wrote:
> > When a notifier supplies a device fwnode and a subdev supplies an
> > endpoint fwnode, incorrect matches may occur if multiple subdevs
> > correspond to the same device fwnode. This can't be handled
> > transparently in the framework, and requires the notifier to switch to
> > endpoint fwnodes. Log a message to notify of this problem. A second
> > message is added to help accelerating the transition to endpoint
> > matching.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -113,7 +114,28 @@ static bool match_fwnode(struct v4l2_async_notifier *notifier,
> >
> >         fwnode_handle_put(dev_fwnode);
> >
> > -       return dev_fwnode == other_fwnode;
> > +       if (dev_fwnode != other_fwnode)
> > +               return false;
> > +
> > +       /*
> > +        * We have an heterogenous match. Retrieve the struct device of the
> > +        * side that matched on a device fwnode to print its driver name.
> > +        */
> > +       if (sd_fwnode_is_ep)
> > +               dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
> > +                   : notifier->sd->dev;
> > +       else
> > +               dev = sd->dev;
> > +
> > +       if (dev && dev->driver) {
> > +               if (sd_fwnode_is_ep)
> > +                       dev_info(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
> > +                                dev->driver->name);
> 
> I think that deserves a dev_warn().
> 
> > +               dev_info(dev, "Consider updating driver %s to match on endpoints\n",
> > +                        dev->driver->name);
> 
> And dev_notice(), while at it ;-)

A rarely used, but totally appropriate level. I'll fix both.

> > +       }
> > +
> > +       return true;
> >  }

-- 
Regards,

Laurent Pinchart
