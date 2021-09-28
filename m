Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F249341AA39
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 09:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239062AbhI1IAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 04:00:17 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:54285 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbhI1IAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 04:00:17 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5C1A310000B;
        Tue, 28 Sep 2021 07:58:34 +0000 (UTC)
Date:   Tue, 28 Sep 2021 09:59:21 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v8 00/36] v4l: subdev internal routing and streams
Message-ID: <20210928075921.63jmcjazlxlightn@uno.localdomain>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <9b47fd13-ef1f-450f-869d-4220702479e5@ideasonboard.com>
 <YVEdZaVRMmUiQucx@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YVEdZaVRMmUiQucx@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi, Laurent

On Mon, Sep 27, 2021 at 04:24:53AM +0300, Laurent Pinchart wrote:
> Hi Tomi,
>
> On Mon, Sep 20, 2021 at 01:19:54PM +0300, Tomi Valkeinen wrote:
> > On 30/08/2021 14:00, Tomi Valkeinen wrote:
> > > Hi,
> > >
> > > This is v8 of the multiplexed streams series. v7 can be found from:
> > >
> > > https://lore.kernel.org/linux-media/20210524104408.599645-1-tomi.valkeinen@ideasonboard.com/
> > >
> > > The main change in this version is the implementation and use of
> > > centralized active state for subdevs.
> > >
> > > I have pushed my work branch to:
> > >
> > > git://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git multistream/work-v8
> > >
> > > which contains the patches in this series, along with subdev drivers
> > > using multiplexed streams.
> > >
> > > Both this series and the branch above are based on top of today's
> > > git://linuxtv.org/media_tree.git master.
> > >
> > > The documentation still needs improving, but I hope the docs in this
> > > series, and the drivers in the work branch, are enough to give the
> > > reviewers enough information to do a review.
> > >
> > > As can be guessed from the work branch, I have been testing this series
> > > with TI's FPDLink setup. I have also done a "backwards compatibility"
> > > test by dropping all multiplexed streams patches from the CAL driver
> > > (the CSI-2 RX on the TI SoC), and using the FPDLink drivers with
> > > single-stream configuration.
> >
> > We've had good discussions with Jacopo about this series.
>

Thanks Tomi for summing it up here

> I hope my recent contribution was also useful to some extent :-) Up to
> patch 04/36, I like the direction this is taking and I'm quite confident
> that we'll reach an agreement. We need to get feedback from Sakari too
> though.
>
> > I chose the approaches in this series based on what I think the API
> > should be, even if the API has behaved differently before. And I think
> > I'm also leaning forward a bit, in the sense that the full benefit of
> > the API can only be had after more changes to the core and subdev
> > drivers (changes which may or may not happen).
> >
> > If I understood Jacopo correctly, his comments were essentially that my
> > approach is different than the current one, and as the current drivers
> > anyway do things the old way, this is very confusing. Basically I create
> > two different kinds of subdev drivers: the old and new ones, which
> > manage state differently.
> >

Most of my comments (I guess all except the addition of which to state
and a few other things) are about the quantity of helpers that have
been introduced.

Let me explain this:
I understand the benefits of relying on helpers to reduce the amount
of work the drivers have to do and enforce correctness, so I won't
argue about the fact they're helpful, but whenever I see something
like

        v4l2_subdev_validate_state(state)
        {
                return state ? state : sd->state;
        }

instead of having a driver doing

        void v4l2_subdev_op(sd, try_state, ...)
        {

                subdev_state *state;
                if (which == TRY)
                        state = try_state;
                else
                        state = sd->state;

        }

My immediate concern is the levels of obfuscation we introduce which
makes approaching the code a lot more difficult, at least for
me, and everytime I happen to jump into an helper which does something
trivial I'm left with the question "why an helper ? why a function
name I have to remember or jump into from my editor when it's so
simple to open code ?"

So yes, I guess you can call them tastes, I understand the benfit
and there seems to be a large consensus, so I'll just have to get to
like these extra levels of indirection.

(Talking with Tomi I said him "seems like reading DRM/KMS code, full
of helpers which do a single thing I could have open coded". I guess
it's a compliment).

> > I want to summarize two particular topics:
> >
> > 1) Active state & subdev ops
> >
> > In upstream we have v4l2_subdev_state which contains only the pad_config
> > array. This state is "try" state, it's allocated per file-handle, and
> > passed to the subdev drivers when executing subdev ioctls in try-mode
> > (which == V4L2_SUBDEV_FORMAT_TRY). This try-state is sometimes also
> > passed to the subdev drivers when executing in active-mode
> > (V4L2_SUBDEV_FORMAT_ACTIVE), but the drivers are supposed to ignore it.
> >
> > There is also an active-state, but it's driver-specific and
> > driver-internal. The drivers check the 'which' value, and either use the
> > passed try-state, or the internal state.
>
> To be very clear here, let's note that the driver-internal state is
> stored in a driver-specific format, which does not reuse the state
> structure used for the TRY state.
>

That's the current situation. I guess in the long term we should aim
to have as much as possible of the subdev state moved to the
'state' in the subdev.

> > What I did in this series aims to have both try- and active-states in
> > v4l2 core, and passing the correct state to subdevs so that they don't
> > (necessarily) need any internal state. There are some issues with it,
> > which have been discussed, but I believe those issues can be fixed.
> >
> > The subdev drivers need to be written to use this new active-state, so
> > it doesn't affect the current drivers.
> >
> > The question is, do we want to go that way?
>
> __     __  _______   ________
> \ \   / / |  _____| |  ______|
>  \ \ / /  | |       | |
>   \ v /   | |_____  | |______
>    | |    |  _____| |______  |
>    | |    | |              | |
>    | |    | |_____   ______| |
>    |_|    |_______| |________|
>
> (please let me know if you require additional clarification)
>
> > We could as well keep the
> > current behavior of subdev drivers only getting the try-state as a
> > parameter, and the drivers digging out the active state manually. This
> > active state could either be internal to the driver, or it could be in
> > the base struct v4l2_subdev (see also topic 2).
> >
> > 2) Shared subdev active-state
> >
> > The try-state is specific to a file-handle, and afaics have no real
> > race-issues as it's not really shared. Although I guess in theory an
> > application could call subdev ioctls from multiple threads using the
> > same fd.
>
> That's right. We could possibly serialize ioctl calls in v4l2-subdev.c.
>
> > In upstream the subdev drivers' internal state is managed fully by the
> > subdev drivers. The drivers are expected to handle necessary locking in
> > their subdev ops and interrupt handlers. If, say, v4l2 core needs to get
> > a format from the subdev, it calls a subdev op to get it.
>
> "supposed to" is the correct term here. Most of them don't (including
> drivers I have written myself), which I believe shows quite clearly that
> the API is wrong and that this shouldn't be left to drivers to handle.
>
> > In my series I aimed to a shared active-state. The state is located in a
> > known place, struct v4l2_subdev, and can be accessed without the subdev
> > driver's help. This requires locking, which I have implemented.
> >
> > At the moment the only real benefit with this is reading the routing
> > table while doing pipeline validation: Instead of having to dynamically
> > allocate memory and call the subdev op to create a copy of the routing
> > table (for each subdev, possibly multiple times), the validator can just
> > lock the state, and use it. And, in fact, there is no get_routing subdev
> > op at all.
> >

That's very nice, and I understand an helper here is useful, as
locking could be very well overlooked if subdev drivers are encouraged
to access their active state by just sd->state.

> > But this means that the subdev drivers that support this new
> > active-state have to handle locking for the active state, and the
> > "mindset" is different than previously.
>
> That's the right mindset I believe, and forcing drivers to use helper
> functions that ensure proper locking is the right way to go in my
> opinion.
>

Point taken. I'll learn how to love more those additional helpers.

Thanks
   j


> > So the question is, do we want to go that way? We could as well mandate
> > that the active-state can only be accessed via subdev's ops (and add the
> > get-routing, of course), and the subdev manages the locking internally.
>
> Been there, failed, let's not repeat the same mistake.
>
> --
> Regards,
>
> Laurent Pinchart
