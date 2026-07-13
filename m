Return-Path: <linux-media+bounces-67506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sgn1MM88VWpglwAAu9opvQ
	(envelope-from <linux-media+bounces-67506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:30:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF2B74EB7C
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:30:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=LFT6WccO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67506-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67506-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D2E9305C2ED
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13967357CF3;
	Mon, 13 Jul 2026 19:30:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705B335677E;
	Mon, 13 Jul 2026 19:30:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971010; cv=none; b=lmu6Nh96WYD5yJ18y1Uiy+mXSzFV+LpM4PgtNyS+keyDztvRWnImdwL3yddHnOB9yUphp3wSzoQ6VNn24UQKfb+MsnhDqcOV2rIxDzUloEyU0qBiqk2fFjzJsMyUmzf8bdb3AoU4S4qEt7jdMiVfMFzEhsJm3z0T5mz9JpMhoR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971010; c=relaxed/simple;
	bh=YaEH+sl/++U2KbZvN4eiZqs9bHWOU336+JmOrpgozYQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N1vy23DC+41yfRhRpCCYVJBrzP6Yc0xKyO67Dp8+Qqr9Pjw17BJ4bX6ammrxAJHyAOvqyw3OhJCfYJapmlA2UTOjYwVaE5jdj/FCjOuVv3j9JsBeFDgS6NJurJfVgUoSanqiuO3lfQItkZASU248uM0DppoAqHgZjHcpd4pkrqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LFT6WccO; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783971006;
	bh=YaEH+sl/++U2KbZvN4eiZqs9bHWOU336+JmOrpgozYQ=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=LFT6WccO0ftRGWJ9jGraUGIKoDH4M7Rdo+hbethvPXdu9vANpNXZQQTyBUVWrmeiq
	 8aEYb/WNDwQMr0XUwzfipZLO4B7y+Cuq2l8fD4nKpgUM0zLiJpPl6A7oAVbXVo2rT4
	 QBwiddJ44BUvrFLnDdv9ARuw2WB02dskycB2h6cnxtlKj5GHm6gfVcQsrVioOHnmUD
	 zlMyDFPGDJ4kRNPfjc3HK2H10VNxvAhHdni9EEyq0Gf8kCegAZgmAYpJT/gXO1tY2+
	 cFqgsRfJggeW1P3Jb79RluJZFjrqmNnH2wcZH3Fip/J6tqmSDqTriEwymekVzWBY8o
	 pf4XnYlLAcvTA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A77A17E07A2;
	Mon, 13 Jul 2026 21:30:04 +0200 (CEST)
Message-ID: <6ddf0799abbd5f61cca887d8474357cd9ec6b904.camel@collabora.com>
Subject: Re: [PATCH v15 04/12] media: mediatek: jpeg: Fix buffer completion
 on multi-core streaming stop
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 13 Jul 2026 15:30:03 -0400
In-Reply-To: <20260702072614.10373-5-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-5-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-sAK8CIaYG2enlEegvh5c"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67506-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:hverkuil-cisco@xs4all.nl,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,xs4all.nl,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:from_mime,collabora.com:dkim,collabora.com:mid,vger.kernel.org:from_smtp,mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collaboraa.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EF2B74EB7C


--=-sAK8CIaYG2enlEegvh5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Enhances the Mediatek JPEG driver's stability and reliability by ensuring
> that all queued buffers are processed before stopping the streaming in
> multi-core environments. It introduces a call to
> `vb2_wait_for_all_buffers()` in the `mtk_jpeg_enc_stop_streaming()` and
> `mtk_jpeg_dec_stop_streaming()` functions when the `multi_core` variant
> is enabled. This change ensures that no buffers are left unprocessed,
> preventing potential data loss or corruption during multi-core flow.
>=20
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collaboraa.com>

> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 6d6a999a22fc..76a5b49b7f43 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -850,8 +850,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(s=
truct
> mtk_jpeg_ctx *ctx,
> =C2=A0static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> +	if (jpeg->variant->multi_core)
> +		vb2_wait_for_all_buffers(q);
> +
> =C2=A0	while ((vb =3D mtk_jpeg_buf_remove(ctx, q->type)))
> =C2=A0		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
> =C2=A0}
> @@ -859,6 +863,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_qu=
eue
> *q)
> =C2=A0static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
> =C2=A0{
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(q);
> +	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0	struct vb2_v4l2_buffer *vb;
> =C2=A0
> =C2=A0	/*
> @@ -866,6 +871,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_qu=
eue
> *q)
> =C2=A0	 * Before STREAMOFF, we still have to return the old resolution an=
d
> =C2=A0	 * subsampling. Update capture queue when the stream is off.
> =C2=A0	 */
> +	if (jpeg->variant->multi_core)
> +		vb2_wait_for_all_buffers(q);
> +
> =C2=A0	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 V4L2_TYPE_IS_CAPTURE(q->type)) {
> =C2=A0		struct mtk_jpeg_src_buf *src_buf;

--=-sAK8CIaYG2enlEegvh5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalU8vAAKCRDZQZRRKWBy
9Cy5AP9n42DuX4zEUCFgIslkPa3bEp3mdcOqxJM4I+Y0Pg/aoQEAyxC9bVWM44W5
n2FCQ95QPy/I0qU84CiPfIsGgikv8Q8=
=TU2N
-----END PGP SIGNATURE-----

--=-sAK8CIaYG2enlEegvh5c--

