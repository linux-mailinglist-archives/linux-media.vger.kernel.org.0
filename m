Return-Path: <linux-media+bounces-56562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PIlAByLvWnY+wIAu9opvQ
	(envelope-from <linux-media+bounces-56562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:59:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A921C2DF087
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 700A8300D697
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 17:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E043DB625;
	Fri, 20 Mar 2026 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="lGuqGKRl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EB33DB64F
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029547; cv=none; b=ErLQPuE6mgwH1XdkeUw905YnJOKpO38uaAe4qAFSaX+8jx0FmdaCH7EEsOk334U7cGirjaheVr90V+VQkX9LaAJ/NlKHaQv7qPHRX6dJYAAIxTVHPBAq484R6+YXrOIMoc2rQLSpsaXzvQgIaivIDpiYYSDu1ghZYBhIEhr90eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029547; c=relaxed/simple;
	bh=mknhkPtyofLdqd31WD43VR1SdxPjV76bX0yeTgSZ4VE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N3HPeEIkgXDIUr9/rHuFk1zJ+Or55XLQjIOz6hNJUlWpVojzDnaz75Q1cH+hOQ4CxRggl9xDvCRtv3jMrhTbAzVU/J9ahE/nV/KKkVQk2xDBSfzEPdpVlweTNDzWajaLRWZJxQKGz52mxeCxYyip7vgplg0+FG8Zdmb01/5R1GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=lGuqGKRl; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cd77786e97so228008285a.3
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029544; x=1774634344; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DWkKoVAEpPTbhlQcGao02ZYKop/ZGqIz8O7PUwO5+Xk=;
        b=lGuqGKRlLtf7kijeXTwsEt2Vf7TyglLo+qlXKOwsvMthyobT/nRDPILwlsCrkkyzSx
         Ue9qMv9oIR73iCQCTPhDMIPXAc+xN5dPDoYfLwvzrTlai/WiWEFnRZcvVFKbfAXDaGe/
         c0BHIQj4D/DyzajmbpL8xgYN+PgCDkBKwT1redhukH+rSvbPcbJPHH/XkEE6yLz2LfBU
         c13+IOM9rWTaKTGxNA5pCB0FAIrkDndRw2w8w+y7HOlYtLSa2eK7bliZPg9OWJAE8U/D
         LDJ2mImGGGKDnc5TKGCuAebbmIxQSOnw7D6ypOtzXf4dpoQpPkpHQ29GnbVbBFcr+L8J
         cI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029544; x=1774634344;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DWkKoVAEpPTbhlQcGao02ZYKop/ZGqIz8O7PUwO5+Xk=;
        b=ThPK5xnxM8iVXrPAF2o88ckly/c02ckFIWq0Om9XoFJoiFBKruuZE+ucOx13RTjBFz
         1Y5j31xe4U/lGrd4ZuJuMXU6zd2Oj35nx90OEOehIECXDIGw5BlPMyPqUzs7ktomwGVT
         IiLGNs9ne8zZYWoj6tliZki3YazVbYp35nVp1lr2P9uLs8eh5ae+DmX+QCDU5vClVJ/i
         VCySoh+lVtm/5y9tgJ4IuxrxtZmDb+KLgFxrYXiT8UQjUN4nxw2oHBi+0BuqSxX1lJi4
         LqugUPYpJn+XhTzx4W3hSrDYxImWneRFrkZyJxsQlNeuOLXULLZSc6J7PTpaIRdBgAJa
         hD5Q==
X-Gm-Message-State: AOJu0YyWOI6/pedy1DJGpPOsucTE7hix6ivcESDn+LpvbE/zAL7SSIJW
	cyCLSo5ai5odOEyOWLnXZz6Hqr3wvXFCt17MyzRhV4iqLBINfnYbizCJKkuZ7KrSUDw=
X-Gm-Gg: ATEYQzzU/kivjJEHBG2k3tPPx8ASvVaIEKm+kTvuP9R1poYTqOM7QwElPdrIoe+AMKN
	O5kO3+6hCwllj/07VPob3RA5by7jD34ggcUCn+tM1CbyLn9Ps5zTAf1VBjxkAXajHNqe4ziFlVK
	MaxTQ0WigO4gUUwqrPo2oGxhjDYUqkmpI87iHx6nUKMFIVbuiG9cfSCBXBOtD9V1zjObwMzSrEJ
	0WQ5uMLvR5g6Q6KTibO41UvxMB9s3A2MTR5eimkdezMzbBG5bqb9fBkRtpLv0eIVWAEqQ+AovuR
	SKyuG/oSr//+AlWN+GLea8p2O6xzsjKL2Vbf3AmaKcdW46uETWNERJZBFBselt1LytL3rGynW2x
	r8kAsv2b/iKeVJ3xR3HymZcAw3jyLtoOd7x48W/mYyT+nCb05DU7e4b16NLha/yUZaz8nuaX4d6
	OlMhHDJ7588iVs0rFW3kB2ZQBThEJH
X-Received: by 2002:a05:620a:4110:b0:8cf:c77f:f4e2 with SMTP id af79cd13be357-8cfc7f86b0cmr579713085a.67.1774029544140;
        Fri, 20 Mar 2026 10:59:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90e2d27sm233119785a.43.2026.03.20.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:59:03 -0700 (PDT)
Message-ID: <46d7ccd7500771bf66f830040b3e306785866ea8.camel@ndufresne.ca>
Subject: Re: [PATCH v3 19/27] media: rockchip: rga: support external iommus
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 20 Mar 2026 13:59:02 -0400
In-Reply-To: <20260127-spu-rga3-v3-19-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-19-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GSvc32jDQd071V5aC8lf"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56562-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ndufresne-ca.20230601.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A921C2DF087
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-GSvc32jDQd071V5aC8lf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> In preparation for the RGA3 add support for external iommus. This is a
> transition step to just disable the RGA2 specific mmu table setup code.
>=20
> Currently a simple rga_hw struct field is used to set the internal iommu.
> But to handle the case of more sophisticated detection mechanisms
> (e.g. check for an iommu property in the device tree), it is abstracted
> by an inline function.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-buf.c | 31 ++++++++++++++++=
++--------
> -
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 11 ++++++++--
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 ++++++
> =C2=A04 files changed, 37 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c
> b/drivers/media/platform/rockchip/rga/rga-buf.c
> index bc349d0a46365..4e82ca1a5e8d9 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0
> =C2=A0#include "rga.h"
> @@ -82,6 +83,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
> =C2=A0	if (IS_ERR(f))
> =C2=A0		return PTR_ERR(f);
> =C2=A0
> +	if (!rga_has_internal_iommu(rga))
> +		return 0;
> +
> =C2=A0	n_desc =3D DIV_ROUND_UP(f->size, PAGE_SIZE);
> =C2=A0
> =C2=A0	rbuf->n_desc =3D n_desc;
> @@ -136,17 +140,21 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
> =C2=A0	for (i =3D 0; i < vb->num_planes; i++) {
> =C2=A0		vb2_set_plane_payload(vb, i, f->pix.plane_fmt[i].sizeimage);
> =C2=A0
> -		/* Create local MMU table for RGA */
> -		n_desc =3D fill_descriptors(&rbuf->dma_desc[curr_desc],
> -					=C2=A0 rbuf->n_desc - curr_desc,
> -					=C2=A0 vb2_dma_sg_plane_desc(vb, i));
> -		if (n_desc < 0) {
> -			v4l2_err(&ctx->rga->v4l2_dev,
> -				 "Failed to map video buffer to RGA\n");
> -			return n_desc;
> +		if (rga_has_internal_iommu(ctx->rga)) {
> +			/* Create local MMU table for RGA */
> +			n_desc =3D fill_descriptors(&rbuf->dma_desc[curr_desc],
> +						=C2=A0 rbuf->n_desc - curr_desc,
> +						=C2=A0 vb2_dma_sg_plane_desc(vb,
> i));
> +			if (n_desc < 0) {
> +				v4l2_err(&ctx->rga->v4l2_dev,
> +					 "Failed to map video buffer to
> RGA\n");
> +				return n_desc;
> +			}
> +			dma_addrs[i] =3D curr_desc << PAGE_SHIFT;
> +			curr_desc +=3D n_desc;
> +		} else {
> +			dma_addrs[i] =3D vb2_dma_contig_plane_dma_addr(vb, i);
> =C2=A0		}
> -		dma_addrs[i] =3D curr_desc << PAGE_SHIFT;
> -		curr_desc +=3D n_desc;
> =C2=A0	}
> =C2=A0
> =C2=A0	/* Fill the remaining planes */
> @@ -176,6 +184,9 @@ static void rga_buf_cleanup(struct vb2_buffer *vb)
> =C2=A0	struct rga_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> =C2=A0
> +	if (!rga_has_internal_iommu(rga))
> +		return;
> +
> =C2=A0	dma_free_coherent(rga->dev, rbuf->n_desc * sizeof(*rbuf->dma_desc)=
,
> =C2=A0			=C2=A0 rbuf->dma_desc, rbuf->dma_desc_pa);
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c
> b/drivers/media/platform/rockchip/rga/rga-hw.c
> index bf4a86a640ec5..2013b59701d12 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -577,6 +577,7 @@ static struct rga_fmt formats[] =3D {
> =C2=A0
> =C2=A0const struct rga_hw rga2_hw =3D {
> =C2=A0	.card_type =3D "rga2",
> +	.has_internal_iommu =3D true,
> =C2=A0	.formats =3D formats,
> =C2=A0	.num_formats =3D ARRAY_SIZE(formats),
> =C2=A0	.cmdbuf_size =3D RGA_CMDBUF_SIZE,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c
> b/drivers/media/platform/rockchip/rga/rga.c
> index f33e2288dab6f..b13ff8d7c572c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -23,6 +23,7 @@
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/videobuf2-dma-sg.h>
> +#include <media/videobuf2-dma-contig.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0
> =C2=A0#include "rga.h"
> @@ -95,7 +96,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struc=
t
> vb2_queue *dst_vq)
> =C2=A0	src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> =C2=A0	src_vq->drv_priv =3D ctx;
> =C2=A0	src_vq->ops =3D &rga_qops;
> -	src_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	if (rga_has_internal_iommu(ctx->rga))
> +		src_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	else
> +		src_vq->mem_ops =3D &vb2_dma_contig_memops;
> =C2=A0	src_vq->gfp_flags =3D __GFP_DMA32;
> =C2=A0	src_vq->buf_struct_size =3D sizeof(struct rga_vb_buffer);
> =C2=A0	src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> @@ -110,7 +114,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, str=
uct
> vb2_queue *dst_vq)
> =C2=A0	dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> =C2=A0	dst_vq->drv_priv =3D ctx;
> =C2=A0	dst_vq->ops =3D &rga_qops;
> -	dst_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	if (rga_has_internal_iommu(ctx->rga))
> +		dst_vq->mem_ops =3D &vb2_dma_sg_memops;
> +	else
> +		dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> =C2=A0	dst_vq->gfp_flags =3D __GFP_DMA32;
> =C2=A0	dst_vq->buf_struct_size =3D sizeof(struct rga_vb_buffer);
> =C2=A0	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> diff --git a/drivers/media/platform/rockchip/rga/rga.h
> b/drivers/media/platform/rockchip/rga/rga.h
> index 025b1df594e9a..95fa7fd1c509a 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -146,6 +146,7 @@ static inline void rga_mod(struct rockchip_rga *rga, =
u32
> reg, u32 val, u32 mask)
> =C2=A0
> =C2=A0struct rga_hw {
> =C2=A0	const char *card_type;
> +	bool has_internal_iommu;
> =C2=A0	struct rga_fmt *formats;
> =C2=A0	u32 num_formats;
> =C2=A0	size_t cmdbuf_size;
> @@ -161,6 +162,11 @@ struct rga_hw {
> =C2=A0	void (*get_version)(struct rockchip_rga *rga);
> =C2=A0};
> =C2=A0
> +static inline bool rga_has_internal_iommu(const struct rockchip_rga *rga=
)
> +{
> +	return rga->hw->has_internal_iommu;
> +}
> +
> =C2=A0extern const struct rga_hw rga2_hw;
> =C2=A0
> =C2=A0#endif

--=-GSvc32jDQd071V5aC8lf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2K5gAKCRDZQZRRKWBy
9BfxAP9HitbV0tE91+TsUII6EawZfO2n00kNhSwOcuYpTi+2HgD/YMHoY2wU9gZ2
za+IWdj6j8GuSEbo6yXP/lEI/rjmEgk=
=xHfo
-----END PGP SIGNATURE-----

--=-GSvc32jDQd071V5aC8lf--

