Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E078436A7B
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 20:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhJUSWN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 14:22:13 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:57023 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbhJUSWM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 14:22:12 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 21B2F40005;
        Thu, 21 Oct 2021 18:19:53 +0000 (UTC)
Date:   Thu, 21 Oct 2021 20:20:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <20211021182042.6vebkm4ww4g35a37@uno.localdomain>
References: <20211013092005.14268-1-jacopo@jmondi.org>
 <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
 <20211021155512.153ecd48@sal.lan>
 <YXGHw6FPfPddXMj2@pendragon.ideasonboard.com>
 <20211021171759.1857aeef@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211021171759.1857aeef@sal.lan>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Laurent,

On Thu, Oct 21, 2021 at 05:17:59PM +0100, Mauro Carvalho Chehab wrote:
> Em Thu, 21 Oct 2021 18:31:15 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
>
> > Hi Mauro,
> >
>
> > > > > +    - one structure/enum member declaration per line;
> > > > > +    - one variable declaration per line;
> > > >
> > > > Hmm, I don't mind something like: int i, j;
> > >
> > > I don't mind having things like:
> > >
> > > 	struct *dev, *parent_dev;
> > >
> > > or even:
> > >
> > > 	struct *parent_dev, *dev = pdev->dev;
> > >
> > > What it is really ugly is having multiple initialized vars at the
> > > same declaration, like:
> > >
> > > 	struct *parent_dev = pdev->dev.parent, *dev = pdev->dev;
> > >
> > > or, even worse:
> > >
> > > 	struct *dev = pdev->dev, *parent_dev = dev.parent;
> >
> > Cording style is one of the main candidate areas for bikeshedding. The
> > first question that we should answer, I believe, is whether or not we
> > want to define a more precise coding style for the subsystem to achieve
> > higher uniformity, and how much latitude we want to give to developers.
>
> I would prefer to give more freedom to developers, provided that the
> code is easy to read/maintain. Having to request multiple reviews just
> due coding style nitpicking seems to be a waste of time for everyone ;-)
>

I agree in principle, but at the same time, a particularly stubborn
confrontation during a review made me realize that most 'rules' are
tribal knowledge, and a particularly stubborn developer might impose
his own preferences arguing that everything that is not prohibited is
allowed. If you add to that in the most common case cargo cult is
the default way to find out what a rule is, if one driver escapes
others will take inspiration from it.

Now, I'm fine if it gets decided that everything not prohibited is
allowed, but then I fear it will be very hard to maintain a consistent
style among the subsystem.


> > For instance, I don't mind
> >
> > 	unsigned int i, j;
> >
> > too much, but I would scream in horror at
> >
> > 	char *name = dev_name, c = '\0';
>
> Yeah, multiple vars being declared and assigned at the same line is something
> that should be avoided. See, even single letter vars with obvious assigns,
> like:
>
> 	int i = 0, j = 1;
>
> are less readable than:
>
> 	int	i = 0;
> 	int	j = 1;
>
> > (I'm sad C even allows declaring a char pointer and a char variable on
> > the same line like this). There are lots of cases between those two
> > extremes that are more or less good (or bad) depending on who you ask,
> > so we won't be able to come up with a precise set of rules that draw a
> > line somewhere in the middle. What we could do is err more on the side
> > of strictness, for instance with
> >
> > - One variable declaration per line. As an exception, grouping multiple
> >   single-letter counter variables on a single line is allowed.
> >
> > (or even allowing no exception). This is probably stricter than it needs
> > to be, and in some cases it will result in a few more lines of code, but
> > if it brings increased readability and maintainability through
> > uniformity it's something we could consider.
>
> I don't think that things like:
>
> 	int ret, i, j;
>
> are less readable/maintainable than:
>
> 	int ret;
> 	int i;
> 	int j;
>
> Between the above, I would opt to the shorter format, when there's no
> variable initialization (no matter if the vars have single or multiple
> chars).
>
> On the other hand, I won't be nacking/rejecting a patch if it uses
> the longer format, as, for me, both are equivalent, in terms of
> maintenance and readability.
>
> So, for me, the rule should be just:
>
> - don't declare and initialize multiple variables at the same line.
>
> >
> > The same reasoning can apply to C++ comments, we can decide to allow
> > them or not, but the more flexibility there will be in the rules, the
> > less uniformity we'll have, which I personally believe hinders
> > readability.
>
> Yeah, agreed.

Thanks, I'll send a new version taking all your comments into account.

Thanks
   j

>
> Regards,
> Mauro
