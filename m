Return-Path: <linux-media+bounces-56360-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JNUEyw7vGl3uwIAu9opvQ
	(envelope-from <linux-media+bounces-56360-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:06:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A972D0874
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 19:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96C0B301BDF8
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 18:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141FB396B73;
	Thu, 19 Mar 2026 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b5EMQ616"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE3038E5C1;
	Thu, 19 Mar 2026 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943562; cv=none; b=Ze0yWApkEuHiyQeIFrWbnprg57jeLJSELObFC+GPZjJoWn0NGPjnCCY2uHdIuCndbw8ZTqxkOXMjEZpvGVwcRFASuXYH9BoWyEt2kl1K7Hde4QUBG9FwE1r6RBeknUgoMjt8eFYzaYx7FtbphzfwM1kI1gnrKtcmBthx2ZUY6cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943562; c=relaxed/simple;
	bh=vgIomdEFLpCH/ayWCgPxi7rIPZPRA/uLntpDcg/oA6Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qUc+sQd/7Jt6Aa9vAU+WkgtmTWNnaE9j3AX0l9O+n037LGDYVtR9zjhaIh4DaFfnhN2aWSfIUszeie/r3OFD2Ud9x/JBraaqIPVdhRF2R0Bvs0BCT4i+WEJUI81VUz63lxLalXQvLYn42wZgBzzrbTTc4AfAgc/e0wIZOX3UM9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b5EMQ616; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773943559;
	bh=vgIomdEFLpCH/ayWCgPxi7rIPZPRA/uLntpDcg/oA6Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=b5EMQ616dun3Le9dLPr9o2OIVE8CMKpIbyDhPulHbDK036sEpVSbTySzL0wmlu8ge
	 lr64Xsbcagm5/8sPz1Y2c5jBnTG4pUGOQE1D826XX1uUpPTJd5JL0hTsj118MikWgc
	 5hwt29P85AeYn1s00eRHTJb8UqBwp744lch7cbaJnfvi0QaBbGcbRErZ8Bimjpb55/
	 Rj+6acv5q4scZ25v/Q3I8k4N6dxfvewxJMbrTEbBqNGb4JfKL52gzaZugAgTn44sVH
	 DPefnfADoSePS0Ww/DQC8qPGwkktJIlqOsQU+7gd0KCxdDVMEswMIr/avCB3XVHytH
	 oiUJcZX9bloEQ==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3676A17E127A;
	Thu, 19 Mar 2026 19:05:56 +0100 (CET)
Message-ID: <e49d7d5d2ae928e00486b1cfe8f255124d3958d8.camel@collabora.com>
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,  George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 19 Mar 2026 14:05:54 -0400
In-Reply-To: <20260127024248.18406-6-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-6-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-sy0z8PEWBL/CCb3Vp0df"
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
	TAGGED_FROM(0.00)[bounces-56360-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,xs4all.nl,chromium.org,arndb.de,vger.kernel.org,lists.infradead.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mediatek.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: E4A972D0874
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-sy0z8PEWBL/CCb3Vp0df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Just to recap my expectations.

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This commit initializes codec profile & level for VDEC. It sets
> default values for H264, H265, and VP9 codecs across multiple
> chipset configurations.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 | 12 +++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84 ++++++++++++++++=
+++
> =C2=A02 files changed, 96 insertions(+)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> index 8ddb61670dc6..a47906b9d717 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8173,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> index a1f419202a24..b571c4ed3f79 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> @@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8183,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0/* This platform data is used for one lat and one core architecture=
. */
> @@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pda=
ta =3D
> {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8188,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata =3D {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8192,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata =3D {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8195,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata =3D {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8196,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata =3D {
> @@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdat=
a =3D {
> =C2=A0	MTK_STATELESS_DEC_DATA,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8186,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};

All of the above should be squashed into patch 04. Patch 04 should be moved
before any patches related to 8189.

> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata =3D {
> @@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pda=
ta =3D
> {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8189,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};

This hunk should be squashed with what is actually patch 03.

regards,
Nicolas

--=-sy0z8PEWBL/CCb3Vp0df
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw7AwAKCRDZQZRRKWBy
9PwGAP9rzgY7L9M1ieTU8Siy2SFrsV3eHnECJj+0oyYlyTmLPgD/afPtu/772SoD
pgdx2ZG6XqMN3qE5cvRAQHaBmhd/FgI=
=pxH0
-----END PGP SIGNATURE-----

--=-sy0z8PEWBL/CCb3Vp0df--

