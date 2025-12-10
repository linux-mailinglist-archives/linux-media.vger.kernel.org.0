Return-Path: <linux-media+bounces-48581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DBFCB3E95
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C259A30552E3
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 20:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DC032AAB6;
	Wed, 10 Dec 2025 20:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jYpju2vj"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1B1E7C2E;
	Wed, 10 Dec 2025 20:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765396996; cv=none; b=A85wD01rf94GFuQjkDdOdrT2eUHRThzdZ5QLHfgBUhkSTlYQSyraqVIpTF0x7BpOgFt6wycmmwTYjevp71dWb8CxaNOx/kaIAyDd9P9QhXNRGb8mWQeoJzIuYCW7pb7x9NSKXf+6jiduRIeJwl4LMYKzeWGyM0R8NT09RBiLRjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765396996; c=relaxed/simple;
	bh=oxZ9Rf9flEWYLWdPSQDs1J/cfKmNzjhS77vvCV4E1+c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i/Yq8WF1HWlQMvN7SwFh9rTnNOcdt6LLKjr3nu1qF6ZGN4ITAvgmbEcfPRN6lMARzKhfQwxKtGbLGRl1pQ4t/lgHSugqHXbvUjYOM8cL1DlRAFoDsu3SAOQy6gvXzakaiiI7gcRYO05mpD2DnrPffQZWomh/7wVfSr8VuVc0dgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jYpju2vj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765396990;
	bh=oxZ9Rf9flEWYLWdPSQDs1J/cfKmNzjhS77vvCV4E1+c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jYpju2vjibB7Y+J4wBRFXFXQjRJHfnPAg+0H2Y1aS2FPdxasNxt/LPYeQB+bOJiz0
	 uGZfJ9qHTZ81D4Q0B57pvgT/yaAza176aibaGj01v1zQ2OerdzWNmWzvcgYXOBY6j6
	 OdyG9GB4oAa5eMjIm6lzpqid667O3w8zZBgqAA62uhZvP/u0z4J/RzQyFRkLbwGzYg
	 k3WXxxo9sBpyya2+3VsmtG3Q4OMtaIKdRAaR2me9JoEWeAJqLwsuh/Raz1gqkDKeFh
	 xws7neezvh7m664WQlLyu067IqG7ABn3FwFppfzchXmodsDWxHvahvbQoSV+y5bznY
	 LP/uBR6Q8z8RQ==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDCFB17E12FB;
	Wed, 10 Dec 2025 21:03:08 +0100 (CET)
Message-ID: <a46d28aab764afcf3feab29df0fd1793bfe27c52.camel@collabora.com>
Subject: Re: [PATCH v3 01/15] media: uapi: HEVC: Add
 v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
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
 kernel@collabora.com
Date: Wed, 10 Dec 2025 15:03:06 -0500
In-Reply-To: <20251022162459.271603-2-detlev.casanova@collabora.com>
References: <20251022162459.271603-1-detlev.casanova@collabora.com>
	 <20251022162459.271603-2-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-cvP9oCkd8q02a41q9i/L"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-cvP9oCkd8q02a41q9i/L
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 22 octobre 2025 =C3=A0 12:22 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need the
> long and short term reference information for HEVC decoding.

That's seems a bit short and incomplete. My understanding is that the decod=
er on
this hardware needs to full parse the slice headers, and cannot be passed w=
ith
the slice information. It also does not implement a a skip method similar t=
o
Hantro.

So in short, I think the justification for this API is that these parameter=
s are
needed to fully parse HEVC slice headers. You should perhaps say that simil=
ar
paramters ares passed in Vulkan Video API ?

>=20
> Add controls to provide it as the raw data form the stream.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0.../media/v4l/ext-ctrls-codec-stateless.rst=C2=A0=C2=A0 | 114 +++++=
+++++++++++++
> =C2=A0.../media/v4l/videodev2.h.rst.exceptions=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> =C2=A0.../media/v4l/vidioc-queryctrl.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 ++
> =C2=A03 files changed, 128 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index 0da635691fdc..bb6772cf3cee 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -2958,6 +2958,120 @@ This structure contains all loop filter related p=
arameters. See sections
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000004
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> =C2=A0
> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS (struct)``
> +=C2=A0=C2=A0=C2=A0 Specifies the list of Long-Term reference sets parame=
ters from the SPS.
> +=C2=A0=C2=A0=C2=A0 These parameters are defined according to :ref:`hevc`=
.
> +=C2=A0=C2=A0=C2=A0 They are described in section 7.4.3.2.1 "General sequ=
ence parameter set
> +=C2=A0=C2=A0=C2=A0 RBSP semantics" of the specification.
> +=C2=A0=C2=A0=C2=A0 This control is a dynamically sized 1-dimensional arr=
ay,
> +=C2=A0=C2=A0=C2=A0 V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when us=
ing it.

Can we making a bit clearer that this is a subset of the SPS (perhaps use t=
he
term subset). And this is user to extend another control (mention this othe=
r
control) ?

> +
> +.. c:type:: v4l2_ctrl_hevc_ext_sps_lt_rps
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_lt_rps
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 2
> +
> +=C2=A0=C2=A0=C2=A0 * - __u16
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``lt_ref_pic_poc_lsb_sps``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Long term reference picture order count=
 as described in section 7.4.3.2.1
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "General sequence parameter s=
et RBSP semantics" of the specification.
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``flags``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - See :ref:`Extended Long-Term RPS Flags =
<hevc_ext_sps_lt_rps_flags>`
> +
> +.. _hevc_ext_sps_lt_rps_flags:
> +
> +``Extended SPS Long-Term RPS Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 2
> +
> +=C2=A0=C2=A0=C2=A0 * - ``V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000001
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies if the long-term reference pi=
cture is used 7.4.3.2.1 "General sequence parameter
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set RBSP semantics" of the sp=
ecification.
> +
> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS (struct)``
> +=C2=A0=C2=A0=C2=A0 Specifies the list of Short-Term reference sets param=
eters from the SPS.
> +=C2=A0=C2=A0=C2=A0 These parameters are defined according to :ref:`hevc`=
.
> +=C2=A0=C2=A0=C2=A0 They are described in section 7.4.8 "Short-term refer=
ence picture set
> +=C2=A0=C2=A0=C2=A0 semantics" of the specification.
> +=C2=A0=C2=A0=C2=A0 This control is a dynamically sized 1-dimensional arr=
ay,
> +=C2=A0=C2=A0=C2=A0 V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when us=
ing it.

D=C3=A9j=C3=A0 vue, this is a duplicate right ?

> +
> +.. c:type:: v4l2_ctrl_hevc_ext_sps_st_rps
> +
> +.. cssclass:: longtable
> +
> +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_st_rps
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 2
> +
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_idx_minus1``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the delta compare to the inde=
x. See details in section 7.4.8 "Short-term
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reference picture set semanti=
cs" of the specification.
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_rps_sign``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Sign of the delta as specified in secti=
on 7.4.8 "Short-term reference picture set
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 semantics" of the specificati=
on.
> +=C2=A0=C2=A0=C2=A0 * - __u16
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``abs_delta_rps_minus1``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Absolute delta RPS as specified in sect=
ion 7.4.8 "Short-term reference picture set
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 semantics" of the specificati=
on.
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``num_negative_pics``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Number of short-term RPS entries that h=
ave picture order count values less than the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture order count value of =
the current picture.
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``num_positive_pics``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Number of short-term RPS entries that h=
ave picture order count values greater than the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture order count value of =
the current picture.
> +=C2=A0=C2=A0=C2=A0 * - __u32
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``used_by_curr_pic``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Bit i specifies if short-term RPS i is =
used by the current picture.
> +=C2=A0=C2=A0=C2=A0 * - __u32
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``use_delta_flag``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Bit i specifies if short-term RPS i is =
included in the short-term RPS entries.
> +=C2=A0=C2=A0=C2=A0 * - __u16
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_poc_s0_minus1[16]``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the negative picture order co=
unt delta for the i-th entry in the short-term RPS.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See details in section 7.4.8 =
"Short-term reference picture set semantics" of the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specification.
> +=C2=A0=C2=A0=C2=A0 * - __u16
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_poc_s1_minus1[16]``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the positive picture order co=
unt delta for the i-th entry in the short-term RPS.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See details in section 7.4.8 =
"Short-term reference picture set semantics" of the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specification.
> +=C2=A0=C2=A0=C2=A0 * - __u8
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``flags``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - See :ref:`Extended Short-Term RPS Flags=
 <hevc_ext_sps_st_rps_flags>`
> +
> +.. _hevc_ext_sps_st_rps_flags:
> +
> +``Extended SPS Short-Term RPS Flags``
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::
> +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 2
> +
> +=C2=A0=C2=A0=C2=A0 * - ``V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET=
_PRED``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000001
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies if the short-term RPS is pred=
icted from another short term RPS. See details in
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section 7.4.8 "Short-term ref=
erence picture set semantics" of the specification.
> +
> =C2=A0.. _v4l2-codec-stateless-av1:
> =C2=A0
> =C2=A0``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
> diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.except=
ions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> index 35d3456cc812..1663fdf8444c 100644
> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> @@ -149,6 +149,8 @@ replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:t=
ype:`v4l2_ctrl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_=
type`
> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS :c:type:`v4l2_ctrl_typ=
e`
> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS :c:type:`v4l2_ctrl_typ=
e`
> =C2=A0replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b=
/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 3549417c7feb..128c044d2e3c 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -523,6 +523,18 @@ See also the examples in :ref:`control`.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - A struct :c:type:`v4l2_ctrl_hevc_d=
ecode_params`, containing HEVC
> =C2=A0	decoding parameters for stateless video decoders.
> +=C2=A0=C2=A0=C2=A0 * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - A struct :c:type:`v4l2_ctrl_hevc_ext_sp=
s_lt_rps`, containing HEVC
> +	extended Long-Term RPS for stateless video decoders.
> +=C2=A0=C2=A0=C2=A0 * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - A struct :c:type:`v4l2_ctrl_hevc_ext_sp=
s_st_rps`, containing HEVC
> +	extended Short-Term RPS for stateless video decoders.
> =C2=A0=C2=A0=C2=A0=C2=A0 * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR``
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a

cheers,
Nicolas

--=-cvP9oCkd8q02a41q9i/L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnR+wAKCRDZQZRRKWBy
9MPMAQDcoTk+P34Xm73BGD2Tl6f1iAuB3ncqmUe/ONuRpq1FbQEAnhvBvQOHImBE
rsry5un3vkTSItKdyeKggIDZTROlews=
=IT7M
-----END PGP SIGNATURE-----

--=-cvP9oCkd8q02a41q9i/L--

