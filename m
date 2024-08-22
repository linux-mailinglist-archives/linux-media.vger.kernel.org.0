Return-Path: <linux-media+bounces-16605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33F95BA84
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 17:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 136DA285999
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 15:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2657E1CCB39;
	Thu, 22 Aug 2024 15:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Dh42t0xb"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17721CB30F;
	Thu, 22 Aug 2024 15:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340786; cv=pass; b=REf2P89/Gq0oD2XW8w8knE7yfzojOuf+5arsWwufwgwuU5uC0QWMbLHj+9uMhOoliDZssaVnFli+PIlWDaaoA3qtNrQ+5k1EGRczLeVm9n42Lz79wiPMjqUPh2Kxygj/JfchXh5GrzCQXviLDic0iaa6GZtficbGSef5nGCdTYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340786; c=relaxed/simple;
	bh=CyC4Jd87GaLPha/s+2aYDHeC7vXeAzjbKPjewvlljdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDyXh+qP8dr/7JkU/9dc+de1o4dlhBXFxrBb/tg5dsXY9i6spefDwgckdrx2zzympWYJt3tjop1Tgoh8WOOzJx0InlX3Lj39pEbFgNetuse5XJ/zao/mlBH/cTOC16vxcTM0o/I6+e15agr2LOfpdnaojuE8WYaqde1nb/5t3gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Dh42t0xb; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: nfraprado@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724340769; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a7AUM2Xbxn4Eof2YYSDtDTHdvd0McWkZt01OmEg6CgIsGm5c9LXrIZe5PnH60OgVNlCbcy/x7hnLUhWDx02zuiD4PmC/fpbBC1Qy7lqXS4QYoIdMRRLVaWIZvjbWTs2jO2/H/kqtJTKfMtTR8fkaIFOdaEi06y2mmoR3m2LiRPc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724340769; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GYmsMO86M+MRWiuSffdR3RZ+erob4a0FODJM/LZV2Xk=; 
	b=GWoMp+tNXjBNDLmNdWJHV1aJjfDIRBJCNf3tXBNCjr6TcvyehGapuEsoLpAgiARm7CtNcPhhNsSwngpLrRQ0ADi2aGUoJW+HlJ99ptNq25ITk1lF8+/hVIQoCcSFHCae4FZ/qICQSx1EZBfV2S3S2UWiBfi8jn2vCl08Qqu3h/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724340769;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=GYmsMO86M+MRWiuSffdR3RZ+erob4a0FODJM/LZV2Xk=;
	b=Dh42t0xbRWLCxW8F/S+l3+cGdiaONmsgqzKhPpkFvWgV00U9Ola2pFyK5IUqbmln
	M1bvoYPZYshyS50jbWdLQDW+VTSO8acHmPzprwIJ9XdByer014S4QfoLHLrEm5qmikT
	21NlW+22JIjnZ5iD/akskU/YrRqQwFXZbOWLmdEE=
Received: by mx.zohomail.com with SMTPS id 172434076798266.91759029586126;
	Thu, 22 Aug 2024 08:32:47 -0700 (PDT)
Date: Thu, 22 Aug 2024 17:32:42 +0200
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
Subject: Re: [PATCH v4 2/7] media: mediatek: vcodec: change flush decode
 order when stream off
Message-ID: <20240822153242.sewrferyfh3u5g4h@basti-XPS-13-9310>
References: <20240807082444.21280-1-yunfei.dong@mediatek.com>
 <20240807082444.21280-3-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807082444.21280-3-yunfei.dong@mediatek.com>
X-ZohoMailClient: External

Hey Yunfei,

On 07.08.2024 16:24, Yunfei Dong wrote:
>The buffer remove and buffer done of output queue is separated into
>two works, the value of owned_by_drv_count isn't zero when output
>queue stream off before flush decode.

You have to try this again, I cannot make sense out of your message.

What do you mean with:
"The buffer remove and buffer done of output queue is separated into two works"

I suppose this:
the value of owned_by_drv_count isn't zero when output queue stream off
before flush decode.

should be:
therefore the value of `owned_by_drv_count` isn't zero while flushing
the decoder in the STREAMOFF(OUTPUT queue) IOCTL.

right?

>Changing the flush decode from capture to output when stream off to
>make sure all the output queue buffers are set to done list.

I'd change this section to:

Flushing the decoder during STREAMOFF(OUTPUT) instead of during
STREAMOFF(CAPTURE) makes sure that all buffers on the OUTPUT queue are
set done.

The rest looks fine.

Regards,
Sebastian Fricke

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 45 +++++++++----------
> 1 file changed, 22 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>index 2b787e60a1f9..7080ca3e18b0 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>@@ -893,32 +893,31 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> 				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> 			}
> 		}
>-		return;
>-	}
>-
>-	if (ctx->state >= MTK_STATE_HEADER) {
>-
>-		/* Until STREAMOFF is called on the CAPTURE queue
>-		 * (acknowledging the event), the driver operates
>-		 * as if the resolution hasn't changed yet, i.e.
>-		 * VIDIOC_G_FMT< etc. return previous resolution.
>-		 * So we update picinfo here
>-		 */
>-		ctx->picinfo = ctx->last_decoded_picinfo;
>
>-		mtk_v4l2_vdec_dbg(2, ctx,
>-				  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
>-				  ctx->id, ctx->last_decoded_picinfo.pic_w,
>-				  ctx->last_decoded_picinfo.pic_h,
>-				  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
>-				  ctx->last_decoded_picinfo.buf_w,
>-				  ctx->last_decoded_picinfo.buf_h);
>+		if (ctx->state >= MTK_STATE_HEADER) {
>+			/*
>+			 * The resolution hasn't been changed when STREAMOFF is called.
>+			 * Update the picinfo here with previous resolution if VIDIOC_G_FMT
>+			 * is called.
>+			 */
>+			ctx->picinfo = ctx->last_decoded_picinfo;
>+
>+			mtk_v4l2_vdec_dbg(2, ctx,
>+					  "[%d]-> new(%d,%d), old(%d,%d), real(%d,%d)",
>+					  ctx->id, ctx->last_decoded_picinfo.pic_w,
>+					  ctx->last_decoded_picinfo.pic_h,
>+					  ctx->picinfo.pic_w, ctx->picinfo.pic_h,
>+					  ctx->last_decoded_picinfo.buf_w,
>+					  ctx->last_decoded_picinfo.buf_h);
>+
>+			ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
>+			if (ret)
>+				mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
>+		}
>
>-		ret = ctx->dev->vdec_pdata->flush_decoder(ctx);
>-		if (ret)
>-			mtk_v4l2_vdec_err(ctx, "DecodeFinal failed, ret=%d", ret);
>+		ctx->state = MTK_STATE_FLUSH;
>+		return;
> 	}
>-	ctx->state = MTK_STATE_FLUSH;
>
> 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
> 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
>-- 
>2.46.0
>
>

