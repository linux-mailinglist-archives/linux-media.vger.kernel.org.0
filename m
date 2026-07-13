Return-Path: <linux-media+bounces-67508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EJgAJeY/VWpQmAAAu9opvQ
	(envelope-from <linux-media+bounces-67508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:43:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9EC74ED6B
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 21:43:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=oMQMsVqE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67508-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67508-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5BF5A300BE92
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 19:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3F235AC03;
	Mon, 13 Jul 2026 19:43:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE68357CE5;
	Mon, 13 Jul 2026 19:43:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971802; cv=none; b=FbCIz+oKKwDIze0HFIVhO0EhLV6ZO41DbMquSGSHp6N5jyKPAtPQ6xnX/QrOuMMCxsarqz/njXQ1nrfsQznOx/KCPrWF38rqP1sHAG8LdAWZl1hsKwofzY/PY3cy9GroG8q71FQp+w2Wb2EAC1OdW38oYLrg6RPciO8NsH9rh/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971802; c=relaxed/simple;
	bh=ORKrp2apu4uI4yF4r9MjF5WOFCY4SwCjKAksybb1N14=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OUymjtS1OAEYVmJ3Ns1vmRp7NoXZsp1A0qZsypS8pf9f+bIOJNcz+09wRFDUP0tssN6WGTS+gkN9mHYVfEMCofB6giw4ZaYJz9tO13IJJgg/F5JUL1YhaSn6f93zgNzrySOlaTrME0AJOGLlyT8JklthGMABW2okMuDVaFrPMNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oMQMsVqE; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783971799;
	bh=ORKrp2apu4uI4yF4r9MjF5WOFCY4SwCjKAksybb1N14=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=oMQMsVqE8LhMKyC476GoOvqojvnCeyvjot7GnEcYmHu3lHE1y42Puh0RRcszwyXjI
	 uQF6oZLUZ62eZA5pZLZ2t1QwwmYyD4F0iZPwqehsIdQjOgcs0MpV4JUpkOMoaVs+cz
	 80Ju7NiVvQDlPrb2UNOcceeHE8o/Xx7IE+z/lxYUQ/06/+mjH/ujDN+cq6VK0C2I6d
	 qVGwwogfsvjhKtIxv7hSwFhlwSCNa6DUpHkooC0TGlsGZ8tw5ojDtQMZLZmiePBUyh
	 CylYPSQq9WgmDpsBEZlAcVqVFS2mCmVGKvdtVEgCUHLMHkA3vYrslgLPDxu9qvmPPG
	 s1PjmYJUBX0HA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 886FF17E07A2;
	Mon, 13 Jul 2026 21:43:16 +0200 (CEST)
Message-ID: <30e207833eb9ed55bf1fb924d9c5e8bb3302c2e6.camel@collabora.com>
Subject: Re: [PATCH v15 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Mon, 13 Jul 2026 15:43:14 -0400
In-Reply-To: <20260702072614.10373-6-kyrie.wu@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-6-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-MsJEsU/3g1tPPkLip8P2"
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67508-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kyrie.wu@mediatek.com,m:hverkuil-cisco@xs4all.nl,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,xs4all.nl,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:from_mime,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE9EC74ED6B


--=-MsJEsU/3g1tPPkLip8P2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 02 juillet 2026 =C3=A0 15:26 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> The suspend/resume callback function is defined in the dev_pm_ops
> structure, which is defined in platform_driver. For multiple-core
> architecture, each hardware driver will register a platform_driver
> structure, so it is necessary to add a suspend/resume callback
> function for each hardware to support this operation.
>=20
> Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 28 +=
++------
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 | 62 +++++++++++=
++++++--
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 | 60 +++++++++++=
+++++--
> =C2=A03 files changed, 121 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 76a5b49b7f43..89048aba8dca 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1115,6 +1115,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jp=
eg)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> +	if (jpeg->variant->multi_core)
> +		return;
> +
> =C2=A0	ret =3D clk_bulk_prepare_enable(jpeg->variant->num_clks,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jpeg->variant->clks);
> =C2=A0	if (ret)
> @@ -1123,6 +1126,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jp=
eg)
> =C2=A0
> =C2=A0static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
> =C2=A0{
> +	if (jpeg->variant->multi_core)
> +		return;
> +
> =C2=A0	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
> =C2=A0				=C2=A0=C2=A0 jpeg->variant->clks);
> =C2=A0}
> @@ -1647,13 +1653,6 @@ static void mtk_jpegenc_worker(struct work_struct =
*work)
> =C2=A0		goto enc_end;
> =C2=A0	}
> =C2=A0
> -	ret =3D clk_prepare_enable(comp_jpeg[hw_id]->venc_clk.clks->clk);
> -	if (ret) {
> -		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
> -			__func__, __LINE__);
> -		goto enc_end;
> -	}
> -
> =C2=A0	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> @@ -1750,20 +1749,13 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
> =C2=A0	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =C2=A0
> =C2=A0	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> -	ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> +	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
> =C2=A0			__func__, __LINE__);
> =C2=A0		goto dec_end;
> =C2=A0	}
> =C2=A0
> -	ret =3D clk_prepare_enable(comp_jpeg[hw_id]->jdec_clk.clks->clk);
> -	if (ret) {
> -		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
> -			__func__, __LINE__);
> -		goto clk_end;
> -	}
> -
> =C2=A0	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> =C2=A0
> @@ -1773,7 +1765,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0				 &dst_buf->vb2_buf, &fb)) {
> =C2=A0		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
> =C2=A0			__func__, __LINE__);
> -		goto setdst_end;
> +		goto set_dst_fail;
> =C2=A0	}
> =C2=A0
> =C2=A0	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> @@ -1794,9 +1786,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
> =C2=A0
> =C2=A0	return;
> =C2=A0
> -setdst_end:
> -	clk_disable_unprepare(comp_jpeg[hw_id]->jdec_clk.clks->clk);
> -clk_end:
> +set_dst_fail:
> =C2=A0	pm_runtime_put(comp_jpeg[hw_id]->dev);
> =C2=A0dec_end:
> =C2=A0	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 4534caeb104f..9a8dbca6af00 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -533,13 +533,12 @@ static void mtk_jpegdec_timeout_work(struct work_st=
ruct *work)
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> =C2=A0
> =C2=A0	mtk_jpeg_dec_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
> =C2=A0	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(cjpeg);
> +	pm_runtime_put(cjpeg->dev);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
> @@ -547,7 +546,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =C2=A0	struct vb2_v4l2_buffer *src_buf, *dst_buf;
> =C2=A0	struct mtk_jpeg_src_buf *jpeg_src_buf;
> =C2=A0	enum vb2_buffer_state buf_state;
> -	struct mtk_jpeg_ctx *ctx;
> =C2=A0	u32 dec_irq_ret;
> =C2=A0	u32 irq_status;
> =C2=A0	int i;
> @@ -557,7 +555,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq=
, void *priv)
> =C2=A0
> =C2=A0	cancel_delayed_work(&jpeg->job_timeout_work);
> =C2=A0
> -	ctx =3D jpeg->hw_param.curr_ctx;
> =C2=A0	src_buf =3D jpeg->hw_param.src_buffer;
> =C2=A0	dst_buf =3D jpeg->hw_param.dst_buffer;
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> @@ -580,12 +577,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int i=
rq, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegdec_put_buf(jpeg);
> -	pm_runtime_put(ctx->jpeg->dev);
> -	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
> =C2=A0
> =C2=A0	jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> +	pm_runtime_put(jpeg->dev);
> =C2=A0
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> @@ -668,15 +664,69 @@ static int mtk_jpegdec_hw_probe(struct platform_dev=
ice *pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_clk_bulk_get(dev->dev,
> +				jpegdec_clk->clk_num,
> +				jpegdec_clk->clks);

clk_num and clks have been set by a call to devm_clk_bulk_get_all() few lin=
es
above. So this seem both redundant, and possibly take one too many referenc=
e on
the clock.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init clk\n");
> +		return ret;
> +	}
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int mtk_jpegdec_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
> +				=C2=A0=C2=A0 jpeg->jdec_clk.clks);
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegdec_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jpeg->jdec_clk.clks);
> +}
> +
> +static int mtk_jpegdec_suspend(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int mtk_jpegdec_resume(struct device *dev)
> +{
> +	struct mtk_jpegdec_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegdec_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
> +	RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
> +};
> +
> =C2=A0static struct platform_driver mtk_jpegdec_hw_driver =3D {
> =C2=A0	.probe =3D mtk_jpegdec_hw_probe,
> =C2=A0	.driver =3D {
> =C2=A0		.name =3D "mtk-jpegdec-hw",
> =C2=A0		.of_match_table =3D mtk_jpegdec_hw_ids,
> +		.pm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D &mtk_jpegdec_pm_ops,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 2765dafab4ad..5d1c217fea0f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -264,13 +264,12 @@ static void mtk_jpegenc_timeout_work(struct work_st=
ruct *work)
> =C2=A0	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
> =C2=A0
> =C2=A0	mtk_jpeg_enc_reset(cjpeg->reg_base);
> -	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
> -	pm_runtime_put(cjpeg->dev);
> =C2=A0	cjpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(cjpeg);
> +	pm_runtime_put(cjpeg->dev);
> =C2=A0}
> =C2=A0
> =C2=A0static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> @@ -304,12 +303,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int i=
rq, void *priv)
> =C2=A0	buf_state =3D VB2_BUF_STATE_DONE;
> =C2=A0	v4l2_m2m_buf_done(src_buf, buf_state);
> =C2=A0	mtk_jpegenc_put_buf(jpeg);
> -	pm_runtime_put(ctx->jpeg->dev);
> -	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
> =C2=A0
> =C2=A0	jpeg->hw_state =3D MTK_JPEG_HW_IDLE;
> =C2=A0	wake_up(&master_jpeg->hw_wq);
> =C2=A0	atomic_inc(&master_jpeg->hw_rdy);
> +	pm_runtime_put(jpeg->dev);
> =C2=A0
> =C2=A0	return IRQ_HANDLED;
> =C2=A0}
> @@ -390,15 +388,69 @@ static int mtk_jpegenc_hw_probe(struct platform_dev=
ice *pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, dev);
> =C2=A0	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_clk_bulk_get(dev->dev,
> +				jpegenc_clk->clk_num,
> +				jpegenc_clk->clks);

Same.

> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init clk\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_jpegenc_pm_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
> +				=C2=A0=C2=A0 jpeg->venc_clk.clks);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int mtk_jpegenc_pm_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	return clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jpeg->venc_clk.clks);
> +}
> +
> +static int mtk_jpegenc_suspend(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +
> +	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
> +
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int mtk_jpegenc_resume(struct device *dev)
> +{
> +	struct mtk_jpegenc_comp_dev *jpeg =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_force_resume(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_jpegenc_pm_ops =3D {
> +	SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
> +	RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
> +};
> +
> =C2=A0static struct platform_driver mtk_jpegenc_hw_driver =3D {
> =C2=A0	.probe =3D mtk_jpegenc_hw_probe,
> =C2=A0	.driver =3D {
> =C2=A0		.name =3D "mtk-jpegenc-hw",
> =C2=A0		.of_match_table =3D mtk_jpegenc_drv_ids,
> +		.pm =3D &mtk_jpegenc_pm_ops,
> =C2=A0	},
> =C2=A0};
> =C2=A0

Nicolas

--=-MsJEsU/3g1tPPkLip8P2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalU/0gAKCRDZQZRRKWBy
9FSSAQCKCUjM+JlpkKmot4q1SiwPxzw55mwNt61fkiPPhdo6DgEAyWp1h/38fon9
X+MwCSNNkNWGGooneIgGf5vD1Tf2gwI=
=58nN
-----END PGP SIGNATURE-----

--=-MsJEsU/3g1tPPkLip8P2--

