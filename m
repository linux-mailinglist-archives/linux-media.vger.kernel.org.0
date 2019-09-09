Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1D8DAD3DE
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 09:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387889AbfIIHaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 03:30:11 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49065 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbfIIHaL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 03:30:11 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i7E7l-0004tQ-L5; Mon, 09 Sep 2019 09:30:09 +0200
Message-ID: <1568014207.2956.1.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] media: uapi: h264: Add
 num_ref_idx_active_override_flag
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Sasha Hauer <kernel@pengutronix.de>
Date:   Mon, 09 Sep 2019 09:30:07 +0200
In-Reply-To: <CAAFQd5Dv3VhybM5qZHQCBgRQmpLrS1Pi1rmwRnt59q9mRUUTjw@mail.gmail.com>
References: <20190905101533.525-1-p.zabel@pengutronix.de>
         <CAHD77H=q48Zx=dWMOMT527au8FzKZdQ9SrRr4sos8oNfCeCzQw@mail.gmail.com>
         <1567679973.3958.1.camel@pengutronix.de>
         <cb118783713af210b3ac8a87d00b62dc83cc9c08.camel@collabora.com>
         <CAAFQd5Dv3VhybM5qZHQCBgRQmpLrS1Pi1rmwRnt59q9mRUUTjw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-09-09 at 16:09 +0900, Tomasz Figa wrote:
> On Thu, Sep 5, 2019 at 11:17 PM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> > 
> > Le jeudi 05 septembre 2019 à 12:39 +0200, Philipp Zabel a écrit :
> > > On Thu, 2019-09-05 at 19:31 +0900, Tomasz Figa wrote:
> > > > On Thu, Sep 5, 2019 at 7:15 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > > > > This flag tells the kernel whether the slice header contained the
> > > > > num_ref_idx_l[01]_active_minus1 syntax elements, or whether the
> > > > > num_ref_idx_l[01]_default_active_minus1 from PPS should be used
> > > > > instead.
> > > > > 
> > > > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > > > ---
> > > > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 3 +++
> > > > >  include/media/h264-ctrls.h                       | 1 +
> > > > >  2 files changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > index bc5dd8e76567..451a5b0f2a35 100644
> > > > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > > > @@ -1860,6 +1860,9 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > > > >      * - ``V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH``
> > > > >        - 0x00000008
> > > > >        -
> > > > > +    * - ``V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE
> > > > > +      - 0x00000010
> > > > > +      - Corresponds to the num_ref_idx_active_override_flag syntax element.
> > > > > 
> > > > 
> > > > As far as I remember, the idea was for the userspace to always put the
> > > > right num_ref_idx in the slice_params and the drivers always use that.
> > > > Was there any problem with that?
> > > 
> > > I don't think so, at least for currently known hardware.
> > > 
> > > In that case we should drop the unused
> > > num_ref_idx_l[01]_default_active_minus1 fields from struct
> > > v4l2_ctrl_h264_pps and document that userspace should fill
> > > the defaults into v4l2_ctrl_h264_slice_params themselves if
> > > num_ref_idx_active_override_flag wasn't set.
> > 
> > It might have been added in a previous effort to allow reconstructing
> > the bitstream from the structures.
> 
> Wouldn't one still be able to reconstruct a valid (but not exact)
> stream without that flag, given the assumption above?

If the Hantro G1, as appears to be the case, parses the slice header and
decides itself whether to use the override from the slice or the default
that was written to a register, it needs the
num_ref_idx_l[01]_default_active_minus1 field to fill the register, but
doesn't need either the num_ref_idx_l[01]_active_minus1 override nor the
flag.

A decoder that doesn't parse the slice header can always be told to use
the override (thus no need to have the flag in the uapi), if userspace
fills the default into the override fields as a fallback. Such a decoder
does need the num_ref_idx_l[01]_active_minus1 override, but doesn't need
the num_ref_idx_l[01]_default_active_minus1 field nor the flag.

That is my current understanding of the intention behind this interface,
I hope this is accurate.
I've tried to make the docs reflect this in ("media: uapi: h264: clarify
num_ref_idx_l[01]_(default_)active fields") [1].

[1] https://lore.kernel.org/linux-media/20190905114210.9232-1-p.zabel@pengutronix.de/T/#u

regards
Philipp
