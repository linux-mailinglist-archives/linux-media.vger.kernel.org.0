Return-Path: <linux-media+bounces-16663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5165295CFDB
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 16:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6EA51F244DB
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 14:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1475118BC07;
	Fri, 23 Aug 2024 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="gAPC+rd2"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF6913ACC;
	Fri, 23 Aug 2024 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724422516; cv=pass; b=peNPtlG4JWIE6dMIjtuw1Rj5CDU5DchNk59TIHQlnK7BOwSAUUTzE9U7kjbGEpSQYNQtl2ZMSU/cOf7LFnrdhR/Et2INOsJRvtYnlexC/MtVqwFP0oOWnS2WrP/QPCwrq9CQqg8rkLUj2fGhY3LjYAJHIQvo1IPF4FO8lZKfMFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724422516; c=relaxed/simple;
	bh=PBAsyZb6wrNt9PCHfHdj7miV+Khf5l0iL92tXn3Geeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKqT6Xgm/cGo72OaWPfjjERh4cW7nBUyB98F+PTmK9n430aHXGt4g1u0iOX7rHhX8tE7N83A0eVhXO1ROiUBFUT/zE+NSPlQZZ/5WLw1LvrpHykDsdY4OZA8K2HW1iUQikMgRxlIm2b8+uaZoe6Umlgm9/kMVELtLDk5F5WAShc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=gAPC+rd2; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: nfraprado@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724422501; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JjceiZWJtI1fUL/OB+7hTt7iC8BUQNhc3tvezrUvZZ3oaUgItn9OBy7AaAVd+AGJKT70OoDiV7v9duLGsx0lJv8pg5UbbDh38Uh6wShDEqgv62HHrHSKQdlmPG8zRnoLmousu0EOwoNj271pMHwF/zjmj4FtIa+BzzL9mWKT8NY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724422501; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YLkCm+92u6sWHnBCcW3QFsk7uF4UMVlkDcI9nxI0grU=; 
	b=eombKDlK304bsE3d8P+splbUGc2VGtVHlDx3EruzstDrlNRm2u5kSC6vmi4s0iuynwzbPc7X51i1Blk20wnD7KazKMzI9nL7gv7V798/056ZKa0pptTOjfE9UOfnlnKizqMBh6m0iszRMYzqC3kLgWFAC2oRFoR6aWf+ThS8phw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724422501;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=YLkCm+92u6sWHnBCcW3QFsk7uF4UMVlkDcI9nxI0grU=;
	b=gAPC+rd2nZXJL/rx/VP2x5RKOgJcdggFEJH0Pl18qgfPE6McP+f5AzEjZN+1V8U/
	h45r+M+V0sSg4AbA+S+si5DKxTxNCa/XusJKo4yXMbchJGBwfUB6G5lEV135ASCOnwD
	P9VNNtX5GO63Ssql8BGCibswpbwqEZku2MC+0QrQ=
Received: by mx.zohomail.com with SMTPS id 1724422500162588.6716232629527;
	Fri, 23 Aug 2024 07:15:00 -0700 (PDT)
Date: Fri, 23 Aug 2024 16:14:54 +0200
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
Subject: Re: [PATCH v4 5/7] media: mediatek: vcodec: store source vb2 buffer
Message-ID: <20240823141454.vvtbkkj5qm4pmpfr@basti-XPS-13-9310>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
 <20240807082444.21280-6-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807082444.21280-6-yunfei.dong@mediatek.com>
X-ZohoMailClient: External

Hey Yunfei,

On 07.08.2024 16:24, Yunfei Dong wrote:
>Store the current vb2 buffer when lat need to decode again.
>Then lat work can get the same vb2 buffer directly next time.

I would reword this with:

Store the current source buffer in the specific data for the IC. When
the LAT needs to retry a decode it can pick that buffer directly.

---

Additionally, this is not a good commit description as you just say what
you do, but you don't say WHY this needs to happen, why is it necessary?
What does it improve, is this a preparation patch for another, a fix for
something or an improvement of performance?


more below...

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h      |  2 ++
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c         | 11 ++++++++---
> 2 files changed, 10 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>index 1fabe8c5b7a4..0817be73f8e0 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
>@@ -155,6 +155,7 @@ struct mtk_vcodec_dec_pdata {
>  * @last_decoded_picinfo: pic information get from latest decode
>  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Used
>  *		     for stateful decoder.
>+ * @last_vb2_v4l2_src: the backup of current source buffer.

I think last is confusing in this context especially as there is for
example in the m2m_ctx:
  * @last_src_buf: indicate the last source buffer for draining
  * @next_buf_last: next capture queud buffer will be tagged as last
or:
  * v4l2_m2m_last_buf() - return last buffer from the list of ready buffers

I think a better name would be:

  * @cur_src_buf: current source buffer with the bitstream data for the latest decode

>  * @is_flushing: set to true if flushing is in progress.
>  *
>  * @current_codec: current set input codec, in V4L2 pixel format
>@@ -201,6 +202,7 @@ struct mtk_vcodec_dec_ctx {
> 	struct work_struct decode_work;
> 	struct vdec_pic_info last_decoded_picinfo;
> 	struct v4l2_m2m_buffer empty_flush_buf;
>+	struct vb2_v4l2_buffer *last_vb2_v4l2_src;

Likewise here:

struct vb2_v4l2_buffer *cur_src_buf;

> 	bool is_flushing;
>
> 	u32 current_codec;
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>index 2a7e4fe24ed3..8aa379872ddc 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>@@ -320,7 +320,7 @@ static void mtk_vdec_worker(struct work_struct *work)
> 	struct mtk_vcodec_dec_ctx *ctx =
> 		container_of(work, struct mtk_vcodec_dec_ctx, decode_work);
> 	struct mtk_vcodec_dec_dev *dev = ctx->dev;
>-	struct vb2_v4l2_buffer *vb2_v4l2_src;
>+	struct vb2_v4l2_buffer *vb2_v4l2_src = ctx->last_vb2_v4l2_src;

And here:

struct vb2_v4l2_buffer *vb2_v4l2_src = ctx->cur_src_buf;

> 	struct vb2_buffer *vb2_src;
> 	struct mtk_vcodec_mem *bs_src;
> 	struct mtk_video_dec_buf *dec_buf_src;
>@@ -329,7 +329,7 @@ static void mtk_vdec_worker(struct work_struct *work)
> 	bool res_chg = false;
> 	int ret;
>
>-	vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
>+	vb2_v4l2_src = vb2_v4l2_src ? vb2_v4l2_src : v4l2_m2m_next_src_buf(ctx->m2m_ctx);

Please add a comment above this line that explains why this search can
be made, explaining why this buffer is still valid in this call and when
we pick the next source buffer.

Regards,
Sebastian Fricke

> 	if (!vb2_v4l2_src) {
> 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> 		mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source buffer", ctx->id);
>@@ -383,8 +383,13 @@ static void mtk_vdec_worker(struct work_struct *work)
> 			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
> 	} else {
>-		if (ret != -EAGAIN)
>+		if (ret != -EAGAIN) {
> 			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
>+			ctx->last_vb2_v4l2_src = NULL;
>+		} else {
>+			ctx->last_vb2_v4l2_src = vb2_v4l2_src;
>+		}
>+
> 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> 	}
> }
>-- 
>2.46.0
>
>

