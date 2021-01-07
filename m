Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DFC2EE827
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 23:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbhAGWKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 17:10:48 -0500
Received: from mga02.intel.com ([134.134.136.20]:7750 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726720AbhAGWKs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Jan 2021 17:10:48 -0500
IronPort-SDR: c6Oj9ZBJgDZLaAbimeksx4GrQeo8eZSJ/d/58qNXrOcRFRDsRENfKYisQa5Crk4JiYKIzJFQpA
 piXvF1LgQfoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164574964"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164574964"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 14:09:02 -0800
IronPort-SDR: HSNkXaKKoiF2LhcguBj4tW+9slcucMvh+aR9mh3lQO90W807T4rNqTlhiebqZoXIPxaFYvgPBF
 VpbBm+eBWKag==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="388011116"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 14:09:01 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 48E00205C8; Fri,  8 Jan 2021 00:08:59 +0200 (EET)
Date:   Fri, 8 Jan 2021 00:08:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Subject: Re: [PATCH v2] media: v4l2-async: Add waiting subdevices debugfs
Message-ID: <20210107220859.GW11878@paasikivi.fi.intel.com>
References: <20210104174840.144958-1-ezequiel@collabora.com>
 <20210105002022.GO11878@paasikivi.fi.intel.com>
 <02148b8ca6fa1d4fec206ec1511316f98fc616cb.camel@collabora.com>
 <X/d5QJ/jGzTGVO9X@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X/d5QJ/jGzTGVO9X@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 07, 2021 at 11:12:32PM +0200, Laurent Pinchart wrote:
> Hi Ezequiel,
> 
> On Thu, Jan 07, 2021 at 05:58:04PM -0300, Ezequiel Garcia wrote:
> > On Tue, 2021-01-05 at 02:20 +0200, Sakari Ailus wrote:
> > > On Mon, Jan 04, 2021 at 02:48:40PM -0300, Ezequiel Garcia wrote:
> > > > There is currently little to none information available
> > > > about the reasons why a v4l2-async device hasn't
> > > > probed completely.
> > > > 
> > > > Inspired by the "devices_deferred" debugfs file,
> > > > add a file to list information about the subdevices
> > > > that are on waiting lists, for each notifier.
> > > > 
> > > > This is useful to debug v4l2-async subdevices
> > > > and notifiers, for instance when doing device bring-up.
> > > > 
> > > > For instance, a typical output would be:
> > > > 
> > > > $ cat /sys/kernel/debug/video4linux/pending_async_subdevices
> > > > ipu1_csi1:
> > > >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi1_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux
> > > > ipu1_csi0:
> > > >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi0_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux
> > > > imx6-mipi-csi2:
> > > >  [fwnode] dev=1-003c, node=/soc/bus@2100000/i2c@21a4000/camera@3c
> > > > imx-media:
> > > > 
> > > > Note that match-type "custom" prints no information.
> > > > Since there are no in-tree users of this match-type,
> > > > the implementation doesn't bother.
> > > > 
> > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > ---
> > > > v2:
> > > > * Print fwnode path, as suggested by Sakari.
> > > > * Print the subdevices under their corresponding notifier.
> > > > * Rename the file as suggested by Laurent.
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-async.c | 66 ++++++++++++++++++++++++++++
> > > >  drivers/media/v4l2-core/v4l2-dev.c   |  5 +++
> > > >  include/media/v4l2-async.h           |  9 ++++
> > > >  3 files changed, 80 insertions(+)
> > > > 
> > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > index e3ab003a6c85..d779808abb3b 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > @@ -5,6 +5,7 @@
> > > >   * Copyright (C) 2012-2013, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > >   */
> > > >  
> > > > +#include <linux/debugfs.h>
> > > >  #include <linux/device.h>
> > > >  #include <linux/err.h>
> > > >  #include <linux/i2c.h>
> > > > @@ -14,6 +15,7 @@
> > > >  #include <linux/mutex.h>
> > > >  #include <linux/of.h>
> > > >  #include <linux/platform_device.h>
> > > > +#include <linux/seq_file.h>
> > > >  #include <linux/slab.h>
> > > >  #include <linux/types.h>
> > > >  
> > > > @@ -837,3 +839,67 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> > > >         mutex_unlock(&list_lock);
> > > >  }
> > > >  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> > > > +
> > > > +static void print_waiting_subdev(struct seq_file *s,
> > > > +                                struct v4l2_async_subdev *asd)
> > > > +{
> > > > +       switch (asd->match_type) {
> > > > +       case V4L2_ASYNC_MATCH_CUSTOM:
> > > > +               seq_puts(s, " [custom]\n");
> > > > +               break;
> > > > +       case V4L2_ASYNC_MATCH_DEVNAME:
> > > > +               seq_printf(s, " [devname] %s\n", asd->match.device_name);
> > > > +               break;
> > > > +       case V4L2_ASYNC_MATCH_I2C:
> > > > +               seq_printf(s, " [i2c] %d-%04x\n", asd->match.i2c.adapter_id,
> > > > +                          asd->match.i2c.address);
> > > > +               break;
> > > > +       case V4L2_ASYNC_MATCH_FWNODE: {
> > > > +               struct fwnode_handle *fwnode = asd->match.fwnode;
> > > > +
> > > > +               if (fwnode_graph_is_endpoint(fwnode))
> > > > +                       fwnode = fwnode_graph_get_port_parent(fwnode);
> > > 
> > > Could you print the endpoint node name as-is? That's what matching uses,
> > > too. You'd need one more local variable for that I think.
> > > 
> > 
> > Since we are printing the full path for the node, how about this:
> > 
> >                 devnode = fwnode_graph_is_endpoint(fwnode) ?                     
> >                           fwnode_graph_get_port_parent(fwnode) : fwnode;         
> >                                                                                  
> >                 seq_printf(s, " [fwnode] dev=%s, node=%pfw\n",                   
> >                            devnode->dev ? dev_name(devnode->dev) : "nil",        
> >                            fwnode);                                              
> > 
> > The parent is used only to print a more useful dev_name,
> > but otherwise the actual full path is used,
> > whether it's an endpoint or not.
> 
> With the refcount issue handled (fwnode_graph_get_port_parent() takes a
> reference), it looks good to me.

Agreed. I'd just use fwnode_handle_get() on the right-most operand, and do
fwnode_handle_put() when done.

-- 
Regards,

Sakari Ailus
