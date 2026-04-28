Return-Path: <linux-media+bounces-59895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC2mJ4kX8Wm6dAEAu9opvQ
	(envelope-from <linux-media+bounces-59895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:24:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3610748BB9E
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 875A23014A29
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495BB33F394;
	Tue, 28 Apr 2026 20:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RZnUWdgW"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572CC1C862F;
	Tue, 28 Apr 2026 20:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407878; cv=none; b=st2Ljrh7ehRdg/U30/9+teCtJBQrmydLGeLeu230LvZmfJbIaS0Hp5ypLVeHV3NTF01Zugo699Qm09MIijOOX0POw0ieTVp2O1FVrlllYumdAWiu8Pn5toiBTVF7Z0b1DHdyJ2irG68oswgN7Cgjyqpv5yL1Cj7BHcLSgY0o1xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407878; c=relaxed/simple;
	bh=/9KgscOipxJoiVx+8/EZy4OrwtqLVNF8SX0UOM4qm/4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G4Nd+wHxTKWeisS5WZ3B9FpoQo7JJneNlPITwuHRi1zoSrJbLHRGCi64f6MWZr8/G00elnsXqoMtpoD8eqX2NKdfkMWZYvkvig6LxO9clDydPbKivIURM+TRaK+HaggmEEK83pYoA5xh0QFPWtY5EIjQrwFjGD2lUZjh+/5QD8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RZnUWdgW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777407875;
	bh=/9KgscOipxJoiVx+8/EZy4OrwtqLVNF8SX0UOM4qm/4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RZnUWdgWCfoVfCTHNwa4L/uZfRCvS25I0Zrt8wDjp0bow7sawYM2Vo0Kjp0POwuXb
	 mcE7FGp7OKFG34V0gCYshRv5IbJ8ZqVnXQ0TXhI7vB+xowtYlsoBM6JuGBcKNLrumD
	 bs8aiPcN5lbWfYwf1fFjaC8YLkH0D5TG5GXvvEYS6CX59L4iia0IxcBtkT32ASbCNv
	 xnq5OLg+GUlqbRpuAVSILKEniWv3Qez+KAkx34Am0g9141jFNJvcL7IQpDlv/aXAWS
	 KRpYtn//mr84WDv88h3LB1TTYGp+EyL016kaePNQ6x2J7GPTtJxG1EQxLMRF7EW7zm
	 oPw7eJWvTAnNQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF18C17E0C83;
	Tue, 28 Apr 2026 22:24:33 +0200 (CEST)
Message-ID: <4d8bd13e5f76827d5cec34e919f9d6bf9b7c5df3.camel@collabora.com>
Subject: Re: [PATCH v4 00/14] media: mediatek: vcodec: support video decoder
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
Date: Tue, 28 Apr 2026 16:24:31 -0400
In-Reply-To: <20260328051630.7937-1-yunfei.dong@mediatek.com>
References: <20260328051630.7937-1-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-m53fK1x/ofRtBTBXaNMs"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 3610748BB9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-59895-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[mediatek.com,collabora.com,xs4all.nl,chromium.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]


--=-m53fK1x/ofRtBTBXaNMs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 28 mars 2026 =C3=A0 13:16 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> This patch set adds support for the video decoder on the MediaTek MT8196
> platform, leveraging the VCP microprocessor for enhanced performance. It
> introduces new firmware interfaces for kernel-side communication with VCP=
,
> adds MT8196 compatible, codec levels/profiles, and private data. Rewrites
> the AV1 driver to support extended VSI structures, then change irq table
> and cdf table size.
>=20
> This patch set depends on "Add VCP support for mt8196"[1]
>=20
> [1]
> https://patchwork.kernel.org/project/linux-remoteproc/patch/2025040209213=
4.12293-2-xiangzhi.tang@mediatek.com/

I see this had changes requested, will mark the series accordingly.

>=20
> Compliance Test Result:
> - v4l2-compliance: 48/49 tests passed, 1 failed (known issue)
> - fail: v4l2-test-controls.cpp(981): ret (got 13)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/TRY_EXT_CTRLS=
: FAIL
>=20
> Fluster Test Result:
> - H264:
> - Ran 95/135 tests successfully=C2=A0=C2=A0 in 73.540 secs
> - H265:
> - Ran 142/147 tests successfully=C2=A0 in 100.168 secs
> - VP9:
> - Ran 276/305 tests successfully=C2=A0 in 106.804 secs
> - AV1:
> - Ran 240/242 tests successfully=C2=A0 in 23.991 secs
> ---
> Changed in v4:
> - Rebase to latest codebase
> - Move dt-bindings and compatible to the after of vcp driver ready
> - MT8189 base on MT8196 patch set
>=20
> Changed in v3:
> - Depends on change no update
> - Add Compliance and Fluster test result
> - Re-write the commit message for patch 12
> - Change the patches according to review suggestion for patch: 3/4/5/6/14
>=20
> Changed in v2:
> - re-write the commit message for patch 1
> ---
> Yunfei Dong (14):
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
> =C2=A0 dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for
> =C2=A0=C2=A0=C2=A0 mt8196
> =C2=A0 media: mediatek: vcodec: add decoder compatible to support mt8196
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
=C2=A0=C2=A0=C2=A0 | 561 ++++++++++++++++++
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 153 +++++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 16 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 28 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 13 +-
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c |=C2=A0=C2=A0 6 +
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 113 +++-
> =C2=A0.../decoder/vdec/vdec_h264_req_multi_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 11 +-
> =C2=A0.../decoder/vdec/vdec_hevc_req_multi_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 12 +-
> =C2=A0.../vcodec/decoder/vdec/vdec_vp8_req_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |=C2=A0 27 +-
> =C2=A0.../mediatek/vcodec/decoder/vdec_ipi_msg.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> =C2=A0.../mediatek/vcodec/decoder/vdec_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 12 +-
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0 |=C2=A0=C2=A0 1 =
-
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.h=C2=A0 |=C2=A0=C2=A0 2 =
+
> =C2=A023 files changed, 985 insertions(+), 38 deletions(-)
> =C2=A0create mode 100644
> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> =C2=A0create mode 100644
> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

--=-m53fK1x/ofRtBTBXaNMs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEXgAAKCRDZQZRRKWBy
9PcwAQC+wcp+XirWTkN5fpEsVjsROmyaJurCWJ4N+I6LunTqbgD+K/3fjn1/CZXM
ZRS+Xk+AxpMN4wEd2kZgalmATVGcOg0=
=0mXf
-----END PGP SIGNATURE-----

--=-m53fK1x/ofRtBTBXaNMs--

