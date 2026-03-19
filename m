Return-Path: <linux-media+bounces-56333-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAOzJgTtu2liqQIAu9opvQ
	(envelope-from <linux-media+bounces-56333-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 13:33:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CD72CB300
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 13:33:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3DB0305D1DA
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 12:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D87C3CCFA6;
	Thu, 19 Mar 2026 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QoCL4z0y"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3832F1397;
	Thu, 19 Mar 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773923579; cv=none; b=gy5NfvMj/kSSyuLGfyhnlb7DLKZDWvomy9gfW2Bu9y9fTBRlnknciOKxJXZmeL5Mbnx69bp1c7Z0lQZjpT/aZb2hl3GZSp8tF1XEVzFL930n4xb94Ipz5ewvr7ocmDP6OKC/qN3y2jrORiruc3EJeEZeYKa/L45sopVU7Lh39Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773923579; c=relaxed/simple;
	bh=eDNe8DMtHON7ak7c378WBsEAXFnxN6eiPNeeHOZKDQo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tICRqgnns52kijIZmrhCOpK6je1xFJb1huyBBVdZ9REQlaerQtuCB+Tg/TUKto6xU5MA8YMrEiyh4wH6oqTGNi4a9jBoWD9oFMtTFTSQ+b6I4OdlBVkMbfiCD9uqMFPgwtvPO5tcYSPySPP9s0kpi0psy8zSq6asoWMr4sd44q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QoCL4z0y; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773923576;
	bh=eDNe8DMtHON7ak7c378WBsEAXFnxN6eiPNeeHOZKDQo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QoCL4z0y/qwGTCmdjO3lzsxFwR1zYjC/tXxvpkEQ0AcjYipIUPYYEoIDhmjVPx8lc
	 pIPZm1h2es96jRzV3mPKuSd3lVsab2VvzTiTcDgbZ97zpnczAteFBGNKmGsegrofZR
	 1B0xaGKdUt1lfrUrgjGRgsjVOdikv1Hu/mli/PVLl136wPs3aMnTPabQSsL/M9Who2
	 jfb9eZjfOG0ghu0VJAJgh2ODMfykMV5/bZNZEBNm5XSHETTq8qiLMbP2nS9v6tEVxa
	 m9mBTrCYQnG6uiz7AXttq+9hbRAKExV2w4QEC+68W2SEH4ZOOcoZfONyaTdGfXfC42
	 5Bxhs1JUhZMqg==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C217717E04DC;
	Thu, 19 Mar 2026 13:32:54 +0100 (CET)
Message-ID: <5d1cf57fcfa10d224b05f6f1fe5bb33979dce750.camel@collabora.com>
Subject: Re: [PATCH v0 2/3] media: chips-media: wave5: Support CBP profile
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Thu, 19 Mar 2026 08:32:52 -0400
In-Reply-To: <20260319053210.90-3-jackson.lee@chipsnmedia.com>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
	 <20260319053210.90-3-jackson.lee@chipsnmedia.com>
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
	protocol="application/pgp-signature"; boundary="=-0jNKDQdiunoNhOQz30Qg"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56333-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[chipsnmedia.com,kernel.org,xs4all.nl,collabora.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: F3CD72CB300
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-0jNKDQdiunoNhOQz30Qg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jackson,

Le jeudi 19 mars 2026 =C3=A0 14:32 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> Constrained Baseline Profile (CBP) and Baseline Profile (BP) have been
> treated as the same.
> Introduce the ability to differentiate between the two.
>=20
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Should we consider this one has a bug fix ? I suspect previously
constraint_set1_flag was never set in the bitstream, and now it is set
accordingly to the selected profile, which fixes a miss-match of user
expectation vs bitstream values. If you agree with this, a Fixes: tag would=
 be
nice.

> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-hw.c=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 +++
> =C2=A0.../media/platform/chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=A0 | =
10 +++++++---
> =C2=A0.../media/platform/chips-media/wave5/wave5-vpuapi.h=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
> =C2=A03 files changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/driver=
s/media/platform/chips-media/wave5/wave5-hw.c
> index c516d125f553..2392bce8d840 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -1763,6 +1763,9 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *ins=
t)
> =C2=A0			(p_param->skip_intra_trans << 25) |
> =C2=A0			(p_param->strong_intra_smooth_enable << 27) |
> =C2=A0			(p_param->en_still_picture << 30);
> +	else if (inst->std =3D=3D W_AVC_ENC)
> +		reg_val |=3D (p_param->constraint_set1_flag << 29);
> +
> =C2=A0	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_SPS_PARAM, reg_val);
> =C2=A0
> =C2=A0	reg_val =3D (p_param->lossless_enable) |
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 6fe01217233f..f315ed7243a7 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -939,6 +939,8 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctr=
l)
> =C2=A0		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
> =C2=A0			inst->enc_param.profile =3D H264_PROFILE_BP;
> =C2=A0			inst->bit_depth =3D 8;
> +			if (ctrl->val =3D=3D V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELIN=
E)
> +				inst->enc_param.constraint_set1_flag =3D 1;
> =C2=A0			break;
> =C2=A0		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
> =C2=A0			inst->enc_param.profile =3D H264_PROFILE_MP;
> @@ -1214,9 +1216,11 @@ static int wave5_set_enc_openparam(struct enc_open=
_param *open_param,
> =C2=A0			open_param->wave_param.decoding_refresh_type =3D DEC_REFRESH_TYP=
E_IDR;
> =C2=A0			open_param->wave_param.intra_period =3D input.avc_idr_period;
> =C2=A0		}
> -	} else {
> +	} else if (inst->std =3D=3D W_AVC_ENC)
> +		open_param->wave_param.constraint_set1_flag =3D input.constraint_set1_=
flag;
> +	else
> =C2=A0		open_param->wave_param.avc_idr_period =3D input.avc_idr_period;
> -	}

nit: Just keep the bracket, so that all branches have brackets.

cheers,
Nicolas

> +
> =C2=A0	open_param->wave_param.entropy_coding_mode =3D input.entropy_codin=
g_mode;
> =C2=A0	open_param->wave_param.lossless_enable =3D input.lossless_enable;
> =C2=A0	open_param->wave_param.const_intra_pred_flag =3D input.const_intra=
_pred_flag;
> @@ -1687,7 +1691,7 @@ static int wave5_vpu_open_enc(struct file *filp)
> =C2=A0			=C2=A0 -6, 6, 1, 0);
> =C2=A0	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
> =C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
> -			=C2=A0 0, 1, 1, 1);
> +			=C2=A0 0, 1, 1, 0);
> =C2=A0	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
> =C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION,
> =C2=A0			=C2=A0 0, 1, 1, 0);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/dr=
ivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index dc31689e0d27..7b08fef58217 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -570,6 +570,7 @@ struct enc_wave_param {
> =C2=A0	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8=
 transform */
> =C2=A0	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
> =C2=A0	u32 forced_idr_header_enable: 1; /* enable header encoding before =
IDR frame */
> +	u32 constraint_set1_flag: 1; /* enable CBP */
> =C2=A0	u32 bg_detection: 1; /* enable background detection */
> =C2=A0};
> =C2=A0

--=-0jNKDQdiunoNhOQz30Qg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabvs9AAKCRDZQZRRKWBy
9GrCAP9DTIUQfnOGo/09sY7gw2LeRxLBnRkdvdnbpjPy5w0uyAD/RZCtW7xFSpl8
UDBoC206cQcJkocxeuREV4RhGeczBwg=
=ZEPG
-----END PGP SIGNATURE-----

--=-0jNKDQdiunoNhOQz30Qg--

