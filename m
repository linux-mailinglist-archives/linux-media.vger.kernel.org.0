Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D5A4364D0
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 16:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbhJUO5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 10:57:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:59796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231169AbhJUO5f (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 10:57:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 402CA610EA;
        Thu, 21 Oct 2021 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634828119;
        bh=r63ma6vIwvOAJNMq0TkSE5Tea41rPItvlMFznvcB5dM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UrlnVS82wAQHpl4Ddp3W7mfndpN/LkYx4bB/6TdsyVIp3gvVI5dwYcjrS+tW9uPR2
         njiQOOIBffg/J4XDKMR/Mm2yl9g645vffRGb0ToXaPpW4UXBVE8nEUnItSqa3aNMBM
         EJSrBPD9b8axtGvlHM+eCyR/JEb0Lzg3ZINiZt1LEAYuc233I+ZcUi0i5fjhw8SFmA
         EvoHvJLCC0GP2bGZ1ObIQd8s3rvdJQ0nf+YPygy5lExDNMjiWP7k9toXrSzUmoX9fO
         2ttGwOj7VSaybEIBclhf+GgbsIVsR/uv8qmitaN9joNo0mO06loQKcmgEVoNMX7bM9
         vw2bcVkrBP0GQ==
Date:   Thu, 21 Oct 2021 15:55:12 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, Sean Young <sean@mess.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <20211021155512.153ecd48@sal.lan>
In-Reply-To: <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
References: <20211013092005.14268-1-jacopo@jmondi.org>
        <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 21 Oct 2021 16:00:40 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 13/10/2021 11:20, Jacopo Mondi wrote:
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
> 
> if not -> except

While I prefer C99, I'm not really against having C++ comments on single
line comments. 

> 
> > +    - hexadecimal values should be spelled using lowercase letters;

> > +    - one structure/enum member declaration per line;
> > +    - one variable declaration per line;  
> 
> Hmm, I don't mind something like: int i, j;

I don't mind having things like:

	struct *dev, *parent_dev;

or even:

	struct *parent_dev, *dev = pdev->dev;

What it is really ugly is having multiple initialized vars at the
same declaration, like:

	struct *parent_dev = pdev->dev.parent, *dev = pdev->dev;

or, even worse:

	struct *dev = pdev->dev, *parent_dev = dev.parent;


> But for anything more complex I too prefer one declaration per line.
> 
> > +    - prefer variable declaration order in reverse-x-mas-tree over
> > +      initialization at variable declare time;  
> 
> Add something like:
> 
> ...unless there are dependencies or other readability reasons to
> depart from this.

+1

> 
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
> I'm not sure if this is what you typically see.
> 
> Perhaps this is a better example:
> 
> 	int i;
> 	struct foo_struct *foo = priv->foo;
> 	int result;
> 
> should be written as:
> 
> 	struct foo_struct *foo = priv->foo;
> 	int result;
> 	int i;
> 
> Regards,
> 
> 	Hans
> 
> > +
> >  Key Cycle Dates
> >  ---------------
> > 
> > --
> > 2.33.0
> >   
> 
