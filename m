Return-Path: <linux-media+bounces-56735-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHOzAl1FwWnpRwQAu9opvQ
	(envelope-from <linux-media+bounces-56735-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:51:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F92F358E
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 14:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96578303F57D
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE73E3AC0E5;
	Mon, 23 Mar 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V6DvAwJ3"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B513AC0FD;
	Mon, 23 Mar 2026 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273326; cv=none; b=sMhtuwyCeFJ5t3Be1KOVijiAzcY7s0GuEx6mbsAR7gfqQuDFDPImjieujj85Y8jGYsMoPxjWewHybCQXlfwtCkNkE0ZIHTNKYZec4xqfu8n2gDvur8BmDZ4N09XL/JpSESeFsClO+DMai796BRXpfuTK6Rs+1JJT/McnnLpoWgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273326; c=relaxed/simple;
	bh=OqmswK9nIqVz5iZLsbtJR2YKMQstyph9IbHD6MC5h18=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LZKFtlgNpN2EGUyg2kMCr9luXBA8xO8Zn6IkDDv2bcp+pF5qvQm8Z5lnYwEiTUOqsBF+vunufHYEkVJSNF1PDrxtbkM9AzR4OQJbQO1nvnVLnF7A22LDu8qjLDQoSP+DbXofHibcRHx/El1eOE93i9KZ7Flt7XJNnTHXb41+4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V6DvAwJ3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774273322;
	bh=OqmswK9nIqVz5iZLsbtJR2YKMQstyph9IbHD6MC5h18=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=V6DvAwJ3homSxcyM7kU5kLlmNYrEqFIsHp1Ab371rN5AiVCVsMu1oMEdRE5BXF3UB
	 Ypv0EUcowfDWv2CDZ6az96aAxyQDOYG6Th6pZ+0Hs1Vh/BvoCU5zFO/2+o+A2+2lrl
	 Uy6x8jSMVjFjLN3+998SePMHjfopNFhNz4iusbZYaRlEv0GfkOE8ns7O4R9bznDiWf
	 adNdWx5Zly/uydIxPOdgxzRyUfmfsmLUtmPexTq5K0fHxX/JiITTfShqZancke50Hm
	 18HbWCGEJxbTQIVbdnmKhnoYxJUpM+DzzGiB2L57dbDBIA9CLbkp+L/BtB85ncqOWJ
	 rwsT/f5s+aJzA==
Received: from [IPv6:2606:6d00:15:e06b::5ac] (unknown [IPv6:2606:6d00:15:e06b::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66A5B17E36C2;
	Mon, 23 Mar 2026 14:42:01 +0100 (CET)
Message-ID: <176cfd181e783d2b24fad1a2c7b18425374b4622.camel@collabora.com>
Subject: Re: [PATCH v2] media: v4l2-ctrls: validate HEVC slice reference
 lists
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, mchehab@kernel.org
Cc: hverkuil@kernel.org, sakari.ailus@linux.intel.com, 
	laurent.pinchart@ideasonboard.com, opensource206@gmail.com, 
	jernej.skrabec@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 23 Mar 2026 09:41:58 -0400
In-Reply-To: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
References: <20260323083031.30941-1-pengpeng@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-foqRranGiZytQIsq4ef3"
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56735-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,ideasonboard.com,gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 6F8F92F358E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-foqRranGiZytQIsq4ef3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 23 mars 2026 =C3=A0 16:30 +0800, Pengpeng Hou a =C3=A9crit=C2=A0:
> HEVC slice parameters are shared stateless V4L2 controls, but the common
> control validation path currently does not verify the active reference
> counts or the ref_idx_l0/ref_idx_l1 entries before driver-specific code
> uses them to index fixed 16-entry DPB arrays.
>=20
> The original report was triggered by Cedrus, but the missing validation
> is not Cedrus-specific. Move the bounds checks into the common HEVC slice
> control validation path so every stateless HEVC driver gets the same
> basic guarantees as soon as the control is queued.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> v2:
> - move the validation from Cedrus-specific try_ctrl() into
> =C2=A0 drivers/media/v4l2-core/v4l2-ctrls-core.c
> - keep the checks limited to HEVC slice reference counts and indices
>=20
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c | 24 ++++++++++++++++++++=
+++
> =C2=A01 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 6b375720e395..4e7563c8bf4a 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -1260,6 +1260,30 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> +		p_hevc_slice_params =3D p;
> +
> +		if (p_hevc_slice_params->num_ref_idx_l0_active_minus1 >=3D
> +		=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +			return -EINVAL;

Ack.

> +
> +		for (i =3D 0; i <=3D p_hevc_slice_params->num_ref_idx_l0_active_minus1=
;
> +		=C2=A0=C2=A0=C2=A0=C2=A0 i++)
> +			if (p_hevc_slice_params->ref_idx_l0[i] >=3D
> +			=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;

That one is a breaking change since userspace already passes off limit valu=
es
such as 0xff when a reference is missing (was lost). See:

	47825b1646a6a9eca0f90baa3d4f98947c2add96

The hardware may or may not be capable of doing concealment, but with this
change, we bring down all drivers to failing the decode completely.

> +
> +		if (p_hevc_slice_params->slice_type !=3D V4L2_HEVC_SLICE_TYPE_B)
> +			break;
> +
> +		if (p_hevc_slice_params->num_ref_idx_l1_active_minus1 >=3D
> +		=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +			return -EINVAL;

Ack.

> +
> +		for (i =3D 0; i <=3D p_hevc_slice_params->num_ref_idx_l1_active_minus1=
;
> +		=C2=A0=C2=A0=C2=A0=C2=A0 i++)
> +			if (p_hevc_slice_params->ref_idx_l1[i] >=3D
> +			=C2=A0=C2=A0=C2=A0 V4L2_HEVC_DPB_ENTRIES_NUM_MAX)
> +				return -EINVAL;

Same.

cheers,
Nicolas

> =C2=A0		break;
> =C2=A0
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:

--=-foqRranGiZytQIsq4ef3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCacFDJwAKCRDZQZRRKWBy
9JXAAQCms2rvqcuvIHAxB0I9G5VvDbfJAN7tOfkMoYGnXFod2AEA17TBpISGNjZT
llD8rgquch74tnNaJ+w1v9Mk6lczgQY=
=ysQk
-----END PGP SIGNATURE-----

--=-foqRranGiZytQIsq4ef3--

