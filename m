Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFC3F6116
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 20:13:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfKITNi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 14:13:38 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47328 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbfKITNi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 14:13:38 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BD13D28E979;
        Sat,  9 Nov 2019 19:13:35 +0000 (GMT)
Date:   Sat, 9 Nov 2019 20:13:33 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 for 5.4 1/4] media: hantro: Fix s_fmt for dynamic
 resolution changes
Message-ID: <20191109201333.4dc63e0e@collabora.com>
In-Reply-To: <92cba217-4f14-a397-2ae5-8797cc931703@xs4all.nl>
References: <20191007174505.10681-1-ezequiel@collabora.com>
        <20191007174505.10681-2-ezequiel@collabora.com>
        <20191108111950.717db5ce@collabora.com>
        <92cba217-4f14-a397-2ae5-8797cc931703@xs4all.nl>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, 9 Nov 2019 13:25:18 +0100
Hans Verkuil <hverkuil@xs4all.nl> wrote:

> On 11/8/19 11:19 AM, Boris Brezillon wrote:
> > On Mon,  7 Oct 2019 14:45:02 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> wrote:
> >   
> >> Commit 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> >> changed the conditions under S_FMT was allowed for OUTPUT
> >> CAPTURE buffers.
> >>
> >> However, and according to the mem-to-mem stateless decoder specification,
> >> in order to support dynamic resolution changes, S_FMT should be allowed
> >> even if OUTPUT buffers have been allocated.
> >>
> >> Relax decoder S_FMT restrictions on OUTPUT buffers, allowing a resolution
> >> modification, provided the pixel format stays the same.
> >>
> >> Tested on RK3288 platforms using ChromiumOS Video Decode/Encode Accelerator Unittests.
> >>
> >> Fixes: 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> >> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> >> --
> >> v2:
> >> * Call try_fmt_out before using the format,
> >>   pointed out by Philipp.
> >>
> >>  drivers/staging/media/hantro/hantro_v4l2.c | 28 +++++++++++++++-------
> >>  1 file changed, 19 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> >> index 3dae52abb96c..586d243cc3cc 100644
> >> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> >> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> >> @@ -367,19 +367,26 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
> >>  {
> >>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> >>  	struct hantro_ctx *ctx = fh_to_ctx(priv);
> >> +	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> >>  	const struct hantro_fmt *formats;
> >>  	unsigned int num_fmts;
> >> -	struct vb2_queue *vq;
> >>  	int ret;
> >>  
> >> -	/* Change not allowed if queue is busy. */
> >> -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> >> -	if (vb2_is_busy(vq))
> >> -		return -EBUSY;
> >> +	ret = vidioc_try_fmt_out_mplane(file, priv, f);
> >> +	if (ret)
> >> +		return ret;
> >>  
> >>  	if (!hantro_is_encoder_ctx(ctx)) {
> >>  		struct vb2_queue *peer_vq;
> >>  
> >> +		/*
> >> +		 * In other to support dynamic resolution change,  
> > 
> > 		      ^ order
> >   
> >> +		 * the decoder admits a resolution change, as long
> >> +		 * as the pixelformat remains. Can't be done if streaming.
> >> +		 */
> >> +		if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
> >> +		    pix_mp->pixelformat != ctx->src_fmt.pixelformat))
> >> +			return -EBUSY;  
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

Sure, go ahead, here's my

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

in case you haven't applied the patch already.

Oh, BTW, it wasn't clear in my previous reply, but I didn't intend to
block this patch with my VP9 concerns. My only motivation was to start
a discussion on how to solve my specific issue ;-).
