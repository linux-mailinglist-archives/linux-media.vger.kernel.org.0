Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9053F602C
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 17:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfKIQB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 11:01:56 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46324 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbfKIQB4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 11:01:56 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 19504290C12
Message-ID: <6f51f8a8422f7ed073fae246ef8d617e439cc814.camel@collabora.com>
Subject: Re: [PATCH v2 for 5.4 1/4] media: hantro: Fix s_fmt for dynamic
 resolution changes
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Date:   Sat, 09 Nov 2019 13:01:43 -0300
In-Reply-To: <92cba217-4f14-a397-2ae5-8797cc931703@xs4all.nl>
References: <20191007174505.10681-1-ezequiel@collabora.com>
         <20191007174505.10681-2-ezequiel@collabora.com>
         <20191108111950.717db5ce@collabora.com>
         <92cba217-4f14-a397-2ae5-8797cc931703@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, 2019-11-09 at 13:25 +0100, Hans Verkuil wrote:
> On 11/8/19 11:19 AM, Boris Brezillon wrote:
> > On Mon,  7 Oct 2019 14:45:02 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> wrote:
> > 
> > > Commit 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> > > changed the conditions under S_FMT was allowed for OUTPUT
> > > CAPTURE buffers.
> > > 
> > > However, and according to the mem-to-mem stateless decoder specification,
> > > in order to support dynamic resolution changes, S_FMT should be allowed
> > > even if OUTPUT buffers have been allocated.
> > > 
> > > Relax decoder S_FMT restrictions on OUTPUT buffers, allowing a resolution
> > > modification, provided the pixel format stays the same.
> > > 
> > > Tested on RK3288 platforms using ChromiumOS Video Decode/Encode Accelerator Unittests.
> > > 
> > > Fixes: 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > --
> > > v2:
> > > * Call try_fmt_out before using the format,
> > >   pointed out by Philipp.
> > > 
> > >  drivers/staging/media/hantro/hantro_v4l2.c | 28 +++++++++++++++-------
> > >  1 file changed, 19 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > > index 3dae52abb96c..586d243cc3cc 100644
> > > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > > @@ -367,19 +367,26 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
> > >  {
> > >  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> > >  	struct hantro_ctx *ctx = fh_to_ctx(priv);
> > > +	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > >  	const struct hantro_fmt *formats;
> > >  	unsigned int num_fmts;
> > > -	struct vb2_queue *vq;
> > >  	int ret;
> > >  
> > > -	/* Change not allowed if queue is busy. */
> > > -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > > -	if (vb2_is_busy(vq))
> > > -		return -EBUSY;
> > > +	ret = vidioc_try_fmt_out_mplane(file, priv, f);
> > > +	if (ret)
> > > +		return ret;
> > >  
> > >  	if (!hantro_is_encoder_ctx(ctx)) {
> > >  		struct vb2_queue *peer_vq;
> > >  
> > > +		/*
> > > +		 * In other to support dynamic resolution change,
> > 
> > 		      ^ order
> > 
> > > +		 * the decoder admits a resolution change, as long
> > > +		 * as the pixelformat remains. Can't be done if streaming.
> > > +		 */
> > > +		if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
> > > +		    pix_mp->pixelformat != ctx->src_fmt.pixelformat))
> > > +			return -EBUSY;
> > 
> > Sorry to chime in only now, but I'm currently looking at the VP9 spec
> > and it seems the resolution is allowed to change dynamically [1] (I
> > guess the same applies to VP8). IIU the spec correctly, coded frames
> > using the new resolution can reference decoded frames using the old
> > one (can be higher or lower res BTW). If we force a streamoff to change
> > the resolution (as seems to be the case here), we'll lose those ref
> > frames (see the hantro_return_bufs() in stop streaming), right?
> > Hans, Tomasz, any idea how this dynamic resolution change could/should
> > be supported?
> 
> As Tomasz also mentioned, supporting this is much more work, and probably
> requires new streaming ioctls.
> 
> In the meantime I think this patch is fine (with the typo fixed, I can do
> that), so is it OK if I merge this?
> 

Yes, please.

I originally posted this as a v5.4 fix, so it would be nice
if we can mark this as stable material.

Thanks,
Ezequiel

