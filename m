Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C62243664D
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 17:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbhJUPdx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 11:33:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59146 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJUPdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 11:33:52 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8CBA48B6;
        Thu, 21 Oct 2021 17:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634830295;
        bh=++0XkgPkbajK6tavIUf4sA6kv4LRW955sVeWaTIn+7Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GViU0cFoIbzAxJjPUX0MghXtc+wcbYxKRbxbOXVa+uEKVmocW8AMiCRlQq2igyiox
         kJyOlPHed6DyI5J5wuzfhDA0NYCrgRmsN5r493VDB0iRvnl1vZvmb8d9o9i7I7rMPn
         jkGVM+iVpwkMUi9Whfh9Se1kmqCJTX+l4T6v10nw=
Date:   Thu, 21 Oct 2021 18:31:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <YXGHw6FPfPddXMj2@pendragon.ideasonboard.com>
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
> Em Thu, 21 Oct 2021 16:00:40 +0200 Hans Verkuil escreveu:
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
> line comments. 
> 
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

Cording style is one of the main candidate areas for bikeshedding. The
first question that we should answer, I believe, is whether or not we
want to define a more precise coding style for the subsystem to achieve
higher uniformity, and how much latitude we want to give to developers.
For instance, I don't mind

	unsigned int i, j;

too much, but I would scream in horror at

	char *name = dev_name, c = '\0';

(I'm sad C even allows declaring a char pointer and a char variable on
the same line like this). There are lots of cases between those two
extremes that are more or less good (or bad) depending on who you ask,
so we won't be able to come up with a precise set of rules that draw a
line somewhere in the middle. What we could do is err more on the side
of strictness, for instance with

- One variable declaration per line. As an exception, grouping multiple
  single-letter counter variables on a single line is allowed.

(or even allowing no exception). This is probably stricter than it needs
to be, and in some cases it will result in a few more lines of code, but
if it brings increased readability and maintainability through
uniformity it's something we could consider.

The same reasoning can apply to C++ comments, we can decide to allow
them or not, but the more flexibility there will be in the rules, the
less uniformity we'll have, which I personally believe hinders
readability.

Please don't reply to details of this specific example here, what I'd
like to discuss first is the overall scope and principles.

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

-- 
Regards,

Laurent Pinchart
