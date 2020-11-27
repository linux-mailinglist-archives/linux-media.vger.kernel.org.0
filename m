Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFAB2C63C3
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 12:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgK0LTG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 06:19:06 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:37495 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgK0LTG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 06:19:06 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CD55D1BF21B;
        Fri, 27 Nov 2020 11:19:02 +0000 (UTC)
Date:   Fri, 27 Nov 2020 12:19:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/5] v4l2-fwnode: Remove
 v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper
Message-ID: <20201127111908.rmwxgech2b4jr6w7@uno.localdomain>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
 <20201126101251.jcsvi6g5xsbnc52w@uno.localdomain>
 <20201126102205.GN3940@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126102205.GN3940@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Thu, Nov 26, 2020 at 12:22:05PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Nov 26, 2020 at 11:12:51AM +0100, Jacopo Mondi wrote:
> > Hi Niklas, Sakari,
> >
> > On Wed, Nov 25, 2020 at 05:44:45PM +0100, Niklas Söderlund wrote:
> > > Hello,
> > >
> > > This series aims to remove a V4L2 helper that provides a too simple
> > > implementation, v4l2_async_notifier_parse_fwnode_endpoints_by_port().
> > > Instead drivers shall implement what the helper does directly to get
> > > greater control of the process. There is only one user left in tree of
> > > this interface, R-Car VIN.
> >
> > What is the plan going forward ?
> > removing v4l2_async_notifier_parse_fwnode_endpoints_by_port() here
> > then remove v4l2_async_notifier_parse_fwnode_endpoints() as it has a
> > single user in mainline too ?
> >
> > Are we standardizing all platform drivers to use
> > v4l2_async_notifier_add_fwnode_subdev() and perform fwnode.match
> > initialization by themselves or is there a plan to replace
>
> Yes, please.
>
> > v4l2_async_notifier_parse_fwnode_endpoints*() with something else ?
>
> That's always been somewhat clunky and required special cases. The other
> option, i.e. what this patchset does, is straightforward as well as allows
> setting defaults in drivers, and admittedly, comes with a little bit of
> extra code in drivers in areas that are driver specific. The old functions
> such as v4l2_async_notifier_parse_fwnode_endpoints() just pretended they
> were not...

Agreed in full :)
(At the expense of a little extra code in drivers)

>
> --
> Regards,
>
> Sakari Ailus
