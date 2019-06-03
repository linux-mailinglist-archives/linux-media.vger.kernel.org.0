Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB1773392D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 21:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfFCTlX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 15:41:23 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36164 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfFCTlW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jun 2019 15:41:22 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7FE68263B00;
        Mon,  3 Jun 2019 20:41:20 +0100 (BST)
Date:   Mon, 3 Jun 2019 21:41:17 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
Message-ID: <20190603214117.664f6ba1@collabora.com>
In-Reply-To: <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
        <20190603112449.GA30132@ulmo>
        <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 03 Jun 2019 14:52:44 -0400
Nicolas Dufresne <nicolas@ndufresne.ca> wrote:

> > > - Dropping the DPB concept in H.264/H.265
> > > 
> > > As far as I could understand, the decoded picture buffer (DPB) is a
> > > concept that only makes sense relative to a decoder implementation. The
> > > spec mentions how to manage it with the Hypothetical reference decoder
> > > (Annex C), but that's about it.
> > > 
> > > What's really in the bitstream is the list of modified short-term and
> > > long-term references, which is enough for every decoder.
> > > 
> > > For this reason, I strongly believe we should stop talking about DPB in
> > > the controls and just pass these lists agremented with relevant
> > > information for userspace.
> > > 
> > > I think it should be up to the driver to maintain a DPB and we could
> > > have helpers for common cases. For instance, the rockchip decoder needs
> > > to keep unused entries around[2] and cedrus has the same requirement
> > > for H.264. However for cedrus/H.265, we don't need to do any book-
> > > keeping in particular and can manage with the lists from the bitstream
> > > directly.  
> > 
> > There was a bit of concern regarding this. Given that DPB maintenance is
> > purely a software construct, this doesn't really belong in the kernel. A
> > DPB will be the same no matter what hardware operates on the bitstream.
> > Depending on the hardware it may use the DPB differently (or maybe not
> > at all), but that's beside the point, really. This is pretty much the
> > same rationale as discussed above for meta data.
> > 
> > Again, VAAPI and VDPAU don't require drivers to deal with this. Instead
> > they just get the final list of reference pictures, ready to use.  
> 
> I think we need a bit of clarification from Boris, as what I read here
> is a bit contradictory (or at least I am a bit confused). When I first
> read this, I understood that this was just about renaming the dpb as
> being the references list and only require the active references to be
> there.

It's really just about renaming the field, it would contain exactly the
same data.

> 
> So what I'm not clear is where exactly this "active reference list"
> comes from. In VAAPI it is describe "per-frame" ....

That's my understanding as well.

> 
> >   
> > > - Using flags
> > > 
> > > The current MPEG-2 controls have lots of u8 values that can be
> > > represented as flags. Using flags also helps with padding.
> > > It's unlikely that we'll get more than 64 flags, so using a u64 by
> > > default for that sounds fine (we definitely do want to keep some room
> > > available and I don't think using 32 bits as a default is good enough).
> > > 
> > > I think H.264/HEVC per-control flags should also be moved to u64.  
> > 
> > There was also some concensus on this, that u64 should be good enough
> > for anything out there, though we obviously don't know what the future
> > will hold, so perhaps adding some way for possible extending this in the
> > future might be good. I guess we'll get new controls for new codecs
> > anyway, so we can punt on this until then.
> >   
> > > - Clear split of controls and terminology
> > > 
> > > Some codecs have explicit NAL units that are good fits to match as
> > > controls: e.g. slice header, pps, sps. I think we should stick to the
> > > bitstream element names for those.
> > > 
> > > For H.264, that would suggest the following changes:
> > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;
> > > - killing v4l2_ctrl_h264_decode_param and having the reference lists
> > > where they belong, which seems to be slice_header;  
> 
> But now here it's being described per slice. When I look at the slice
> header, I only see list of modifications and when I look at userspace,
> That list is simply built from DPB, the modifications list found in the
> slice header seems to be only used to craft the l0/l1 list.

Yes, I think there was a misunderstanding which was then clarified
(unfortunately it happened on IRC, so we don't have a trace of this
discussion). The reference list should definitely be per-frame, and the
L0/L1 slice reflists are referring to the per-frame reference list (it's
just a sub-set of the per-frame reflist re-ordered differently).

> 
> There is one thing that come up though, if we enable per-frame decoding
> on top of per-slice decoder (like Cedrus), won't we force userspace to
> always compute l0/l1 even though the HW might be handling that ?

That's true, the question is, what's the cost of this extra re-ordering?

> Shall
> we instead pass the modification list and implement the non-parsing
> bits of applying the modifications in the kernel ?

I'd be fine with that option too.
