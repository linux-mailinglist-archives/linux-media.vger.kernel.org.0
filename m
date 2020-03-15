Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53DB8185C80
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 13:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgCOM54 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 08:57:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47258 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbgCOM54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 08:57:56 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60B0B2D6;
        Sun, 15 Mar 2020 13:57:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584277074;
        bh=E2pgR3NfJCMiqQdqlWm+CZBOWjacnfLUtHs9QxoDukM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bPQ9s8QpqmDcThQ2+8ALydiMBkt5HBz2jYJPafy8PEZus24M69Lr2NwdgzpwBnyle
         uJb6aBbHb/vkaxNP9++fPgn8cTQGVzNpZ9DaT+J2UOZa9SEJ+2JyMf1CHsM/MeSIWg
         T6XI2Ny4US+uh8NLgpsgLt1RXGp02i8jy1uAx1bo=
Date:   Sun, 15 Mar 2020 14:57:50 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/2] media: rcar-csi2: Let the driver handle fwnode
 matching using match_custom callback
Message-ID: <20200315125750.GD4732@pendragon.ideasonboard.com>
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315102724.26850-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315102956.GA4732@pendragon.ideasonboard.com>
 <CA+V-a8sYT+okN_WKY-FEcgD7Znyvh3JeMyuZgBxwPLiseiP_1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+V-a8sYT+okN_WKY-FEcgD7Znyvh3JeMyuZgBxwPLiseiP_1A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Sun, Mar 15, 2020 at 12:10:14PM +0000, Lad, Prabhakar wrote:
> On Sun, Mar 15, 2020 at 10:30 AM Laurent Pinchart wrote:
> > On Sun, Mar 15, 2020 at 10:27:24AM +0000, Lad Prabhakar wrote:
> > > The rcar-csi2 driver uses the v4l2-async framework to do endpoint matching
> > > instead of node matching. This is needed as it needs to work with the
> > > adv748x driver which register it self in v4l2-async using endpoints
> > > instead of nodes. The reason for this is that from a single DT node it
> > > creates multiple subdevices, one for each endpoint.
> > >
> > > But when using subdevs which register itself in v4l2-async using nodes,
> > > the rcar-csi2 driver failed to find the matching endpoint because the
> > > match.fwnode was pointing to remote endpoint instead of remote parent
> > > port.
> > >
> > > This commit adds support in rcar-csi2 driver to handle both the cases
> > > where subdev registers in v4l2-async using endpoints/nodes, by using
> > > match_type as V4L2_ASYNC_MATCH_CUSTOM and implementing the match()
> > > callback to compare the fwnode of either remote/parent.
> >
> > This is not the way to go. The v4l2-async framework needs to be fixed
> > instead, so that fwnode match will do the right thing automatically
> > regardless of whether the node is a device node or and endpoint node.
>
> OK, so moving forward should the v4l2-async do strictly endpoint
> matching only or both nodes/endpoints. fwnode in all the bridge
> drivers be replaced to remote endpoints ?

Long term I think everything should use endpoint matching, but to get
there we shouldn't transition all drivers in one go. I've submitted a
patch to v4l2-async that I believe will fix your problem and allow for a
smooth transition. Could you give it a try ?

> Looking at the adv7604 its registered as node to v4l2-async which can
> have upto 3 endpoints, adv748x is the single driver which registers
> itself as endpoint to v4l2-async, and rest of the other subdevices
> have single endpoint and are registered as node to v4l2-async. How
> would you suggest to handle these cases.
> 
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 46 +++++++++++++++++++--
> > >  1 file changed, 43 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index faa9fb23a2e9..1bbf05e9f025 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -808,6 +808,46 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
> > >       return 0;
> > >  }
> > >
> > > +static bool rcsi2_asd_match(struct v4l2_subdev *sd,
> > > +                         struct v4l2_async_subdev *asd)
> > > +{
> > > +     struct rcar_csi2 *priv = (struct rcar_csi2 *)asd->match.custom.priv;
> > > +     struct fwnode_handle *remote_endpoint;
> > > +     struct fwnode_handle *subdev_endpoint;
> > > +     struct device_node *np;
> > > +     bool matched = false;
> > > +
> > > +     np = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
> > > +     if (!np) {
> > > +             dev_err(priv->dev, "Not connected to subdevice\n");
> > > +             return matched;
> > > +     }
> > > +
> > > +     remote_endpoint =
> > > +             fwnode_graph_get_remote_endpoint(of_fwnode_handle(np));
> > > +     if (!remote_endpoint) {
> > > +             dev_err(priv->dev, "Failed to get remote endpoint\n");
> > > +             of_node_put(np);
> > > +             return matched;
> > > +     }
> > > +     of_node_put(np);
> > > +
> > > +     if (sd->fwnode != dev_fwnode(sd->dev)) {
> > > +             if (remote_endpoint == sd->fwnode)
> > > +                     matched = true;
> > > +     } else {
> > > +             subdev_endpoint =
> > > +                   fwnode_graph_get_next_endpoint(dev_fwnode(sd->dev), NULL);
> > > +             if (remote_endpoint == subdev_endpoint)
> > > +                     matched = true;
> > > +             fwnode_handle_put(subdev_endpoint);
> > > +     }
> > > +
> > > +     fwnode_handle_put(remote_endpoint);
> > > +
> > > +     return matched;
> > > +}
> > > +
> > >  static int rcsi2_parse_dt(struct rcar_csi2 *priv)
> > >  {
> > >       struct device_node *ep;
> > > @@ -833,9 +873,9 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
> > >               return ret;
> > >       }
> > >
> > > -     priv->asd.match.fwnode =
> > > -             fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
> > > -     priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> > > +     priv->asd.match.custom.match = &rcsi2_asd_match;
> > > +     priv->asd.match.custom.priv = priv;
> > > +     priv->asd.match_type = V4L2_ASYNC_MATCH_CUSTOM;
> > >
> > >       of_node_put(ep);
> > >

-- 
Regards,

Laurent Pinchart
