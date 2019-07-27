Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90973777E2
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 11:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbfG0J1s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 05:27:48 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:44111 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbfG0J1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 05:27:48 -0400
X-Originating-IP: 176.158.46.5
Received: from aptenodytes (static-176-158-46-5.ftth.abo.bbox.fr [176.158.46.5])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C790DFF806;
        Sat, 27 Jul 2019 09:27:43 +0000 (UTC)
Date:   Sat, 27 Jul 2019 11:27:43 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, kernel@collabora.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Alexandre Courbot <acourbot@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/3] media: uapi: h264: Clarify our expectations
 regarding NAL header format
Message-ID: <20190727092743.GA16618@aptenodytes>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
 <20190703122849.6316-2-boris.brezillon@collabora.com>
 <2f836ff0ce9ea68329a81e83109e53e24f7783c6.camel@collabora.com>
 <20190705191618.3467c417@collabora.com>
 <20190725084228.2306171e@collabora.com>
 <20190725193616.GD14499@aptenodytes>
 <75b515e22494690ab467dd769c4d5902af414c7a.camel@collabora.com>
 <20190726082828.0844011d@collabora.com>
 <20190726093028.3a94bda0@collabora.com>
 <9b186171-3c1f-d979-c070-ef0c5c0786ac@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b186171-3c1f-d979-c070-ef0c5c0786ac@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri 26 Jul 19, 10:53, Hans Verkuil wrote:
> On 7/26/19 9:30 AM, Boris Brezillon wrote:
> > On Fri, 26 Jul 2019 08:28:28 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > 
> >> On Thu, 25 Jul 2019 23:39:11 -0300
> >> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >>
> >>> On Thu, 2019-07-25 at 21:36 +0200, Paul Kocialkowski wrote:  
> >>>> Having a control that specifies an alignment constraint for the slice beginning
> >>>> could work (as long as we make it optional, although userspace should be
> >>>> required to abide by it when it is present).  
> >>
> >> By making that, you put the burden on both sides of the stack:
> >>
> >> - the kernel side will have to deal with the unaligned cases (using a
> >>   bounce buffer)
> >> - userspace apps/libs that want to avoid an extra copy will have to
> >>   check this constraint and align things properly anyway
> > 
> > I'd like to revise my statement. Ideally, the drivers should take care
> > of such mis-alignments or unsupported NAL header types by
> > copying/re-formatting the OUTPUT buffer so that existing apps work
> > out of the box when the driver is added, which means we'll have to take
> > care of that kernel-side anyway. Handling selection of the best
> > encoding-mode/NAL-header-type in userspace is useful if one wants to
> > improve perfs.
> 
> Just my 5 cents:
> 
> You very much want to avoid the situation where drivers have to copy or
> reformat the OUTPUT buffer. That's asking for problems, not to mention
> that it is no longer zero-copy.

I definitely agree on that, since such constraints are likely to exist, we are
certainly better off exposing them to userspace.

I understand that it does add some complexity and asks for userspace code to be
more complex, but let's be realistic: this is a complex topic with lots of
hardware-specific details getting in the way. I don't think we can act as if
things were simpler.

My feeling is that we should keep trying to find "as elegant as possible" ways
to expose constraints instead of putting strict and easy definitions for
userspace that end up making drivers perform sub-optimally.

Since the initial cedrus proposal, we have covered more ground to allow the
API to fit the rockchip case, without conflicting with cedrus. We're now facing
new constraints and issue and I really think we should keep trying to integrate
them in the unified API.

> >> Plus, the alignment thing won't work for AVC headers, so I think we
> >> should actually have a control to select the NAL header type rather
> >> than expose some alignment constraints (or have one pix fmt per NAL
> >> header type, but you don't seem to like the idea, so I'm trying
> >> to find something else :-)).
> >>
> >> And if we go for this option (control to select the NAL header type),
> >> I'm wondering why we're not making that NAL-header type selection
> >> mandatory from the start. We don't have to support all NAL headers at
> >> first (can be Annex B only), but, by making this control selection
> >> non-optional, we'll at least give a decent feedback to userspace
> >> (setting NAL header control fails because the selected NAL header type
> >> is not supported by the HW) instead of returning an error on the
> >> decoding operation (which, depending on how verbose the driver is, can
> >> be quite hard to figure out).
> 
> This sounds reasonable.
> 
> This control should be mandatory, and it should be referred to from
> the H264/5 pixelformat definitions (see also https://patchwork.linuxtv.org/patch/57709/).

I am growing confused about one thing: are we talking about selecting
the type of *start code* (which can have a variable number of heading and
trailing zeros depending on the situation) or about the *NAL header type*, which
follows the start code?

I like the idea of drivers providing what types of start codes they can support,
but I don't really see how it helps regarding the alignment constraints and how
it relates to the zero-padding.

Cheers,

Paul

> Regards,
> 
> 	Hans
> 
> >>
> >>>>
> >>>> I guess it's not such a high price to pay for a unified codec interface :)  
> >>
> >> If by unified you mean exposing only one pixel format, then yes, it's
> >> unified. Doesn't make it easier to deal with from the userspace
> >> perspective IMHO.
> >>
> >> To sum-up, I'm fine keeping one pixel format, but I'm no longer sure
> >> not exposing the NAL header type is a good option. We've seen that
> >> providing alignment guarantees for HW expecting raw bitstream (without
> >> the start code) might become challenging at some point. So I'd opt for
> >> making this selection explicit. After all, it's just an extra control
> >> to set from userspace, and 2 extra switch-case: one to select the most
> >> appropriate NAL header type, and another one to fill the buffer with
> >> the appropriate header (if there's one).
> > 
> 

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
