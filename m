Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21F8C2E72D1
	for <lists+linux-media@lfdr.de>; Tue, 29 Dec 2020 18:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgL2Rxo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Dec 2020 12:53:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgL2Rxn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Dec 2020 12:53:43 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD78C061574
        for <linux-media@vger.kernel.org>; Tue, 29 Dec 2020 09:53:03 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 215501F446A9
Message-ID: <91034a368adcd53691de2b814f5c929e8ccba061.camel@collabora.com>
Subject: Re: [PATCH] media: v4l2-async: Add waiting subdevices debugfs
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com
Date:   Tue, 29 Dec 2020 14:52:52 -0300
In-Reply-To: <X+s53z5vB0hiZY2E@pendragon.ideasonboard.com>
References: <20201228180511.43486-1-ezequiel@collabora.com>
         <20201228183520.GB26370@paasikivi.fi.intel.com>
         <X+pN4Z3eCIV9cjNV@pendragon.ideasonboard.com>
         <faa537997323c4c6e7e21e0edcc2fbc63e03725c.camel@collabora.com>
         <X+s53z5vB0hiZY2E@pendragon.ideasonboard.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-12-29 at 16:14 +0200, Laurent Pinchart wrote:
> Hi Ezequiel,
> 
> On Tue, Dec 29, 2020 at 07:16:41AM -0300, Ezequiel Garcia wrote:
> > On Mon, 2020-12-28 at 23:28 +0200, Laurent Pinchart wrote:
> > > On Mon, Dec 28, 2020 at 08:35:20PM +0200, Sakari Ailus wrote:
> > > > On Mon, Dec 28, 2020 at 03:05:11PM -0300, Ezequiel Garcia wrote:
> > > > > There is currently little to none information available
> > > > > about the reasons why a v4l2-async device hasn't
> > > > > probed completely.
> > > > > 
> > > > > Inspired by the "devices_deferred" debugfs file,
> > > > > add a file to list information about the subdevices
> > > > > that are on waiting lists, for each notifier.
> > > > > 
> > > > > This is useful to debug v4l2-async subdevices
> > > > > and notifiers, for instance when doing device bring-up.
> > > > > 
> > > > > For instance, a typical output would be:
> > > > > 
> > > > > $ cat /sys/kernel/debug/video4linux/waiting_subdevices
> > > > > [fwnode] 1-003c
> > > > > [fwnode] 20e0000.iomuxc-gpr:ipu1_csi1_mux
> > > > > [fwnode] 20e0000.iomuxc-gpr:ipu1_csi0_mux
> > > > > 
> > > > > It's possible to provide some more information, detecting
> > > > > the type of fwnode and printing of-specific or acpi-specific
> > > > > details. For now, the implementation is kept simple.
> > > > 
> > > > The rest of the debug information we're effectively providing through
> > > > kernel messages on DEBUG level (pr_debug/dev_dbg). Could we do the same
> > > > here?
> > > > 
> > > > Would just printing the names of the pending sub-devices at notifier
> > > > register and async subdevice register time be sufficient? That way you'd
> > > > also be fine with just dmesg output if you're asking someone to provide you
> > > > information from another system.
> > > 
> > > I think debugfs would be better. It can show the current state of an
> > > async notifier in a single place, which is easier to parse than
> > > reconstructing it from kernel messages and implicit knowledge of the
> > > code. I'd expect users to have an easier time debugging probe issues
> > > with such centralized information.
> > > 
> > > > > Also, note that match-type "custom" prints no information.
> > > > > Since there are no in-tree users of this match-type,
> > > > > the implementation doesn't bother.
> > > > 
> > > > Lines up to 74 characters are fine. Only in Gerrit it's 60 or 40 or
> > > > whatever characters. ;-)
> > > > 
> > > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > ---
> > > > >  drivers/media/v4l2-core/v4l2-async.c | 54 ++++++++++++++++++++++++++++
> > > > >  drivers/media/v4l2-core/v4l2-dev.c   |  5 +++
> > > > >  include/media/v4l2-async.h           |  7 ++++
> > > > >  3 files changed, 66 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > > index e3ab003a6c85..32cd1ecced97 100644
> > > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > > @@ -5,6 +5,7 @@
> > > > >   * Copyright (C) 2012-2013, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > > >   */
> > > > >  
> > > > > +#include <linux/debugfs.h>
> > > > >  #include <linux/device.h>
> > > > >  #include <linux/err.h>
> > > > >  #include <linux/i2c.h>
> > > > > @@ -14,6 +15,7 @@
> > > > >  #include <linux/mutex.h>
> > > > >  #include <linux/of.h>
> > > > >  #include <linux/platform_device.h>
> > > > > +#include <linux/seq_file.h>
> > > > >  #include <linux/slab.h>
> > > > >  #include <linux/types.h>
> > > > >  
> > > > > @@ -837,3 +839,55 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
> > > > >         mutex_unlock(&list_lock);
> > > > >  }
> > > > >  EXPORT_SYMBOL(v4l2_async_unregister_subdev);
> > > > > +
> > > > > +static void print_waiting_subdev(struct seq_file *s,
> > > > > +                                struct v4l2_async_subdev *asd)
> > > > > +{
> > > > > +       switch (asd->match_type) {
> > > > > +       case V4L2_ASYNC_MATCH_CUSTOM:
> > > > > +               seq_puts(s, "[custom]\n");
> > > > > +               break;
> > > > > +       case V4L2_ASYNC_MATCH_DEVNAME:
> > > > > +               seq_printf(s, "[devname] %s\n",
> > > > > +                          asd->match.device_name);
> > > > > +               break;
> > > > > +       case V4L2_ASYNC_MATCH_I2C:
> > > > > +               seq_printf(s, "[i2c] %d-%04x\n",
> > > > > +                          asd->match.i2c.adapter_id,
> > > > > +                          asd->match.i2c.address);
> > > > > +               break;
> > > > > +       case V4L2_ASYNC_MATCH_FWNODE: {
> > > > > +               struct fwnode_handle *fwnode = asd->match.fwnode;
> > > > > +
> > > > > +               if (fwnode_graph_is_endpoint(fwnode))
> > > > > +                       fwnode = fwnode_graph_get_port_parent(fwnode);
> > > 
> > > Can we also print endpoint information ?
> > 
> > What endpoint information do you have in mind? I'm asking this
> > because I printed endpoint OF node full names, only to find
> > so many of them named "endpoint" :)
> 
> The port name and endpoint name would be useful. The full fwnode name
> would be an acceptable way to print that I think.
> 

Makes sense, and since we'd be parsing the fwnode subtype,
we'll be able to do something like:

[of] dev=%s, node=%s
[swnode] ...
[acpi] ...

> > > > > +
> > > > > +               seq_printf(s, "[fwnode] %s\n",
> > > > > +                          fwnode->dev ? dev_name(fwnode->dev) : "nil");
> > > 
> > > Having no device created for a fwnode is an issue that could explain
> > > probe problems, so we should print the node name as well, not just the
> > > device.
> > 
> > Sure.
> > 
> > AFAICS, there's not fwnode generic name, so we need to move one level
> > down. For OF and software-node devices we have some name field.
> > 
> > However ACPI device nodes don't seem to have one. Any idea
> > what name we should print there? I'm also unsure if ACPI nodes
> > will typically be ACPI device or ACPI data nodes.
> 
> I'll let Sakari, our ACPI expert, shime in on that :-)
> 
> > > > > +               break;
> > > > > +       }
> > > 
> > > For all of those cases, the state of the asd (matched or not matched)
> > > would be useful too, to figure out which ones are missing.
> > 
> > The matched state is not kept in struct v4l2_async_subdev, or is it?
> > 
> > AFAICS, when the asd matches, it's removed from the waiting list.
> > You suggest to iterate over the done list and print that as well?
> 
> Good point and good question. I suppose there's less practical value in
> doing that. Maybe we could print a header at the top to mention that the
> list contains unmatched asds ?
> 

I was under the impression that the name of the file implied
it was only unmatched/waiting subdevices.

We can rename this as "unmatched_devices" or "pending_devices"
if that makes things clearer.

Thanks,
Ezequiel

