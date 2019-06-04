Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 833C734327
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 11:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfFDJ2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 05:28:34 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51013 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbfFDJ2d (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 05:28:33 -0400
X-Originating-IP: 90.88.144.139
Received: from aptenodytes (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8B5B220020;
        Tue,  4 Jun 2019 09:28:28 +0000 (UTC)
Message-ID: <515715f5571f2d9fc9ed0326db583b5fa9c279d3.camel@bootlin.com>
Subject: Re: Proposed updates and guidelines for MPEG-2, H.264 and H.265
 stateless support
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Tue, 04 Jun 2019 11:28:28 +0200
In-Reply-To: <VI1PR03MB4206CA39BCD520111EF9844AAC150@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
         <20190603112449.GA30132@ulmo>
         <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
         <20190603214117.664f6ba1@collabora.com> <20190604083157.GC9048@ulmo>
         <20190604104921.5f4dcbe8@collabora.com> <20190604090636.GF9048@ulmo>
         <VI1PR03MB4206CA39BCD520111EF9844AAC150@VI1PR03MB4206.eurprd03.prod.outlook.com>
Organization: Bootlin
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Tue, 2019-06-04 at 09:15 +0000, Jonas Karlman wrote:
> On 2019-06-04 11:06, Thierry Reding wrote:
> > On Tue, Jun 04, 2019 at 10:49:21AM +0200, Boris Brezillon wrote:
> > > On Tue, 4 Jun 2019 10:31:57 +0200
> > > Thierry Reding <thierry.reding@gmail.com> wrote:
> > > 
> > > > > > > > - Using flags
> > > > > > > > 
> > > > > > > > The current MPEG-2 controls have lots of u8 values that can be
> > > > > > > > represented as flags. Using flags also helps with padding.
> > > > > > > > It's unlikely that we'll get more than 64 flags, so using a u64 by
> > > > > > > > default for that sounds fine (we definitely do want to keep some room
> > > > > > > > available and I don't think using 32 bits as a default is good enough).
> > > > > > > > 
> > > > > > > > I think H.264/HEVC per-control flags should also be moved to u64.    
> > > > > > > There was also some concensus on this, that u64 should be good enough
> > > > > > > for anything out there, though we obviously don't know what the future
> > > > > > > will hold, so perhaps adding some way for possible extending this in the
> > > > > > > future might be good. I guess we'll get new controls for new codecs
> > > > > > > anyway, so we can punt on this until then.
> > > > > > >     
> > > > > > > > - Clear split of controls and terminology
> > > > > > > > 
> > > > > > > > Some codecs have explicit NAL units that are good fits to match as
> > > > > > > > controls: e.g. slice header, pps, sps. I think we should stick to the
> > > > > > > > bitstream element names for those.
> > > > > > > > 
> > > > > > > > For H.264, that would suggest the following changes:
> > > > > > > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;
> > > > > > > > - killing v4l2_ctrl_h264_decode_param and having the reference lists
> > > > > > > > where they belong, which seems to be slice_header;    
> > > > > > But now here it's being described per slice. When I look at the slice
> > > > > > header, I only see list of modifications and when I look at userspace,
> > > > > > That list is simply built from DPB, the modifications list found in the
> > > > > > slice header seems to be only used to craft the l0/l1 list.  
> > > > > Yes, I think there was a misunderstanding which was then clarified
> > > > > (unfortunately it happened on IRC, so we don't have a trace of this
> > > > > discussion). The reference list should definitely be per-frame, and the
> > > > > L0/L1 slice reflists are referring to the per-frame reference list (it's
> > > > > just a sub-set of the per-frame reflist re-ordered differently).
> > > > >   
> > > > > > There is one thing that come up though, if we enable per-frame decoding
> > > > > > on top of per-slice decoder (like Cedrus), won't we force userspace to
> > > > > > always compute l0/l1 even though the HW might be handling that ?  
> > > > > That's true, the question is, what's the cost of this extra re-ordering?  
> > > > I think ultimately userspace is already forced to compute these lists
> > > > even if some hardware may be able to do it in hardware. There's going to
> > > > be other hardware that userspace wants to support that can't do it by
> > > > itself, so userspace has to at least have the code anyway. What it could
> > > > do on top of that decide not to run that code if it somehow detects that
> > > > hardware can do it already. On the other hand this means that we have to
> > > > expose a whole lot of capabilities to userspace and userspace has to go
> > > > and detect all of them in order to parameterize all of the code.
> > > > 
> > > > Ultimately I suspect many applications will just choose to pass the data
> > > > all the time out of simplicity. I mean drivers that don't need it will
> > > > already ignore it (i.e. they must not break if they get the extra data)
> > > > so other than the potential runtime savings on some hardware, there are
> > > > no advantages.
> > > > 
> > > > Given that other APIs don't bother exposing this level of control to
> > > > applications makes me think that it's just not worth it from a
> > > > performance point of view.
> > > That's not exactly what Nicolas proposed. He was suggesting that we
> > > build those reflists kernel-side: V4L would provide an helper and
> > > drivers that need those lists would use it, others won't. This way we
> > > have no useless computation done, and userspace doesn't even have to
> > > bother checking the device caps to avoid this extra step.
> > Oh yeah, that sounds much better. I suppose one notable differences to
> > other APIs is that they have to pass in buffers for all the frames in
> > the DPB, so they basically have to build the lists in userspace. Since
> > we'll end up looking up the frames in the kernel, it sounds reasonable
> > to also build the lists in the kernel.
> 
> Userspace must already process the modification list or it wont have
> correct DPB for next frame.
> If you move this processing into kernel side you also introduce state
> into the stateless driver.

There is state in the form of the m2m context anyway, so I don't think
that's a concern in particular. We've been using the "stateless"
terminology all around, but it's really more about programming the
decoding registers versus passing raw bitstream through a mailbox
interface rather than the fine stateless/stateful distinction.

Cheers,

Paul

> Regards,
> Jonas
> > On that note, it would probably be useful to have some sort of helper
> > to get at all the buffers that make up the DPB in the kernel. That's got
> > to be something that everybody wants.
> > 
> > Thierry
-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

