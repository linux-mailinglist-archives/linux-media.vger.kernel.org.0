Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35EF2221A7
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 13:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgGPLne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 07:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgGPLnd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 07:43:33 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2484C061755;
        Thu, 16 Jul 2020 04:43:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id DB7AC2A551A
Message-ID: <6e61d98bd8d7a6d41daf0edd449bd27558c0ac16.camel@collabora.com>
Subject: Re: [PATCH 02/10] media: uapi: h264: Further clarify scaling lists
 order
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Thu, 16 Jul 2020 08:43:22 -0300
In-Reply-To: <bfb5d0df-779f-78d2-fc48-3c6056f5fdd3@xs4all.nl>
References: <20200715202233.185680-1-ezequiel@collabora.com>
         <20200715202233.185680-3-ezequiel@collabora.com>
         <bfb5d0df-779f-78d2-fc48-3c6056f5fdd3@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2020-07-16 at 09:23 +0200, Hans Verkuil wrote:
> On 15/07/2020 22:22, Ezequiel Garcia wrote:
> > Commit 0b0393d59eb4a ("media: uapi: h264: clarify
> > expected scaling_list_4x4/8x8 order") improved the
> > documentation on H264 scaling lists order.
> > 
> > This commit improves the documentation by clarifying
> > that the lists themselves are expected in matrix order.
> 
> "matrix order" is not a well defined term. Especially since different
> programming languages lay out matrices differently (e.g. fortran uses
> column-major order). Perhaps something like this is more unambiguous:
> 

Agreed, "matrix order" is perhaps not a proper choice of words.

> "The values on each scaling list are in row-major order."
> 
> BTW, why not be explicit and use:
> 
> __u8 scaling_list_4x4[6][4][4];
> __u8 scaling_list_8x8[6][8][8];
> 
> That makes it explicit and the order is just that of what the C language
> uses.
> 

I am not sure if that'll go in clearer direction.

I'm thinking we just need to clarify the coefficients
are in raster scan order, as opposed to a zig-zag scan
order, which is a part of the decoding process.

How about we simply say "raster scan order" and keep the patch as is?

Thanks,
Ezequiel


> Regards,
> 
> 	Hans
> 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > index c2e17c02f77e..16bfc98ab2f6 100644
> > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > @@ -1725,12 +1725,14 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
> >        - ``scaling_list_4x4[6][16]``
> >        - Scaling matrix after applying the inverse scanning process.
> >          Expected list order is Intra Y, Intra Cb, Intra Cr, Inter Y,
> > -        Inter Cb, Inter Cr.
> > +        Inter Cb, Inter Cr. The values on each scaling list are
> > +        expected in matrix order.
> >      * - __u8
> >        - ``scaling_list_8x8[6][64]``
> >        - Scaling matrix after applying the inverse scanning process.
> >          Expected list order is Intra Y, Inter Y, Intra Cb, Inter Cb,
> > -        Intra Cr, Inter Cr.
> > +        Intra Cr, Inter Cr. The values on each scaling list are
> > +        expected in matrix order.
> >  
> >  ``V4L2_CID_MPEG_VIDEO_H264_SLICE_PARAMS (struct)``
> >      Specifies the slice parameters (as extracted from the bitstream)
> > 


