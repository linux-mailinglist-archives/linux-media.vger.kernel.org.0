Return-Path: <linux-media+bounces-47602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00983C7BB81
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 22:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E56335CA55
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 21:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0587C2FD7D0;
	Fri, 21 Nov 2025 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="N7fntxrW"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6482836B5;
	Fri, 21 Nov 2025 21:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763759286; cv=none; b=QkxCSQWSCI2e63DkEWj/Hkk/Bn4CeZmcCJ5NZAPjQZiNN4yAxYLBB5qjB+sD2dg/VwTYdlxxVcnOvdS7PK37oPBkDxIvT+IgTm7HqgyjMNG8i1OZL34fHoYKJeLSHUz+pGlG9OPQoiJ3c1tLfnnfjhehhGG/X4loknAerlSMgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763759286; c=relaxed/simple;
	bh=O30+J/lWM+0Cj4sc9VOirkgJHPEp5wDaPWz1YBwM0J0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eky0RzqblnJN0QEoVInqd5IU2htP5xe9SxZ+NEjNC8kkKerS+wCHcGgTTKgfz1xzktnzjgCS3HNi5FMKzAqERLYZItMHMpcxuMk2eDIeuzqgX5WzgK0qv8OXW674NH19n+KjEzWOZ2UsKPjhbdxq96ZOLC7av/9LZn3uOwzRnuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=N7fntxrW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763759281;
	bh=O30+J/lWM+0Cj4sc9VOirkgJHPEp5wDaPWz1YBwM0J0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=N7fntxrW8dgbsqwy08w03HLyURtGu/v5MOZYxp05sTz55EJW1v5jhdfpu43HN8hq/
	 M3yqW46Oxmv46JGhcmqiAkLsTjfzwB4dqWNod/zw2HDSBFLsG5o45jQhs5OI26XWUP
	 FIWrc/V0uMqutdgII2u23ePIRIDRvvp2OF2CcTZtPtT7nmujuM9UxyOOzrVqRzCgWO
	 UIM9dWuB5PcaXnwI5B6X7/GDFsZz69gvhVHCqKzAUgj5CLsLCr64AsZzldylJ199N7
	 7hFzlR1Zxodbjqa5dY92z+swt4hbLriENigYJLNNScncFkddAT7n/VqVEXcKRjmzrC
	 Zjvp3sOxuRrrQ==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38B2D17E00B0;
	Fri, 21 Nov 2025 22:08:00 +0100 (CET)
Message-ID: <c95c1df8a68908f3450aaf82ce9c14464ff27230.camel@collabora.com>
Subject: Re: [PATCH v3 4/5] media: vcodec: Implement manual request
 completion
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen	 <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com, 
	linux-media@vger.kernel.org
Date: Fri, 21 Nov 2025 16:07:57 -0500
In-Reply-To: <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-4-603db4749d90@collabora.com>
References: 
	<20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com>
	 <20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-4-603db4749d90@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-pdyX8It8qD/v0i5OYA8T"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-pdyX8It8qD/v0i5OYA8T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le mercredi 04 juin 2025 =C3=A0 16:09 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> From: Sebastian Fricke <sebastian.fricke@collabora.com>
>=20
> Rework how requests are completed in the MediaTek VCodec driver, by
> implementing the new manual request completion feature, which allows to
> keep a request open while allowing to add new bitstream data.
> This is useful in this case, because the hardware has a LAT and a core
> decode work, after the LAT decode the bitstream isn't required anymore
> so the source buffer can be set done and the request stays open until
> the core decode work finishes.

I was about to process this one, but while doing more tests I found more
problems.

1. caps_to_disp() and streamoff can be concurrent in this driver

The driver does not implement a mechanism to abort. So when userspace do an
early streamoff, there is a chance stop_streaming (which complete the pendi=
ng
request) call will be followed by a cap_to_disp(), which indicate the HW is
done.

One way forward is to also use the request state in stop_streaming, and so =
I
made these changes. Though it raised another, bigger problem.

2. When the LAT fails, it signals the error buffers before the current buff=
er

Since the LAT is processing the next frame while we finish the reconstructi=
on,
if the LAT fails and we complete the request, we endup signalling buffers a=
nd
request out of order.

That will require more work,
Nicolas

>=20
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> ---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0 |=C2=
=A0 29 +++++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 140 ++++++++++++++++----
> -
> =C2=A03 files changed, 140 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index
> 98838217b97d45ed2b5431fdf87c94e0ff79fc57..036ad191a9c3e644fe99b4ce25d6a08=
9292f
> 1e57 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -889,8 +889,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> =C2=A0					src_buf->vb2_buf.req_obj.req;
> =C2=A0				v4l2_m2m_buf_done(src_buf,
> =C2=A0						VB2_BUF_STATE_ERROR);
> -				if (req)
> +				if (req) {
> =C2=A0					v4l2_ctrl_request_complete(req, &ctx-
> >ctrl_hdl);
> +					media_request_manual_complete(req);
> +				}
> =C2=A0			}
> =C2=A0		}
> =C2=A0		return;
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index
> aececca7ecf8936bb2b3b55c99354af983746b30..6f9728a95720a257dee9201463c5e27=
5d058
> 6a94 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -64,6 +64,19 @@ enum mtk_vdec_hw_arch {
> =C2=A0	MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0};
> =C2=A0
> +/**
> + * enum mtk_vdec_request_state - Stages of processing a request
> + * @MTK_VDEC_REQUEST_RECEIVED: Hardware prepared for the LAT decode
> + * @MTK_VDEC_REQUEST_LAT_DONE: LAT decode finished, the bitstream is not
> + *		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needed anymore
> + * @MTK_VDEC_REQUEST_CORE_DONE: CORE decode finished
> + */
> +enum mtk_vdec_request_state {
> +	MTK_VDEC_REQUEST_RECEIVED =3D 0,
> +	MTK_VDEC_REQUEST_LAT_DONE =3D 1,
> +	MTK_VDEC_REQUEST_CORE_DONE =3D 2,
> +};
> +
> =C2=A0/**
> =C2=A0 * struct vdec_pic_info=C2=A0 - picture size information
> =C2=A0 * @pic_w: picture width
> @@ -128,6 +141,17 @@ struct mtk_vcodec_dec_pdata {
> =C2=A0	bool uses_stateless_api;
> =C2=A0};
> =C2=A0
> +/**
> + * struct mtk_vcodec_dec_request - Media request private data.
> + *
> + * @req_state: Request completion state
> + * @req: Media Request structure
> + */
> +struct mtk_vcodec_dec_request {
> +	enum mtk_vdec_request_state req_state;
> +	struct media_request req;
> +};
> +
> =C2=A0/**
> =C2=A0 * struct mtk_vcodec_dec_ctx - Context (instance) private data.
> =C2=A0 *
> @@ -319,6 +343,11 @@ static inline struct mtk_vcodec_dec_ctx
> *ctrl_to_dec_ctx(struct v4l2_ctrl *ctrl)
> =C2=A0	return container_of(ctrl->handler, struct mtk_vcodec_dec_ctx,
> ctrl_hdl);
> =C2=A0}
> =C2=A0
> +static inline struct mtk_vcodec_dec_request *req_to_dec_req(struct
> media_request *req)
> +{
> +	return container_of(req, struct mtk_vcodec_dec_request, req);
> +}
> +
> =C2=A0/* Wake up context wait_queue */
> =C2=A0static inline void
> =C2=A0wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsigned int reason=
, unsigned
> int hw_id)
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> index
> d873159b9b3069fe3460502c2751f2e8b2714f44..eea0050eacc1c41abd8e0a1cd546c1e=
cce90
> a311 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> @@ -242,10 +242,61 @@ static const struct v4l2_frmsize_stepwise stepwise_=
fhd =3D
> {
> =C2=A0	.step_height =3D 16
> =C2=A0};
> =C2=A0
> +static const char *state_to_str(enum mtk_vdec_request_state state)
> +{
> +	switch (state) {
> +	case MTK_VDEC_REQUEST_RECEIVED:
> +		return "RECEIVED";
> +	case MTK_VDEC_REQUEST_LAT_DONE:
> +		return "LAT_DONE";
> +	case MTK_VDEC_REQUEST_CORE_DONE:
> +		return "CORE_DONE";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static void mtk_vcodec_dec_request_complete(struct mtk_vcodec_dec_ctx *c=
tx,
> +					=C2=A0=C2=A0=C2=A0 enum mtk_vdec_request_state
> state,
> +					=C2=A0=C2=A0=C2=A0 enum vb2_buffer_state
> buffer_state,
> +					=C2=A0=C2=A0=C2=A0 struct media_request
> *src_buf_req)
> +{
> +	struct mtk_vcodec_dec_request *req =3D req_to_dec_req(src_buf_req);
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +
> +	mutex_lock(&ctx->lock);
> +
> +	if (req->req_state >=3D state) {
> +		mutex_unlock(&ctx->lock);
> +		return;
> +	}
> +
> +	switch (req->req_state) {
> +	case MTK_VDEC_REQUEST_RECEIVED:
> +		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +		src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +		v4l2_m2m_buf_done(src_buf, buffer_state);
> +		if (state =3D=3D MTK_VDEC_REQUEST_LAT_DONE)
> +			break;
> +		fallthrough;
> +	case MTK_VDEC_REQUEST_LAT_DONE:
> +		dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> +		v4l2_m2m_buf_done(dst_buf, buffer_state);
> +		media_request_manual_complete(src_buf_req);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	mtk_v4l2_vdec_dbg(3, ctx, "Switch state from %s to %s.\n",
> +			=C2=A0 state_to_str(req->req_state), state_to_str(state));
> +	req->req_state =3D state;
> +	mutex_unlock(&ctx->lock);
> +}
> +
> =C2=A0static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ct=
x *ctx,
> int error,
> =C2=A0					=C2=A0=C2=A0 struct media_request *src_buf_req)
> =C2=A0{
> -	struct vb2_v4l2_buffer *vb2_dst;
> =C2=A0	enum vb2_buffer_state state;
> =C2=A0
> =C2=A0	if (error)
> @@ -253,17 +304,7 @@ static void mtk_vdec_stateless_cap_to_disp(struct
> mtk_vcodec_dec_ctx *ctx, int e
> =C2=A0	else
> =C2=A0		state =3D VB2_BUF_STATE_DONE;
> =C2=A0
> -	vb2_dst =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> -	if (vb2_dst) {
> -		v4l2_m2m_buf_done(vb2_dst, state);
> -		mtk_v4l2_vdec_dbg(2, ctx, "free frame buffer id:%d to done
> list",
> -				=C2=A0 vb2_dst->vb2_buf.index);
> -	} else {
> -		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
> -	}
> -
> -	if (src_buf_req)
> -		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +	mtk_vcodec_dec_request_complete(ctx, MTK_VDEC_REQUEST_CORE_DONE,
> state, src_buf_req);
> =C2=A0}
> =C2=A0
> =C2=A0static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ct=
x *ctx)
> @@ -306,6 +347,7 @@ static void vb2ops_vdec_buf_request_complete(struct
> vb2_buffer *vb)
> =C2=A0	struct mtk_vcodec_dec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue)=
;
> =C2=A0
> =C2=A0	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> +	media_request_manual_complete(vb->req_obj.req);
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vdec_worker(struct work_struct *work)
> @@ -318,7 +360,8 @@ static void mtk_vdec_worker(struct work_struct *work)
> =C2=A0	struct mtk_vcodec_mem *bs_src;
> =C2=A0	struct mtk_video_dec_buf *dec_buf_src;
> =C2=A0	struct media_request *src_buf_req;
> -	enum vb2_buffer_state state;
> +	enum mtk_vdec_request_state req_state;
> +	enum vb2_buffer_state buf_state;
> =C2=A0	bool res_chg =3D false;
> =C2=A0	int ret;
> =C2=A0
> @@ -351,37 +394,43 @@ static void mtk_vdec_worker(struct work_struct *wor=
k)
> =C2=A0			=C2=A0 ctx->id, bs_src->va, &bs_src->dma_addr, bs_src-
> >size, vb2_src);
> =C2=A0	/* Apply request controls. */
> =C2=A0	src_buf_req =3D vb2_src->req_obj.req;
> -	if (src_buf_req)
> -		v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
> -	else
> +	if (WARN_ON(!src_buf_req)) {
> +		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> =C2=A0		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
> +		return;
> +	}
> +	v4l2_ctrl_request_setup(src_buf_req, &ctx->ctrl_hdl);
> =C2=A0
> =C2=A0	ret =3D vdec_if_decode(ctx, bs_src, NULL, &res_chg);
> -	if (ret && ret !=3D -EAGAIN) {
> +
> +	if (ret =3D=3D -EAGAIN) {
> +		buf_state =3D VB2_BUF_STATE_DONE;
> +		req_state =3D MTK_VDEC_REQUEST_RECEIVED;
> +	} else if (ret) {
> =C2=A0		mtk_v4l2_vdec_err(ctx,
> -				=C2=A0 "[%d] decode src_buf[%d] sz=3D0x%zx pts=3D%llu
> ret=3D%d res_chg=3D%d",
> +				=C2=A0 "[%d] decode src_buf[%d] sz=3D0x%zx pts=3D%llu
> res_chg=3D%d ret=3D%d",
> =C2=A0				=C2=A0 ctx->id, vb2_src->index, bs_src->size,
> -				=C2=A0 vb2_src->timestamp, ret, res_chg);
> +				=C2=A0 vb2_src->timestamp, res_chg, ret);
> =C2=A0		if (ret =3D=3D -EIO) {
> =C2=A0			mutex_lock(&ctx->lock);
> =C2=A0			dec_buf_src->error =3D true;
> =C2=A0			mutex_unlock(&ctx->lock);
> =C2=A0		}
> -	}
> =C2=A0
> -	state =3D ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> -	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
> -	=C2=A0=C2=A0=C2=A0 ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAME) {
> -		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx-
> >m2m_ctx, state);
> -		if (src_buf_req)
> -			v4l2_ctrl_request_complete(src_buf_req, &ctx-
> >ctrl_hdl);
> +		buf_state =3D VB2_BUF_STATE_ERROR;
> +		req_state =3D MTK_VDEC_REQUEST_CORE_DONE;
> =C2=A0	} else {
> -		if (ret !=3D -EAGAIN) {
> -			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> -			v4l2_m2m_buf_done(vb2_v4l2_src, state);
> -		}
> -		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +		buf_state =3D VB2_BUF_STATE_DONE;
> +
> +		if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
> +		=C2=A0=C2=A0=C2=A0 ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAME)
> +			req_state =3D MTK_VDEC_REQUEST_CORE_DONE;
> +		else
> +			req_state =3D MTK_VDEC_REQUEST_LAT_DONE;
> =C2=A0	}
> +
> +	mtk_vcodec_dec_request_complete(ctx, req_state, buf_state,
> src_buf_req);
> +	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
> @@ -709,6 +758,22 @@ static int mtk_vcodec_dec_ctrls_setup(struct
> mtk_vcodec_dec_ctx *ctx)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static struct media_request *fops_media_request_alloc(struct media_devic=
e
> *mdev)
> +{
> +	struct mtk_vcodec_dec_request *req;
> +
> +	req =3D kzalloc(sizeof(*req), GFP_KERNEL);
> +
> +	return &req->req;
> +}
> +
> +static void fops_media_request_free(struct media_request *mreq)
> +{
> +	struct mtk_vcodec_dec_request *req =3D req_to_dec_req(mreq);
> +
> +	kfree(req);
> +}
> +
> =C2=A0static int fops_media_request_validate(struct media_request *mreq)
> =C2=A0{
> =C2=A0	const unsigned int buffer_cnt =3D vb2_request_buffer_cnt(mreq);
> @@ -729,9 +794,20 @@ static int fops_media_request_validate(struct
> media_request *mreq)
> =C2=A0	return vb2_request_validate(mreq);
> =C2=A0}
> =C2=A0
> +static void fops_media_request_queue(struct media_request *mreq)
> +{
> +	struct mtk_vcodec_dec_request *req =3D req_to_dec_req(mreq);
> +
> +	media_request_mark_manual_completion(mreq);
> +	req->req_state =3D MTK_VDEC_REQUEST_RECEIVED;
> +	v4l2_m2m_request_queue(mreq);
> +}
> +
> =C2=A0const struct media_device_ops mtk_vcodec_media_ops =3D {
> +	.req_alloc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D fops_media_request_alloc,
> +	.req_free=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D fops_media_request_free,
> =C2=A0	.req_validate	=3D fops_media_request_validate,
> -	.req_queue	=3D v4l2_m2m_request_queue,
> +	.req_queue	=3D fops_media_request_queue,
> =C2=A0};
> =C2=A0
> =C2=A0static void mtk_vcodec_add_formats(unsigned int fourcc,

--=-pdyX8It8qD/v0i5OYA8T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSDUrQAKCRDZQZRRKWBy
9KNzAQD/fCCnpfSzR71tccNQdenrLVk0zTSbZVpQMyV5SBVcqQEA953UXsFDpelP
HOyldZ/anpH/mHieVRUPi/2rBxGgmQo=
=sDVn
-----END PGP SIGNATURE-----

--=-pdyX8It8qD/v0i5OYA8T--

