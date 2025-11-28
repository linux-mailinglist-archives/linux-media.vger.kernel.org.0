Return-Path: <linux-media+bounces-47891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEEC931CE
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 21:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 338744E3BB6
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487872DAFBA;
	Fri, 28 Nov 2025 20:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GDshfTct"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994F8265CA4;
	Fri, 28 Nov 2025 20:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764361582; cv=none; b=cj8xL5oQsBHbTBmDtixfDg9LH103ip5vEZYygWOobFB/NcvH/1KrOwn5wpjZKXudSvFTThsb6zhmoJDLZut57CMymqOdxmcmqwufJKjMbgAxxDqikK0Z8DG1p2kaDp+C2yExdYIcFWJBwn6dnVgEPQFYb2Hd5gu52qRYb2nCevM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764361582; c=relaxed/simple;
	bh=Hi4j04Aklo1CBvVuC1Ce2J2J6oYAfTYWfYxJwWPZDys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JTyl+E78gV4dbZfliZ8KDs4swDDarGB+g1IMAM4K9Speqk2aN98mkF9zUz9QdQ/kpxsBErLJK0lIiIfq3rh/zU1GTvU4Ay0XT4SiNT0J6v5hTXNl2UM1Sxz3Vl8k9Mi+CcrVfG2Rsk067xV+RnDhpRAu6rR3Sf0QZXIaMdraH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GDshfTct; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764361578;
	bh=Hi4j04Aklo1CBvVuC1Ce2J2J6oYAfTYWfYxJwWPZDys=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GDshfTctUp3IzfYsXpx4/3wr/N17y3rNNTJuBbNIqwdOgKZ7cRHw/Y5Hrne9pydvr
	 gwqxnZC0HnFerQ0aGhcWpeB3Ac09YC2BBoOl425sCRXxbGaViey+/tmfa8orKBQFZY
	 HybYnlJh9O6D7qNay06sHhQUowUfpEm9nzDGkqs5vVnikmwIGgCkxI4HiVK8H1RMu4
	 2HWk7cHhYI/BS2c83vfMzVDGjlrGGQxyVrlwb2zprcLwSOZLJsaiKBbb37Bh0V/hIB
	 6TE0Y7xlr1Mo4u+7M/DWBNW46L8I+mM8xHgAvI5ZVAascoUcFF91cJ5FvguFx+fJu/
	 lFq8pXE05ntow==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D395D17E0A28;
	Fri, 28 Nov 2025 21:26:16 +0100 (CET)
Message-ID: <1f1191bb664bf0c437deabbd9f947d127b5b4dd2.camel@collabora.com>
Subject: Re: [PATCH v2 14/14] media: mediatek: decoder: support av1 extend
 vsi
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Hans Verkuil	 <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard	 <benjamin.gaignard@collabora.com>, Nathan Hebert
 <nhebert@chromium.org>,  Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 28 Nov 2025 15:26:15 -0500
In-Reply-To: <20250815085232.30240-15-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-15-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-kbs5W3umSJp+X2PmDwWI"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-kbs5W3umSJp+X2PmDwWI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> The driver can't access tile buffer address for extend architecture,
> set tile group information in vcp and share it with kernel.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 46 ++++++++++++++++=
---
> =C2=A01 file changed, 39 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index 6070485e26c4..43541faeea87 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -25,6 +25,8 @@
> =C2=A0
> =C2=A0#define AV1_INVALID_IDX			-1
> =C2=A0
> +#define AV1_NON_EXT_VSI_SIZE		0xD50
> +
> =C2=A0#define AV1_DIV_ROUND_UP_POW2(value, n)			\
> =C2=A0({							\
> =C2=A0	typeof(n) _n=C2=A0 =3D n;				\
> @@ -641,6 +643,8 @@ struct vdec_av1_slice_fb {
> =C2=A0 * @frame:		current frame info
> =C2=A0 * @state:		status after decode done
> =C2=A0 * @cur_lst_tile_id:	tile id for large scale
> + * @tile_group:	tile group info
> + * @reserved:		reserved
> =C2=A0 */
> =C2=A0struct vdec_av1_slice_vsi {
> =C2=A0	/* lat */
> @@ -665,6 +669,8 @@ struct vdec_av1_slice_vsi {
> =C2=A0	struct vdec_av1_slice_frame frame;
> =C2=A0	struct vdec_av1_slice_state state;
> =C2=A0	u32 cur_lst_tile_id;
> +	struct vdec_av1_slice_tile_group tile_group;
> +	unsigned int reserved[4];
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -1394,13 +1400,18 @@ static int vdec_av1_slice_setup_tile_group(struct=
 vdec_av1_slice_instance *insta
> =C2=A0					=C2=A0=C2=A0 struct vdec_av1_slice_vsi *vsi)
> =C2=A0{
> =C2=A0	struct v4l2_ctrl_av1_tile_group_entry *ctrl_tge;
> -	struct vdec_av1_slice_tile_group *tile_group =3D &instance->tile_group;
> +	struct vdec_av1_slice_tile_group *tile_group;
> =C2=A0	struct vdec_av1_slice_uncompressed_header *uh =3D &vsi->frame.uh;
> =C2=A0	struct vdec_av1_slice_tile *tile =3D &uh->tile;
> =C2=A0	struct v4l2_ctrl *ctrl;
> =C2=A0	u32 tge_size;
> =C2=A0	int i;
> =C2=A0
> +	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
> +		tile_group =3D &vsi->tile_group;
> +	else
> +		tile_group =3D &instance->tile_group;
> +
> =C2=A0	ctrl =3D v4l2_ctrl_find(&instance->ctx->ctrl_hdl, V4L2_CID_STATELE=
SS_AV1_TILE_GROUP_ENTRY);
> =C2=A0	if (!ctrl)
> =C2=A0		return -EINVAL;
> @@ -1601,6 +1612,7 @@ static void vdec_av1_slice_setup_lat_buffer(struct =
vdec_av1_slice_instance *inst
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct vdec_lat_buf *lat_buf)
> =C2=A0{
> =C2=A0	struct vdec_av1_slice_work_buffer *work_buffer;
> +	u32 num_tiles;
> =C2=A0	int i;
> =C2=A0
> =C2=A0	vsi->bs.dma_addr =3D bs->dma_addr;
> @@ -1635,12 +1647,18 @@ static void vdec_av1_slice_setup_lat_buffer(struc=
t vdec_av1_slice_instance *inst
> =C2=A0
> =C2=A0	vsi->tile.buf =3D instance->tile.dma_addr;
> =C2=A0	vsi->tile.size =3D instance->tile.size;
> -	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * instance->tile_gr=
oup.num_tiles);

Can you define the magic number 64 please.

> =C2=A0
> =C2=A0	vsi->cdf_table.buf =3D instance->cdf_table.dma_addr;
> =C2=A0	vsi->cdf_table.size =3D instance->cdf_table.size;
> =C2=A0	vsi->iq_table.buf =3D instance->iq_table.dma_addr;
> =C2=A0	vsi->iq_table.size =3D instance->iq_table.size;
> +
> +	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
> +		num_tiles =3D vsi->tile_group.num_tiles;
> +	else
> +		num_tiles =3D instance->tile_group.num_tiles;
> +
> +	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * num_tiles);

I bet its shared.

> =C2=A0}
> =C2=A0
> =C2=A0static void vdec_av1_slice_setup_seg_buffer(struct vdec_av1_slice_i=
nstance *instance,
> @@ -1663,7 +1681,7 @@ static void vdec_av1_slice_setup_tile_buffer(struct=
 vdec_av1_slice_instance *ins
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct vdec_av1_slice_vsi *vsi,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_mem *bs)
> =C2=A0{
> -	struct vdec_av1_slice_tile_group *tile_group =3D &instance->tile_group;
> +	struct vdec_av1_slice_tile_group *tile_group;
> =C2=A0	struct vdec_av1_slice_uncompressed_header *uh =3D &vsi->frame.uh;
> =C2=A0	struct vdec_av1_slice_tile *tile =3D &uh->tile;
> =C2=A0	u32 tile_num, tile_row, tile_col;
> @@ -1674,6 +1692,11 @@ static void vdec_av1_slice_setup_tile_buffer(struc=
t vdec_av1_slice_instance *ins
> =C2=A0	u32 *tile_info_buf =3D instance->tile.va;
> =C2=A0	u64 pa =3D (u64)bs->dma_addr;
> =C2=A0
> +	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
> +		tile_group =3D &vsi->tile_group;
> +	else
> +		tile_group =3D &instance->tile_group;
> +

Second time this is repeated, perhaps make a small helper ?

> =C2=A0	if (uh->disable_cdf_update =3D=3D 0)
> =C2=A0		allow_update_cdf =3D 1;
> =C2=A0
> @@ -1887,7 +1910,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
> =C2=A0{
> =C2=A0	struct vdec_av1_slice_instance *instance;
> =C2=A0	struct vdec_av1_slice_init_vsi *vsi;
> -	int ret;
> +	int ret, vsi_size =3D AV1_NON_EXT_VSI_SIZE;
> =C2=A0
> =C2=A0	instance =3D kzalloc(sizeof(*instance), GFP_KERNEL);
> =C2=A0	if (!instance)
> @@ -1926,9 +1949,18 @@ static int vdec_av1_slice_init(struct mtk_vcodec_d=
ec_ctx *ctx)
> =C2=A0		goto error_vsi;
> =C2=A0	}
> =C2=A0
> -	if (vsi->vsi_size !=3D sizeof(struct vdec_av1_slice_vsi))
> -		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%zx\n",
> -			=C2=A0=C2=A0=C2=A0=C2=A0 vsi->vsi_size, sizeof(struct vdec_av1_slice_=
vsi));
> +	if (IS_VDEC_SUPPORT_EXT(ctx->dev->dec_capability)) {
> +		vsi_size =3D sizeof(struct vdec_av1_slice_vsi);
> +		vsi->iq_table_size =3D AV1_IQ_TABLE_SIZE;
> +		vsi->cdf_table_size =3D AV1_CDF_SIZE;
> +	}
> +
> +	if (vsi->vsi_size !=3D vsi_size) {
> +		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%x\n",
> +			=C2=A0=C2=A0=C2=A0=C2=A0 vsi->vsi_size, vsi_size);
> +		ret =3D -EINVAL;
> +		goto error_vsi;
> +	}
> =C2=A0
> =C2=A0	instance->irq_enabled =3D 1;
> =C2=A0	instance->inneracing_mode =3D IS_VDEC_INNER_RACING(instance->ctx->=
dev->dec_capability);

cheers,
Nicolas

--=-kbs5W3umSJp+X2PmDwWI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoFZwAKCRDZQZRRKWBy
9G9nAP9f3jKncAeZP8CtA1yeryBxkTnMsufkhbsP3nZQSWkzYgEA9ITGOcIhkE8F
oCr8bCZBMF6wfW7MvO4y3Z9TCEbNQwA=
=OuhJ
-----END PGP SIGNATURE-----

--=-kbs5W3umSJp+X2PmDwWI--

