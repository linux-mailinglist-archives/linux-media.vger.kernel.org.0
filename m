Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E50B42FA8C
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 19:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242254AbhJORwj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 13:52:39 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:34207 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237670AbhJORwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 13:52:39 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id EB92A40006;
        Fri, 15 Oct 2021 17:50:29 +0000 (UTC)
Date:   Fri, 15 Oct 2021 19:51:18 +0200
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
Message-ID: <20211015175118.4mvgpqz6zhmqmx75@uno.localdomain>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-28-tomi.valkeinen@ideasonboard.com>
 <20211015121320.c7ctjcvyvwx4mhy4@uno.localdomain>
 <465623f3-c022-7ed3-29c3-d82a0cf8c952@ideasonboard.com>
 <20211015140527.sjgtljfymhqzzflr@uno.localdomain>
 <1bf26b9c-f468-2981-aa3e-df5bdc784849@ideasonboard.com>
 <20211015152809.dew2qyt2cnyb4dtp@uno.localdomain>
 <3c5793a4-514e-e389-043c-7966e508033a@ideasonboard.com>
 <20211015164705.tn4gymf64pzbmkc6@uno.localdomain>
 <3deff08f-eb71-0a6d-46ac-390ca3090172@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3deff08f-eb71-0a6d-46ac-390ca3090172@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Fri, Oct 15, 2021 at 07:55:39PM +0300, Tomi Valkeinen wrote:
> On 15/10/2021 19:47, Jacopo Mondi wrote:
> > Hi Tomi,
> >
> > On Fri, Oct 15, 2021 at 07:10:02PM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > >
> > > On 15/10/2021 18:28, Jacopo Mondi wrote:
> > > > Hi Tomi,
> > > >
> > > > On Fri, Oct 15, 2021 at 06:17:45PM +0300, Tomi Valkeinen wrote:
> > > > > Hi,
> > > > >
> > > > > On 15/10/2021 17:05, Jacopo Mondi wrote:
> > > > >
> > > > > > Ok, I understand this allow you to
> > > > > >
> > > > > >            int _set_routing(sd, state, krouting)
> > > > > >            {
> > > > > >                    v4l2_subdev_set_routing(krouting);
> > > > > >
> > > > > >            }
> > > > > >
> > > > > >            int set_routing(sd, state, which, krouting)
> > > > > >            {
> > > > > >                    _set_routing(sd, state, krouting);
> > > > > >                    if (which == ACTIVE)
> > > > > >                            apply_to_hw();
> > > > > >            }
> > > > > >
> > > > > >            pad_ops ops = {
> > > > > >                    .set_routing = set_routing,
> > > > > >            };
> > > > > >
> > > > > >            int init_cfg(sd, state)
> > > > > >            {
> > > > > >                    routes = {
> > > > > >                            ...
> > > > > >                    };
> > > > > >
> > > > > >                    krouting routing {
> > > > > >                            .routes = routes,
> > > > > >                            .num_routes = 1,
> > > > > >                    };
> > > > > >
> > > > > >                    _set_routing(sd, state, &routing);
> > > > > >            }
> > > > >
> > > > > Yes, although I would guess that the likely use of which in set_routing is
> > > > >
> > > > > if (which == ACTIVE && priv->streaming)
> > > > > 	return -EBUSY;
> > > >
> > > > Not really. In my use case in example, I need to know if a route is
> > > > active as according to the routing table I have to update the value of
> > > > a control (the total pixel rate of the demultiplexer) and I need to
> > > > update the mask of active (routed) GMSL link upon which several other
> > > > operations and HW configurations to be applied at s_stream() time
> > > > depend on.
> > >
> > > Are you allowing changing routing while streaming is enabled? You have to be
> >
> > No :) What I meant is that I need to know if a route is active or not
> > for other reasons, not just for disallow route changes while
> > streaming.
>
> I'm interested to hear why =). I think set_routing should mostly just check
> if the routing is valid, and that check is the same for active and try
> cases.
>
> In your example above you call apply_to_hw(). I think that should not be
> done. The commit to HW should be done in s_stream().

I agree, and I have moved most register writes at that time.

However I need to update the mask of active sources in order to be
able to compute the the pixel rate control as the total pixel rate is the
sum of the active routes.


>
>  Tomi
