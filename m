Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C3D4365A0
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 17:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhJUPRI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 11:17:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58836 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhJUPQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 11:16:54 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ACA68B6;
        Thu, 21 Oct 2021 17:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634829277;
        bh=zOEFB7Jms20IR7qp5keHBdpl9QthTikkKor2iHB2Emc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OCdxF14dvBhfNzWLaZMJLF9ZgVJa7tsNjcxIFMVgrs1RDxD1rkHafXZO3oIA6kJse
         N7l767FggIH7HqGtyT45n/Fhvc41lwbtbCfkN1e9l71VtgdbX3UgPyRlYeJdlVL4+H
         ejD2iHtzABt8u7pAOvytTTeG1kGBzvTH0oGWDE+A=
Date:   Thu, 21 Oct 2021 18:14:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <YXGDyRgReDDTlF5J@pendragon.ideasonboard.com>
References: <20211013092005.14268-1-jacopo@jmondi.org>
 <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 21, 2021 at 04:00:40PM +0200, Hans Verkuil wrote:
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
> 
> > +    - hexadecimal values should be spelled using lowercase letters;
> > +    - one structure/enum member declaration per line;
> > +    - one variable declaration per line;
> 
> Hmm, I don't mind something like: int i, j;
> 
> But for anything more complex I too prefer one declaration per line.
> 
> > +    - prefer variable declaration order in reverse-x-mas-tree over
> > +      initialization at variable declare time;
> 
> Add something like:
> 
> ...unless there are dependencies or other readability reasons to
> depart from this.

This should probably go as the top-level, it's a valid comment for most
(all ?) rules.

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
> > +
> >  Key Cycle Dates
> >  ---------------
> > 

-- 
Regards,

Laurent Pinchart
