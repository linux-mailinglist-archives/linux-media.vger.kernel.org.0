Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19C39FD6C5
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 08:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfKOHKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 02:10:04 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59202 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfKOHKE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 02:10:04 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 78C36291647;
        Fri, 15 Nov 2019 07:10:01 +0000 (GMT)
Date:   Fri, 15 Nov 2019 08:09:58 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: hantro: make update_dpb() not leave holes in DPB
Message-ID: <20191115080958.12893ab5@collabora.com>
In-Reply-To: <CAPBb6MXa_9Ji5TwEF-HqPRO5JFG9HU1VDDGJdk-+Smczg0RHZA@mail.gmail.com>
References: <20191115035013.145152-1-acourbot@chromium.org>
        <20191115053630.129b473b@collabora.com>
        <CAPBb6MXa_9Ji5TwEF-HqPRO5JFG9HU1VDDGJdk-+Smczg0RHZA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 15 Nov 2019 14:31:22 +0900
Alexandre Courbot <acourbot@chromium.org> wrote:

> On Fri, Nov 15, 2019 at 1:36 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Hi Alexandre,
> >
> > On Fri, 15 Nov 2019 12:50:13 +0900
> > Alexandre Courbot <acourbot@chromium.org> wrote:
> >  
> > > update_dpb() reorders the DPB entries such as the same frame in two
> > > consecutive decoding requests always ends up in the same DPB slot.
> > >
> > > It first clears all the active flags in the DPB, and then checks whether
> > > the active flag is not set to decide whether an entry is a candidate for
> > > matching or not.
> > >
> > > However, this means that unused DPB entries are also candidates for
> > > matching, and an unused entry will match if we are testing it against a
> > > frame which (TopFieldOrderCount, BottomFieldOrderCount) is (0, 0).  
> >
> > Hm, I might be wrong but I thought we were supposed to re-use matching
> > entries even if the ref was not active on the last decoded frame. IIRC,
> > a ref can be active on specific decoding request (X), then inactive on
> > the next one (X+1) and active again on the following one (X+2).
> > Shouldn't we re-use the slot we used when decoding X for this ref when
> > decoding X+2?  
> 
> I am not sure how often this happens in practice (if at all), but
> maybe this logic would work as well. In this case we would need to
> mark DPB entries that are not used yet differently to avoid the issue
> that this patch attempts to fix.
> 
> To give a precise example of the issue, for a stream that only uses 3
> DPB entries at max, after an IDR frame the 4th DPB entry will
> incorrectly be matched with the IDR frame of FieldOrderCount (0, 0)
> and be the only active entry for this frame. Hantro is ok with it, but
> this is not an optimal use of the DPB and MT8183 does not like that.

Well, having a ctx->h264_dec.unused_dpb bitmap only helps solving your
problem if you reset it to 0xffff on IDR frames, otherwise the algo will
keep picking the 4th entry.

> 
> >  
> > >
> > > As it turns out, this happens for the very first frame of a stream, but
> > > it is not a problem as it would be copied to the first entry anyway.
> > > More concerning is that after an IDR frame the Top/BottomFieldOrderCount
> > > can be reset to 0, and this time update_dpb() will match the IDR frame
> > > to the first unused entry of the DPB (and not the entry at index 0 as
> > > would be expected) because the first slots will have different values.  
> >
> > We could also consider resetting the DPB cache on IDR frames if that
> > works on Hantro.  
> 
> Maybe that could be enough indeed. Let me experiment with that a bit.
> I believe this would work since in practice the result would be the
> same as this patch, but for safety I'd rather have unused DPB entries
> be unambiguously identified rather than letting the (0, 0) match do
> the right thing by accident.
> 
> >  
> > >
> > > The Hantro driver is ok with this, but when trying to use the same
> > > function for another driver (MT8183) I noticed decoding artefacts caused
> > > by this hole in the DPB.  
> >
> > I guess this new version passes the chromium testsuite on rk-based
> > boards. If that's the case I don't have any objection to this patch.
> >
> > Note that I was not planning to share the DPB caching logic as I
> > thought only Hantro G1 needed that trick. Have you tried passing the
> > DPB directly? Maybe it just works on mtk.  
> 
> Passing the DPB directly I get corrupted frames on a regular basis
> with MTK. I also confirmed that the firmware's expectations are what
> this function does. Using the same function in the MTK driver, the
> decoded stream is flawless.

Okay.
