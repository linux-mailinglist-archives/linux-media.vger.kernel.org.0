Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152892807CE
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 21:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730166AbgJATeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 15:34:23 -0400
Received: from mga01.intel.com ([192.55.52.88]:9885 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729993AbgJATeX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 15:34:23 -0400
IronPort-SDR: KLrPimqFu8V6XM6tpuixUFrcco+/nXpZsr0b7lYAexU83/cP9IEV4sTH8CyH+4lecdwO9Dz+ht
 mTNVJFo4TD/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="180969962"
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="180969962"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 12:34:21 -0700
IronPort-SDR: 6fxbX/vp4tfPSW725Un360VuAcraUtk4SfFHtCNMfLpIIz1R27PHe3hU10n8F0cla1VKXGiGWP
 y5Ds7yzXg8rQ==
X-IronPort-AV: E=Sophos;i="5.77,324,1596524400"; 
   d="scan'208";a="308767771"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 12:34:18 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 12A562068C; Thu,  1 Oct 2020 22:34:14 +0300 (EEST)
Date:   Thu, 1 Oct 2020 22:34:14 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v6 1/3] media: i2c: ov772x: Parse endpoint properties
Message-ID: <20201001193413.GR26842@paasikivi.fi.intel.com>
References: <20200917174224.11430-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200917174224.11430-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200930114529.GM26842@paasikivi.fi.intel.com>
 <CA+V-a8t5piG4a0C2BKgsZii6EB7te=GUeRCmfcPhdm+hAuV7Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+V-a8t5piG4a0C2BKgsZii6EB7te=GUeRCmfcPhdm+hAuV7Ng@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 30, 2020 at 01:19:40PM +0100, Lad, Prabhakar wrote:
> HI Sakari,
> 
> Thank you for the review.
> 
> On Wed, Sep 30, 2020 at 12:45 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Prabhakar,
> >
> > On Thu, Sep 17, 2020 at 06:42:22PM +0100, Lad Prabhakar wrote:
> > > Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> > > to determine the bus type and store it in the driver structure.
> > >
> > > Set bus_type to V4L2_MBUS_PARALLEL as it's the only supported one
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  drivers/media/i2c/ov772x.c | 34 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> > > index 2cc6a678069a..f61a3f09ad64 100644
> > > --- a/drivers/media/i2c/ov772x.c
> > > +++ b/drivers/media/i2c/ov772x.c
> > > @@ -31,6 +31,7 @@
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-event.h>
> > > +#include <media/v4l2-fwnode.h>
> > >  #include <media/v4l2-image-sizes.h>
> > >  #include <media/v4l2-subdev.h>
> > >
> > > @@ -434,6 +435,7 @@ struct ov772x_priv {
> > >  #ifdef CONFIG_MEDIA_CONTROLLER
> > >       struct media_pad pad;
> > >  #endif
> > > +     enum v4l2_mbus_type               bus_type;
> > >  };
> > >
> > >  /*
> > > @@ -1348,6 +1350,34 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
> > >       .pad    = &ov772x_subdev_pad_ops,
> > >  };
> > >
> > > +static int ov772x_parse_dt(struct i2c_client *client,
> > > +                        struct ov772x_priv *priv)
> > > +{
> > > +     struct v4l2_fwnode_endpoint bus_cfg;
> > > +     struct fwnode_handle *ep;
> > > +     int ret;
> > > +
> > > +     ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> > > +                                         NULL);
> > > +     if (!ep) {
> > > +             dev_err(&client->dev, "Endpoint node not found\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
> >
> > Please zero the entire struct, i.e. do this assignment in the declaration.
> >
> Agreed, but instead at the declaration I would prefer here as below,
> since patch 2/3 has a comment related to backward compatibility with
> the bindings. Is this OK with you ?
>     bus_cfg = (struct v4l2_fwnode_endpoint)
>           { .bus_type = V4L2_MBUS_PARALLEL };

Why not in variable declaration?

-- 
Sakari Ailus
