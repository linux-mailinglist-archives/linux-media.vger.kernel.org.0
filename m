Return-Path: <linux-media+bounces-59891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEkaD5wS8WmXcQEAu9opvQ
	(envelope-from <linux-media+bounces-59891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:03:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A048B6E7
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2F9C30421F7
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B0F3B530D;
	Tue, 28 Apr 2026 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="VjTX3NiN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E74F3C554B
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406611; cv=none; b=hTeEMtqlXOiRf5iLFjcs4hW6HPJUqPTR9sRyl2AcHb7llH3wW3iSXCF3y7cOjcv8Af5DhYTiOkW2CFnNDWwDM4JUYqUwLBk6qMrPYmcUOUeWIfHGaGzkASJc2CZ2bL/vCUwT1miVSdWPH9X5WZgXNKU8uITIa1HPfLtpaMylbOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406611; c=relaxed/simple;
	bh=zvY0Qacec0VoGOrjojK0a9T7lL9B0H1VQ5Ah1s8x1HA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TXHaZakHUpnvFm6Hg58Ire5rYp8rfT0VCQt0W6GhhCgCKU0AHkTOhVcEODTVnkurBKNxXUZW8uXlrsy10s/qEZ//N2hPCc+r5ulJzxf+/kiVhQ1MkTc3fLC+POsX9Dp7qYeiOFzIBS+93Ce507n2M8m/PlpTP/XZMgR973kMi+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=VjTX3NiN; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ef45a6d9dfso863308885a.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777406607; x=1778011407; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcMDGy9J7g+r+TUayCz520UppAB5wdWvEtwmQ4RLUaM=;
        b=VjTX3NiNB3RN+0IPlx6QdsAnbks7jR2NZnfmn95rG1wE2ohW/HT4cCH9//swPsOC4R
         AqaQCZre1VJMLA9edX737vq/y0VjoUo4UzCp82eOk8BGWvuFyk+Gd2IpXsryZd1ZfXnA
         rK3wuHGVy16n558dZrxKR+tx2Ke80iC6oV5ke2rZoRWjNgCpqpcsG0Z3vnho2LVlpdFO
         U6q2nscqUrn8RnFLrgYSritb3Tyv9Zysdx3bfUqrndsTpRnd7EIhYuCxqeaiZOLI2LCw
         AE42bYpUplGK6P3dpxgFpsp9Ju+2HjbZr458zfQl2r9rO1TbpCdsGE/VEFgjWQ+li5Ep
         tFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406607; x=1778011407;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcMDGy9J7g+r+TUayCz520UppAB5wdWvEtwmQ4RLUaM=;
        b=r3X4P4SaOIdYsLt65MCDmogPXUY2MJpBvOjNJtxjt4YXpBCAGOSqhnYNTj5OLgL8DR
         rPr2s9ZG5grN+rDzToJHLQDfMVRgxUdrMqSx1tr4UqNsMPrNLvT3u07UctEE9so4pHdz
         5cXwesI1X41H/wJwIXuDyKtPISYGm3DHCiT2oFnHsxV93iMHPAXxE9WghaJLAVC9KvCY
         isUMfUi/jsA4l+5Xeuv+Ztg7dh3dSTEMGzvZIz2VuxgCvi9lGs2Fpnn2ajmHYw6+L5lb
         NtjA1QwmMMuHmDhA7QDo6ZgxWe6sR2YxrQAA9Li/D0XOPZP1Z85nISy7znXkiD9lEQpU
         ew7w==
X-Gm-Message-State: AOJu0YxpPpoo+NEbjRSo173oAyyo2hMw4cMY9xrXNopHSSjm6ZjZdAYh
	1LkU4icxdBkDvzvgt8qpT56zFxEWG+UsyoAw1pazhQ5yYbHKZkbfn+tyPB+RV2I+R1I=
X-Gm-Gg: AeBDietdjkEfAABKoftj6UotkGG3E8Xo70dxJXnhbZahNzcXP5Mb5wUbw/InrfrQXTw
	GwRaIxZ89jLMqqrY/+iBfbbGmTmwOU2U16JwV858CIntP7oWfJ0Zmm4c7iQQAuO6H5MqNpeRCQx
	frKC9j3n7aqb9JizsyIYs+oGdUVk0pXDD3mEA3ZS/+3GVwYz45+IMzww+gbRoreqHR92/bxD1JQ
	XLxr0f2P3A0vgjiX7LUNVi1I3mM1Ve7u1p6L6L2PniQnNr9wPPeAJpRfqDkr08jsXIEeeuUz8lQ
	X6uPh5IpbHADjPolHc0AAwJgvsHBeJmk/PCL8EdScsqVT63fPOBgI+p0AEgPQBxD5IR2+KohfGC
	4DO69xVmHjtze9fww1HcAGKfnMB62MQl+UdN9g3Yps3azlPUIsDa6Z5B14FA1uS/SZvo2xCJuIm
	rVhkJCtGJAojuj4x44dfZ/gh2yWM/uxtAdvAUifrakpYKUxffy+g==
X-Received: by 2002:a05:620a:4115:b0:8cd:871c:909d with SMTP id af79cd13be357-8f7d9c094a9mr634100785a.53.1777406606607;
        Tue, 28 Apr 2026 13:03:26 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c899f58fsm272465285a.44.2026.04.28.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:03:25 -0700 (PDT)
Message-ID: <f50ac8b402fcf51171ca125d21482b1026845aaf.camel@ndufresne.ca>
Subject: Re: [PATCH v1 3/4] media: chips-media: wave5: Support CBP profile
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, 
	b-brnich@ti.com
Date: Tue, 28 Apr 2026 16:03:24 -0400
In-Reply-To: <20260324050400.218-4-jackson.lee@chipsnmedia.com>
References: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
	 <20260324050400.218-4-jackson.lee@chipsnmedia.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4M5ezZSK1RpvE0yXwSxB"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: E90A048B6E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,chipsnmedia.com,ti.com];
	TAGGED_FROM(0.00)[bounces-59891-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,chipsnmedia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ndufresne-ca.20251104.gappssmtp.com:dkim,ndufresne.ca:mid]


--=-4M5ezZSK1RpvE0yXwSxB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 mars 2026 =C3=A0 14:03 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> Constrained Baseline Profile (CBP) and Baseline Profile (BP) have been
> treated as the same.
> Introduce the ability to differentiate between the two.
>=20
> Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-hw.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 3 +++
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 ++++-
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpuapi.h=C2=A0 | 1 +
> =C2=A03 files changed, 8 insertions(+), 1 deletion(-)
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
> index 6fe01217233f..775beeb10fd4 100644
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
> @@ -1215,6 +1217,7 @@ static int wave5_set_enc_openparam(struct enc_open_=
param *open_param,
> =C2=A0			open_param->wave_param.intra_period =3D input.avc_idr_period;
> =C2=A0		}
> =C2=A0	} else {
> +		open_param->wave_param.constraint_set1_flag =3D input.constraint_set1_=
flag;
> =C2=A0		open_param->wave_param.avc_idr_period =3D input.avc_idr_period;
> =C2=A0	}
> =C2=A0	open_param->wave_param.entropy_coding_mode =3D input.entropy_codin=
g_mode;
> @@ -1687,7 +1690,7 @@ static int wave5_vpu_open_enc(struct file *filp)
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

--=-4M5ezZSK1RpvE0yXwSxB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafESjQAKCRDZQZRRKWBy
9NbzAQD72X+TYiTB9R0K45OYFQuQ5vnDTyWUA6OezpAP/gKepAD/cCfYaO8fXgXX
UhvhavRMGOw4aQpEfOhpFSU8fmT/sQU=
=Q8sf
-----END PGP SIGNATURE-----

--=-4M5ezZSK1RpvE0yXwSxB--

