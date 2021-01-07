Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D2A2EE77A
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 22:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbhAGVN3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 16:13:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58838 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbhAGVN2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 16:13:28 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21F2B292;
        Thu,  7 Jan 2021 22:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610053966;
        bh=iSN34c4AU5rPgaHWtf0hIhL0FEp776s6VojFNxGa5nc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UyifnPzyKIPC8ZEb40/wteZGtLi59G9NsNwnySGHYWzf4o3Ca93theJBaB3i19ypG
         03QP+6HFWSlAOwXTD+ibGd8OfhxsODHx8C0yBz7IYSMDi9XcPJySoYVocwOlieNLsM
         UAFB5jVUUfNeT4ssSBvZSB0H4Atn7bp8oTZGXYh8=
Date:   Thu, 7 Jan 2021 23:12:32 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Subject: Re: [PATCH v2] media: v4l2-async: Add waiting subdevices debugfs
Message-ID: <X/d5QJ/jGzTGVO9X@pendragon.ideasonboard.com>
References: <20210104174840.144958-1-ezequiel@collabora.com>
 <20210105002022.GO11878@paasikivi.fi.intel.com>
 <02148b8ca6fa1d4fec206ec1511316f98fc616cb.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02148b8ca6fa1d4fec206ec1511316f98fc616cb.camel@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Thu, Jan 07, 2021 at 05:58:04PM -0300, Ezequiel Garcia wrote:
> On Tue, 2021-01-05 at 02:20 +0200, Sakari Ailus wrote:
> > On Mon, Jan 04, 2021 at 02:48:40PM -0300, Ezequiel Garcia wrote:
> > > There is currently little to none information available
> > > about the reasons why a v4l2-async device hasn't
> > > probed completely.
> > > 
> > > Inspired by the "devices_deferred" debugfs file,
> > > add a file to list information about the subdevices
> > > that are on waiting lists, for each notifier.
> > > 
> > > This is useful to debug v4l2-async subdevices
> > > and notifiers, for instance when doing device bring-up.
> > > 
> > > For instance, a typical output would be:
> > > 
> > > $ cat /sys/kernel/debug/video4linux/pending_async_subdevices
> > > ipu1_csi1:
> > >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi1_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux
> > > ipu1_csi0:
> > >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi0_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux
> > > imx6-mipi-csi2:
> > >  [fwnode] dev=1-003c, node=/soc/bus@2100000/i2c@21a4000/camera@3c
> > > imx-media:
> > > 
> > > Note that match-type "custom" prints no information.
> > > Since there are no in-tree users of this match-type,
> > > the implementation doesn't bother.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > > v2:
> > > * Print fwnode path, as suggested by Sakari.
> > > * Print the subdevices under their corresponding notifier.
> > > * Rename the file as suggested by Laurent.
> > > ---
> > >  drivers/media/v4l2-core/v4l2-async.c | 66 ++++++++++++++++++++++++++++
> > >  drivers/media/v4l2-core/v4l2-dev.c   |  5 +++
> > >  include/media/v4l2-async.h           |  9 ++++
> > >  3 files changed, 80 insertions(+)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > index e3ab003a6c85..d779808abb3b 100644
> > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > @@ -5,6 +5,7 @@
> > >   * Copyright (C) 2012-2013, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > >   */
> > >  
> > > +#include <linux/debugfs.h>
> > >  #include <linux/device.h>
> > >  #include <linux/err.h>
> > >  #include <linux/i2c.h>
> > > @@ -14,6 +15,7 @@
> > >  #include <linux/mutex.h>
> > >  #include <linux/of.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/seq_file.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/types.h>
> > >  
> > > @@ -837,3 +839,67 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> > >         mutex_unlock(&list_lock);
> > >  }
> > >  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> > > +
> > > +static void print_waiting_subdev(struct seq_file *s,
> > > +                                struct v4l2_async_subdev *asd)
> > > +{
> > > +       switch (asd->match_type) {
> > > +       case V4L2_ASYNC_MATCH_CUSTOM:
> > > +               seq_puts(s, " [custom]\n");
> > > +               break;
> > > +       case V4L2_ASYNC_MATCH_DEVNAME:
> > > +               seq_printf(s, " [devname] %s\n", asd->match.device_name);
> > > +               break;
> > > +       case V4L2_ASYNC_MATCH_I2C:
> > > +               seq_printf(s, " [i2c] %d-%04x\n", asd->match.i2c.adapter_id,
> > > +                          asd->match.i2c.address);
> > > +               break;
> > > +       case V4L2_ASYNC_MATCH_FWNODE: {
> > > +               struct fwnode_handle *fwnode = asd->match.fwnode;
> > > +
> > > +               if (fwnode_graph_is_endpoint(fwnode))
> > > +                       fwnode = fwnode_graph_get_port_parent(fwnode);
> > 
> > Could you print the endpoint node name as-is? That's what matching uses,
> > too. You'd need one more local variable for that I think.
> > 
> 
> Since we are printing the full path for the node, how about this:
> 
>                 devnode = fwnode_graph_is_endpoint(fwnode) ?                     
>                           fwnode_graph_get_port_parent(fwnode) : fwnode;         
>                                                                                  
>                 seq_printf(s, " [fwnode] dev=%s, node=%pfw\n",                   
>                            devnode->dev ? dev_name(devnode->dev) : "nil",        
>                            fwnode);                                              
> 
> The parent is used only to print a more useful dev_name,
> but otherwise the actual full path is used,
> whether it's an endpoint or not.

With the refcount issue handled (fwnode_graph_get_port_parent() takes a
reference), it looks good to me.

-- 
Regards,

Laurent Pinchart
