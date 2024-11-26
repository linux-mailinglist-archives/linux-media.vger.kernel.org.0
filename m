Return-Path: <linux-media+bounces-22064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD229D9306
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 09:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7C9A163B9C
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 08:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59521991A4;
	Tue, 26 Nov 2024 08:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="WWtHciXm"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2598156F5D;
	Tue, 26 Nov 2024 08:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732608292; cv=pass; b=uLm7StrYeoX7yn/XwWgWjQmhaWcbe4Un96OBj0OqUwZHnDs2AY+NZbCmLbB/geYOSRbp4g+YGxc+s480+LpV3xAHLuFEaHnMGm93hvg3STfcyAMcPaDWKAXKBbx1aazJhk2kCZRodHV4r1ACbnoagieM7QtXPShlctaW+J8NTCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732608292; c=relaxed/simple;
	bh=uPjuZD0WxVaKd84sycXdBP3a/7AXiaWanBS3NX0DSZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2uRuPauQf9VfKBLvCzGlbfFpIkqnamMV3zCZxiwyfwIuPUYnVRZeN1J+ViCZjv8h4+SZigA0CEP8p63x50xPs3yV2nI8WBBXP8PwaOjhLVcMPQA7uiCA4WNCZIMErvzQpqHb+yctWe/YwZ+yMoxYT0MTdmAgxAn5zOECu80HrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=WWtHciXm; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1732608265; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UvvLFPJqE1oeeNGaBSnKujv4XjJ/NfXb3AOu0V2VL2pxeg0XRF2kpKyu3L3IF03Z2Vc114osM7k+pfS79zqhZH95p45U0Q1NkCeiO9W1M6LgumK3+r/Zxf6uYb5cc0bmGrj8X+JS+p8RE8FrMzSQ5rYJGABTu5cCRQ9Y+GgACGw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732608265; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oyeX0uBYtM9HvUPxJZMO7niMsetQIUIDkY6DvJRVK/c=; 
	b=oJ5cb4LwlJ8pB+OSP9a1Bd8MWFUH8eqbbszFybu4zo2IQlwGGEA7T9dHzjWUGo2LFHLObzPQ11VLRYbOUSciJxXlZOtKG8YLhfaMkmVkzyCBFkMIBQEkDOni3CIMunkchizdpIsgSj6mLyEf0rK0BF4qU5qeFLvujhH7ea/JR7M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732608265;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=oyeX0uBYtM9HvUPxJZMO7niMsetQIUIDkY6DvJRVK/c=;
	b=WWtHciXmaATXFOS5oxEkABTQix2ArX5vRwxb80Ig5p/WqQl8B8lViIt5m/AKq3bp
	Kjox92J1a3KJ51ZGpX2zIqSVRatA+2E807R4OP007PAmnPn6jzSbbc36gRGtVqKt9v0
	fzxCJU+NeG8oyI4l9hCHZ5PUk1NAHA4wIUiR+DA8=
Received: by mx.zohomail.com with SMTPS id 1732608259305773.6767418297189;
	Tue, 26 Nov 2024 00:04:19 -0800 (PST)
Date: Tue, 26 Nov 2024 09:04:13 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 1/5] media: mediatek: vcodec: support manual request
 completion
Message-ID: <20241126080413.kr7jty7oz3ylfxsu@basti-XPS-13-9310>
References: <20241116031724.15694-1-yunfei.dong@mediatek.com>
 <20241116031724.15694-2-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241116031724.15694-2-yunfei.dong@mediatek.com>
X-ZohoMailClient: External

Hey Yunfei,

On 16.11.2024 11:17, Yunfei Dong wrote:
>There is only a buffer object for some codecs, the request is marked
>as completed if the buffer is set to done. Framework will add a new
>control handler object to the request with latest control values, will
>get below warning if the driver calling v4l2_ctrl_request_complete to
>set media request complete again. Using manual request completion to
>fix this issue.

Thank you for working on this.
I am currently working on this as well, so I would like to ask you for a
bit more patience, once I am finished with my testing and have a working
patch I'll send that patch and then we can discuss on the basis of that.

Regards,
Sebastian

>
>Workqueue: core-decoder vdec_msg_queue_core_work [mtk_vcodec_dec]
>pstate: 80c00089 (Nzcv daIf +PAN +UAO -TCO BTYPE=--)
>pc : media_request_object_bind+0xa8/0x124
>lr : media_request_object_bind+0x50/0x124
>sp : ffffffc011393be0
>x29: ffffffc011393be0 x28: 0000000000000000
>x27: ffffff890c280248 x26: ffffffe21a71ab88
>x25: 0000000000000000 x24: ffffff890c280280
>x23: ffffff890c280280 x22: 00000000fffffff0
>x21: 0000000000000000 x20: ffffff890260d280
>x19: ffffff890260d2e8 x18: 0000000000001000
>x17: 0000000000000400 x16: ffffffe21a4584a0
>x15: 000000000053361d x14: 0000000000000018
>x13: 0000000000000004 x12: ffffffa82427d000
>x11: ffffffe21ac3fce0 x10: 0000000000000001
>x9 : 0000000000000000 x8 : 0000000000000003
>x7 : 0000000000000000 x6 : 000000000000003f
>x5 : 0000000000000040 x4 : ffffff89052e7b98
>x3 : 0000000000000000 x2 : 0000000000000001
>x1 : 0000000000000000 x0 : 0000000000000000
>Call trace:
> media_request_object_bind+0xa8/0x124
> v4l2_ctrl_request_bind+0xc4/0x168
> v4l2_ctrl_request_complete+0x198/0x1f4
> mtk_vdec_stateless_cap_to_disp+0x58/0x8c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
> vdec_vp9_slice_core_decode+0x1c0/0x268 [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
> vdec_msg_queue_core_work+0x60/0x11c [mtk_vcodec_dec 245a7c1e48ff1b2451a50e1dfcb174262b6b462c]
> process_one_work+0x140/0x480
> worker_thread+0x12c/0x2f8
> kthread+0x13c/0x1d8
> ret_from_fork+0x10/0x30
>
>Fixes: 7b182b8d9c852 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c    |  8 +++++---
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c   | 17 ++++++++++++++---
> 2 files changed, 19 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>index 98838217b97d..d2146724f5de 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>@@ -887,10 +887,12 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> 			if (src_buf != &ctx->empty_flush_buf.vb) {
> 				struct media_request *req =
> 					src_buf->vb2_buf.req_obj.req;
>-				v4l2_m2m_buf_done(src_buf,
>-						VB2_BUF_STATE_ERROR);
>-				if (req)
>+
>+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>+				if (req) {
> 					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
>+					media_request_manual_complete(req);
>+				}
> 			}
> 		}
> 		return;
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>index afa224da0f41..1e11c08d708f 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>@@ -264,8 +264,10 @@ static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ctx *ctx, int e
> 		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
> 	}
>
>-	if (src_buf_req)
>+	if (src_buf_req) {
> 		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
>+		media_request_manual_complete(src_buf_req);
>+	}
> }
>
> static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ctx *ctx)
>@@ -308,6 +310,7 @@ static void vb2ops_vdec_buf_request_complete(struct vb2_buffer *vb)
> 	struct mtk_vcodec_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>
> 	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
>+	media_request_manual_complete(vb->req_obj.req);
> }
>
> static void mtk_vdec_worker(struct work_struct *work)
>@@ -375,8 +378,10 @@ static void mtk_vdec_worker(struct work_struct *work)
> 	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
> 	    ctx->current_codec == V4L2_PIX_FMT_VP8_FRAME) {
> 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
>-		if (src_buf_req)
>+		if (src_buf_req) {
> 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
>+			media_request_manual_complete(src_buf_req);
>+		}
> 	} else {
> 		if (ret != -EAGAIN) {
> 			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
>@@ -731,9 +736,15 @@ static int fops_media_request_validate(struct media_request *mreq)
> 	return vb2_request_validate(mreq);
> }
>
>+static void fops_media_request_queue(struct media_request *req)
>+{
>+	media_request_mark_manual_completion(req);
>+	v4l2_m2m_request_queue(req);
>+}
>+
> const struct media_device_ops mtk_vcodec_media_ops = {
> 	.req_validate	= fops_media_request_validate,
>-	.req_queue	= v4l2_m2m_request_queue,
>+	.req_queue	= fops_media_request_queue,
> };
>
> static void mtk_vcodec_add_formats(unsigned int fourcc,
>-- 
>2.46.0
>
>

