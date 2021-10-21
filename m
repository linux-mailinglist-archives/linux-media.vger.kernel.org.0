Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC931436A21
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 20:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232363AbhJUSK4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 14:10:56 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:33807 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232326AbhJUSK4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 14:10:56 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 03E9620000A;
        Thu, 21 Oct 2021 18:08:37 +0000 (UTC)
Date:   Thu, 21 Oct 2021 20:09:26 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <20211021180926.oybomz6hknq7phrf@uno.localdomain>
References: <20211013092005.14268-1-jacopo@jmondi.org>
 <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
 <20211021155512.153ecd48@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211021155512.153ecd48@sal.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Thu, Oct 21, 2021 at 03:55:12PM +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 21 Oct 2021 16:00:40 +0200
> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
>
> > On 13/10/2021 11:20, Jacopo Mondi wrote:
> > > There are a few additional coding style conventions in place in
> > > the media subsystem. If they do not get documented, it's hard to enforce
> > > them during review as well as it is hard for developers to follow them
> > > without having previously contributed to the subsystem.
> > >
> > > Add them to the subsystem profile documentation.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >
> > > All points are up for discussion ofc.
> > >
> > > But the idea is to get to have more requirement defined, as otherwise
> > > it's very hard to enforce them during review.
> > >
> > > Thanks
> > >    j
> > >
> > > ---
> > >  .../media/maintainer-entry-profile.rst        | 24 +++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > index eb1cdfd280ba..9c376f843e1c 100644
> > > --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> > > @@ -180,6 +180,30 @@ In particular, we accept lines with more than 80 columns:
> > >      - when they avoid a line to end with an open parenthesis or an open
> > >        bracket.
> > >
> > > +There are a few additional requirements which are not enforced by tooling
> > > +but mostly during the review process:
> > > +
> > > +    - C++ style comments are not allowed, if not for SPDX headers;
> >
> > if not -> except
>
> While I prefer C99, I'm not really against having C++ comments on single

Afaict C99 allowed // commenting style. We have to go back to C90 for
only /* */ :)

> line comments.
>

I wouldn't be against either, but I fear that without a slightly more
stringent rule we'll continue to have a lot of push-pull about what is
allowed or not.

I wouldn't be against something like "C++ comments are accepted for
single line comments" but as soon as someone uses them for multiple
lines we'll be back to discuss why 1 lines is fine 2 are not.
Execeptions also requires developers and reviewers to get back to the
subsystem rules for all tiny details. I feel one single rule, when possible,
would be simpler.

> >
> > > +    - hexadecimal values should be spelled using lowercase letters;
>
> > > +    - one structure/enum member declaration per line;
> > > +    - one variable declaration per line;
> >
> > Hmm, I don't mind something like: int i, j;
>
> I don't mind having things like:
>
> 	struct *dev, *parent_dev;
>
> or even:
>
> 	struct *parent_dev, *dev = pdev->dev;
>
> What it is really ugly is having multiple initialized vars at the
> same declaration, like:
>
> 	struct *parent_dev = pdev->dev.parent, *dev = pdev->dev;
>
> or, even worse:
>
> 	struct *dev = pdev->dev, *parent_dev = dev.parent;
>
>
> > But for anything more complex I too prefer one declaration per line.
> >
> > > +    - prefer variable declaration order in reverse-x-mas-tree over
> > > +      initialization at variable declare time;
> >
> > Add something like:
> >
> > ...unless there are dependencies or other readability reasons to
> > depart from this.
>
> +1
>
> >
> > > +
> > > +      As an example, the following style is preferred::
> > > +
> > > +         struct priv_struct *priv = container_of(....)
> > > +         struct foo_struct *foo = priv->foo;
> > > +         int b;
> > > +
> > > +         b = a_very_long_operation_name(foo, s->bar)
> > > +
> > > +      over the following one::
> > > +
> > > +         struct priv_struct *priv = container_of(....)
> > > +         struct foo_struct *foo = priv->foo;
> > > +         int b = a_very_long_operation_name(foo, s->bar)
> >
> > I'm not sure if this is what you typically see.
> >
> > Perhaps this is a better example:
> >
> > 	int i;
> > 	struct foo_struct *foo = priv->foo;
> > 	int result;
> >
> > should be written as:
> >
> > 	struct foo_struct *foo = priv->foo;
> > 	int result;
> > 	int i;
> >
> > Regards,
> >
> > 	Hans
> >
> > > +
> > >  Key Cycle Dates
> > >  ---------------
> > >
> > > --
> > > 2.33.0
> > >
> >
