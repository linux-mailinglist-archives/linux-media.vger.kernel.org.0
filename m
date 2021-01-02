Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 061432E87EF
	for <lists+linux-media@lfdr.de>; Sat,  2 Jan 2021 16:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbhABPaE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 10:30:04 -0500
Received: from mga02.intel.com ([134.134.136.20]:32147 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726575AbhABPaD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Jan 2021 10:30:03 -0500
IronPort-SDR: TLAYOhPR5gI3C9A469kvWK3ZdG6yscImxGetbDfwk8P8FfJfSbzPr1xZrslYTTQQw7gcatMHYJ
 PX+GEANwQLUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9852"; a="163890964"
X-IronPort-AV: E=Sophos;i="5.78,469,1599548400"; 
   d="scan'208";a="163890964"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 07:28:17 -0800
IronPort-SDR: q+HcnCN7wrGksPOrxQ0VIAJHpJHcn6LXeuegYLx+r82gA6kM0oT5zw7VSaX4U2F32lXZatOZuE
 Mv56k8dE7f4g==
X-IronPort-AV: E=Sophos;i="5.78,469,1599548400"; 
   d="scan'208";a="394338806"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 07:28:16 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 6EC3B207BF; Sat,  2 Jan 2021 17:28:14 +0200 (EET)
Date:   Sat, 2 Jan 2021 17:28:14 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Subject: Re: [PATCH] media: v4l2-async: Add waiting subdevices debugfs
Message-ID: <20210102152814.GB11878@paasikivi.fi.intel.com>
References: <20201228180511.43486-1-ezequiel@collabora.com>
 <20201228183520.GB26370@paasikivi.fi.intel.com>
 <X+pN4Z3eCIV9cjNV@pendragon.ideasonboard.com>
 <faa537997323c4c6e7e21e0edcc2fbc63e03725c.camel@collabora.com>
 <X+s53z5vB0hiZY2E@pendragon.ideasonboard.com>
 <91034a368adcd53691de2b814f5c929e8ccba061.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91034a368adcd53691de2b814f5c929e8ccba061.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 29, 2020 at 02:52:52PM -0300, Ezequiel Garcia wrote:
> On Tue, 2020-12-29 at 16:14 +0200, Laurent Pinchart wrote:
> > Hi Ezequiel,
> > 
> > On Tue, Dec 29, 2020 at 07:16:41AM -0300, Ezequiel Garcia wrote:
> > > On Mon, 2020-12-28 at 23:28 +0200, Laurent Pinchart wrote:
> > > > On Mon, Dec 28, 2020 at 08:35:20PM +0200, Sakari Ailus wrote:
> > > > > On Mon, Dec 28, 2020 at 03:05:11PM -0300, Ezequiel Garcia wrote:
> > > > > > There is currently little to none information available
> > > > > > about the reasons why a v4l2-async device hasn't
> > > > > > probed completely.
> > > > > > 
> > > > > > Inspired by the "devices_deferred" debugfs file,
> > > > > > add a file to list information about the subdevices
> > > > > > that are on waiting lists, for each notifier.
> > > > > > 
> > > > > > This is useful to debug v4l2-async subdevices
> > > > > > and notifiers, for instance when doing device bring-up.
> > > > > > 
> > > > > > For instance, a typical output would be:
> > > > > > 
> > > > > > $ cat /sys/kernel/debug/video4linux/waiting_subdevices
> > > > > > [fwnode] 1-003c
> > > > > > [fwnode] 20e0000.iomuxc-gpr:ipu1_csi1_mux
> > > > > > [fwnode] 20e0000.iomuxc-gpr:ipu1_csi0_mux
> > > > > > 
> > > > > > It's possible to provide some more information, detecting
> > > > > > the type of fwnode and printing of-specific or acpi-specific
> > > > > > details. For now, the implementation is kept simple.
> > > > > 
> > > > > The rest of the debug information we're effectively providing through
> > > > > kernel messages on DEBUG level (pr_debug/dev_dbg). Could we do the same
> > > > > here?
> > > > > 
> > > > > Would just printing the names of the pending sub-devices at notifier
> > > > > register and async subdevice register time be sufficient? That way you'd
> > > > > also be fine with just dmesg output if you're asking someone to provide you
> > > > > information from another system.
> > > > 
> > > > I think debugfs would be better. It can show the current state of an
> > > > async notifier in a single place, which is easier to parse than
> > > > reconstructing it from kernel messages and implicit knowledge of the
> > > > code. I'd expect users to have an easier time debugging probe issues
> > > > with such centralized information.
> > > > 
> > > > > > Also, note that match-type "custom" prints no information.
> > > > > > Since there are no in-tree users of this match-type,
> > > > > > the implementation doesn't bother.
> > > > > 
> > > > > Lines up to 74 characters are fine. Only in Gerrit it's 60 or 40 or
> > > > > whatever characters. ;-)
> > > > > 
> > > > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > > ---
> > > > > >  drivers/media/v4l2-core/v4l2-async.c | 54 ++++++++++++++++++++++++++++
> > > > > >  drivers/media/v4l2-core/v4l2-dev.c   |  5 +++
> > > > > >  include/media/v4l2-async.h           |  7 ++++
> > > > > >  3 files changed, 66 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > > > index e3ab003a6c85..32cd1ecced97 100644
> > > > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > > > @@ -5,6 +5,7 @@
> > > > > >   * Copyright (C) 2012-2013, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > > > >   */
> > > > > >  
> > > > > > +#include <linux/debugfs.h>
> > > > > >  #include <linux/device.h>
> > > > > >  #include <linux/err.h>
> > > > > >  #include <linux/i2c.h>
> > > > > > @@ -14,6 +15,7 @@
> > > > > >  #include <linux/mutex.h>
> > > > > >  #include <linux/of.h>
> > > > > >  #include <linux/platform_device.h>
> > > > > > +#include <linux/seq_file.h>
> > > > > >  #include <linux/slab.h>
> > > > > >  #include <linux/types.h>
> > > > > >  
> > > > > > @@ -837,3 +839,55 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> > > > > >         mutex_unlock(&list_lock);
> > > > > >  }
> > > > > >  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> > > > > > +
> > > > > > +static void print_waiting_subdev(struct seq_file *s,
> > > > > > +                                struct v4l2_async_subdev *asd)
> > > > > > +{
> > > > > > +       switch (asd->match_type) {
> > > > > > +       case V4L2_ASYNC_MATCH_CUSTOM:
> > > > > > +               seq_puts(s, "[custom]\n");
> > > > > > +               break;
> > > > > > +       case V4L2_ASYNC_MATCH_DEVNAME:
> > > > > > +               seq_printf(s, "[devname] %s\n",
> > > > > > +                          asd->match.device_name);
> > > > > > +               break;
> > > > > > +       case V4L2_ASYNC_MATCH_I2C:
> > > > > > +               seq_printf(s, "[i2c] %d-%04x\n",
> > > > > > +                          asd->match.i2c.adapter_id,
> > > > > > +                          asd->match.i2c.address);
> > > > > > +               break;
> > > > > > +       case V4L2_ASYNC_MATCH_FWNODE: {
> > > > > > +               struct fwnode_handle *fwnode = asd->match.fwnode;
> > > > > > +
> > > > > > +               if (fwnode_graph_is_endpoint(fwnode))
> > > > > > +                       fwnode = fwnode_graph_get_port_parent(fwnode);
> > > > 
> > > > Can we also print endpoint information ?
> > > 
> > > What endpoint information do you have in mind? I'm asking this
> > > because I printed endpoint OF node full names, only to find
> > > so many of them named "endpoint" :)
> > 
> > The port name and endpoint name would be useful. The full fwnode name
> > would be an acceptable way to print that I think.
> > 
> 
> Makes sense, and since we'd be parsing the fwnode subtype,
> we'll be able to do something like:
> 
> [of] dev=%s, node=%s
> [swnode] ...
> [acpi] ...

Could you simply print the node name, %pfw?

It works independently of the firmware interface and contains all the
relevant information.

-- 
Sakari Ailus
