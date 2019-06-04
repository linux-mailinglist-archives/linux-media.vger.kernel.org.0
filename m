Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 539AB34224
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfFDIt0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:49:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40806 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfFDIt0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 04:49:26 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 56A67260676;
        Tue,  4 Jun 2019 09:49:24 +0100 (BST)
Date:   Tue, 4 Jun 2019 10:49:21 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
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
Message-ID: <20190604104921.5f4dcbe8@collabora.com>
In-Reply-To: <20190604083157.GC9048@ulmo>
References: <0be542fabc57c38596bdb1db44aead7054a89158.camel@bootlin.com>
        <20190603112449.GA30132@ulmo>
        <a2f6bac6596da86d597d9ac4c12b1f72b772dbe5.camel@ndufresne.ca>
        <20190603214117.664f6ba1@collabora.com>
        <20190604083157.GC9048@ulmo>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 4 Jun 2019 10:31:57 +0200
Thierry Reding <thierry.reding@gmail.com> wrote:

> > > > > - Using flags
> > > > > 
> > > > > The current MPEG-2 controls have lots of u8 values that can be
> > > > > represented as flags. Using flags also helps with padding.
> > > > > It's unlikely that we'll get more than 64 flags, so using a u64 by
> > > > > default for that sounds fine (we definitely do want to keep some room
> > > > > available and I don't think using 32 bits as a default is good enough).
> > > > > 
> > > > > I think H.264/HEVC per-control flags should also be moved to u64.    
> > > > 
> > > > There was also some concensus on this, that u64 should be good enough
> > > > for anything out there, though we obviously don't know what the future
> > > > will hold, so perhaps adding some way for possible extending this in the
> > > > future might be good. I guess we'll get new controls for new codecs
> > > > anyway, so we can punt on this until then.
> > > >     
> > > > > - Clear split of controls and terminology
> > > > > 
> > > > > Some codecs have explicit NAL units that are good fits to match as
> > > > > controls: e.g. slice header, pps, sps. I think we should stick to the
> > > > > bitstream element names for those.
> > > > > 
> > > > > For H.264, that would suggest the following changes:
> > > > > - renaming v4l2_ctrl_h264_decode_param to v4l2_ctrl_h264_slice_header;
> > > > > - killing v4l2_ctrl_h264_decode_param and having the reference lists
> > > > > where they belong, which seems to be slice_header;    
> > > 
> > > But now here it's being described per slice. When I look at the slice
> > > header, I only see list of modifications and when I look at userspace,
> > > That list is simply built from DPB, the modifications list found in the
> > > slice header seems to be only used to craft the l0/l1 list.  
> > 
> > Yes, I think there was a misunderstanding which was then clarified
> > (unfortunately it happened on IRC, so we don't have a trace of this
> > discussion). The reference list should definitely be per-frame, and the
> > L0/L1 slice reflists are referring to the per-frame reference list (it's
> > just a sub-set of the per-frame reflist re-ordered differently).
> >   
> > > 
> > > There is one thing that come up though, if we enable per-frame decoding
> > > on top of per-slice decoder (like Cedrus), won't we force userspace to
> > > always compute l0/l1 even though the HW might be handling that ?  
> > 
> > That's true, the question is, what's the cost of this extra re-ordering?  
> 
> I think ultimately userspace is already forced to compute these lists
> even if some hardware may be able to do it in hardware. There's going to
> be other hardware that userspace wants to support that can't do it by
> itself, so userspace has to at least have the code anyway. What it could
> do on top of that decide not to run that code if it somehow detects that
> hardware can do it already. On the other hand this means that we have to
> expose a whole lot of capabilities to userspace and userspace has to go
> and detect all of them in order to parameterize all of the code.
> 
> Ultimately I suspect many applications will just choose to pass the data
> all the time out of simplicity. I mean drivers that don't need it will
> already ignore it (i.e. they must not break if they get the extra data)
> so other than the potential runtime savings on some hardware, there are
> no advantages.
> 
> Given that other APIs don't bother exposing this level of control to
> applications makes me think that it's just not worth it from a
> performance point of view.

That's not exactly what Nicolas proposed. He was suggesting that we
build those reflists kernel-side: V4L would provide an helper and
drivers that need those lists would use it, others won't. This way we
have no useless computation done, and userspace doesn't even have to
bother checking the device caps to avoid this extra step.

