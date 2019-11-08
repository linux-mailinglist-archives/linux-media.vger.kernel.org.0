Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E11CF4456
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 11:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbfKHKT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 05:19:58 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32984 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfKHKT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Nov 2019 05:19:58 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D8B0828EE5A;
        Fri,  8 Nov 2019 10:19:55 +0000 (GMT)
Date:   Fri, 8 Nov 2019 11:19:50 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
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
Message-ID: <20191108111950.717db5ce@collabora.com>
In-Reply-To: <20191007174505.10681-2-ezequiel@collabora.com>
References: <20191007174505.10681-1-ezequiel@collabora.com>
        <20191007174505.10681-2-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon,  7 Oct 2019 14:45:02 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> Commit 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> changed the conditions under S_FMT was allowed for OUTPUT
> CAPTURE buffers.
> 
> However, and according to the mem-to-mem stateless decoder specification,
> in order to support dynamic resolution changes, S_FMT should be allowed
> even if OUTPUT buffers have been allocated.
> 
> Relax decoder S_FMT restrictions on OUTPUT buffers, allowing a resolution
> modification, provided the pixel format stays the same.
> 
> Tested on RK3288 platforms using ChromiumOS Video Decode/Encode Accelerator Unittests.
> 
> Fixes: 953aaa1492c53 ("media: rockchip/vpu: Prepare things to support decoders")
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> --
> v2:
> * Call try_fmt_out before using the format,
>   pointed out by Philipp.
> 
>  drivers/staging/media/hantro/hantro_v4l2.c | 28 +++++++++++++++-------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 3dae52abb96c..586d243cc3cc 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -367,19 +367,26 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>  	struct hantro_ctx *ctx = fh_to_ctx(priv);
> +	struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>  	const struct hantro_fmt *formats;
>  	unsigned int num_fmts;
> -	struct vb2_queue *vq;
>  	int ret;
>  
> -	/* Change not allowed if queue is busy. */
> -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (vb2_is_busy(vq))
> -		return -EBUSY;
> +	ret = vidioc_try_fmt_out_mplane(file, priv, f);
> +	if (ret)
> +		return ret;
>  
>  	if (!hantro_is_encoder_ctx(ctx)) {
>  		struct vb2_queue *peer_vq;
>  
> +		/*
> +		 * In other to support dynamic resolution change,

		      ^ order

> +		 * the decoder admits a resolution change, as long
> +		 * as the pixelformat remains. Can't be done if streaming.
> +		 */
> +		if (vb2_is_streaming(vq) || (vb2_is_busy(vq) &&
> +		    pix_mp->pixelformat != ctx->src_fmt.pixelformat))
> +			return -EBUSY;

Sorry to chime in only now, but I'm currently looking at the VP9 spec
and it seems the resolution is allowed to change dynamically [1] (I
guess the same applies to VP8). IIU the spec correctly, coded frames
using the new resolution can reference decoded frames using the old
one (can be higher or lower res BTW). If we force a streamoff to change
the resolution (as seems to be the case here), we'll lose those ref
frames (see the hantro_return_bufs() in stop streaming), right?
Hans, Tomasz, any idea how this dynamic resolution change could/should
be supported?

>  		/*
>  		 * Since format change on the OUTPUT queue will reset
>  		 * the CAPTURE queue, we can't allow doing so
> @@ -389,12 +396,15 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
>  					  V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>  		if (vb2_is_busy(peer_vq))
>  			return -EBUSY;
> +	} else {
> +		/*
> +		 * The encoder doesn't admit a format change if
> +		 * there are OUTPUT buffers allocated.
> +		 */
> +		if (vb2_is_busy(vq))
> +			return -EBUSY;
>  	}
>  
> -	ret = vidioc_try_fmt_out_mplane(file, priv, f);
> -	if (ret)
> -		return ret;
> -
>  	formats = hantro_get_formats(ctx, &num_fmts);
>  	ctx->vpu_src_fmt = hantro_find_format(formats, num_fmts,
>  					      pix_mp->pixelformat);

[1] Section "5.16 Reference frame scaling" of
    https://storage.googleapis.com/downloads.webmproject.org/docs/vp9/vp9-bitstream-specification-v0.6-20160331-draft.pdf
