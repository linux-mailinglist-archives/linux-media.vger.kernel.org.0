Return-Path: <linux-media+bounces-55943-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MevMwskuGmNZgEAu9opvQ
	(envelope-from <linux-media+bounces-55943-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:38:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C329C91A
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 16:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 508673025A67
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC11039F19A;
	Mon, 16 Mar 2026 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fd9R1SfU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DD62FFFBE;
	Mon, 16 Mar 2026 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675448; cv=none; b=POFJ7EngG04kzvLb4CS3sD/BNrEIF1aEcISHRUksWD+r8N0qCzW2JFlu+qI1q+eR9ouBXR9yrNHjLWXsZxQAoD3IgislOc9Pa8Iu8fxtH+ymWoeFocutwntNvx9U7DHQzF7MIQKLbAUel6BjSkb6GzBJ83kwJ+WgrVdwZozG4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675448; c=relaxed/simple;
	bh=ekNGOVT6c0aQ7vFbyagevaHjv/XCRIGITwMuPLr4p/w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EPxe5BcBd/KGhEpj5iMvng4/yB0HNtgiC81PTWdKydkyFs+dSxypj8QH/mQ59ONHtavFlreiSejQYW5sszCob3uvEBdb1XX4yhXLbMEC928/cTQ4CL7EtsVMlsq6i2SxMdlQ6zmQaxFrqKfHD7tX/Mn9RlI2DConz0Z2zFFOiOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fd9R1SfU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773675443;
	bh=ekNGOVT6c0aQ7vFbyagevaHjv/XCRIGITwMuPLr4p/w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fd9R1SfUh3zUdXUdvU9O/BjUiYAvPzhP8YQQBjs7qfLnYUtFUm32glb+x+sC8nEEG
	 ZAgZ6MMyH44rx9N28GKVDNqw9lmc2Ddv+0GLTUkOutYOxpfOXaOktuQOANZ2JFCEq/
	 qOY6lARyb0K03RF91XVcXnqDlr7JVo3l6jSUIw3bXoBvs2c06OKRSjN2hc5rVPQYGb
	 bXBsoDMiPCbpAjwwX7n3AwCaZLtsq6CWQCssn3anMUpmZ9pkQjgyDQKYRoKq3IjBOP
	 38DhgeWCMsB0H2HmKsflCEaqOBXwiTRhB52C+XXfrCFju5xRV9PZLSO5zv14JLhbDq
	 E1ERnHhN6gi+Q==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9286C17E04DC;
	Mon, 16 Mar 2026 16:37:22 +0100 (CET)
Message-ID: <b056e37f0cab9741f15612cc699720b414e05dbf.camel@collabora.com>
Subject: Re: [PATCH] media: verisilicon: Stop allocate mv and rfc buffers
 inside frame buffers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Date: Mon, 16 Mar 2026 11:37:20 -0400
In-Reply-To: <20260312173545.223021-1-benjamin.gaignard@collabora.com>
References: <20260312173545.223021-1-benjamin.gaignard@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-cNnem6/AhxNHEuTH4Ufj"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55943-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: 4A6C329C91A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-cNnem6/AhxNHEuTH4Ufj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 12 mars 2026 =C3=A0 18:35 +0100, Benjamin Gaignard a =C3=A9crit=C2=
=A0:
> Until now we reserve the space needed for motion vectors and reference
> frame compression at the end of the frame buffer.
> This method was convenient but won't fit when we will introduce secure
> data path because we will want to protect YUV data but not motion vectors
> or compression data.
>=20
> This patch disentanglement mv and rfc from frame buffers by allocating
> distinct buffers for each purpose.
>=20
> Tested on imx8mq for VP8, VP9, H264 and H265 codecs.

What did you test exactly ? When I check the RDC knobs on imx8mq, there is =
no
subdivision of the domain. So when you run in policy 2 (using the RDC and s=
et
the VPU domain as secure read/write) these buffers effectively need to be i=
nside
the secure ranges, and this is what I have running downstream at the moment=
 (not
ready for upstreaming yet). To be more flexibly, and subdivides the rules w=
ithin
an IP, policy 1 is needed, meaning you need to protect the IP register rang=
e,
and clearly we don't have that upstream since that imply passing the regist=
er
data over to the TEE. So with that justification, this change seems like a =
bit
early.

The separation seems wanted in the more general case, but your implementati=
on
does not take advantage of it. Notably, this driver allocates the same numb=
er of
reference as there is capture buffers. Both allocation pool endup too big d=
ue to
V4L2 limitations, but if you look at MTK, you can see they made the effort =
to
limit the number of auxiliary buffers. Perhaps leveraging the separation wo=
uld
make this patch a bit more acceptable to me.

regards,
Nicolas

> Tested on rk3588 for AV1.
> All fluster scores are remain the sames.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> Note: This patch depends on "media: verisilicon: Create AV1 helper librar=
y"
> version 2
>=20
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0 |=C2=A0 28 =
+-
> =C2=A0.../media/platform/verisilicon/hantro_av1.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 7 -
> =C2=A0.../media/platform/verisilicon/hantro_av1.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 -
> =C2=A0.../media/platform/verisilicon/hantro_g2.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 36 --
> =C2=A0.../platform/verisilicon/hantro_g2_hevc_dec.c |=C2=A0 65 ++--
> =C2=A0.../platform/verisilicon/hantro_g2_vp9_dec.c=C2=A0 |=C2=A0 12 +-
> =C2=A0.../media/platform/verisilicon/hantro_hevc.c=C2=A0 |=C2=A0 38 ++-
> =C2=A0.../media/platform/verisilicon/hantro_hw.h=C2=A0=C2=A0=C2=A0 | 103 =
+-----
> =C2=A0.../platform/verisilicon/hantro_postproc.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 29 +-
> =C2=A0.../media/platform/verisilicon/hantro_v4l2.c=C2=A0 | 314 ++++++++++=
++++++--
> =C2=A0.../verisilicon/rockchip_vpu981_hw_av1_dec.c=C2=A0 |=C2=A0 16 +-
> =C2=A011 files changed, 388 insertions(+), 261 deletions(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h
> b/drivers/media/platform/verisilicon/hantro.h
> index 0353de154a1e..daee5b95480c 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -31,6 +31,9 @@ struct hantro_ctx;
> =C2=A0struct hantro_codec_ops;
> =C2=A0struct hantro_postproc_ops;
> =C2=A0
> +#define MAX_MV_BUFFERS	MAX_POSTPROC_BUFFERS
> +#define MAX_RFC_BUFFERS	MAX_POSTPROC_BUFFERS
> +
> =C2=A0#define HANTRO_JPEG_ENCODER	BIT(0)
> =C2=A0#define HANTRO_ENCODERS		0x0000ffff
> =C2=A0#define HANTRO_MPEG2_DECODER	BIT(16)
> @@ -237,6 +240,9 @@ struct hantro_dev {
> =C2=A0 * @need_postproc:	Set to true if the bitstream features require to
> =C2=A0 *			use the post-processor.
> =C2=A0 *
> + * @dec_mv:		motion vectors buffers for the context.
> + * @dec_rfc:		reference frame compression buffers for the context.
> + *
> =C2=A0 * @codec_ops:		Set of operations related to codec mode.
> =C2=A0 * @postproc:		Post-processing context.
> =C2=A0 * @h264_dec:		H.264-decoding context.
> @@ -264,6 +270,9 @@ struct hantro_ctx {
> =C2=A0	int jpeg_quality;
> =C2=A0	int bit_depth;
> =C2=A0
> +	struct hantro_aux_buf dec_mv[MAX_MV_BUFFERS];
> +	struct hantro_aux_buf dec_rfc[MAX_RFC_BUFFERS];
> +
> =C2=A0	const struct hantro_codec_ops *codec_ops;
> =C2=A0	struct hantro_postproc_ctx postproc;
> =C2=A0	bool need_postproc;
> @@ -329,19 +338,29 @@ struct hantro_postproc_regs {
> =C2=A0	struct hantro_reg input_height_ext;
> =C2=A0};
> =C2=A0
> +struct hantro_hevc_decoded_buffer_info {
> +	/* Info needed when the decoded frame serves as a reference frame. */
> +	s32 poc;
> +	dma_addr_t luma_addr;
> +	dma_addr_t chroma_addr;
> +	dma_addr_t mv_addr;
> +	dma_addr_t rfc_luma_addr;
> +	dma_addr_t rfc_chroma_addr;
> +};
> +
> =C2=A0struct hantro_vp9_decoded_buffer_info {
> =C2=A0	/* Info needed when the decoded frame serves as a reference frame.=
 */
> =C2=A0	unsigned short width;
> =C2=A0	unsigned short height;
> =C2=A0	size_t chroma_offset;
> -	size_t mv_offset;
> +	dma_addr_t mv_addr;
> =C2=A0	u32 bit_depth : 4;
> =C2=A0};
> =C2=A0
> =C2=A0struct hantro_av1_decoded_buffer_info {
> =C2=A0	/* Info needed when the decoded frame serves as a reference frame.=
 */
> =C2=A0	size_t chroma_offset;
> -	size_t mv_offset;
> +	dma_addr_t mv_addr;
> =C2=A0};
> =C2=A0
> =C2=A0struct hantro_decoded_buffer {
> @@ -351,6 +370,7 @@ struct hantro_decoded_buffer {
> =C2=A0	union {
> =C2=A0		struct hantro_vp9_decoded_buffer_info vp9;
> =C2=A0		struct hantro_av1_decoded_buffer_info av1;
> +		struct hantro_hevc_decoded_buffer_info hevc;
> =C2=A0	};
> =C2=A0};
> =C2=A0
> @@ -507,4 +527,8 @@ void hantro_postproc_free(struct hantro_ctx *ctx);
> =C2=A0int hanto_postproc_enum_framesizes(struct hantro_ctx *ctx,
> =C2=A0				=C2=A0=C2=A0 struct v4l2_frmsizeenum *fsize);
> =C2=A0
> +dma_addr_t hantro_mv_get_buf_addr(struct hantro_ctx *ctx, int index);
> +dma_addr_t hantro_rfc_get_luma_buf_addr(struct hantro_ctx *ctx, int inde=
x);
> +dma_addr_t hantro_rfc_get_chroma_buf_addr(struct hantro_ctx *ctx, int in=
dex);
> +
> =C2=A0#endif /* HANTRO_H_ */
> diff --git a/drivers/media/platform/verisilicon/hantro_av1.c
> b/drivers/media/platform/verisilicon/hantro_av1.c
> index 5a51ac877c9c..3a80a7994f67 100644
> --- a/drivers/media/platform/verisilicon/hantro_av1.c
> +++ b/drivers/media/platform/verisilicon/hantro_av1.c
> @@ -222,13 +222,6 @@ size_t hantro_av1_luma_size(struct hantro_ctx *ctx)
> =C2=A0	return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.heigh=
t;
> =C2=A0}
> =C2=A0
> -size_t hantro_av1_chroma_size(struct hantro_ctx *ctx)
> -{
> -	size_t cr_offset =3D hantro_av1_luma_size(ctx);
> -
> -	return ALIGN((cr_offset * 3) / 2, 64);
> -}
> -
> =C2=A0static void hantro_av1_tiles_free(struct hantro_ctx *ctx)
> =C2=A0{
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;
> diff --git a/drivers/media/platform/verisilicon/hantro_av1.h
> b/drivers/media/platform/verisilicon/hantro_av1.h
> index 4e2122b95cdd..330f7938d097 100644
> --- a/drivers/media/platform/verisilicon/hantro_av1.h
> +++ b/drivers/media/platform/verisilicon/hantro_av1.h
> @@ -41,7 +41,6 @@ int hantro_av1_get_order_hint(struct hantro_ctx *ctx, i=
nt
> ref);
> =C2=A0int hantro_av1_frame_ref(struct hantro_ctx *ctx, u64 timestamp);
> =C2=A0void hantro_av1_clean_refs(struct hantro_ctx *ctx);
> =C2=A0size_t hantro_av1_luma_size(struct hantro_ctx *ctx);
> -size_t hantro_av1_chroma_size(struct hantro_ctx *ctx);
> =C2=A0void hantro_av1_exit(struct hantro_ctx *ctx);
> =C2=A0int hantro_av1_init(struct hantro_ctx *ctx);
> =C2=A0int hantro_av1_prepare_run(struct hantro_ctx *ctx);
> diff --git a/drivers/media/platform/verisilicon/hantro_g2.c
> b/drivers/media/platform/verisilicon/hantro_g2.c
> index 318673b66da8..4ae7df53dcb1 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2.c
> @@ -99,39 +99,3 @@ size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx)
> =C2=A0{
> =C2=A0	return ctx->ref_fmt.plane_fmt[0].bytesperline *	ctx-
> >ref_fmt.height;
> =C2=A0}
> -
> -size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx)
> -{
> -	size_t cr_offset =3D hantro_g2_chroma_offset(ctx);
> -
> -	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
> -}
> -
> -static size_t hantro_g2_mv_size(struct hantro_ctx *ctx)
> -{
> -	const struct hantro_hevc_dec_ctrls *ctrls =3D &ctx->hevc_dec.ctrls;
> -	const struct v4l2_ctrl_hevc_sps *sps =3D ctrls->sps;
> -	unsigned int pic_width_in_ctbs, pic_height_in_ctbs;
> -	unsigned int max_log2_ctb_size;
> -
> -	max_log2_ctb_size =3D sps->log2_min_luma_coding_block_size_minus3 + 3 +
> -			=C2=A0=C2=A0=C2=A0 sps->log2_diff_max_min_luma_coding_block_size;
> -	pic_width_in_ctbs =3D (sps->pic_width_in_luma_samples +
> -			=C2=A0=C2=A0=C2=A0 (1 << max_log2_ctb_size) - 1) >>
> max_log2_ctb_size;
> -	pic_height_in_ctbs =3D (sps->pic_height_in_luma_samples + (1 <<
> max_log2_ctb_size) - 1)
> -			=C2=A0=C2=A0=C2=A0=C2=A0 >> max_log2_ctb_size;
> -
> -	return pic_width_in_ctbs * pic_height_in_ctbs * (1 << (2 *
> (max_log2_ctb_size - 4))) * 16;
> -}
> -
> -size_t hantro_g2_luma_compress_offset(struct hantro_ctx *ctx)
> -{
> -	return hantro_g2_motion_vectors_offset(ctx) +
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hantro_g2_mv_size(ctx);
> -}
> -
> -size_t hantro_g2_chroma_compress_offset(struct hantro_ctx *ctx)
> -{
> -	return hantro_g2_luma_compress_offset(ctx) +
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hantro_hevc_luma_compressed_size(c=
tx->dst_fmt.width, ctx-
> >dst_fmt.height);
> -}
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> index e8c2e83379de..5240cf9b5f58 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> @@ -377,15 +377,9 @@ static int set_ref(struct hantro_ctx *ctx)
> =C2=A0	const struct v4l2_ctrl_hevc_pps *pps =3D ctrls->pps;
> =C2=A0	const struct v4l2_ctrl_hevc_decode_params *decode_params =3D ctrls=
-
> >decode_params;
> =C2=A0	const struct v4l2_hevc_dpb_entry *dpb =3D decode_params->dpb;
> -	dma_addr_t luma_addr, chroma_addr, mv_addr =3D 0;
> -	dma_addr_t compress_luma_addr, compress_chroma_addr =3D 0;
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;
> =C2=A0	struct vb2_v4l2_buffer *vb2_dst;
> -	struct hantro_decoded_buffer *dst;
> -	size_t cr_offset =3D hantro_g2_chroma_offset(ctx);
> -	size_t mv_offset =3D hantro_g2_motion_vectors_offset(ctx);
> -	size_t compress_luma_offset =3D hantro_g2_luma_compress_offset(ctx);
> -	size_t compress_chroma_offset =3D
> hantro_g2_chroma_compress_offset(ctx);
> +	struct hantro_decoded_buffer *ref;
> =C2=A0	u32 max_ref_frames;
> =C2=A0	u16 dpb_longterm_e;
> =C2=A0	static const struct hantro_reg cur_poc[] =3D {
> @@ -453,50 +447,37 @@ static int set_ref(struct hantro_ctx *ctx)
> =C2=A0	dpb_longterm_e =3D 0;
> =C2=A0	for (i =3D 0; i < decode_params->num_active_dpb_entries &&
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 i < (V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1); =
i++) {
> -		luma_addr =3D hantro_hevc_get_ref_buf(ctx,
> dpb[i].pic_order_cnt_val);
> -		if (!luma_addr)
> +		vb2_dst =3D hantro_hevc_get_ref_buf(ctx,
> dpb[i].pic_order_cnt_val);
> +		if (!vb2_dst)
> =C2=A0			return -ENOMEM;
> =C2=A0
> -		chroma_addr =3D luma_addr + cr_offset;
> -		mv_addr =3D luma_addr + mv_offset;
> -		compress_luma_addr =3D luma_addr + compress_luma_offset;
> -		compress_chroma_addr =3D luma_addr + compress_chroma_offset;
> -
> =C2=A0		if (dpb[i].flags & V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
> =C2=A0			dpb_longterm_e |=3D BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX -
> 1 - i);
> =C2=A0
> -		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
> -		hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), chroma_addr);
> -		hantro_write_addr(vpu, G2_REF_MV_ADDR(i), mv_addr);
> -		hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i),
> compress_luma_addr);
> -		hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i),
> compress_chroma_addr);
> +		ref =3D vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
> +		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), ref-
> >hevc.luma_addr);
> +		hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), ref-
> >hevc.chroma_addr);
> +		hantro_write_addr(vpu, G2_REF_MV_ADDR(i), ref->hevc.mv_addr);
> +		hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), ref-
> >hevc.rfc_luma_addr);
> +		hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i), ref-
> >hevc.rfc_chroma_addr);
> =C2=A0	}
> =C2=A0
> -	vb2_dst =3D hantro_get_dst_buf(ctx);
> -	dst =3D vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
> -	luma_addr =3D hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
> -	if (!luma_addr)
> -		return -ENOMEM;
> -
> -	if (hantro_hevc_add_ref_buf(ctx, decode_params->pic_order_cnt_val,
> luma_addr))
> +	vb2_dst =3D hantro_hevc_add_ref_buf(ctx, decode_params-
> >pic_order_cnt_val);
> +	if (!vb2_dst)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	chroma_addr =3D luma_addr + cr_offset;
> -	mv_addr =3D luma_addr + mv_offset;
> -	compress_luma_addr =3D luma_addr + compress_luma_offset;
> -	compress_chroma_addr =3D luma_addr + compress_chroma_offset;
> -
> -	hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
> -	hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), chroma_addr);
> -	hantro_write_addr(vpu, G2_REF_MV_ADDR(i), mv_addr);
> -	hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), compress_luma_addr);
> -	hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i++),
> compress_chroma_addr);
> -
> -	hantro_write_addr(vpu, G2_OUT_LUMA_ADDR, luma_addr);
> -	hantro_write_addr(vpu, G2_OUT_CHROMA_ADDR, chroma_addr);
> -	hantro_write_addr(vpu, G2_OUT_MV_ADDR, mv_addr);
> -	hantro_write_addr(vpu, G2_OUT_COMP_LUMA_ADDR, compress_luma_addr);
> -	hantro_write_addr(vpu, G2_OUT_COMP_CHROMA_ADDR,
> compress_chroma_addr);
> +	ref =3D vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
> +	hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), ref->hevc.luma_addr);
> +	hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), ref->hevc.chroma_addr);
> +	hantro_write_addr(vpu, G2_REF_MV_ADDR(i), ref->hevc.mv_addr);
> +	hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), ref-
> >hevc.rfc_luma_addr);
> +	hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i++), ref-
> >hevc.rfc_chroma_addr);
> +
> +	hantro_write_addr(vpu, G2_OUT_LUMA_ADDR, ref->hevc.luma_addr);
> +	hantro_write_addr(vpu, G2_OUT_CHROMA_ADDR, ref->hevc.chroma_addr);
> +	hantro_write_addr(vpu, G2_OUT_MV_ADDR, ref->hevc.mv_addr);
> +	hantro_write_addr(vpu, G2_OUT_COMP_LUMA_ADDR, ref-
> >hevc.rfc_luma_addr);
> +	hantro_write_addr(vpu, G2_OUT_COMP_CHROMA_ADDR, ref-
> >hevc.rfc_chroma_addr);
> =C2=A0
> =C2=A0	for (; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
> =C2=A0		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), 0);
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> index 56c79e339030..1e96d0fce72a 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
> @@ -129,7 +129,7 @@ static void config_output(struct hantro_ctx *ctx,
> =C2=A0			=C2=A0 struct hantro_decoded_buffer *dst,
> =C2=A0			=C2=A0 const struct v4l2_ctrl_vp9_frame *dec_params)
> =C2=A0{
> -	dma_addr_t luma_addr, chroma_addr, mv_addr;
> +	dma_addr_t luma_addr, chroma_addr;
> =C2=A0
> =C2=A0	hantro_reg_write(ctx->dev, &g2_out_dis, 0);
> =C2=A0	if (!ctx->dev->variant->legacy_regs)
> @@ -142,9 +142,8 @@ static void config_output(struct hantro_ctx *ctx,
> =C2=A0	hantro_write_addr(ctx->dev, G2_OUT_CHROMA_ADDR, chroma_addr);
> =C2=A0	dst->vp9.chroma_offset =3D hantro_g2_chroma_offset(ctx);
> =C2=A0
> -	mv_addr =3D luma_addr + hantro_g2_motion_vectors_offset(ctx);
> -	hantro_write_addr(ctx->dev, G2_OUT_MV_ADDR, mv_addr);
> -	dst->vp9.mv_offset =3D hantro_g2_motion_vectors_offset(ctx);
> +	dst->vp9.mv_addr =3D hantro_mv_get_buf_addr(ctx, dst-
> >base.vb.vb2_buf.index);
> +	hantro_write_addr(ctx->dev, G2_OUT_MV_ADDR, dst->vp9.mv_addr);
> =C2=A0}
> =C2=A0
> =C2=A0struct hantro_vp9_ref_reg {
> @@ -215,15 +214,12 @@ static void config_ref_registers(struct hantro_ctx =
*ctx,
> =C2=A0			.c_base =3D G2_REF_CHROMA_ADDR(5),
> =C2=A0		},
> =C2=A0	};
> -	dma_addr_t mv_addr;
> =C2=A0
> =C2=A0	config_ref(ctx, dst, &ref_regs[0], dec_params, dec_params-
> >last_frame_ts);
> =C2=A0	config_ref(ctx, dst, &ref_regs[1], dec_params, dec_params-
> >golden_frame_ts);
> =C2=A0	config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params-
> >alt_frame_ts);
> =C2=A0
> -	mv_addr =3D hantro_get_dec_buf_addr(ctx, &mv_ref->base.vb.vb2_buf) +
> -		=C2=A0 mv_ref->vp9.mv_offset;
> -	hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_addr);
> +	hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_ref->vp9.mv_addr);
> =C2=A0
> =C2=A0	hantro_reg_write(ctx->dev, &vp9_last_sign_bias,
> =C2=A0			 dec_params->ref_frame_sign_bias &
> V4L2_VP9_SIGN_BIAS_LAST ? 1 : 0);
> diff --git a/drivers/media/platform/verisilicon/hantro_hevc.c
> b/drivers/media/platform/verisilicon/hantro_hevc.c
> index 83cd12b0ddd6..7ea1dc57a639 100644
> --- a/drivers/media/platform/verisilicon/hantro_hevc.c
> +++ b/drivers/media/platform/verisilicon/hantro_hevc.c
> @@ -37,39 +37,57 @@ void hantro_hevc_ref_init(struct hantro_ctx *ctx)
> =C2=A0	hevc_dec->ref_bufs_used =3D 0;
> =C2=A0}
> =C2=A0
> -dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
> -				=C2=A0=C2=A0 s32 poc)
> +struct vb2_v4l2_buffer *hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, =
s32
> poc)
> =C2=A0{
> =C2=A0	struct hantro_hevc_dec_hw_ctx *hevc_dec =3D &ctx->hevc_dec;
> +	struct hantro_decoded_buffer *ref;
> =C2=A0	int i;
> =C2=A0
> =C2=A0	/* Find the reference buffer in already known ones */
> =C2=A0	for (i =3D 0;=C2=A0 i < NUM_REF_PICTURES; i++) {
> -		if (hevc_dec->ref_bufs_poc[i] =3D=3D poc) {
> +		ref =3D vb2_to_hantro_decoded_buf(&hevc_dec->vb2_ref[i]-
> >vb2_buf);
> +		if (ref->hevc.poc =3D=3D poc) {
> =C2=A0			hevc_dec->ref_bufs_used |=3D 1 << i;
> -			return hevc_dec->ref_bufs[i].dma;
> +			return hevc_dec->vb2_ref[i];
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	return 0;
> +	return NULL;
> =C2=A0}
> =C2=A0
> -int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t =
addr)
> +struct vb2_v4l2_buffer *hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, =
int
> poc)
> =C2=A0{
> =C2=A0	struct hantro_hevc_dec_hw_ctx *hevc_dec =3D &ctx->hevc_dec;
> +	struct hantro_decoded_buffer *dst;
> =C2=A0	int i;
> =C2=A0
> =C2=A0	/* Add a new reference buffer */
> =C2=A0	for (i =3D 0; i < NUM_REF_PICTURES; i++) {
> =C2=A0		if (!(hevc_dec->ref_bufs_used & 1 << i)) {
> =C2=A0			hevc_dec->ref_bufs_used |=3D 1 << i;
> -			hevc_dec->ref_bufs_poc[i] =3D poc;
> -			hevc_dec->ref_bufs[i].dma =3D addr;
> -			return 0;
> +			hevc_dec->vb2_ref[i] =3D hantro_get_dst_buf(ctx);
> +			dst =3D vb2_to_hantro_decoded_buf(&hevc_dec-
> >vb2_ref[i]->vb2_buf);
> +			dst->hevc.poc =3D poc;
> +			dst->hevc.luma_addr =3D hantro_get_dec_buf_addr(ctx,
> &dst->base.vb.vb2_buf);
> +			dst->hevc.chroma_addr =3D dst->hevc.luma_addr +
> hantro_g2_chroma_offset(ctx);
> +			dst->hevc.mv_addr =3D hantro_mv_get_buf_addr(ctx, dst-
> >base.vb.vb2_buf.index);
> +			if (ctx->hevc_dec.use_compression) {
> +				dst->hevc.rfc_luma_addr =3D
> +					hantro_rfc_get_luma_buf_addr(ctx,
> +								=C2=A0=C2=A0=C2=A0=C2=A0 dst-
> >base.vb.vb2_buf.index);
> +				dst->hevc.rfc_chroma_addr =3D
> +					hantro_rfc_get_chroma_buf_addr(ctx,
> +								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dst-
> >base.vb.vb2_buf.index);
> +			} else {
> +				dst->hevc.rfc_luma_addr =3D 0;
> +				dst->hevc.rfc_chroma_addr =3D 0;
> +			}
> +
> +			return hevc_dec->vb2_ref[i];
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	return -EINVAL;
> +	return NULL;
> =C2=A0}
> =C2=A0
> =C2=A0static int tile_buffer_reallocate(struct hantro_ctx *ctx)
> diff --git a/drivers/media/platform/verisilicon/hantro_hw.h
> b/drivers/media/platform/verisilicon/hantro_hw.h
> index f0e4bca4b2b2..74e20fc82630 100644
> --- a/drivers/media/platform/verisilicon/hantro_hw.h
> +++ b/drivers/media/platform/verisilicon/hantro_hw.h
> @@ -147,8 +147,8 @@ struct hantro_hevc_dec_ctrls {
> =C2=A0 * @tile_bsd:		Tile BSD control buffer
> =C2=A0 * @ref_bufs:		Internal reference buffers
> =C2=A0 * @scaling_lists:	Scaling lists buffer
> - * @ref_bufs_poc:	Internal reference buffers picture order count
> =C2=A0 * @ref_bufs_used:	Bitfield of used reference buffers
> + * @vb2_ref:		Reference buffers
> =C2=A0 * @ctrls:		V4L2 controls attached to a run
> =C2=A0 * @num_tile_cols_allocated: number of allocated tiles
> =C2=A0 * @use_compression:	use reference buffer compression
> @@ -158,10 +158,9 @@ struct hantro_hevc_dec_hw_ctx {
> =C2=A0	struct hantro_aux_buf tile_filter;
> =C2=A0	struct hantro_aux_buf tile_sao;
> =C2=A0	struct hantro_aux_buf tile_bsd;
> -	struct hantro_aux_buf ref_bufs[NUM_REF_PICTURES];
> =C2=A0	struct hantro_aux_buf scaling_lists;
> -	s32 ref_bufs_poc[NUM_REF_PICTURES];
> =C2=A0	u32 ref_bufs_used;
> +	struct vb2_v4l2_buffer *vb2_ref[NUM_REF_PICTURES];
> =C2=A0	struct hantro_hevc_dec_ctrls ctrls;
> =C2=A0	unsigned int num_tile_cols_allocated;
> =C2=A0	bool use_compression;
> @@ -456,8 +455,9 @@ void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
> =C2=A0int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
> =C2=A0int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
> =C2=A0void hantro_hevc_ref_init(struct hantro_ctx *ctx);
> -dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, s32 poc);
> -int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t
> addr);
> +struct vb2_v4l2_buffer *hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, =
s32
> poc);
> +struct vb2_v4l2_buffer *hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, =
int
> poc);
> +int hantro_hevc_get_ref_buf_index(struct hantro_ctx *ctx, s32 poc);
> =C2=A0
> =C2=A0int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx);
> =C2=A0void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx);
> @@ -469,100 +469,7 @@ static inline unsigned short hantro_vp9_num_sbs(uns=
igned
> short dimension)
> =C2=A0	return (dimension + 63) / 64;
> =C2=A0}
> =C2=A0
> -static inline size_t
> -hantro_vp9_mv_size(unsigned int width, unsigned int height)
> -{
> -	int num_ctbs;
> -
> -	/*
> -	 * There can be up to (CTBs x 64) number of blocks,
> -	 * and the motion vector for each block needs 16 bytes.
> -	 */
> -	num_ctbs =3D hantro_vp9_num_sbs(width) * hantro_vp9_num_sbs(height);
> -	return (num_ctbs * 64) * 16;
> -}
> -
> -static inline size_t
> -hantro_h264_mv_size(unsigned int width, unsigned int height)
> -{
> -	/*
> -	 * A decoded 8-bit 4:2:0 NV12 frame may need memory for up to
> -	 * 448 bytes per macroblock with additional 32 bytes on
> -	 * multi-core variants.
> -	 *
> -	 * The H264 decoder needs extra space on the output buffers
> -	 * to store motion vectors. This is needed for reference
> -	 * frames and only if the format is non-post-processed NV12.
> -	 *
> -	 * Memory layout is as follow:
> -	 *
> -	 * +---------------------------+
> -	 * | Y-plane=C2=A0=C2=A0 256 bytes x MBs |
> -	 * +---------------------------+
> -	 * | UV-plane=C2=A0 128 bytes x MBs |
> -	 * +---------------------------+
> -	 * | MV buffer=C2=A0 64 bytes x MBs |
> -	 * +---------------------------+
> -	 * | MC sync=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32 b=
ytes |
> -	 * +---------------------------+
> -	 */
> -	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
> -}
> -
> -static inline size_t
> -hantro_hevc_mv_size(unsigned int width, unsigned int height)
> -{
> -	/*
> -	 * A CTB can be 64x64, 32x32 or 16x16.
> -	 * Allocated memory for the "worse" case: 16x16
> -	 */
> -	return width * height / 16;
> -}
> -
> -static inline size_t
> -hantro_hevc_luma_compressed_size(unsigned int width, unsigned int height=
)
> -{
> -	u32 pic_width_in_cbsy =3D
> -		round_up((width + CBS_LUMA - 1) / CBS_LUMA, CBS_SIZE);
> -	u32 pic_height_in_cbsy =3D (height + CBS_LUMA - 1) / CBS_LUMA;
> -
> -	return round_up(pic_width_in_cbsy * pic_height_in_cbsy, CBS_SIZE);
> -}
> -
> -static inline size_t
> -hantro_hevc_chroma_compressed_size(unsigned int width, unsigned int heig=
ht)
> -{
> -	u32 pic_width_in_cbsc =3D
> -		round_up((width + CBS_CHROMA_W - 1) / CBS_CHROMA_W,
> CBS_SIZE);
> -	u32 pic_height_in_cbsc =3D (height / 2 + CBS_CHROMA_H - 1) /
> CBS_CHROMA_H;
> -
> -	return round_up(pic_width_in_cbsc * pic_height_in_cbsc, CBS_SIZE);
> -}
> -
> -static inline size_t
> -hantro_hevc_compressed_size(unsigned int width, unsigned int height)
> -{
> -	return hantro_hevc_luma_compressed_size(width, height) +
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hantro_hevc_chroma_compressed_size=
(width, height);
> -}
> -
> -static inline unsigned short hantro_av1_num_sbs(unsigned short dimension=
)
> -{
> -	return DIV_ROUND_UP(dimension, 64);
> -}
> -
> -static inline size_t
> -hantro_av1_mv_size(unsigned int width, unsigned int height)
> -{
> -	size_t num_sbs =3D hantro_av1_num_sbs(width) *
> hantro_av1_num_sbs(height);
> -
> -	return ALIGN(num_sbs * 384, 16) * 2 + 512;
> -}
> -
> =C2=A0size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx);
> -size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx);
> -size_t hantro_g2_luma_compress_offset(struct hantro_ctx *ctx);
> -size_t hantro_g2_chroma_compress_offset(struct hantro_ctx *ctx);
> =C2=A0
> =C2=A0int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
> =C2=A0int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
> diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c
> b/drivers/media/platform/verisilicon/hantro_postproc.c
> index e94d1ba5ef10..2409353c16e4 100644
> --- a/drivers/media/platform/verisilicon/hantro_postproc.c
> +++ b/drivers/media/platform/verisilicon/hantro_postproc.c
> @@ -196,36 +196,11 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> -static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
> -{
> -	unsigned int buf_size;
> -
> -	buf_size =3D ctx->ref_fmt.plane_fmt[0].sizeimage;
> -	if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE)
> -		buf_size +=3D hantro_h264_mv_size(ctx->ref_fmt.width,
> -						ctx->ref_fmt.height);
> -	else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_VP9_FRAME)
> -		buf_size +=3D hantro_vp9_mv_size(ctx->ref_fmt.width,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->ref_fmt.height);
> -	else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_HEVC_SLICE) {
> -		buf_size +=3D hantro_hevc_mv_size(ctx->ref_fmt.width,
> -						ctx->ref_fmt.height);
> -		if (ctx->hevc_dec.use_compression)
> -			buf_size +=3D hantro_hevc_compressed_size(ctx-
> >ref_fmt.width,
> -								ctx-
> >ref_fmt.height);
> -	}
> -	else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_AV1_FRAME)
> -		buf_size +=3D hantro_av1_mv_size(ctx->ref_fmt.width,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->ref_fmt.height);
> -
> -	return buf_size;
> -}
> -
> =C2=A0static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
> =C2=A0{
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;
> =C2=A0	struct hantro_aux_buf *priv =3D &ctx->postproc.dec_q[index];
> -	unsigned int buf_size =3D hantro_postproc_buffer_size(ctx);
> +	unsigned int buf_size =3D ctx->ref_fmt.plane_fmt[0].sizeimage;
> =C2=A0
> =C2=A0	if (!buf_size)
> =C2=A0		return -EINVAL;
> @@ -267,7 +242,7 @@ dma_addr_t
> =C2=A0hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index)
> =C2=A0{
> =C2=A0	struct hantro_aux_buf *priv =3D &ctx->postproc.dec_q[index];
> -	unsigned int buf_size =3D hantro_postproc_buffer_size(ctx);
> +	unsigned int buf_size =3D ctx->ref_fmt.plane_fmt[0].sizeimage;
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;
> =C2=A0	int ret;
> =C2=A0
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index fcf3bd9bcda2..6a876142c224 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -36,6 +36,9 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
> =C2=A0static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_pix_format_mplane *pi=
x_mp);
> =C2=A0
> +static void hantro_mv_free(struct hantro_ctx *ctx);
> +static void hantro_rfc_free(struct hantro_ctx *ctx);
> +
> =C2=A0static const struct hantro_fmt *
> =C2=A0hantro_get_formats(const struct hantro_ctx *ctx, unsigned int *num_=
fmts, bool
> need_postproc)
> =C2=A0{
> @@ -362,26 +365,6 @@ static int hantro_try_fmt(const struct hantro_ctx *c=
tx,
> =C2=A0		/* Fill remaining fields */
> =C2=A0		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
> =C2=A0				=C2=A0=C2=A0=C2=A0 pix_mp->height);
> -		if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_H264_SLICE &&
> -		=C2=A0=C2=A0=C2=A0 !hantro_needs_postproc(ctx, fmt))
> -			pix_mp->plane_fmt[0].sizeimage +=3D
> -				hantro_h264_mv_size(pix_mp->width,
> -						=C2=A0=C2=A0=C2=A0 pix_mp->height);
> -		else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_VP9_FRAME
> &&
> -			 !hantro_needs_postproc(ctx, fmt))
> -			pix_mp->plane_fmt[0].sizeimage +=3D
> -				hantro_vp9_mv_size(pix_mp->width,
> -						=C2=A0=C2=A0 pix_mp->height);
> -		else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_HEVC_SLICE
> &&
> -			 !hantro_needs_postproc(ctx, fmt))
> -			pix_mp->plane_fmt[0].sizeimage +=3D
> -				hantro_hevc_mv_size(pix_mp->width,
> -						=C2=A0=C2=A0=C2=A0 pix_mp->height);
> -		else if (ctx->vpu_src_fmt->fourcc =3D=3D V4L2_PIX_FMT_AV1_FRAME
> &&
> -			 !hantro_needs_postproc(ctx, fmt))
> -			pix_mp->plane_fmt[0].sizeimage +=3D
> -				hantro_av1_mv_size(pix_mp->width,
> -						=C2=A0=C2=A0 pix_mp->height);
> =C2=A0	} else if (!pix_mp->plane_fmt[0].sizeimage) {
> =C2=A0		/*
> =C2=A0		 * For coded formats the application can specify
> @@ -999,6 +982,9 @@ static void hantro_stop_streaming(struct vb2_queue *q=
)
> =C2=A0	if (V4L2_TYPE_IS_OUTPUT(q->type) &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
> =C2=A0		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
> +
> +	hantro_mv_free(ctx);
> +	hantro_rfc_free(ctx);
> =C2=A0}
> =C2=A0
> =C2=A0static void hantro_buf_request_complete(struct vb2_buffer *vb)
> @@ -1025,3 +1011,291 @@ const struct vb2_ops hantro_queue_ops =3D {
> =C2=A0	.start_streaming =3D hantro_start_streaming,
> =C2=A0	.stop_streaming =3D hantro_stop_streaming,
> =C2=A0};
> +
> +static size_t
> +hantro_vp9_mv_size(unsigned int width, unsigned int height)
> +{
> +	int num_ctbs;
> +
> +	/*
> +	 * There can be up to (CTBs x 64) number of blocks,
> +	 * and the motion vector for each block needs 16 bytes.
> +	 */
> +	num_ctbs =3D hantro_vp9_num_sbs(width) * hantro_vp9_num_sbs(height);
> +	return (num_ctbs * 64) * 16;
> +}
> +
> +static size_t
> +hantro_h264_mv_size(unsigned int width, unsigned int height)
> +{
> +	/*
> +	 * A decoded 8-bit 4:2:0 NV12 frame may need memory for up to
> +	 * 448 bytes per macroblock with additional 32 bytes on
> +	 * multi-core variants.
> +	 *
> +	 * The H264 decoder needs extra space on the output buffers
> +	 * to store motion vectors. This is needed for reference
> +	 * frames and only if the format is non-post-processed NV12.
> +	 *
> +	 * Memory layout is as follow:
> +	 *
> +	 * +---------------------------+
> +	 * | Y-plane=C2=A0=C2=A0 256 bytes x MBs |
> +	 * +---------------------------+
> +	 * | UV-plane=C2=A0 128 bytes x MBs |
> +	 * +---------------------------+
> +	 * | MV buffer=C2=A0 64 bytes x MBs |
> +	 * +---------------------------+
> +	 * | MC sync=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32 b=
ytes |
> +	 * +---------------------------+
> +	 */
> +	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
> +}
> +
> +static size_t
> +hantro_hevc_mv_size(unsigned int width, unsigned int height, int depth)
> +{
> +	/*
> +	 * A CTB can be 64x64, 32x32 or 16x16.
> +	 * Allocated memory for the "worse" case: 16x16
> +	 */
> +	return DIV_ROUND_UP(width * height * depth / 8, 16);
> +}
> +
> +static inline unsigned short hantro_av1_num_sbs(unsigned short dimension=
)
> +{
> +	return DIV_ROUND_UP(dimension, 64);
> +}
> +
> +static size_t
> +hantro_av1_mv_size(unsigned int width, unsigned int height)
> +{
> +	size_t num_sbs =3D hantro_av1_num_sbs(width) *
> hantro_av1_num_sbs(height);
> +
> +	return ALIGN(num_sbs * 384, 16) * 2 + 512;
> +}
> +
> +static void hantro_mv_free(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	int i;
> +
> +	for (i =3D 0; i < MAX_MV_BUFFERS; i++) {
> +		struct hantro_aux_buf *mv =3D &ctx->dec_mv[i];
> +
> +		if (!mv->cpu)
> +			continue;
> +
> +		dma_free_attrs(vpu->dev, mv->size, mv->cpu,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv->dma, mv->attrs);
> +		mv->cpu =3D NULL;
> +	}
> +}
> +
> +static unsigned int hantro_mv_buffer_size(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	int fourcc =3D ctx->vpu_src_fmt->fourcc;
> +	int width =3D ctx->ref_fmt.width;
> +	int height =3D ctx->ref_fmt.height;
> +
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_H264_SLICE:
> +		return hantro_h264_mv_size(width, height);
> +	case V4L2_PIX_FMT_VP9_FRAME:
> +		return hantro_vp9_mv_size(width, height);
> +	case V4L2_PIX_FMT_HEVC_SLICE:
> +		return hantro_hevc_mv_size(width, height, ctx->bit_depth);
> +	case V4L2_PIX_FMT_AV1_FRAME:
> +		return hantro_av1_mv_size(width, height);
> +	}
> +
> +	/* Should not happen */
> +	dev_warn(vpu->dev, "Invalid motion vectors size\n");
> +	return 0;
> +}
> +
> +static int hantro_mv_buffer_alloc(struct hantro_ctx *ctx, int index)
> +{
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	struct hantro_aux_buf *mv =3D &ctx->dec_mv[index];
> +	unsigned int buf_size =3D hantro_mv_buffer_size(ctx);
> +
> +	if (!buf_size)
> +		return -EINVAL;
> +
> +	/*
> +	 * Motion vectors buffers are only read and write by the
> +	 * hardware so no mapping is needed.
> +	 */
> +	mv->attrs =3D DMA_ATTR_NO_KERNEL_MAPPING;
> +	mv->cpu =3D dma_alloc_attrs(vpu->dev, buf_size, &mv->dma,
> +				=C2=A0 GFP_KERNEL, mv->attrs);
> +	if (!mv->cpu)
> +		return -ENOMEM;
> +	mv->size =3D buf_size;
> +
> +	return 0;
> +}
> +
> +dma_addr_t
> +hantro_mv_get_buf_addr(struct hantro_ctx *ctx, int index)
> +{
> +	struct hantro_aux_buf *mv =3D &ctx->dec_mv[index];
> +	unsigned int buf_size =3D hantro_mv_buffer_size(ctx);
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	int ret;
> +
> +	if (mv->size < buf_size && mv->cpu) {
> +		/* buffer is too small, release it */
> +		dma_free_attrs(vpu->dev, mv->size, mv->cpu,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv->dma, mv->attrs);
> +		mv->cpu =3D NULL;
> +	}
> +
> +	if (!mv->cpu) {
> +		/* buffer not already allocated, try getting a new one */
> +		ret =3D hantro_mv_buffer_alloc(ctx, index);
> +		if (ret)
> +			return 0;
> +	}
> +
> +	if (!mv->cpu)
> +		return 0;
> +
> +	return mv->dma;
> +}
> +
> +static inline size_t
> +hantro_hevc_luma_compressed_size(unsigned int width, unsigned int height=
)
> +{
> +	u32 pic_width_in_cbsy =3D
> +		round_up((width + CBS_LUMA - 1) / CBS_LUMA, CBS_SIZE);
> +	u32 pic_height_in_cbsy =3D (height + CBS_LUMA - 1) / CBS_LUMA;
> +
> +	return round_up(pic_width_in_cbsy * pic_height_in_cbsy, CBS_SIZE);
> +}
> +
> +static inline size_t
> +hantro_hevc_chroma_compressed_size(unsigned int width, unsigned int heig=
ht)
> +{
> +	u32 pic_width_in_cbsc =3D
> +		round_up((width + CBS_CHROMA_W - 1) / CBS_CHROMA_W,
> CBS_SIZE);
> +	u32 pic_height_in_cbsc =3D (height / 2 + CBS_CHROMA_H - 1) /
> CBS_CHROMA_H;
> +
> +	return round_up(pic_width_in_cbsc * pic_height_in_cbsc, CBS_SIZE);
> +}
> +
> +static inline size_t
> +hantro_hevc_compressed_size(unsigned int width, unsigned int height)
> +{
> +	return hantro_hevc_luma_compressed_size(width, height) +
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hantro_hevc_chroma_compressed_size=
(width, height);
> +}
> +
> +static void hantro_rfc_free(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	int i;
> +
> +	for (i =3D 0; i < MAX_MV_BUFFERS; i++) {
> +		struct hantro_aux_buf *rfc =3D &ctx->dec_rfc[i];
> +
> +		if (!rfc->cpu)
> +			continue;
> +
> +		dma_free_attrs(vpu->dev, rfc->size, rfc->cpu,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rfc->dma, rfc->attrs);
> +		rfc->cpu =3D NULL;
> +	}
> +}
> +
> +static unsigned int hantro_rfc_buffer_size(struct hantro_ctx *ctx)
> +{
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	int fourcc =3D ctx->vpu_src_fmt->fourcc;
> +	int width =3D ctx->ref_fmt.width;
> +	int height =3D ctx->ref_fmt.height;
> +
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_HEVC_SLICE:
> +		return hantro_hevc_compressed_size(width, height);
> +	}
> +
> +	/* Should not happen */
> +	dev_warn(vpu->dev, "Invalid rfc size\n");
> +	return 0;
> +}
> +
> +static int hantro_rfc_buffer_alloc(struct hantro_ctx *ctx, int index)
> +{
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	struct hantro_aux_buf *rfc =3D &ctx->dec_rfc[index];
> +	unsigned int buf_size =3D hantro_rfc_buffer_size(ctx);
> +
> +	if (!buf_size)
> +		return -EINVAL;
> +
> +	/*
> +	 * RFC buffers are only read and write by the
> +	 * hardware so no mapping is needed.
> +	 */
> +	rfc->attrs =3D DMA_ATTR_NO_KERNEL_MAPPING;
> +	rfc->cpu =3D dma_alloc_attrs(vpu->dev, buf_size, &rfc->dma,
> +				=C2=A0=C2=A0 GFP_KERNEL, rfc->attrs);
> +	if (!rfc->cpu)
> +		return -ENOMEM;
> +	rfc->size =3D buf_size;
> +
> +	return 0;
> +}
> +
> +dma_addr_t
> +hantro_rfc_get_luma_buf_addr(struct hantro_ctx *ctx, int index)
> +{
> +	struct hantro_aux_buf *rfc =3D &ctx->dec_rfc[index];
> +	unsigned int buf_size =3D hantro_rfc_buffer_size(ctx);
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	int ret;
> +
> +	if (rfc->size < buf_size && rfc->cpu) {
> +		/* buffer is too small, release it */
> +		dma_free_attrs(vpu->dev, rfc->size, rfc->cpu,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rfc->dma, rfc->attrs);
> +		rfc->cpu =3D NULL;
> +	}
> +
> +	if (!rfc->cpu) {
> +		/* buffer not already allocated, try getting a new one */
> +		ret =3D hantro_rfc_buffer_alloc(ctx, index);
> +		if (ret)
> +			return 0;
> +	}
> +
> +	if (!rfc->cpu)
> +		return 0;
> +
> +	return rfc->dma;
> +}
> +
> +dma_addr_t
> +hantro_rfc_get_chroma_buf_addr(struct hantro_ctx *ctx, int index)
> +{
> +	dma_addr_t luma_addr =3D hantro_rfc_get_luma_buf_addr(ctx, index);
> +	struct hantro_dev *vpu =3D ctx->dev;
> +	int fourcc =3D ctx->vpu_src_fmt->fourcc;
> +	int width =3D ctx->ref_fmt.width;
> +	int height =3D ctx->ref_fmt.height;
> +
> +	if (!luma_addr)
> +		return -EINVAL;
> +
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_HEVC_SLICE:
> +		return luma_addr + hantro_hevc_luma_compressed_size(width,
> height);
> +	}
> +
> +	/* Should not happen */
> +	dev_warn(vpu->dev, "Invalid rfc chroma address\n");
> +	return 0;
> +}
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_de=
c.c
> b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index c1ada14df4c3..21da8ddfc4b3 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -62,7 +62,7 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx,=
 int
> ref, int idx,
> =C2=A0	const struct v4l2_ctrl_av1_frame *frame =3D ctrls->frame;
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;
> =C2=A0	struct hantro_decoded_buffer *dst;
> -	dma_addr_t luma_addr, chroma_addr, mv_addr =3D 0;
> +	dma_addr_t luma_addr, chroma_addr =3D 0;
> =C2=A0	int cur_width =3D frame->frame_width_minus_1 + 1;
> =C2=A0	int cur_height =3D frame->frame_height_minus_1 + 1;
> =C2=A0	int scale_width =3D
> @@ -120,11 +120,10 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *=
ctx,
> int ref, int idx,
> =C2=A0	dst =3D vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_re=
f-
> >vb2_buf);
> =C2=A0	luma_addr =3D hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
> =C2=A0	chroma_addr =3D luma_addr + dst->av1.chroma_offset;
> -	mv_addr =3D luma_addr + dst->av1.mv_offset;
> =C2=A0
> =C2=A0	hantro_write_addr(vpu, AV1_REFERENCE_Y(ref), luma_addr);
> =C2=A0	hantro_write_addr(vpu, AV1_REFERENCE_CB(ref), chroma_addr);
> -	hantro_write_addr(vpu, AV1_REFERENCE_MV(ref), mv_addr);
> +	hantro_write_addr(vpu, AV1_REFERENCE_MV(ref), dst->av1.mv_addr);
> =C2=A0
> =C2=A0	return (scale_width !=3D (1 << AV1_REF_SCALE_SHIFT)) ||
> =C2=A0		(scale_height !=3D (1 << AV1_REF_SCALE_SHIFT));
> @@ -180,11 +179,10 @@ static void
> rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
> =C2=A0		if (idx >=3D 0) {
> =C2=A0			dma_addr_t luma_addr, mv_addr =3D 0;
> =C2=A0			struct hantro_decoded_buffer *seg;
> -			size_t mv_offset =3D hantro_av1_chroma_size(ctx);
> =C2=A0
> =C2=A0			seg =3D vb2_to_hantro_decoded_buf(&av1_dec-
> >frame_refs[idx].vb2_ref->vb2_buf);
> =C2=A0			luma_addr =3D hantro_get_dec_buf_addr(ctx, &seg-
> >base.vb.vb2_buf);
> -			mv_addr =3D luma_addr + mv_offset;
> +			mv_addr =3D hantro_mv_get_buf_addr(ctx, seg-
> >base.vb.vb2_buf.index);
> =C2=A0
> =C2=A0			hantro_write_addr(vpu, AV1_SEGMENTATION, mv_addr);
> =C2=A0			hantro_reg_write(vpu, &av1_use_temporal3_mvs, 1);
> @@ -1350,22 +1348,20 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct
> hantro_ctx *ctx)
> =C2=A0	struct hantro_dev *vpu =3D ctx->dev;
> =C2=A0	struct hantro_decoded_buffer *dst;
> =C2=A0	struct vb2_v4l2_buffer *vb2_dst;
> -	dma_addr_t luma_addr, chroma_addr, mv_addr =3D 0;
> +	dma_addr_t luma_addr, chroma_addr =3D 0;
> =C2=A0	size_t cr_offset =3D hantro_av1_luma_size(ctx);
> -	size_t mv_offset =3D hantro_av1_chroma_size(ctx);
> =C2=A0
> =C2=A0	vb2_dst =3D av1_dec->frame_refs[av1_dec->current_frame_index].vb2_=
ref;
> =C2=A0	dst =3D vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
> =C2=A0	luma_addr =3D hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
> =C2=A0	chroma_addr =3D luma_addr + cr_offset;
> -	mv_addr =3D luma_addr + mv_offset;
> =C2=A0
> =C2=A0	dst->av1.chroma_offset =3D cr_offset;
> -	dst->av1.mv_offset =3D mv_offset;
> +	dst->av1.mv_addr =3D hantro_mv_get_buf_addr(ctx, dst-
> >base.vb.vb2_buf.index);
> =C2=A0
> =C2=A0	hantro_write_addr(vpu, AV1_TILE_OUT_LU, luma_addr);
> =C2=A0	hantro_write_addr(vpu, AV1_TILE_OUT_CH, chroma_addr);
> -	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
> +	hantro_write_addr(vpu, AV1_TILE_OUT_MV, dst->av1.mv_addr);
> =C2=A0}
> =C2=A0
> =C2=A0int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)

--=-cNnem6/AhxNHEuTH4Ufj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabgjsAAKCRDZQZRRKWBy
9Eb1AP94acqacsx8NxzZaFoq+QIednMU0Ks9h5iPt4P9kn7QGwD/ZJXhNwloABVl
kxkEy++hZouVBtn8DI2x4eveq0K2IgE=
=A4lT
-----END PGP SIGNATURE-----

--=-cNnem6/AhxNHEuTH4Ufj--

