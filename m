Return-Path: <linux-media+bounces-48583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8ACB3EBF
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51AE030652D0
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6885D32ABC8;
	Wed, 10 Dec 2025 20:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WYkJiu+e"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3151C6FF5;
	Wed, 10 Dec 2025 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765397516; cv=none; b=T+MxqXM/nVgecLiV17lHejkOrdQZ+dEZ2Ax7Cg3qYqNEaBoneTncPytmwxTTIN/nfI1jF79Ve8uIdlXmwtMzXQk/VBKuRRmn+5xDkUHGarHWR/h8jW68kZNd2B2YqA0ArdeoeZdWcPjUcur4FnKbPJ+hK87pIWj8fOd+uIG6H/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765397516; c=relaxed/simple;
	bh=tKjQPkZwFZsAhLESBW0WZJdYAI6DtDxRy+sG/6PTUeg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZfHPmqA0RZrcbSUDB04phMHuuB1qo3g+FU8BSJQ82WXzCLVxOLErgzbANal6nUjANdDUN4erKi6hA/MFOp0iWmS0l0gvRmuQfW55XSnBsSXlsxA9XD7i1GKLfs+acWozQ4gZiRgnsaINBCDOi0fNUF1L2Co/Hj0m9VrhkX316gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WYkJiu+e; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765397511;
	bh=tKjQPkZwFZsAhLESBW0WZJdYAI6DtDxRy+sG/6PTUeg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WYkJiu+ezVOwf51Que9Boz/H54Es+vY7NY5NzMc5NMVmdZbrm5MjJpe2h/IiAcX6m
	 9FcuwZaJSlTIepvFLtFoQjjZ/Gol3GV2DDPtdwI5/l/hj8NNTJjOmxo4HkgajIC7gb
	 FVruc0VXVtXOTbSxy1XlOzk3Q40cCA3XWFinFlfDVhlcnsF6I699SPrhKSNnrjTeFv
	 6R8bjUCiXZ1qtdDE+Bcm9UDBXzK2HF65x/Nmi6Q1Cv5DVUzh4wNVo59AsWylMoO03R
	 LT0+SJXitUdK61V56d4cxNU0DPxBLvq/M6wpBRVaHnbPPG03B0uXxjfGvUlf8dHzSt
	 XI0Eh60CFbcHw==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1641D17E13CD;
	Wed, 10 Dec 2025 21:11:48 +0100 (CET)
Message-ID: <0f155ec75f54dfc5a129ce31cd72ee8c16b301fa.camel@collabora.com>
Subject: Re: [PATCH v3 03/15] media: rkvdec: Switch to using structs instead
 of writel
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Diederik de Haas	 <didi.debian@cknow.org>
Date: Wed, 10 Dec 2025 15:11:47 -0500
In-Reply-To: <20251022162459.271603-4-detlev.casanova@collabora.com>
References: <20251022162459.271603-1-detlev.casanova@collabora.com>
	 <20251022162459.271603-4-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-zaJZC9IOjV7ePb356p0y"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-zaJZC9IOjV7ePb356p0y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 22 octobre 2025 =C3=A0 12:22 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> In an effort to merge the rkvdec2 driver [1] with this one, switch from
> writel() calls to using structs to represent the register mappings.
>=20
> This is done in order to have all supported decoders use the same format
> in the future and ease reading of the code.
>=20
> Using structs also improves stability as the hardware is tested and
> validated downstream using a similar method.
> It was noticed, on decoders, that:
> =C2=A0- Some registers require to be writen in increasing order [2]
> =C2=A0- Some registers, even if unrelated, need to be written to their re=
set
> =C2=A0=C2=A0 values (it was the case here for axi_ddr_[rw]data).
>=20
> Using structs can also help improving performance later when, e.g.
> multicore support is added on RK3588.
>=20
> Performance seems to be slightly improved, but at least, not made worse.
> Running fluster's JVT-AVC_V1 test suite with GStreamer on the Radxa ROCK
> PI 4 SE gives the following times:
>=20
> Before this patch:
>=20
> - --jobs 1: Ran 129/135 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 77.167 secs
> - --jobs 6: Ran 129/135 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 23.046 secs
>=20
> With this patch:
> - --jobs 1: Ran 129/135 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 70.698 secs
> - --jobs 6: Ran 129/135 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 22.917 secs
>=20
> This also shows that the fluster score hasn't changed.
>=20
> [1]: https://lore.kernel.org/all/20250325213303.826925-1-detlev.casanova@=
collabora.com/
> [2]: https://lore.kernel.org/all/20200127143009.15677-5-andrzej.p@collabo=
ra.com/
>=20
> Tested-by: Diederik de Haas <didi.debian@cknow.org>=C2=A0 # Rock 5B
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-h264.c=C2=A0=C2=A0=C2=A0 | 165 =
+++--
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-hevc.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 63 +-
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-regs.h=C2=A0=C2=A0=C2=A0 | 571 =
++++++++++++------
> =C2=A0.../platform/rockchip/rkvdec/rkvdec-vp9.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 231 +++----
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.c=C2=A0=C2=A0 |=C2=A0 10 =
+-
> =C2=A0.../media/platform/rockchip/rkvdec/rkvdec.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A06 files changed, 587 insertions(+), 454 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-h264.c
> index d14b4d173448..116e7b1076b7 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
> @@ -115,6 +115,7 @@ struct rkvdec_h264_run {
> =C2=A0struct rkvdec_h264_ctx {
> =C2=A0	struct rkvdec_aux_buf priv_tbl;
> =C2=A0	struct rkvdec_h264_reflists reflists;
> +	struct rkvdec_regs regs;
> =C2=A0};
> =C2=A0
> =C2=A0#define CABAC_ENTRY(ctxidx, idc0_m, idc0_n, idc1_m, idc1_n,		\
> @@ -841,45 +842,41 @@ static void assemble_hw_scaling_list(struct rkvdec_=
ctx *ctx,
> =C2=A0}
> =C2=A0
> =C2=A0/*
> - * dpb poc related registers table
> + * Set the ref POC in the correct register.
> + *
> + * The 32 registers are spread across 3 regions, each alternating top an=
d bottom ref POCs:
> + *=C2=A0 - 1: ref 0 to 14 contain top 0 to 7 and bottoms 0 to 6
> + *=C2=A0 - 2: ref 15 to 29 contain top 8 to 14 and bottoms 7 to 14
> + *=C2=A0 - 3: ref 30 and 31 which correspond to top 15 and bottom 15 res=
pectively.
> =C2=A0 */
> -static const u32 poc_reg_tbl_top_field[16] =3D {
> -	RKVDEC_REG_H264_POC_REFER0(0),
> -	RKVDEC_REG_H264_POC_REFER0(2),
> -	RKVDEC_REG_H264_POC_REFER0(4),
> -	RKVDEC_REG_H264_POC_REFER0(6),
> -	RKVDEC_REG_H264_POC_REFER0(8),
> -	RKVDEC_REG_H264_POC_REFER0(10),
> -	RKVDEC_REG_H264_POC_REFER0(12),
> -	RKVDEC_REG_H264_POC_REFER0(14),
> -	RKVDEC_REG_H264_POC_REFER1(1),
> -	RKVDEC_REG_H264_POC_REFER1(3),
> -	RKVDEC_REG_H264_POC_REFER1(5),
> -	RKVDEC_REG_H264_POC_REFER1(7),
> -	RKVDEC_REG_H264_POC_REFER1(9),
> -	RKVDEC_REG_H264_POC_REFER1(11),
> -	RKVDEC_REG_H264_POC_REFER1(13),
> -	RKVDEC_REG_H264_POC_REFER2(0)
> -};
> -
> -static const u32 poc_reg_tbl_bottom_field[16] =3D {
> -	RKVDEC_REG_H264_POC_REFER0(1),
> -	RKVDEC_REG_H264_POC_REFER0(3),
> -	RKVDEC_REG_H264_POC_REFER0(5),
> -	RKVDEC_REG_H264_POC_REFER0(7),
> -	RKVDEC_REG_H264_POC_REFER0(9),
> -	RKVDEC_REG_H264_POC_REFER0(11),
> -	RKVDEC_REG_H264_POC_REFER0(13),
> -	RKVDEC_REG_H264_POC_REFER1(0),
> -	RKVDEC_REG_H264_POC_REFER1(2),
> -	RKVDEC_REG_H264_POC_REFER1(4),
> -	RKVDEC_REG_H264_POC_REFER1(6),
> -	RKVDEC_REG_H264_POC_REFER1(8),
> -	RKVDEC_REG_H264_POC_REFER1(10),
> -	RKVDEC_REG_H264_POC_REFER1(12),
> -	RKVDEC_REG_H264_POC_REFER1(14),
> -	RKVDEC_REG_H264_POC_REFER2(1)
> -};
> +static void set_poc_reg(struct rkvdec_regs *regs, uint32_t poc, int id, =
bool bottom)
> +{
> +	if (!bottom) {
> +		switch (id) {
> +		case 0 ... 7:
> +			regs->h26x.ref0_14_poc[id * 2] =3D poc;
> +			break;
> +		case 8 ... 14:
> +			regs->h26x.ref15_29_poc[(id - 8) * 2 + 1] =3D poc;
> +			break;
> +		case 15:
> +			regs->h26x.ref30_poc =3D poc;
> +			break;
> +		}
> +	} else {
> +		switch (id) {
> +		case 0 ... 6:
> +			regs->h26x.ref0_14_poc[id * 2 + 1] =3D poc;
> +			break;
> +		case 7 ... 14:
> +			regs->h26x.ref15_29_poc[(id - 7) * 2] =3D poc;
> +			break;
> +		case 15:
> +			regs->h26x.ref31_poc =3D poc;
> +			break;
> +		}
> +	}
> +}
> =C2=A0
> =C2=A0static void config_registers(struct rkvdec_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct rkvdec_h264_run *run)
> @@ -894,6 +891,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
> =C2=A0	struct vb2_v4l2_buffer *src_buf =3D run->base.bufs.src;
> =C2=A0	struct vb2_v4l2_buffer *dst_buf =3D run->base.bufs.dst;
> =C2=A0	const struct v4l2_format *f;
> +	struct rkvdec_regs *regs =3D &h264_ctx->regs;
> =C2=A0	dma_addr_t rlc_addr;
> =C2=A0	dma_addr_t refer_addr;
> =C2=A0	u32 rlc_len;
> @@ -903,10 +901,11 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0	u32 yuv_virstride =3D 0;
> =C2=A0	u32 offset;
> =C2=A0	dma_addr_t dst_addr;
> -	u32 reg, i;
> +	u32 i;
> =C2=A0
> -	reg =3D RKVDEC_MODE(RKVDEC_MODE_H264);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_SYSCTRL);
> +	memset(regs, 0, sizeof(*regs));
> +
> +	regs->common.reg02.dec_mode =3D RKVDEC_MODE_H264;
> =C2=A0
> =C2=A0	f =3D &ctx->decoded_fmt;
> =C2=A0	dst_fmt =3D &f->fmt.pix_mp;
> @@ -921,39 +920,35 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0	else if (sps->chroma_format_idc =3D=3D 2)
> =C2=A0		yuv_virstride =3D 2 * y_virstride;
> =C2=A0
> -	reg =3D RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / =
16) |
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_SLICE_NUM_HIGHBIT |
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_SLICE_NUM_LOWBITS(0x7ff);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_PICPAR);
> +	regs->common.reg03.uv_hor_virstride =3D hor_virstride / 16;
> +	regs->common.reg03.y_hor_virstride =3D hor_virstride / 16;
> +	regs->common.reg03.slice_num_highbit =3D 1;
> +	regs->common.reg03.slice_num_lowbits =3D 0x7ff;
> =C2=A0
> =C2=A0	/* config rlc base address */
> =C2=A0	rlc_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> -	writel_relaxed(rlc_addr, rkvdec->regs + RKVDEC_REG_STRM_RLC_BASE);
> -	writel_relaxed(rlc_addr, rkvdec->regs + RKVDEC_REG_RLCWRITE_BASE);
> +	regs->common.strm_rlc_base =3D rlc_addr;
> +	regs->h26x.rlcwrite_base =3D rlc_addr;
> =C2=A0
> =C2=A0	rlc_len =3D vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> -	reg =3D RKVDEC_STRM_LEN(rlc_len);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_STRM_LEN);
> +	regs->common.stream_len =3D rlc_len;
> =C2=A0
> =C2=A0	/* config cabac table */
> =C2=A0	offset =3D offsetof(struct rkvdec_h264_priv_tbl, cabac_table);
> -	writel_relaxed(priv_start_addr + offset,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_CABACTB=
L_PROB_BASE);
> +	regs->common.cabactbl_base =3D priv_start_addr + offset;
> =C2=A0
> =C2=A0	/* config output base address */
> =C2=A0	dst_addr =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> -	writel_relaxed(dst_addr, rkvdec->regs + RKVDEC_REG_DECOUT_BASE);
> +	regs->common.decout_base =3D dst_addr;
> =C2=A0
> -	reg =3D RKVDEC_Y_VIRSTRIDE(y_virstride / 16);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_Y_VIRSTRIDE);
> +	regs->common.reg08.y_virstride =3D y_virstride / 16;
> =C2=A0
> -	reg =3D RKVDEC_YUV_VIRSTRIDE(yuv_virstride / 16);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_YUV_VIRSTRIDE);
> +	regs->common.reg09.yuv_virstride =3D yuv_virstride / 16;
> =C2=A0
> =C2=A0	/* config ref pic address & poc */
> =C2=A0	for (i =3D 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
> =C2=A0		struct vb2_buffer *vb_buf =3D run->ref_buf[i];
> +		struct ref_base *base;
> =C2=A0
> =C2=A0		/*
> =C2=A0		 * If a DPB entry is unused or invalid, address of current destin=
ation
> @@ -963,54 +958,36 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0			vb_buf =3D &dst_buf->vb2_buf;
> =C2=A0		refer_addr =3D vb2_dma_contig_plane_dma_addr(vb_buf, 0);
> =C2=A0
> -		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE)
> -			refer_addr |=3D RKVDEC_COLMV_USED_FLAG_REF;
> -		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD)
> -			refer_addr |=3D RKVDEC_FIELD_REF;
> -
> -		if (dpb[i].fields & V4L2_H264_TOP_FIELD_REF)
> -			refer_addr |=3D RKVDEC_TOPFIELD_USED_REF;
> -		if (dpb[i].fields & V4L2_H264_BOTTOM_FIELD_REF)
> -			refer_addr |=3D RKVDEC_BOTFIELD_USED_REF;
> -
> -		writel_relaxed(dpb[i].top_field_order_cnt,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs +=C2=A0 poc_reg_tbl=
_top_field[i]);
> -		writel_relaxed(dpb[i].bottom_field_order_cnt,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + poc_reg_tbl_botto=
m_field[i]);
> -
> =C2=A0		if (i < V4L2_H264_NUM_DPB_ENTRIES - 1)
> -			writel_relaxed(refer_addr,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_H264_=
BASE_REFER(i));
> +			base =3D &regs->h26x.ref0_14_base[i];
> =C2=A0		else
> -			writel_relaxed(refer_addr,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_H264_=
BASE_REFER15);
> -	}
> +			base =3D &regs->h26x.ref15_base;
> =C2=A0
> -	reg =3D RKVDEC_CUR_POC(dec_params->top_field_order_cnt);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_CUR_POC0);
> +		base->field_ref =3D !!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_FIELD);
> +		base->colmv_used_flag_ref =3D !!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FL=
AG_ACTIVE);
> +		base->topfield_used_ref =3D !!(dpb[i].fields & V4L2_H264_TOP_FIELD_REF=
);
> +		base->botfield_used_ref =3D !!(dpb[i].fields & V4L2_H264_BOTTOM_FIELD_=
REF);
> +		base->base_addr =3D refer_addr >> 4;
> =C2=A0
> -	reg =3D RKVDEC_CUR_POC(dec_params->bottom_field_order_cnt);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_CUR_POC1);
> +		set_poc_reg(regs, dpb[i].top_field_order_cnt, i, false);
> +		set_poc_reg(regs, dpb[i].bottom_field_order_cnt, i, true);
> +	}
> +
> +	regs->h26x.cur_poc =3D dec_params->top_field_order_cnt;
> +	regs->h26x.cur_poc1 =3D dec_params->bottom_field_order_cnt;
> =C2=A0
> =C2=A0	/* config hw pps address */
> =C2=A0	offset =3D offsetof(struct rkvdec_h264_priv_tbl, param_set);
> -	writel_relaxed(priv_start_addr + offset,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_PPS_BAS=
E);
> +	regs->h26x.pps_base =3D priv_start_addr + offset;
> =C2=A0
> =C2=A0	/* config hw rps address */
> =C2=A0	offset =3D offsetof(struct rkvdec_h264_priv_tbl, rps);
> -	writel_relaxed(priv_start_addr + offset,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_RPS_BAS=
E);
> -
> -	reg =3D RKVDEC_AXI_DDR_RDATA(0);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_AXI_DDR_RDATA);
> -
> -	reg =3D RKVDEC_AXI_DDR_WDATA(0);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_AXI_DDR_WDATA);
> +	regs->h26x.rps_base =3D priv_start_addr + offset;
> =C2=A0
> =C2=A0	offset =3D offsetof(struct rkvdec_h264_priv_tbl, err_info);
> -	writel_relaxed(priv_start_addr + offset,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_H264_ER=
RINFO_BASE);
> +	regs->h26x.errorinfo_base =3D priv_start_addr + offset;
> +
> +	rkvdec_memcpy_toio(rkvdec->regs, regs, MIN(sizeof(*regs), 4 * rkvdec->v=
ariant->num_regs));
> =C2=A0}
> =C2=A0
> =C2=A0#define RKVDEC_H264_MAX_DEPTH_IN_BYTES		2
> @@ -1181,8 +1158,6 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
> =C2=A0
> =C2=A0	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(200=
0));
> =C2=A0
> -	writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> -	writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
> =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> index fc7e6a260b0a..01f92fa27356 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> @@ -129,6 +129,7 @@ struct rkvdec_hevc_run {
> =C2=A0struct rkvdec_hevc_ctx {
> =C2=A0	struct rkvdec_aux_buf priv_tbl;
> =C2=A0	struct v4l2_ctrl_hevc_scaling_matrix scaling_matrix_cache;
> +	struct rkvdec_regs regs;
> =C2=A0};
> =C2=A0
> =C2=A0struct scaling_factor {
> @@ -548,6 +549,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
> =C2=A0	const struct v4l2_ctrl_hevc_slice_params *sl_params =3D &run->slic=
es_params[0];
> =C2=A0	const struct v4l2_hevc_dpb_entry *dpb =3D decode_params->dpb;
> =C2=A0	struct rkvdec_hevc_ctx *hevc_ctx =3D ctx->priv;
> +	struct rkvdec_regs *regs =3D &hevc_ctx->regs;
> =C2=A0	dma_addr_t priv_start_addr =3D hevc_ctx->priv_tbl.dma;
> =C2=A0	const struct v4l2_pix_format_mplane *dst_fmt;
> =C2=A0	struct vb2_v4l2_buffer *src_buf =3D run->base.bufs.src;
> @@ -564,8 +566,9 @@ static void config_registers(struct rkvdec_ctx *ctx,
> =C2=A0	dma_addr_t dst_addr;
> =C2=A0	u32 reg, i;
> =C2=A0
> -	reg =3D RKVDEC_MODE(RKVDEC_MODE_HEVC);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_SYSCTRL);
> +	memset(regs, 0, sizeof(*regs));
> +
> +	regs->common.reg02.dec_mode =3D RKVDEC_MODE_HEVC;
> =C2=A0
> =C2=A0	f =3D &ctx->decoded_fmt;
> =C2=A0	dst_fmt =3D &f->fmt.pix_mp;
> @@ -580,33 +583,27 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0	else if (sps->chroma_format_idc =3D=3D 2)
> =C2=A0		yuv_virstride =3D 2 * y_virstride;
> =C2=A0
> -	reg =3D RKVDEC_Y_HOR_VIRSTRIDE(hor_virstride / 16) |
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_UV_HOR_VIRSTRIDE(hor_virstride / =
16) |
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_SLICE_NUM_LOWBITS(run->num_slices=
);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_PICPAR);
> +	regs->common.reg03.slice_num_lowbits =3D run->num_slices;
> +	regs->common.reg03.uv_hor_virstride =3D hor_virstride / 16;
> +	regs->common.reg03.y_hor_virstride =3D hor_virstride / 16;
> =C2=A0
> =C2=A0	/* config rlc base address */
> =C2=A0	rlc_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
> -	writel_relaxed(rlc_addr, rkvdec->regs + RKVDEC_REG_STRM_RLC_BASE);
> +	regs->common.strm_rlc_base =3D rlc_addr;
> =C2=A0
> =C2=A0	rlc_len =3D vb2_get_plane_payload(&src_buf->vb2_buf, 0);
> -	reg =3D RKVDEC_STRM_LEN(round_up(rlc_len, 16) + 64);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_STRM_LEN);
> +	regs->common.stream_len =3D round_up(rlc_len, 16) + 64;
> =C2=A0
> =C2=A0	/* config cabac table */
> =C2=A0	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, cabac_table);
> -	writel_relaxed(priv_start_addr + offset,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_CABACTB=
L_PROB_BASE);
> +	regs->common.cabactbl_base =3D priv_start_addr + offset;
> =C2=A0
> =C2=A0	/* config output base address */
> =C2=A0	dst_addr =3D vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> -	writel_relaxed(dst_addr, rkvdec->regs + RKVDEC_REG_DECOUT_BASE);
> -
> -	reg =3D RKVDEC_Y_VIRSTRIDE(y_virstride / 16);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_Y_VIRSTRIDE);
> +	regs->common.decout_base =3D dst_addr;
> =C2=A0
> -	reg =3D RKVDEC_YUV_VIRSTRIDE(yuv_virstride / 16);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_YUV_VIRSTRIDE);
> +	regs->common.reg08.y_virstride =3D y_virstride / 16;
> +	regs->common.reg09.yuv_virstride =3D yuv_virstride / 16;
> =C2=A0
> =C2=A0	/* config ref pic address */
> =C2=A0	for (i =3D 0; i < 15; i++) {
> @@ -620,33 +617,29 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0		}
> =C2=A0
> =C2=A0		refer_addr =3D vb2_dma_contig_plane_dma_addr(vb_buf, 0);
> -		writel_relaxed(refer_addr | reg,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_H264_B=
ASE_REFER(i));
> =C2=A0
> -		reg =3D RKVDEC_POC_REFER(i < decode_params->num_active_dpb_entries ?
> -			dpb[i].pic_order_cnt_val : 0);
> -		writel_relaxed(reg,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_H264_P=
OC_REFER0(i));
> +		regs->h26x.ref0_14_base[i].base_addr =3D refer_addr >> 4;
> +		regs->h26x.ref0_14_base[i].field_ref =3D !!(reg & 1);
> +		regs->h26x.ref0_14_base[i].topfield_used_ref =3D !!(reg & 2);
> +		regs->h26x.ref0_14_base[i].botfield_used_ref =3D !!(reg & 4);
> +		regs->h26x.ref0_14_base[i].colmv_used_flag_ref =3D !!(reg & 8);
> +
> +		regs->h26x.ref0_14_poc[i] =3D i < decode_params->num_active_dpb_entrie=
s
> +					=C2=A0=C2=A0=C2=A0 ? dpb[i].pic_order_cnt_val
> +					=C2=A0=C2=A0=C2=A0 : 0;
> =C2=A0	}
> =C2=A0
> -	reg =3D RKVDEC_CUR_POC(sl_params->slice_pic_order_cnt);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_CUR_POC0);
> +	regs->h26x.cur_poc =3D sl_params->slice_pic_order_cnt;
> =C2=A0
> =C2=A0	/* config hw pps address */
> =C2=A0	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, param_set);
> -	writel_relaxed(priv_start_addr + offset,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_PPS_BAS=
E);
> +	regs->h26x.pps_base =3D priv_start_addr + offset;
> =C2=A0
> =C2=A0	/* config hw rps address */
> =C2=A0	offset =3D offsetof(struct rkvdec_hevc_priv_tbl, rps);
> -	writel_relaxed(priv_start_addr + offset,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_RPS_BAS=
E);
> -
> -	reg =3D RKVDEC_AXI_DDR_RDATA(0);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_AXI_DDR_RDATA);
> +	regs->h26x.rps_base =3D priv_start_addr + offset;
> =C2=A0
> -	reg =3D RKVDEC_AXI_DDR_WDATA(0);
> -	writel_relaxed(reg, rkvdec->regs + RKVDEC_REG_AXI_DDR_WDATA);
> +	rkvdec_memcpy_toio(rkvdec->regs, regs, MIN(sizeof(*regs), 4 * rkvdec->v=
ariant->num_regs));
> =C2=A0}
> =C2=A0
> =C2=A0#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
> @@ -784,8 +777,6 @@ static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
> =C2=A0
> =C2=A0	schedule_delayed_work(&rkvdec->watchdog_work, msecs_to_jiffies(200=
0));
> =C2=A0
> -	writel(0, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> -	writel(0, rkvdec->regs + RKVDEC_REG_H264_ERR_E);
> =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h b/drive=
rs/media/platform/rockchip/rkvdec/rkvdec-regs.h
> index c627b6b6f53a..7745ea257148 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-regs.h
> @@ -3,7 +3,12 @@
> =C2=A0#ifndef RKVDEC_REGS_H_
> =C2=A0#define RKVDEC_REGS_H_
> =C2=A0
> -/* rkvcodec registers */
> +#include <linux/types.h>
> +
> +/*
> + * REG_INTERRUPT is accessed via writel to enable the decoder after
> + * configuring it and clear interrupt strmd_error_status
> + */
> =C2=A0#define RKVDEC_REG_INTERRUPT				0x004
> =C2=A0#define RKVDEC_INTERRUPT_DEC_E				BIT(0)
> =C2=A0#define RKVDEC_CONFIG_DEC_CLK_GATE_E			BIT(1)
> @@ -30,198 +35,384 @@
> =C2=A0#define RKVDEC_SOFTRESET_RDY				BIT(22)
> =C2=A0#define RKVDEC_WR_DDR_ALIGN_EN				BIT(23)
> =C2=A0
> -#define RKVDEC_REG_SYSCTRL				0x008
> -#define RKVDEC_IN_ENDIAN				BIT(0)
> -#define RKVDEC_IN_SWAP32_E				BIT(1)
> -#define RKVDEC_IN_SWAP64_E				BIT(2)
> -#define RKVDEC_STR_ENDIAN				BIT(3)
> -#define RKVDEC_STR_SWAP32_E				BIT(4)
> -#define RKVDEC_STR_SWAP64_E				BIT(5)
> -#define RKVDEC_OUT_ENDIAN				BIT(6)
> -#define RKVDEC_OUT_SWAP32_E				BIT(7)
> -#define RKVDEC_OUT_CBCR_SWAP				BIT(8)
> -#define RKVDEC_RLC_MODE_DIRECT_WRITE			BIT(10)
> -#define RKVDEC_RLC_MODE					BIT(11)
> -#define RKVDEC_STRM_START_BIT(x)			(((x) & 0x7f) << 12)
> -#define RKVDEC_MODE(x)					(((x) & 0x03) << 20)
> -#define RKVDEC_MODE_HEVC				0
> -#define RKVDEC_MODE_H264				1
> -#define RKVDEC_MODE_VP9					2
> -#define RKVDEC_RPS_MODE					BIT(24)
> -#define RKVDEC_STRM_MODE				BIT(25)
> -#define RKVDEC_H264_STRM_LASTPKT			BIT(26)
> -#define RKVDEC_H264_FIRSTSLICE_FLAG			BIT(27)
> -#define RKVDEC_H264_FRAME_ORSLICE			BIT(28)
> -#define RKVDEC_BUSPR_SLOT_DIS				BIT(29)
> -
> -#define RKVDEC_REG_PICPAR				0x00C
> -#define RKVDEC_Y_HOR_VIRSTRIDE(x)			((x) & 0x1ff)
> -#define RKVDEC_SLICE_NUM_HIGHBIT			BIT(11)
> -#define RKVDEC_UV_HOR_VIRSTRIDE(x)			(((x) & 0x1ff) << 12)
> -#define RKVDEC_SLICE_NUM_LOWBITS(x)			(((x) & 0x7ff) << 21)
> -
> -#define RKVDEC_REG_STRM_RLC_BASE			0x010
> -
> -#define RKVDEC_REG_STRM_LEN				0x014
> -#define RKVDEC_STRM_LEN(x)				((x) & 0x7ffffff)
> -
> -#define RKVDEC_REG_CABACTBL_PROB_BASE			0x018
> -#define RKVDEC_REG_DECOUT_BASE				0x01C
> -
> -#define RKVDEC_REG_Y_VIRSTRIDE				0x020
> -#define RKVDEC_Y_VIRSTRIDE(x)				((x) & 0xfffff)
> -
> -#define RKVDEC_REG_YUV_VIRSTRIDE			0x024
> -#define RKVDEC_YUV_VIRSTRIDE(x)				((x) & 0x1fffff)
> -#define RKVDEC_REG_H264_BASE_REFER(i)			(((i) * 0x04) + 0x028)
> -
> -#define RKVDEC_REG_H264_BASE_REFER15			0x0C0
> -#define RKVDEC_FIELD_REF				BIT(0)
> -#define RKVDEC_TOPFIELD_USED_REF			BIT(1)
> -#define RKVDEC_BOTFIELD_USED_REF			BIT(2)
> -#define RKVDEC_COLMV_USED_FLAG_REF			BIT(3)
> -
> -#define RKVDEC_REG_VP9_LAST_FRAME_BASE			0x02c
> -#define RKVDEC_REG_VP9_GOLDEN_FRAME_BASE		0x030
> -#define RKVDEC_REG_VP9_ALTREF_FRAME_BASE		0x034
> -
> -#define RKVDEC_REG_VP9_CPRHEADER_OFFSET			0x028
> -#define RKVDEC_VP9_CPRHEADER_OFFSET(x)			((x) & 0xffff)
> -
> -#define RKVDEC_REG_VP9_REFERLAST_BASE			0x02C
> -#define RKVDEC_REG_VP9_REFERGOLDEN_BASE			0x030
> -#define RKVDEC_REG_VP9_REFERALFTER_BASE			0x034
> -
> -#define RKVDEC_REG_VP9COUNT_BASE			0x038
> -#define RKVDEC_VP9COUNT_UPDATE_EN			BIT(0)
> -
> -#define RKVDEC_REG_VP9_SEGIDLAST_BASE			0x03C
> -#define RKVDEC_REG_VP9_SEGIDCUR_BASE			0x040
> -#define RKVDEC_REG_VP9_FRAME_SIZE(i)			((i) * 0x04 + 0x044)
> -#define RKVDEC_VP9_FRAMEWIDTH(x)			(((x) & 0xffff) << 0)
> -#define RKVDEC_VP9_FRAMEHEIGHT(x)			(((x) & 0xffff) << 16)
> -
> -#define RKVDEC_VP9_SEGID_GRP(i)				((i) * 0x04 + 0x050)
> -#define RKVDEC_SEGID_ABS_DELTA(x)			((x) & 0x1)
> -#define RKVDEC_SEGID_FRAME_QP_DELTA_EN(x)		(((x) & 0x1) << 1)
> -#define RKVDEC_SEGID_FRAME_QP_DELTA(x)			(((x) & 0x1ff) << 2)
> -#define RKVDEC_SEGID_FRAME_LOOPFILTER_VALUE_EN(x)	(((x) & 0x1) << 11)
> -#define RKVDEC_SEGID_FRAME_LOOPFILTER_VALUE(x)		(((x) & 0x7f) << 12)
> -#define RKVDEC_SEGID_REFERINFO_EN(x)			(((x) & 0x1) << 19)
> -#define RKVDEC_SEGID_REFERINFO(x)			(((x) & 0x03) << 20)
> -#define RKVDEC_SEGID_FRAME_SKIP_EN(x)			(((x) & 0x1) << 22)
> -
> -#define RKVDEC_VP9_CPRHEADER_CONFIG			0x070
> -#define RKVDEC_VP9_TX_MODE(x)				((x) & 0x07)
> -#define RKVDEC_VP9_FRAME_REF_MODE(x)			(((x) & 0x03) << 3)
> -
> -#define RKVDEC_VP9_REF_SCALE(i)				((i) * 0x04 + 0x074)
> -#define RKVDEC_VP9_REF_HOR_SCALE(x)			((x) & 0xffff)
> -#define RKVDEC_VP9_REF_VER_SCALE(x)			(((x) & 0xffff) << 16)
> -
> -#define RKVDEC_VP9_REF_DELTAS_LASTFRAME			0x080
> -#define RKVDEC_REF_DELTAS_LASTFRAME(pos, val)		(((val) & 0x7f) << ((pos)=
 * 7))
> -
> -#define RKVDEC_VP9_INFO_LASTFRAME			0x084
> -#define RKVDEC_MODE_DELTAS_LASTFRAME(pos, val)		(((val) & 0x7f) << ((pos=
) * 7))
> -#define RKVDEC_SEG_EN_LASTFRAME				BIT(16)
> -#define RKVDEC_LAST_SHOW_FRAME				BIT(17)
> -#define RKVDEC_LAST_INTRA_ONLY				BIT(18)
> -#define RKVDEC_LAST_WIDHHEIGHT_EQCUR			BIT(19)
> -#define RKVDEC_COLOR_SPACE_LASTKEYFRAME(x)		(((x) & 0x07) << 20)
> -
> -#define RKVDEC_VP9_INTERCMD_BASE			0x088
> -
> -#define RKVDEC_VP9_INTERCMD_NUM				0x08C
> -#define RKVDEC_INTERCMD_NUM(x)				((x) & 0xffffff)
> -
> -#define RKVDEC_VP9_LASTTILE_SIZE			0x090
> -#define RKVDEC_LASTTILE_SIZE(x)				((x) & 0xffffff)
> -
> -#define RKVDEC_VP9_HOR_VIRSTRIDE(i)			((i) * 0x04 + 0x094)
> -#define RKVDEC_HOR_Y_VIRSTRIDE(x)			((x) & 0x1ff)
> -#define RKVDEC_HOR_UV_VIRSTRIDE(x)			(((x) & 0x1ff) << 16)
> -
> -#define RKVDEC_REG_H264_POC_REFER0(i)			(((i) * 0x04) + 0x064)
> -#define RKVDEC_REG_H264_POC_REFER1(i)			(((i) * 0x04) + 0x0C4)
> -#define RKVDEC_REG_H264_POC_REFER2(i)			(((i) * 0x04) + 0x120)
> -#define RKVDEC_POC_REFER(x)				((x) & 0xffffffff)
> -
> -#define RKVDEC_REG_CUR_POC0				0x0A0
> -#define RKVDEC_REG_CUR_POC1				0x128
> -#define RKVDEC_CUR_POC(x)				((x) & 0xffffffff)
> -
> -#define RKVDEC_REG_RLCWRITE_BASE			0x0A4
> -#define RKVDEC_REG_PPS_BASE				0x0A8
> -#define RKVDEC_REG_RPS_BASE				0x0AC
> -
> -#define RKVDEC_REG_STRMD_ERR_EN				0x0B0
> -#define RKVDEC_STRMD_ERR_EN(x)				((x) & 0xffffffff)
> -
> -#define RKVDEC_REG_STRMD_ERR_STA			0x0B4
> -#define RKVDEC_STRMD_ERR_STA(x)				((x) & 0xfffffff)
> -#define RKVDEC_COLMV_ERR_REF_PICIDX(x)			(((x) & 0x0f) << 28)
> -
> -#define RKVDEC_REG_STRMD_ERR_CTU			0x0B8
> -#define RKVDEC_STRMD_ERR_CTU(x)				((x) & 0xff)
> -#define RKVDEC_STRMD_ERR_CTU_YOFFSET(x)			(((x) & 0xff) << 8)
> -#define RKVDEC_STRMFIFO_SPACE2FULL(x)			(((x) & 0x7f) << 16)
> -#define RKVDEC_VP9_ERR_EN_CTU0				BIT(24)
> -
> -#define RKVDEC_REG_SAO_CTU_POS				0x0BC
> -#define RKVDEC_SAOWR_XOFFSET(x)				((x) & 0x1ff)
> -#define RKVDEC_SAOWR_YOFFSET(x)				(((x) & 0x3ff) << 16)
> -
> -#define RKVDEC_VP9_LAST_FRAME_YSTRIDE			0x0C0
> -#define RKVDEC_VP9_GOLDEN_FRAME_YSTRIDE			0x0C4
> -#define RKVDEC_VP9_ALTREF_FRAME_YSTRIDE			0x0C8
> -#define RKVDEC_VP9_REF_YSTRIDE(x)			(((x) & 0xfffff) << 0)
> -
> -#define RKVDEC_VP9_LAST_FRAME_YUVSTRIDE			0x0CC
> -#define RKVDEC_VP9_REF_YUVSTRIDE(x)			(((x) & 0x1fffff) << 0)
> -
> -#define RKVDEC_VP9_REF_COLMV_BASE			0x0D0
> -
> -#define RKVDEC_REG_PERFORMANCE_CYCLE			0x100
> -#define RKVDEC_PERFORMANCE_CYCLE(x)			((x) & 0xffffffff)
> -
> -#define RKVDEC_REG_AXI_DDR_RDATA			0x104
> -#define RKVDEC_AXI_DDR_RDATA(x)				((x) & 0xffffffff)
> -
> -#define RKVDEC_REG_AXI_DDR_WDATA			0x108
> -#define RKVDEC_AXI_DDR_WDATA(x)				((x) & 0xffffffff)
> -
> -#define RKVDEC_REG_FPGADEBUG_RESET			0x10C
> -#define RKVDEC_BUSIFD_RESETN				BIT(0)
> -#define RKVDEC_CABAC_RESETN				BIT(1)
> -#define RKVDEC_DEC_CTRL_RESETN				BIT(2)
> -#define RKVDEC_TRANSD_RESETN				BIT(3)
> -#define RKVDEC_INTRA_RESETN				BIT(4)
> -#define RKVDEC_INTER_RESETN				BIT(5)
> -#define RKVDEC_RECON_RESETN				BIT(6)
> -#define RKVDEC_FILER_RESETN				BIT(7)
> -
> -#define RKVDEC_REG_PERFORMANCE_SEL			0x110
> -#define RKVDEC_PERF_SEL_CNT0(x)				((x) & 0x3f)
> -#define RKVDEC_PERF_SEL_CNT1(x)				(((x) & 0x3f) << 8)
> -#define RKVDEC_PERF_SEL_CNT2(x)				(((x) & 0x3f) << 16)
> -
> -#define RKVDEC_REG_PERFORMANCE_CNT(i)			((i) * 0x04 + 0x114)
> -#define RKVDEC_PERF_CNT(x)				((x) & 0xffffffff)
> -
> -#define RKVDEC_REG_H264_ERRINFO_BASE			0x12C
> -
> -#define RKVDEC_REG_H264_ERRINFO_NUM			0x130
> -#define RKVDEC_SLICEDEC_NUM(x)				((x) & 0x3fff)
> -#define RKVDEC_STRMD_DECT_ERR_FLAG			BIT(15)
> -#define RKVDEC_ERR_PKT_NUM(x)				(((x) & 0x3fff) << 16)
> -
> -#define RKVDEC_REG_H264_ERR_E				0x134
> -#define RKVDEC_H264_ERR_EN_HIGHBITS(x)			((x) & 0x3fffffff)
> -
> =C2=A0#define RKVDEC_REG_QOS_CTRL				0x18C
> =C2=A0
> +/*
> + * Cache configuration is not covered in the range of the register struc=
t
> + */
> =C2=A0#define RKVDEC_REG_PREF_LUMA_CACHE_COMMAND		0x410
> =C2=A0#define RKVDEC_REG_PREF_CHR_CACHE_COMMAND		0x450
> =C2=A0
> +/*
> + * Define the mode values
> + */
> +#define RKVDEC_MODE_HEVC				0
> +#define RKVDEC_MODE_H264				1
> +#define RKVDEC_MODE_VP9					2
> +
> +/* rkvcodec registers */
> +struct rkvdec_common_regs {
> +	struct rkvdec_id {
> +		u32 minor_ver	: 8;
> +		u32 level	: 1;
> +		u32 dec_support	: 3;
> +		u32 profile	: 1;
> +		u32 reserved0	: 1;
> +		u32 codec_flag	: 1;
> +		u32 reserved1	: 1;
> +		u32 prod_num	: 16;
> +	} reg00;
> +
> +	struct rkvdec_int {
> +		u32 dec_e			: 1;
> +		u32 dec_clkgate_e		: 1;
> +		u32 reserved0			: 1;
> +		u32 timeout_mode		: 1;
> +		u32 dec_irq_dis			: 1;
> +		u32 dec_timeout_e		: 1;
> +		u32 buf_empty_en		: 1;
> +		u32 stmerror_waitdecfifo_empty	: 1;
> +		u32 dec_irq			: 1;
> +		u32 dec_irq_raw			: 1;
> +		u32 reserved2			: 2;
> +		u32 dec_rdy_sta			: 1;
> +		u32 dec_bus_sta			: 1;
> +		u32 dec_error_sta		: 1;
> +		u32 dec_timeout_sta		: 1;
> +		u32 dec_empty_sta		: 1;
> +		u32 colmv_ref_error_sta		: 1;
> +		u32 cabu_end_sta		: 1;
> +		u32 h264orvp9_error_mode	: 1;
> +		u32 softrst_en_p		: 1;
> +		u32 force_softreset_valid	: 1;
> +		u32 softreset_rdy		: 1;
> +		u32 reserved1			: 9;
> +	} reg01;
> +
> +	struct rkvdec_sysctrl {
> +		u32 in_endian			: 1;
> +		u32 in_swap32_e			: 1;
> +		u32 in_swap64_e			: 1;
> +		u32 str_endian			: 1;
> +		u32 str_swap32_e		: 1;
> +		u32 str_swap64_e		: 1;
> +		u32 out_endian			: 1;
> +		u32 out_swap32_e		: 1;
> +		u32 out_cbcr_swap		: 1;
> +		u32 reserved0			: 1;
> +		u32 rlc_mode_direct_write	: 1;
> +		u32 rlc_mode			: 1;
> +		u32 strm_start_bit		: 7;
> +		u32 reserved1			: 1;
> +		u32 dec_mode			: 2;
> +		u32 reserved2			: 2;
> +		u32 rps_mode			: 1;
> +		u32 stream_mode			: 1;
> +		u32 stream_lastpacket		: 1;
> +		u32 firstslice_flag		: 1;
> +		u32 frame_orslice		: 1;
> +		u32 buspr_slot_disable		: 1;
> +		u32 reserved3			: 2;
> +	} reg02;
> +
> +	struct rkvdec_picpar {
> +		u32 y_hor_virstride	: 9;
> +		u32 reserved		: 2;
> +		u32 slice_num_highbit	: 1;
> +		u32 uv_hor_virstride	: 9;
> +		u32 slice_num_lowbits	: 11;
> +	} reg03;
> +
> +	u32 strm_rlc_base;
> +	u32 stream_len;
> +	u32 cabactbl_base;
> +	u32 decout_base;
> +
> +	struct rkvdec_y_virstride {
> +		u32 y_virstride	: 20;
> +		u32 reserved0	: 12;
> +	} reg08;
> +
> +	struct rkvdec_yuv_virstride {
> +		u32 yuv_virstride	: 21;
> +		u32 reserved0		: 11;
> +	} reg09;
> +} __packed;
> +
> +struct ref_base {
> +	u32 field_ref		: 1;
> +	u32 topfield_used_ref	: 1;
> +	u32 botfield_used_ref	: 1;
> +	u32 colmv_used_flag_ref	: 1;
> +	u32 base_addr		: 28;
> +};
> +
> +struct rkvdec_h26x_regs {
> +	struct ref_base ref0_14_base[15];
> +	u32 ref0_14_poc[15];
> +
> +	u32 cur_poc;
> +	u32 rlcwrite_base;
> +	u32 pps_base;
> +	u32 rps_base;
> +
> +	u32 strmd_error_e;
> +
> +	struct {
> +		u32 strmd_error_status		: 28;
> +		u32 colmv_error_ref_picidx	: 4;
> +	} reg45;
> +
> +	struct {
> +		u32 strmd_error_ctu_xoffset	: 8;
> +		u32 strmd_error_ctu_yoffset	: 8;
> +		u32 streamfifo_space2full	: 7;
> +		u32 reserved0			: 1;
> +		u32 vp9_error_ctu0_en		: 1;
> +		u32 reserved1			: 7;
> +	} reg46;
> +
> +	struct {
> +		u32 saowr_xoffet	: 9;
> +		u32 reserved0		: 7;
> +		u32 saowr_yoffset	: 10;
> +		u32 reserved1		: 6;
> +	} reg47;
> +
> +	struct ref_base ref15_base;
> +
> +	u32 ref15_29_poc[15];
> +
> +	u32 performance_cycle;
> +	u32 axi_ddr_rdata;
> +	u32 axi_ddr_wdata;
> +
> +	struct {
> +		u32 busifd_resetn	: 1;
> +		u32 cabac_resetn	: 1;
> +		u32 dec_ctrl_resetn	: 1;
> +		u32 transd_resetn	: 1;
> +		u32 intra_resetn	: 1;
> +		u32 inter_resetn	: 1;
> +		u32 recon_resetn	: 1;
> +		u32 filer_resetn	: 1;
> +		u32 reserved0		: 24;
> +	} reg67;
> +
> +	struct {
> +		u32 perf_cnt0_sel	: 6;
> +		u32 reserved0		: 2;
> +		u32 perf_cnt1_sel	: 6;
> +		u32 reserved1		: 2;
> +		u32 perf_cnt2_sel	: 6;
> +		u32 reserved2		: 10;
> +	} reg68;
> +
> +	u32 perf_cnt0;
> +	u32 perf_cnt1;
> +	u32 perf_cnt2;
> +	u32 ref30_poc;
> +	u32 ref31_poc;
> +	u32 cur_poc1;
> +	u32 errorinfo_base;
> +
> +	struct {
> +		u32 slicedec_num		: 14;
> +		u32 reserved0			: 1;
> +		u32 strmd_detect_error_flag	: 1;
> +		u32 error_packet_num		: 14;
> +		u32 reserved1			: 2;
> +	} reg76;
> +
> +	struct {
> +		u32 error_en_highbits	: 30;
> +		u32 reserved		: 2;
> +	} reg77;
> +} __packed;
> +
> +struct rkvdec_vp9_regs {
> +	struct cprheader_offset {
> +		u32 cprheader_offset	: 16;
> +		u32 reserved		: 16;
> +	} reg10;
> +
> +	u32 refer_bases[3];
> +	u32 count_base;
> +	u32 segidlast_base;
> +	u32 segidcur_base;
> +
> +	struct frame_sizes {
> +		u32 framewidth		: 16;
> +		u32 frameheight		: 16;
> +	} reg17_19[3];
> +
> +	struct segid_grp {
> +		u32 segid_abs_delta			: 1;
> +		u32 segid_frame_qp_delta_en		: 1;
> +		u32 segid_frame_qp_delta		: 9;
> +		u32 segid_frame_loopfilter_value_en	: 1;
> +		u32 segid_frame_loopfilter_value	: 7;
> +		u32 segid_referinfo_en			: 1;
> +		u32 segid_referinfo			: 2;
> +		u32 segid_frame_skip_en			: 1;
> +		u32 reserved				: 9;
> +	} reg20_27[8];
> +
> +	struct cprheader_config {
> +		u32 tx_mode			: 3;
> +		u32 frame_reference_mode	: 2;
> +		u32 reserved			: 27;
> +	} reg28;
> +
> +	struct ref_scale {
> +		u32 ref_hor_scale		: 16;
> +		u32 ref_ver_scale		: 16;
> +	} reg29_31[3];
> +
> +	struct ref_deltas_lastframe {
> +		u32 ref_deltas_lastframe0	: 7;
> +		u32 ref_deltas_lastframe1	: 7;
> +		u32 ref_deltas_lastframe2	: 7;
> +		u32 ref_deltas_lastframe3	: 7;
> +		u32 reserved			: 4;
> +	} reg32;
> +
> +	struct info_lastframe {
> +		u32 mode_deltas_lastframe0		: 7;
> +		u32 mode_deltas_lastframe1		: 7;
> +		u32 reserved0				: 2;
> +		u32 segmentation_enable_lstframe	: 1;
> +		u32 last_show_frame			: 1;
> +		u32 last_intra_only			: 1;
> +		u32 last_widthheight_eqcur		: 1;
> +		u32 color_space_lastkeyframe		: 3;
> +		u32 reserved1				: 9;
> +	} reg33;
> +
> +	u32 intercmd_base;
> +
> +	struct intercmd_num {
> +		u32 intercmd_num	: 24;
> +		u32 reserved		: 8;
> +	} reg35;
> +
> +	struct lasttile_size {
> +		u32 lasttile_size	: 24;
> +		u32 reserved		: 8;
> +	} reg36;
> +
> +	struct hor_virstride {
> +		u32 y_hor_virstride	: 9;
> +		u32 reserved0		: 7;
> +		u32 uv_hor_virstride	: 9;
> +		u32 reserved1		: 7;
> +	} reg37_39[3];
> +
> +	u32 cur_poc;
> +
> +	struct rlcwrite_base {
> +		u32 reserved		: 3;
> +		u32 rlcwrite_base	: 29;
> +	} reg41;
> +
> +	struct pps_base {
> +		u32 reserved	: 4;
> +		u32 pps_base	: 28;
> +	} reg42;
> +
> +	struct rps_base {
> +		u32 reserved	: 4;
> +		u32 rps_base	: 28;
> +	} reg43;
> +
> +	struct strmd_error_en {
> +		u32 strmd_error_e	: 28;
> +		u32 reserved		: 4;
> +	} reg44;
> +
> +	u32 vp9_error_info0;
> +
> +	struct strmd_error_ctu {
> +		u32 strmd_error_ctu_xoffset	: 8;
> +		u32 strmd_error_ctu_yoffset	: 8;
> +		u32 streamfifo_space2full	: 7;
> +		u32 reserved0			: 1;
> +		u32 error_ctu0_en		: 1;
> +		u32 reserved1			: 7;
> +	} reg46;
> +
> +	struct sao_ctu_position {
> +		u32 saowr_xoffet	: 9;
> +		u32 reserved0		: 7;
> +		u32 saowr_yoffset	: 10;
> +		u32 reserved1		: 6;
> +	} reg47;
> +
> +	struct ystride {
> +		u32 virstride	: 20;
> +		u32 reserved	: 12;
> +	} reg48_50[3];
> +
> +	struct lastref_yuvstride {
> +		u32 lastref_yuv_virstride	: 21;
> +		u32 reserved			: 11;
> +	} reg51;
> +
> +	u32 refcolmv_base;
> +
> +	u32 reserved0[11];
> +
> +	u32 performance_cycle;
> +	u32 axi_ddr_rdata;
> +	u32 axi_ddr_wdata;
> +
> +	struct fpgadebug_reset {
> +		u32 busifd_resetn	: 1;
> +		u32 cabac_resetn	: 1;
> +		u32 dec_ctrl_resetn	: 1;
> +		u32 transd_resetn	: 1;
> +		u32 intra_resetn	: 1;
> +		u32 inter_resetn	: 1;
> +		u32 recon_resetn	: 1;
> +		u32 filer_resetn	: 1;
> +		u32 reserved		: 24;
> +	} reg67;
> +
> +	struct performance_sel {
> +		u32 perf_cnt0_sel	: 6;
> +		u32 reserved0		: 2;
> +		u32 perf_cnt1_sel	: 6;
> +		u32 reserved1		: 2;
> +		u32 perf_cnt2_sel	: 6;
> +		u32 reserved		: 10;
> +	} reg68;
> +
> +	u32 perf_cnt0;
> +	u32 perf_cnt1;
> +	u32 perf_cnt2;
> +
> +	u32 reserved1[3];
> +
> +	u32 vp9_error_info1;
> +
> +	struct error_ctu1 {
> +		u32 vp9_error_ctu1_x	: 6;
> +		u32 reserved0		: 2;
> +		u32 vp9_error_ctu1_y	: 6;
> +		u32 reserved1		: 1;
> +		u32 vp9_error_ctu1_en	: 1;
> +		u32 reserved2		: 16;
> +	} reg76;
> +
> +	u32 reserved2;
> +} __packed;
> +
> +struct rkvdec_regs {
> +	struct rkvdec_common_regs common;
> +	union {
> +		struct rkvdec_h26x_regs h26x;
> +		struct rkvdec_vp9_regs=C2=A0 vp9;
> +	};
> +} __packed;
> +
> =C2=A0#endif /* RKVDEC_REGS_H_ */
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/driver=
s/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index b4bf01e839ef..0cf5a559701c 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -163,6 +163,7 @@ struct rkvdec_vp9_ctx {
> =C2=A0	struct v4l2_vp9_frame_context frame_context[4];
> =C2=A0	struct rkvdec_vp9_frame_info cur;
> =C2=A0	struct rkvdec_vp9_frame_info last;
> +	struct rkvdec_regs regs;
> =C2=A0};
> =C2=A0
> =C2=A0static void write_coeff_plane(const u8 coef[6][6][3], u8 *coeff_pla=
ne)
> @@ -347,38 +348,6 @@ static void init_probs(struct rkvdec_ctx *ctx,
> =C2=A0		init_inter_probs(ctx, run);
> =C2=A0}
> =C2=A0
> -struct rkvdec_vp9_ref_reg {
> -	u32 reg_frm_size;
> -	u32 reg_hor_stride;
> -	u32 reg_y_stride;
> -	u32 reg_yuv_stride;
> -	u32 reg_ref_base;
> -};
> -
> -static struct rkvdec_vp9_ref_reg ref_regs[] =3D {
> -	{
> -		.reg_frm_size =3D RKVDEC_REG_VP9_FRAME_SIZE(0),
> -		.reg_hor_stride =3D RKVDEC_VP9_HOR_VIRSTRIDE(0),
> -		.reg_y_stride =3D RKVDEC_VP9_LAST_FRAME_YSTRIDE,
> -		.reg_yuv_stride =3D RKVDEC_VP9_LAST_FRAME_YUVSTRIDE,
> -		.reg_ref_base =3D RKVDEC_REG_VP9_LAST_FRAME_BASE,
> -	},
> -	{
> -		.reg_frm_size =3D RKVDEC_REG_VP9_FRAME_SIZE(1),
> -		.reg_hor_stride =3D RKVDEC_VP9_HOR_VIRSTRIDE(1),
> -		.reg_y_stride =3D RKVDEC_VP9_GOLDEN_FRAME_YSTRIDE,
> -		.reg_yuv_stride =3D 0,
> -		.reg_ref_base =3D RKVDEC_REG_VP9_GOLDEN_FRAME_BASE,
> -	},
> -	{
> -		.reg_frm_size =3D RKVDEC_REG_VP9_FRAME_SIZE(2),
> -		.reg_hor_stride =3D RKVDEC_VP9_HOR_VIRSTRIDE(2),
> -		.reg_y_stride =3D RKVDEC_VP9_ALTREF_FRAME_YSTRIDE,
> -		.reg_yuv_stride =3D 0,
> -		.reg_ref_base =3D RKVDEC_REG_VP9_ALTREF_FRAME_BASE,
> -	}
> -};
> -
> =C2=A0static struct rkvdec_decoded_buffer *
> =C2=A0get_ref_buf(struct rkvdec_ctx *ctx, struct vb2_v4l2_buffer *dst, u6=
4 timestamp)
> =C2=A0{
> @@ -412,18 +381,17 @@ static dma_addr_t get_mv_base_addr(struct rkvdec_de=
coded_buffer *buf)
> =C2=A0static void config_ref_registers(struct rkvdec_ctx *ctx,
> =C2=A0				 const struct rkvdec_vp9_run *run,
> =C2=A0				 struct rkvdec_decoded_buffer *ref_buf,
> -				 struct rkvdec_vp9_ref_reg *ref_reg)
> +				 int i)
> =C2=A0{
> =C2=A0	unsigned int aligned_pitch, aligned_height, y_len, yuv_len;
> -	struct rkvdec_dev *rkvdec =3D ctx->dev;
> +	struct rkvdec_vp9_ctx *vp9_ctx =3D ctx->priv;
> +	struct rkvdec_regs *regs =3D &vp9_ctx->regs;
> =C2=A0
> =C2=A0	aligned_height =3D round_up(ref_buf->vp9.height, 64);
> -	writel_relaxed(RKVDEC_VP9_FRAMEWIDTH(ref_buf->vp9.width) |
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_VP9_FRAMEHEIGHT(ref_buf->v=
p9.height),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + ref_reg->reg_frm_s=
ize);
> +	regs->vp9.reg17_19[i].frameheight =3D ref_buf->vp9.height;
> +	regs->vp9.reg17_19[i].framewidth =3D ref_buf->vp9.width;
> =C2=A0
> -	writel_relaxed(vb2_dma_contig_plane_dma_addr(&ref_buf->base.vb.vb2_buf,=
 0),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + ref_reg->reg_ref_b=
ase);
> +	regs->vp9.refer_bases[i] =3D vb2_dma_contig_plane_dma_addr(&ref_buf->ba=
se.vb.vb2_buf, 0);
> =C2=A0
> =C2=A0	if (&ref_buf->base.vb =3D=3D run->base.bufs.dst)
> =C2=A0		return;
> @@ -432,59 +400,50 @@ static void config_ref_registers(struct rkvdec_ctx =
*ctx,
> =C2=A0	y_len =3D aligned_height * aligned_pitch;
> =C2=A0	yuv_len =3D (y_len * 3) / 2;
> =C2=A0
> -	writel_relaxed(RKVDEC_HOR_Y_VIRSTRIDE(aligned_pitch / 16) |
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_HOR_UV_VIRSTRIDE(aligned_p=
itch / 16),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + ref_reg->reg_hor_s=
tride);
> -	writel_relaxed(RKVDEC_VP9_REF_YSTRIDE(y_len / 16),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + ref_reg->reg_y_str=
ide);
> -
> -	if (!ref_reg->reg_yuv_stride)
> -		return;
> +	regs->vp9.reg37_39[i].y_hor_virstride =3D aligned_pitch / 16;
> +	regs->vp9.reg37_39[i].uv_hor_virstride =3D aligned_pitch / 16;
> +	regs->vp9.reg48_50[i].virstride =3D y_len / 16;
> =C2=A0
> -	writel_relaxed(RKVDEC_VP9_REF_YUVSTRIDE(yuv_len / 16),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + ref_reg->reg_yuv_s=
tride);
> +	if (!i)
> +		regs->vp9.reg51.lastref_yuv_virstride =3D yuv_len / 16;
> =C2=A0}
> =C2=A0
> =C2=A0static void config_seg_registers(struct rkvdec_ctx *ctx, unsigned i=
nt segid)
> =C2=A0{
> =C2=A0	struct rkvdec_vp9_ctx *vp9_ctx =3D ctx->priv;
> +	struct rkvdec_regs *regs =3D &vp9_ctx->regs;
> =C2=A0	const struct v4l2_vp9_segmentation *seg;
> -	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =C2=A0	s16 feature_val;
> =C2=A0	int feature_id;
> -	u32 val =3D 0;
> =C2=A0
> =C2=A0	seg =3D vp9_ctx->last.valid ? &vp9_ctx->last.seg : &vp9_ctx->cur.s=
eg;
> =C2=A0	feature_id =3D V4L2_VP9_SEG_LVL_ALT_Q;
> =C2=A0	if (v4l2_vp9_seg_feat_enabled(seg->feature_enabled, feature_id, se=
gid)) {
> =C2=A0		feature_val =3D seg->feature_data[segid][feature_id];
> -		val |=3D RKVDEC_SEGID_FRAME_QP_DELTA_EN(1) |
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_SEGID_FRAME_QP_DELTA(featu=
re_val);
> +		regs->vp9.reg20_27[segid].segid_frame_qp_delta_en =3D 1;
> +		regs->vp9.reg20_27[segid].segid_frame_qp_delta =3D feature_val;
> =C2=A0	}
> =C2=A0
> =C2=A0	feature_id =3D V4L2_VP9_SEG_LVL_ALT_L;
> =C2=A0	if (v4l2_vp9_seg_feat_enabled(seg->feature_enabled, feature_id, se=
gid)) {
> =C2=A0		feature_val =3D seg->feature_data[segid][feature_id];
> -		val |=3D RKVDEC_SEGID_FRAME_LOOPFILTER_VALUE_EN(1) |
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_SEGID_FRAME_LOOPFILTER_VAL=
UE(feature_val);
> +		regs->vp9.reg20_27[segid].segid_frame_loopfilter_value_en =3D 1;
> +		regs->vp9.reg20_27[segid].segid_frame_loopfilter_value =3D feature_val=
;
> =C2=A0	}
> =C2=A0
> =C2=A0	feature_id =3D V4L2_VP9_SEG_LVL_REF_FRAME;
> =C2=A0	if (v4l2_vp9_seg_feat_enabled(seg->feature_enabled, feature_id, se=
gid)) {
> =C2=A0		feature_val =3D seg->feature_data[segid][feature_id];
> -		val |=3D RKVDEC_SEGID_REFERINFO_EN(1) |
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_SEGID_REFERINFO(feature_va=
l);
> +		regs->vp9.reg20_27[segid].segid_referinfo_en =3D 1;
> +		regs->vp9.reg20_27[segid].segid_referinfo =3D feature_val;
> =C2=A0	}
> =C2=A0
> =C2=A0	feature_id =3D V4L2_VP9_SEG_LVL_SKIP;
> -	if (v4l2_vp9_seg_feat_enabled(seg->feature_enabled, feature_id, segid))
> -		val |=3D RKVDEC_SEGID_FRAME_SKIP_EN(1);
> -
> -	if (!segid &&
> -	=C2=A0=C2=A0=C2=A0 (seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELT=
A_UPDATE))
> -		val |=3D RKVDEC_SEGID_ABS_DELTA(1);
> +	regs->vp9.reg20_27[segid].segid_frame_skip_en =3D
> +		v4l2_vp9_seg_feat_enabled(seg->feature_enabled, feature_id, segid);
> =C2=A0
> -	writel_relaxed(val, rkvdec->regs + RKVDEC_VP9_SEGID_GRP(segid));
> +	regs->vp9.reg20_27[segid].segid_abs_delta =3D !segid &&
> +		(seg->flags & V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE);
> =C2=A0}
> =C2=A0
> =C2=A0static void update_dec_buf_info(struct rkvdec_decoded_buffer *buf,
> @@ -521,7 +480,8 @@ static void config_registers(struct rkvdec_ctx *ctx,
> =C2=A0	struct rkvdec_decoded_buffer *ref_bufs[3];
> =C2=A0	struct rkvdec_decoded_buffer *dst, *last, *mv_ref;
> =C2=A0	struct rkvdec_vp9_ctx *vp9_ctx =3D ctx->priv;
> -	u32 val, last_frame_info =3D 0;
> +	struct rkvdec_regs *regs =3D &vp9_ctx->regs;
> +	u32 val;
> =C2=A0	const struct v4l2_vp9_segmentation *seg;
> =C2=A0	struct rkvdec_dev *rkvdec =3D ctx->dev;
> =C2=A0	dma_addr_t addr;
> @@ -547,8 +507,7 @@ static void config_registers(struct rkvdec_ctx *ctx,
> =C2=A0			(V4L2_VP9_FRAME_FLAG_KEY_FRAME |
> =C2=A0			 V4L2_VP9_FRAME_FLAG_INTRA_ONLY));
> =C2=A0
> -	writel_relaxed(RKVDEC_MODE(RKVDEC_MODE_VP9),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_SYSCTRL=
);
> +	regs->common.reg02.dec_mode =3D RKVDEC_MODE_VP9;
> =C2=A0
> =C2=A0	bit_depth =3D dec_params->bit_depth;
> =C2=A0	aligned_height =3D round_up(ctx->decoded_fmt.fmt.pix_mp.height, 64=
);
> @@ -560,17 +519,14 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0	uv_len =3D y_len / 2;
> =C2=A0	yuv_len =3D y_len + uv_len;
> =C2=A0
> -	writel_relaxed(RKVDEC_Y_HOR_VIRSTRIDE(aligned_pitch / 16) |
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_UV_HOR_VIRSTRIDE(aligned_p=
itch / 16),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_PICPAR)=
;
> -	writel_relaxed(RKVDEC_Y_VIRSTRIDE(y_len / 16),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_Y_VIRST=
RIDE);
> -	writel_relaxed(RKVDEC_YUV_VIRSTRIDE(yuv_len / 16),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_YUV_VIR=
STRIDE);
> +	regs->common.reg03.y_hor_virstride =3D aligned_pitch / 16;
> +	regs->common.reg03.uv_hor_virstride =3D aligned_pitch / 16;
> +	regs->common.reg08.y_virstride =3D y_len / 16;
> +	regs->common.reg09.yuv_virstride =3D yuv_len / 16;
> =C2=A0
> =C2=A0	stream_len =3D vb2_get_plane_payload(&run->base.bufs.src->vb2_buf,=
 0);
> -	writel_relaxed(RKVDEC_STRM_LEN(stream_len),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_STRM_LE=
N);
> +
> +	regs->common.stream_len =3D stream_len;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * Reset count buffer, because decoder only output intra related s=
yntax
> @@ -588,14 +544,13 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0		vp9_ctx->cur.segmapid++;
> =C2=A0
> =C2=A0	for (i =3D 0; i < ARRAY_SIZE(ref_bufs); i++)
> -		config_ref_registers(ctx, run, ref_bufs[i], &ref_regs[i]);
> +		config_ref_registers(ctx, run, ref_bufs[i], i);
> =C2=A0
> =C2=A0	for (i =3D 0; i < 8; i++)
> =C2=A0		config_seg_registers(ctx, i);
> =C2=A0
> -	writel_relaxed(RKVDEC_VP9_TX_MODE(vp9_ctx->cur.tx_mode) |
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_VP9_FRAME_REF_MODE(dec_par=
ams->reference_mode),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_VP9_CPRHEAD=
ER_CONFIG);
> +	regs->vp9.reg28.tx_mode =3D vp9_ctx->cur.tx_mode;
> +	regs->vp9.reg28.frame_reference_mode =3D dec_params->reference_mode;
> =C2=A0
> =C2=A0	if (!intra_only) {
> =C2=A0		const struct v4l2_vp9_loop_filter *lf;
> @@ -609,43 +564,56 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0		val =3D 0;
> =C2=A0		for (i =3D 0; i < ARRAY_SIZE(lf->ref_deltas); i++) {
> =C2=A0			delta =3D lf->ref_deltas[i];
> -			val |=3D RKVDEC_REF_DELTAS_LASTFRAME(i, delta);
> +			switch (i) {
> +			case 0:
> +				regs->vp9.reg32.ref_deltas_lastframe0 =3D delta;
> +				break;
> +			case 1:
> +				regs->vp9.reg32.ref_deltas_lastframe1 =3D delta;
> +				break;
> +			case 2:
> +				regs->vp9.reg32.ref_deltas_lastframe2 =3D delta;
> +				break;
> +			case 3:
> +				regs->vp9.reg32.ref_deltas_lastframe3 =3D delta;
> +				break;
> +			}
> =C2=A0		}
> =C2=A0
> -		writel_relaxed(val,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_VP9_REF_DE=
LTAS_LASTFRAME);
> -
> =C2=A0		for (i =3D 0; i < ARRAY_SIZE(lf->mode_deltas); i++) {
> =C2=A0			delta =3D lf->mode_deltas[i];
> -			last_frame_info |=3D RKVDEC_MODE_DELTAS_LASTFRAME(i,
> -									delta);
> +			switch (i) {
> +			case 0:
> +				regs->vp9.reg33.mode_deltas_lastframe0 =3D delta;
> +				break;
> +			case 1:
> +				regs->vp9.reg33.mode_deltas_lastframe1 =3D delta;
> +				break;
> +			}
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (vp9_ctx->last.valid && !intra_only &&
> -	=C2=A0=C2=A0=C2=A0 vp9_ctx->last.seg.flags & V4L2_VP9_SEGMENTATION_FLAG=
_ENABLED)
> -		last_frame_info |=3D RKVDEC_SEG_EN_LASTFRAME;
> +	regs->vp9.reg33.segmentation_enable_lstframe =3D
> +		vp9_ctx->last.valid && !intra_only &&
> +		vp9_ctx->last.seg.flags & V4L2_VP9_SEGMENTATION_FLAG_ENABLED;
> =C2=A0
> -	if (vp9_ctx->last.valid &&
> -	=C2=A0=C2=A0=C2=A0 vp9_ctx->last.flags & V4L2_VP9_FRAME_FLAG_SHOW_FRAME=
)
> -		last_frame_info |=3D RKVDEC_LAST_SHOW_FRAME;
> +	regs->vp9.reg33.last_show_frame =3D
> +		vp9_ctx->last.valid &&
> +		vp9_ctx->last.flags & V4L2_VP9_FRAME_FLAG_SHOW_FRAME;
> =C2=A0
> -	if (vp9_ctx->last.valid &&
> -	=C2=A0=C2=A0=C2=A0 vp9_ctx->last.flags &
> -	=C2=A0=C2=A0=C2=A0 (V4L2_VP9_FRAME_FLAG_KEY_FRAME | V4L2_VP9_FRAME_FLAG=
_INTRA_ONLY))
> -		last_frame_info |=3D RKVDEC_LAST_INTRA_ONLY;
> +	regs->vp9.reg33.last_intra_only =3D
> +		vp9_ctx->last.valid &&
> +		vp9_ctx->last.flags &
> +		(V4L2_VP9_FRAME_FLAG_KEY_FRAME | V4L2_VP9_FRAME_FLAG_INTRA_ONLY);
> =C2=A0
> -	if (vp9_ctx->last.valid &&
> -	=C2=A0=C2=A0=C2=A0 last->vp9.width =3D=3D dst->vp9.width &&
> -	=C2=A0=C2=A0=C2=A0 last->vp9.height =3D=3D dst->vp9.height)
> -		last_frame_info |=3D RKVDEC_LAST_WIDHHEIGHT_EQCUR;
> +	regs->vp9.reg33.last_widthheight_eqcur =3D
> +		vp9_ctx->last.valid &&
> +		last->vp9.width =3D=3D dst->vp9.width &&
> +		last->vp9.height =3D=3D dst->vp9.height;
> =C2=A0
> -	writel_relaxed(last_frame_info,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_VP9_INFO_LA=
STFRAME);
> -
> -	writel_relaxed(stream_len - dec_params->compressed_header_size -
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dec_params->uncompressed_header_s=
ize,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_VP9_LASTTIL=
E_SIZE);
> +	regs->vp9.reg36.lasttile_size =3D
> +		stream_len - dec_params->compressed_header_size -
> +		dec_params->uncompressed_header_size;
> =C2=A0
> =C2=A0	for (i =3D 0; !intra_only && i < ARRAY_SIZE(ref_bufs); i++) {
> =C2=A0		unsigned int refw =3D ref_bufs[i]->vp9.width;
> @@ -654,29 +622,28 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0
> =C2=A0		hscale =3D (refw << 14) /	dst->vp9.width;
> =C2=A0		vscale =3D (refh << 14) / dst->vp9.height;
> -		writel_relaxed(RKVDEC_VP9_REF_HOR_SCALE(hscale) |
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RKVDEC_VP9_REF_VER_SCALE(vscale)=
,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_VP9_REF_SC=
ALE(i));
> +
> +		regs->vp9.reg29_31[i].ref_hor_scale =3D hscale;
> +		regs->vp9.reg29_31[i].ref_ver_scale =3D vscale;
> =C2=A0	}
> =C2=A0
> =C2=A0	addr =3D vb2_dma_contig_plane_dma_addr(&dst->base.vb.vb2_buf, 0);
> -	writel_relaxed(addr, rkvdec->regs + RKVDEC_REG_DECOUT_BASE);
> +	regs->common.decout_base =3D addr;
> =C2=A0	addr =3D vb2_dma_contig_plane_dma_addr(&run->base.bufs.src->vb2_bu=
f, 0);
> -	writel_relaxed(addr, rkvdec->regs + RKVDEC_REG_STRM_RLC_BASE);
> -	writel_relaxed(vp9_ctx->priv_tbl.dma +
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offsetof(struct rkvdec_vp9_priv_t=
bl, probs),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_CABACTB=
L_PROB_BASE);
> -	writel_relaxed(vp9_ctx->count_tbl.dma,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_VP9COUN=
T_BASE);
> -
> -	writel_relaxed(vp9_ctx->priv_tbl.dma +
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offsetof(struct rkvdec_vp9_priv_t=
bl, segmap) +
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (RKVDEC_VP9_MAX_SEGMAP_SIZE * vp9=
_ctx->cur.segmapid),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_VP9_SEG=
IDCUR_BASE);
> -	writel_relaxed(vp9_ctx->priv_tbl.dma +
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 offsetof(struct rkvdec_vp9_priv_t=
bl, segmap) +
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (RKVDEC_VP9_MAX_SEGMAP_SIZE * (!v=
p9_ctx->cur.segmapid)),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_VP9_SEG=
IDLAST_BASE);
> +	regs->common.strm_rlc_base =3D addr;
> +
> +	regs->common.cabactbl_base =3D vp9_ctx->priv_tbl.dma +
> +		offsetof(struct rkvdec_vp9_priv_tbl, probs);
> +
> +	regs->vp9.count_base =3D vp9_ctx->count_tbl.dma;
> +
> +	regs->vp9.segidlast_base =3D vp9_ctx->priv_tbl.dma +
> +		offsetof(struct rkvdec_vp9_priv_tbl, segmap) +
> +		(RKVDEC_VP9_MAX_SEGMAP_SIZE * (!vp9_ctx->cur.segmapid));
> +
> +	regs->vp9.segidcur_base =3D vp9_ctx->priv_tbl.dma +
> +		offsetof(struct rkvdec_vp9_priv_tbl, segmap) +
> +		(RKVDEC_VP9_MAX_SEGMAP_SIZE * vp9_ctx->cur.segmapid);
> =C2=A0
> =C2=A0	if (!intra_only &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 !(dec_params->flags & V4L2_VP9_FRAME_FLAG_ERROR=
_RESILIENT) &&
> @@ -685,12 +652,14 @@ static void config_registers(struct rkvdec_ctx *ctx=
,
> =C2=A0	else
> =C2=A0		mv_ref =3D dst;
> =C2=A0
> -	writel_relaxed(get_mv_base_addr(mv_ref),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_VP9_REF_COL=
MV_BASE);
> +	regs->vp9.refcolmv_base =3D get_mv_base_addr(mv_ref);
> =C2=A0
> -	writel_relaxed(ctx->decoded_fmt.fmt.pix_mp.width |
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ctx->decoded_fmt.fmt.pix_mp.heig=
ht << 16),
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rkvdec->regs + RKVDEC_REG_PERFORM=
ANCE_CYCLE);
> +	regs->vp9.performance_cycle =3D ctx->decoded_fmt.fmt.pix_mp.width |
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ctx->decoded_fmt.fmt.pix_mp.heig=
ht << 16);
> +
> +	regs->vp9.reg44.strmd_error_e =3D 0xe;
> +
> +	rkvdec_memcpy_toio(rkvdec->regs, regs, MIN(sizeof(*regs), rkvdec->varia=
nt->num_regs));
> =C2=A0}
> =C2=A0
> =C2=A0static int validate_dec_params(struct rkvdec_ctx *ctx,
> @@ -823,8 +792,6 @@ static int rkvdec_vp9_run(struct rkvdec_ctx *ctx)
> =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_LUMA_CACHE_COMMAND);
> =C2=A0	writel(1, rkvdec->regs + RKVDEC_REG_PREF_CHR_CACHE_COMMAND);
> =C2=A0
> -	writel(0xe, rkvdec->regs + RKVDEC_REG_STRMD_ERR_EN);
> -
> =C2=A0	if (rkvdec->variant->quirks & RKVDEC_QUIRK_DISABLE_QOS)
> =C2=A0		rkvdec_quirks_disable_qos(ctx);
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 5af9aa5ab353..776149f871b0 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -914,6 +914,15 @@ void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ct=
x)
> =C2=A0	writel(reg, rkvdec->regs + RKVDEC_REG_QOS_CTRL);
> =C2=A0}
> =C2=A0
> +void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len)
> +{
> +#ifdef CONFIG_ARM64
> +	__iowrite32_copy(dst, src, len / 4);
> +#else
> +	memcpy_toio(dst, src, len);
> +#endif
> +}
> +
> =C2=A0static void rkvdec_device_run(void *priv)
> =C2=A0{
> =C2=A0	struct rkvdec_ctx *ctx =3D priv;
> @@ -1227,7 +1236,6 @@ static void rkvdec_watchdog_func(struct work_struct=
 *work)
> =C2=A0	if (ctx) {
> =C2=A0		dev_err(rkvdec->dev, "Frame processing timed out!\n");
> =C2=A0		writel(RKVDEC_IRQ_DIS, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> -		writel(0, rkvdec->regs + RKVDEC_REG_SYSCTRL);
> =C2=A0		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
> =C2=A0	}
> =C2=A0}
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.h
> index 566e06fa2b1e..f35f6e80ea2e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
> @@ -151,6 +151,7 @@ struct rkvdec_aux_buf {
> =C2=A0
> =C2=A0void rkvdec_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_run =
*run);
> =C2=A0void rkvdec_run_postamble(struct rkvdec_ctx *ctx, struct rkvdec_run=
 *run);
> +void rkvdec_memcpy_toio(void __iomem *dst, void *src, size_t len);
> =C2=A0
> =C2=A0void rkvdec_quirks_disable_qos(struct rkvdec_ctx *ctx);
> =C2=A0

--=-zaJZC9IOjV7ePb356p0y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnUBAAKCRDZQZRRKWBy
9BHAAQCS1xiM1WLcVV/QYjY1Wr8ZVjPBtUS9F+JKP3Ps63KJJAD+J13xmU++Pq6V
hPYAtISINkGwxNcvdY6zTb3g6MWYjwk=
=1wsf
-----END PGP SIGNATURE-----

--=-zaJZC9IOjV7ePb356p0y--

