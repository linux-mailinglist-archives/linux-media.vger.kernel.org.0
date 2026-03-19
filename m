Return-Path: <linux-media+bounces-56376-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNk4NENbvGlxxQIAu9opvQ
	(envelope-from <linux-media+bounces-56376-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:23:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B82D2086
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 21:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B08A30E8E8E
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 20:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05C03F787B;
	Thu, 19 Mar 2026 20:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pNcVqhTR"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F43F23CB;
	Thu, 19 Mar 2026 20:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773951790; cv=none; b=jhLYAc9ot6tueqi2mTaii9Jq1IvCx/YTgxeF7SFFx6yqyEB1QqczHgobhlZLSj1p1PUcrzwU2vHM+ij4ZJJZg0mdb64HggPecavRHHZB4Yo9UXLF7N0PXt9b5C7q1MhZLgN1dHCjmR6bGAsc36bTPKJtzQMjHQo95h3IcZWvvH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773951790; c=relaxed/simple;
	bh=lXgUNM1WqEBSYH5OPYMq15YhS42Y7xl69pcLMba5WGA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IOh5zei57PXjGc76OocKO+L08y617Gk9y6v518FdiVWYTXfldWx3mxXu//mH/o4l9ZFBWjQRbnvNLLBGhbCq7cSAN0qh48TaQZBDitxEQjpTTW7hEOjlkAP11nRDf1xQuqBid50MfSAb1eY6NctrDz7rK9Kej9So6GS1vpnVlus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pNcVqhTR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773951786;
	bh=lXgUNM1WqEBSYH5OPYMq15YhS42Y7xl69pcLMba5WGA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pNcVqhTR1pAtk+qbMl4ay6KjAzaHftLZF5YUQxD9omsBpHQ9a4M/uDFWQfg3F9rpn
	 pr+jBtHZLvESYB/2JiTtMM1UXGAMOugnZkT1GFnrMPqGojl+G6k0WzIUa6YBUelmlo
	 9sdTyvUifG5xwkoprK7nX3PezKmcU2KoCPv0sLRGGdN7DugxgPxVMVTscPt3XvsoAT
	 R639Hc53QY2QyBMhptm/ecaBYqgdnJAY5901IoYzioW18ielWKTPjqy5wMQg8w4yBg
	 Bij3TqoZfuwf4D/MYUWmkSmnh1oijwC7H4K+JxslBQoaAS5SKDElIe6D6HuZoiFCXs
	 ylP+rOAyYdI0g==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7689D17E0D91;
	Thu, 19 Mar 2026 21:23:04 +0100 (CET)
Message-ID: <8416ef57d9a8f40fabe3f759d5a25ed6aa9787fc.camel@collabora.com>
Subject: Re: [PATCH v5 0/6] Add support for MT8196 video encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	wenst@chromium.org, angelogioacchino.delregno@collabora.com, Tiffany Lin	
 <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng	
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Thu, 19 Mar 2026 16:23:02 -0400
In-Reply-To: <20260302035244.8994-1-irui.wang@mediatek.com>
References: <20260302035244.8994-1-irui.wang@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-QrVUnf/onkkIhx/f124c"
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56376-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[mediatek.com,xs4all.nl,kernel.org,gmail.com,chromium.org,collabora.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,linuxtv.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 379B82D2086
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-QrVUnf/onkkIhx/f124c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 mars 2026 =C3=A0 11:52 +0800, Irui Wang a =C3=A9crit=C2=A0:
> This patch series add support for MT8196 video encoder.
> patch 1~3: Add a new encoder driver interface for new VCP firmware.
> patch 4: Add new encoder driver platform data.
> patch 5: Add dt-bindings.
> patch 6: Add compatible data.
>=20
> About adding new driver support, the v4l2-compliance report shows:
> "Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46, Failed: =
1, Warnings: 0"
> The 1 Failed case is not caused by current patch set:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fail: v4l2-test-controls.cpp(1171): node->codec_mask & S=
TATEFUL_ENCODER
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_(UN)SUBSCRIBE_EVEN=
T/DQEVENT: FAIL
>=20
> This patch set depends on "media: mediatek: vcodec: support video decoder=
 in mt8196"[1]
>=20
> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=3D2171=
8

This set obviously does not apply as it has this dependency. The dependency=
 had
issues, and I just asked it to be rebased on the MT8189 series, which inclu=
de
the refactoring needed and common to both. Please coordinate, the faster I =
get
an update for MT8189, the faster these two MT8196 will be picked.

regards,
Nicolas

>=20
> Change in v5:
> =C2=A0- Rewrite patch5 commit subject.
> =C2=A0- Add else statement in patch5.
> =C2=A0- Link to v4: https://patchwork.linuxtv.org/project/linux-media/lis=
t/?series=3D21757
>=20
> Change in v4:
> =C2=A0- Rework patch3 commit message.
> =C2=A0- Rework patch5 commit with more details.
> =C2=A0- Rebase patch onto decoder's patch set.
> =C2=A0- Link to v3: https://patchwork.linuxtv.org/project/linux-media/cov=
er/20250814085642.17343-1-kyrie.wu@mediatek.com/
>=20
> Change in v3:
> =C2=A0- Add venc rc buffer alloc failure error handling.
> =C2=A0- Add mediatek,vcp property definition in dt-bindning.
>=20
> Change in v2:
> =C2=A0- Add support for VCP encode process.
> =C2=A0- Add MT8196 encoder driver platform data.
> =C2=A0- Rebase encoder patch onto decoder's patch set.
> =C2=A0- Fix some review comments in v1.
>=20
> Irui Wang (6):
> =C2=A0 media: mediatek: encoder: Add a new encoder driver interface
> =C2=A0 media: mediatek: encoder: Add support for common firmware interfac=
e
> =C2=A0 media: mediatek: encoder: Add support for VCP encode process
> =C2=A0 media: mediatek: encoder: Add a new platform data member
> =C2=A0 media: dt-bindings: mediatek,vcodec-encoder: Add MT8196
> =C2=A0 media: mediatek: encoder: Add MT8196 encoder compatible data
>=20
> =C2=A0.../media/mediatek,vcodec-encoder.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 22 +
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 19 +
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0.../platform/mediatek/vcodec/encoder/Makefile |=C2=A0=C2=A0 1 +
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0 |=C2=A0 36 +-
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 28 +
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 15 +-
> =C2=A0.../vcodec/encoder/venc/venc_common_if.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 683 ++++++++++++++++++
> =C2=A0.../vcodec/encoder/venc/venc_h264_if.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../mediatek/vcodec/encoder/venc_drv_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
> =C2=A0.../mediatek/vcodec/encoder/venc_drv_if.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 11 +-
> =C2=A0.../mediatek/vcodec/encoder/venc_ipi_msg.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 26 +
> =C2=A0.../mediatek/vcodec/encoder/venc_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 47 +-
> =C2=A015 files changed, 856 insertions(+), 52 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/v=
enc/venc_common_if.c

--=-QrVUnf/onkkIhx/f124c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxbJgAKCRDZQZRRKWBy
9Ny3AP9I6hsSCVJlO+bf6OrzhNKjtfmLALku9xJh86MoZuZB7AEAr+WUUxTKphNL
55+dMT8YC5gt6+wvoLENw7tP7DpAWgQ=
=vWOZ
-----END PGP SIGNATURE-----

--=-QrVUnf/onkkIhx/f124c--

