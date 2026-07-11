Return-Path: <linux-media+bounces-67369-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8CpjFg65Umq+SgMAu9opvQ
	(envelope-from <linux-media+bounces-67369-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 23:43:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC17742F1C
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 23:43:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=oLHqB8gT;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67369-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67369-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B09E301CFBB
	for <lists+linux-media@lfdr.de>; Sat, 11 Jul 2026 21:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2289531716A;
	Sat, 11 Jul 2026 21:43:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B2E29BD9A;
	Sat, 11 Jul 2026 21:43:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783806209; cv=none; b=AK5IjoA/R5GDqnVlHp0wbB8ti1dHbr1/GJqhLmBcIapKDRvRSc52VDbVeKN81+cM4fAFPoyu8Hw9TG5CkdZn8LpWevObKFuPwCtizRSlyC5jf4EGdtShAasTtj8B47N401S5+BJ2JNyRRlYNZsNSlTfFt0pan6k3ivtJX7mKDAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783806209; c=relaxed/simple;
	bh=5iyh145oPbVi0/Y2eokUBvMwzT4NqhE95qIzSK3Ghxs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jsXMIl7WTXaXGtQ+uKTY1iJoV+IzeDwLR0TOGjfR8gMd1x6tTVizDPsTiq0kW+irws1eSXhVcwQVVhNcs4mgsocvI39iXQYGipeVGiICuwqioLJd1fCyk/92nkckGgxNDXzWgyPg/F7r/FOOI8ESpZLt718tXtYeQgrv+kmvmwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oLHqB8gT; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783806200;
	bh=5iyh145oPbVi0/Y2eokUBvMwzT4NqhE95qIzSK3Ghxs=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=oLHqB8gTjFdC6EVn3NxVA+q6ljo4sR9yi82DgznHeWf9j8SzbVfu4kWfaSclB+y84
	 DmEdssphelKp5fsUdXW5RXK6pxJXgVYt+L/qBs5NiOKR+z/+jAbNBwzoP2V17+b2hF
	 k076x491QnSa/FX4bc6yL4sX5BhAMYGLqhwRMZAB226sr0txLCgJVAo3IKMKeL8ENg
	 +YmihcA8k1NaErlLRW4/p7UHYkD1wkWGBI0U4vTQZqsS8BI/l+1GdO7PmN4iIr6G4w
	 QbagbQ+VTKXOcz9OMTPTI7v8q5wCXo/6RWnlgOoGU4VlAVJ6LcK6vERnwBgvvGCZnE
	 U+wMGUAV5zr/A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD82217E0076;
	Sat, 11 Jul 2026 23:43:18 +0200 (CEST)
Message-ID: <29b98aee357ea1ff49939c47eaca3cb4a01c8d72.camel@collabora.com>
Subject: Re: [PATCH v15 01/12] media: mediatek: jpeg: fix jpeg cores'
 amounts setting
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Sat, 11 Jul 2026 17:43:16 -0400
In-Reply-To: <20260702072614.10373-2-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-2-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-SowlojmCUCUWFxgrmrfW"
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
	TAGGED_FROM(0.00)[bounces-67369-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEC17742F1C


--=-SowlojmCUCUWFxgrmrfW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Different ICs have different amounts of cores,
> use a variable to set the cores' amounts.
>=20
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0 | =
8 ++++----
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h=C2=A0=C2=A0 | =
2 ++
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
> =C2=A04 files changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index d147ec483081..1e014fd698ae 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1462,7 +1462,7 @@ static int mtk_jpegenc_get_hw(struct mtk_jpeg_ctx *=
ctx)
> =C2=A0	int i;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
> =C2=A0		comp_jpeg =3D jpeg->enc_hw_dev[i];
> =C2=A0		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
> =C2=A0			hw_id =3D i;
> @@ -1509,7 +1509,7 @@ static int mtk_jpegdec_get_hw(struct mtk_jpeg_ctx *=
ctx)
> =C2=A0	int i;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&jpeg->hw_lock, flags);
> -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
> =C2=A0		comp_jpeg =3D jpeg->dec_hw_dev[i];
> =C2=A0		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
> =C2=A0			hw_id =3D i;
> @@ -1592,7 +1592,7 @@ static void mtk_jpegenc_worker(struct work_struct *=
work)
> =C2=A0		jpeg_work);
> =C2=A0	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> =C2=A0
> -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
> =C2=A0		comp_jpeg[i] =3D jpeg->enc_hw_dev[i];
> =C2=A0	i =3D 0;
> =C2=A0
> @@ -1687,7 +1687,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0	struct mtk_jpeg_fb fb;
> =C2=A0	unsigned long flags;
> =C2=A0
> -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++)
> +	for (i =3D 0; i < jpeg->max_hw_count; i++)
> =C2=A0		comp_jpeg[i] =3D jpeg->dec_hw_dev[i];
> =C2=A0	i =3D 0;
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 02ed0ed5b736..6be5cf30dea1 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -212,6 +212,7 @@ struct mtk_jpegdec_comp_dev {
> =C2=A0 * @reg_decbase:	jpg decode register base addr
> =C2=A0 * @dec_hw_dev:	jpg decode hardware device
> =C2=A0 * @hw_index:		jpg hw index
> + * @max_hw_count:	jpeg hw-core count
> =C2=A0 */
> =C2=A0struct mtk_jpeg_dev {
> =C2=A0	struct mutex		lock;
> @@ -234,6 +235,7 @@ struct mtk_jpeg_dev {
> =C2=A0	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
> =C2=A0	struct mtk_jpegdec_comp_dev *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
> =C2=A0	atomic_t hw_index;
> +	u32 max_hw_count;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 32372781daf5..4534caeb104f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -664,6 +664,7 @@ static int mtk_jpegdec_hw_probe(struct platform_devic=
e *pdev)
> =C2=A0	master_dev->dec_hw_dev[i] =3D dev;
> =C2=A0	master_dev->reg_decbase[i] =3D dev->reg_base;
> =C2=A0	dev->master_dev =3D master_dev;
> +	master_dev->max_hw_count++;

Just one question, can the mtk_jpegenc_worker() starts before all cores hav=
e
been probed ?

Nicolas

> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index b6f5b2249f1f..2765dafab4ad 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -386,6 +386,7 @@ static int mtk_jpegenc_hw_probe(struct platform_devic=
e *pdev)
> =C2=A0	master_dev->enc_hw_dev[i] =3D dev;
> =C2=A0	master_dev->reg_encbase[i] =3D dev->reg_base;
> =C2=A0	dev->master_dev =3D master_dev;
> +	master_dev->max_hw_count++;
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);

--=-SowlojmCUCUWFxgrmrfW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalK49AAKCRDZQZRRKWBy
9HWWAQDDsuWnz7IVhMvOVrf9+q+gNoZaKZHoJS1aycgNmMVL6wEAnR9zNR4HqAgV
y7qMxsxMRmPkPjtDJs09kLp3SKauxAY=
=nWlY
-----END PGP SIGNATURE-----

--=-SowlojmCUCUWFxgrmrfW--

