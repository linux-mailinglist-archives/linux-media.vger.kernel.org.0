Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D44878DA2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 16:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387759AbfG2OTm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 10:19:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56604 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387596AbfG2OTm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 10:19:42 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 94E5B260D8D;
        Mon, 29 Jul 2019 15:19:39 +0100 (BST)
Date:   Mon, 29 Jul 2019 16:19:36 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
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
Message-ID: <20190729161936.0be1e288@collabora.com>
In-Reply-To: <20190729132521.GA31073@aptenodytes>
References: <2f836ff0ce9ea68329a81e83109e53e24f7783c6.camel@collabora.com>
        <20190705191618.3467c417@collabora.com>
        <20190725084228.2306171e@collabora.com>
        <20190725193616.GD14499@aptenodytes>
        <75b515e22494690ab467dd769c4d5902af414c7a.camel@collabora.com>
        <20190726082828.0844011d@collabora.com>
        <20190726093028.3a94bda0@collabora.com>
        <9b186171-3c1f-d979-c070-ef0c5c0786ac@xs4all.nl>
        <20190727092743.GA16618@aptenodytes>
        <20190727114636.4224e2cd@collabora.com>
        <20190729132521.GA31073@aptenodytes>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 29 Jul 2019 15:25:21 +0200
Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:

> Hi,
> 
> On Sat 27 Jul 19, 11:46, Boris Brezillon wrote:
> > On Sat, 27 Jul 2019 11:27:43 +0200
> > Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:
> >   
> > > Hi,
> > > 
> > > On Fri 26 Jul 19, 10:53, Hans Verkuil wrote:  
> > > > On 7/26/19 9:30 AM, Boris Brezillon wrote:    
> > > > > On Fri, 26 Jul 2019 08:28:28 +0200
> > > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > > >     
> > > > >> On Thu, 25 Jul 2019 23:39:11 -0300
> > > > >> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > > > >>    
> > > > >>> On Thu, 2019-07-25 at 21:36 +0200, Paul Kocialkowski wrote:      
> > > > >>>> Having a control that specifies an alignment constraint for the slice beginning
> > > > >>>> could work (as long as we make it optional, although userspace should be
> > > > >>>> required to abide by it when it is present).      
> > > > >>
> > > > >> By making that, you put the burden on both sides of the stack:
> > > > >>
> > > > >> - the kernel side will have to deal with the unaligned cases (using a
> > > > >>   bounce buffer)
> > > > >> - userspace apps/libs that want to avoid an extra copy will have to
> > > > >>   check this constraint and align things properly anyway    
> > > > > 
> > > > > I'd like to revise my statement. Ideally, the drivers should take care
> > > > > of such mis-alignments or unsupported NAL header types by
> > > > > copying/re-formatting the OUTPUT buffer so that existing apps work
> > > > > out of the box when the driver is added, which means we'll have to take
> > > > > care of that kernel-side anyway. Handling selection of the best
> > > > > encoding-mode/NAL-header-type in userspace is useful if one wants to
> > > > > improve perfs.    
> > > > 
> > > > Just my 5 cents:
> > > > 
> > > > You very much want to avoid the situation where drivers have to copy or
> > > > reformat the OUTPUT buffer. That's asking for problems, not to mention
> > > > that it is no longer zero-copy.    
> > > 
> > > I definitely agree on that, since such constraints are likely to exist, we are
> > > certainly better off exposing them to userspace.
> > > 
> > > I understand that it does add some complexity and asks for userspace code to be
> > > more complex, but let's be realistic: this is a complex topic with lots of
> > > hardware-specific details getting in the way. I don't think we can act as if
> > > things were simpler.
> > > 
> > > My feeling is that we should keep trying to find "as elegant as possible" ways
> > > to expose constraints instead of putting strict and easy definitions for
> > > userspace that end up making drivers perform sub-optimally.
> > > 
> > > Since the initial cedrus proposal, we have covered more ground to allow the
> > > API to fit the rockchip case, without conflicting with cedrus. We're now facing
> > > new constraints and issue and I really think we should keep trying to integrate
> > > them in the unified API.
> > >   
> > > > >> Plus, the alignment thing won't work for AVC headers, so I think we
> > > > >> should actually have a control to select the NAL header type rather
> > > > >> than expose some alignment constraints (or have one pix fmt per NAL
> > > > >> header type, but you don't seem to like the idea, so I'm trying
> > > > >> to find something else :-)).
> > > > >>
> > > > >> And if we go for this option (control to select the NAL header type),
> > > > >> I'm wondering why we're not making that NAL-header type selection
> > > > >> mandatory from the start. We don't have to support all NAL headers at
> > > > >> first (can be Annex B only), but, by making this control selection
> > > > >> non-optional, we'll at least give a decent feedback to userspace
> > > > >> (setting NAL header control fails because the selected NAL header type
> > > > >> is not supported by the HW) instead of returning an error on the
> > > > >> decoding operation (which, depending on how verbose the driver is, can
> > > > >> be quite hard to figure out).    
> > > > 
> > > > This sounds reasonable.
> > > > 
> > > > This control should be mandatory, and it should be referred to from
> > > > the H264/5 pixelformat definitions (see also https://patchwork.linuxtv.org/patch/57709/).    
> > > 
> > > I am growing confused about one thing: are we talking about selecting
> > > the type of *start code* (which can have a variable number of heading and
> > > trailing zeros depending on the situation) or about the *NAL header type*, which
> > > follows the start code?  
> > 
> > We're talking about start codes, but Nicolas called them nal_header in
> > this email [1], so I thought it was the appropriate naming.  
> 
> Okay, the representation I had in mind was:
> [zeros][start code][nal unit header][zeros][nal unit data]
> 
> but maybe I'm mixing things up on my side.
> 
> > > I like the idea of drivers providing what types of start codes they can support,
> > > but I don't really see how it helps regarding the alignment constraints and how
> > > it relates to the zero-padding.  
> > 
> > It does help with alignment constraints because buffers allocated by
> > the driver are usually matching the HW alignment constraints and by
> > passing the type of NAL header (or start code if you prefer) we now
> > guarantee that the raw bitstream (when in NO_NAL_HEADER is selected) is
> > placed at the beginning of the buffer.  
> 
> I thought the issue at hand was that we needed the nal unit header to start at
> an aligned address

That's exactly the problem I'm trying to solve, and having a solution
that allows us to pass data starting at [nal unit header] when the
HW is not able to parse Annex B start codes solves that.

> while still needing a start code of 3 bytes.

Why do we need a start code if the HW doesn't care about it?

> I feel like I'm
> missing something in my understanding of the issue here.
> 
> > Doesn't solve the case of
> > imported buffers, but that problem is orthogonal I think (it's a
> > problem we already have right now, and would indeed require some way
> > to expose HW alignment constraints).  
> 
> If we expose the constraints explicitly, then we can honestly say that it's up
> to user-space to abide by them so there should be no particular difference
> between imported and allocated buffers. Userspace just has to know what it's
> doing. And drivers chould refuse imports that don't follow the reported
> constraints (or are outside the pool dedicated to the VPU).

Again, this problem is orthogonal to the problem I'm trying to solve.
I'm not saying it shouldn't be addressed at some point, but that's a
completely different topic.

> 
> > Not sure what the zero padding issue is. If you know the type of start
> > code, you don't have add extra 0 at the beginning to meet the alignment
> > constraints. If you're talking about padding bytes added at the end of
> > the bitstream (there's such a constraint on the rkvdec block), I think
> > that's something driver specific and should be handled by the driver.  
> 
> My point would rather be that it is (as far as I understood) valid regarding the
> H.264 spec to have extra zeros added by userspace (whatever the reason),

AFAICT, it's only valid when the bitstream is wrapped with an Annex B
format. Not sure other wrappers are skipping leading/trailing 0-bytes.

> so even
> if the type of start code is reported, it doesn't imply that we know the length
> of the heading zeros and start code, so the issue remains.

Hm, in the NO_START_CODE case we expect userspace to remove those
leading/trailing 0-bytes as well as the 000001 start code pattern.
That means we no longer have to specify an offset, and the payload is
guaranteed to be aligned as the HW expects.


