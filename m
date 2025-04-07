Return-Path: <linux-media+bounces-29529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD3A7E435
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 17:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2464188A58E
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250751F8ADD;
	Mon,  7 Apr 2025 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="OcDPPBat"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EEC1F8AD7
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 15:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039051; cv=none; b=ul+s3pIsy//NvccQUv+HZKzpJDgwa5cs5Wmau35jVj6cfxaR87FLmbMe57mb9VUHCNEIsOC2OupnanNrF5C6IRCLXE/8qYwQrLqp1INvDnv/dfhYC7Vl+nD6ZDJtGWfxz2iB+37U3JFc58fiBBLNDYNB1XfQrBOXj8Vfq24cMm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039051; c=relaxed/simple;
	bh=FgGFkvM/ECGwvSRBJ3r5FjilqzfkrJcBce7/X6Gx1fM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZPNhvdnPepvSwpY9AU0Uj1cKej/XnQS8X3UkP2K7/GnOG+uwhuJMTrXM9yiQcPW8aiQw/PD1SHoFAX9kkD19yx8/HENXsMJdiKX+4klV04hSq0BSVS+QPMQnxmDRjhmjwIZIzwilnzTLPCITIgmKhM4ZkJDLX13B1LLHZkVZyCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=OcDPPBat; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c55500cf80so372326285a.1
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 08:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744039047; x=1744643847; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ePiwJtWqlANqnCk2rR6tEp8SjDwgJ0HyiP7oZXjHj8o=;
        b=OcDPPBatfzn6Zzvx/nDnHQIVBEqqHVhqzVRM/9wt67uYbZogdyUMJ5ciHrE+75Vpgt
         R51JRp0+FBVPHB5bnQ5v3y2MC5oyXRUlnmd83af4o19m/1nKlO6tEVFPgkjLqRcTmiUI
         3VXuNkglwxcJ3mMj7ZPK5T3zpCissXtZXng+gALTrU2eGySw7c1qs+9rFdDy8pdt9lrR
         blYe7Jpg6swXstQSCjEIHAycaK0OIbPFPefQGWG4XbFheGj3J5cHEKKmGWJraAnSUk8v
         Zn+VBLcSsQDlmdx4KUCIUu+cRhRbYwe5IJTUM9sjWCYi/q1Htt8YfHhGnP9AABLF82NN
         az6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039047; x=1744643847;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePiwJtWqlANqnCk2rR6tEp8SjDwgJ0HyiP7oZXjHj8o=;
        b=BTg+tjU28WlFJdmEyAb3NAdYWLZkx/x+vyC81PvLDQ3ECLy7zZTD6cChpKTgN67asP
         8em5TgjFG6tnXT25Vt4afDmf397hW//NSVvcF+o6mJu0bKuWzffe/m+ezpim/MC4Ex12
         bp6Ust0cSyFDKtxjkghwlfsInjhx0953c1+JfYqSHWv1vlkS9J0xEsjWwFUxNjMpeBCO
         Pza/mdl9Rh77cih4NL3XebP25mqfKi/s+JQWDVRkCuPPr1ame3p/0aBhltL6v07VHQVN
         yVW6Z/vHxJJvwclGAsR5ckRK4uldn9AJcux82iwQ5+TIlPuxFYXYyzDTYNdDB5YoqYfu
         itvA==
X-Gm-Message-State: AOJu0Yw/mqdXWw2RmheS7KMYwNzp9JS+B4jp+rejp741QZeDf86BHWHq
	buNUQo/HcH0UyLd9FR8u7fXzuGtQhrsWD7F1VtKX8zw251GgHBCUCjvCfBrww0E=
X-Gm-Gg: ASbGnctARE4jK0BlqhizDnf9NvukyU4jFtqqKqGkz0g1j4AGlyA3x4OvpZx8k1HKJUH
	acSYZdLH8Izo8QayM8Oep3ysf5HXo1zvGDmr6AoW76ZymMRSF8pwHNUJT8pBdoVLgOVvGJ6JB6q
	hJpuUAoaQGeK9R7ZL1w4Ug/x/a9h9HB6QSXyr2qNiEJ+WbtwsTzb+Ud1iQL4unmaA9FweyGrivW
	QhT3S2KhVnpnU1S9Sm8SYkS5OvNh9ZEA5Nk+346oSkyWSFsov01CAi9XUceWhSJm5fjJnJKslDc
	s97RPzLuRqUF0aH5TTPT0t/25hvt84DN1Es1NDoKWSUXBS8QGQ==
X-Google-Smtp-Source: AGHT+IFMZnMbTyTQh098Zt7F9FsPuh2cDoKqbCbOEQoYMRNbuRJjmQBNxdpIsF9J7BtIACIamCOHKg==
X-Received: by 2002:a05:620a:40c5:b0:7c5:9ac7:2ccc with SMTP id af79cd13be357-7c775b15514mr1550295185a.55.1744039046981;
        Mon, 07 Apr 2025 08:17:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea58d63sm610314885a.87.2025.04.07.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:17:26 -0700 (PDT)
Message-ID: <f4eec2aa4856edbbb2f1e9248dffd9aff62c1a80.camel@ndufresne.ca>
Subject: Re: [PATCH 4/5] media: vcodec: Implement manual request completion
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sebastian Fricke <sebastian.fricke@collabora.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen	 <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Date: Mon, 07 Apr 2025 11:17:25 -0400
In-Reply-To: <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
References: 
	<20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-0-5e277a3d695b@collabora.com>
	 <20250314-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v1-4-5e277a3d695b@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le vendredi 14 mars 2025 =C3=A0 14:26 +0100, Sebastian Fricke a =C3=A9crit=
=C2=A0:
> Rework how requests are completed in the MediaTek VCodec driver, by
> implementing the new manual request completion feature, which allows to
> keep a request open while allowing to add new bitstream data.
> This is useful in this case, because the hardware has a LAT and a core
> decode work, after the LAT decode the bitstream isn't required anymore
> so the source buffer can be set done and the request stays open until
> the core decode work finishes.
>=20
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_cmn_drv.h=C2=A0=C2=A0=C2=A0 |=
 13 ++++++
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0 | 52 +=
+++++++++++++++++++++
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0 |=C2=
=A0 4 ++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 46 +++++++++----------
> =C2=A05 files changed, 94 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn=
_drv.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> index 6087e27bd604d24e5d37b48de5bb37eab86fc1ab..81ec5beecfaed239ed70bee34=
60aae27e476231c 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_cmn_drv.h
> @@ -105,6 +105,19 @@ enum mtk_instance_state {
> =C2=A0	MTK_STATE_ABORT =3D 4,
> =C2=A0};
> =C2=A0
> +/**
> + * enum mtk_request_state - Stages of processing a request
> + * MTK_REQUEST_RECEIVED: Hardware prepared for the LAT decode
> + * MTK_REQUEST_DONE_WITH_BITSTREAM: LAT decode finished, the bitstream i=
s not
> + *				=C2=A0=C2=A0=C2=A0 needed anymore
> + * MTK_REQUEST_COMPLETE: CORE decode finished
> + */
> +enum mtk_request_state {
> +	MTK_REQUEST_RECEIVED =3D 0,
> +	MTK_REQUEST_LAT_DONE =3D 1,
> +	MTK_REQUEST_CORE_DONE =3D 2,
> +};
> +
> =C2=A0enum mtk_fmt_type {
> =C2=A0	MTK_FMT_DEC =3D 0,
> =C2=A0	MTK_FMT_ENC =3D 1,
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index 98838217b97d45ed2b5431fdf87c94e0ff79fc57..036ad191a9c3e644fe99b4ce2=
5d6a089292f1e57 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -889,8 +889,10 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
> =C2=A0					src_buf->vb2_buf.req_obj.req;
> =C2=A0				v4l2_m2m_buf_done(src_buf,
> =C2=A0						VB2_BUF_STATE_ERROR);
> -				if (req)
> +				if (req) {
> =C2=A0					v4l2_ctrl_request_complete(req, &ctx->ctrl_hdl);
> +					media_request_manual_complete(req);
> +				}
> =C2=A0			}
> =C2=A0		}
> =C2=A0		return;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index 9247d92d431d8570609423156b989878f7901f1c..d9c7aaec0c4515cb73b80c913=
b1ad5b08392dd18 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -26,6 +26,58 @@
> =C2=A0#include "mtk_vcodec_dec_pm.h"
> =C2=A0#include "../common/mtk_vcodec_intr.h"
> =C2=A0
> +const char *state_to_str(enum mtk_request_state state)
> +{
> +	switch (state) {
> +	case MTK_REQUEST_RECEIVED:
> +		return "RECEIVED";
> +	case MTK_REQUEST_LAT_DONE:
> +		return "LAT_DONE";
> +	case MTK_REQUEST_CORE_DONE:
> +		return "CORE_DONE";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +int mtk_vcodec_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request=
_state state,
> +			enum vb2_buffer_state buffer_state, struct media_request *src_buf_req=
)
> +{
> +	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +
> +	mutex_lock(&ctx->lock);
> +
> +	if (ctx->req_state >=3D state) {
> +		mutex_unlock(&ctx->lock);
> +		return -EINVAL;
> +	}
> +
> +	switch (ctx->req_state) {
> +	case MTK_REQUEST_RECEIVED:
> +		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +		src_buf =3D v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> +		v4l2_m2m_buf_done(src_buf, buffer_state);
> +		ctx->req_state =3D MTK_REQUEST_LAT_DONE;
> +		if (state =3D=3D MTK_REQUEST_LAT_DONE)
> +			break;
> +		fallthrough;
> +	case MTK_REQUEST_LAT_DONE:
> +		dst_buf =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> +		v4l2_m2m_buf_done(dst_buf, buffer_state);
> +		media_request_manual_complete(src_buf_req);
> +		ctx->req_state =3D MTK_REQUEST_CORE_DONE;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	mtk_v4l2_vdec_dbg(3, ctx, "Switch state from %s to %s.\n",
> +			=C2=A0 state_to_str(ctx->req_state), state_to_str(state));
> +	ctx->req_state =3D state;
> +	mutex_unlock(&ctx->lock);
> +	return 0;
> +}
> +
> =C2=A0static int mtk_vcodec_get_hw_count(struct mtk_vcodec_dec_ctx *ctx, =
struct mtk_vcodec_dec_dev *dev)
> =C2=A0{
> =C2=A0	switch (dev->vdec_pdata->hw_arch) {
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index ac568ed14fa257d25b533b6fd6b3cd341227ecc2..21c2301363d0151ba3cf384a2=
a32fff9f5d46034 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -185,6 +185,7 @@ struct mtk_vcodec_dec_ctx {
> =C2=A0	struct mtk_q_data q_data[2];
> =C2=A0	int id;
> =C2=A0	enum mtk_instance_state state;
> +	enum mtk_request_state req_state;

As you discovered before I came to do that final review, this is the
wrong version of the patchset. The request state must be per-request.
Looking forward your v2.

Nicolas

> =C2=A0
> =C2=A0	const struct vdec_common_if *dec_if;
> =C2=A0	void *drv_handle;
> @@ -326,6 +327,9 @@ wake_up_dec_ctx(struct mtk_vcodec_dec_ctx *ctx, unsig=
ned int reason, unsigned in
> =C2=A0	wake_up_interruptible(&ctx->queue[hw_id]);
> =C2=A0}
> =C2=A0
> +int mtk_vcodec_complete(struct mtk_vcodec_dec_ctx *ctx, enum mtk_request=
_state state,
> +			enum vb2_buffer_state buffer_state, struct media_request *src_buf_req=
);
> +
> =C2=A0#define mtk_vdec_err(ctx, fmt, args...)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> =C2=A0	mtk_vcodec_err((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index afa224da0f4165cf5701d6861f1f787c6317bfe4..9187d7bcfc8aea17f3fc98d94=
419777d8026db51 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -247,7 +247,6 @@ static const struct v4l2_frmsize_stepwise stepwise_fh=
d =3D {
> =C2=A0static void mtk_vdec_stateless_cap_to_disp(struct mtk_vcodec_dec_ct=
x *ctx, int error,
> =C2=A0					=C2=A0=C2=A0 struct media_request *src_buf_req)
> =C2=A0{
> -	struct vb2_v4l2_buffer *vb2_dst;
> =C2=A0	enum vb2_buffer_state state;
> =C2=A0
> =C2=A0	if (error)
> @@ -255,17 +254,7 @@ static void mtk_vdec_stateless_cap_to_disp(struct mt=
k_vcodec_dec_ctx *ctx, int e
> =C2=A0	else
> =C2=A0		state =3D VB2_BUF_STATE_DONE;
> =C2=A0
> -	vb2_dst =3D v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
> -	if (vb2_dst) {
> -		v4l2_m2m_buf_done(vb2_dst, state);
> -		mtk_v4l2_vdec_dbg(2, ctx, "free frame buffer id:%d to done list",
> -				=C2=A0 vb2_dst->vb2_buf.index);
> -	} else {
> -		mtk_v4l2_vdec_err(ctx, "dst buffer is NULL");
> -	}
> -
> -	if (src_buf_req)
> -		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> +	mtk_vcodec_complete(ctx, MTK_REQUEST_CORE_DONE, state, src_buf_req);
> =C2=A0}
> =C2=A0
> =C2=A0static struct vdec_fb *vdec_get_cap_buffer(struct mtk_vcodec_dec_ct=
x *ctx)
> @@ -308,6 +297,7 @@ static void vb2ops_vdec_buf_request_complete(struct v=
b2_buffer *vb)
> =C2=A0	struct mtk_vcodec_dec_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue)=
;
> =C2=A0
> =C2=A0	v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> +	media_request_manual_complete(vb->req_obj.req);
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vdec_worker(struct work_struct *work)
> @@ -358,12 +348,17 @@ static void mtk_vdec_worker(struct work_struct *wor=
k)
> =C2=A0	else
> =C2=A0		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
> =C2=A0
> +	mutex_lock(&ctx->lock);
> +	ctx->req_state =3D MTK_REQUEST_RECEIVED;
> +	mutex_unlock(&ctx->lock);
> +
> =C2=A0	ret =3D vdec_if_decode(ctx, bs_src, NULL, &res_chg);
> +
> =C2=A0	if (ret && ret !=3D -EAGAIN) {
> =C2=A0		mtk_v4l2_vdec_err(ctx,
> -				=C2=A0 "[%d] decode src_buf[%d] sz=3D0x%zx pts=3D%llu ret=3D%d res_c=
hg=3D%d",
> +				=C2=A0 "[%d] decode src_buf[%d] sz=3D0x%zx pts=3D%llu res_chg=3D%d r=
et=3D%d",
> =C2=A0				=C2=A0 ctx->id, vb2_src->index, bs_src->size,
> -				=C2=A0 vb2_src->timestamp, ret, res_chg);
> +				=C2=A0 vb2_src->timestamp, res_chg, ret);
> =C2=A0		if (ret =3D=3D -EIO) {
> =C2=A0			mutex_lock(&ctx->lock);
> =C2=A0			dec_buf_src->error =3D true;
> @@ -372,18 +367,15 @@ static void mtk_vdec_worker(struct work_struct *wor=
k)
> =C2=A0	}
> =C2=A0
> =C2=A0	state =3D ret ? VB2_BUF_STATE_ERROR : VB2_BUF_STATE_DONE;
> +	if (ret !=3D -EAGAIN)
> +		mtk_vcodec_complete(ctx, MTK_REQUEST_LAT_DONE, state, src_buf_req);
> +
> =C2=A0	if (!IS_VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 ctx->current_codec =3D=3D V4L2_PIX_FMT_VP8_FRAM=
E) {
> -		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state=
);
> -		if (src_buf_req)
> -			v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
> -	} else {
> -		if (ret !=3D -EAGAIN) {
> -			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> -			v4l2_m2m_buf_done(vb2_v4l2_src, state);
> -		}
> -		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> +		mtk_vcodec_complete(ctx, MTK_REQUEST_CORE_DONE, state, src_buf_req);
> =C2=A0	}
> +
> +	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
> @@ -731,9 +723,15 @@ static int fops_media_request_validate(struct media_=
request *mreq)
> =C2=A0	return vb2_request_validate(mreq);
> =C2=A0}
> =C2=A0
> +static void fops_media_request_queue(struct media_request *mreq)
> +{
> +	media_request_mark_manual_completion(mreq);
> +	v4l2_m2m_request_queue(mreq);
> +}
> +
> =C2=A0const struct media_device_ops mtk_vcodec_media_ops =3D {
> =C2=A0	.req_validate	=3D fops_media_request_validate,
> -	.req_queue	=3D v4l2_m2m_request_queue,
> +	.req_queue	=3D fops_media_request_queue,
> =C2=A0};
> =C2=A0
> =C2=A0static void mtk_vcodec_add_formats(unsigned int fourcc,

