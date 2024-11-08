Return-Path: <linux-media+bounces-21112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A683B9C17A7
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 09:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05E08B23BC9
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A431DB55C;
	Fri,  8 Nov 2024 08:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="IGbPDH05"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D46D1D0F51;
	Fri,  8 Nov 2024 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053919; cv=pass; b=g0NLj0ae7kMR91ghKRKInxbAhGOsr1kHj3i0EtMVmllwO+55zgWr4Z/8VjlYlUAGqyBYGmsicFDpG8Gawp1AtdfG+J/wQeZp+uGJ73iZPmegP3tLoeGoMdLgTG5x/0oIuyq+TaCHh7o4zqh7d4S8s+A8l1awNR2k4675KayeCug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053919; c=relaxed/simple;
	bh=JZIA5hlYEfMpfsiHE/TPaYWNie0Xwyqs0N5C+5PKA7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIU92nn/vb+XMdsYzd5ZFjWmjXnme9wGluTfYamxmdyD89lwY8ISSr4A/R1wceh8g/qAm685ZXmiYs05AwhuPodFmygGI4jfJeoIcqstF+zsqv/AwqY5K1xBjREBQQfiCyopRcqPf0PpJHN68q02oN+X/pSGqoUUNB84xauFZOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=IGbPDH05; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731053901; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=flcD8uZOdOntkSuXystrondF1citQssDYwOxbJtKolCRU8cEvZTToQJt0LbToYtT7rJSw8PXatPW6Ic+fyZOtCfxBQikzkSc3hpyVvGSACYKxDddaTJRVAe7/8333HG64i24Fr+X0rUoGP0loZTNm5iBSe3/1QeV9mos5l9Pt6I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731053901; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Q5+coNEV6XOqk5xCGXi5Fpc11eaKgbFIC1vDq+qwALQ=; 
	b=PCLRvR0gKc0LCbS2hS8qeKS9YeSi8CR25YGuiHLlkYsn+c5sxQKSTkIhxiMmdG9TSMrDIWA7+sZavgwZ8mVwrUJzSqpkUA7C5xF6lQOcmUzeaFqzJ8BTbec5o/XrFPw1AWX6ND8Az2KSNIv7cXkEyAVXJmO1op9pAAOo/DBDqAU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731053901;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=Q5+coNEV6XOqk5xCGXi5Fpc11eaKgbFIC1vDq+qwALQ=;
	b=IGbPDH05V+XJ1wMUf2v5uVDw5FJuJSGf49KNrVVMQ9M4XCQ9Dseeoa0Lpy+U+/Tu
	RKQT25GT7GCz81Vq8cVm9yIUmNbhbPWAHvIaqyzlRr8UPvGPRWPBhSkSd/4uLGIiUsX
	gFwDNgBwHBro242jEnaKDfbA/2gUlRry1Tt56a1s=
Received: by mx.zohomail.com with SMTPS id 1731053899547539.0939062837808;
	Fri, 8 Nov 2024 00:18:19 -0800 (PST)
Date: Fri, 8 Nov 2024 09:18:14 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 1/5] media: mediatek: vcodec: setting request complete
 before buffer done
Message-ID: <20241108081814.tv2hch6ti3npvnrp@basti-XPS-13-9310>
References: <20241108033219.19804-1-yunfei.dong@mediatek.com>
 <20241108033219.19804-2-yunfei.dong@mediatek.com>
 <CAGXv+5Eyyyvv-1a+eH=xQyL0LaBmjqy0dvOUeiBS2RsuWSdshA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Eyyyvv-1a+eH=xQyL0LaBmjqy0dvOUeiBS2RsuWSdshA@mail.gmail.com>
X-ZohoMailClient: External

Hey Yunfei & Chen-Yu,

On 08.11.2024 15:49, Chen-Yu Tsai wrote:
>On Fri, Nov 8, 2024 at 11:32 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>>
>> The request status of output queue is set to MEDIA_REQUEST_STATE_COMPLETE
>> when user space dequeue output buffer. Will get below warning if the
>> driver calling v4l2_ctrl_request_complete to set media request complete,
>> must to change the function order, calling v4l2_ctrl_request_complete
>> before v4l2_m2m_buf_done.
>>
>> Workqueue: core-decoder vdec_msg_queue_core_work [mtk_vcodec_dec]
>> pstate: 80c00089 (Nzcv daIf +PAN +UAO -TCO BTYPE=--)
>> pc : media_request_object_bind+0xa8/0x124
>> lr : media_request_object_bind+0x50/0x124
>> sp : ffffffc011393be0
>> x29: ffffffc011393be0 x28: 0000000000000000
>> x27: ffffff890c280248 x26: ffffffe21a71ab88
>> x25: 0000000000000000 x24: ffffff890c280280
>> x23: ffffff890c280280 x22: 00000000fffffff0
>> x21: 0000000000000000 x20: ffffff890260d280
>> x19: ffffff890260d2e8 x18: 0000000000001000
>> x17: 0000000000000400 x16: ffffffe21a4584a0
>> x15: 000000000053361d x14: 0000000000000018
>> x13: 0000000000000004 x12: ffffffa82427d000
>> x11: ffffffe21ac3fce0 x10: 0000000000000001
>> x9 : 0000000000000000 x8 : 0000000000000003
>> x7 : 0000000000000000 x6 : 000000000000003f
>> x5 : 0000000000000040 x4 : ffffff89052e7b98
>> x3 : 0000000000000000 x2 : 0000000000000001
>> x1 : 0000000000000000 x0 : 0000000000000000
>> Call trace:
>>  media_request_object_bind+0xa8/0x124
>>  v4l2_ctrl_request_bind+0xc4/0x168
>>  v4l2_ctrl_request_complete+0x198/0x1f4
>>  mtk_vdec_stateless_cap_to_disp+0x58/0x8c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
>>  vdec_vp9_slice_core_decode+0x1c0/0x268 [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
>>  vdec_msg_queue_core_work+0x60/0x11c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
>>  process_one_work+0x140/0x480
>>  worker_thread+0x12c/0x2f8
>>  kthread+0x13c/0x1d8
>>  ret_from_fork+0x10/0x30
>>
>> Fixes: 7b182b8d9c852 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
>The changes look OK, so
>
>Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Sorry for the late reply, I am currently finishing up a change-set that
utilizes https://patchwork.linuxtv.org/project/linux-media/list/?series=13489
which is the prefered solution. I think there has been some
misunderstanding when I last talked about that in a previous version.
Using the manual request completion will be the cleaner solution because
it allows sending new bitstream data as soon as the LAT core finishes
the previous data, which doesn't decrease performance.

The plan would be for Yunfei to take that patch set of mine and rebase
his changes on top.

Regards,
Sebastian

>
>> ---
>>  .../mediatek/vcodec/decoder/mtk_vcodec_dec.c    |  4 ++--
>>  .../vcodec/decoder/mtk_vcodec_dec_drv.h         |  2 +-
>>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 17 ++++++++++++-----
>>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c   |  7 ++++---
>>  .../decoder/vdec/vdec_h264_req_multi_if.c       |  4 ++--
>>  .../decoder/vdec/vdec_hevc_req_multi_if.c       |  4 ++--
>>  .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c   |  6 +++---
>>  .../mediatek/vcodec/decoder/vdec_msg_queue.h    |  4 ++--
>>  8 files changed, 28 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>> index 98838217b97d..2b787e60a1f9 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>> @@ -887,10 +887,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
>>                         if (src_buf != &ctx->empty_flush_buf.vb) {
>>                                 struct media_request *req =
>>                                         src_buf->vb2_buf.req_obj.req;
>> -                               v4l2_m2m_buf_done(src_buf,
>> -                                               VB2_BUF_STATE_ERROR);
>> +
>>                                 if (req)
>>                                         v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
>> +                               v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>>                         }
>>                 }
>>                 return;
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>> index ac568ed14fa2..1fabe8c5b7a4 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>> @@ -111,7 +111,7 @@ struct mtk_vcodec_dec_pdata {
>>         int (*flush_decoder)(struct mtk_vcodec_dec_ctx *ctx);
>>         struct vdec_fb *(*get_cap_buffer)(struct mtk_vcodec_dec_ctx *ctx);
>>         void (*cap_to_disp)(struct mtk_vcodec_dec_ctx *ctx, int error,
>> -                           struct media_request *src_buf_req);
>> +                           struct vb2_v4l2_buffer *vb2_v4l2_src);
>>
>>         const struct vb2_ops *vdec_vb2_ops;
>>
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>> index afa224da0f41..750f98c1226d 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>> @@ -245,10 +245,11 @@ static const struct v4l2_frmsize_stepwise stepwise_fhd = {
>>  };
>>
>>  static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int error,
>> -                                          struct media_request *src_buf_req)
>> +                                          struct vb2_v4l2_buffer *vb2_v4l2_src)
>>  {
>>         struct vb2_v4l2_buffer *vb2_dst;
>>         enum vb2_buffer_state state;
>> +       struct media_request *src_buf_req;
>>
>>         if (error)
>>                 state = VB2_BUF_STATE_ERROR;
>> @@ -264,8 +265,16 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
>>                 mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
>>         }
>>
>> +       if (!vb2_v4l2_src) {
>> +               mtk_v4l2_vdec_err(ctx, "get src buffer NULL");
>> +               return;
>> +       }
>> +
>> +       src_buf_req = vb2_v4l2_src->vb2_buf.req_obj.req;
>>         if (src_buf_req)
>>                 v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
>> +
>> +       v4l2_m2m_buf_done(vb2_v4l2_src, state);
>>  }
>>
>>  static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
>> @@ -374,14 +383,12 @@ static void mtk_vdec_worker(struct work_struct *work)
>>         state = ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
>>         if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
>>             ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
>> -               v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
>>                 if (src_buf_req)
>>                         v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
>> +               v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
>>         } else {
>> -               if (ret != -EAGAIN) {
>> +               if (ret != -EAGAIN)
>>                         v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
>> -                       v4l2_m2m_buf_done(vb2_v4l2_src, state);
>> -               }
>>                 v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>>         }
>
>At some point I think we should unify the assumptions of the VP8,
>pure single core and lat decode functions so that we don't have all
>these different code paths.
>
>ChenYu
>
>
>>  }
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
>> index bf21f2467a0f..90217cc8e242 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
>> @@ -1071,7 +1071,8 @@ static int vdec_av1_slice_setup_lat_from_src_buf(struct vdec_av1_slice_instance
>>         if (!src)
>>                 return -EINVAL;
>>
>> -       lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
>> +       lat_buf->vb2_v4l2_src = src;
>> +
>>         dst = &lat_buf->ts_info;
>>         v4l2_m2m_buf_copy_metadata(src, dst, true);
>>         vsi->frame.cur_ts = dst->vb2_buf.timestamp;
>> @@ -2195,7 +2196,7 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
>>                        &instance->core_vsi->trans.dma_addr_end);
>>         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, instance->core_vsi->trans.dma_addr_end);
>>
>> -       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
>> +       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->vb2_v4l2_src);
>>
>>         return 0;
>>
>> @@ -2204,7 +2205,7 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
>>         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
>>
>>         if (fb)
>> -               ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req);
>> +               ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->vb2_v4l2_src);
>>
>>         return ret;
>>  }
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>> index 1ed0ccec5665..732d78f63e5a 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
>> @@ -533,7 +533,7 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
>>
>>  vdec_dec_end:
>>         vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
>> -       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
>> +       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb2_v4l2_src);
>>         mtk_vdec_debug(ctx, "core decode done err=%d", err);
>>         ctx->decoded_frame_cnt++;
>>         return 0;
>> @@ -605,7 +605,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>>         }
>>
>>         inst->vsi->dec.nal_info = buf[nal_start_idx];
>> -       lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
>> +       lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
>>         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
>>
>>         err = vdec_h264_slice_fill_decode_parameters(inst, share_info);
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
>> index aa721cc43647..f6f9f7de0005 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
>> @@ -741,7 +741,7 @@ static int vdec_hevc_slice_setup_lat_buffer(struct vdec_hevc_slice_inst *inst,
>>         inst->vsi->bs.size = bs->size;
>>
>>         src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
>> -       lat_buf->src_buf_req = src_buf_info->m2m_buf.vb.vb2_buf.req_obj.req;
>> +       lat_buf->vb2_v4l2_src = &src_buf_info->m2m_buf.vb;
>>         v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb, &lat_buf->ts_info, true);
>>
>>         *res_chg = inst->resolution_changed;
>> @@ -961,7 +961,7 @@ static int vdec_hevc_slice_core_decode(struct vdec_lat_buf *lat_buf)
>>
>>  vdec_dec_end:
>>         vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans.dma_addr_end);
>> -       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
>> +       ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->vb2_v4l2_src);
>>         mtk_vdec_debug(ctx, "core decode done err=%d", err);
>>         ctx->decoded_frame_cnt++;
>>         return 0;
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> index eea709d93820..3dceb668ba1c 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> @@ -721,7 +721,7 @@ static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance
>>         if (!src)
>>                 return -EINVAL;
>>
>> -       lat_buf->src_buf_req = src->vb2_buf.req_obj.req;
>> +       lat_buf->vb2_v4l2_src = src;
>>
>>         dst = &lat_buf->ts_info;
>>         v4l2_m2m_buf_copy_metadata(src, dst, true);
>> @@ -2187,7 +2187,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
>>         mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
>>                        (unsigned long)pfc->vsi.trans.dma_addr_end);
>>         vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
>> -       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
>> +       ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->vb2_v4l2_src);
>>
>>         return 0;
>>
>> @@ -2197,7 +2197,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
>>                 vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
>>
>>                 if (fb)
>> -                       ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->src_buf_req);
>> +                       ctx->dev->vdec_pdata->cap_to_disp(ctx, 1, lat_buf->vb2_v4l2_src);
>>         }
>>         return ret;
>>  }
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
>> index b0f576867f4b..9781de35df4b 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.h
>> @@ -55,7 +55,7 @@ struct vdec_msg_queue_ctx {
>>   * @rd_mv_addr:        mv addr for av1 lat hardware output, core hardware input
>>   * @tile_addr: tile buffer for av1 core input
>>   * @ts_info: need to set timestamp from output to capture
>> - * @src_buf_req: output buffer media request object
>> + * @vb2_v4l2_src: vb2 buffer of output queue
>>   *
>>   * @private_data: shared information used to lat and core hardware
>>   * @ctx: mtk vcodec context information
>> @@ -71,7 +71,7 @@ struct vdec_lat_buf {
>>         struct mtk_vcodec_mem rd_mv_addr;
>>         struct mtk_vcodec_mem tile_addr;
>>         struct vb2_v4l2_buffer ts_info;
>> -       struct media_request *src_buf_req;
>> +       struct vb2_v4l2_buffer *vb2_v4l2_src;
>>
>>         void *private_data;
>>         struct mtk_vcodec_dec_ctx *ctx;
>> --
>> 2.46.0
>>
>

