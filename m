Return-Path: <linux-media+bounces-44746-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0449EBE3F84
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 16:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0542D19A7BEE
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 14:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC62A340DB4;
	Thu, 16 Oct 2025 14:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VTAD340t"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3050F30F933;
	Thu, 16 Oct 2025 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760625748; cv=none; b=JsJZNEuLrR0xMv4PfLpfmi46dYi7R+dhsZP2up9aYXTb6BP8BwkiCurxylNxZ1sPP2edzq8l76bGw7x5DwqlNLfXJcGQP4G+nO+HOaXFnAuFpvSmfHYW4PIG4vfavXK9CZk1G31tU1ot+AJo4NkKbBaF+BW0ZGloC+xbubREeR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760625748; c=relaxed/simple;
	bh=jjl0am6Ty1/jZDMPoiRz5vbe7o1TNwBWQRFz2urTlFU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BG+jJa5eR07ayeNzaVJKc6SaCAyasNAPHjf5u92dVdP6WiWyXTqmcbiSqYCAQY67uhI59rdkyrdkZYOs9XlYER9BViMaEyZtN+YkAAdFxz7NthAqu4dEN5ZZWrOIsT9KKpX/4mFLIhnHqJwIFDb48UU7cWVvF06Eo47CrxpxpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VTAD340t; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760625744;
	bh=jjl0am6Ty1/jZDMPoiRz5vbe7o1TNwBWQRFz2urTlFU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VTAD340tY1BwVmnfMhCJIsVuvW6/Y46pDQdugpP/XT0gWfNqbrO1uZ+aC2JfLquFk
	 WBbIyNjK+rzQHWsSok+vclEY3RnJU45GJ0OsnYHBZiCbbQbOCfzCy+LHq7Xcu8DHcF
	 Ihqkn/njaxWIesEmtusS8EhYfLgvPcHYs8OvmtDHLfHDE+FbyUD0ik8mX0QqXZlXtO
	 TubExDvHADOCNmNXz5fcx38GrPEhaunjfvTaOQSRzwFCEPGuCDzVyxAzJfbkmJcVfU
	 ffeD84/F3fE200JtXdfmEohmNZlS8BMYNK1KP70q4+4G50UQHghyBgTk+Tp+g0piPj
	 I922IQ6O1JtEg==
Received: from [IPv6:2606:6d00:17:ebd3::5ac] (unknown [IPv6:2606:6d00:17:ebd3::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BAAD17E0CF8;
	Thu, 16 Oct 2025 16:42:21 +0200 (CEST)
Message-ID: <eeda0221acbe0a70219fb7d87603d3dfec73f56f.camel@collabora.com>
Subject: Re: [PATCH v4 0/8] Enable video decoder & encoder for MT8189
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert	
 <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Irui Wang	
 <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>
Date: Thu, 16 Oct 2025 10:42:19 -0400
In-Reply-To: <20251016060747.20648-1-kyrie.wu@mediatek.com>
References: <20251016060747.20648-1-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-AbDKkJujBZd+Yb/YkvVa"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-AbDKkJujBZd+Yb/YkvVa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 16 octobre 2025 =C3=A0 14:07 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This series have the follow changing:
> Firstly add mt8189 video decoder compatible, profile and level to support
> MT8189 kernel driver.
> Secondly fix some bugs, including vp 4K profile2 and media device node
> number bug.
> Lastly, add mt8189 video encoder compatible.
>=20
> This series has been tested with MT8189 tast test.
> Encoding and decoding worked for this chip.
>=20
> Patches 1-2 Add decoder compatible.
> Patches 3 Add profile and level supporting.
> Patches 4 Add core-only VP9 decoding supporting.
> Patches 5-6 fix some bugs.
> Patches 7-8 Adds encoder compatible.
>=20
> ---
> H264 test results:
> ./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j1 -t 90
> =C2=A0=C2=A0=C2=A0=C2=A0 JVT-AVC_V1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9=
4/135

Your set indicates that this SoC supports more then H.264, any reason to om=
it
other codecs ? Also, why not -j2, does it mean concurrent decoding is broke=
n ?
>=20
> v4l2-compliance test results:
> Compliance test for mtk-vcodec-enc device /dev/video2:
> Total for mtk-vcodec-enc device /dev/video2: 47, Succeeded: 46, Failed: 1=
, Warnings: 0
> Compliance test for mtk-vcodec-dec device /dev/video3:
> Total for mtk-vcodec-dec device /dev/video3: 48, Succeeded: 48, Failed: 0=
, Warnings: 0
>=20
> scp upstream link:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250811015922.=
32680-1-huayu.zong@mediatek.com/
>=20
> Changes compared with v3:
> --add reviewer to commit messages
> --Rebased on top of the latest media tree
>=20
> Changes compared with v2:
> --add H264 fluster test results
> --reorder compatible string for dt-bindings
>=20
> Changes compared with v1:
> --add v4l2-compliance test results
> --add scp upstream link
> --add HW difference discriptions for dt-bindings commit messages
>=20
> This series patches dependent on:
> [1]
> https://patchwork.linuxtv.org/project/linux-media/cover/20250510075357.11=
761-1-yunfei.dong@mediatek.com/
> [2]
> https://patchwork.linuxtv.org/project/linux-media/cover/20250814085642.17=
343-1-kyrie.wu@mediatek.com/

It could be nice to quote the subjects, so we can decide to open the links =
or
not. I suppose you opted for sending the DTS separately, I don't have the H=
W,
but if my chances someone wanted to test that, he's need a these, can you l=
ink
them please ?

Nicolas

>=20
> Kyrie Wu (8):
> =C2=A0 dt-bindings: media: mediatek: decoder: Add MT8189
> =C2=A0=C2=A0=C2=A0 mediatek,vcodec-decoder
> =C2=A0 media: mediatek: vcodec: add decoder compatible to support MT8189
> =C2=A0 media: mediatek: vcodec: add profile and level supporting for MT81=
89
> =C2=A0 media: mediatek: vcodec: Add core-only VP9 decoding support for MT=
8189
> =C2=A0 media: mediatek: vcodec: fix vp9 4096x2176 fail for profile2
> =C2=A0 media: mediatek: vcodec: fix media device node number
> =C2=A0 dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
> =C2=A0 media: mediatek: encoder: Add MT8189 encoder compatible data
>=20
> =C2=A0.../media/mediatek,vcodec-encoder.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0.../media/mediatek,vcodec-subdev-decoder.yaml |=C2=A0 1 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 +++++-
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c |=C2=A0 4 +++
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 32 ++++++++++++----=
---
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 14 ++++++++
> =C2=A07 files changed, 50 insertions(+), 13 deletions(-)

--=-AbDKkJujBZd+Yb/YkvVa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaPEESwAKCRDZQZRRKWBy
9MMZAP0X3arp/YBTkXCva98lZDaCapBcw7wktlkZxAITnn8/ZQEA6FRrYm+LQmxk
nPsXbosVPXzbjXK40/SFXm7EwWdetAw=
=UGwt
-----END PGP SIGNATURE-----

--=-AbDKkJujBZd+Yb/YkvVa--

