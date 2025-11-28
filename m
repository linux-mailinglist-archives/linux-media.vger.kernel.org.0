Return-Path: <linux-media+bounces-47875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8CC9305F
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 20:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F4BC34B05E
	for <lists+linux-media@lfdr.de>; Fri, 28 Nov 2025 19:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2DE33374A;
	Fri, 28 Nov 2025 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iWX1aI3X"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDB52D3A9E;
	Fri, 28 Nov 2025 19:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764358211; cv=none; b=pXmE/f1ipz9b0/J4GJe4RSAjBBNb7WdaYkKkBjDMLmrlyEDSwNuDluZZJOthbm5px1bagwe5ZIUiBcmnng8Nru8HfqZ1Tk23ihQK2GGYxnOHdw+sy2SKvRFDmsAHKtFmVmBQRhFX0yQoa91PcBjC8/0nnACXKYAPgB4lwwC7LhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764358211; c=relaxed/simple;
	bh=GKLsWL2UJZT8YzvnFQWt17ICJextffL/hToJMRkULxg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z1rJnrNwfop1M+iA30B6jEyGdAQ0X4/30rxHQiMsKn9IQV+z05fMRYVLwxm1eJgCCeNk4g6spkILkY5FANCKH0Vide1Srd8R753C/Lml6kf/FPlwkApduyOk/4TLRG/CuFtlso5CDKhDDDl2NY+V2e1Qji7ei+Frgg9iFq8bEWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iWX1aI3X; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764358204;
	bh=GKLsWL2UJZT8YzvnFQWt17ICJextffL/hToJMRkULxg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iWX1aI3XLUnGygk4sTlR502FeNE+j8homIRurMgFurgXC8B5K4GniAa/L1jy000cC
	 W740NFiQQtAGrZ1QJt08M54uwESyNZBErnUxtjdoZdzUnO+05Mcx++DjYPd7YbidF8
	 EfGfXbcy/n8ShLRE4hOimwqkCUQlbA0D8xybYDj/tlMptot+MG/KrZSTMv0+h6OrlZ
	 O2YImC3loxZklSdVu/Cn2Btm5KsenPsXIzL3Dxc/KwXXVpy92wW0sqc7aQQKAnUDbz
	 oPen+AwzhWyAX8NfqaJwqplZyH8uciaxkI6ps7o1dMx3eSuP7ifcGpv+ZpFxTMKmF3
	 X125keiZH9I+g==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C339F17E013C;
	Fri, 28 Nov 2025 20:30:02 +0100 (CET)
Message-ID: <84173ee52723100637570e05536cb534aae00793.camel@collabora.com>
Subject: Re: [PATCH v2 00/14] media: mediatek: vcodec: support video decoder
 in mt8196
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
Date: Fri, 28 Nov 2025 14:30:00 -0500
In-Reply-To: <20250815085232.30240-1-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-9fbPwPdhRMk4l4MW20f2"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-9fbPwPdhRMk4l4MW20f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> Using vcp micro processor to support video decoder in mt8196 platform,
> need to add new firmware interface to communicate with vcp in kernel
> side. Then add mt8196 compatible, codec levels/profiles and private data.
> Re-write av1 driver to support extend vsi struct, then change irq table
> and cdf table size.

Please reword, things seems a little reverse, say what you are doing, and t=
hen
what is used to do it. This cover should include some level of tests report=
,
v4l2-compliance (hopefully unchanged) and fluster results (ideally with
regression testing on lets say MT8195, since a driver rewrite is not a litt=
le
affaire).

>=20
> This patch set depends on "Add VCP support for mt8196"[1]
>=20
> [1]
> https://patchwork.kernel.org/project/linux-remoteproc/patch/2025040209213=
4.12293-2-xiangzhi.tang@mediatek.com/

This seems to have stalled at v2, is there an update coming ?

Nicolas

> ---
> Changed in v2:
> - re-write the commit message for patch 1
> ---
> Yunfei Dong (14):
> =C2=A0 dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for
> =C2=A0=C2=A0=C2=A0 mt8196
> =C2=A0 media: mediatek: vcodec: add decoder compatible to support mt8196
> =C2=A0 media: mediatek: vcodec: add driver to support vcp
> =C2=A0 media: mediatek: vcodec: add driver to support vcp encoder
> =C2=A0 media: mediatek: vcodec: get different firmware ipi id
> =C2=A0 media: mediatek: vcodec: get share memory address
> =C2=A0 media: mediatek: vcodec: define MT8196 vcodec levels.
> =C2=A0 media: mediatek: vcodec: support vcp architecture
> =C2=A0 media: mediatek: vcodec: support 36bit iova address
> =C2=A0 media: mediatek: vcodec: clean xpc status
> =C2=A0 media: mediatek: vcodec: add debug information
> =C2=A0 media: mediatek: vcodec: send share memory address to vcp
> =C2=A0 media: mediatek: decoder: fill av1 buffer size with picinfo
> =C2=A0 media: mediatek: decoder: support av1 extend vsi
>=20
> =C2=A0.../media/mediatek,vcodec-subdev-decoder.yaml |=C2=A0=C2=A0 1 +
> =C2=A0.../media/platform/mediatek/vcodec/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 4 +
> =C2=A0.../platform/mediatek/vcodec/common/Makefile=C2=A0 |=C2=A0=C2=A0 4 =
+
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |=C2=A0 21 +-
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 16 +
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 493 ++++++++++++++++++
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 151 ++++++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 16 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 28 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 13 +-
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c |=C2=A0=C2=A0 6 +
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c |=C2=A0 85 ++-
> =C2=A0.../decoder/vdec/vdec_h264_req_multi_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 10 +-
> =C2=A0.../decoder/vdec/vdec_hevc_req_multi_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 11 +-
> =C2=A0.../vcodec/decoder/vdec/vdec_vp8_req_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +-
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |=C2=A0 20 +-
> =C2=A0.../mediatek/vcodec/decoder/vdec_ipi_msg.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> =C2=A0.../mediatek/vcodec/decoder/vdec_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 9 +-
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0 |=C2=A0=C2=A0 1 =
-
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.h=C2=A0 |=C2=A0=C2=A0 2 =
+
> =C2=A0include/linux/remoteproc/mtk_vcp_public.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> =C2=A024 files changed, 871 insertions(+), 43 deletions(-)
> =C2=A0create mode 100644
> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> =C2=A0create mode 100644
> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

--=-9fbPwPdhRMk4l4MW20f2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSn4OAAKCRDZQZRRKWBy
9D9PAPd+sxF1+5bZ4x6B4sLG0Pw6d76Afz5VXtPK3V590sBSAQD2eUD0B1jhhSFx
/k5IyT450xs58R5lNPEP/eAC4e1yDA==
=D1vh
-----END PGP SIGNATURE-----

--=-9fbPwPdhRMk4l4MW20f2--

