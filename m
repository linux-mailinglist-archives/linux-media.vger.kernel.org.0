Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5F72EABFD
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbhAENfK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbhAENfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:35:10 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC271C061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 05:34:29 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 31DF41F4540E
Message-ID: <ba227fd79a0e0921b68365a4d636926b7c8b14ef.camel@collabora.com>
Subject: Re: [PATCH v2] media: v4l2-async: Add waiting subdevices debugfs
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Date:   Tue, 05 Jan 2021 10:34:14 -0300
In-Reply-To: <X/PhA5xsuHfSE1R/@pendragon.ideasonboard.com>
References: <20210104174840.144958-1-ezequiel@collabora.com>
         <X/PhA5xsuHfSE1R/@pendragon.ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Laurent,

On Tue, 2021-01-05 at 05:46 +0200, Laurent Pinchart wrote:
> Hi Ezequiel,
> 
> Thank you for the patch.
> 
> On Mon, Jan 04, 2021 at 02:48:40PM -0300, Ezequiel Garcia wrote:
> > There is currently little to none information available
> > about the reasons why a v4l2-async device hasn't
> > probed completely.
> > 
> > Inspired by the "devices_deferred" debugfs file,
> > add a file to list information about the subdevices
> > that are on waiting lists, for each notifier.
> > 
> > This is useful to debug v4l2-async subdevices
> > and notifiers, for instance when doing device bring-up.
> > 
> > For instance, a typical output would be:
> > 
> > $ cat /sys/kernel/debug/video4linux/pending_async_subdevices
> > ipu1_csi1:
> >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi1_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux
> > ipu1_csi0:
> >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi0_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux
> > imx6-mipi-csi2:
> >  [fwnode] dev=1-003c, node=/soc/bus@2100000/i2c@21a4000/camera@3c
> > imx-media:
> > 
> > Note that match-type "custom" prints no information.
> > Since there are no in-tree users of this match-type,
> > the implementation doesn't bother.
> 
> I wonder if we should drop it.
> 

That would make sense, unless we have some out-of-tree
users, and we want to support that.

Sakari, what do you think?

> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> > v2:
> > * Print fwnode path, as suggested by Sakari.
> > * Print the subdevices under their corresponding notifier.
> > * Rename the file as suggested by Laurent.
> > ---
> >  drivers/media/v4l2-core/v4l2-async.c | 66 ++++++++++++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-dev.c   |  5 +++
> >  include/media/v4l2-async.h           |  9 ++++
> >  3 files changed, 80 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > index e3ab003a6c85..d779808abb3b 100644
> > --- a/drivers/media/v4l2-core/v4l2-async.c
> > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2012-2013, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> >   */
> >  
> > +#include <linux/debugfs.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/i2c.h>
> > @@ -14,6 +15,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/seq_file.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> >  
> > @@ -837,3 +839,67 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> >         mutex_unlock(&list_lock);
> >  }
> >  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> > +
> > +static void print_waiting_subdev(struct seq_file *s,
> > +                                struct v4l2_async_subdev *asd)
> > +{
> > +       switch (asd->match_type) {
> > +       case V4L2_ASYNC_MATCH_CUSTOM:
> > +               seq_puts(s, " [custom]\n");
> > +               break;
> > +       case V4L2_ASYNC_MATCH_DEVNAME:
> > +               seq_printf(s, " [devname] %s\n", asd->match.device_name);
> > +               break;
> > +       case V4L2_ASYNC_MATCH_I2C:
> > +               seq_printf(s, " [i2c] %d-%04x\n", asd->match.i2c.adapter_id,
> > +                          asd->match.i2c.address);
> > +               break;
> > +       case V4L2_ASYNC_MATCH_FWNODE: {
> > +               struct fwnode_handle *fwnode = asd->match.fwnode;
> > +
> > +               if (fwnode_graph_is_endpoint(fwnode))
> > +                       fwnode = fwnode_graph_get_port_parent(fwnode);
> > +
> > +               seq_printf(s, " [fwnode] dev=%s, node=%pfw\n",
> > +                          fwnode->dev ? dev_name(fwnode->dev) : "nil",
> > +                          fwnode);
> 
> Apart from Sakari's comment related to printing the endpoint node (but
> keeping the port's parent for ->dev),
> 

Yes, makes some sense.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Thanks for reviewing,
Ezequiel

