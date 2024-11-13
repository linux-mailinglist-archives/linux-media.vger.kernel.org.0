Return-Path: <linux-media+bounces-21387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDB59C79E6
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 18:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BFC1B2DAE6
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 16:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD7B170A16;
	Wed, 13 Nov 2024 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JmNX/z2e"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A314AD20;
	Wed, 13 Nov 2024 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731515862; cv=none; b=R76cTF3k7/+FEVKJgCZSjxvcU/2jAUp1ngGtEYJ1r1kRdo1u+TQJ50snJ5z6AgqkM2m0/tbdpP/tghtvB14WNsLm16CfhgiMY+NkDro2jx/T3+DSdgBMbwhFhKi52yZd8KifDVXBkrM3Yv02TKP0qnJEr6KgqzowGW3s3SxPIKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731515862; c=relaxed/simple;
	bh=nr957Ztpze0VJosEE18kRsQ3mFTKTocUMF9XBRP5haU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ak1ReZWJzKcBP/A7eWPf787J3lH5WMovSl7J+jZqSP0gnKPuzjvZ4UkBHDAdRIU9sCx0/ZgUZWWakEAU5sTjKgYeMtJ2ArHRpBI9W2Fmw7pBZO+Isb3Ak12vUKPNPlHDMHMSJ4xiuHKENgtvI9FQTtnfiiN77EllfnfAnlHFAVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JmNX/z2e; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731515855;
	bh=nr957Ztpze0VJosEE18kRsQ3mFTKTocUMF9XBRP5haU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JmNX/z2edxXgvFKVyKSL75laSxOFkK/EhfxUqY9+6OvcvpPJPGgM/QGXTIKE8Ir92
	 g95PTo40/OZS8H9jY9yv3jCHRWCfxk/2RPvaAlvIjG3hWz+SNYPSycHSXRkjOPi1Rn
	 Tuw/Iafkak2M1JMic5ShX4S58GxGcrShj2Pjgu6OitmJIMGcHBd904hyautGMVeUx2
	 zRmVjtGa3uU2PFRRKyKVZ+q1aeKy/XCuRD2Yjh40JH56Qdkuwvm7T3VEedCccldCnH
	 eIDekKCStYl+q8ALubMxsS5/2BDUbLgbwG+yjR0+rSnttE4a4CI28tOd7BGt47NgHT
	 DNtnQQ708DHNQ==
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:862e::580])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC9F017E36FF;
	Wed, 13 Nov 2024 17:37:32 +0100 (CET)
Message-ID: <2658623bf91cf6e4a6b36ae17bd005c158a7d86b.camel@collabora.com>
Subject: Re: [PATCH v6 1/5] media: mediatek: vcodec: setting request
 complete before buffer done
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Yunfei Dong	
 <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"	
 <nfraprado@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert
 <nhebert@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig	
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho	
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Wed, 13 Nov 2024 11:37:31 -0500
In-Reply-To: <CAGXv+5Ge3DfUvL8yC+9it=wG1s91NW7O3qu+hM35K6J2VmST0w@mail.gmail.com>
References: <20241108033219.19804-1-yunfei.dong@mediatek.com>
	 <20241108033219.19804-2-yunfei.dong@mediatek.com>
	 <CAGXv+5Eyyyvv-1a+eH=xQyL0LaBmjqy0dvOUeiBS2RsuWSdshA@mail.gmail.com>
	 <20241108081814.tv2hch6ti3npvnrp@basti-XPS-13-9310>
	 <CAGXv+5FoUudJ=R52yAR0Mzwd49aBSxejkOENSfrix0Z3WJBv-A@mail.gmail.com>
	 <aebdd23a8039e667cd288b5be20730447b692a30.camel@collabora.com>
	 <CAGXv+5Ge3DfUvL8yC+9it=wG1s91NW7O3qu+hM35K6J2VmST0w@mail.gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chen-Yu,

Le lundi 11 novembre 2024 à 15:40 +0800, Chen-Yu Tsai a écrit :
> On Fri, Nov 8, 2024 at 9:42 PM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> > 
> > Hi Chen-Yu,
> > 
> > Le vendredi 08 novembre 2024 à 16:50 +0800, Chen-Yu Tsai a écrit :
> > > On Fri, Nov 8, 2024 at 4:18 PM Sebastian Fricke
> > > <sebastian.fricke@collabora.com> wrote:
> > > > 
> > > > Hey Yunfei & Chen-Yu,
> > > > 
> > > > On 08.11.2024 15:49, Chen-Yu Tsai wrote:
> > > > > On Fri, Nov 8, 2024 at 11:32 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> > > > > > 
> > > > > > The request status of output queue is set to MEDIA_REQUEST_STATE_COMPLETE
> > > > > > when user space dequeue output buffer. Will get below warning if the
> > > > > > driver calling v4l2_ctrl_request_complete to set media request complete,
> > > > > > must to change the function order, calling v4l2_ctrl_request_complete
> > > > > > before v4l2_m2m_buf_done.
> > > > > > 
> > > > > > Workqueue: core-decoder vdec_msg_queue_core_work [mtk_vcodec_dec]
> > > > > > pstate: 80c00089 (Nzcv daIf +PAN +UAO -TCO BTYPE=--)
> > > > > > pc : media_request_object_bind+0xa8/0x124
> > > > > > lr : media_request_object_bind+0x50/0x124
> > > > > > sp : ffffffc011393be0
> > > > > > x29: ffffffc011393be0 x28: 0000000000000000
> > > > > > x27: ffffff890c280248 x26: ffffffe21a71ab88
> > > > > > x25: 0000000000000000 x24: ffffff890c280280
> > > > > > x23: ffffff890c280280 x22: 00000000fffffff0
> > > > > > x21: 0000000000000000 x20: ffffff890260d280
> > > > > > x19: ffffff890260d2e8 x18: 0000000000001000
> > > > > > x17: 0000000000000400 x16: ffffffe21a4584a0
> > > > > > x15: 000000000053361d x14: 0000000000000018
> > > > > > x13: 0000000000000004 x12: ffffffa82427d000
> > > > > > x11: ffffffe21ac3fce0 x10: 0000000000000001
> > > > > > x9 : 0000000000000000 x8 : 0000000000000003
> > > > > > x7 : 0000000000000000 x6 : 000000000000003f
> > > > > > x5 : 0000000000000040 x4 : ffffff89052e7b98
> > > > > > x3 : 0000000000000000 x2 : 0000000000000001
> > > > > > x1 : 0000000000000000 x0 : 0000000000000000
> > > > > > Call trace:
> > > > > >  media_request_object_bind+0xa8/0x124
> > > > > >  v4l2_ctrl_request_bind+0xc4/0x168
> > > > > >  v4l2_ctrl_request_complete+0x198/0x1f4
> > > > > >  mtk_vdec_stateless_cap_to_disp+0x58/0x8c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
> > > > > >  vdec_vp9_slice_core_decode+0x1c0/0x268 [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
> > > > > >  vdec_msg_queue_core_work+0x60/0x11c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
> > > > > >  process_one_work+0x140/0x480
> > > > > >  worker_thread+0x12c/0x2f8
> > > > > >  kthread+0x13c/0x1d8
> > > > > >  ret_from_fork+0x10/0x30
> > > > > > 
> > > > > > Fixes: 7b182b8d9c852 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
> > > > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > > 
> > > > > The changes look OK, so
> > > > > 
> > > > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > 
> > > > Sorry for the late reply, I am currently finishing up a change-set that
> > > > utilizes https://patchwork.linuxtv.org/project/linux-media/list/?series=13489
> > > > which is the prefered solution. I think there has been some
> > > > misunderstanding when I last talked about that in a previous version.
> > > > Using the manual request completion will be the cleaner solution because
> > > > it allows sending new bitstream data as soon as the LAT core finishes
> > > > the previous data, which doesn't decrease performance.
> > > 
> > > I don't think manual request completion is really needed.
> > > 
> > > The driver could be reworked so that when the VP8 / pure core / lat
> > > decoder functions return, v4l2_ctrl_request_complete() is called
> > > and the source buffer is removed and marked as done. It should
> > > probably also remove a destination buffer and pass that to the
> > > core decode worker, i.e. it should consume source and destination
> > > buffers in pairs.
> > 
> > You are ignoring the fundamental issue in the framework that we are trying to
> > solve. While for single core driver it does not matter, the current approach
> > imply an execution order of:
> > 
> > - QBUF capture / output
> > - Q of request
> > - A job is created, but simply trigger a workqueue**
> > - The workqueue operate the LAT synchronously and triggers the CORE workqueue
> > - The core workqueue process execute on CORE
> > - After everything is done:
> >   - capture buffer is marked done
> >   - controls are applied
> >   - the output buffer is marked done
> 
> IIUC as soon as the output buffer is marked done, the request is marked
> as completed, so the marking of the output buffer can't be done sooner.
> 
> So what I think I'm missing is why completing the request early is a
> problem. Otherwise manual completion isn't needed.

Completing the request imply signalling its FD. The signalling of the request FD
should only happen when the requested operation is completed. See:

https://www.kernel.org/doc/html/latest/userspace-api/media/mediactl/request-api.html#request-submission

   User-space can poll() a request file descriptor in order to wait until the
   request completes. A request is considered complete once all its associated
   buffers are available for dequeuing and all the associated controls have been
   updated with the values at the time of completion. Note that user-space does
   not need to wait for the request to complete to dequeue its buffers: buffers
   that are available halfway through a request can be dequeued independently of
   the request’s state.
   
> 
> BTW, the stateless decoder spec is really unclear on what should be polled
> for to wait for a decoded frame, which is what the user ultimately wants.

We can link this back into the stateless decoder doc perhaps (or repeat it), but
to me this isn't as unclear as stated in your comment.

Following the doc, it means that signalling the request (which is bound to
completing the request) must happen after the picture buffer resulting from the
decode operation has been marked done. GStreamer makes heavy use of this,
replacing the polling of queues with polling the requests only. Request works
similarly to an out fence.

Nicolas

> 
> > While the order is not strict in the spec (and should not) this introduces
> > inefficient buffer usage pattern. There is a logical order for these event to
> > occure, and the manual request completion solves this, and reduce the driver
> > complexicity. With the manual request, it is simple and you can achieve logical
> > even ordering, allowing to reuse bitstream buffers while the CORE is running.
> > 
> > - QBUF capture / output
> > - Q of request
> > - LAT is programmed using the controls
> >   - Controls are applied (v4l2_ctrl_request_complete())
> > - LAT completes
> >   - Output buffer is marked done
> > - CORE is programmed with the scrath buffer from LAT
> > - CORE completes
> >   - capture buffer is marked done
> >   - request is manually marked complete
> 
> I agree that this is what it should look like. Everything can be done
> by moving the calls around if early completion isn't an issue.
> 
> > Nicolas
> > 
> > ** The VCODEC driver make use of unneeded workqueue to satisfy a very uncommon
> > programming pattern. This pattern is discourage as it introduce spurious context
> > switching within the driver, reducing its performance. We have decided to let
> > this go few years ago, but  still believe this approach is bad practice. I'm
> > just explaining myself here, no action required.
> 
> I think we can at least get rid of the workqueue triggered from the
> .device_run callback. I don't really see what the pattern is though.
> To me it just seems like an unnecessary layer.
> 
> > > 
> > > And IIUC the next job is scheduled when v4l2_m2m_job_finish() is called,
> > > which is basically when the LAT core finishes.
> > 
> > The output buffer is held on, but it should be marked done to let userspace fill
> > it back concurrently. With the change, you must allocate an extra one if you
> > want this parallelism.
> 
> Again, that is because it can't be marked as done when the LAT core
> finishes.
> 
> 
> Thanks
> ChenYu
> 
> > > 
> > > > The plan would be for Yunfei to take that patch set of mine and rebase
> > > > his changes on top.
> > > 
> > > Just to clarify, what changes will your patch set cover?
> > 
> > This is also aligned with the feedback from folks working on MTK secure video
> > path, which claims they are running out of secure zones. Each vb2 buffer is a
> > zone, I don't currently have an easy solution to that.
> > 
> > Nicolas
> > 
> > > 
> > > 
> > > Thanks
> > > ChenYu
> > > 
> > > > Regards,
> > > > Sebastian
> > > > 
> > > > > 
> > > > > > ---
> > > > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c    |  4 ++--
> > > > > >  .../vcodec/decoder/mtk_vcodec_dec_drv.h         |  2 +-
> > > > > >  .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 17 ++++++++++++-----
> > > > > >  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c   |  7 ++++---
> > > > > >  .../decoder/vdec/vdec_h264_req_multi_if.c       |  4 ++--
> > > > > >  .../decoder/vdec/vdec_hevc_req_multi_if.c       |  4 ++--
> > > > > >  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   |  6 +++---
> > > > > >  .../mediatek/vcodec/decoder/vdec_msg_queue.h    |  4 ++--
> > > > > >  8 files changed, 28 insertions(+), 20 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> > > > > > index 98838217b97d..2b787e60a1f9 100644
> > > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> > > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> > > > > > @@ -887,10 +887,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> > > > > >                         if (src_buf != &ctx->empty_flush_buf.vb) {
> > > > > >                                 struct media_request *req =
> > > > > >                                         src_buf->vb2_buf.req_obj.req;
> > > > > > -                               v4l2_m2m_buf_done(src_buf,
> > > > > > -                                               VB2_BUF_STATE_ERROR);
> > > > > > +
> > > > > >                                 if (req)
> > > > > >                                         v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
> > > > > > +                               v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> > > > > >                         }
> > > > > >                 }
> > > > > >                 return;
> > > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > > > > > index ac568ed14fa2..1fabe8c5b7a4 100644
> > > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > > > > > @@ -111,7 +111,7 @@ struct mtk_vcodec_dec_pdata {
> > > > > >         int (*flush_decoder)(struct mtk_vcodec_dec_ctx *ctx);
> > > > > >         struct vdec_fb *(*get_cap_buffer)(struct mtk_vcodec_dec_ctx *ctx);
> > > > > >         void (*cap_to_disp)(struct mtk_vcodec_dec_ctx *ctx, int error,
> > > > > > -                           struct media_request *src_buf_req);
> > > > > > +                           struct vb2_v4l2_buffer *vb2_v4l2_src);
> > > > > > 
> > > > > >         const struct vb2_ops *vdec_vb2_ops;
> > > > > > 
> > > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> > > > > > index afa224da0f41..750f98c1226d 100644
> > > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> > > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> > > > > > @@ -245,10 +245,11 @@ static const struct v4l2_frmsize_stepwise stepwise_fhd = {
> > > > > >  };
> > > > > > 
> > > > > >  static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int error,
> > > > > > -                                          struct media_request *src_buf_req)
> > > > > > +                                          struct vb2_v4l2_buffer *vb2_v4l2_src)
> > > > > >  {
> > > > > >         struct vb2_v4l2_buffer *vb2_dst;
> > > > > >         enum vb2_buffer_state state;
> > > > > > +       struct media_request *src_buf_req;
> > > > > > 
> > > > > >         if (error)
> > > > > >                 state = VB2_BUF_STATE_ERROR;
> > > > > > @@ -264,8 +265,16 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
> > > > > >                 mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
> > > > > >         }
> > > > > > 
> > > > > > +       if (!vb2_v4l2_src) {
> > > > > > +               mtk_v4l2_vdec_err(ctx, "get src buffer NULL");
> > > > > > +               return;
> > > > > > +       }
> > > > > > +
> > > > > > +       src_buf_req = vb2_v4l2_src->vb2_buf.req_obj.req;
> > > > > >         if (src_buf_req)
> > > > > >                 v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> > > > > > +
> > > > > > +       v4l2_m2m_buf_done(vb2_v4l2_src, state);
> > > > > >  }
> > > > > > 
> > > > > >  static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
> > > > > > @@ -374,14 +383,12 @@ static void mtk_vdec_worker(struct work_struct *work)
> > > > > >         state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> > > > > >         if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
> > > > > >             ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
> > > > > > -               v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
> > > > > >                 if (src_buf_req)
> > > > > >                         v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> > > > > > +               v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
> > > > > >         } else {
> > > > > > -               if (ret != -EAGAIN) {
> > > > > > +               if (ret != -EAGAIN)
> > > > > >                         v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > > > > > -                       v4l2_m2m_buf_done(vb2_v4l2_src, state);
> > > > > > -               }
> > > > > >                 v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> > > > > >         }
> > > > > 
> > > > > At some point I think we should unify the assumptions of the VP8,
> > > > > pure single core and lat decode functions so that we don't have all
> > > > > these different code paths.
> > > > > 
> > > > > ChenYu
> > > > > 
> > > > > 
> > > > > >  }
> > > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
> > > > > > index bf21f2467a0f..90217cc8e242 100644
> > > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
> > > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
> > > > > > @@ -1071,7 +1071,8 @@ static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance
> > > > > >         if (!src)
> > > > > >                 return -EINVAL;
> > > > > > 
> > > > > > -       lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
> > > > > > +       lat_buf->vb2_v4l2_src = src;
> > > > > > +
> > > > > >         dst = &lat_buf->ts_info;
> > > > > >         v4l2_m2m_buf_copy_metadata(src, dst, true);
> > > > > >         vsi->frame.cur_ts = dst->vb2_buf.timestamp;
> > > > > > @@ -2195,7 +2196,7 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
> > > > > >                        &instance->core_vsi->trans.dma_addr_end);
> > > > > >         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, instance->core_vsi->trans.dma_addr_end);
> > > > > > 
> > > > > > -       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
> > > > > > +       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->vb2_v4l2_src);
> > > > > > 
> > > > > >         return 0;
> > > > > > 
> > > > > > @@ -2204,7 +2205,7 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
> > > > > >         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
> > > > > > 
> > > > > >         if (fb)
> > > > > > -               ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req);
> > > > > > +               ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->vb2_v4l2_src);
> > > > > > 
> > > > > >         return ret;
> > > > > >  }
> > > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> > > > > > index 1ed0ccec5665..732d78f63e5a 100644
> > > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> > > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> > > > > > @@ -533,7 +533,7 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
> > > > > > 
> > > > > >  vdec_dec_end:
> > > > > >         vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
> > > > > > -       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
> > > > > > +       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb2_v4l2_src);
> > > > > >         mtk_vdec_debug(ctx, "core decode done err=%d", err);
> > > > > >         ctx->decoded_frame_cnt++;
> > > > > >         return 0;
> > > > > > @@ -605,7 +605,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> > > > > >         }
> > > > > > 
> > > > > >         inst->vsi->dec.nal_info = buf[nal_start_idx];
> > > > > > -       lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
> > > > > > +       lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
> > > > > >         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
> > > > > > 
> > > > > >         err = vdec_h264_slice_fill_decode_parameters(inst, share_info);
> > > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> > > > > > index aa721cc43647..f6f9f7de0005 100644
> > > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> > > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> > > > > > @@ -741,7 +741,7 @@ static int vdec_hevc_slice_setup_lat_buffer(struct vdec_hevc_slice_inst *inst,
> > > > > >         inst->vsi->bs.size = bs->size;
> > > > > > 
> > > > > >         src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
> > > > > > -       lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
> > > > > > +       lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
> > > > > >         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
> > > > > > 
> > > > > >         *res_chg = inst->resolution_changed;
> > > > > > @@ -961,7 +961,7 @@ static int vdec_hevc_slice_core_decode(struct vdec_lat_buf *lat_buf)
> > > > > > 
> > > > > >  vdec_dec_end:
> > > > > >         vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans.dma_addr_end);
> > > > > > -       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
> > > > > > +       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb2_v4l2_src);
> > > > > >         mtk_vdec_debug(ctx, "core decode done err=%d", err);
> > > > > >         ctx->decoded_frame_cnt++;
> > > > > >         return 0;
> > > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> > > > > > index eea709d93820..3dceb668ba1c 100644
> > > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> > > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> > > > > > @@ -721,7 +721,7 @@ static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance
> > > > > >         if (!src)
> > > > > >                 return -EINVAL;
> > > > > > 
> > > > > > -       lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
> > > > > > +       lat_buf->vb2_v4l2_src = src;
> > > > > > 
> > > > > >         dst = &lat_buf->ts_info;
> > > > > >         v4l2_m2m_buf_copy_metadata(src, dst, true);
> > > > > > @@ -2187,7 +2187,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
> > > > > >         mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
> > > > > >                        (unsigned long)pfc->vsi.trans.dma_addr_end);
> > > > > >         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
> > > > > > -       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
> > > > > > +       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->vb2_v4l2_src);
> > > > > > 
> > > > > >         return 0;
> > > > > > 
> > > > > > @@ -2197,7 +2197,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
> > > > > >                 vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
> > > > > > 
> > > > > >                 if (fb)
> > > > > > -                       ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req);
> > > > > > +                       ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->vb2_v4l2_src);
> > > > > >         }
> > > > > >         return ret;
> > > > > >  }
> > > > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
> > > > > > index b0f576867f4b..9781de35df4b 100644
> > > > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
> > > > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
> > > > > > @@ -55,7 +55,7 @@ struct vdec_msg_queue_ctx {
> > > > > >   * @rd_mv_addr:        mv addr for av1 lat hardware output, core hardware input
> > > > > >   * @tile_addr: tile buffer for av1 core input
> > > > > >   * @ts_info: need to set timestamp from output to capture
> > > > > > - * @src_buf_req: output buffer media request object
> > > > > > + * @vb2_v4l2_src: vb2 buffer of output queue
> > > > > >   *
> > > > > >   * @private_data: shared information used to lat and core hardware
> > > > > >   * @ctx: mtk vcodec context information
> > > > > > @@ -71,7 +71,7 @@ struct vdec_lat_buf {
> > > > > >         struct mtk_vcodec_mem rd_mv_addr;
> > > > > >         struct mtk_vcodec_mem tile_addr;
> > > > > >         struct vb2_v4l2_buffer ts_info;
> > > > > > -       struct media_request *src_buf_req;
> > > > > > +       struct vb2_v4l2_buffer *vb2_v4l2_src;
> > > > > > 
> > > > > >         void *private_data;
> > > > > >         struct mtk_vcodec_dec_ctx *ctx;
> > > > > > --
> > > > > > 2.46.0
> > > > > > 
> > > > > 
> > 
> 


