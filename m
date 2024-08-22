Return-Path: <linux-media+bounces-16614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C883895BB70
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 18:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA6A2813DF
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 16:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C8D1CDA03;
	Thu, 22 Aug 2024 16:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="gYbxUTov"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDDD1CB300;
	Thu, 22 Aug 2024 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724343125; cv=pass; b=WJf4A0Oy9CWbyYaDFksu0UxhVxGDnbdpj15uZ23sVTpfLtcuNus2r3tUBD2ZmgbdVxNCH4SYfF2E9n68g+W5POUg479X/uAgOOScYB/I7JvylH6Z/5j6zOjb79wE+owWLOpg16kyvoPMCQ6NRbfY6E+ANoZUwQCMW3vSbAKtP2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724343125; c=relaxed/simple;
	bh=IAPpadmY9nOSrLXOdO9VmSBsmBnj7Z29mUjVF7BMWFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZI2aJDeTdcd5frMDQ7pEsWtdpQYGS8QEujuTI/INPRl0WXQmIVsNKeDUrz+fX2QHV1nMrb+7vHBlmUQ5/9Wvj98H2xuPhj675zc1an1WCyvx8s7pitGXOSGbwwOVXZXEYCiivVGydhjnPxvGbYpVvaoiqeNz6E7e1Ce7cq+LFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=gYbxUTov; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: nfraprado@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724343112; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AGCLLuOTPFmktZHK2UbZoDIgJ/8Oe+1WFWpy8SZSGokqVofHXvgl/x8IvxmRWosGS0Zos3K3hqcCh0IBta2eORekDsQaTFN8r0bL97dDDobqWliVfsEC8bMNuldeS828d4ex6LBbRm55IO8+F7OvG6GP8Kj0pW0uHui6DDrcynI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724343112; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g6oveps4DwZyjx7Lo/bkkZCFv0Cut+y/Y1Be0D4ooTM=; 
	b=LHgpdv4wWG108Ao4aHayTRSkoSbNts+zRMjv2JqFstadGTH5NEbFfm5SVnp7PsCL+mIKkqoq29AX7Kqp6qgzvonLoh7/G45tHDXX+Zyq0MH7DOrs9gBi3vGuTz/gt4XDAz0lk87KqaTabv5mqzMFyVUz0R7dRfOoOooMmDWdUkI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724343112;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=g6oveps4DwZyjx7Lo/bkkZCFv0Cut+y/Y1Be0D4ooTM=;
	b=gYbxUTovw4k9Y5lglq6Y/q4jYSjFApYFwFfOt01mLUy6OeG7yD/8vq3+eeUBocHz
	CYak82arKAH8GsT8z22ohShZ9UPq89oiqDCsu+Ug1S6mtlGTvfoCxbaQy03eJTyE54A
	w+tbh6bZtDBK+/vmfoRJlsM1MMt47LRUc1//ioxA=
Received: by mx.zohomail.com with SMTPS id 1724343110302766.1410833559867;
	Thu, 22 Aug 2024 09:11:50 -0700 (PDT)
Date: Thu, 22 Aug 2024 18:11:45 +0200
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
Subject: Re: [PATCH v4 3/7] media: mediatek: vcodec: flush decoder before
 stream off
Message-ID: <20240822161145.jv7i45wlajcxpazw@basti-XPS-13-9310>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
 <20240807082444.21280-4-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807082444.21280-4-yunfei.dong@mediatek.com>
X-ZohoMailClient: External

Hey Yunfei,

On 07.08.2024 16:24, Yunfei Dong wrote:
>Flush decoder will reset the driver to flush status. If lat or core
>work queue in active before flush when stream off, will lead to get
>dst buffer NULL or buff done with one non-existent source buffer.
>
>Flush decoder when stream off no matter output or capture queue
>calling stream off firstly.
>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 45 ++++++++++---------
> 1 file changed, 23 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>index 7080ca3e18b0..fc4ee1fb7cd1 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>@@ -882,6 +882,29 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] (%d) state=(%x) ctx->decoded_frame_cnt=%d",
> 			  ctx->id, q->type, ctx->state, ctx->decoded_frame_cnt);
>
>+	if (ctx->state >= MTK_STATE_HEADER && ctx->state != MTK_STATE_FLUSH) {
>+		/*
>+		 * The resolution hasn't been changed when STREAMOFF is called.
>+		 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
>+		 * is called.
>+		 */
>+		ctx->picinfo = ctx->last_decoded_picinfo;
>+
>+		mtk_v4l2_vdec_dbg(2, ctx,
>+				  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
>+				  ctx->id, ctx->last_decoded_picinfo.pic_w,
>+				  ctx->last_decoded_picinfo.pic_h,
>+				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
>+				  ctx->last_decoded_picinfo.buf_w,
>+				  ctx->last_decoded_picinfo.buf_h);
>+
>+		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
>+		if (ret)
>+			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
>+
>+		ctx->state = MTK_STATE_FLUSH;
>+	}
>+
> 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> 		while ((src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx))) {
> 			if (src_buf != &ctx->empty_flush_buf.vb) {
>@@ -894,28 +917,6 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> 			}
> 		}
>
>-		if (ctx->state >= MTK_STATE_HEADER) {
>-			/*
>-			 * The resolution hasn't been changed when STREAMOFF is called.
>-			 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
>-			 * is called.
>-			 */
>-			ctx->picinfo = ctx->last_decoded_picinfo;
>-
>-			mtk_v4l2_vdec_dbg(2, ctx,
>-					  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
>-					  ctx->id, ctx->last_decoded_picinfo.pic_w,
>-					  ctx->last_decoded_picinfo.pic_h,
>-					  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
>-					  ctx->last_decoded_picinfo.buf_w,
>-					  ctx->last_decoded_picinfo.buf_h);
>-
>-			ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
>-			if (ret)
>-				mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
>-		}
>-
>-		ctx->state = MTK_STATE_FLUSH;

you just changed this routine in patch 2/7, why was patch 2/7 needed if
you remove it right away in the next patch?

regards,
Sebastian Fricke

> 		return;
> 	}
>
>-- 
>2.46.0
>
>

