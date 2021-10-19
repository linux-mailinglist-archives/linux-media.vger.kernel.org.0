Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D117F433304
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 12:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbhJSKCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 06:02:52 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:60525 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234808AbhJSKCv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 06:02:51 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6A129240017;
        Tue, 19 Oct 2021 10:00:34 +0000 (UTC)
Date:   Tue, 19 Oct 2021 12:01:24 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <20211019100124.nthv3zmsg4kxjxjb@uno.localdomain>
References: <20211013092005.14268-1-jacopo@jmondi.org>
 <YW6O2Yl3YVyrTwO2@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YW6O2Yl3YVyrTwO2@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Tue, Oct 19, 2021 at 12:24:41PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thanks for the patch.
>
> On Wed, Oct 13, 2021 at 11:20:05AM +0200, Jacopo Mondi wrote:
> > There are a few additional coding style conventions in place in
> > the media subsystem. If they do not get documented, it's hard to enforce
> > them during review as well as it is hard for developers to follow them
> > without having previously contributed to the subsystem.
> >
> > Add them to the subsystem profile documentation.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >
> > All points are up for discussion ofc.
> >
> > But the idea is to get to have more requirement defined, as otherwise
> > it's very hard to enforce them during review.
>
> Thanks for the patch.
>
> Aren't these all common and/or preferred practices outside the media tree
> as well? I suppose not each one of these is universally enforced though.

Apparently not :)

Particularly, after the lifting of the 80-cols stringent limit, each
subsystem has its own preferences on that regard (I'm not active in
that many subsystem, but I've been recently asked not to break lines
that goes up to 100 cols in a different subsystem, if I knew that from
the beginning, I could have saved a v2 just to un-break lines).

I find this very confusing, as each subsystem you interact with
you're asked to comply with undocumented preferences. Hence, better
document them here so that developers knows what comments they might
expect to receive, and reviewers have ground to justify their
requests.

>
> The coding style guide is lacking documentation on such things though.
>
> >
> > Thanks
> >    j
> >
> > ---
> >  .../media/maintainer-entry-profile.rst        | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > index eb1cdfd280ba..9c376f843e1c 100644
> > --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> > +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > @@ -180,6 +180,30 @@ In particular, we accept lines with more than 80 columns:
> >      - when they avoid a line to end with an open parenthesis or an open
> >        bracket.
> >
> > +There are a few additional requirements which are not enforced by tooling
> > +but mostly during the review process:
> > +
> > +    - C++ style comments are not allowed, if not for SPDX headers;
> > +    - hexadecimal values should be spelled using lowercase letters;
> > +    - one structure/enum member declaration per line;
> > +    - one variable declaration per line;
> > +    - prefer variable declaration order in reverse-x-mas-tree over
> > +      initialization at variable declare time;
> > +
> > +      As an example, the following style is preferred::
> > +
> > +         struct priv_struct *priv = container_of(....)
> > +         struct foo_struct *foo = priv->foo;
> > +         int b;
> > +
> > +         b = a_very_long_operation_name(foo, s->bar)
> > +
> > +      over the following one::
> > +
> > +         struct priv_struct *priv = container_of(....)
> > +         struct foo_struct *foo = priv->foo;
> > +         int b = a_very_long_operation_name(foo, s->bar)
>
> I wouldn't say this is required or even preferred if you have a dependency
> between the variables.
>
> Rather I'd say the latter is undesirable if a_very_long_operation_name()
> can fail. But that's a bit out of scope now.
>

I'm fine to drop it, all the points are there mainly to sparkle
discussions. But I think we should record something or decide that
everything not prohibited is allowed (maybe that's the case already
and I failed to understand it ?)

I've been confronted with a "on what ground are you asking this ?"
question recently when reviewing a driver commented only in C++ style.
I got nothing to offer except the 'no other driver does that' which
has proven not to be enough to convince the developer. Having a set of
rules you can refer to would have helped (and would have saved me
quite a few email exchanges that ended up in nothing).

Please note this serves for the other way around too. If it get
decided that everything that is not prohibited is allowed, I would
have not made those comments in first place. So please do not interpret
this as only directed to developers but also for less experienced
reviewers to know what changes in style they can ask for.

Thanks
   j

> > +
> >  Key Cycle Dates
> >  ---------------
>
> --
> Kind regards,
>
> Sakari Ailus
