Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C74E42F703
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 17:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235330AbhJOP3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 11:29:31 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:44437 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbhJOP3a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 11:29:30 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DC3B440016;
        Fri, 15 Oct 2021 15:27:20 +0000 (UTC)
Date:   Fri, 15 Oct 2021 17:28:09 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v9 27/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <20211015152809.dew2qyt2cnyb4dtp@uno.localdomain>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
 <20211015121320.c7ctjcvyvwx4mhy4@uno.localdomain>
 <465623f3-c022-7ed3-29c3-d82a0cf8c952@ideasonboard.com>
 <20211015140527.sjgtljfymhqzzflr@uno.localdomain>
 <1bf26b9c-f468-2981-aa3e-df5bdc784849@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1bf26b9c-f468-2981-aa3e-df5bdc784849@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Fri, Oct 15, 2021 at 06:17:45PM +0300, Tomi Valkeinen wrote:
> Hi,
>
> On 15/10/2021 17:05, Jacopo Mondi wrote:
>
> > Ok, I understand this allow you to
> >
> >          int _set_routing(sd, state, krouting)
> >          {
> >                  v4l2_subdev_set_routing(krouting);
> >
> >          }
> >
> >          int set_routing(sd, state, which, krouting)
> >          {
> >                  _set_routing(sd, state, krouting);
> >                  if (which == ACTIVE)
> >                          apply_to_hw();
> >          }
> >
> >          pad_ops ops = {
> >                  .set_routing = set_routing,
> >          };
> >
> >          int init_cfg(sd, state)
> >          {
> >                  routes = {
> >                          ...
> >                  };
> >
> >                  krouting routing {
> >                          .routes = routes,
> >                          .num_routes = 1,
> >                  };
> >
> >                  _set_routing(sd, state, &routing);
> >          }
>
> Yes, although I would guess that the likely use of which in set_routing is
>
> if (which == ACTIVE && priv->streaming)
> 	return -EBUSY;

Not really. In my use case in example, I need to know if a route is
active as according to the routing table I have to update the value of
a control (the total pixel rate of the demultiplexer) and I need to
update the mask of active (routed) GMSL link upon which several other
operations and HW configurations to be applied at s_stream() time
depend on.

>
> > We're moving the issue with init_cfg() not being aware of the
> > active/try to the set_routing() operation signature (and in cascade to
> > all operation that operate on krouting from where 'which' had been
> > removed to comply with init_cfg).
>
> Hmm, what operations? set_routing() subdev op is the only place that needs
> the which, afaics. The issue with the previous series was that we needed
> 'which' in places where we shouldn't. In the v9, that issue is gone.
>
> Or do you see issues with your series caused by this change?
>
> > I was actually advocating instead for adding back which to
> > krouting and have all the other v4l2_subdev functions that operates on
> > routing and do not care about 'which' to use the raw routes and their
> > number
> >
> >
> >          --- v4l2-subdev.h/c ---
> >
> >          struct krouting {
> >                  which;
> >                  num_routes;
> >                  routes;
> >          };
> >
> >          int v4l2_subdev_set_routing(sd, state, routes, num_routes)
> >          {
> >
> >                  /* Copy routes into state */
> >
> >          }
> >
> >          ---- subdevice driver ----
> >
> >          int _set_routing(sd, state, routes, num_routes)
> >          {
> >                  return v4l2_subdev_set_routing(sd, state, routes,
> >                                                 num_routes);
> >
> >          }
> >
> >          int set_routing(sd, state, krouting)
> >          {
> >                  _set_routing(sd, state, krouting->routes, krouting->num_routes)
> >
> >                  if (krouting->which == ACTIVE)
> >                          apply_to_hw();
> >          }
> >
> >          pad_ops ops = {
> >                  .set_routing = set_routing,
> >          };
> >
> >          int init_cfg(sd, state)
> >          {
> >                  routes routing[] = {
> >                          ...
> >                  };
> >
> >                  _set_routing(sd, state, routing, ARRAY_SIZE(routing));
> >          }
> >
> > So that
> > - krouting contains 'which' but is only used in the set_routing
> >    operation
> > - init_cfg doesn't have to initialize a krouting just for the purpose
> >    of pleasing the v4l2_subdev function signatures
>
> Why do you want the routes and num_routes handled separately? Isn't it nicer
> if they're grouped together in a struct?
>
> > It requires to remove krouting from all the v4l2_subdev_*route*()
> > functions in v4l2_subdev.c and have them work on the raw routes
> > ('routes' and 'num_routes' could as well be grouped in one structure
> > like you had in v8).
>
> If they're grouped, then... Wouldn't we just be back in the case I described
> in the mail you linked, having a struct for the sole purpose of passing
> parameters to set_routing?
>
> > As you asked for opinions and I failed to provide one in v8 it
> > wouldn't be fair to ask you to backtrack just to see how it looks
> > like, so here you have a patch to be applied on top of your branch for
> > you to take into consideration (test on my gmsl work on top of your
> > v9).
>
> So it's not quite clear to me what's the issue you see here.
>
> Is it just that you don't like passing 'which' separately to set_routing(),
> but other ops get it in a struct? If that's a problem, we can create the
> extra struct used solely for calling set_routing.
>
> Or do you think it's better to have routes and num_routes used separately,
> as you do in your patch? If so, why, what's the benefit?
>

I started from the set_routing() signature being an out-liner and I
wanted to see what did it take to change it on top of v9.

I concur grouping routes and num_routes like you did in v8 is better
than having them separate, but my purpose was removing the
'which' parameter from set_routing() and that's why the quickly
sketched patch I sent: to have a comparison of how it looks like
(similar to your v8, I know but I failed to express myself at that
time) and get opinions.

Do you still think it's better to have all v4l2_subdev*route*() functions
to operate on krouting and have 'which' as an additional paramter ?

>  Tomi
