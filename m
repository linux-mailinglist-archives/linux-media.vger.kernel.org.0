Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6284B7790C
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 15:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387647AbfG0NtO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 27 Jul 2019 09:49:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40356 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387603AbfG0NtO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 09:49:14 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B762C283B7E;
        Sat, 27 Jul 2019 14:49:11 +0100 (BST)
Date:   Sat, 27 Jul 2019 15:49:08 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
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
Message-ID: <20190727154908.13e8a34b@collabora.com>
In-Reply-To: <df545d0fe07766c5637e36c0f1fbd1d479721dec.camel@collabora.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
        <20190703122849.6316-2-boris.brezillon@collabora.com>
        <2f836ff0ce9ea68329a81e83109e53e24f7783c6.camel@collabora.com>
        <20190705191618.3467c417@collabora.com>
        <20190725084228.2306171e@collabora.com>
        <20190725193616.GD14499@aptenodytes>
        <75b515e22494690ab467dd769c4d5902af414c7a.camel@collabora.com>
        <20190726082828.0844011d@collabora.com>
        <20190726093028.3a94bda0@collabora.com>
        <df545d0fe07766c5637e36c0f1fbd1d479721dec.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 27 Jul 2019 09:52:24 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:


> > > 
> > > That's not my understanding of the Annex B section (quoting the spec
> > > for reference):
> > > 
> > > "
> > > The byte stream format consists of a sequence of byte stream NAL unit
> > > syntax structures. Each byte stream NAL unit syntax structure contains
> > > one start code prefix followed by one nal_unit( NumBytesInNALunit )
> > > syntax structure. It may (and under some circumstances, it shall) also
> > > contain an additional zero_byte syntax element. It may also contain one
> > > or more additional trailing_zero_8bits syntax elements. When it is the
> > > first byte stream NAL unit in the bitstream, it may also contain one or
> > > more additional leading_zero_8bits syntax elements.
> > > "
> > >   
> 
> Right. I wonder what the "may or shall" part is really specifying.
> 
> However, note that the table B.1.1 and its comments B.1.2 is might
> be interpreted differently. To me, there's a difference between the different
> syntax elements (zero-bytes elements vs. the start code prefix element).
> 
> This is what it says about the zero_byte syntax element:
> 
> """
> zero_byte is a single byte equal to 0x00.
> When any of the following conditions are fulfilled, the zero_byte syntax element shall be present.
> – the nal_unit_type within the nal_unit( ) is equal to 7 (sequence parameter set) or 8 (picture parameter set)
> – the byte stream NAL unit syntax structure contains the first NAL unit of an access unit in decoding order, as
> specified by subclause 7.4.1.2.3.
> """
> 
> We are not dealing with SPS or PPS here, but we are discussing multislice content,
> so IIUC this syntax element would be part of our bitstream pixfmt.
> 
> And this is what it says about the start code prefix:
> 
> """
> start_code_prefix_one_3bytes is a fixed-value sequence of 3 bytes equal to 0x000001. This syntax element is called a
> start code prefix.
> """
> 
> These elements are used in such a way that it might seem
> you have two start codes options 3-byte or 4-byte, though.

This is correct, but I was actually referring to:

"
It may also contain one or more additional trailing_zero_8bits syntax
elements. When it is the first byte stream NAL unit in the
bitstream, it may also contain one or more additional
leading_zero_8bits syntax elements.
"

which would allow userspace to put additional zeros at the beginning
in order to fulfill the HW alignment constraints. I'm not saying this is
a good solution, just saying it can be done.


> > > > > I guess it's not such a high price to pay for a unified codec interface :)    
> > > 
> > > If by unified you mean exposing only one pixel format, then yes, it's
> > > unified. Doesn't make it easier to deal with from the userspace
> > > perspective IMHO.
> > > 
> > > To sum-up, I'm fine keeping one pixel format, but I'm no longer sure
> > > not exposing the NAL header type is a good option. We've seen that
> > > providing alignment guarantees for HW expecting raw bitstream (without
> > > the start code) might become challenging at some point. So I'd opt for
> > > making this selection explicit. After all, it's just an extra control
> > > to set from userspace, and 2 extra switch-case: one to select the most
> > > appropriate NAL header type, and another one to fill the buffer with
> > > the appropriate header (if there's one).  
> 
> I must admit I'm confused by what you mean about NAL header type, I thought
> we weren't trying to support AVC, and only the Annex B bitstream format.

I'm not trying to support AVC headers, but designing something that
allows us to extend the interface and support that case (if we ever need
to) is a good thing IMO.

>  
> That said, I don't see the interface getting any simpler with a unified
> pixfmt, given the menu control to expose frame or slice decoding.

I agree. I think it's pretty much the same complexity anyway
('additional ctrl to set the start-code/header/preamble type' vs
'additional pixfmt'), so it's mostly a matter of taste.

> 
> Proper applications need to support both modes anyway, where in the latter
> it'll have to parse the bitstream to extract the slices.

Hm, the current uAPI forces us to pass slice offsets, which means we
have to parse the bitstream anyway. I think we should keep it like that
because I don't think we can assume the HW is smart enough to detect
slice boundaries.

> What's so bad
> about just supporting an extra pixel format, where the slices are stripped
> of its start codes and zero-byte elements?

I'm not opposed to that solution, but Paul is, so I'm just trying to
find something that makes everyone happy, hence the "NAL header
type" (or "start code type"/"preamble type" if you prefer, though
it's not really a start code for AVC) proposal.

> 
> And how come this is any more complex than exposing alignment constraints,
> so that applications can artificially add leading_zero_8bits or trailing_zero_8bits
> elements to comply with a driver dma alignment. To be honest, the more I think
> about it, the more this option sounds just horrible :-)

Also think this option is more complicated and less future proof
(AFAICT, AVC headers/start-codes can't be extended like Annex B ones).

> 
> To me, it's far simpler to just expose what the devices support. If a driver
> will expect to parse the bitstream, and accepts multi-slice content,
> we expose that as a bitstream pixfmt.

Those 2 problems are orthogonal. You could have HW dealing with
multi-slice content while still requiring things to be passed without
Annex B start codes. The H264 pixfmt is really just about NAL headers:
No NAL headers vs Annex B headers vs AVC headers.

> And if another driver expects
> no-start-code slices, then we have another pixfmt.

Yep, but I don't want to argue endlessly on this, and I'd be fine with
the "NAL header/preamble/start-code/whatever type ctrl" too.
