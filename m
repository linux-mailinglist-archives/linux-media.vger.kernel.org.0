Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B96185C42
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2020 13:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgCOMKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Mar 2020 08:10:42 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43968 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728452AbgCOMKm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Mar 2020 08:10:42 -0400
Received: by mail-oi1-f194.google.com with SMTP id p125so14694707oif.10;
        Sun, 15 Mar 2020 05:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u3i5C+dFnyaWrvJo3Uh5KmDU6zXoMxpKL9ehC7pe9yk=;
        b=lzTj/nPCYQ1IjGV5susOXxZJv23JYogOwqj13MTSBJTNz4qMFI3ErDXW+zgxUMvmpc
         Z+e2Rw45wC+jxOvPhnZvyupGVYSYhwTMRtIunqsWaKkC6sH7LFS60N0nwqP54XXrCIbK
         HVTzWhSAaiQusMKHn3M7P1T+lfa2S5Q2Lro6sRVsibn7DUclo6sezbJpQa2GhIFowgZf
         8eR1a52HLRrO5sW7zPjkIOoMm/MkbfdIb9V2kC3Su5OW+60bKvGNEXyLgMZ1kpb7ciRW
         aiS/WAHx0QGLw7ZfqtmrDc32qhcmtpF8G5Pit6y8TC6k536Gq6cDP5JQesSAwWfNZLg+
         BuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u3i5C+dFnyaWrvJo3Uh5KmDU6zXoMxpKL9ehC7pe9yk=;
        b=poufDAWbzEHm+vWulETHBSzeloMwuibzGyBNk8rtiZCbHCSn8C7W2xo55gW/hRKfpZ
         +3WmuERnYvDpzy2IjmeUss/1y8ipw+eBqT0lzoDnpAaQGpn/lnCg3vIWdXCw4TOaFbK1
         gvDSKENsKPB4vdFehuBT6RmqKhneFmIbuQ35/vKWN5IEkI2EhO8v6lWQbmQ0Ura3O2p4
         4y90mAvqTLabDKfO1D0FUuSViNNIKSDAESV7URhIF/bq21nLnnNsUOr3mtKi8qbsumVg
         frae5Q/4IU3UVP472/okNzPWMyiIqAI1FZUPa0EmsMRi5FzTAYHD5uCLm0x5MuUTQndk
         jGpQ==
X-Gm-Message-State: ANhLgQ2HV7RW19aQl4fQvUHDMoF+qy8rIxR6h8HsZBWelv0atP1yK+Rs
        eCuecaHbBpCsCd8QzW/UKyC+Yxv5fpD4KMR0IAE=
X-Google-Smtp-Source: ADFU+vv83CRE/aqYFUUa7M/mKnc19CdVU3v2JgiQBDD+c2NF3EBOxy2DlsGEtT5qETMd3QATOLCoK2ZtOIIT026HYac=
X-Received: by 2002:aca:cf0d:: with SMTP id f13mr13539201oig.162.1584274241071;
 Sun, 15 Mar 2020 05:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200315102724.26850-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200315102724.26850-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200315102956.GA4732@pendragon.ideasonboard.com>
In-Reply-To: <20200315102956.GA4732@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 15 Mar 2020 12:10:14 +0000
Message-ID: <CA+V-a8sYT+okN_WKY-FEcgD7Znyvh3JeMyuZgBxwPLiseiP_1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: rcar-csi2: Let the driver handle fwnode
 matching using match_custom callback
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Niklas <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thank you for the quick review.

On Sun, Mar 15, 2020 at 10:30 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Sun, Mar 15, 2020 at 10:27:24AM +0000, Lad Prabhakar wrote:
> > The rcar-csi2 driver uses the v4l2-async framework to do endpoint matching
> > instead of node matching. This is needed as it needs to work with the
> > adv748x driver which register it self in v4l2-async using endpoints
> > instead of nodes. The reason for this is that from a single DT node it
> > creates multiple subdevices, one for each endpoint.
> >
> > But when using subdevs which register itself in v4l2-async using nodes,
> > the rcar-csi2 driver failed to find the matching endpoint because the
> > match.fwnode was pointing to remote endpoint instead of remote parent
> > port.
> >
> > This commit adds support in rcar-csi2 driver to handle both the cases
> > where subdev registers in v4l2-async using endpoints/nodes, by using
> > match_type as V4L2_ASYNC_MATCH_CUSTOM and implementing the match()
> > callback to compare the fwnode of either remote/parent.
>
> This is not the way to go. The v4l2-async framework needs to be fixed
> instead, so that fwnode match will do the right thing automatically
> regardless of whether the node is a device node or and endpoint node.
>
OK, so moving forward should the v4l2-async do strictly endpoint
matching only or
both nodes/endpoints. fwnode in all the bridge drivers be replaced to
remote endpoints ?

Looking at the adv7604 its registered as node to v4l2-async which can
have upto 3 endpoints,
adv748x is the single driver which registers itself as endpoint to
v4l2-async, and rest of the
other subdevices have single endpoint and are registered as node to
v4l2-async. How would you
suggest to handle these cases.

Cheers,
--Prabhakar Lad

> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 46 +++++++++++++++++++--
> >  1 file changed, 43 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > index faa9fb23a2e9..1bbf05e9f025 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -808,6 +808,46 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
> >       return 0;
> >  }
> >
> > +static bool rcsi2_asd_match(struct v4l2_subdev *sd,
> > +                         struct v4l2_async_subdev *asd)
> > +{
> > +     struct rcar_csi2 *priv = (struct rcar_csi2 *)asd->match.custom.priv;
> > +     struct fwnode_handle *remote_endpoint;
> > +     struct fwnode_handle *subdev_endpoint;
> > +     struct device_node *np;
> > +     bool matched = false;
> > +
> > +     np = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
> > +     if (!np) {
> > +             dev_err(priv->dev, "Not connected to subdevice\n");
> > +             return matched;
> > +     }
> > +
> > +     remote_endpoint =
> > +             fwnode_graph_get_remote_endpoint(of_fwnode_handle(np));
> > +     if (!remote_endpoint) {
> > +             dev_err(priv->dev, "Failed to get remote endpoint\n");
> > +             of_node_put(np);
> > +             return matched;
> > +     }
> > +     of_node_put(np);
> > +
> > +     if (sd->fwnode != dev_fwnode(sd->dev)) {
> > +             if (remote_endpoint == sd->fwnode)
> > +                     matched = true;
> > +     } else {
> > +             subdev_endpoint =
> > +                   fwnode_graph_get_next_endpoint(dev_fwnode(sd->dev), NULL);
> > +             if (remote_endpoint == subdev_endpoint)
> > +                     matched = true;
> > +             fwnode_handle_put(subdev_endpoint);
> > +     }
> > +
> > +     fwnode_handle_put(remote_endpoint);
> > +
> > +     return matched;
> > +}
> > +
> >  static int rcsi2_parse_dt(struct rcar_csi2 *priv)
> >  {
> >       struct device_node *ep;
> > @@ -833,9 +873,9 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
> >               return ret;
> >       }
> >
> > -     priv->asd.match.fwnode =
> > -             fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
> > -     priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> > +     priv->asd.match.custom.match = &rcsi2_asd_match;
> > +     priv->asd.match.custom.priv = priv;
> > +     priv->asd.match_type = V4L2_ASYNC_MATCH_CUSTOM;
> >
> >       of_node_put(ep);
> >
>
> --
> Regards,
>
> Laurent Pinchart
