Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3500AB4DD
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 11:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392899AbfIFJ0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 05:26:19 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55235 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfIFJ0T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 05:26:19 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i6AVV-0003w1-Ob; Fri, 06 Sep 2019 11:26:17 +0200
Message-ID: <1567761976.6575.1.camel@pengutronix.de>
Subject: Re: [PATCH for 5.4] media: hantro: Fix s_fmt for dynamic resolution
 changes
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Date:   Fri, 06 Sep 2019 11:26:16 +0200
In-Reply-To: <93b49e964b1f9f5c799affd2ab5416a16f0dda23.camel@collabora.com>
References: <20190903171256.25052-1-ezequiel@collabora.com>
         <1567592011.3041.1.camel@pengutronix.de>
         <37bbd1b8ee7bb82c75aefb675e0c3ddd955dde0b.camel@collabora.com>
         <1567603704.3041.10.camel@pengutronix.de>
         <93b49e964b1f9f5c799affd2ab5416a16f0dda23.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 2019-09-05 at 15:00 -0300, Ezequiel Garcia wrote:
> On Wed, 2019-09-04 at 15:28 +0200, Philipp Zabel wrote:
> > On Wed, 2019-09-04 at 10:01 -0300, Ezequiel Garcia wrote:
> > > On Wed, 2019-09-04 at 12:13 +0200, Philipp Zabel wrote:
> > > > Hi Ezequiel,
> > > > 
> > > > On Tue, 2019-09-03 at 14:12 -0300, Ezequiel Garcia wrote:
> > > > > Commit 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> > > > > changed the conditions under S_FMT was allowed for OUTPUT
> > > > > CAPTURE buffers.
> > > > > 
> > > > > However, and according to the mem-to-mem stateless decoder specification,
> > > > > in order to support dynamic resolution changes, S_FMT should be allowed
> > > > > even if OUTPUT buffers have been allocated.
> > > > > 
> > > > > Relax decoder S_FMT restrictions on OUTPUT buffers, allowing a resolution
> > > > > modification, provided the pixel format stays the same.
> > > > > 
> > > > > Tested on RK3288 platforms using ChromiumOS Video Decode/Encode Accelerator Unittests.
> > > > > 
> > > > > Fixes: 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> > > > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > > > ---
> > > > >  drivers/staging/media/hantro/hantro_v4l2.c | 22 ++++++++++++++++------
> > > > >  1 file changed, 16 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > > > > index 3dae52abb96c..d48b548842cf 100644
> > > > > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > > > > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > > > > @@ -367,19 +367,22 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
> > > > >  {
> > > > >  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> > > > >  	struct hantro_ctx *ctx = fh_to_ctx(priv);
> > > > > +	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > > > >  	const struct hantro_fmt *formats;
> > > > >  	unsigned int num_fmts;
> > > > > -	struct vb2_queue *vq;
> > > > >  	int ret;
> > > > >  
> > > > > -	/* Change not allowed if queue is busy. */
> > > > > -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > > > > -	if (vb2_is_busy(vq))
> > > > > -		return -EBUSY;
> > > > > -
> > > > >  	if (!hantro_is_encoder_ctx(ctx)) {
> > > > >  		struct vb2_queue *peer_vq;
> > > > >  
> > > > > +		/*
> > > > > +		 * In other to support dynamic resolution change,
> > > > > +		 * the decoder admits a resolution change, as long
> > > > > +		 * as the pixelformat remains. Can't be done if streaming.
> > > > > +		 */
> > > > > +		if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
> > > > > +		    pix_mp->pixelformat != ctx->src_fmt.pixelformat))
> > > > 
> > > > Before using contents of the v4l2_format f for comparison, we should run
> > > > vidioc_try_fmt_out_mplane over it.
> > > 
> > > Right, good catch.
> > > 
> > > >  Also, besides pixelformat, sizeimage
> > > > shouldn't change either, at least if this is a VB2_MMAP queue.
> > > > 
> > > 
> > > This is the OUTPUT queue, so I don't see why the sizeimage
> > > of the coded buffers should stay the same. Maybe I'm missing
> > > something? 
> > 
> > If the OUTPUT vb2_queue is busy, we already have some buffers of the old
> > size allocated. We can't change their size dynamically with just
> > VIDIOC_S_FMT.
> > 
> > Maybe this should correct sizeimage to the old size instead of returning
> > -EBUSY? Either way, if the old buffer size is too small to reasonably
> > decode the new resolution, the OUTPUT buffers have to be reallocated.
> > 
> 
> Note that for a decoder, the OUTPUT side buffers are coded. Is there any
> straightforward correlation between the buffer size and the resolution?
>
> In other words, how does the driver figure out if the size is
> resonably large?

The decoded frame size seems like a reasonable upper bound at first, but
especially for formats like H.264 it is trivial to construct slices that
are larger than that with I_PCM macroblocks.

I think for H.264 some limit depending on profile and level can be
constructed from spec chapter A.3. "Levels", by looking at the rules for
the sum of NumBytesInNALunit, though not quite straightforward.

regards
Philipp
