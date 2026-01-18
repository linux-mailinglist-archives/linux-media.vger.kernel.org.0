Return-Path: <linux-media+bounces-50991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFE7D39A13
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 22:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04DF0300ACF3
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 21:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD0229BDBC;
	Sun, 18 Jan 2026 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T5Wji7cX"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64FF1DE2A5;
	Sun, 18 Jan 2026 21:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768773161; cv=none; b=Qejg/lUTgmndbVXWvoiFrkVH1z2JWAvLZ3Oa9tJHkiIlAvIV9Exdju2XCAUEn0qBt3N0NiCjvcfSI1PGVpmyvD10l3xg3UZ/GNwHPMS81yHmFaXg+p4Ohayd0myDtrdl44xI6jQJzJdWiv2HeQJ5g1GO+3tWoUFCl9vKnUByx3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768773161; c=relaxed/simple;
	bh=vkq1AaVkwO/OwOaIFUaZsO0u4uB3v21+yThTknBHJrk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kXwqh9lofgQIPQ9g1pqStTRKET0EbMlG9Fp5T3edfbzJD8YpEAV+EZFIMBbWTYII9aiA0joqFlpZFQ8d1Sdz8rHCAIk7qziqkjm7XvCIR1W+tLKoRRbl94TqjWM1SaJc6I/yxR6v0dYwsmJwtOHCqu0mN/hRwZFyWL0u1Tf02Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T5Wji7cX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768773158;
	bh=vkq1AaVkwO/OwOaIFUaZsO0u4uB3v21+yThTknBHJrk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=T5Wji7cX3cY+Tw1ibuSeEbG9/6oR1xUlV4PY8mE4pF0zUoy6PXMRRFYbtS1FGrqHY
	 RYT847F/Xr8+zWe1pLG34TU7x68XP/AQq2QOl4BFiTPzmuMUeHaMN5a5xvNz8C8uOi
	 mK0So5VFP5Xk6s7ffHRtl7i3EHLz1oHe/7/J7Sf7x55M/mHlNzeyCjayWCCdRtaumB
	 v74S5Sa7BcYgB2SWU4vR9tyK2MXGCiP7qf7ei5r0BmXSmL+js1P5CCMcaa5eKkoUAH
	 rsFcT0zhWq7oKWOe1v38V/IeV3IO4tb47bkp3Fa/L9qladsfAT0xYl84mVKFyp7yQc
	 abMFcyNouCsvg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E079B17E0CF3;
	Sun, 18 Jan 2026 22:52:35 +0100 (CET)
Message-ID: <d347016e0e908663ead7345dcfdc4ecb26bc53c2.camel@collabora.com>
Subject: Re: [PATCH v8 02/17] media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps
 controls
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Jonas Karlman	 <jonas@kwiboo.se>, Diederik de Haas
 <didi.debian@cknow.org>
Date: Sun, 18 Jan 2026 16:52:34 -0500
In-Reply-To: <20260109161538.1294449-3-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
	 <20260109161538.1294449-3-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-0WOX6arl3pyKCkGh380M"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-0WOX6arl3pyKCkGh380M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 09 janvier 2026 =C3=A0 11:15 -0500, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> The vdpu381 decoder found on newer Rockchip SoC need the information
> from the long term and short term ref pic sets from the SPS.
>=20
> So far, it wasn't included in the v4l2 API, so add it with new dynamic
> sized controls.
>=20
> Each element of the hevc_ext_sps_lt_rps array contains the long term ref
> pic set at that index.
> Each element of the hevc_ext_sps_st_rps contains the short term ref pic
> set at that index, as the raw data.
> It is the role of the drivers to calculate the reference sets values.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c | 28 +++++++++++
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 61 +++++++++++++++++++++++
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A04 files changed, 101 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 209bc05883bb..f11255255c74 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -424,6 +424,12 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *c=
trl)
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> =C2=A0		pr_cont("HEVC_SLICE_PARAMS");
> =C2=A0		break;
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
> +		pr_cont("HEVC_EXT_SPS_ST_RPS");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
> +		pr_cont("HEVC_EXT_SPS_LT_RPS");
> +		break;
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
> =C2=A0		pr_cont("HEVC_SCALING_MATRIX");
> =C2=A0		break;
> @@ -961,6 +967,8 @@ static int std_validate_compound(const struct v4l2_ct=
rl *ctrl, u32 idx,
> =C2=A0	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
> =C2=A0	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
> =C2=A0	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
> +	struct v4l2_ctrl_hevc_ext_sps_lt_rps *p_hevc_lt_rps;
> +	struct v4l2_ctrl_hevc_ext_sps_st_rps *p_hevc_st_rps;
> =C2=A0	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> =C2=A0	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> =C2=A0	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> @@ -1254,6 +1262,20 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> =C2=A0		break;
> =C2=A0
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
> +		p_hevc_st_rps =3D p;
> +
> +		if (p_hevc_st_rps->flags & ~V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PI=
C_SET_PRED)
> +			return -EINVAL;
> +		break;
> +
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
> +		p_hevc_lt_rps =3D p;
> +
> +		if (p_hevc_lt_rps->flags & ~V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT)
> +			return -EINVAL;
> +		break;
> +
> =C2=A0	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> =C2=A0		break;
> =C2=A0
> @@ -2006,6 +2028,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2=
_ctrl_handler *hdl,
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> =C2=A0		elem_size =3D sizeof(struct v4l2_ctrl_hevc_slice_params);
> =C2=A0		break;
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
> +		elem_size =3D sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps);
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
> +		elem_size =3D sizeof(struct v4l2_ctrl_hevc_ext_sps_lt_rps);
> +		break;
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
> =C2=A0		elem_size =3D sizeof(struct v4l2_ctrl_hevc_scaling_matrix);
> =C2=A0		break;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index ad41f65374e2..167286c9e424 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1233,6 +1233,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> =C2=A0	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mod=
e";
> =C2=A0	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code"=
;
> =C2=A0	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Ent=
ry Point Offsets";
> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:		return "HEVC Short Term R=
ef Sets";
> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:		return "HEVC Long Term Re=
f Sets";
> =C2=A0	case V4L2_CID_STATELESS_AV1_SEQUENCE:			return "AV1 Sequence Param=
eters";
> =C2=A0	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:		return "AV1 Tile Gr=
oup Entry";
> =C2=A0	case V4L2_CID_STATELESS_AV1_FRAME:			return "AV1 Frame Parameters"=
;
> @@ -1578,6 +1580,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enu=
m v4l2_ctrl_type *type,
> =C2=A0		*type =3D V4L2_CTRL_TYPE_U32;
> =C2=A0		*flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> =C2=A0		break;
> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:
> +		*type =3D V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS;
> +		*flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:
> +		*type =3D V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS;
> +		*flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
> =C2=A0	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
> =C2=A0		*type =3D V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR;
> =C2=A0		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index f84ed133a6c9..e9f1fcc4f840 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2099,6 +2099,8 @@ struct v4l2_ctrl_mpeg2_quantisation {
> =C2=A0#define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_STATELE=
SS_BASE + 405)
> =C2=A0#define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_STATELES=
S_BASE + 406)
> =C2=A0#define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC=
_STATELESS_BASE + 407)
> +#define V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS=C2=A0 (V4L2_CID_CODEC_STA=
TELESS_BASE + 408)
> +#define V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS=C2=A0 (V4L2_CID_CODEC_STA=
TELESS_BASE + 409)
> =C2=A0
> =C2=A0enum v4l2_stateless_hevc_decode_mode {
> =C2=A0	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
> @@ -2554,6 +2556,65 @@ struct v4l2_ctrl_hevc_scaling_matrix {
> =C2=A0	__u8	scaling_list_dc_coef_32x32[2];
> =C2=A0};
> =C2=A0
> +#define V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED	0x1
> +
> +/*
> + * struct v4l2_ctrl_hevc_ext_sps_st_rps - HEVC short term RPS parameters
> + *
> + * Dynamic size 1-dimension array for short term RPS. The number of elem=
ents
> + * is v4l2_ctrl_hevc_sps::num_short_term_ref_pic_sets. It can contain up=
 to 65 elements.
> + *
> + * @delta_idx_minus1: Specifies the delta compare to the index. See deta=
ils in section 7.4.8
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Short-term reference picture=
 set semantics" of the specification.
> + * @delta_rps_sign: Sign of the delta as specified in section 7.4.8 "Sho=
rt-term reference picture
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set semantics" of the specification.
> + * @abs_delta_rps_minus1: Absolute delta RPS as specified in section 7.4=
.8 "Short-term reference
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pictu=
re set semantics" of the specification.
> + * @num_negative_pics: Number of short-term RPS entries that have pictur=
e order count values less
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 than the picture order =
count value of the current picture.
> + * @num_positive_pics: Number of short-term RPS entries that have pictur=
e order count values
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 greater than the pictur=
e order count value of the current picture.
> + * @used_by_curr_pic: Bit j specifies if short-term RPS j is used by the=
 current picture.
> + * @use_delta_flag: Bit j equals to 1 specifies that the j-th entry in t=
he source candidate
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 short-term RPS is included in this candid=
ate short-term RPS.
> + * @delta_poc_s0_minus1: Specifies the negative picture order count delt=
a for the i-th entry in
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the short-t=
erm RPS. See details in section 7.4.8 "Short-term reference
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture set=
 semantics" of the specification.
> + * @delta_poc_s1_minus1: Specifies the positive picture order count delt=
a for the i-th entry in
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the short-t=
erm RPS. See details in section 7.4.8 "Short-term reference
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture set=
 semantics" of the specification.
> + * @flags: See V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_{}
> + */
> +struct v4l2_ctrl_hevc_ext_sps_st_rps {
> +	__u8	delta_idx_minus1;
> +	__u8	delta_rps_sign;
> +	__u8	num_negative_pics;
> +	__u8	num_positive_pics;
> +	__u32	used_by_curr_pic;
> +	__u32	use_delta_flag;
> +	__u16	abs_delta_rps_minus1;
> +	__u16	delta_poc_s0_minus1[16];
> +	__u16	delta_poc_s1_minus1[16];
> +	__u16	flags;
> +};
> +
> +#define V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT		0x1
> +
> +/*
> + * struct v4l2_ctrl_hevc_ext_sps_lt_rps - HEVC long term RPS parameters
> + *
> + * Dynamic size 1-dimension array for long term RPS. The number of eleme=
nts
> + * is v4l2_ctrl_hevc_sps::num_long_term_ref_pics_sps. It can contain up =
to 65 elements.
> + *
> + * @lt_ref_pic_poc_lsb_sps: picture order count modulo MaxPicOrderCntLsb=
 of the i-th candidate
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 long-term reference picture.
> + * @flags: See V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_{}
> + */
> +struct v4l2_ctrl_hevc_ext_sps_lt_rps {
> +	__u16	lt_ref_pic_poc_lsb_sps;
> +	__u16	flags;
> +};
> +
> =C2=A0/* Stateless VP9 controls */
> =C2=A0
> =C2=A0#define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index add08188f068..5efaeb74ef92 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1985,6 +1985,8 @@ enum v4l2_ctrl_type {
> =C2=A0	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	=3D 0x0272,
> =C2=A0	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	=3D 0x0273,
> =C2=A0	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	=3D 0x0274,
> +	V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS	=3D 0x0275,
> +	V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS	=3D 0x0276,
> =C2=A0
> =C2=A0	V4L2_CTRL_TYPE_AV1_SEQUENCE	=C2=A0=C2=A0=C2=A0 =3D 0x280,
> =C2=A0	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY =3D 0x281,

--=-0WOX6arl3pyKCkGh380M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW1WIgAKCRDZQZRRKWBy
9K+/AP4/85r7f6ijf07MKi30aw1ePkWza2QyOddebctYrp1Q3QEA5wwWjt71pG1x
vp3dUt4ps6kQN83KNX4ksorDLn2blAQ=
=W+A5
-----END PGP SIGNATURE-----

--=-0WOX6arl3pyKCkGh380M--

