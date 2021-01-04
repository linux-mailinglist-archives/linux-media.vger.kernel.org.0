Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213482E9C73
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 19:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbhADSA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 13:00:28 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34284 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbhADSA2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 13:00:28 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8634D1F44C54
Message-ID: <0b3e741f7c6c9ebfcbf1c18742d74335a224fc41.camel@collabora.com>
Subject: Re: [PATCH v2] media: imx6-mipi-csi2: Call remote subdev
 get_mbus_config to get active lanes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Date:   Mon, 04 Jan 2021 14:59:40 -0300
In-Reply-To: <183b9760df78c00ca036b350dc76175b0123de47.camel@pengutronix.de>
References: <20210103154155.318300-1-ezequiel@collabora.com>
         <183b9760df78c00ca036b350dc76175b0123de47.camel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Mon, 2021-01-04 at 14:41 +0100, Philipp Zabel wrote:
> Hi Ezequiel,
> 
> thank you for picking this up.
> 

No problem.

> On Sun, 2021-01-03 at 12:41 -0300, Ezequiel Garcia wrote:
> > Currently, the CSI2 subdevice is using the data-lanes from the
> > neareast endpoint to config the CSI2 lanes.
> > 
> > While this may work, the proper way to configure the hardware is
> > to obtain the remote subdevice in v4l2_async_notifier_operations.bound(),
> > and then call get_mbus_config using the remote subdevice to get
> > the active lanes.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Same comment as Laurent, csi2_get_active_lanes() looks to be the same as
> rcsi2_get_active_lanes() in rcar-csi2, so this could benefit from a
> common helper (later).
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 

Thanks for the review.

> > ---
> >  drivers/staging/media/imx/TODO             | 12 ---
> >  drivers/staging/media/imx/imx6-mipi-csi2.c | 99 +++++++++++++++++++---
> >  2 files changed, 87 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
> > index 9cfc1c1e78dc..c575f419204a 100644
> > --- a/drivers/staging/media/imx/TODO
> > +++ b/drivers/staging/media/imx/TODO
> > @@ -2,18 +2,6 @@
> >  - The Frame Interval Monitor could be exported to v4l2-core for
> >    general use.
> >  
> > -- The CSI subdevice parses its nearest upstream neighbor's device-tree
> > -  bus config in order to setup the CSI. Laurent Pinchart argues that
> > -  instead the CSI subdev should call its neighbor's g_mbus_config op
> > -  (which should be propagated if necessary) to get this info. However
> > -  Hans Verkuil is planning to remove the g_mbus_config op. For now this
> > -  driver uses the parsed DT bus config method until this issue is
> > -  resolved.
> > -
> > -  2020-06: g_mbus has been removed in favour of the get_mbus_config pad
> > -  operation which should be used to avoid parsing the remote endpoint
> > -  configuration.
> > -
> >  - This media driver supports inheriting V4L2 controls to the
> >    video capture devices, from the subdevices in the capture device's
> >    pipeline. The controls for each capture device are updated in the
> > diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> > index 94d87d27d389..8cfd6358c306 100644
> > --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> > +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> [...]
> > @@ -300,8 +300,56 @@ static void csi2ipu_gasket_init(struct csi2_dev *csi2)
> >         writel(reg, csi2->base + CSI2IPU_GASKET);
> >  }
> >  
> > +static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
> > +{
> > +       struct v4l2_mbus_config mbus_config = { 0 };
> > +       unsigned int num_lanes = UINT_MAX;
> > +       int ret;
> > +
> > +       *lanes = csi2->data_lanes;
> > +
> > +       ret = v4l2_subdev_call(csi2->remote, pad, get_mbus_config,
> > +                              csi2->remote_pad, &mbus_config);
> > +       if (ret == -ENOIOCTLCMD) {
> > +               dev_dbg(csi2->dev, "No remote mbus configuration available\n");
> > +               return 0;
> > +       }
> > +
> > +       if (ret) {
> > +               dev_err(csi2->dev, "Failed to get remote mbus configuration\n");
> > +               return ret;
> > +       }
> > +
> > +       if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
> > +               dev_err(csi2->dev, "Unsupported media bus type %u\n",
> > +                       mbus_config.type);
> > +               return -EINVAL;
> > +       }
> > +
> > +       if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
> > +               num_lanes = 1;
> > +       else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
> > +               num_lanes = 2;
> > +       else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
> > +               num_lanes = 3;
> > +       else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
> > +               num_lanes = 4;
> 
> I'd turn this into a
>         switch (mbus_config.flags & V4L2_MBUS_CSI2_LANES) { }
> to catch erroneous values of 0 or multiple bits set, as for those the
> following error message doesn't make much sense:
> 

Makes sense. We can do that later, once we move the function to the core.

> > +       if (num_lanes > csi2->data_lanes) {
> > +               dev_err(csi2->dev,
> > +                       "Unsupported mbus config: too many data lanes %u\n",
> > +                       num_lanes);
> > +               return -EINVAL;
> > +       }
> > +
> > +       *lanes = num_lanes;
> > +
> > +       return 0;
> > +}
> 
> Still, this patch looks good to me.
> 

Thanks,
Ezequiel


