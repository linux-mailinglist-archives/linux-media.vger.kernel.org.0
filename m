Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5CB7FC29F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 10:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfKNJcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 04:32:07 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47030 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfKNJcH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 04:32:07 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AACB2291544;
        Thu, 14 Nov 2019 09:32:03 +0000 (GMT)
Date:   Thu, 14 Nov 2019 10:32:00 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] media: hantro: Cleanup format negotiation
 helpers
Message-ID: <20191114103200.3c568c66@collabora.com>
In-Reply-To: <20191113175603.24742-2-ezequiel@collabora.com>
References: <20191113175603.24742-1-ezequiel@collabora.com>
        <20191113175603.24742-2-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 13 Nov 2019 14:56:01 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> Format negotiation helpers, hantro_find_format()
> and hantro_get_default_fmt() can be simplified,
> making the code a little bit clearer.
> 
> More importantly, this change is preparation work
> for the post-processor usage.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 53 ++++++++--------------
>  1 file changed, 20 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 3dae52abb96c..238e53b28f8f 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -47,23 +47,26 @@ hantro_get_formats(const struct hantro_ctx *ctx, unsigned int *num_fmts)
>  }
>  
>  static const struct hantro_fmt *
> -hantro_find_format(const struct hantro_fmt *formats, unsigned int num_fmts,
> -		   u32 fourcc)
> +hantro_find_format(const struct hantro_ctx *ctx, u32 fourcc)
>  {
> -	unsigned int i;
> +	const struct hantro_fmt *formats;
> +	unsigned int i, num_fmts;
>  
> +	formats = hantro_get_formats(ctx, &num_fmts);
>  	for (i = 0; i < num_fmts; i++)
>  		if (formats[i].fourcc == fourcc)
>  			return &formats[i];
> +
>  	return NULL;
>  }
>  
>  static const struct hantro_fmt *
> -hantro_get_default_fmt(const struct hantro_fmt *formats, unsigned int num_fmts,
> -		       bool bitstream)
> +hantro_get_default_fmt(const struct hantro_ctx *ctx, bool bitstream)
>  {
> -	unsigned int i;
> +	const struct hantro_fmt *formats;
> +	unsigned int i, num_fmts;
>  
> +	formats = hantro_get_formats(ctx, &num_fmts);
>  	for (i = 0; i < num_fmts; i++) {
>  		if (bitstream == (formats[i].codec_mode !=
>  				  HANTRO_MODE_NONE))
> @@ -89,8 +92,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
>  				  struct v4l2_frmsizeenum *fsize)
>  {
>  	struct hantro_ctx *ctx = fh_to_ctx(priv);
> -	const struct hantro_fmt *formats, *fmt;
> -	unsigned int num_fmts;
> +	const struct hantro_fmt *fmt;
>  
>  	if (fsize->index != 0) {
>  		vpu_debug(0, "invalid frame size index (expected 0, got %d)\n",
> @@ -98,8 +100,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
>  		return -EINVAL;
>  	}
>  
> -	formats = hantro_get_formats(ctx, &num_fmts);
> -	fmt = hantro_find_format(formats, num_fmts, fsize->pixel_format);
> +	fmt = hantro_find_format(ctx, fsize->pixel_format);
>  	if (!fmt) {
>  		vpu_debug(0, "unsupported bitstream format (%08x)\n",
>  			  fsize->pixel_format);
> @@ -196,8 +197,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
>  {
>  	struct hantro_ctx *ctx = fh_to_ctx(priv);
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> -	const struct hantro_fmt *formats, *fmt, *vpu_fmt;
> -	unsigned int num_fmts;
> +	const struct hantro_fmt *fmt, *vpu_fmt;
>  	bool coded;
>  
>  	coded = capture == hantro_is_encoder_ctx(ctx);
> @@ -208,10 +208,9 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
>  		  (pix_mp->pixelformat >> 16) & 0x7f,
>  		  (pix_mp->pixelformat >> 24) & 0x7f);
>  
> -	formats = hantro_get_formats(ctx, &num_fmts);
> -	fmt = hantro_find_format(formats, num_fmts, pix_mp->pixelformat);
> +	fmt = hantro_find_format(ctx, pix_mp->pixelformat);
>  	if (!fmt) {
> -		fmt = hantro_get_default_fmt(formats, num_fmts, coded);
> +		fmt = hantro_get_default_fmt(ctx, coded);
>  		f->fmt.pix_mp.pixelformat = fmt->fourcc;
>  	}
>  
> @@ -290,12 +289,10 @@ hantro_reset_fmt(struct v4l2_pix_format_mplane *fmt,
>  static void
>  hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
>  {
> -	const struct hantro_fmt *vpu_fmt, *formats;
> +	const struct hantro_fmt *vpu_fmt;
>  	struct v4l2_pix_format_mplane *fmt;
> -	unsigned int num_fmts;
>  
> -	formats = hantro_get_formats(ctx, &num_fmts);
> -	vpu_fmt = hantro_get_default_fmt(formats, num_fmts, true);
> +	vpu_fmt = hantro_get_default_fmt(ctx, true);
>  
>  	if (hantro_is_encoder_ctx(ctx)) {
>  		ctx->vpu_dst_fmt = vpu_fmt;
> @@ -316,12 +313,10 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
>  static void
>  hantro_reset_raw_fmt(struct hantro_ctx *ctx)
>  {
> -	const struct hantro_fmt *raw_vpu_fmt, *formats;
> +	const struct hantro_fmt *raw_vpu_fmt;
>  	struct v4l2_pix_format_mplane *raw_fmt, *encoded_fmt;
> -	unsigned int num_fmts;
>  
> -	formats = hantro_get_formats(ctx, &num_fmts);
> -	raw_vpu_fmt = hantro_get_default_fmt(formats, num_fmts, false);
> +	raw_vpu_fmt = hantro_get_default_fmt(ctx, false);
>  
>  	if (hantro_is_encoder_ctx(ctx)) {
>  		ctx->vpu_src_fmt = raw_vpu_fmt;
> @@ -367,8 +362,6 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>  	struct hantro_ctx *ctx = fh_to_ctx(priv);
> -	const struct hantro_fmt *formats;
> -	unsigned int num_fmts;
>  	struct vb2_queue *vq;
>  	int ret;
>  
> @@ -395,9 +388,7 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
>  	if (ret)
>  		return ret;
>  
> -	formats = hantro_get_formats(ctx, &num_fmts);
> -	ctx->vpu_src_fmt = hantro_find_format(formats, num_fmts,
> -					      pix_mp->pixelformat);
> +	ctx->vpu_src_fmt = hantro_find_format(ctx, pix_mp->pixelformat);
>  	ctx->src_fmt = *pix_mp;
>  
>  	/*
> @@ -431,9 +422,7 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>  	struct hantro_ctx *ctx = fh_to_ctx(priv);
> -	const struct hantro_fmt *formats;
>  	struct vb2_queue *vq;
> -	unsigned int num_fmts;
>  	int ret;
>  
>  	/* Change not allowed if queue is busy. */
> @@ -462,9 +451,7 @@ static int vidioc_s_fmt_cap_mplane(struct file *file, void *priv,
>  	if (ret)
>  		return ret;
>  
> -	formats = hantro_get_formats(ctx, &num_fmts);
> -	ctx->vpu_dst_fmt = hantro_find_format(formats, num_fmts,
> -					      pix_mp->pixelformat);
> +	ctx->vpu_dst_fmt = hantro_find_format(ctx, pix_mp->pixelformat);
>  	ctx->dst_fmt = *pix_mp;
>  
>  	/*

