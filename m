Return-Path: <linux-media+bounces-11904-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F15E48CF8EA
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 07:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C22A0B21AD6
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 05:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC11DF60;
	Mon, 27 May 2024 05:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kaht9kZc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69349D53C
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 05:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716789552; cv=none; b=rCKBoQet97F5nJ/GXjdGPA4bwnA7M+2gAeXYg6HGZPWykl9oGBILBHOaRW8ul2N8HzWhW8O0xa5uQwIOJo7YXWVxXEVnQ234gGovelUPzH9/s16pjTlo6Epn1Om7rmpg6uFg6h/dhDOPYdSMnB6DMfn29rcfSy2UPc/gAtpzPEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716789552; c=relaxed/simple;
	bh=7FwO+WsHSRy4iDQGVle0ccViY4h+C4pb7T7XHHQkTew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LF5rly4LJWqoV+9GJb6Ycux2jHsnEvNvdTgX+VZZFEGP6sv8pZxsENhKICTVJRsjHbVXh+hvIF6mWHaYpMS5jbeT4PqwXe+bH6Re0MVhWYxuSLPS3paV08VQKqa3j1lkGXQWYu+LDrHzpC8J2m20bCV6UiZRc2bml9/jd39dXqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kaht9kZc; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-529b22aabc1so287763e87.2
        for <linux-media@vger.kernel.org>; Sun, 26 May 2024 22:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716789548; x=1717394348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OR9Ad61axMvkG4/g8VNT1kP9S3TZSgBw5EMpfEC30Q=;
        b=kaht9kZc1Do+CO7Twygo/2HYosmqE8vII7cvrbL0rXHz9fa2CIWCmHOhhQSUfqgxUN
         +lYrEw2Bm2HZ4BFUuIbasfn6SMYEzlYU5Cq1mlB0E9IMPjMShgRYlt/kyR4CAN+Xa1ld
         01XzZzo5m+jb0iXCFx7uAOybaot0J4ywqKAWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716789548; x=1717394348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OR9Ad61axMvkG4/g8VNT1kP9S3TZSgBw5EMpfEC30Q=;
        b=vR5gmYjG74fWCq7aAOCn/xZGBw9JZyFCSnZrks13siIlBdKjzLw7SkvzbCTm0wK2fr
         cX4vuJViBMrl34efFyiXpdR8lWTwKG9Gy9MniMYTrrSST69r91dX3RSwWdOW2tUfhgw3
         xEzLxjn32m5Mqzt8YK12HmFjIg3YMv8lrh+FjDr2IJAz2NuISYQv6EZp0PJ9llG1azYB
         6Dfmlogbseun13jjcZrpTlUVIk2HMWYsVEU5s9JzcT7xgFHYDtVvcuZ1fH5WaiQkmo+e
         ejKfqsPVwOoDBM3bx9a/FEbHS9AUBPi/r9CXXno+XZfsD9mj0IrCCryosytDZi2RIdhD
         uGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1z3uKLN17NrEdbRGFnKA5+0Ph/FZLJ/oX0+oBTjOJaYEtbx0t4PA5OuVc2zXi0cA5d+gvL6i8L4s2x+M+z6HJtNvq6lpRn6cE9dg=
X-Gm-Message-State: AOJu0YxZJAq9GXnuMPzF3BHo17Rt9jYLv74mwpWhkfmI+t9FY8h0+fSb
	rbZMc7kvxGx0eeBTLDtxLECy1iaE+afs9Wugbwx3BwdADSggdMfplpPTOz9VAZDFjSY6ySmN9ox
	iYOVGDY53AnIZy7oUIGNn4AAnrcAkasRiJeip
X-Google-Smtp-Source: AGHT+IE9ubh7rk6tT5J/OTNFewiVCsQ+l+I3TN6th6b86VX71rdtZs++8YODqBPE26OX8MDKHyT/RLvKYpvcVpnw53g=
X-Received: by 2002:a19:8c58:0:b0:51f:53e0:1bc3 with SMTP id
 2adb3069b0e04-529646df12bmr4604947e87.25.1716789548537; Sun, 26 May 2024
 22:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240516122102.16379-1-yunfei.dong@mediatek.com> <20240516122102.16379-18-yunfei.dong@mediatek.com>
In-Reply-To: <20240516122102.16379-18-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 May 2024 13:58:57 +0800
Message-ID: <CAGXv+5FR8iLHgJGJP0C3UKhVXGzf7y44YUggpe3M=gB1mYtJ5A@mail.gmail.com>
Subject: Re: [PATCH v6,17/24] media: mediatek: vcodec: re-construct h264
 driver to support svp mode
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 8:21=E2=80=AFPM Yunfei Dong <yunfei.dong@mediatek.c=
om> wrote:
>
> Need secure buffer size to convert secure handle to secure
> pa in optee-os, re-construct the vsi struct to store each
> secure buffer size.
>
> Separate svp and normal wait interrupt condition for svp mode
> waiting hardware interrupt in optee-os.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../decoder/vdec/vdec_h264_req_multi_if.c     | 261 +++++++++++-------
>  .../mediatek/vcodec/decoder/vdec_msg_queue.c  |   9 +-
>  2 files changed, 168 insertions(+), 102 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index d7fec1887ab5..40836673f7fe 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -60,14 +60,36 @@ struct vdec_h264_slice_lat_dec_param {
>   * @crc:               Used to check whether hardware's status is right
>   */
>  struct vdec_h264_slice_info {
> +       u64 wdma_end_addr_offset;
>         u16 nal_info;
>         u16 timeout;
> -       u32 bs_buf_size;
> -       u64 bs_buf_addr;
> -       u64 y_fb_dma;
> -       u64 c_fb_dma;
>         u64 vdec_fb_va;
>         u32 crc[8];
> +       u32 reserved;
> +};
> +
> +/*
> + * struct vdec_h264_slice_mem - memory address and size
> + */
> +struct vdec_h264_slice_mem {
> +       union {
> +               u64 buf;
> +               u64 dma_addr;
> +       };
> +       union {
> +               size_t size;
> +               u64 dma_addr_end;
> +       };
> +};
> +
> +/**
> + * struct vdec_h264_slice_fb - frame buffer for decoding
> + * @y:  current y buffer address info
> + * @c:  current c buffer address info
> + */
> +struct vdec_h264_slice_fb {
> +       struct vdec_h264_slice_mem y;
> +       struct vdec_h264_slice_mem c;
>  };
>
>  /**
> @@ -92,18 +114,16 @@ struct vdec_h264_slice_info {
>   */
>  struct vdec_h264_slice_vsi {
>         /* LAT dec addr */
> -       u64 wdma_err_addr;
> -       u64 wdma_start_addr;
> -       u64 wdma_end_addr;
> -       u64 slice_bc_start_addr;
> -       u64 slice_bc_end_addr;
> -       u64 row_info_start_addr;
> -       u64 row_info_end_addr;
> -       u64 trans_start;
> -       u64 trans_end;
> -       u64 wdma_end_addr_offset;
> +       struct vdec_h264_slice_mem bs;
> +       struct vdec_h264_slice_fb fb;
>
> -       u64 mv_buf_dma[H264_MAX_MV_NUM];
> +       struct vdec_h264_slice_mem ube;
> +       struct vdec_h264_slice_mem trans;
> +       struct vdec_h264_slice_mem row_info;
> +       struct vdec_h264_slice_mem err_map;
> +       struct vdec_h264_slice_mem slice_bc;
> +
> +       struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
>         struct vdec_h264_slice_info dec;
>         struct vdec_h264_slice_lat_dec_param h264_slice_params;
>  };

Hard NAK.

You are changing the interface with the firmware without any backward
compatibility. This breaks H.264 decoding on other platforms that use
this code path, including MT8192, MT8195, and MT8186. You cannot just
consider the current platform you are working on.

This is already showing in our downstream test results for Asurada / MT8192
on v6.1, same branch as MT8188, which has these patches applied.

The kernel needs to be able to run with older firmware. The firmware
needs to signal that it wants the new layout either with a version
number (which probably won't work with SCP here) or with capability
flags, like with 4K or AV1 or HEVC support we had before. The kernel
driver sees the capability flag and uses the new data structures.

Or you make changes to the layout in some backward compatible way, like
only expanding the data structure and keeping all the old fields, and
duplicating fields for new structures you add.


Regards
ChenYu

> @@ -392,6 +412,100 @@ static void vdec_h264_slice_get_crop_info(struct vd=
ec_h264_slice_inst *inst,
>                        cr->left, cr->top, cr->width, cr->height);
>  }
>
> +static void vdec_h264_slice_setup_lat_buffer(struct vdec_h264_slice_inst=
 *inst,
> +                                            struct mtk_vcodec_mem *bs,
> +                                            struct vdec_lat_buf *lat_buf=
)
> +{
> +       struct mtk_vcodec_mem *mem;
> +       int i;
> +
> +       inst->vsi->bs.dma_addr =3D (u64)bs->dma_addr;
> +       inst->vsi->bs.size =3D bs->size;
> +
> +       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> +               mem =3D &inst->mv_buf[i];
> +               inst->vsi->mv_buf_dma[i].dma_addr =3D mem->dma_addr;
> +               inst->vsi->mv_buf_dma[i].size =3D mem->size;
> +       }
> +       inst->vsi->ube.dma_addr =3D lat_buf->ctx->msg_queue.wdma_addr.dma=
_addr;
> +       inst->vsi->ube.size =3D lat_buf->ctx->msg_queue.wdma_addr.size;
> +
> +       inst->vsi->row_info.dma_addr =3D 0;
> +       inst->vsi->row_info.size =3D 0;
> +
> +       inst->vsi->err_map.dma_addr =3D lat_buf->wdma_err_addr.dma_addr;
> +       inst->vsi->err_map.size =3D lat_buf->wdma_err_addr.size;
> +
> +       inst->vsi->slice_bc.dma_addr =3D lat_buf->slice_bc_addr.dma_addr;
> +       inst->vsi->slice_bc.size =3D lat_buf->slice_bc_addr.size;
> +
> +       inst->vsi->trans.dma_addr_end =3D inst->ctx->msg_queue.wdma_rptr_=
addr;
> +       inst->vsi->trans.dma_addr =3D inst->ctx->msg_queue.wdma_wptr_addr=
;
> +}
> +
> +static int vdec_h264_slice_setup_core_buffer(struct vdec_h264_slice_inst=
 *inst,
> +                                            struct vdec_h264_slice_share=
_info *share_info,
> +                                            struct vdec_lat_buf *lat_buf=
)
> +{
> +       struct mtk_vcodec_mem *mem;
> +       struct mtk_vcodec_dec_ctx *ctx =3D inst->ctx;
> +       struct vb2_v4l2_buffer *vb2_v4l2;
> +       struct vdec_fb *fb;
> +       u64 y_fb_dma, c_fb_dma =3D 0;
> +       int i;
> +
> +       fb =3D ctx->dev->vdec_pdata->get_cap_buffer(ctx);
> +       if (!fb) {
> +               mtk_vdec_err(ctx, "fb buffer is NULL");
> +               return -EBUSY;
> +       }
> +
> +       y_fb_dma =3D (u64)fb->base_y.dma_addr;
> +       if (!ctx->is_secure_playback) {
> +               if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes =3D=3D 1)
> +                       c_fb_dma =3D
> +                               y_fb_dma + inst->ctx->picinfo.buf_w * ins=
t->ctx->picinfo.buf_h;
> +               else
> +                       c_fb_dma =3D (u64)fb->base_c.dma_addr;
> +       }
> +
> +       mtk_vdec_debug(ctx, "[h264-core] y/c addr =3D 0x%llx 0x%llx", y_f=
b_dma, c_fb_dma);
> +
> +       inst->vsi_core->fb.y.dma_addr =3D y_fb_dma;
> +       inst->vsi_core->fb.y.size =3D ctx->picinfo.fb_sz[0];
> +       inst->vsi_core->fb.c.dma_addr =3D c_fb_dma;
> +       inst->vsi_core->fb.c.size =3D ctx->picinfo.fb_sz[1];
> +
> +       inst->vsi_core->dec.vdec_fb_va =3D (unsigned long)fb;
> +       inst->vsi_core->dec.nal_info =3D share_info->nal_info;
> +
> +       inst->vsi_core->ube.dma_addr =3D lat_buf->ctx->msg_queue.wdma_add=
r.dma_addr;
> +       inst->vsi_core->ube.size =3D lat_buf->ctx->msg_queue.wdma_addr.si=
ze;
> +
> +       inst->vsi_core->err_map.dma_addr =3D lat_buf->wdma_err_addr.dma_a=
ddr;
> +       inst->vsi_core->err_map.size =3D lat_buf->wdma_err_addr.size;
> +
> +       inst->vsi_core->slice_bc.dma_addr =3D lat_buf->slice_bc_addr.dma_=
addr;
> +       inst->vsi_core->slice_bc.size =3D lat_buf->slice_bc_addr.size;
> +
> +       inst->vsi_core->row_info.dma_addr =3D 0;
> +       inst->vsi_core->row_info.size =3D 0;
> +
> +       inst->vsi_core->trans.dma_addr =3D share_info->trans_start;
> +       inst->vsi_core->trans.dma_addr_end =3D share_info->trans_end;
> +
> +       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> +               mem =3D &inst->mv_buf[i];
> +               inst->vsi_core->mv_buf_dma[i].dma_addr =3D mem->dma_addr;
> +               inst->vsi_core->mv_buf_dma[i].size =3D mem->size;
> +       }
> +
> +       vb2_v4l2 =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +       v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
> +
> +       return 0;
> +}
> +
>  static int vdec_h264_slice_init(struct mtk_vcodec_dec_ctx *ctx)
>  {
>         struct vdec_h264_slice_inst *inst;
> @@ -457,64 +571,22 @@ static void vdec_h264_slice_deinit(void *h_vdec)
>
>  static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
>  {
> -       struct vdec_fb *fb;
> -       u64 vdec_fb_va;
> -       u64 y_fb_dma, c_fb_dma;
> -       int err, timeout, i;
> +       int err, timeout;
>         struct mtk_vcodec_dec_ctx *ctx =3D lat_buf->ctx;
>         struct vdec_h264_slice_inst *inst =3D ctx->drv_handle;
> -       struct vb2_v4l2_buffer *vb2_v4l2;
>         struct vdec_h264_slice_share_info *share_info =3D lat_buf->privat=
e_data;
> -       struct mtk_vcodec_mem *mem;
>         struct vdec_vpu_inst *vpu =3D &inst->vpu;
>
>         mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");
>         memcpy(&inst->vsi_core->h264_slice_params, &share_info->h264_slic=
e_params,
>                sizeof(share_info->h264_slice_params));
>
> -       fb =3D ctx->dev->vdec_pdata->get_cap_buffer(ctx);
> -       if (!fb) {
> -               err =3D -EBUSY;
> -               mtk_vdec_err(ctx, "fb buffer is NULL");
> +       err =3D vdec_h264_slice_setup_core_buffer(inst, share_info, lat_b=
uf);
> +       if (err)
>                 goto vdec_dec_end;
> -       }
> -
> -       vdec_fb_va =3D (unsigned long)fb;
> -       y_fb_dma =3D (u64)fb->base_y.dma_addr;
> -       if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes =3D=3D 1)
> -               c_fb_dma =3D
> -                       y_fb_dma + inst->ctx->picinfo.buf_w * inst->ctx->=
picinfo.buf_h;
> -       else
> -               c_fb_dma =3D (u64)fb->base_c.dma_addr;
> -
> -       mtk_vdec_debug(ctx, "[h264-core] y/c addr =3D 0x%llx 0x%llx", y_f=
b_dma, c_fb_dma);
> -
> -       inst->vsi_core->dec.y_fb_dma =3D y_fb_dma;
> -       inst->vsi_core->dec.c_fb_dma =3D c_fb_dma;
> -       inst->vsi_core->dec.vdec_fb_va =3D vdec_fb_va;
> -       inst->vsi_core->dec.nal_info =3D share_info->nal_info;
> -       inst->vsi_core->wdma_start_addr =3D
> -               lat_buf->ctx->msg_queue.wdma_addr.dma_addr;
> -       inst->vsi_core->wdma_end_addr =3D
> -               lat_buf->ctx->msg_queue.wdma_addr.dma_addr +
> -               lat_buf->ctx->msg_queue.wdma_addr.size;
> -       inst->vsi_core->wdma_err_addr =3D lat_buf->wdma_err_addr.dma_addr=
;
> -       inst->vsi_core->slice_bc_start_addr =3D lat_buf->slice_bc_addr.dm=
a_addr;
> -       inst->vsi_core->slice_bc_end_addr =3D lat_buf->slice_bc_addr.dma_=
addr +
> -               lat_buf->slice_bc_addr.size;
> -       inst->vsi_core->trans_start =3D share_info->trans_start;
> -       inst->vsi_core->trans_end =3D share_info->trans_end;
> -       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> -               mem =3D &inst->mv_buf[i];
> -               inst->vsi_core->mv_buf_dma[i] =3D mem->dma_addr;
> -       }
> -
> -       vb2_v4l2 =3D v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> -       v4l2_m2m_buf_copy_metadata(&lat_buf->ts_info, vb2_v4l2, true);
>
>         vdec_h264_slice_fill_decode_reflist(inst, &inst->vsi_core->h264_s=
lice_params,
>                                             share_info);
> -
>         err =3D vpu_dec_core(vpu);
>         if (err) {
>                 mtk_vdec_err(ctx, "core decode err=3D%d", err);
> @@ -573,12 +645,11 @@ static int vdec_h264_slice_lat_decode(void *h_vdec,=
 struct mtk_vcodec_mem *bs,
>         struct vdec_h264_slice_inst *inst =3D h_vdec;
>         struct vdec_vpu_inst *vpu =3D &inst->vpu;
>         struct mtk_video_dec_buf *src_buf_info;
> -       int nal_start_idx, err, timeout =3D 0, i;
> +       int nal_start_idx, err, timeout =3D 0;
>         unsigned int data[2];
>         struct vdec_lat_buf *lat_buf;
>         struct vdec_h264_slice_share_info *share_info;
>         unsigned char *buf;
> -       struct mtk_vcodec_mem *mem;
>
>         if (vdec_msg_queue_init(&inst->ctx->msg_queue, inst->ctx,
>                                 vdec_h264_slice_core_decode,
> @@ -617,11 +688,9 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, =
struct mtk_vcodec_mem *bs,
>         if (err)
>                 goto err_free_fb_out;
>
> -       vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size,
> -                                  &share_info->h264_slice_params.pps);
> -
> -       inst->vsi->dec.bs_buf_addr =3D (uint64_t)bs->dma_addr;
> -       inst->vsi->dec.bs_buf_size =3D bs->size;
> +       if (!inst->ctx->is_secure_playback)
> +               vdec_h264_insert_startcode(inst->ctx->dev, buf, &bs->size=
,
> +                                          &share_info->h264_slice_params=
.pps);
>
>         *res_chg =3D inst->resolution_changed;
>         if (inst->resolution_changed) {
> @@ -634,38 +703,27 @@ static int vdec_h264_slice_lat_decode(void *h_vdec,=
 struct mtk_vcodec_mem *bs,
>                 }
>                 inst->resolution_changed =3D false;
>         }
> -       for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
> -               mem =3D &inst->mv_buf[i];
> -               inst->vsi->mv_buf_dma[i] =3D mem->dma_addr;
> -       }
> -       inst->vsi->wdma_start_addr =3D lat_buf->ctx->msg_queue.wdma_addr.=
dma_addr;
> -       inst->vsi->wdma_end_addr =3D lat_buf->ctx->msg_queue.wdma_addr.dm=
a_addr +
> -               lat_buf->ctx->msg_queue.wdma_addr.size;
> -       inst->vsi->wdma_err_addr =3D lat_buf->wdma_err_addr.dma_addr;
> -       inst->vsi->slice_bc_start_addr =3D lat_buf->slice_bc_addr.dma_add=
r;
> -       inst->vsi->slice_bc_end_addr =3D lat_buf->slice_bc_addr.dma_addr =
+
> -               lat_buf->slice_bc_addr.size;
> -
> -       inst->vsi->trans_end =3D inst->ctx->msg_queue.wdma_rptr_addr;
> -       inst->vsi->trans_start =3D inst->ctx->msg_queue.wdma_wptr_addr;
> -       mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%llx) err:0x%llx",
> -                      inst->vsi->wdma_start_addr,
> -                      inst->vsi->wdma_end_addr,
> -                      inst->vsi->wdma_err_addr);
> -
> -       mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%l=
lx))",
> -                      inst->vsi->slice_bc_start_addr,
> -                      inst->vsi->slice_bc_end_addr,
> -                      inst->vsi->trans_start,
> -                      inst->vsi->trans_end);
> +
> +       vdec_h264_slice_setup_lat_buffer(inst, bs, lat_buf);
> +       mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%lx) err:0x%llx",
> +                      inst->vsi->ube.dma_addr, (unsigned long)inst->vsi-=
>ube.size,
> +                      inst->vsi->err_map.dma_addr);
> +
> +       mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%lx) rprt((0x%llx 0x%ll=
x))",
> +                      inst->vsi->slice_bc.dma_addr, (unsigned long)inst-=
>vsi->slice_bc.size,
> +                      inst->vsi->trans.dma_addr, inst->vsi->trans.dma_ad=
dr_end);
>         err =3D vpu_dec_start(vpu, data, 2);
>         if (err) {
>                 mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
>                 goto err_free_fb_out;
>         }
>
> -       share_info->trans_end =3D inst->ctx->msg_queue.wdma_addr.dma_addr=
 +
> -               inst->vsi->wdma_end_addr_offset;
> +       if (inst->ctx->is_secure_playback)
> +               share_info->trans_end =3D inst->vsi->dec.wdma_end_addr_of=
fset;
> +       else
> +               share_info->trans_end =3D inst->ctx->msg_queue.wdma_addr.=
dma_addr +
> +                       inst->vsi->dec.wdma_end_addr_offset;
> +
>         share_info->trans_start =3D inst->ctx->msg_queue.wdma_wptr_addr;
>         share_info->nal_info =3D inst->vsi->dec.nal_info;
>
> @@ -691,8 +749,11 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, =
struct mtk_vcodec_mem *bs,
>                 return -EINVAL;
>         }
>
> -       share_info->trans_end =3D inst->ctx->msg_queue.wdma_addr.dma_addr=
 +
> -               inst->vsi->wdma_end_addr_offset;
> +       if (inst->ctx->is_secure_playback)
> +               share_info->trans_end =3D inst->vsi->dec.wdma_end_addr_of=
fset;
> +       else
> +               share_info->trans_end =3D inst->ctx->msg_queue.wdma_addr.=
dma_addr +
> +                       inst->vsi->dec.wdma_end_addr_offset;
>         vdec_msg_queue_update_ube_wptr(&lat_buf->ctx->msg_queue, share_in=
fo->trans_end);
>
>         if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability)) {
> @@ -737,10 +798,10 @@ static int vdec_h264_slice_single_decode(void *h_vd=
ec, struct mtk_vcodec_mem *bs
>         mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=3D%llx c_dma=3D%=
llx",
>                        inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
>
> -       inst->vsi_ctx.dec.bs_buf_addr =3D (u64)bs->dma_addr;
> -       inst->vsi_ctx.dec.bs_buf_size =3D bs->size;
> -       inst->vsi_ctx.dec.y_fb_dma =3D y_fb_dma;
> -       inst->vsi_ctx.dec.c_fb_dma =3D c_fb_dma;
> +       inst->vsi_ctx.bs.dma_addr =3D (u64)bs->dma_addr;
> +       inst->vsi_ctx.bs.size =3D bs->size;
> +       inst->vsi_ctx.fb.y.dma_addr =3D y_fb_dma;
> +       inst->vsi_ctx.fb.c.dma_addr =3D c_fb_dma;
>         inst->vsi_ctx.dec.vdec_fb_va =3D (u64)(uintptr_t)fb;
>
>         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
> @@ -770,7 +831,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec=
, struct mtk_vcodec_mem *bs
>
>                 for (i =3D 0; i < H264_MAX_MV_NUM; i++) {
>                         mem =3D &inst->mv_buf[i];
> -                       inst->vsi_ctx.mv_buf_dma[i] =3D mem->dma_addr;
> +                       inst->vsi_ctx.mv_buf_dma[i].dma_addr =3D mem->dma=
_addr;
>                 }
>         }
>
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queu=
e.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> index f283c4703dc6..c1310176ae05 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
> @@ -308,8 +308,13 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_q=
ueue,
>                 msg_queue->wdma_addr.size =3D 0;
>                 return -ENOMEM;
>         }
> -       msg_queue->wdma_rptr_addr =3D msg_queue->wdma_addr.dma_addr;
> -       msg_queue->wdma_wptr_addr =3D msg_queue->wdma_addr.dma_addr;
> +       if (ctx->is_secure_playback) {
> +               msg_queue->wdma_rptr_addr =3D 0;
> +               msg_queue->wdma_wptr_addr =3D 0;
> +       } else {
> +               msg_queue->wdma_rptr_addr =3D msg_queue->wdma_addr.dma_ad=
dr;
> +               msg_queue->wdma_wptr_addr =3D msg_queue->wdma_addr.dma_ad=
dr;
> +       }
>
>         msg_queue->empty_lat_buf.ctx =3D ctx;
>         msg_queue->empty_lat_buf.core_decode =3D NULL;
> --
> 2.25.1
>

