Return-Path: <linux-media+bounces-59890-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PkYGDwS8WmXcQEAu9opvQ
	(envelope-from <linux-media+bounces-59890-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:02:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F73248B6C5
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9381130532BF
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD1A3BB9F8;
	Tue, 28 Apr 2026 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="Fglb0kKp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499362BEFFE
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406511; cv=none; b=n7Ojq6uIaBEnENpCZWCsHmjc+lA/TRnEJAaVvIitbZSz467jMeTDF0GZyuH4TXG3UW8h4hnArp9MRMaB/+jnzpPUrnBKlkR3z/tKe1hH8eg58Qo9U46UP9T7KkiaXVnoh7yNsWqgl4PEDfl6M2kaJxTINhxi3XSMtG8cOJdrOcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406511; c=relaxed/simple;
	bh=ghQnoMHnDe5eqWWL+CneyNiqhtdJrLiYP29Lqq2GcDA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SuZId5yb4GTyb+W+5wFTA6dSomZEl7bZ4BuNYiSz7M6RWyYK7h6R1mwbT9UBCOIc4R7KaYET89sOMmdUEqcuinEPwLLzmwecjSSFlCAdDEJ8cGtn+icVb4VfOhTuuHJpOjLC5S24cjkGcrcHWF1GKbA+BThR4xQ1nTlDzfiIark=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=Fglb0kKp; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56e91f17a99so7594406e0c.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 13:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777406509; x=1778011309; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XUtRN2qvcEZPL4lmfj0uiu2Z4Fc5k7Te+XqW2K6mn50=;
        b=Fglb0kKpoOxFZaIPV2Us67ghKPzc7aXD0prM9oW2myJJTt7tvtEZmlvXkWJrzQE3DJ
         3iYv84xQv+YRZIXCuFwaVB/kXcjoOJEEB0SYxPUwqSJzE7MXTY/T4ETlwCXUcPz0jKZX
         tQOoXykF4DnBbg6abghcvwiE7RhZG/UaOtfR9Tdei2YINj/KBpjXTfQD3ZwkPagDSyXI
         2vZFrezTBSLucBnbLbLYCERF6hFxNTLCC3r12/BX9aF7G/V0C5Rsm0kFL80ED2YSn8gJ
         2cf9/q/rBzqRNrnqCnYqFsEaIL3C078aOOdNA/1WmS/y3Wn5c6TJmSskZ1HK32qGfcHA
         hkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406509; x=1778011309;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUtRN2qvcEZPL4lmfj0uiu2Z4Fc5k7Te+XqW2K6mn50=;
        b=iGPhG1iQ6bKphcISeNnQO5JYe0ht8FBqIaMtYcjxSB5y/H/nT5giBDmCLb2B7aOVqL
         0a8o5Hp5wmXgF0RrPb706nlPpabBBI+vsNglDg4Nxu4WRmlIoPX5pn3RAbiB157kmlLL
         SqfSP6Pr0b9+YpzVfrpJBQVyeyQUE/0Wyiylql2HDdYFp7ySFytKPOnejDSYNMO4OYVO
         zz3qNp+rTJQyrwAYeyAo88Zt6Offtk/zpnH3CvnP9QSpy6LF9DyEchFUUHCP7tQCFcJi
         kaYmvB2wbEqH/XrZL7XW15mg9Ty03q8Gz9Rf4FQuLOth9HDx8++467clYq9fMnxhP/fY
         Widg==
X-Gm-Message-State: AOJu0YwnE0nnGOWWqLoYrcYnMRWD3DxEtMzu3kkvZPksw6xIACGMxl5u
	4asFwaRByyxH2Fq//Gl7K4zKBxheAbKwi/AfL8xKFueW4l9H5ZXYtKUJrIfJsbmDSD8=
X-Gm-Gg: AeBDietIWGbxslnVzNXkvm0HeTLv2e87F5oRcRq74UaL5R7gQZ1+hqkN1s/vSHn8o7c
	xBC1mFOC2stfOBG75KY1AdndfvuvXwIPN+/9Lvf+s9K+ynbHQqU5fYO2j4ZPrmg8lXGYptnf4pI
	RrALN4EPBckCYDV5HK2SP7Ob4aChlzh0OA/sdKWigW5984hNtzq1tRu5Q6qhHCgpAs7eU5QPPNm
	WlB8E8Ic2ySXs5TQcvZ7eulQd4525Qwk9kud3p7ZMB9s3+0gCfNB55xU1IlRfZLDdEOV7uoLaWA
	+jA5ryvO3tbh6kM9EpTqtCqtsWQBuv393kHSYHcBH1ByqPNTAcokNK8NMd1rTf0zIZeTIrk29ZY
	ZD6Hq5ltxDkv7NAvPxqMWy1YscyI0uLlYCwsMhUC46rvOdLyjWe88fSLD3KFpx2R1+57AjZFmJ6
	RYIlNDvXggoimy+fnehUy5RfX/st48dsSA3YTrwFFHrxrPSjhBDA==
X-Received: by 2002:a05:6102:2d08:b0:609:4d86:77b with SMTP id ada2fe7eead31-6280b1eb2e0mr2538637137.24.1777406509195;
        Tue, 28 Apr 2026 13:01:49 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3eeb2a05dsm2256226d6.45.2026.04.28.13.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:01:48 -0700 (PDT)
Message-ID: <3208f6ac11cfcd0a74d3cfbec94ef144c08d0c34.camel@ndufresne.ca>
Subject: Re: [PATCH v1 2/4] media: chips-media: wave5: Add support for
 background detection
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	hverkuil@xs4all.nl, nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, 
	b-brnich@ti.com
Date: Tue, 28 Apr 2026 16:01:47 -0400
In-Reply-To: <20260324050400.218-3-jackson.lee@chipsnmedia.com>
References: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
	 <20260324050400.218-3-jackson.lee@chipsnmedia.com>
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
	protocol="application/pgp-signature"; boundary="=-fIFysBgrnckYEcKVksrx"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 1F73248B6C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,chipsnmedia.com,ti.com];
	TAGGED_FROM(0.00)[bounces-59890-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,chipsnmedia.com:email,ndufresne.ca:mid,ndufresne-ca.20251104.gappssmtp.com:dkim]


--=-fIFysBgrnckYEcKVksrx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 mars 2026 =C3=A0 14:03 +0900, Jackson.lee a =C3=A9crit=C2=A0:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> Implement V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION in the Wave5 encoder
> driver. When enabled, the hardware detects background regions in a frame
> and uses fewer bits or skip mode to encode them, reducing bitrate for
> streams with stationary scenes.
>=20
> Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-hw.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 +++-
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 7 ++++++=
+
> =C2=A0drivers/media/platform/chips-media/wave5/wave5-vpuapi.h=C2=A0 | 1 +
> =C2=A03 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> index 687ce6ccf3ae..c516d125f553 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
> @@ -49,6 +49,7 @@
> =C2=A0
> =C2=A0#define FASTIO_ADDRESS_MASK		GENMASK(15, 0)
> =C2=A0#define SEQ_PARAM_PROFILE_MASK		GENMASK(30, 24)
> +#define SEQ_BG_PARAM_REG_DATA		0x3800410
> =C2=A0
> =C2=A0static void _wave5_print_reg_err(struct vpu_device *vpu_dev, u32
> reg_fail_reason,
> =C2=A0				 const char *func);
> @@ -1838,7 +1839,8 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *ins=
t)
> =C2=A0	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_RC_BIT_RATIO_LAYER_4_7, 0)=
;
> =C2=A0	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_ROT_PARAM, rot_mir_mode);
> =C2=A0
> -	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_BG_PARAM, 0);
> +	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_BG_PARAM,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SEQ_BG_PARAM_REG_DATA | p_param->bg_det=
ection);
> =C2=A0	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_CUSTOM_LAMBDA_ADDR, 0);
> =C2=A0	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_CONF_WIN_TOP_BOT,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p_param->conf_win_bot << 16 | p_pa=
ram->conf_win_top);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index 7613fcdbafed..6fe01217233f 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -780,6 +780,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctr=
l)
> =C2=A0	case V4L2_CID_MPEG_VIDEO_BITRATE:
> =C2=A0		inst->bit_rate =3D ctrl->val;
> =C2=A0		break;
> +	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:
> +		inst->enc_param.bg_detection =3D ctrl->val;
> +		break;
> =C2=A0	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
> =C2=A0		inst->enc_param.avc_idr_period =3D ctrl->val;
> =C2=A0		break;
> @@ -1205,6 +1208,7 @@ static int wave5_set_enc_openparam(struct enc_open_=
param
> *open_param,
> =C2=A0	open_param->wave_param.beta_offset_div2 =3D input.beta_offset_div2=
;
> =C2=A0	open_param->wave_param.decoding_refresh_type =3D
> input.decoding_refresh_type;
> =C2=A0	open_param->wave_param.intra_period =3D input.intra_period;
> +	open_param->wave_param.bg_detection =3D input.bg_detection;
> =C2=A0	if (inst->std =3D=3D W_HEVC_ENC) {
> =C2=A0		if (input.intra_period =3D=3D 0) {
> =C2=A0			open_param->wave_param.decoding_refresh_type =3D
> DEC_REFRESH_TYPE_IDR;
> @@ -1700,6 +1704,9 @@ static int wave5_vpu_open_enc(struct file *filp)
> =C2=A0	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
> =C2=A0			=C2=A0 V4L2_CID_MPEG_VIDEO_AU_DELIMITER,
> =C2=A0			=C2=A0 0, 1, 1, 1);
> +	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
> +			=C2=A0 V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION,
> +			=C2=A0 0, 1, 1, 0);
> =C2=A0	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
> =C2=A0			=C2=A0 V4L2_CID_HFLIP,
> =C2=A0			=C2=A0 0, 1, 1, 0);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> index c64135769869..dc31689e0d27 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
> @@ -570,6 +570,7 @@ struct enc_wave_param {
> =C2=A0	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8
> transform */
> =C2=A0	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
> =C2=A0	u32 forced_idr_header_enable: 1; /* enable header encoding before =
IDR
> frame */
> +	u32 bg_detection: 1; /* enable background detection */
> =C2=A0};
> =C2=A0
> =C2=A0struct enc_open_param {

--=-fIFysBgrnckYEcKVksrx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafESKwAKCRDZQZRRKWBy
9PqoAP9uqEmjOPRkeBzphuiT9TC91WSzEl84lNE6fVU4NdVevAEA1u25fP8996p4
ktOwC2x9ux8GOHLtfrNIkd/0kUotRQE=
=apIw
-----END PGP SIGNATURE-----

--=-fIFysBgrnckYEcKVksrx--

