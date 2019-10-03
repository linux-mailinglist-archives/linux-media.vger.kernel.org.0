Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C172CB0F9
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 23:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730749AbfJCVUD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 3 Oct 2019 17:20:03 -0400
Received: from mailoutvs57.siol.net ([185.57.226.248]:38936 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727789AbfJCVUD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 17:20:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 3580F524692;
        Thu,  3 Oct 2019 23:19:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id V4LW_LeUUw9g; Thu,  3 Oct 2019 23:19:58 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 9C5E452469A;
        Thu,  3 Oct 2019 23:19:58 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id CB941524698;
        Thu,  3 Oct 2019 23:19:57 +0200 (CEST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     mripard@kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: cedrus: Fix H264 default reference index count
Date:   Thu, 03 Oct 2019 23:19:57 +0200
Message-ID: <1700094.IKIOnZr010@jernej-laptop>
In-Reply-To: <20191003205857.GA3927@aptenodytes>
References: <20191002193553.1633467-1-jernej.skrabec@siol.net> <3413755.LxPTGpI9pz@jernej-laptop> <20191003205857.GA3927@aptenodytes>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dne četrtek, 03. oktober 2019 ob 22:58:57 CEST je Paul Kocialkowski 
napisal(a):
> Hi,
> 
> On Thu 03 Oct 19, 22:44, Jernej Škrabec wrote:
> > Dne četrtek, 03. oktober 2019 ob 22:28:46 CEST je Paul Kocialkowski
> > 
> > napisal(a):
> > > Hi,
> > > 
> > > On Thu 03 Oct 19, 07:16, Jernej Škrabec wrote:
> > > > Dne četrtek, 03. oktober 2019 ob 00:06:50 CEST je Paul Kocialkowski
> > > > 
> > > > napisal(a):
> > > > > Hi,
> > > > > 
> > > > > On Wed 02 Oct 19, 21:35, Jernej Skrabec wrote:
> > > > > > Reference index count in VE_H264_PPS should come from PPS control.
> > > > > > However, this is not really important, because reference index
> > > > > > count
> > > > > > is
> > > > > > in our case always overridden by that from slice header.
> > > > > 
> > > > > Thanks for the fixup!
> > > > > 
> > > > > Our libva userspace and v4l2-request testing tool currently don't
> > > > > provide
> > > > > this, but I have a pending merge request adding it for the hantro so
> > > > > it's
> > > > > good to go.
> > > > 
> > > > Actually, I think this is just cosmetic and it would work even if it
> > > > would
> > > > be always 0. We always override this number in SHS2 register with
> > > > VE_H264_SHS2_NUM_REF_IDX_ACTIVE_OVRD flag and recently there was a
> > > > patch
> > > > merged to clarify that value in slice parameters should be the one
> > > > that's
> > > > set on default value if override flag is not set in bitstream:
> > > > https://git.linuxtv.org/media_tree.git/commit/?
> > > > id=187ef7c5c78153acdce8c8714e5918b1018c710b
> > > > 
> > > > Well, we could always compare default and value in slice parameters,
> > > > but I
> > > > really don't see the benefit of doing that extra work.
> > > 
> > > Thanks for the detailed explanation! So I just realized that for HEVC, I
> > > didn't even include the default value in PPS and only went for the
> > > per-slice value. The HEVC hardware block apparently only needs the
> > > fields
> > > once at slice level, and by looking at the spec, only one of the two set
> > > of
> > > fields will be used.
> > > 
> > > So perhaps we could do the same for H.264 and only have the set of
> > > fields
> > > once in the slice params, so that both codecs are consistent. Userspace
> > > can
> > > just check the flag to know whether it should put the PPS default or
> > > slice-specific value in the slice-specific control.
> > > 
> > > What do you think?
> > 
> > I think that there would be less confusion if only value in slice params
> > would exists. But since Philipp rather made clarification in
> > documentation, maybe he sees benefit having both values?
> 
> Actually I just caught up with the discussion from thread:
> media: uapi: h264: Add num_ref_idx_active_override_flag
> 
> which explains that we need to pass the default fields for hardware that
> parses the slice header itself and we need the non-default fields and flag
> for other cases.
> 
> To cover the case of hardware that does slice header parsing, I guess it
> would also work to use the slice-specific values in place of the pps
> default values in the hardware register for that. But it feels quite
> confusing and a lot less straightforward than having all the fields and the
> override flag exposed.

I wasn't aware of that patch and related discussion. Ok, so it make sense to 
have both values. However, does it make sense to use default values in Cedrus?

> 
> So I think I should fix HEVC support accordingly, just in case the same
> situation arises for HEVC.

Seems reasonable. Does that mean there will be another revision of HEVC 
patches?  If so, I think slice_segment_addr should also be included in slice 
params, so multi-slice frames can be supported at later time.

Best regards,
Jernej 

> 
> Cheers,
> 
> Paul
> 
> > Best regards,
> > Jernej
> > 
> > > Cheers,
> > > 
> > > Paul
> > > 
> > > > Best regards,
> > > > Jernej
> > > > 
> > > > > Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > 
> > > > > Cheers,
> > > > > 
> > > > > Paul
> > > > > 
> > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > ---
> > > > > > 
> > > > > >  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++------
> > > > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > > b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c index
> > > > > > bd848146eada..4a0e69855c7f 100644
> > > > > > --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > > +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> > > > > > @@ -364,12 +364,8 @@ static void cedrus_set_params(struct
> > > > > > cedrus_ctx
> > > > > > *ctx,
> > > > > > 
> > > > > >  	// picture parameters
> > > > > >  	reg = 0;
> > > > > > 
> > > > > > -	/*
> > > > > > -	 * FIXME: the kernel headers are allowing the default value to
> > > > > > -	 * be passed, but the libva doesn't give us that.
> > > > > > -	 */
> > > > > > -	reg |= (slice->num_ref_idx_l0_active_minus1 & 0x1f) << 10;
> > > > > > -	reg |= (slice->num_ref_idx_l1_active_minus1 & 0x1f) << 5;
> > > > > > +	reg |= (pps->num_ref_idx_l0_default_active_minus1 & 0x1f) << 10;
> > > > > > +	reg |= (pps->num_ref_idx_l1_default_active_minus1 & 0x1f) << 5;
> > > > > > 
> > > > > >  	reg |= (pps->weighted_bipred_idc & 0x3) << 2;
> > > > > >  	if (pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE)
> > > > > >  	
> > > > > >  		reg |= VE_H264_PPS_ENTROPY_CODING_MODE;




