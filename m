Return-Path: <linux-media+bounces-67505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qQXZBeE7VWotlwAAu9opvQ
	(envelope-from <linux-media+bounces-67505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:26:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD874EB3E
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:26:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b="W/n0NHB7";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67505-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67505-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 407DB304D7FE
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68017356771;
	Mon, 13 Jul 2026 19:26:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41037355F46;
	Mon, 13 Jul 2026 19:26:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783970773; cv=none; b=n9wGk4UY6vq8wZEsDhk7hYpaVgZ/IyMAgxs+UI5RNu4dMA1JxwbdubqRoN1e+Pne1Q5HIfm5Z2+avhfOzLwE1j3pBB/gt34+/elMP6o6Vi3wotQpMmQ9bEJr+eb/MqFQfwm0R6Ryj/jaWxosU8OecJIWYl914JbHOsW7XvZWgfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783970773; c=relaxed/simple;
	bh=RcxFrzM4fXb6ommCnOiNc6tEa78VsTytrJHLMEScxm4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cdAkZODy6WlhFfIohPdlXvGsYKlMv3/dzJr0hw0UxGgmjQJramjDuKdVYdoDOE/YRi/fBU+sNBMhuwrl3TGy2WfRYVtrR2ow9osfDeD6k7slWeP8dxia6zzGPSMFfG6RPRmq0le4xwiYoMYyFDyJSvh8fO1kD5WKQ7SG1GcQV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=W/n0NHB7; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783970770;
	bh=RcxFrzM4fXb6ommCnOiNc6tEa78VsTytrJHLMEScxm4=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=W/n0NHB7zpdXppS10/AVeJ2AI6xwRXLIm/akQboL82x9GxlSAgWWg4QuHRSrUVpLO
	 55kHkhTXFVYSz3DWH0C9G0TBVzJAFQJG186aMIT4VvGD3BnzjT8nI/xs/2wdlxlRc+
	 h5YWPQR7eFb0yZVn1Mn5LgO2tn/nK5dCMwMFblpzv8pRlMk3f9Mb/notJNEf4mITrn
	 0kpusqlXBqS1ZMcKzWDMPYuvCrUp8UCLbQMdsJ7F9xrEU7Xze7bhC67mMKjr55M+PU
	 rry5Kt5BALb5nxiAyiarbcNb/5zcjwfn5JK1ewctu/8clOVJWphg5PV1FXl+auN8a5
	 IeMwVvUWDqWAQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48DF317E0956;
	Mon, 13 Jul 2026 21:26:08 +0200 (CEST)
Message-ID: <a92d3ece26722bded7a71373e190b12fccbd0396.camel@collabora.com>
Subject: Re: [PATCH v15 02/12] media: mediatek: jpeg: fix jpeg buffer
 payload size setting
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 13 Jul 2026 15:26:05 -0400
In-Reply-To: <20260702072614.10373-3-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-3-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-3sVKmjtuPNin0J4FoPlf"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67505-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:hverkuil-cisco@xs4all.nl,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,xs4all.nl,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FBD874EB3E


--=-3sVKmjtuPNin0J4FoPlf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> For multi-core jpegdec, if one core gets resolution change event,
> the payload size, representing the size of Y/C data, needs to change.
> But others are decoding at the same time and it can not be changed
> immediately, which results in the payload size to not match the real
> buffer length.
> The payload size must less than the real buffer length to remove

                   must be less

> the warnning logs.
>=20
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 19 +=
+++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 1e014fd698ae..3960ad21d7f0 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -702,6 +702,7 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb=
)
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> =C2=A0	struct mtk_jpeg_q_data *q_data =3D NULL;
> =C2=A0	struct v4l2_plane_pix_format plane_fmt =3D {};
> +	size_t max_size;
> =C2=A0	int i;
> =C2=A0
> =C2=A0	q_data =3D mtk_jpeg_get_q_data(ctx, vb->vb2_queue->type);
> @@ -710,12 +711,20 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *=
vb)
> =C2=A0
> =C2=A0	for (i =3D 0; i < q_data->fmt->colplanes; i++) {
> =C2=A0		plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> +		max_size =3D plane_fmt.sizeimage;
> +
> =C2=A0		if (ctx->enable_exif &&
> -		=C2=A0=C2=A0=C2=A0 q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> -			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE);
> -		else
> -			vb2_set_plane_payload(vb, i,=C2=A0 plane_fmt.sizeimage);
> +			q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
> +			max_size +=3D MTK_JPEG_MAX_EXIF_SIZE;
> +
> +			vb2_set_plane_payload(vb, i,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MIN(vb->planes[i].length,
> +						=C2=A0 max_size));
> +		} else {
> +			vb2_set_plane_payload(vb, i,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MIN(plane_fmt.sizeimage,
> +						=C2=A0 vb->planes[i].length));
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;

--=-3sVKmjtuPNin0J4FoPlf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalU7zQAKCRDZQZRRKWBy
9KLBAQC3VQew+lWIFYFAv9fg5BqMa9IRHChznBJwWMns6YzGrgD/WYdaWpblGdWI
WFr3vCtL4w9cR0i7UPjjJ20jXFBktAQ=
=dgdq
-----END PGP SIGNATURE-----

--=-3sVKmjtuPNin0J4FoPlf--

