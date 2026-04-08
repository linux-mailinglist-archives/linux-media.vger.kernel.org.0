Return-Path: <linux-media+bounces-58289-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC7qEaDC1mlDIAgAu9opvQ
	(envelope-from <linux-media+bounces-58289-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 23:03:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E49CE3C3EEB
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 23:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C30A3011C82
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 21:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D30437A498;
	Wed,  8 Apr 2026 21:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A5LHM2SI"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594A8346AC3;
	Wed,  8 Apr 2026 21:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775682202; cv=none; b=gSL9tJiECU9TGYjq2mbN7BB7G0q2uPUP86mlO+QPPSWTccsjqOuV8ggUOBzFlGN3KdhEHMjuMzY214Ig+mzRUzK3WgiA/dxwAhN+NZOyJUHTR6MzJs9wrndUx3up3BV+LancdaaWdlp+XlYh409kYgWwaipUALIL17T7aXob5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775682202; c=relaxed/simple;
	bh=LtL8zWRJDXdRoRijhg72rUTbqF2RwTDTiPsU4WYDaUA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QpI4U6VHITpqhWG8glrlPeG9tId+5pwN6oI9OGNLeXcDAzar/v2sOrzs1el6sTPKjp9FXZX7pFYLcAqnAokzCWTyjXkVSlPHPOXsr6aDbOvnAMp28caZimnAUMGCncbaiiKRETv0kImNxEnl0QH/E8S/PHHV+jyKUswbDnHdGuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A5LHM2SI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775682199;
	bh=LtL8zWRJDXdRoRijhg72rUTbqF2RwTDTiPsU4WYDaUA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=A5LHM2SIuPeAgKhLOKSz/dHZxIT7D4v3kxYiJ2ia3Y2Rs8opabz742k1NcJvZwGa0
	 KInH9ggvtk43eWBYUmuSBn0n20NiQ59nljYgI9ab0PAdjecgecmuMx5iZpc2GuH111
	 /T0LNPOXhoieJUXngos5i9bIpz+5O7954LUkFy28R0M3WU+Vi3gUbA6aQuA87dYbda
	 RsWBXv8X8jQpJMJAhFbPvSef/fA3H64292McwOSFeSyVz0t1qT+14Vu4ZU8FIePkAS
	 Z1Dm1y2BeMhL25KFyLU9d9YpVGJIOMuHs3SkypM4Exd3B+Ty/QXHyNNwZy7NHcxZF/
	 SfE7oIzNIY5bw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17BDF17E0C83;
	Wed,  8 Apr 2026 23:03:17 +0200 (CEST)
Message-ID: <e1ee5e8e41dbc1dfe6f2ce3a43998b3a717fb56e.camel@collabora.com>
Subject: Re: [PATCH] media: mtk-jpeg: cancel workqueue on release for
 supported platforms only
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Bin Liu	
 <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Wed, 08 Apr 2026 17:03:16 -0400
In-Reply-To: <20260401-mtk-jpeg-release-issue-v1-1-2271a1779340@collabora.com>
References: 
	<20260401-mtk-jpeg-release-issue-v1-1-2271a1779340@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-+6gXRB8C3U/+xLywTZ0i"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58289-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,mediatek.com,kernel.org,gmail.com,zju.edu.cn];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E49CE3C3EEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-+6gXRB8C3U/+xLywTZ0i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 01 avril 2026 =C3=A0 11:44 +0200, Louis-Alexis Eyraud a =C3=A9c=
rit=C2=A0:
> Since a recent fix the mtk_jpeg_release function cancels any pending
> or running work present in the driver workqueue using
> cancel_work_sync function.
> Currently, only the multicore based variants use this workqueue and they
> have the jpeg_worker platform data field initialized with a workqueue
> callback function. For the others, this field value remain NULL by
> default.
> The cancel_work_sync function is unconditionally called in
> mtk_jpeg_release function, even for the variants that do not use the
> workqueue. This call generates a WARN_ON print in __flush_work because
> the workqueue callback function presence check fails in __flush_work
> function (used by cancel_work_sync).
>=20
> So, to avoid these warnings, call cancel_work_sync only if a workqueue
> callback is defined in platform data.
>=20
> Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path=
 due to uncancelled work")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Patch to fix the following warning that occurs on boards such as
> Mediatek Genio 510-EVK:
> ```
> WARNING: kernel/workqueue.c:4291 at __flush_work+0x320/0x340, CPU#1:
> =C2=A0 v4l_id/409
> ...
> Call trace:
> =C2=A0__flush_work+0x320/0x340 (P)
> =C2=A0cancel_work_sync+0x6c/0x9c
> =C2=A0mtk_jpeg_release+0x2c/0x84 [mtk_jpeg]
> =C2=A0v4l2_release+0x8c/0xe8 [videodev]
> =C2=A0__fput+0xcc/0x2e0
> =C2=A0fput_close_sync+0x40/0x100
> =C2=A0__arm64_sys_close+0x38/0x7c
> =C2=A0invoke_syscall+0x54/0x10c
> =C2=A0el0_svc_common.constprop.0+0xc0/0xe0
> =C2=A0do_el0_svc+0x1c/0x34
> =C2=A0el0_svc+0x34/0x108
> =C2=A0el0t_64_sync_handler+0xa0/0xf0
> =C2=A0el0t_64_sync+0x198/0x19c
> ---[ end trace 0000000000000000 ]---
> ```
>=20
> It is based on linux-next (tag next-20260331) and has been tested on
> Mediatek Genio 510-EVK (mt8390) and 1200-EVK (mt8395) boards.
> ---
> =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8c684756d5fc2524da3a67f67f0fdda894b676fc..d147ec48308110ae8520662e1=
82dc0445447d8d0 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1202,7 +1202,8 @@ static int mtk_jpeg_release(struct file *file)
> =C2=A0	struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_file_to_ctx(file);
> =C2=A0
> -	cancel_work_sync(&ctx->jpeg_work);
> +	if (jpeg->variant->jpeg_worker)
> +		cancel_work_sync(&ctx->jpeg_work);
> =C2=A0	mutex_lock(&jpeg->lock);
> =C2=A0	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> =C2=A0	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>=20
> ---
> base-commit: e5da3eef8dadab4e98b228725ca8948edd9d601f
> change-id: 20260401-mtk-jpeg-release-issue-d8921970a250
>=20
> Best regards,

--=-+6gXRB8C3U/+xLywTZ0i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCadbClAAKCRDZQZRRKWBy
9E6KAQCtbRF0ml8NeffxiE9e18nyCtOIJ/xHDrd3SH2HI970dAD/XJ0W+e8dQDx0
9RWf/octwsctl+2l+vVTZvQdCYsnrgw=
=6DRi
-----END PGP SIGNATURE-----

--=-+6gXRB8C3U/+xLywTZ0i--

