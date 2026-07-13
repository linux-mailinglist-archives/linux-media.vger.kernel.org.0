Return-Path: <linux-media+bounces-67515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hIwVNQNKVWrRmQAAu9opvQ
	(envelope-from <linux-media+bounces-67515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 22:26:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3174474F050
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 22:26:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=Ukp+njbZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67515-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67515-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A29F30747CD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 20:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFC235C193;
	Mon, 13 Jul 2026 20:26:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DEF274B2A;
	Mon, 13 Jul 2026 20:26:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974388; cv=none; b=GJRx7ClZX3w5O3gnpBA2eUyP48gen9rdChFZYWjnhlCUrbdlzyA7YUA9u9a/hwy8CXYrC62CMwNy91E+DPcEB5HbxE0WB3ibXm/uosghnON9+Zs114YfBq8XgitSyxAmPTHEXfVuiw4bebDmH5b82oYb3r8tL4yAur5RwjjRnj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974388; c=relaxed/simple;
	bh=rb6mPYklYuYVHSZpGzru92M8ezjoY2NpIOKtf3TKwQY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cppkuSai0rLMo2UUs4eGXuizq75wzduxkVfSHhVmrn42FKGjFToIIz9mlnSfY5k9yLvX7V/H/HFIM+2ANOMzmQpKYoWF3l4zS1TD0o5KBBRMph7SFTMImfQkru0XnFmjF4MQDWKiTx1cMdBvGsxUdco8vnjs8zK7g4+fiYcSk9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ukp+njbZ; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783974385;
	bh=rb6mPYklYuYVHSZpGzru92M8ezjoY2NpIOKtf3TKwQY=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=Ukp+njbZqtrisGCjs0oI4f/B+7gVLnS4w0sfAsVar8euI9r+Oq8JpFbM2/BMdqQxS
	 dzjrD9ioHa8hE4SXzuN8aEybwx2l5RvzLEbmvdeHuqdic0j3k1ZG3AIBF7RbnwN916
	 zBUiKQr3a9S6Jdc2uKgs4z7C3IcwkoLXNcKINq2gMFGwU3La09SP2biOTgOy/eEZrJ
	 5jpNuv7cPIyxJe3ZveweXtro1gckv2B5buD9cfrPNntD7p/7KtBrVr3AjsnCxiE33I
	 yvj7Mo9RK7caTpiXZLpytiTyBlOZHoats214PWtv0AW6AUO/dCRkvwKMtpZu2YYa81
	 jMrjcJbn1a8JQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C9E617E095B;
	Mon, 13 Jul 2026 22:26:23 +0200 (CEST)
Message-ID: <1812cb35e3f3bf459201b2d7830b0877fd5520a6.camel@collabora.com>
Subject: Re: [PATCH v15 07/12] media: mediatek: jpeg: fix resolution change
 event handling in decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 13 Jul 2026 16:26:21 -0400
In-Reply-To: <20260702072614.10373-8-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-8-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-2pGwts7IlWDue0rFiGli"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-67515-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[mediatek.com,xs4all.nl,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:hverkuil-cisco@xs4all.nl,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[13];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3174474F050


--=-2pGwts7IlWDue0rFiGli
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This patch refines the handling of resolution change events within
> JPEG decoder worker. The `mtk_jpeg_set_queue_data` function is now
> called to set up queue data before signaling a source change through
> `mtk_jpeg_queue_src_chg_event`. By reorganizing these calls, the
> patch ensures that necessary queue information is updated prior to
> transitioning the context state to `MTK_JPEG_SOURCE_CHANGE`.
> A condition is added to exit early if the context is already in the
> `MTK_JPEG_SOURCE_CHANGE` state, preventing redundant operations and
> improving processing efficiency.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 4dc574e03bd5..02efaed198b8 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1737,11 +1737,15 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
> =C2=A0
> =C2=A0	if (mtk_jpeg_check_resolution_change(ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &jpeg_src_buf->dec_param)) {
> -		mtk_jpeg_queue_src_chg_event(ctx);
> +		mtk_jpeg_set_queue_data(ctx, &jpeg_src_buf->dec_param);
> =C2=A0		ctx->state =3D MTK_JPEG_SOURCE_CHANGE;
> +		mtk_jpeg_queue_src_chg_event(ctx);
> =C2=A0		goto getbuf_fail;
> =C2=A0	}
> =C2=A0
> +	if (ctx->state =3D=3D MTK_JPEG_SOURCE_CHANGE)
> +		goto getbuf_fail;
> +
> =C2=A0	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> =C2=A0	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
> =C2=A0	if (ret < 0) {

--=-2pGwts7IlWDue0rFiGli
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalVJ7QAKCRDZQZRRKWBy
9PUpAP9e8+xCQMSWuQo7VpP4zwepSnhUzH75b78q1mxYH9dD+gD/Yu05bs8tffuv
QBNLFn3oWQTj7UBCWdc/BvI+ghLxnQg=
=gtQ+
-----END PGP SIGNATURE-----

--=-2pGwts7IlWDue0rFiGli--

