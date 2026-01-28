Return-Path: <linux-media+bounces-51741-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PMrOnkQemnH2AEAu9opvQ
	(envelope-from <linux-media+bounces-51741-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:34:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED99A2357
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 14:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 155883029E61
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 13:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8463635B15A;
	Wed, 28 Jan 2026 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gofiouF7"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010BF35A933;
	Wed, 28 Jan 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607265; cv=none; b=oDwXs0Eg0vWHmB+ZSPgK5beUtY5QdiVc5ZhhJBp/NzNEHnyUwdVFYXPsok1Ge0pd4XrVCRt6dT/v5PaTQeya49zCTZskyN/X5Ns4knTvbPxxFMB6EYGMeu6eol0x+4wFguiVuchmFZvATriNBk65ThLP+AmfBIVW0PRdQ+W1jOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607265; c=relaxed/simple;
	bh=1L8+cvPFAK/AEvCUscuKOHEOR6RJuiCSEiAsXVI1H90=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQLTdNH2YxmJahAc1xg+0vHQkc3xt5Q9wTYV65c8QbnEgouKuTfTDjx75RmdyK0c4aIAEXX7qic6sI/oEDnyrXU4h8ZkjvyQ+nQzxotGzPPPvw1DFnptaxTIbHXiE67Cw3LL8/Z0IJc41laR6KOd36rPRZ8QSeL2EPZr4R2uTZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gofiouF7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769607254;
	bh=1L8+cvPFAK/AEvCUscuKOHEOR6RJuiCSEiAsXVI1H90=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gofiouF7rsOgVmjUjqsXH9V1DNDGf725nLNSthN1euiqd5cBZLhy47w3dSFDP7a1/
	 Ju4RjRcGJBCcodRGwoffxMbEliSBLTrltOhMzAyXz/1ucrwZ71Zx+cnPqZPjdiL664
	 rLjwst7JuayceZI/34RSFqmVOyfGb8/HM6t6pA5ogdYQA8y1jf+WxxfrgNOH1c2Q5T
	 197bVLhka1pmk8oxJVBzIJT3siG47zVgtG0tLIlCQ9sqCpWieeTdTEHusURwON9fNL
	 gksLXTw2bqvtooGRRUhMAO/yBf+dMHEVrJcWDuxHLXnr6eCqsJumnCPYLUTI4v/G7b
	 B8WNYHTW3Qrxg==
Received: from [IPv6:2606:6d00:17:7b4b::5ac] (unknown [IPv6:2606:6d00:17:7b4b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D24F517E01E7;
	Wed, 28 Jan 2026 14:34:11 +0100 (CET)
Message-ID: <e87868a6209d18595bf90bc20633ea300330ba28.camel@collabora.com>
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu =?UTF-8?Q?=28=E5=90=B4=E6=99=97=29?= <Kyrie.Wu@mediatek.com>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org"	 <linux-mediatek@lists.infradead.org>,
 George Sun =?UTF-8?Q?=28=E5=AD=99=E6=9E=97=29?=	 <George.Sun@mediatek.com>,
 Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?=	
 <tiffany.lin@mediatek.com>, "nhebert@chromium.org" <nhebert@chromium.org>, 
 "linux-media@vger.kernel.org"	 <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org"	 <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,  "hverkuil@xs4all.nl"	
 <hverkuil@xs4all.nl>, Yunfei Dong
 =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=	 <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  Irui Wang
 =?UTF-8?Q?=28=E7=8E=8B=E7=91=9E=29?=	 <Irui.Wang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"	
 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 "arnd@arndb.de"	 <arnd@arndb.de>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=	
 <Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>, 
 "neil.armstrong@linaro.org"
	 <neil.armstrong@linaro.org>, Yilong Zhou
 =?UTF-8?Q?=28=E5=91=A8=E6=98=93=E9=BE=99=29?=
	 <Yilong.Zhou@mediatek.com>
Date: Wed, 28 Jan 2026 08:34:09 -0500
In-Reply-To: <54689bc16875b979147c021123c2546aacb7541e.camel@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
		 <20260127024248.18406-6-kyrie.wu@mediatek.com>
		 <4a6e111d-49ef-449d-af9d-b0bd4fb468a5@collabora.com>
	 <54689bc16875b979147c021123c2546aacb7541e.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-FOrviNbeQ1Mf1Othbhwt"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51741-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[mediatek.com,vger.kernel.org,lists.infradead.org,chromium.org,kernel.org,xs4all.nl,gmail.com,arndb.de,collabora.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,mediatek.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,linuxtv.org:url]
X-Rspamd-Queue-Id: 4ED99A2357
X-Rspamd-Action: no action


--=-FOrviNbeQ1Mf1Othbhwt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 28 janvier 2026 =C3=A0 07:45 +0000, Kyrie Wu (=E5=90=B4=E6=99=
=97) a =C3=A9crit=C2=A0:
> On Tue, 2026-01-27 at 13:07 +0100, AngeloGioacchino Del Regno wrote:
> > Il 27/01/26 03:42, Kyrie Wu ha scritto:
> > > This commit initializes codec profile & level for VDEC. It sets
> > > default values for H264, H265, and VP9 codecs across multiple
> > > chipset configurations.
> > >=20
> >=20
> > The previous patch "Refactor decoder profile and level handling" will
> > break the
> > driver if this patch is not also applied at the same time.
> >=20
> > The change looks good, but you should squash 05/10 in 04/10, and
> > assign the params
> > that you're adding here along with the refactoring, so that you get
> > one single
> > patch that, if applied, doesn't break anything as it doesn't depend
> > on additional
> > (future, as this is number 5) patch.
> >=20
> > Please squash
> >=20
> > Cheers,
> > Angelo
>=20
> Dear Angelo,
>=20
> The 04/10 and 05/10 were designed in one patch in v6,
> but Nicolas thought that refactor patch and configuration
> were two different changes, should separate them in this
> comments:=20
> https://patchwork.linuxtv.org/project/linux-media/patch/20251202074038.31=
73-5-kyrie.wu@mediatek.com/
>=20
> In my mind, refactor profile and level setting and assign
> former ICs' parameters could merge into same patch. The
> configuration of MT8189 should split to another one, because
> it is a new setting.

I had assumed you'd be able to refactor without breaking it. Give me enough=
 time
to read again the patches since I don't remember all the details.

Nicolas

>=20
> Do you agree with my opinion? I look forward to your further reply.
>=20
> Thanks.
>=20
> Regards,
> Kyrie.
>=20
>=20
> >=20
> > > Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> > > ---
> > > =C2=A0 .../vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 | 12 +++
> > > =C2=A0 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84
> > > +++++++++++++++++++
> > > =C2=A0 2 files changed, 96 insertions(+)
> > >=20
> > > diff --git
> > > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teful.c
> > > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teful.c
> > > index 8ddb61670dc6..a47906b9d717 100644
> > > ---
> > > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teful.c
> > > +++
> > > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teful.c
> > > @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8173_pdata =3D {
> > > =C2=A0=C2=A0	.is_subdev_supported =3D false,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8173,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> > > +	},
> > > =C2=A0 };
> > > diff --git
> > > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teless.c
> > > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teless.c
> > > index a1f419202a24..b571c4ed3f79 100644
> > > ---
> > > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teless.c
> > > +++
> > > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
> > > teless.c
> > > @@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8183_pdata =3D {
> > > =C2=A0=C2=A0	.is_subdev_supported =3D false,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8183,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 /* This platform data is used for one lat and one core
> > > architecture. */
> > > @@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8188_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8188,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8192,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8195,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8196,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata =
=3D {
> > > @@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8186_pdata =3D {
> > > =C2=A0=C2=A0	MTK_STATELESS_DEC_DATA,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8186,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> > > +	},
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata =3D {
> > > @@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata
> > > mtk_vdec_8189_pdata =3D {
> > > =C2=A0=C2=A0	.is_subdev_supported =3D true,
> > > =C2=A0=C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> > > =C2=A0=C2=A0	.chip_name =3D 8189,
> > > +	.h264_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> > > +	},
> > > +	.h265_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> > > +		.profile =3D
> > > V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> > > +	},
> > > +	.vp9_params =3D {
> > > +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> > > +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> > > +	},
> > > =C2=A0 };
> >=20
> >=20

--=-FOrviNbeQ1Mf1Othbhwt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaXoQUQAKCRDZQZRRKWBy
9LcnAP4up5SULcFsY+6zYREYvzrK+KAbnNX5JtmUVqMTj4R/1AEAlqI+PRyEBoxB
KIF5bgVcbw5kaSZ/+UkJe169HlU7xAo=
=q5Vk
-----END PGP SIGNATURE-----

--=-FOrviNbeQ1Mf1Othbhwt--

