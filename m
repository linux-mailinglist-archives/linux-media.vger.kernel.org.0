Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DF32F636A
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 15:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728919AbhANOrA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 09:47:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728869AbhANOrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 09:47:00 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8E3541F45C9B
Message-ID: <fe45ae496158a6d6be954f5884a7e3beee7ec2c6.camel@collabora.com>
Subject: Re: [PATCH 01/13] media: v4l2-async: Clean
 v4l2_async_notifier_add_fwnode_remote_subdev semantics
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Date:   Thu, 14 Jan 2021 11:46:11 -0300
In-Reply-To: <20210114134709.GL11878@paasikivi.fi.intel.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
         <20210112132339.5621-2-ezequiel@collabora.com>
         <X/+lbrp7bLuAjl8e@pendragon.ideasonboard.com>
         <20210114134709.GL11878@paasikivi.fi.intel.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2021-01-14 at 15:47 +0200, Sakari Ailus wrote:
> Hi Laurent, Ezequiel,
> 
> On Thu, Jan 14, 2021 at 03:59:10AM +0200, Laurent Pinchart wrote:
> > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > index 68da1eed753d..235dcf0c4122 100644
> > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > @@ -252,6 +252,7 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> > >                         .bus_type = V4L2_MBUS_CSI2_DPHY
> > >                 };
> > >                 struct rkisp1_sensor_async *rk_asd = NULL;
> > > +               struct v4l2_async_subdev *asd;
> > >                 struct fwnode_handle *ep;
> > >  
> > >                 ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
> > > @@ -264,21 +265,16 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> > >                 if (ret)
> > >                         goto err_parse;
> > >  
> > > -               rk_asd = kzalloc(sizeof(*rk_asd), GFP_KERNEL);
> > > -               if (!rk_asd) {
> > > -                       ret = -ENOMEM;
> > > +               asd = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> > > +                                                       sizeof(*rk_asd));
> > > +               if (IS_ERR(asd))
> 
> The problem with registering the sub-device already here is that the driver
> can proceed to use the information in the async sub-device object which is
> initialised below.
> 

Note that this interface is not really registering sub-devices.

> There might not be practical problems but there's also no guarantee it
> would work. The same problem is actually present in the rest of the
> functions registering the object after allocating it.
> 

I'd say the v4l2_async_notifier_add_{}_subdev interface is about adding a
v4l2-async subdevice descriptor to a v4l2-async notifier.

Until the v4l2-async notifier is not registered by v4l2_async_notifier_register()
(which is expected to happen after the structures that embed the descriptors
are filled, if such thing is needed), then I don't think the driver
would have access to the descriptors.

The access to the v4l2-async subdevice descriptor (struct v4l2_async_subdev)
should be done via v4l2_async_notifier_operations.bound and .complete ops.

I think this usage model is safe, and quite clear from the interface itself,
so don't think there's any issue with this change.

And OTOH, this is about making v4l2_async_notifier_add_fwnode_remote_subdev
consistent with v4l2_async_notifier_add_fwnode_subdev et al.

Thanks,
Ezequiel

