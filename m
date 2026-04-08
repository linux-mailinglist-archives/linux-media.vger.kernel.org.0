Return-Path: <linux-media+bounces-58283-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MUfCG601mmFHQgAu9opvQ
	(envelope-from <linux-media+bounces-58283-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:02:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 737EC3C3881
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 22:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5368305BA9B
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 20:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D3836F41F;
	Wed,  8 Apr 2026 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ty46K5P2"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0337AA96;
	Wed,  8 Apr 2026 20:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775678518; cv=none; b=ti2aDVBVrHGOgGoLSUgasesDnX191rCYDBbqb9i8frq36WH0qpVE971DwrKxMLPge/EgvCdmE7g3GyGM+woDVHeeA4DQEH5Ye2khLVEO19w9+HDMCVPQwrehMRy8bhWWHusCwAeWTRqdvUkP2WyTofb2bbUIob+x8jE3VmadEu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775678518; c=relaxed/simple;
	bh=TKOGRv83aezUYgRVaCUddSGynEC0PHVtILHJuBVHM+M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hIRBcKw5Q5fySQbfRv6MGn89KZceTkE6gyQU2X8aQje/MAJVHxO6lDIXu27AedtXAqjKTjJWHlFvPkfevy2uvbyyuJRNRh+B4JMD+YfMgQfpzcfCTzj/m+WwDSLmxTqC1sPJf2kD9UYs2vMedZaaWEx6nY3GiafcO1MNjF80g3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ty46K5P2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775678514;
	bh=TKOGRv83aezUYgRVaCUddSGynEC0PHVtILHJuBVHM+M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ty46K5P2M7B//Rz4Qtaz7YXVolOntx0RHmISqN7U+OR886tEP6DHV1WizoImBySH/
	 /Z7kdDuUFr4mh9E9PAmf8ezf4uXv0R+IOuMysZEdO4lyeAw9MzhstSmt+50zGDHGbj
	 cmVC/owu3Igp9/8ZWWtJgB922/5tvyqS+xbCJ7tQERs8Eva5A0ofu06mWtqHDLt+nK
	 zfoIj5ljU186Wd/qkaju0fGnYSUzMghtrmIw0g/2OCEe8o9XZSevG8ILbSmFDsugwt
	 C1Meqbgd6BiC//qwl8YDHxqfPsuUfOj/UIGCNGZI6ImKrjw+Pspl+0yY/CUNKeJBrL
	 5U5NcJXlxg7Lw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C67517E069B;
	Wed,  8 Apr 2026 22:01:53 +0200 (CEST)
Message-ID: <51d6a9672ee95c9e4ded409c65eae339e506d765.camel@collabora.com>
Subject: Re: [PATCH v3] media: v4l2-ctrls: validate HEVC active reference
 counts
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, mchehab@kernel.org
Cc: hverkuil@kernel.org, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, opensource206@gmail.com, 
	jernej.skrabec@gmail.com, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	llvm@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 08 Apr 2026 16:01:52 -0400
In-Reply-To: <20260324031326.7274-1-pengpeng@iscas.ac.cn>
References: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
	 <20260324031326.7274-1-pengpeng@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-1QSFccg8FPtl66oVYiCb"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,ideasonboard.com,gmail.com,intel.com,lists.linux.dev,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58283-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 737EC3C3881
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-1QSFccg8FPtl66oVYiCb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 mars 2026 =C3=A0 11:13 +0800, Pengpeng Hou a =C3=A9crit=C2=A0:
> HEVC slice parameters are shared stateless V4L2 controls, but the common
> validation path does not verify the active L0/L1 reference counts before
> driver-specific code consumes them.
>=20
> The original report came from Cedrus, but the active count bounds are
> not Cedrus-specific. Validate them in the common HEVC slice control path
> so stateless HEVC drivers get the same basic guarantees as soon as the
> control is queued.
>=20
> Do not reject ref_idx_l0/ref_idx_l1 entries here. Existing userspace may
> use out-of-range sentinel values such as 0xff for missing references, and
> some hardware can use that information for concealment. Keep this common
> check limited to the active reference counts.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> v3:
> - add the missing `p_hevc_slice_params` declaration to fix the build brea=
k
> =C2=A0 reported by lkp
> - keep only the active L0/L1 reference count validation in common code
> - drop the ref_idx_l0/ref_idx_l1 rejection per Nicolas Dufresne's review,
> =C2=A0 since existing userspace may use out-of-range sentinel values such=
 as
> =C2=A0 0xff for missing references
>=20
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c | 13 +++++++++++++
> =C2=A01 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-
> core/v4l2-ctrls-core.c
> index 6b375720e395..ba047d7d8601 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -971,6 +971,7 @@ static int std_validate_compound(const struct v4l2_ct=
rl
> *ctrl, u32 idx,
> =C2=A0	struct v4l2_ctrl_hevc_ext_sps_st_rps *p_hevc_st_rps;
> =C2=A0	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> =C2=A0	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> +	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> =C2=A0	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
> =C2=A0	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> =C2=A0	struct v4l2_area *area;
> @@ -1260,6 +1261,18 @@ static int std_validate_compound(const struct v4l2=
_ctrl
> *ctrl, u32 idx,
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> +		p_hevc_slice_params =3D p;
> +
> +		if (p_hevc_slice_params->num_ref_idx_l0_active_minus1 >=3D
> +		=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +			return -EINVAL;
> +
> +		if (p_hevc_slice_params->slice_type !=3D
> V4L2_HEVC_SLICE_TYPE_B)
> +			break;
> +
> +		if (p_hevc_slice_params->num_ref_idx_l1_active_minus1 >=3D
> +		=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +			return -EINVAL;
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:

--=-1QSFccg8FPtl66oVYiCb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCada0MAAKCRDZQZRRKWBy
9EpsAQCOlmewyVjNKASHKbALiVIK0wPX1bQFYP6raNCAGOEZYAD9EuycOjVf8Vko
kr1mXdmVdJR3qUtSqS2M0eAGpB69wgQ=
=Yu9t
-----END PGP SIGNATURE-----

--=-1QSFccg8FPtl66oVYiCb--

