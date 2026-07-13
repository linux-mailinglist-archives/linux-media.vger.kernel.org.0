Return-Path: <linux-media+bounces-67510-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fiSiGWlDVWrymAAAu9opvQ
	(envelope-from <linux-media+bounces-67510-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:58:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FD674EED6
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=O6etSBjV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67510-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67510-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F67C3040A90
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F84A35BDB2;
	Mon, 13 Jul 2026 19:58:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308CB31283E;
	Mon, 13 Jul 2026 19:58:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783972695; cv=none; b=QRBDrz6KflO2/Mz37zYV3KdXL3G5+I7GQsrg9b0+U9ADG1eaBtlhGjIJpiInfK4XOGfOi1KuVMEywBo71KIbkVavVh9e+yNLZkuE/DGTcjukg0sKSj6U1ao249l+jirTkZlN9MUDiBBt3wd98e/fiP/cFfNxY1uMGa1v7LJ3OT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783972695; c=relaxed/simple;
	bh=YWJDCyT186dHX81KVVE+O5xBOZa9fYqrWM9YYEL3dk0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aUX4JNIa7Fjr6cypfd0M8FSYNiWe1qrQ7LyytUHIlkOC/1QmAgpjpWibPBOjYK9wqCQ8XHIfx06GqakfheAOLSFSli3T7T+QsSthXdWu38rhaB7FJIwkMSPkMA0MgDsHYGhyvP621oJnxlFQBwE17M293czO7Z9K8OZcjt+IQ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=O6etSBjV; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783972692;
	bh=YWJDCyT186dHX81KVVE+O5xBOZa9fYqrWM9YYEL3dk0=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=O6etSBjVtAmdzcSxXi/mkCykAKcecNb3kPZtUgRfa628X6uT+6uvaZgXFuH8uu6PG
	 954tufeuMi5vJz9jl9JO/gFQoVA2TzGIC5AgLbP76FqcMcrRlOCQ+0s1PcqczhnoSs
	 bzRbAq4l79Ok8eVXa3MeOwm4+zN9SEV8BfciT3r/SnBPsBe5e5ikoirtEqjM4RKcfS
	 5M2kInrA5nur0gRlcipsacU2af7FZcjzVZ3JBkNntiE16ZSencGlgn8JZfVbZl3Z1t
	 kmaR6xjeJcIBgzwLXL0Y4V/RjV8apS0rzchDnws3KIVrUdP09MJ1EdyvSY/0m3zvMP
	 rGPQ7RT3uDoTw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94AB017E02BA;
	Mon, 13 Jul 2026 21:58:10 +0200 (CEST)
Message-ID: <cf949589ca13c1206724c5dbaaa441bed4e163e9.camel@collabora.com>
Subject: Re: [PATCH v15 06/12] media: mediatek: jpeg: fix decoding buffer
 number setting timing issue
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 13 Jul 2026 15:58:08 -0400
In-Reply-To: <20260702072614.10373-7-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-7-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-+eCo3b9gsBb1UHx9JQhS"
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
	TAGGED_FROM(0.00)[bounces-67510-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:from_mime,collabora.com:mid,collabora.com:email,collabora.com:dkim,vger.kernel.org:from_smtp,mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9FD674EED6


--=-+eCo3b9gsBb1UHx9JQhS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> The src buffer doesn't need set information and dst buf parameters
> only need to set when the power set succussed and protect the

Can you rework this, I'm not sure I understand what you are trying to say.

> setting by spinlock ensuring that any later operations acting
> on this buffer reflect accurate state and frame data.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0 | =
9 +++------
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
> =C2=A03 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 89048aba8dca..4dc574e03bd5 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1734,7 +1734,6 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> =C2=A0	jpeg_src_buf =3D mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> -	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> =C2=A0
> =C2=A0	if (mtk_jpeg_check_resolution_change(ctx,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 &jpeg_src_buf->dec_param)) {
> @@ -1743,11 +1742,6 @@ static void mtk_jpegdec_worker(struct work_struct =
*work)
> =C2=A0		goto getbuf_fail;
> =C2=A0	}
> =C2=A0
> -	jpeg_src_buf->curr_ctx =3D ctx;
> -	jpeg_src_buf->frame_num =3D ctx->total_frame_num;
> -	jpeg_dst_buf->curr_ctx =3D ctx;
> -	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> -
> =C2=A0	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> =C2=A0	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
> =C2=A0	if (ret < 0) {
> @@ -1772,6 +1766,9 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(MTK_JPEG_HW_TIME=
OUT_MSEC));
> =C2=A0
> =C2=A0	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);

I didn't dig very deep, but in extreme case, the timeout worker (hidden abo=
ve)
could be called concurrently to the remaining of this code, which gives me =
the
impression everything would be left in a unstable state since that spinlock=
 is
not being held by the timeout worker. Perhaps something to improve further =
?

This is a step in the right direction for sure, so for this patch:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +	jpeg_dst_buf =3D mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
> +	jpeg_dst_buf->curr_ctx =3D ctx;
> +	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0	ctx->total_frame_num++;
> =C2=A0	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> =C2=A0	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 9a8dbca6af00..e4d2c5d4ec73 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -513,6 +513,7 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_co=
mp_dev *jpeg)
> =C2=A0				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> =C2=A0						=C2=A0 VB2_BUF_STATE_DONE);
> =C2=A0				ctx->last_done_frame_num++;
> +				break;
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 5d1c217fea0f..2adea3aca50b 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -242,6 +242,7 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_co=
mp_dev *jpeg)
> =C2=A0				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
> =C2=A0						=C2=A0 VB2_BUF_STATE_DONE);
> =C2=A0				ctx->last_done_frame_num++;
> +				break;
> =C2=A0			}
> =C2=A0		}
> =C2=A0	}

--=-+eCo3b9gsBb1UHx9JQhS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalVDUAAKCRDZQZRRKWBy
9ErRAQCeOKVNMHSoVQWdtAOdSHr7nFSY8kQ3qswexzAWQS4Y+gD9GGe9PN7D0YKg
lSbELCzmu3axHR6kr7PSTY6wQqhezAg=
=PL/X
-----END PGP SIGNATURE-----

--=-+eCo3b9gsBb1UHx9JQhS--

