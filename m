Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D19A436774
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 18:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbhJUQUV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 12:20:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229702AbhJUQUV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 12:20:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A515760FD8;
        Thu, 21 Oct 2021 16:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634833085;
        bh=SRom23oBY5CSsKIvJeB/kQLsPzPh/hQV3gxJ8AmEGII=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RYGDXCFvNAPeo6nAQiVE9uo7wqn8ESjQHnfNix9XcSjffV2tviTvtbtkj1y/qPF8p
         IudOQSfKOIC8bx+i4LsPPatRLKNEasKpK2Xbhm1i52cp+BrchAiZgynG23DDGB9wX7
         SCicFsPZvY/lnKdO29T4PuHSOCBGWhVdSnDwhACqFqlfVn+KmhX30Ox/T70bu9hQkY
         27aFME4pbqzs+touaCgZRJ3DvGOHLhEMQz6kJcWdVfeEprtjQ28RKIUhcXKraiseQk
         m2ywl9PS2TsZu5tQkVFdBhjtM1QuAyPr4EaV3Vo108+Fv80aDY4MmV/u4s1ouzbG7N
         wdqedlpFHcmxA==
Date:   Thu, 21 Oct 2021 17:17:59 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>, Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <20211021171759.1857aeef@sal.lan>
In-Reply-To: <YXGHw6FPfPddXMj2@pendragon.ideasonboard.com>
References: <20211013092005.14268-1-jacopo@jmondi.org>
        <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
        <20211021155512.153ecd48@sal.lan>
        <YXGHw6FPfPddXMj2@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 21 Oct 2021 18:31:15 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 

> > > > +    - one structure/enum member declaration per line;
> > > > +    - one variable declaration per line;    
> > > 
> > > Hmm, I don't mind something like: int i, j;  
> > 
> > I don't mind having things like:
> > 
> > 	struct *dev, *parent_dev;
> > 
> > or even:
> > 
> > 	struct *parent_dev, *dev = pdev->dev;
> > 
> > What it is really ugly is having multiple initialized vars at the
> > same declaration, like:
> > 
> > 	struct *parent_dev = pdev->dev.parent, *dev = pdev->dev;
> > 
> > or, even worse:
> > 
> > 	struct *dev = pdev->dev, *parent_dev = dev.parent;  
> 
> Cording style is one of the main candidate areas for bikeshedding. The
> first question that we should answer, I believe, is whether or not we
> want to define a more precise coding style for the subsystem to achieve
> higher uniformity, and how much latitude we want to give to developers.

I would prefer to give more freedom to developers, provided that the
code is easy to read/maintain. Having to request multiple reviews just
due coding style nitpicking seems to be a waste of time for everyone ;-)

> For instance, I don't mind
> 
> 	unsigned int i, j;
> 
> too much, but I would scream in horror at
> 
> 	char *name = dev_name, c = '\0';

Yeah, multiple vars being declared and assigned at the same line is something
that should be avoided. See, even single letter vars with obvious assigns,
like:

	int i = 0, j = 1;

are less readable than:

	int	i = 0;
	int	j = 1;

> (I'm sad C even allows declaring a char pointer and a char variable on
> the same line like this). There are lots of cases between those two
> extremes that are more or less good (or bad) depending on who you ask,
> so we won't be able to come up with a precise set of rules that draw a
> line somewhere in the middle. What we could do is err more on the side
> of strictness, for instance with
> 
> - One variable declaration per line. As an exception, grouping multiple
>   single-letter counter variables on a single line is allowed.
> 
> (or even allowing no exception). This is probably stricter than it needs
> to be, and in some cases it will result in a few more lines of code, but
> if it brings increased readability and maintainability through
> uniformity it's something we could consider.

I don't think that things like:

	int ret, i, j;

are less readable/maintainable than:

	int ret;
	int i;
	int j;

Between the above, I would opt to the shorter format, when there's no 
variable initialization (no matter if the vars have single or multiple
chars).

On the other hand, I won't be nacking/rejecting a patch if it uses
the longer format, as, for me, both are equivalent, in terms of
maintenance and readability.

So, for me, the rule should be just:

- don't declare and initialize multiple variables at the same line.

> 
> The same reasoning can apply to C++ comments, we can decide to allow
> them or not, but the more flexibility there will be in the rules, the
> less uniformity we'll have, which I personally believe hinders
> readability.

Yeah, agreed. 

Regards,
Mauro
