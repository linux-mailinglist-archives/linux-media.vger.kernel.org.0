Return-Path: <linux-media+bounces-30192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F09EAA88C2A
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 21:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31900188DB21
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 19:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD88428DEE5;
	Mon, 14 Apr 2025 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="f25TF4Y0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13D52797BC;
	Mon, 14 Apr 2025 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658395; cv=none; b=d8QldhvaFgD45ZYGblVhZU7S7ZkgR/spV9f1vSzoaOynoPmPkYqMOFnrh3pcbUKCwPVHqzG3TZZE9jhZvK7PHVpfJ+3BKrTuKcIPTcwROc1/B9U16t634yQ8nOToMWMkJSV/4fbKfeUa8JRjV3QDkvHzvS+VC+RDAI6W0+zOuPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658395; c=relaxed/simple;
	bh=5OW4OtjtSyBB2oKPfpNX3Y7CKOSwuIZGdOJ/RR0idGo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EXnZQdhdmBEynQJxhUYA9haSTcod82D9KSlbR+zAmfp4hsmIYn81gXzyXXYrKzHB5DniGtLaQ2ReMFUr/+7EgMvlkgamy5Snjcahe1j10tQIWuzUKoQ5DVhcEtJCaDMZ+7qtr7PW/UvnDCc6H2g5ytsB5yZvzhBFhJMgj5p9UHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=f25TF4Y0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744658390;
	bh=5OW4OtjtSyBB2oKPfpNX3Y7CKOSwuIZGdOJ/RR0idGo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=f25TF4Y0FfGGEJNhRUjHuzeTyxe6aUlb6CUP4s97f12LFRjBK7jeu8bEuSL1NJUVT
	 eF2FKvulL4465Z2GVwWeSGBSx38bn5In78T0Qmf0ym0CSUl9daYBiBI9xpb+lB7ofa
	 ajtwNypoUMig5CIwQegKtxeS1dIoKSnNi3mWpiJVmkK9/rnHPKCQDCNEmDGqq5uM+d
	 vUFjyGClwgbiynHhHX6E15j2KQiU1rXm4yUbky0fpItXCDA3nq+9wpDlGUMp/nB/Bp
	 w6aw3kelbOy1Vay9YLQ9FwVxzam/gKiXPatuKJsq+NrI3w5y6/edkstBOwgKYoLWAL
	 kg56Xvc7LsKSQ==
Received: from [IPv6:2606:6d00:11:e976::c41] (unknown [IPv6:2606:6d00:11:e976::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAF2517E0FD5;
	Mon, 14 Apr 2025 21:19:48 +0200 (CEST)
Message-ID: <4052616c2ee6dafe1c8889454df73da2c4452f04.camel@collabora.com>
Subject: Re: [PATCH v2 4/5] media: vcodec: Implement manual request
 completion
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger	
 <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, 
	linux-media@vger.kernel.org, Sebastian Fricke
 <sebastian.fricke@collabora.com>
Date: Mon, 14 Apr 2025 15:19:47 -0400
In-Reply-To: <d3da96bf-d1c8-4bf8-a22a-21a43f78f27d@collabora.com>
References: 
	<20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com>
	 <20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-4-5b99ec0450e6@collabora.com>
	 <d3da96bf-d1c8-4bf8-a22a-21a43f78f27d@collabora.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 14 avril 2025 à 11:11 +0200, AngeloGioacchino Del Regno a écrit :
> Il 10/04/25 17:39, Nicolas Dufresne ha scritto:
> > From: Sebastian Fricke <sebastian.fricke@collabora.com>
> > 
> > Rework how requests are completed in the MediaTek VCodec driver, by
> > implementing the new manual request completion feature, which allows to
> > keep a request open while allowing to add new bitstream data.
> > This is useful in this case, because the hardware has a LAT and a core
> > decode work, after the LAT decode the bitstream isn't required anymore
> > so the source buffer can be set done and the request stays open until
> > the core decode work finishes.
> > 
> > Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> > Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> This patch is great - but looks like it's worsening naming consistency across the
> driver.
> 
> Please look below.
> 
> > ---
> >   .../mediatek/vcodec/common/mtk_vcodec_cmn_drv.h    | 13 +++++
> >   .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  4 +-
> >   .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 50 +++++++++++++++++
> >   .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 19 +++++++
> >   .../vcodec/decoder/mtk_vcodec_dec_stateless.c      | 63 +++++++++++++---------
> >   5 files changed, 124 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> > index 6087e27bd604d24e5d37b48de5bb37eab86fc1ab..c5fd37cb60ca0cc5fd09c9243b36fbc716c56454 100644
> > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> > @@ -105,6 +105,19 @@ enum mtk_instance_state {
> >   	MTK_STATE_ABORT = 4,
> >   };
> >   
> > +/**
> > + * enum mtk_request_state - Stages of processing a request
> > + * @MTK_REQUEST_RECEIVED: Hardware prepared for the LAT decode
> > + * @MTK_REQUEST_LAT_DONE: LAT decode finished, the bitstream is not
> > + *		      needed anymore
> > + * @MTK_REQUEST_CORE_DONE: CORE decode finished
> > + */
> > +enum mtk_request_state {
> > +	MTK_REQUEST_RECEIVED = 0,
> > +	MTK_REQUEST_LAT_DONE = 1,
> > +	MTK_REQUEST_CORE_DONE = 2,
> > +};
> > +
> >   enum mtk_fmt_type {
> >   	MTK_FMT_DEC = 0,
> >   	MTK_FMT_ENC = 1,
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> > index 98838217b97d45ed2b5431fdf87c94e0ff79fc57..036ad191a9c3e644fe99b4ce25d6a089292f1e57 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> > @@ -889,8 +889,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> >   					src_buf->vb2_buf.req_obj.req;
> >   				v4l2_m2m_buf_done(src_buf,
> >   						VB2_BUF_STATE_ERROR);
> > -				if (req)
> > +				if (req) {
> >   					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
> > +					media_request_manual_complete(req);
> > +				}
> >   			}
> >   		}
> >   		return;
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > index 9247d92d431d8570609423156b989878f7901f1c..c80c1db509eaadd449bfd183c5eb9db0a1fc22bd 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > @@ -26,6 +26,56 @@
> >   #include "mtk_vcodec_dec_pm.h"
> >   #include "../common/mtk_vcodec_intr.h"
> >   
> > +static const char *state_to_str(enum mtk_request_state state)
> 
> static const char *mtk_vcodec_req_state_to_str(enum mtk_request_state state)

I'd keep this one an exception, its local to this C file.

> 
> > +{
> > +	switch (state) {
> > +	case MTK_REQUEST_RECEIVED:
> > +		return "RECEIVED";
> > +	case MTK_REQUEST_LAT_DONE:
> > +		return "LAT_DONE";
> > +	case MTK_REQUEST_CORE_DONE:
> > +		return "CORE_DONE";
> > +	default:
> > +		return "UNKNOWN";
> > +	}
> > +}
> > +
> > +void mtk_request_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request_state state,
> 
> void mtk_vcodec_request_complete( ....)

Ack, though the namspace here seems to be "mtk_vcodec_dec", so I'll opt
for that.

> 
> 
> > +			  enum vb2_buffer_state buffer_state, struct media_request *src_buf_req)
> > +{
> > +	struct mtk_request *req = req_to_mtk_req(src_buf_req);
> > +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +
> > +	mutex_lock(&ctx->lock);
> > +
> > +	if (req->req_state >= state) {
> > +		mutex_unlock(&ctx->lock);
> > +		return;
> > +	}
> > +
> > +	switch (req->req_state) {
> > +	case MTK_REQUEST_RECEIVED:
> > +		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> > +		src_buf = v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > +		v4l2_m2m_buf_done(src_buf, buffer_state);
> > +		if (state == MTK_REQUEST_LAT_DONE)
> > +			break;
> > +		fallthrough;
> > +	case MTK_REQUEST_LAT_DONE:
> > +		dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> > +		v4l2_m2m_buf_done(dst_buf, buffer_state);
> > +		media_request_manual_complete(src_buf_req);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	mtk_v4l2_vdec_dbg(3, ctx, "Switch state from %s to %s.\n",
> > +			  state_to_str(req->req_state), state_to_str(state));
> > +	req->req_state = state;
> > +	mutex_unlock(&ctx->lock);
> > +}
> > +
> >   static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_dec_dev *dev)
> >   {
> >   	switch (dev->vdec_pdata->hw_arch) {
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > index ac568ed14fa257d25b533b6fd6b3cd341227ecc2..cd61bf46de6918c27ed39ba64162e5f2637f93b2 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > @@ -126,6 +126,17 @@ struct mtk_vcodec_dec_pdata {
> >   	bool uses_stateless_api;
> >   };
> >   
> > +/**
> > + * struct mtk_request - Media request private data.
> > + *
> > + * @req_state: Request completion state
> > + * @req: Media Request structure
> > + */
> > +struct mtk_request {
> 
> Maybe mtk_vcodec_dec_request? :-)

Ack.

> 
> > +	enum mtk_request_state req_state;
> > +	struct media_request req;
> > +};
> > +
> >   /**
> >    * struct mtk_vcodec_dec_ctx - Context (instance) private data.
> >    *
> > @@ -317,6 +328,11 @@ static inline struct mtk_vcodec_dec_ctx *ctrl_to_dec_ctx(struct v4l2_ctrl *ctrl)
> >   	return container_of(ctrl->handler, struct mtk_vcodec_dec_ctx, ctrl_hdl);
> >   }
> >   
> > +static inline struct mtk_request *req_to_mtk_req(struct media_request *req)
> 
> ...and this could become req_to_dec_req ... but no strong opinions on this one
> specifically, so feel free to keep this as it is.

Something like that, very subtle at this point.

> 
> > +{
> > +	return container_of(req, struct mtk_request, req);
> > +}
> > +
> >   /* Wake up context wait_queue */
> >   static inline void
> >   wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsigned int reason, unsigned int hw_id)
> 
> After which....
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

thanks,

-- 
Nicolas Dufresne
Principal Engineer at Collabora

