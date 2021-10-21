Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395654366B1
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 17:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhJUPsK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 11:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhJUPsJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 11:48:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B43C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 08:45:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7167F8B6;
        Thu, 21 Oct 2021 17:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1634831150;
        bh=wzZxA0cK/kn7DNd0V55EiPIpkgW0zvh1qHfVB7opBPw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pv1/kVKB9/KXVgEQU8It59einpoHcOpc/ShfdDv7hR5WjE2S4Z0xwOJBGhgbFCeAt
         5aeyOQQBEUwM7Oa4JksbcNL4cZMk3UmvOqM9ruv6TNJl72G18DKqWx+qSB/Ehok/HC
         MkIa8GXSrT6UA9ymzqfAbJOeEAwOJiCQb93isfIo=
Date:   Thu, 21 Oct 2021 18:45:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <YXGLGi5XIaJCJ6JN@pendragon.ideasonboard.com>
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

They're not I'm afraid :-) Different subsystems have different
preferences, and within the realm of what a subsystem allows, different
parts also use different coding style rules. It's the same for media,
depending on who maintains a set of drivers, the rules will be
different.

> The coding style guide is lacking documentation on such things though.

Trying to fix that with a top-down approach will in my opinion not work.
I'd rather focus on media first to see if we can do something at the
subsystem level, in a bottom-up way (I've even considered writing rules
specific to sensor drivers, but if we can reach an agreement at the
subsystem level, that would be better).

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
> > +
> >  Key Cycle Dates
> >  ---------------

-- 
Regards,

Laurent Pinchart
