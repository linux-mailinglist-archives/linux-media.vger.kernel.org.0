Return-Path: <linux-media+bounces-48935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2ACC549C
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 23:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7836830019F6
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 22:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F23328B6E;
	Tue, 16 Dec 2025 22:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p46/GdG1"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0932DEA87;
	Tue, 16 Dec 2025 22:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765922567; cv=none; b=Z3BQOn2+dX7k3Ry9wl39QZ+OvxcBNHXI3UFpE0PoKn07bYWoqnrV3QnJg29Zb374lYwJZeYq/xO3Jtp+fkf4Q+fV0pCKtLyLf+PgbhaoJavGZ9uo1oqNFFnjMAgBULtXQ8SoGjfqMF32dQwTuphB9Q3h2zQ2UN5ixgTazj/S9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765922567; c=relaxed/simple;
	bh=v1pRSjTzwbmQL1hsDfF9eqLJi60pl/WRvFfhhQUSjj8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N+CN1MVNyOe6WsSOVYifMS6KJcItc6w6oL5+Z+qVszkwaVxFbpF5TjtFQfN4B2pUR4CNGGm+GaIzQTw5R9NeikoQms5lxA/elqCj2cIJgkSwf+wM6Pd01ICtc0BtMa4UHmJ07IRyx4bFAzSe2mEYTnCXK3Yvs6dNUcjulUCs1gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p46/GdG1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765922563;
	bh=v1pRSjTzwbmQL1hsDfF9eqLJi60pl/WRvFfhhQUSjj8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=p46/GdG1x4W/qnRWPwhZbouSnGZCj3wxbqDjCdH2LryI/gC33rvKZqtTGBxUo/yPJ
	 8QDiWPcndi2DvF0o0n1TFhREuSCLA5t2YvzGbFnEB/but7gw4EwXg4dyXI0FqyN4S8
	 Sn4RxzS80Wiit/L7Aio4I8S8qJ9+X/QuYj7ITUVhr0a+EoCwokCLjsSbdF3L50wfC0
	 pbO6zyYTNBdzknloDXFqW1MZAEGAi2Pp4iOLElL1cJIxX7FZfzeTRi8E6lKqs8jVq3
	 lwXIIminq1LrApT7AVZVArkYAnCpsiUiKXP0uUOEPNPKVnHg0yD51+yt888b03w3T/
	 Ta2vZamQA3GZA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 41DAC17E12FE;
	Tue, 16 Dec 2025 23:02:41 +0100 (CET)
Message-ID: <bcbf8247a778c0a179cef2e0338acb2266c18809.camel@collabora.com>
Subject: Re: [PATCH v5 01/15] media: uapi: HEVC: Add
 v4l2_ctrl_hevc_ext_sps_[ls]t_rps controls
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Date: Tue, 16 Dec 2025 17:02:39 -0500
In-Reply-To: <37da2fe3-41bd-470e-bb6c-93fe35ee1528@collabora.com>
References: <20251023214247.459931-1-detlev.casanova@collabora.com>
	 <20251023214247.459931-2-detlev.casanova@collabora.com>
	 <d8ef0f88-e81d-4159-8945-52197cbc95ba@kernel.org>
	 <37da2fe3-41bd-470e-bb6c-93fe35ee1528@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-j2Yu32W+NlJeaG5ToHIu"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-j2Yu32W+NlJeaG5ToHIu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 16 d=C3=A9cembre 2025 =C3=A0 15:48 -0500, Detlev Casanova a =C3=A9=
crit=C2=A0:
> Hi Hans,
>=20
> On 10/24/25 03:55, Hans Verkuil wrote:
> > On 23/10/2025 23:42, Detlev Casanova wrote:
> > > Some hardware (e.g.: Rockchip's rk3588 hevc decoder) need the
> > > long and short term reference information for HEVC decoding.
> > >=20
> > > Add controls to provide it as the raw data form the stream.
> > >=20
> > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > ---
> > > =C2=A0 .../media/v4l/ext-ctrls-codec-stateless.rst=C2=A0=C2=A0 | 114 =
++++++++++++++++++
> > > =C2=A0 .../media/v4l/videodev2.h.rst.exceptions=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > =C2=A0 .../media/v4l/vidioc-queryctrl.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 ++
> > > =C2=A0 3 files changed, 128 insertions(+)
> > >=20
> > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-st=
ateless.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statele=
ss.rst
> > > index 497ae74379f6..7b18e12fafbb 100644
> > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless=
.rst
> > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless=
.rst
> > > @@ -2959,6 +2959,120 @@ This structure contains all loop filter relat=
ed parameters. See sections
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000004
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -
> > > =C2=A0=20
> > > +``V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS (struct)``
> > > +=C2=A0=C2=A0=C2=A0 Specifies the list of Long-Term reference sets pa=
rameters from the SPS.
> > > +=C2=A0=C2=A0=C2=A0 These parameters are defined according to :ref:`h=
evc`.
> > > +=C2=A0=C2=A0=C2=A0 They are described in section 7.4.3.2.1 "General =
sequence parameter set
> > > +=C2=A0=C2=A0=C2=A0 RBSP semantics" of the specification.
> > > +=C2=A0=C2=A0=C2=A0 This control is a dynamically sized 1-dimensional=
 array,
> > > +=C2=A0=C2=A0=C2=A0 V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set whe=
n using it.
> > I'd drop this last sentence. It suggests that the application has to se=
t it,
> > but is it set by the kernel.
> >=20
> > Same for the next control below.
> >=20
> > I noticed that this is probably a copy-and-paste from the V4L2_CID_STAT=
ELESS_HEVC_SLICE_PARAMS
> > documentation: can you post a separate patch removing that same line fr=
om the description of
> > that control? I think it is a confusing line, and we missed it during t=
he original review
> > of V4L2_CID_STATELESS_HEVC_SLICE_PARAMS.
> >=20
> > I have another question about these two controls: currently dynamic con=
trols have always at
> > least one element. I have been working on supporting zero-sized dynamic=
 controls. Would
> > that make sense here? Or will these two controls - if present - always =
have one element or
> > more?
> >=20
> > If zero-length dynamic array controls are useful here, then I can clean=
 up my patches and
> > post them so you can use it.
>=20
> I guess that could happen depending on what userspace does, but the size=
=20
> of the array is determined by num_long_term_ref_pics_sps and=20
> num_short_term_ref_pic_sets from v4l2_ctrl_hevc_sps respectively.
>=20
> If that value is 0, there is no point in setting the (respective)=20
> control, except for simplifying userspace code I suppose.
>=20
> So 0-length support is avoidable.

With our rule of keeping controls as consistent as possible, we'd need a ze=
ro
length array here since key frame have zero long and short references.

Basically, we should be able to clear that control when
long_term_ref_pics_present_flag is not set, or num_short_term_ref_pic_sets =
is
zero.

Feel free to send an update anyway, since I don't expect Hans to be able to
provide this code now, would have been better to reply earlier. In fact, I =
agree
we can probably move on without the zero-length immediately added and add i=
t
later.

Before going that route, how big are these two arrays ? Short term can be 6=
4
ref, long term 32, how big in bytes that is ? Was is worth goign with dynam=
ic
array ? Its not like slices, where we can have 600 or more.

Nicolas

>=20
> Detlev.
>=20
> > Regards,
> >=20
> > 	Hans
> >=20
> > > +
> > > +.. c:type:: v4l2_ctrl_hevc_ext_sps_lt_rps
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_lt_rps
> > > +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> > > +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> > > +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 =
2
> > > +
> > > +=C2=A0=C2=A0=C2=A0 * - __u16
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``lt_ref_pic_poc_lsb_sps``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Long term reference picture order c=
ount as described in section 7.4.3.2.1
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "General sequence paramet=
er set RBSP semantics" of the specification.
> > > +=C2=A0=C2=A0=C2=A0 * - __u8
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``flags``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - See :ref:`Extended Long-Term RPS Fl=
ags <hevc_ext_sps_lt_rps_flags>`
> > > +
> > > +.. _hevc_ext_sps_lt_rps_flags:
> > > +
> > > +``Extended SPS Long-Term RPS Flags``
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table::
> > > +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> > > +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> > > +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 =
2
> > > +
> > > +=C2=A0=C2=A0=C2=A0 * - ``V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000001
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies if the long-term referenc=
e picture is used 7.4.3.2.1 "General sequence parameter
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set RBSP semantics" of th=
e specification.
> > > +
> > > +``V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS (struct)``
> > > +=C2=A0=C2=A0=C2=A0 Specifies the list of Short-Term reference sets p=
arameters from the SPS.
> > > +=C2=A0=C2=A0=C2=A0 These parameters are defined according to :ref:`h=
evc`.
> > > +=C2=A0=C2=A0=C2=A0 They are described in section 7.4.8 "Short-term r=
eference picture set
> > > +=C2=A0=C2=A0=C2=A0 semantics" of the specification.
> > > +=C2=A0=C2=A0=C2=A0 This control is a dynamically sized 1-dimensional=
 array,
> > > +=C2=A0=C2=A0=C2=A0 V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set whe=
n using it.
> > > +
> > > +.. c:type:: v4l2_ctrl_hevc_ext_sps_st_rps
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table:: struct v4l2_ctrl_hevc_ext_sps_st_rps
> > > +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> > > +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> > > +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 =
2
> > > +
> > > +=C2=A0=C2=A0=C2=A0 * - __u8
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_idx_minus1``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the delta compare to the =
index. See details in section 7.4.8 "Short-term
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reference picture set sem=
antics" of the specification.
> > > +=C2=A0=C2=A0=C2=A0 * - __u8
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_rps_sign``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Sign of the delta as specified in s=
ection 7.4.8 "Short-term reference picture set
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 semantics" of the specifi=
cation.
> > > +=C2=A0=C2=A0=C2=A0 * - __u16
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``abs_delta_rps_minus1``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Absolute delta RPS as specified in =
section 7.4.8 "Short-term reference picture set
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 semantics" of the specifi=
cation.
> > > +=C2=A0=C2=A0=C2=A0 * - __u8
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``num_negative_pics``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Number of short-term RPS entries th=
at have picture order count values less than the
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture order count value=
 of the current picture.
> > > +=C2=A0=C2=A0=C2=A0 * - __u8
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``num_positive_pics``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Number of short-term RPS entries th=
at have picture order count values greater than the
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture order count value=
 of the current picture.
> > > +=C2=A0=C2=A0=C2=A0 * - __u32
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``used_by_curr_pic``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Bit i specifies if short-term RPS i=
 is used by the current picture.
> > > +=C2=A0=C2=A0=C2=A0 * - __u32
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``use_delta_flag``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Bit i specifies if short-term RPS i=
 is included in the short-term RPS entries.
> > > +=C2=A0=C2=A0=C2=A0 * - __u16
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_poc_s0_minus1[16]``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the negative picture orde=
r count delta for the i-th entry in the short-term RPS.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See details in section 7.=
4.8 "Short-term reference picture set semantics" of the
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specification.
> > > +=C2=A0=C2=A0=C2=A0 * - __u16
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``delta_poc_s1_minus1[16]``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the positive picture orde=
r count delta for the i-th entry in the short-term RPS.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 See details in section 7.=
4.8 "Short-term reference picture set semantics" of the
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specification.
> > > +=C2=A0=C2=A0=C2=A0 * - __u8
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``flags``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - See :ref:`Extended Short-Term RPS F=
lags <hevc_ext_sps_st_rps_flags>`
> > > +
> > > +.. _hevc_ext_sps_st_rps_flags:
> > > +
> > > +``Extended SPS Short-Term RPS Flags``
> > > +
> > > +.. cssclass:: longtable
> > > +
> > > +.. flat-table::
> > > +=C2=A0=C2=A0=C2=A0 :header-rows:=C2=A0 0
> > > +=C2=A0=C2=A0=C2=A0 :stub-columns: 0
> > > +=C2=A0=C2=A0=C2=A0 :widths:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 1 =
2
> > > +
> > > +=C2=A0=C2=A0=C2=A0 * - ``V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC=
_SET_PRED``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - 0x00000001
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies if the short-term RPS is =
predicted from another short term RPS. See details in
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section 7.4.8 "Short-term=
 reference picture set semantics" of the specification.
> > > +
> > > =C2=A0 .. _v4l2-codec-stateless-av1:
> > > =C2=A0=20
> > > =C2=A0 ``V4L2_CID_STATELESS_AV1_SEQUENCE (struct)``
> > > diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.ex=
ceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
> > > index c41693115db6..6182b4e2d2ee 100644
> > > --- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exception=
s
> > > +++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exception=
s
> > > @@ -150,6 +150,8 @@ replace symbol V4L2_CTRL_TYPE_H264_SCALING_MATRIX=
 :c:type:`V4L.v4l2_ctrl_type`
> > > =C2=A0 replace symbol V4L2_CTRL_TYPE_H264_PRED_WEIGHTS :c:type:`V4L.v=
4l2_ctrl_type`
> > > =C2=A0 replace symbol V4L2_CTRL_TYPE_H264_SLICE_PARAMS :c:type:`V4L.v=
4l2_ctrl_type`
> > > =C2=A0 replace symbol V4L2_CTRL_TYPE_H264_DECODE_PARAMS :c:type:`V4L.=
v4l2_ctrl_type`
> > > +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS :c:type:`V4L.v4l2_=
ctrl_type`
> > > +replace symbol V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS :c:type:`V4L.v4l2_=
ctrl_type`
> > > =C2=A0 replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`V4L.v4l2_ctrl_=
type`
> > > =C2=A0 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`V4L.v4l2_ctrl_=
type`
> > > =C2=A0 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`V4L.v=
4l2_ctrl_type`
> > > diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.r=
st b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > > index c8baa9430c14..82c8b52e771c 100644
> > > --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > > +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > > @@ -531,6 +531,18 @@ See also the examples in :ref:`control`.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - A struct :c:type:`v4l2_c=
trl_hevc_decode_params`, containing HEVC
> > > =C2=A0=C2=A0	decoding parameters for stateless video decoders.
> > > +=C2=A0=C2=A0=C2=A0 * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - A struct :c:type:`v4l2_ctrl_hevc_ex=
t_sps_lt_rps`, containing HEVC
> > > +	extended Long-Term RPS for stateless video decoders.
> > > +=C2=A0=C2=A0=C2=A0 * - ``V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS``
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - A struct :c:type:`v4l2_ctrl_hevc_ex=
t_sps_st_rps`, containing HEVC
> > > +	extended Short-Term RPS for stateless video decoders.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * - ``V4L2_CTRL_TYPE_VP9_COMPRESSED_HD=
R``
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - n/a

--=-j2Yu32W+NlJeaG5ToHIu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHXAAAKCRDZQZRRKWBy
9N5pAQDw36UxG6/tFUkRej1+ngQLHpNN64KxopMOLHv6Q/rZZQEAsJCRhm8QdSUp
keRUSwqcponKn9oaTWFDPXPlm167fgM=
=fUye
-----END PGP SIGNATURE-----

--=-j2Yu32W+NlJeaG5ToHIu--

