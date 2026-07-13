Return-Path: <linux-media+bounces-67495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NXAhGqr7VGpxiQAAu9opvQ
	(envelope-from <linux-media+bounces-67495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 16:52:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C845174C9C0
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 16:52:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=lqrv2tUR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67495-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67495-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 730B73066211
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 14:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C7C439350;
	Mon, 13 Jul 2026 14:46:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFF3438007;
	Mon, 13 Jul 2026 14:46:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953975; cv=none; b=jm1cXvPvrfJ4ut7tVle601P+CHPMjIy2DnaHyq1uQi5rZW7L4BVIBpbqSdO0hhb5rIj66M6MAhz3Eq0O1+V8CIWAMhP46UY7EbjiGoE3h4aFVC1yR2pg+hyab3s99GZbSiPRZkD2XVR00oojD/Ay7w24SXD4MyZC8Bq96cmYEFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953975; c=relaxed/simple;
	bh=eQUa3ScWb0Cgwwi0JeC1XpMNMA9za5OuFxAcERineVo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sOfi1uKGEgK9iT+ZzcbFDE7NGavGKKL+MvWUglLSHoC2d+h1jvyYopwbO0xEZTkhikEtRq/o4W86lBc3ODPz99CDPVaIYse+LkyaxjVCmSRQKFv/TiGmRXcZ+1H5Q+Ekx2B81Cz+gazEmJW7nPHBpEjhvPRfiZDMgAxH+9kIeCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lqrv2tUR; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783953971;
	bh=eQUa3ScWb0Cgwwi0JeC1XpMNMA9za5OuFxAcERineVo=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=lqrv2tURjdpv5DtV/mhSJkvyjNW9vl10v6DGJaKmDq4AMiuQBCEUW54mwswZrQbk+
	 9fAu83E+uENPnV3OxskKg7FnC+TgmA5F4dSp0XgGWHZGOHchaROTu+bRifaJbYWEMv
	 yEk9LG7P+V8YFOxMGr5lgIuPnT5eRiyLH7NMuHrFCEYBBshyQDNnWMCyA65m1JORHn
	 A+WLFcI7wC2sq7fcMvl5gq1fQKrxMeACTOFCr8r+rL54bfO1NyrsejL6e+opguZQl+
	 Ov+HacxyiA4F6dsDcKUPHmly6r00Jcm15LVhHhp/LJhVUfVLbL9nRd5otxkz8G20am
	 JmPzR1z2n3eHg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 30D2217E07A2;
	Mon, 13 Jul 2026 16:46:10 +0200 (CEST)
Message-ID: <e90e392c6c9257f0383c8cbdfee0707ea6147237.camel@collabora.com>
Subject: Re: [PATCH v15 01/12] media: mediatek: jpeg: fix jpeg cores'
 amounts setting
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu =?UTF-8?Q?=28=E5=90=B4=E6=99=97=29?= <Kyrie.Wu@mediatek.com>, 
 "linux-media@vger.kernel.org"	 <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org"	 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 "robh@kernel.org" <robh@kernel.org>,  "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "hverkuil-cisco@xs4all.nl"	 <hverkuil-cisco@xs4all.nl>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  "devicetree@vger.kernel.org"	
 <devicetree@vger.kernel.org>
Date: Mon, 13 Jul 2026 10:46:08 -0400
In-Reply-To: <05928d76a6cb103e1f4cafc38fd4ad4013b87c05.camel@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
		 <20260702072614.10373-2-kyrie.wu@mediatek.com>
		 <29b98aee357ea1ff49939c47eaca3cb4a01c8d72.camel@collabora.com>
	 <05928d76a6cb103e1f4cafc38fd4ad4013b87c05.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-a58HJVnWn+9zXOppBSIh"
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67495-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[mediatek.com,vger.kernel.org,lists.infradead.org,collabora.com,kernel.org,gmail.com,xs4all.nl];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:Kyrie.Wu@mediatek.com,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:robh@kernel.org,m:linux-kernel@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:hverkuil-cisco@xs4all.nl,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:matthiasbgg@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,collabora.com:from_mime,collabora.com:mid,collabora.com:email,collabora.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C845174C9C0


--=-a58HJVnWn+9zXOppBSIh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 13 juillet 2026 =C3=A0 03:30 +0000, Kyrie Wu (=E5=90=B4=E6=99=97) =
a =C3=A9crit=C2=A0:
> On Sat, 2026-07-11 at 17:43 -0400, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> > > Different ICs have different amounts of cores,
> > > use a variable to set the cores' amounts.
> > >=20
> > > Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> > > Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-
> > > hardware")
> > > Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com>
> > > ---
> > > =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=
=A0 | 8 ++++---
> > > -
> > > =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h=C2=A0=C2=
=A0 | 2 ++
> > > =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 1 +
> > > =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 1 +
> > > =C2=A04 files changed, 8 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > index d147ec483081..1e014fd698ae 100644
> > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > @@ -1462,7 +1462,7 @@ static int mtk_jpegenc_get_hw(struct
> > > mtk_jpeg_ctx *ctx)
> > > =C2=A0	int i;
> > > =C2=A0
> > > =C2=A0	spin_lock_irqsave(&jpeg->hw_lock, flags);
> > > -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++) {
> > > +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
> > > =C2=A0		comp_jpeg =3D jpeg->enc_hw_dev[i];
> > > =C2=A0		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
> > > =C2=A0			hw_id =3D i;
> > > @@ -1509,7 +1509,7 @@ static int mtk_jpegdec_get_hw(struct
> > > mtk_jpeg_ctx *ctx)
> > > =C2=A0	int i;
> > > =C2=A0
> > > =C2=A0	spin_lock_irqsave(&jpeg->hw_lock, flags);
> > > -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++) {
> > > +	for (i =3D 0; i < jpeg->max_hw_count; i++) {
> > > =C2=A0		comp_jpeg =3D jpeg->dec_hw_dev[i];
> > > =C2=A0		if (comp_jpeg->hw_state =3D=3D MTK_JPEG_HW_IDLE) {
> > > =C2=A0			hw_id =3D i;
> > > @@ -1592,7 +1592,7 @@ static void mtk_jpegenc_worker(struct
> > > work_struct *work)
> > > =C2=A0		jpeg_work);
> > > =C2=A0	struct mtk_jpeg_dev *jpeg =3D ctx->jpeg;
> > > =C2=A0
> > > -	for (i =3D 0; i < MTK_JPEGENC_HW_MAX; i++)
> > > +	for (i =3D 0; i < jpeg->max_hw_count; i++)
> > > =C2=A0		comp_jpeg[i] =3D jpeg->enc_hw_dev[i];
> > > =C2=A0	i =3D 0;
> > > =C2=A0
> > > @@ -1687,7 +1687,7 @@ static void mtk_jpegdec_worker(struct
> > > work_struct *work)
> > > =C2=A0	struct mtk_jpeg_fb fb;
> > > =C2=A0	unsigned long flags;
> > > =C2=A0
> > > -	for (i =3D 0; i < MTK_JPEGDEC_HW_MAX; i++)
> > > +	for (i =3D 0; i < jpeg->max_hw_count; i++)
> > > =C2=A0		comp_jpeg[i] =3D jpeg->dec_hw_dev[i];
> > > =C2=A0	i =3D 0;
> > > =C2=A0
> > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > index 02ed0ed5b736..6be5cf30dea1 100644
> > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > @@ -212,6 +212,7 @@ struct mtk_jpegdec_comp_dev {
> > > =C2=A0 * @reg_decbase:	jpg decode register base addr
> > > =C2=A0 * @dec_hw_dev:	jpg decode hardware device
> > > =C2=A0 * @hw_index:		jpg hw index
> > > + * @max_hw_count:	jpeg hw-core count
> > > =C2=A0 */
> > > =C2=A0struct mtk_jpeg_dev {
> > > =C2=A0	struct mutex		lock;
> > > @@ -234,6 +235,7 @@ struct mtk_jpeg_dev {
> > > =C2=A0	void __iomem *reg_decbase[MTK_JPEGDEC_HW_MAX];
> > > =C2=A0	struct mtk_jpegdec_comp_dev
> > > *dec_hw_dev[MTK_JPEGDEC_HW_MAX];
> > > =C2=A0	atomic_t hw_index;
> > > +	u32 max_hw_count;
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0/**
> > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > > index 32372781daf5..4534caeb104f 100644
> > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> > > @@ -664,6 +664,7 @@ static int mtk_jpegdec_hw_probe(struct
> > > platform_device *pdev)
> > > =C2=A0	master_dev->dec_hw_dev[i] =3D dev;
> > > =C2=A0	master_dev->reg_decbase[i] =3D dev->reg_base;
> > > =C2=A0	dev->master_dev =3D master_dev;
> > > +	master_dev->max_hw_count++;
> >=20
> > Just one question, can the mtk_jpegenc_worker() starts before all
> > cores have
> > been probed ?
> >=20
> > Nicolas
>=20
> Dear Nicolas,
>=20
> Thanks for the question.
>=20
> mtk_jpegenc_worker() is not started from the probe path. For the
> multicore encoder, the worker is only initialized when userspace
> opens the video node:
> =C2=A0=C2=A0=C2=A0 mtk_jpeg_open()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_WORK(&ctx->jpeg_work, jpeg->variant->=
jpeg_worker)
>=20
> It is then queued only through the V4L2 mem2mem run path:
> =C2=A0=C2=A0=C2=A0 userspace QBUF/STREAMON
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> v4l2_m2m_try_schedule()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> .device_run =3D mtk_jpeg_multicore_enc_=
device_run()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> queue_work(jpeg->workqueue, &ctx->jpeg_=
work)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> mtk_jpegenc_worker()
>=20
> So the worker can run only after the video device has been registered=C2=
=A0
> and after a userspace application opens the device and starts
> streaming buffers.
>=20
> The JPEG hw core probe is part of the platform device probe flow during
> system boot. The userspace open/streaming path happens later, after the
> system has booted and the video node is available. Therefore we do not
> have a case where mtk_jpegenc_worker() starts before the JPEG hw probe
> has completed.

When I check the core implementation though, the video device is registered=
 and
ready to open before childs driver, so even if small, there is gap where yo=
u
could race between probes and open.

I think I'd like to suggest a different approach, which to me is easier to
understand (and so should make it easier to maintain). In mtk_jpeg_probe(),=
 we
already compute num_child. We could immediately set max_hw_count to its exp=
ected
value. That would replace this patch entirely. We should add some bug on if=
 that
number is bigger then MTK_JPEGDEC_HW_MAX (bound checks, see shashiko report=
).

Then, in follow up patch, to fix the minor race I mention, we could avoid
setting hw_rdy counter to num_child immediately, and increment that at chil=
d
probe time (where you increase max_hw_count in this patch). The worker will=
 then
wait properly for child driver to have probed (instead of spinning the
device_run() by calling v4l2_m2m_job_finish() when the max retry is reached=
.).

hope this make sense, at least to me, having a max value that cannot increa=
se
sounds more logical.

Nicolas

>=20
> Regards,
> Kyrie.
> >=20
> > > =C2=A0
> > > =C2=A0	platform_set_drvdata(pdev, dev);
> > > =C2=A0	pm_runtime_enable(&pdev->dev);
> > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > > index b6f5b2249f1f..2765dafab4ad 100644
> > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> > > @@ -386,6 +386,7 @@ static int mtk_jpegenc_hw_probe(struct
> > > platform_device *pdev)
> > > =C2=A0	master_dev->enc_hw_dev[i] =3D dev;
> > > =C2=A0	master_dev->reg_encbase[i] =3D dev->reg_base;
> > > =C2=A0	dev->master_dev =3D master_dev;
> > > +	master_dev->max_hw_count++;
> > > =C2=A0
> > > =C2=A0	platform_set_drvdata(pdev, dev);
> > > =C2=A0	pm_runtime_enable(&pdev->dev);

--=-a58HJVnWn+9zXOppBSIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalT6MAAKCRDZQZRRKWBy
9JrbAQDLveH/jDrTKFuENiA349uauGr7XFkZYH3C9wMQTpDY6AD+IFk+ErD8G+WM
Asj99DiTkwEAuORoQvEGwyqWB8+uqwg=
=raLb
-----END PGP SIGNATURE-----

--=-a58HJVnWn+9zXOppBSIh--

