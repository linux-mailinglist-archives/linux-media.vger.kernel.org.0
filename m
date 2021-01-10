Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAB12F07C8
	for <lists+linux-media@lfdr.de>; Sun, 10 Jan 2021 16:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbhAJPIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Jan 2021 10:08:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:37898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbhAJPIJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Jan 2021 10:08:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D64722AAC;
        Sun, 10 Jan 2021 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610291248;
        bh=YpXCb/78xod6ifexMeMvd7SKbfuF1hbywxqJERn3hTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w8E3PcY6ehgLUjNngENYtk8id0ZHh+91aemaJ/qpU6s780l0u5zBaaVu49REldo7o
         p/8k43SXbKbp1RPJaX+jALRUAfr4KqIrQAZwx1M1G3X7ZjXJw2oHPxYpwD0LySgOdr
         q2geBU0VdJOBetVJObeyovJ2cMzve4FrlSeIH18M=
Date:   Sun, 10 Jan 2021 16:08:42 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Scally <djrscally@gmail.com>, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rjw@rjwysocki.net, lenb@kernel.org,
        mchehab@kernel.org, sergey.senozhatsky@gmail.com,
        yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, andriy.shevchenko@linux.intel.com,
        linux@rasmusvillemoes.dk,
        laurent.pinchart+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        hverkuil-cisco@xs4all.nl, m.felsch@pengutronix.de,
        niklas.soderlund+renesas@ragnatech.se,
        prabhakar.mahadev-lad.rj@bp.renesas.com, slongerbeam@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH v5 00/15] Add functionality to ipu3-cio2 driver allowing
 software_node connections to sensors on platforms designed for Windows
Message-ID: <X/sYeuTbDOPk65OX@kroah.com>
References: <20210107132838.396641-1-djrscally@gmail.com>
 <X/kQBAQZi3l5/WI7@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/kQBAQZi3l5/WI7@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 09, 2021 at 04:08:04AM +0200, Laurent Pinchart wrote:
> Hi Greg,
> 
> On Thu, Jan 07, 2021 at 01:28:23PM +0000, Daniel Scally wrote:
> > 
> > Hello all
> > 
> > v4:
> > https://lore.kernel.org/linux-media/20210103231235.792999-1-djrscally@gmail.com/T/#m11b7cb977e1b73fba1e625c3d6a189e2943a7783
> > v3:
> > https://lore.kernel.org/linux-media/20201224010907.263125-1-djrscally@gmail.com/T/#m37b831bb2b406917d6db5da9acf9ed35df65d72d
> > v2:
> > https://lore.kernel.org/linux-media/20201217234337.1983732-1-djrscally@gmail.com/T/#md93fd090009b42a6a98aed892aff0d38cf07e0cd
> > v1:
> > https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67
> > 
> > This series is to start adding support for webcams on laptops with ACPI tables
> > designed for use with CIO2 on Windows. This series extends the ipu3-cio2
> > driver to allow for patching the firmware via software_nodes if endpoints
> > aren't defined by ACPI.
> > 
> > I'm hopeful that most or all of this series could get picked up for 5.12.
> > We touch a few different areas (listed below), but I think the easiest
> > approach would be to merge everything through media tree. Rafael, Greg,
> > Mauro and Sergey; are you ok with that plan, or would you prefer a
> > different approach? Mauro; if that plan is ok (and of course assuming that
> > the rest of the patches are acked by their respective maintainers) could
> > we get a dedicated feature branch just in case the following series ends
> > up being ready in time too?
> > 
> > lib
> >   lib/test_printf.c: Use helper function to unwind array of
> >     software_nodes
> > 
> > base
> >   software_node: Fix refcounts in software_node_get_next_child()
> >   property: Return true in fwnode_device_is_available for NULL ops
> >   property: Call fwnode_graph_get_endpoint_by_id() for fwnode->secondary
> >   software_node: Enforce parent before child ordering of nodes arrays
> >   software_node: unregister software_nodes in reverse order
> 
> Could you please let us know with an Acked-by if these patches can be
> merged through the linux-media tree for v5.12 ? This is a cross-tree
> series and we would like to avoid topic branches if possible.

Yes, they are all fine with me, will go provide my ack, sorry for the
delay.

greg k-h
