Return-Path: <linux-media+bounces-21109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A969C1747
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7221C21363
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 07:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AFC1D27B9;
	Fri,  8 Nov 2024 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f7YLAB70"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353CF1D2239
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731052165; cv=none; b=Q+M3d7fMvb+1YYLB65fEW5pbZoknMwd16saLhruT7DwhPVb6oAqtOdRgfY7NX7htg7tBHs/MV8jxaKGT6Vh8NEbigUsJPb4p5XtseRGrz+DhicaLAaB8bgpb1ThREx3lT1J9U6J5I4uFxaKD/dufqs43SHHAL20m1jrJPkFpgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731052165; c=relaxed/simple;
	bh=UJyWxUiU966c/9UYt51MTQxtXPey5UmDD13GsxMO8As=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arXhW5lqYco6ZmNAPqJ0WEON7PrvcgXMyU9IqgFgJCgZc8QMfXLUw0qwkjMA3W22WHG08hDdyVTOJQ/59pV1J7DNAK+GYEYCIqnI6Z28xpPP4JC4C/4d+6lhG4YTJFlUMrZKEiKFnnQt+yQuhQSzDWfY5C7611ScdfjQb1YVIrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f7YLAB70; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so2188665e87.0
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 23:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731052161; x=1731656961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inSl2LXSnA6LakxEcjIITqT5bHfmHdmvXPhl5iATLD4=;
        b=f7YLAB70W+ltxjawOrAUFuwFXFnjtJZw5nFKHcJ/Q0vzuKlSLQlsO5R/IdwljG+OYS
         bU6Grfb4bAQlbUC9IeoG9AbB6TVFY4ebmujHqV8IgxIJ4Eqr5fsX1kvGjkeDPG2HsypK
         DwvKL42BbZ3ZZ5FsV3sjCTwEDiuZkiodtiZMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731052161; x=1731656961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inSl2LXSnA6LakxEcjIITqT5bHfmHdmvXPhl5iATLD4=;
        b=DvtDTipAaMh2mRDbY2dCScOrqGi8BO+UwvbJg5gXpenF1gxujFYhad/Q9pg9TYgxVi
         /LYUvjhoKaT48MskhF0mky/vYG1BFlUKnQu/mANukxS047kRwh48A87ty4bYHLtd/h7z
         tSIj0iQox/eL2gJ7zzu6usikfo2nHL/OC6XZJAzfKtXdzq8xvEdWzVfpOyqpuVPLGyCM
         efx/MG/iAuPzBFz18Ih48Vr963LnLkb9//xYkXt4kyD6hZprLyHFyRd7Td4llAY9NBvJ
         bOuTo2CYse++vWqHrqTE671W5JqbXSiUfdXERNG6cp4mQkYjK7U6O3iV1H+6prbApH72
         jnoA==
X-Forwarded-Encrypted: i=1; AJvYcCVzOwnd0FINmSsof4vxzH4j65Y84jczs0/YaL6dFM2DRdw0uOW8OXq1tMydv4OAuJE1oigRr/3x+wOR7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4KaZyfUpqZ4ENY6NPU4uMEqpltr45V4+wZyFoNeY/cf+wEahi
	+aPEKfPwF7erbXUxYwcMZFH9u+6VQW62xo/NIzlex87AJoKn5eAqPxE9qav95Yr671Tr+uCTSm3
	0jAc9U3ML76RWrjB/MGv7/+1dtIYZ9yMDlPtP
X-Google-Smtp-Source: AGHT+IEMxjZ29kr7w4gGw2GXi0bm5I2t4B2M7gZdp/iq+Lk9fzENF+WOjxHRqhOJUJncl3Sul3MhaxU/iVwzMWBdh+8=
X-Received: by 2002:a05:6512:224f:b0:535:6a4d:ed74 with SMTP id
 2adb3069b0e04-53d8627953dmr790242e87.51.1731052161196; Thu, 07 Nov 2024
 23:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108033219.19804-1-yunfei.dong@mediatek.com> <20241108033219.19804-2-yunfei.dong@mediatek.com>
In-Reply-To: <20241108033219.19804-2-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 8 Nov 2024 15:49:09 +0800
Message-ID: <CAGXv+5Eyyyvv-1a+eH=xQyL0LaBmjqy0dvOUeiBS2RsuWSdshA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] media: mediatek: vcodec: setting request complete
 before buffer done
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 11:32=E2=80=AFAM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> The request status of output queue is set to MEDIA_REQUEST_STATE_COMPLETE
> when user space dequeue output buffer. Will get below warning if the
> driver calling v4l2_ctrl_request_complete to set media request complete,
> must to change the function order, calling v4l2_ctrl_request_complete
> before v4l2_m2m_buf_done.
>
> Workqueue: core-decoder vdec_msg_queue_core_work [mtk_vcodec_dec]
> pstate: 80c00089 (Nzcv daIf +PAN +UAO -TCO BTYPE=3D--)
> pc : media_request_object_bind+0xa8/0x124
> lr : media_request_object_bind+0x50/0x124
> sp : ffffffc011393be0
> x29: ffffffc011393be0 x28: 0000000000000000
> x27: ffffff890c280248 x26: ffffffe21a71ab88
> x25: 0000000000000000 x24: ffffff890c280280
> x23: ffffff890c280280 x22: 00000000fffffff0
> x21: 0000000000000000 x20: ffffff890260d280
> x19: ffffff890260d2e8 x18: 0000000000001000
> x17: 0000000000000400 x16: ffffffe21a4584a0
> x15: 000000000053361d x14: 0000000000000018
> x13: 0000000000000004 x12: ffffffa82427d000
> x11: ffffffe21ac3fce0 x10: 0000000000000001
> x9 : 0000000000000000 x8 : 0000000000000003
> x7 : 0000000000000000 x6 : 000000000000003f
> x5 : 0000000000000040 x4 : ffffff89052e7b98
> x3 : 0000000000000000 x2 : 0000000000000001
> x1 : 0000000000000000 x0 : 0000000000000000
> Call trace:
>  media_request_object_bind+0xa8/0x124
>  v4l2_ctrl_request_bind+0xc4/0x168
>  v4l2_ctrl_request_complete+0x198/0x1f4
>  mtk_vdec_stateless_cap_to_disp+0x58/0x8c [mtk_vcodec_dec 245a7c1e48ff1b2=
451a50e1dfcb174262b6b462c]
>  vdec_vp9_slice_core_decode+0x1c0/0x268 [mtk_vcodec_dec 245a7c1e48ff1b245=
1a50e1dfcb174262b6b462c]
>  vdec_msg_queue_core_work+0x60/0x11c [mtk_vcodec_dec 245a7c1e48ff1b2451a5=
0e1dfcb174262b6b462c]
>  process_one_work+0x140/0x480
>  worker_thread+0x12c/0x2f8
>  kthread+0x13c/0x1d8
>  ret_from_fork+0x10/0x30
>
> Fixes: 7b182b8d9c852 ("media: mediatek: vcodec: Refactor get and put capt=
ure buffer flow")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

The changes look OK, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c    |  4 ++--
>  .../vcodec/decoder/mtk_vcodec_dec_drv.h         |  2 +-
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 17 ++++++++++++-----
>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c   |  7 ++++---
>  .../decoder/vdec/vdec_h264_req_multi_if.c       |  4 ++--
>  .../decoder/vdec/vdec_hevc_req_multi_if.c       |  4 ++--
>  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   |  6 +++---
>  .../mediatek/vcodec/decoder/vdec_msg_queue.h    |  4 ++--
>  8 files changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index 98838217b97d..2b787e60a1f9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -887,10 +887,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q=
)
>                         if (src_buf !=3D &ctx->empty_flush_buf.vb) {
>                                 struct media_request *req =3D
>                                         src_buf->vb2_buf.req_obj.req;
> -                               v4l2_m2m_buf_done(src_buf,
> -                                               VB2_BUF_STATE_ERROR);
> +
>                                 if (req)
>                                         v4l2_ctrl_request_complete(req, &=
ctx->ctrl_hdl);
> +                               v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_=
ERROR);
>                         }
>                 }
>                 return;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index ac568ed14fa2..1fabe8c5b7a4 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -111,7 +111,7 @@ struct mtk_vcodec_dec_pdata {
>         int (*flush_decoder)(struct mtk_vcodec_dec_ctx *ctx);
>         struct vdec_fb *(*get_cap_buffer)(struct mtk_vcodec_dec_ctx *ctx)=
;
>         void (*cap_to_disp)(struct mtk_vcodec_dec_ctx *ctx, int error,
> -                           struct media_request *src_buf_req);
> +                           struct vb2_v4l2_buffer *vb2_v4l2_src);
>
>         const struct vb2_ops *vdec_vb2_ops;
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index afa224da0f41..750f98c1226d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -245,10 +245,11 @@ static const struct v4l2_frmsize_stepwise stepwise_=
fhd =3D {
>  };
>
>  static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ct=
x, int error,
> -                                          struct media_request *src_buf_=
req)
> +                                          struct vb2_v4l2_buffer *vb2_v4=
l2_src)
>  {
>         struct vb2_v4l2_buffer *vb2_dst;
>         enum vb2_buffer_state state;
> +       struct media_request *src_buf_req;
>
>         if (error)
>                 state =3D VB2_BUF_STATE_ERROR;
> @@ -264,8 +265,16 @@ static void mtk_vdec_stateless_cap_to_disp(struct mt=
k_vcodec_dec_ctx *ctx, int e
>                 mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
>         }
>
> +       if (!vb2_v4l2_src) {
> +               mtk_v4l2_vdec_err(ctx, "get src buffer NULL");
> +               return;
> +       }
> +
> +       src_buf_req =3D vb2_v4l2_src->vb2_buf.req_obj.req;
>         if (src_buf_req)
>                 v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +
> +       v4l2_m2m_buf_done(vb2_v4l2_src, state);
>  }
>
>  static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ct=
x)
> @@ -374,14 +383,12 @@ static void mtk_vdec_worker(struct work_struct *wor=
k)
>         state =3D ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
>         if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
>             ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAME) {
> -               v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m=
2m_ctx, state);
>                 if (src_buf_req)
>                         v4l2_ctrl_request_complete(src_buf_req, &ctx->ctr=
l_hdl);
> +               v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m=
2m_ctx, state);
>         } else {
> -               if (ret !=3D -EAGAIN) {
> +               if (ret !=3D -EAGAIN)
>                         v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> -                       v4l2_m2m_buf_done(vb2_v4l2_src, state);
> -               }
>                 v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>         }

At some point I think we should unify the assumptions of the VP8,
pure single core and lat decode functions so that we don't have all
these different code paths.

ChenYu


>  }
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index bf21f2467a0f..90217cc8e242 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -1071,7 +1071,8 @@ static int vdec_av1_slice_setup_lat_from_src_buf(st=
ruct vdec_av1_slice_instance
>         if (!src)
>                 return -EINVAL;
>
> -       lat_buf->src_buf_req =3D src->vb2_buf.req_obj.req;
> +       lat_buf->vb2_v4l2_src =3D src;
> +
>         dst =3D &lat_buf->ts_info;
>         v4l2_m2m_buf_copy_metadata(src, dst, true);
>         vsi->frame.cur_ts =3D dst->vb2_buf.timestamp;
> @@ -2195,7 +2196,7 @@ static int vdec_av1_slice_core_decode(struct vdec_l=
at_buf *lat_buf)
>                        &instance->core_vsi->trans.dma_addr_end);
>         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, instance->core_vs=
i->trans.dma_addr_end);
>
> -       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
> +       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->vb2_v4l2_src);
>
>         return 0;
>
> @@ -2204,7 +2205,7 @@ static int vdec_av1_slice_core_decode(struct vdec_l=
at_buf *lat_buf)
>         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dm=
a_addr_end);
>
>         if (fb)
> -               ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_bu=
f_req);
> +               ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->vb2_v4=
l2_src);
>
>         return ret;
>  }
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 1ed0ccec5665..732d78f63e5a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -533,7 +533,7 @@ static int vdec_h264_slice_core_decode(struct vdec_la=
t_buf *lat_buf)
>
>  vdec_dec_end:
>         vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_in=
fo->trans_end);
> -       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_re=
q);
> +       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb2_v4l2_s=
rc);
>         mtk_vdec_debug(ctx, "core decode done err=3D%d", err);
>         ctx->decoded_frame_cnt++;
>         return 0;
> @@ -605,7 +605,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, s=
truct mtk_vcodec_mem *bs,
>         }
>
>         inst->vsi->dec.nal_info =3D buf[nal_start_idx];
> -       lat_buf->src_buf_req =3D src_buf_info->m2m_buf.vb.vb2_buf.req_obj=
.req;
> +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->t=
s_info, true);
>
>         err =3D vdec_h264_slice_fill_decode_parameters(inst, share_info);
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hev=
c_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_hevc_req_multi_if.c
> index aa721cc43647..f6f9f7de0005 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> @@ -741,7 +741,7 @@ static int vdec_hevc_slice_setup_lat_buffer(struct vd=
ec_hevc_slice_inst *inst,
>         inst->vsi->bs.size =3D bs->size;
>
>         src_buf_info =3D container_of(bs, struct mtk_video_dec_buf, bs_bu=
ffer);
> -       lat_buf->src_buf_req =3D src_buf_info->m2m_buf.vb.vb2_buf.req_obj=
.req;
> +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
>         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->t=
s_info, true);
>
>         *res_chg =3D inst->resolution_changed;
> @@ -961,7 +961,7 @@ static int vdec_hevc_slice_core_decode(struct vdec_la=
t_buf *lat_buf)
>
>  vdec_dec_end:
>         vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_in=
fo->trans.dma_addr_end);
> -       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_re=
q);
> +       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb2_v4l2_s=
rc);
>         mtk_vdec_debug(ctx, "core decode done err=3D%d", err);
>         ctx->decoded_frame_cnt++;
>         return 0;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index eea709d93820..3dceb668ba1c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -721,7 +721,7 @@ static int vdec_vp9_slice_setup_lat_from_src_buf(stru=
ct vdec_vp9_slice_instance
>         if (!src)
>                 return -EINVAL;
>
> -       lat_buf->src_buf_req =3D src->vb2_buf.req_obj.req;
> +       lat_buf->vb2_v4l2_src =3D src;
>
>         dst =3D &lat_buf->ts_info;
>         v4l2_m2m_buf_copy_metadata(src, dst, true);
> @@ -2187,7 +2187,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_l=
at_buf *lat_buf)
>         mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
>                        (unsigned long)pfc->vsi.trans.dma_addr_end);
>         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dm=
a_addr_end);
> -       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
> +       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->vb2_v4l2_src);
>
>         return 0;
>
> @@ -2197,7 +2197,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_l=
at_buf *lat_buf)
>                 vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.=
trans.dma_addr_end);
>
>                 if (fb)
> -                       ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf=
->src_buf_req);
> +                       ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf=
->vb2_v4l2_src);
>         }
>         return ret;
>  }
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queu=
e.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
> index b0f576867f4b..9781de35df4b 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
> @@ -55,7 +55,7 @@ struct vdec_msg_queue_ctx {
>   * @rd_mv_addr:        mv addr for av1 lat hardware output, core hardwar=
e input
>   * @tile_addr: tile buffer for av1 core input
>   * @ts_info: need to set timestamp from output to capture
> - * @src_buf_req: output buffer media request object
> + * @vb2_v4l2_src: vb2 buffer of output queue
>   *
>   * @private_data: shared information used to lat and core hardware
>   * @ctx: mtk vcodec context information
> @@ -71,7 +71,7 @@ struct vdec_lat_buf {
>         struct mtk_vcodec_mem rd_mv_addr;
>         struct mtk_vcodec_mem tile_addr;
>         struct vb2_v4l2_buffer ts_info;
> -       struct media_request *src_buf_req;
> +       struct vb2_v4l2_buffer *vb2_v4l2_src;
>
>         void *private_data;
>         struct mtk_vcodec_dec_ctx *ctx;
> --
> 2.46.0
>

