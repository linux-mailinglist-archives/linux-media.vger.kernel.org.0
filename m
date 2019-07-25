Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4E507476A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 08:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfGYGmf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 02:42:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40916 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbfGYGmf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 02:42:35 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5AB58285323;
        Thu, 25 Jul 2019 07:42:32 +0100 (BST)
Date:   Thu, 25 Jul 2019 08:42:28 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Message-ID: <20190725084228.2306171e@collabora.com>
In-Reply-To: <20190705191618.3467c417@collabora.com>
References: <20190703122849.6316-1-boris.brezillon@collabora.com>
        <20190703122849.6316-2-boris.brezillon@collabora.com>
        <2f836ff0ce9ea68329a81e83109e53e24f7783c6.camel@collabora.com>
        <20190705191618.3467c417@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 5 Jul 2019 19:16:18 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 05 Jul 2019 13:40:03 -0300
> Ezequiel Garcia <ezequiel@collabora.com> wrote:
> 
> > Hi Boris, Paul,
> > 
> > On Wed, 2019-07-03 at 14:28 +0200, Boris Brezillon wrote:  
> > > Looks like some stateless decoders expect slices to be prefixed with
> > > ANNEX B start codes (they most likely do some kind of bitstream parsing
> > > and/or need that to delimit slices when doing per frame decoding).
> > > Since skipping those start codes for dummy stateless decoders (those
> > > expecting all params to be passed through controls) should be pretty
> > > easy, let's mandate that all slices be prepended with ANNEX B start
> > > codes.
> > > 
> > > If we ever need to support AVC headers, we can add a new menu control
> > > to select the type of NAL header to use.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > ---
> > > Changes in v3:
> > > * Add Paul's R-b
> > > 
> > > Changes in v2:
> > > * None
> > > ---
> > >  Documentation/media/uapi/v4l/ext-ctrls-codec.rst | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > index 7a1947f5be96..3ae1367806cf 100644
> > > --- a/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > +++ b/Documentation/media/uapi/v4l/ext-ctrls-codec.rst
> > > @@ -1726,6 +1726,7 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> > >      :ref:`h264`, section 7.4.3 "Slice Header Semantics". For further
> > >      documentation, refer to the above specification, unless there is
> > >      an explicit comment stating otherwise.
> > > +    All slices should be prepended with an ANNEX B start code.
> > >      
> > 
> > Currently, the H264 slice V4L2_PIX_FMT_H264_SLICE_RAW,
> > is specified to _not_ contain the ANNEX B start code.  
> 
> Yep, we should provably rename the format.

Paul, are you okay with this rename?

s/V4L2_PIX_FMT_H264_SLICE_RAW/V4L2_PIX_FMT_H264_SLICE/

or

s/V4L2_PIX_FMT_H264_SLICE_RAW/V4L2_PIX_FMT_H264_SLICE_ANNEXB/

I'd also to discuss some concerns Ezequiel and I have regarding this
change. Some (most?) codec have alignment constraints on the buffer
they pass to the HW. For HW that support Annex B parsing, that's no
problem because the start of the buffer will be aligned on a page (I'm
assuming page alignment should cover 99% of the alignment constraints).
But HW that need to skip the start code will have to pass a non-aligned
buffer (annex B start code is 3 byte long).
Paul looked at the Cedrus driver and thinks it can be handled correctly
thanks to the VE_H264_VLD_OFFSET field (which encodes an offset in bit),
but I fear this might be a problem on other HW.

So, I'm asking again, are we sure we want to handle the raw (no start
code) and annex-b cases using the same pixel format? If we do, what's
the plan to address those potential alignment constraints? Should
we provide a way for userspace to define where the start-code ends so it
can align things properly (annex B can be extended with extra 00
bytes at the beginning)? If we do that, that means userspace has to
know about those alignment constraints, or take something big enough.
Another option would be to use a bounce buffer when things are not
aligned properly.

I'd really like to get feedback on those points before sending a v4.
