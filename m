Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854BE44C34E
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 15:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhKJOsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 09:48:53 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53786 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbhKJOsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 09:48:53 -0500
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67F553F6;
        Wed, 10 Nov 2021 15:46:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636555564;
        bh=9rd+smdfP0lTi1pX33UnXja99WdOKHn9pwb8GOgT/OM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LxAnRGh0/3E/BpgKn+BOH0ei7gec68wJDqR5pdWa3A/8d3YtAyq3x7wBGNpfVTvQ2
         7jwYY1NM66eFxRPJ8q99cMoDTSFVm7nHvMr5SN4GaRh/tYNgCiOKJjS7xpr+pFHRoE
         H2ofdqy9kOb8IfNQ+sQAM+Y1faFJtJ8G+c3/566Y=
Date:   Wed, 10 Nov 2021 16:45:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        hverkuil@xs4all.nl, dafna3@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org
Subject: Re: [PATCH 1/2] media: replace setting of bytesused with
 vb2_set_plane_payload
Message-ID: <YYvbGL3b9celkMId@pendragon.ideasonboard.com>
References: <20211108193933.20369-1-dafna.hirschfeld@collabora.com>
 <20211108193933.20369-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211108193933.20369-2-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Mon, Nov 08, 2021 at 09:39:32PM +0200, Dafna Hirschfeld wrote:
> In many places the bytesused field of struct vb2_buffer is set
> directly. Replace that with the function call
> vb2_set_plane_payload
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/allegro-dvt/allegro-core.c  |  2 +-
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 10 +++++-----
>  drivers/media/test-drivers/vicodec/vicodec-core.c  |  2 +-
>  drivers/media/usb/go7007/go7007-driver.c           |  2 +-
>  drivers/staging/media/meson/vdec/vdec_helpers.c    | 10 +++++-----
>  5 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
> index c8156da33043..4a3d06c70e34 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/allegro-core.c
> @@ -2815,7 +2815,7 @@ static void allegro_buf_queue(struct vb2_buffer *vb)
>  		unsigned int i;
>  
>  		for (i = 0; i < vb->num_planes; i++)
> -			vb->planes[i].bytesused = 0;
> +			vb2_set_plane_payload(vb, i, 0);
>  
>  		vbuf->field = V4L2_FIELD_NONE;
>  		vbuf->sequence = channel->csequence++;
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 7457451ebff0..3a8d19243d41 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -959,7 +959,7 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
>  
>  	if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>  		while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
> -			dst_buf->vb2_buf.planes[0].bytesused = 0;
> +			vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
>  			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>  		}
>  		/* STREAMOFF on the CAPTURE queue completes any ongoing flush */
> @@ -1068,7 +1068,7 @@ static int mtk_venc_encode_header(void *priv)
>  			NULL, &bs_buf, &enc_result);
>  
>  	if (ret) {
> -		dst_buf->vb2_buf.planes[0].bytesused = 0;
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
>  		ctx->state = MTK_STATE_ABORT;
>  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>  		mtk_v4l2_err("venc_if_encode failed=%d", ret);
> @@ -1083,7 +1083,7 @@ static int mtk_venc_encode_header(void *priv)
>  	}
>  
>  	ctx->state = MTK_STATE_HEADER;
> -	dst_buf->vb2_buf.planes[0].bytesused = enc_result.bs_size;
> +	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, enc_result.bs_size);
>  	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
>  
>  	return 0;
> @@ -1232,12 +1232,12 @@ static void mtk_venc_worker(struct work_struct *work)
>  
>  	if (ret) {
>  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> -		dst_buf->vb2_buf.planes[0].bytesused = 0;
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
>  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>  		mtk_v4l2_err("venc_if_encode failed=%d", ret);
>  	} else {
>  		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
> -		dst_buf->vb2_buf.planes[0].bytesused = enc_result.bs_size;
> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, enc_result.bs_size);
>  		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
>  		mtk_v4l2_debug(2, "venc_if_encode bs size=%d",
>  				 enc_result.bs_size);
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> index 33f1c893c1b6..be43f7d32df9 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -1443,7 +1443,7 @@ static void vicodec_buf_queue(struct vb2_buffer *vb)
>  		unsigned int i;
>  
>  		for (i = 0; i < vb->num_planes; i++)
> -			vb->planes[i].bytesused = 0;
> +			vb2_set_plane_payload(vb, i, 0);
>  
>  		vbuf->field = V4L2_FIELD_NONE;
>  		vbuf->sequence =
> diff --git a/drivers/media/usb/go7007/go7007-driver.c b/drivers/media/usb/go7007/go7007-driver.c
> index 6650eab913d8..0c24e2984304 100644
> --- a/drivers/media/usb/go7007/go7007-driver.c
> +++ b/drivers/media/usb/go7007/go7007-driver.c
> @@ -516,7 +516,7 @@ void go7007_parse_video_stream(struct go7007 *go, u8 *buf, int length)
>  		if (vb && vb->vb.vb2_buf.planes[0].bytesused >=
>  				GO7007_BUF_SIZE - 3) {
>  			v4l2_info(&go->v4l2_dev, "dropping oversized frame\n");
> -			vb->vb.vb2_buf.planes[0].bytesused = 0;
> +			vb2_set_plane_payload(&vb->vb.vb2_buf, 0, 0);
>  			vb->frame_offset = 0;
>  			vb->modet_active = 0;
>  			vb = go->active_buf = NULL;
> diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> index b9125c295d1d..1ade7485d5a6 100644
> --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> @@ -276,13 +276,13 @@ static void dst_buf_done(struct amvdec_session *sess,
>  
>  	switch (sess->pixfmt_cap) {
>  	case V4L2_PIX_FMT_NV12M:
> -		vbuf->vb2_buf.planes[0].bytesused = output_size;
> -		vbuf->vb2_buf.planes[1].bytesused = output_size / 2;
> +		vb2_set_plane_payload(vbuf->vb2_buf, 0, output_size);
> +		vb2_set_plane_payload(vbuf->vb2_buf, 1, output_size / 2);
>  		break;
>  	case V4L2_PIX_FMT_YUV420M:
> -		vbuf->vb2_buf.planes[0].bytesused = output_size;
> -		vbuf->vb2_buf.planes[1].bytesused = output_size / 4;
> -		vbuf->vb2_buf.planes[2].bytesused = output_size / 4;
> +		vb2_set_plane_payload(vbuf->vb2_buf, 0, output_size);
> +		vb2_set_plane_payload(vbuf->vb2_buf, 1, output_size / 4);
> +		vb2_set_plane_payload(vbuf->vb2_buf, 2, output_size / 4);
>  		break;
>  	}
>  

-- 
Regards,

Laurent Pinchart
