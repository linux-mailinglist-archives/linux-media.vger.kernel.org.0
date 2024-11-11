Return-Path: <linux-media+bounces-21239-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0A9C3917
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 08:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F5781F21EA6
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 07:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337831531E2;
	Mon, 11 Nov 2024 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vo6zEhAc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D341152517
	for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731310850; cv=none; b=dTZ4i2ANvhn+EsG8Y7f+nnYcf0JXzd9SINGEWbVfaEMzXYxTY5VdvPrRynKrxAUVlWw923ahfz7uz8y8mF+WVVR+XbsLgWzwKBm81M7Nna1z4mi2JLtMWEdGyconZ1gvAzIPJDt5L+39szt0jJsuErsHG5UosoUzs+C+8Qob7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731310850; c=relaxed/simple;
	bh=0x5Otk7NhIx93NypQxMZMlzhLhnSmRwVDy+6Pbyx9Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAifulVI1pLL2HQicgaB7+EXtD1/WsXcycqx4MUq7HwBlxU7AOGqHren/7tfJmHAzrqJwSZm2+c7d4TOAlKgyCrDsOYgT2FeSqr2FXn55vg/eUwsnTT//ld0y+HWCtqharihaxpM2zWh14ADAlYYdkA6IaeTb61zvnkCNz6ssgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vo6zEhAc; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so5194811e87.0
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2024 23:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731310846; x=1731915646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cchXmoXnjsh/ihpk1qWs2Z92IOl0+D5DOABBxdDXkcU=;
        b=Vo6zEhAcgSLo5JXiABAFEjS8UOLEUDbUiZVjaA/Xmb+K4Fr8X4M2sC0OOE6Slf/450
         GgRo+WVomSPuet1INsfhusoPm0p327KKR879No4EItivFmbTlMIOlU1kJjyD7NxqGYQb
         cSLTU0yXB2HTLNzM23ZwfVh01PPxO7mQ162ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731310846; x=1731915646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cchXmoXnjsh/ihpk1qWs2Z92IOl0+D5DOABBxdDXkcU=;
        b=KlUuRiarkQ6nj9zLnpDm9FbXUewvJ2ZBwj73ePwQlpqzc7YPjBDXIo4L10Nng9UyvL
         hL4Jmgn8+aymYulfxsm7axGRYf5yAIxSYAefYfYkXJv0pftUTrElaB3GDU3VJgTDieNk
         NwKEq8nvPqK3KL1h7pQMHeMxierbWp/+aqOv4Cvc7blSv7xmz6FMKgP7LuTqeU/uGmLa
         ZpS5fNDe6OEBVVUsj50BYY5HeYcZIxtsRjlRGjkDqCfhS/NdH6pTw5Y6tp3zIjilY5w9
         MtRwlc6xVUtc4kTgJ0e3R1gmSA0NP49rKV/0mmUSu0jQ0yOR8BmjoAFX4e1EZ2JjOaNc
         0N+A==
X-Forwarded-Encrypted: i=1; AJvYcCXRUP5Wyq4wWvYjd92f2jKft47aRT3/1wI47498E9rPypXaynDwaLqFhgLnwbKwqkL+C0QlQgmIoMktgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNuYFMAIg2aohkpzJZN22mUlAjQhW6Gi6h3sduuaKevBfGsm9W
	5mXe/z58r3+4q2dGEZ5ekJmTQjRNoV2UYYX8FAbJfiaIk3ZpR7Ch3PkaBnAbg/rd4r5Mt/TRuvA
	OgC9QgXAerQe0DKHPAFX+RtL+9aETHIMwZlgl
X-Google-Smtp-Source: AGHT+IHG+T7MNZSeLvJg3VLDdtk6mlCPz/9Dza3sm8kBv9b6S1uUgHobvZgT2FRso5RLF945OBPvu6RDv0iZeFbFSzg=
X-Received: by 2002:a05:6512:239d:b0:539:f7c1:5feb with SMTP id
 2adb3069b0e04-53d8626c8eamr4146278e87.39.1731310845997; Sun, 10 Nov 2024
 23:40:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108033219.19804-1-yunfei.dong@mediatek.com>
 <20241108033219.19804-2-yunfei.dong@mediatek.com> <CAGXv+5Eyyyvv-1a+eH=xQyL0LaBmjqy0dvOUeiBS2RsuWSdshA@mail.gmail.com>
 <20241108081814.tv2hch6ti3npvnrp@basti-XPS-13-9310> <CAGXv+5FoUudJ=R52yAR0Mzwd49aBSxejkOENSfrix0Z3WJBv-A@mail.gmail.com>
 <aebdd23a8039e667cd288b5be20730447b692a30.camel@collabora.com>
In-Reply-To: <aebdd23a8039e667cd288b5be20730447b692a30.camel@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 Nov 2024 15:40:34 +0800
Message-ID: <CAGXv+5Ge3DfUvL8yC+9it=wG1s91NW7O3qu+hM35K6J2VmST0w@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] media: mediatek: vcodec: setting request complete
 before buffer done
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 9:42=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Chen-Yu,
>
> Le vendredi 08 novembre 2024 =C3=A0 16:50 +0800, Chen-Yu Tsai a =C3=A9cri=
t :
> > On Fri, Nov 8, 2024 at 4:18=E2=80=AFPM Sebastian Fricke
> > <sebastian.fricke@collabora.com> wrote:
> > >
> > > Hey Yunfei & Chen-Yu,
> > >
> > > On 08.11.2024 15:49, Chen-Yu Tsai wrote:
> > > > On Fri, Nov 8, 2024 at 11:32=E2=80=AFAM Yunfei Dong <yunfei.dong@me=
diatek.com> wrote:
> > > > >
> > > > > The request status of output queue is set to MEDIA_REQUEST_STATE_=
COMPLETE
> > > > > when user space dequeue output buffer. Will get below warning if =
the
> > > > > driver calling v4l2_ctrl_request_complete to set media request co=
mplete,
> > > > > must to change the function order, calling v4l2_ctrl_request_comp=
lete
> > > > > before v4l2_m2m_buf_done.
> > > > >
> > > > > Workqueue: core-decoder vdec_msg_queue_core_work [mtk_vcodec_dec]
> > > > > pstate: 80c00089 (Nzcv daIf +PAN +UAO -TCO BTYPE=3D--)
> > > > > pc : media_request_object_bind+0xa8/0x124
> > > > > lr : media_request_object_bind+0x50/0x124
> > > > > sp : ffffffc011393be0
> > > > > x29: ffffffc011393be0 x28: 0000000000000000
> > > > > x27: ffffff890c280248 x26: ffffffe21a71ab88
> > > > > x25: 0000000000000000 x24: ffffff890c280280
> > > > > x23: ffffff890c280280 x22: 00000000fffffff0
> > > > > x21: 0000000000000000 x20: ffffff890260d280
> > > > > x19: ffffff890260d2e8 x18: 0000000000001000
> > > > > x17: 0000000000000400 x16: ffffffe21a4584a0
> > > > > x15: 000000000053361d x14: 0000000000000018
> > > > > x13: 0000000000000004 x12: ffffffa82427d000
> > > > > x11: ffffffe21ac3fce0 x10: 0000000000000001
> > > > > x9 : 0000000000000000 x8 : 0000000000000003
> > > > > x7 : 0000000000000000 x6 : 000000000000003f
> > > > > x5 : 0000000000000040 x4 : ffffff89052e7b98
> > > > > x3 : 0000000000000000 x2 : 0000000000000001
> > > > > x1 : 0000000000000000 x0 : 0000000000000000
> > > > > Call trace:
> > > > >  media_request_object_bind+0xa8/0x124
> > > > >  v4l2_ctrl_request_bind+0xc4/0x168
> > > > >  v4l2_ctrl_request_complete+0x198/0x1f4
> > > > >  mtk_vdec_stateless_cap_to_disp+0x58/0x8c [mtk_vcodec_dec 245a7c1=
e48ff1b2451a50e1dfcb174262b6b462c]
> > > > >  vdec_vp9_slice_core_decode+0x1c0/0x268 [mtk_vcodec_dec 245a7c1e4=
8ff1b2451a50e1dfcb174262b6b462c]
> > > > >  vdec_msg_queue_core_work+0x60/0x11c [mtk_vcodec_dec 245a7c1e48ff=
1b2451a50e1dfcb174262b6b462c]
> > > > >  process_one_work+0x140/0x480
> > > > >  worker_thread+0x12c/0x2f8
> > > > >  kthread+0x13c/0x1d8
> > > > >  ret_from_fork+0x10/0x30
> > > > >
> > > > > Fixes: 7b182b8d9c852 ("media: mediatek: vcodec: Refactor get and =
put capture buffer flow")
> > > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > >
> > > > The changes look OK, so
> > > >
> > > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > >
> > > Sorry for the late reply, I am currently finishing up a change-set th=
at
> > > utilizes https://patchwork.linuxtv.org/project/linux-media/list/?seri=
es=3D13489
> > > which is the prefered solution. I think there has been some
> > > misunderstanding when I last talked about that in a previous version.
> > > Using the manual request completion will be the cleaner solution beca=
use
> > > it allows sending new bitstream data as soon as the LAT core finishes
> > > the previous data, which doesn't decrease performance.
> >
> > I don't think manual request completion is really needed.
> >
> > The driver could be reworked so that when the VP8 / pure core / lat
> > decoder functions return, v4l2_ctrl_request_complete() is called
> > and the source buffer is removed and marked as done. It should
> > probably also remove a destination buffer and pass that to the
> > core decode worker, i.e. it should consume source and destination
> > buffers in pairs.
>
> You are ignoring the fundamental issue in the framework that we are tryin=
g to
> solve. While for single core driver it does not matter, the current appro=
ach
> imply an execution order of:
>
> - QBUF capture / output
> - Q of request
> - A job is created, but simply trigger a workqueue**
> - The workqueue operate the LAT synchronously and triggers the CORE workq=
ueue
> - The core workqueue process execute on CORE
> - After everything is done:
>   - capture buffer is marked done
>   - controls are applied
>   - the output buffer is marked done

IIUC as soon as the output buffer is marked done, the request is marked
as completed, so the marking of the output buffer can't be done sooner.

So what I think I'm missing is why completing the request early is a
problem. Otherwise manual completion isn't needed.

BTW, the stateless decoder spec is really unclear on what should be polled
for to wait for a decoded frame, which is what the user ultimately wants.

> While the order is not strict in the spec (and should not) this introduce=
s
> inefficient buffer usage pattern. There is a logical order for these even=
t to
> occure, and the manual request completion solves this, and reduce the dri=
ver
> complexicity. With the manual request, it is simple and you can achieve l=
ogical
> even ordering, allowing to reuse bitstream buffers while the CORE is runn=
ing.
>
> - QBUF capture / output
> - Q of request
> - LAT is programmed using the controls
>   - Controls are applied (v4l2_ctrl_request_complete())
> - LAT completes
>   - Output buffer is marked done
> - CORE is programmed with the scrath buffer from LAT
> - CORE completes
>   - capture buffer is marked done
>   - request is manually marked complete

I agree that this is what it should look like. Everything can be done
by moving the calls around if early completion isn't an issue.

> Nicolas
>
> ** The VCODEC driver make use of unneeded workqueue to satisfy a very unc=
ommon
> programming pattern. This pattern is discourage as it introduce spurious =
context
> switching within the driver, reducing its performance. We have decided to=
 let
> this go few years ago, but  still believe this approach is bad practice. =
I'm
> just explaining myself here, no action required.

I think we can at least get rid of the workqueue triggered from the
.device_run callback. I don't really see what the pattern is though.
To me it just seems like an unnecessary layer.

> >
> > And IIUC the next job is scheduled when v4l2_m2m_job_finish() is called=
,
> > which is basically when the LAT core finishes.
>
> The output buffer is held on, but it should be marked done to let userspa=
ce fill
> it back concurrently. With the change, you must allocate an extra one if =
you
> want this parallelism.

Again, that is because it can't be marked as done when the LAT core
finishes.


Thanks
ChenYu

> >
> > > The plan would be for Yunfei to take that patch set of mine and rebas=
e
> > > his changes on top.
> >
> > Just to clarify, what changes will your patch set cover?
>
> This is also aligned with the feedback from folks working on MTK secure v=
ideo
> path, which claims they are running out of secure zones. Each vb2 buffer =
is a
> zone, I don't currently have an easy solution to that.
>
> Nicolas
>
> >
> >
> > Thanks
> > ChenYu
> >
> > > Regards,
> > > Sebastian
> > >
> > > >
> > > > > ---
> > > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c    |  4 ++--
> > > > >  .../vcodec/decoder/mtk_vcodec_dec_drv.h         |  2 +-
> > > > >  .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 17 +++++++++++=
+-----
> > > > >  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c   |  7 ++++---
> > > > >  .../decoder/vdec/vdec_h264_req_multi_if.c       |  4 ++--
> > > > >  .../decoder/vdec/vdec_hevc_req_multi_if.c       |  4 ++--
> > > > >  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   |  6 +++---
> > > > >  .../mediatek/vcodec/decoder/vdec_msg_queue.h    |  4 ++--
> > > > >  8 files changed, 28 insertions(+), 20 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_v=
codec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec=
.c
> > > > > index 98838217b97d..2b787e60a1f9 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec.c
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec.c
> > > > > @@ -887,10 +887,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_=
queue *q)
> > > > >                         if (src_buf !=3D &ctx->empty_flush_buf.vb=
) {
> > > > >                                 struct media_request *req =3D
> > > > >                                         src_buf->vb2_buf.req_obj.=
req;
> > > > > -                               v4l2_m2m_buf_done(src_buf,
> > > > > -                                               VB2_BUF_STATE_ERR=
OR);
> > > > > +
> > > > >                                 if (req)
> > > > >                                         v4l2_ctrl_request_complet=
e(req, &ctx->ctrl_hdl);
> > > > > +                               v4l2_m2m_buf_done(src_buf, VB2_BU=
F_STATE_ERROR);
> > > > >                         }
> > > > >                 }
> > > > >                 return;
> > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_v=
codec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec=
_dec_drv.h
> > > > > index ac568ed14fa2..1fabe8c5b7a4 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_drv.h
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_drv.h
> > > > > @@ -111,7 +111,7 @@ struct mtk_vcodec_dec_pdata {
> > > > >         int (*flush_decoder)(struct mtk_vcodec_dec_ctx *ctx);
> > > > >         struct vdec_fb *(*get_cap_buffer)(struct mtk_vcodec_dec_c=
tx *ctx);
> > > > >         void (*cap_to_disp)(struct mtk_vcodec_dec_ctx *ctx, int e=
rror,
> > > > > -                           struct media_request *src_buf_req);
> > > > > +                           struct vb2_v4l2_buffer *vb2_v4l2_src)=
;
> > > > >
> > > > >         const struct vb2_ops *vdec_vb2_ops;
> > > > >
> > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_v=
codec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_=
vcodec_dec_stateless.c
> > > > > index afa224da0f41..750f98c1226d 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> > > > > @@ -245,10 +245,11 @@ static const struct v4l2_frmsize_stepwise s=
tepwise_fhd =3D {
> > > > >  };
> > > > >
> > > > >  static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec=
_ctx *ctx, int error,
> > > > > -                                          struct media_request *=
src_buf_req)
> > > > > +                                          struct vb2_v4l2_buffer=
 *vb2_v4l2_src)
> > > > >  {
> > > > >         struct vb2_v4l2_buffer *vb2_dst;
> > > > >         enum vb2_buffer_state state;
> > > > > +       struct media_request *src_buf_req;
> > > > >
> > > > >         if (error)
> > > > >                 state =3D VB2_BUF_STATE_ERROR;
> > > > > @@ -264,8 +265,16 @@ static void mtk_vdec_stateless_cap_to_disp(s=
truct mtk_vcodec_dec_ctx *ctx, int e
> > > > >                 mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
> > > > >         }
> > > > >
> > > > > +       if (!vb2_v4l2_src) {
> > > > > +               mtk_v4l2_vdec_err(ctx, "get src buffer NULL");
> > > > > +               return;
> > > > > +       }
> > > > > +
> > > > > +       src_buf_req =3D vb2_v4l2_src->vb2_buf.req_obj.req;
> > > > >         if (src_buf_req)
> > > > >                 v4l2_ctrl_request_complete(src_buf_req, &ctx->ctr=
l_hdl);
> > > > > +
> > > > > +       v4l2_m2m_buf_done(vb2_v4l2_src, state);
> > > > >  }
> > > > >
> > > > >  static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec=
_ctx *ctx)
> > > > > @@ -374,14 +383,12 @@ static void mtk_vdec_worker(struct work_str=
uct *work)
> > > > >         state =3D ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> > > > >         if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
> > > > >             ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAME) {
> > > > > -               v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec=
, ctx->m2m_ctx, state);
> > > > >                 if (src_buf_req)
> > > > >                         v4l2_ctrl_request_complete(src_buf_req, &=
ctx->ctrl_hdl);
> > > > > +               v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec=
, ctx->m2m_ctx, state);
> > > > >         } else {
> > > > > -               if (ret !=3D -EAGAIN) {
> > > > > +               if (ret !=3D -EAGAIN)
> > > > >                         v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > > > > -                       v4l2_m2m_buf_done(vb2_v4l2_src, state);
> > > > > -               }
> > > > >                 v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ct=
x);
> > > > >         }
> > > >
> > > > At some point I think we should unify the assumptions of the VP8,
> > > > pure single core and lat decode functions so that we don't have all
> > > > these different code paths.
> > > >
> > > > ChenYu
> > > >
> > > >
> > > > >  }
> > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/=
vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec=
/vdec_av1_req_lat_if.c
> > > > > index bf21f2467a0f..90217cc8e242 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> > > > > @@ -1071,7 +1071,8 @@ static int vdec_av1_slice_setup_lat_from_sr=
c_buf(struct vdec_av1_slice_instance
> > > > >         if (!src)
> > > > >                 return -EINVAL;
> > > > >
> > > > > -       lat_buf->src_buf_req =3D src->vb2_buf.req_obj.req;
> > > > > +       lat_buf->vb2_v4l2_src =3D src;
> > > > > +
> > > > >         dst =3D &lat_buf->ts_info;
> > > > >         v4l2_m2m_buf_copy_metadata(src, dst, true);
> > > > >         vsi->frame.cur_ts =3D dst->vb2_buf.timestamp;
> > > > > @@ -2195,7 +2196,7 @@ static int vdec_av1_slice_core_decode(struc=
t vdec_lat_buf *lat_buf)
> > > > >                        &instance->core_vsi->trans.dma_addr_end);
> > > > >         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, instance-=
>core_vsi->trans.dma_addr_end);
> > > > >
> > > > > -       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_bu=
f_req);
> > > > > +       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->vb2_v4=
l2_src);
> > > > >
> > > > >         return 0;
> > > > >
> > > > > @@ -2204,7 +2205,7 @@ static int vdec_av1_slice_core_decode(struc=
t vdec_lat_buf *lat_buf)
> > > > >         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.=
trans.dma_addr_end);
> > > > >
> > > > >         if (fb)
> > > > > -               ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf=
->src_buf_req);
> > > > > +               ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf=
->vb2_v4l2_src);
> > > > >
> > > > >         return ret;
> > > > >  }
> > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/=
vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/v=
dec/vdec_h264_req_multi_if.c
> > > > > index 1ed0ccec5665..732d78f63e5a 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h2=
64_req_multi_if.c
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h2=
64_req_multi_if.c
> > > > > @@ -533,7 +533,7 @@ static int vdec_h264_slice_core_decode(struct=
 vdec_lat_buf *lat_buf)
> > > > >
> > > > >  vdec_dec_end:
> > > > >         vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, =
share_info->trans_end);
> > > > > -       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->sr=
c_buf_req);
> > > > > +       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb=
2_v4l2_src);
> > > > >         mtk_vdec_debug(ctx, "core decode done err=3D%d", err);
> > > > >         ctx->decoded_frame_cnt++;
> > > > >         return 0;
> > > > > @@ -605,7 +605,7 @@ static int vdec_h264_slice_lat_decode(void *h=
_vdec, struct mtk_vcodec_mem *bs,
> > > > >         }
> > > > >
> > > > >         inst->vsi->dec.nal_info =3D buf[nal_start_idx];
> > > > > -       lat_buf->src_buf_req =3D src_buf_info->m2m_buf.vb.vb2_buf=
.req_obj.req;
> > > > > +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
> > > > >         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &la=
t_buf->ts_info, true);
> > > > >
> > > > >         err =3D vdec_h264_slice_fill_decode_parameters(inst, shar=
e_info);
> > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/=
vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/v=
dec/vdec_hevc_req_multi_if.c
> > > > > index aa721cc43647..f6f9f7de0005 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_he=
vc_req_multi_if.c
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_he=
vc_req_multi_if.c
> > > > > @@ -741,7 +741,7 @@ static int vdec_hevc_slice_setup_lat_buffer(s=
truct vdec_hevc_slice_inst *inst,
> > > > >         inst->vsi->bs.size =3D bs->size;
> > > > >
> > > > >         src_buf_info =3D container_of(bs, struct mtk_video_dec_bu=
f, bs_buffer);
> > > > > -       lat_buf->src_buf_req =3D src_buf_info->m2m_buf.vb.vb2_buf=
.req_obj.req;
> > > > > +       lat_buf->vb2_v4l2_src =3D &src_buf_info->m2m_buf.vb;
> > > > >         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &la=
t_buf->ts_info, true);
> > > > >
> > > > >         *res_chg =3D inst->resolution_changed;
> > > > > @@ -961,7 +961,7 @@ static int vdec_hevc_slice_core_decode(struct=
 vdec_lat_buf *lat_buf)
> > > > >
> > > > >  vdec_dec_end:
> > > > >         vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, =
share_info->trans.dma_addr_end);
> > > > > -       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->sr=
c_buf_req);
> > > > > +       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb=
2_v4l2_src);
> > > > >         mtk_vdec_debug(ctx, "core decode done err=3D%d", err);
> > > > >         ctx->decoded_frame_cnt++;
> > > > >         return 0;
> > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/=
vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec=
/vdec_vp9_req_lat_if.c
> > > > > index eea709d93820..3dceb668ba1c 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> > > > > @@ -721,7 +721,7 @@ static int vdec_vp9_slice_setup_lat_from_src_=
buf(struct vdec_vp9_slice_instance
> > > > >         if (!src)
> > > > >                 return -EINVAL;
> > > > >
> > > > > -       lat_buf->src_buf_req =3D src->vb2_buf.req_obj.req;
> > > > > +       lat_buf->vb2_v4l2_src =3D src;
> > > > >
> > > > >         dst =3D &lat_buf->ts_info;
> > > > >         v4l2_m2m_buf_copy_metadata(src, dst, true);
> > > > > @@ -2187,7 +2187,7 @@ static int vdec_vp9_slice_core_decode(struc=
t vdec_lat_buf *lat_buf)
> > > > >         mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
> > > > >                        (unsigned long)pfc->vsi.trans.dma_addr_end=
);
> > > > >         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.=
trans.dma_addr_end);
> > > > > -       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_bu=
f_req);
> > > > > +       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->vb2_v4=
l2_src);
> > > > >
> > > > >         return 0;
> > > > >
> > > > > @@ -2197,7 +2197,7 @@ static int vdec_vp9_slice_core_decode(struc=
t vdec_lat_buf *lat_buf)
> > > > >                 vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, p=
fc->vsi.trans.dma_addr_end);
> > > > >
> > > > >                 if (fb)
> > > > > -                       ctx->dev->vdec_pdata->cap_to_disp(ctx, 1,=
 lat_buf->src_buf_req);
> > > > > +                       ctx->dev->vdec_pdata->cap_to_disp(ctx, 1,=
 lat_buf->vb2_v4l2_src);
> > > > >         }
> > > > >         return ret;
> > > > >  }
> > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_=
msg_queue.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue=
.h
> > > > > index b0f576867f4b..9781de35df4b 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_que=
ue.h
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_que=
ue.h
> > > > > @@ -55,7 +55,7 @@ struct vdec_msg_queue_ctx {
> > > > >   * @rd_mv_addr:        mv addr for av1 lat hardware output, core=
 hardware input
> > > > >   * @tile_addr: tile buffer for av1 core input
> > > > >   * @ts_info: need to set timestamp from output to capture
> > > > > - * @src_buf_req: output buffer media request object
> > > > > + * @vb2_v4l2_src: vb2 buffer of output queue
> > > > >   *
> > > > >   * @private_data: shared information used to lat and core hardwa=
re
> > > > >   * @ctx: mtk vcodec context information
> > > > > @@ -71,7 +71,7 @@ struct vdec_lat_buf {
> > > > >         struct mtk_vcodec_mem rd_mv_addr;
> > > > >         struct mtk_vcodec_mem tile_addr;
> > > > >         struct vb2_v4l2_buffer ts_info;
> > > > > -       struct media_request *src_buf_req;
> > > > > +       struct vb2_v4l2_buffer *vb2_v4l2_src;
> > > > >
> > > > >         void *private_data;
> > > > >         struct mtk_vcodec_dec_ctx *ctx;
> > > > > --
> > > > > 2.46.0
> > > > >
> > > >
>

