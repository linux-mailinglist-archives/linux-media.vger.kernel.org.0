Return-Path: <linux-media+bounces-50990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8EDD39A0E
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 22:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83C3F300B817
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 21:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC5929B8C7;
	Sun, 18 Jan 2026 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AgBrNLoa"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF42264AA;
	Sun, 18 Jan 2026 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768772943; cv=none; b=VZCKMyOqySjPwKNz84GLCEvCm5bg/AzSM3th6zdj8Pcbk7Iz6ZJ5Sngyg3kJ5QZZKhWA0snMuAmdxKVHmohMexAG6vWRz6CDSavmizpHnheUTRnw4w5Ubr8S/++75mPXWs+lS+1AjU6b43ebh1O5LZxIG0Uqkh07Fe2heVjg+sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768772943; c=relaxed/simple;
	bh=0TY5m9TLSwL0MRwNdF7+c6NA8pN15cTegL3Hsrdt7FU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HCsHi4NO9JSgEbSRMo4nD86zGhJlHAk7sqRvEQjilWouCiNfzx0RHPUOO7wvQJ00/UBJqSvcHst9Jf+Om4pQ82shR9+FGQVjBp5yp1Sa+qZ4+JbkZLYdQ9YcTt1s6RZ4DsdSixAN9DFhJp7/LOYdv8R8pABEeqFaK3H4QaHqt7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AgBrNLoa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768772934;
	bh=0TY5m9TLSwL0MRwNdF7+c6NA8pN15cTegL3Hsrdt7FU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AgBrNLoaCnaPPhvtzcRM8PRiijRqYnz6MeH4XSoEFpZm/YrMPrK4Z3xrD3gOmz/Y0
	 LiQlT1kelDQv6kSKvmXW+nmom1dT1oV6cIrZw6fxdKxrhgrefiuYjnu/zDhWZAsoex
	 E5tQ48lQrks42sO7mTtEqPNTyNjlDNFS7jSG7Tr9GuwQQLu8WJRb+ZdNEUDUMbq0NI
	 TzjJMxXhj4thVkQaa45Am+iSSWxWK1C/8Mvm00MEZeGiIs7myLGTCZuYR3222dkRkD
	 yHxuo2LIwfikucMUPtQ4qat3QnEGiwrCle9I9sUB0B6WswvjenjcLq2iBgeWHLPRLX
	 nqiu/i8WyC9VA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3614A17E1317;
	Sun, 18 Jan 2026 22:48:52 +0100 (CET)
Message-ID: <7b8e631d6d0dcbd7c91a6a6e64253e86697938e3.camel@collabora.com>
Subject: Re: [PATCH v8 01/17] media: uapi: HEVC: Add
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
 kernel@collabora.com, Jonas Karlman	 <jonas@kwiboo.se>, Diederik de Haas
 <didi.debian@cknow.org>
Date: Sun, 18 Jan 2026 16:48:48 -0500
In-Reply-To: <20260109161538.1294449-2-detlev.casanova@collabora.com>
References: <20260109161538.1294449-1-detlev.casanova@collabora.com>
	 <20260109161538.1294449-2-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-j+lFaBhyn+ny8nbt74FY"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-j+lFaBhyn+ny8nbt74FY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 09 janvier 2026 =C3=A0 11:15 -0500, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need to fully parse
> the slice header, which cannot be passed with the current controls.
> There is also no skip method similar as to what can be found in
> verisilicon HW.
>=20
> The SPS is therefore extended through these 2 new controls, providing the
> long and short term reference information from the slice header for HEVC
> decoding.
>=20
> These now controls are similar as what is passed in the Vulkan Video API
> with the StdVideoH265ShortTermRefPicSet and StdVideoH265LongTermRefPicsSp=
s
> structures embedded in the SPS struct.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../media/v4l/ext-ctrls-codec-stateless.rst=C2=A0=C2=A0 | 120 +++++=
+++++++++++++
> =C2=A0.../media/v4l/videodev2.h.rst.exceptions=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> =C2=A0.../media/v4l/vidioc-queryctrl.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 ++
> =C2=A03 files changed, 134 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index 497ae74379f6..3b1e05c6eb13 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -2959,6 +2959,126 @@ This structure contains all loop filter related p=
arameters. See sections
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000004
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> =C2=A0
> +``V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS (struct)``
> +=C2=A0=C2=A0=C2=A0 Subset of the :c:type:`v4l2_ctrl_hevc_sps` control.
> +=C2=A0=C2=A0=C2=A0 It extends it with the list of Long-term reference se=
ts parameters.
> +=C2=A0=C2=A0=C2=A0 These parameters are defined according to :ref:`hevc`=
.
> +=C2=A0=C2=A0=C2=A0 They are described in section 7.4.3.2.1 "General sequ=
ence parameter set
> +=C2=A0=C2=A0=C2=A0 RBSP semantics" of the specification.
> +=C2=A0=C2=A0=C2=A0 This control is a dynamically sized 1-dimensional arr=
ay.
> +=C2=A0=C2=A0=C2=A0 The values in the array should be ignored when either
> +=C2=A0=C2=A0=C2=A0 num_long_term_ref_pics_sps is 0 or the
> +=C2=A0=C2=A0=C2=A0 V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT flag is=
 not set in
> +=C2=A0=C2=A0=C2=A0 :c:type:`v4l2_ctrl_hevc_sps`.
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
> +=C2=A0=C2=A0=C2=A0 * - __u16
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
> +=C2=A0=C2=A0=C2=A0 Subset of the :c:type:`v4l2_ctrl_hevc_sps` control.
> +=C2=A0=C2=A0=C2=A0 It extends it with the list of Short-term reference s=
ets parameters.
> +=C2=A0=C2=A0=C2=A0 These parameters are defined according to :ref:`hevc`=
.
> +=C2=A0=C2=A0=C2=A0 They are described in section 7.4.8 "Short-term refer=
ence picture set
> +=C2=A0=C2=A0=C2=A0 semantics" of the specification.
> +=C2=A0=C2=A0=C2=A0 This control is a dynamically sized 1-dimensional arr=
ay.
> +=C2=A0=C2=A0=C2=A0 The values in the array should be ignored when
> +=C2=A0=C2=A0=C2=A0 num_short_term_ref_pic_sets is 0.
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
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``abs_delta_rps_minus1``
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Absolute delta RPS as specified in sect=
ion 7.4.8 "Short-term reference picture set
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 semantics" of the specificati=
on.
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
> +=C2=A0=C2=A0=C2=A0 * - __u16
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
> index c41693115db6..6182b4e2d2ee 100644
> --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> @@ -150,6 +150,8 @@ replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX :c:=
type:`V4L.v4l2_ctrl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_H264_PRED_WEIGHTS :c:type:`V4L.v4l2_c=
trl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`V4L.v4l2_c=
trl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`V4L.v4l2_=
ctrl_type`
> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS :c:type:`V4L.v4l2_ctrl=
_type`
> +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS :c:type:`V4L.v4l2_ctrl=
_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`V4L.v4l2_ctrl_type`
> =C2=A0replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`V4L.v4l2_c=
trl_type`
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b=
/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index c8baa9430c14..82c8b52e771c 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -531,6 +531,18 @@ See also the examples in :ref:`control`.
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

--=-j+lFaBhyn+ny8nbt74FY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaW1VQAAKCRDZQZRRKWBy
9LtvAQCalMoniWB2OlZ4/UwroyDxulnPQAOwYkuyzjuWHFI/hAD+PKk7FvevuaS0
ikQRbRyGtEZ9uq1briC72tGJz5T8xwY=
=YUsD
-----END PGP SIGNATURE-----

--=-j+lFaBhyn+ny8nbt74FY--

