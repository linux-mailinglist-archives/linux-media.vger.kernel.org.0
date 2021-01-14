Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916C32F6585
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 17:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbhANQNH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 11:13:07 -0500
Received: from mga17.intel.com ([192.55.52.151]:34088 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725918AbhANQNH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 11:13:07 -0500
IronPort-SDR: xdeRDDjG+i2P8BH/8jMuHhN5u4GBM3q7vyY2Pl9w55XWqYXrFxHZNUtSK0bIyAQ0p5NFWd4LXB
 trop8fN/XCGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="158167779"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="158167779"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:11:20 -0800
IronPort-SDR: eR87Y3bCC1FLuKw4cQs1exQXqg9O6LP3Ex6QZguIQSGwRuTPp7IKg+rEKdoCvyMB/GQV1+E1gK
 /HauKhXX+GZg==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="382315772"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:11:18 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 485CD20356; Thu, 14 Jan 2021 18:11:16 +0200 (EET)
Date:   Thu, 14 Jan 2021 18:11:16 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Subject: Re: [PATCH 01/13] media: v4l2-async: Clean
 v4l2_async_notifier_add_fwnode_remote_subdev semantics
Message-ID: <20210114161116.GM11878@paasikivi.fi.intel.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
 <20210112132339.5621-2-ezequiel@collabora.com>
 <X/+lbrp7bLuAjl8e@pendragon.ideasonboard.com>
 <20210114134709.GL11878@paasikivi.fi.intel.com>
 <fe45ae496158a6d6be954f5884a7e3beee7ec2c6.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe45ae496158a6d6be954f5884a7e3beee7ec2c6.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 14, 2021 at 11:46:11AM -0300, Ezequiel Garcia wrote:
> On Thu, 2021-01-14 at 15:47 +0200, Sakari Ailus wrote:
> > Hi Laurent, Ezequiel,
> > 
> > On Thu, Jan 14, 2021 at 03:59:10AM +0200, Laurent Pinchart wrote:
> > > > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > > index 68da1eed753d..235dcf0c4122 100644
> > > > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > > > @@ -252,6 +252,7 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> > > >                         .bus_type = V4L2_MBUS_CSI2_DPHY
> > > >                 };
> > > >                 struct rkisp1_sensor_async *rk_asd = NULL;
> > > > +               struct v4l2_async_subdev *asd;
> > > >                 struct fwnode_handle *ep;
> > > >  
> > > >                 ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
> > > > @@ -264,21 +265,16 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
> > > >                 if (ret)
> > > >                         goto err_parse;
> > > >  
> > > > -               rk_asd = kzalloc(sizeof(*rk_asd), GFP_KERNEL);
> > > > -               if (!rk_asd) {
> > > > -                       ret = -ENOMEM;
> > > > +               asd = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
> > > > +                                                       sizeof(*rk_asd));
> > > > +               if (IS_ERR(asd))
> > 
> > The problem with registering the sub-device already here is that the driver
> > can proceed to use the information in the async sub-device object which is
> > initialised below.
> > 
> 
> Note that this interface is not really registering sub-devices.

Not directly, but this will happen as a by-product of registering the async
sub-device and other functions that will be called. All this takes place
synchronously, meaming that by the time this function returns, the
character devices that are the user space interface have already been
created.

> 
> > There might not be practical problems but there's also no guarantee it
> > would work. The same problem is actually present in the rest of the
> > functions registering the object after allocating it.
> > 
> 
> I'd say the v4l2_async_notifier_add_{}_subdev interface is about adding a
> v4l2-async subdevice descriptor to a v4l2-async notifier.
> 
> Until the v4l2-async notifier is not registered by v4l2_async_notifier_register()
> (which is expected to happen after the structures that embed the descriptors
> are filled, if such thing is needed), then I don't think the driver
> would have access to the descriptors.
> 
> The access to the v4l2-async subdevice descriptor (struct v4l2_async_subdev)
> should be done via v4l2_async_notifier_operations.bound and .complete ops.
> 
> I think this usage model is safe, and quite clear from the interface itself,
> so don't think there's any issue with this change.

As I said, you might not have a practical problem but there's no
_guarantee_ that it'll be fine.

There are three things being done here, allocating memory for the async
sub-device, initialising it and finally registering it. These need to take
place in that order.

-- 
Kind regards,

Sakari Ailus
