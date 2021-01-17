Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B272F945A
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 18:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729745AbhAQR6x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 12:58:53 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59298 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729480AbhAQR6u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 12:58:50 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A5C761F44A3B
Message-ID: <9ea1ea63a0edfd9e77efecfb7037e085a3fa8095.camel@collabora.com>
Subject: Re: [PATCH 06/13] media: atmel: Use
 v4l2_async_notifier_add_fwnode_remote_subdev helpers
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Sun, 17 Jan 2021 14:57:57 -0300
In-Reply-To: <20210116172140.pgcqutr7athfydvb@uno.localdomain>
References: <20210112132339.5621-1-ezequiel@collabora.com>
         <20210112132339.5621-7-ezequiel@collabora.com>
         <20210116172140.pgcqutr7athfydvb@uno.localdomain>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 2021-01-16 at 18:21 +0100, Jacopo Mondi wrote:
> Hi Ezequiel,
> 
> On Tue, Jan 12, 2021 at 10:23:32AM -0300, Ezequiel Garcia wrote:
> > The use of v4l2_async_notifier_add_subdev is discouraged.
> > Drivers are instead encouraged to use a helper such as
> > v4l2_async_notifier_add_fwnode_remote_subdev.
> > 
> > This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
> > should get a kmalloc'ed struct v4l2_async_subdev,
> > removing some boilerplate code while at it.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/platform/atmel/atmel-isc.h      |  1 +
> >  drivers/media/platform/atmel/atmel-isi.c      | 46 ++++++-------------
> >  .../media/platform/atmel/atmel-sama5d2-isc.c  | 44 ++++++------------
> >  3 files changed, 29 insertions(+), 62 deletions(-)
> > 
> >         }
> > 
> 
> [snip]
> 
> >         list_for_each_entry(subdev_entity, &isc->subdev_entities, list) {
> > +               struct v4l2_async_subdev *asd;
> > +
> >                 v4l2_async_notifier_init(&subdev_entity->notifier);
> > 
> > -               ret = v4l2_async_notifier_add_subdev(&subdev_entity->notifier,
> > -                                                    subdev_entity->asd);
> > -               if (ret) {
> > -                       fwnode_handle_put(subdev_entity->asd->match.fwnode);
> > -                       kfree(subdev_entity->asd);
> > +               asd = v4l2_async_notifier_add_fwnode_remote_subdev(
> > +                                       &subdev_entity->notifier,
> > +                                       of_fwnode_handle(subdev_entity->epn),
> > +                                       sizeof(*asd));
> > +
> > +               of_node_put(subdev_entity->epn);
> > +               subdev_entity->epn = NULL;
> > +
> > +               if (IS_ERR(asd)) {
> > +                       ret = PTR_ERR(asd);
> >                         goto cleanup_subdev;
> 
> The isc_subdev_cleanup() this label jumps to does not put the other
> subdev_entity->epn
> 
> The issue was there already if I'm not mistaken. If I'm not, I think
> it's worth recording it with a FIXME: comment while you're here
> 

Although, as you've noticed I tend to break this rule myself,
I'd rather avoid adding more changes to the patch.

The OF/fwnode handling in this atmel driver might benefit
from some improvements (and the same can be said of some
other drivers) but I'd say let's stick to just improving
the v4l2-async API.

> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 

Thanks a lot for the reviews!
Ezequiel

