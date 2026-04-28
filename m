Return-Path: <linux-media+bounces-59884-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHnwJpYL8Wn1cAEAu9opvQ
	(envelope-from <linux-media+bounces-59884-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:33:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF2748B2C0
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 21:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBA7C30554B8
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 19:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C1C37EFE9;
	Tue, 28 Apr 2026 19:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qUykUPwc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9BA35AC37;
	Tue, 28 Apr 2026 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777404813; cv=none; b=ptUxSnnWBax55mTNEezzo9Ar12kEje06J8e+7LsqkqiXus7pbnhfXE0Agt4YhuUWcYvX5zdf3CLF/n7xgPnJgpzk1RK3JJwOoDiOZV7szmwjQaVQRJuUPzTmhFKVJF1F8h0CBs1SaXQhT+Io2Ypvvucw5CFGZXSR7poartZKPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777404813; c=relaxed/simple;
	bh=2LdnTY48/H/yha0KYzVqcMjcIVLdxMiWb7hNSxtHY+M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SapxV8a+XHnymWcD/+WLdVy/0dZ0KXvQrmLyL53TyV5g7JT2ynVxtVEKZPOw3ql8MGZtoXTkWDDStl2/AwM1tvsP/Mr0xQiYraGaRS/6tNh0VoJiS5jaLohc1vi8Hp2zLgM6ecR9P2C0uy3r9L7gvcEg0eC6lPozVNrxV7ZsY7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qUykUPwc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777404810;
	bh=2LdnTY48/H/yha0KYzVqcMjcIVLdxMiWb7hNSxtHY+M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qUykUPwcCCIPuq7Wqrt85Z/b3AfB+1ST11wPC5r0cdUZ2p31oOZLb2hKK77Mb9x5r
	 V/s6YGZD8qFdlJwoQaoolKEaypjd0Rn7Zsxe42Ma+H8hsET+CSHOasKYdgker9mir1
	 mBDFJvt67LN5/nBXxI9pJidYyftREqKVxymMqkCj/9tDwDMhtkEbFm+0MUqcZGkzcR
	 jujeJdcz55p908BnTLYVyvGVuYaI41R99BoyzYggU+02ClYVLscdN1QSn7PhYqH2lZ
	 A3btaL6ZokckYSowJraz0b/EvgPOK/5yl8l5xcE3Xk96SEC//4PF4mvralVImlZ+2Z
	 1d9j6kANOv3dg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F05617E0ED6;
	Tue, 28 Apr 2026 21:33:27 +0200 (CEST)
Message-ID: <0acd45d0b10ba0f8f8c31ab3d59bb5591be41e96.camel@collabora.com>
Subject: Re: [PATCH 05/11] media: Add missing types to v4l2_ctrl_ptr
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Rostedt	 <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi	 <jacopo.mondi@ideasonboard.com>, Daniel Scally
 <dan.scally@ideasonboard.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, 	kernel@collabora.com
Date: Tue, 28 Apr 2026 15:33:26 -0400
In-Reply-To: <20260212162328.192217-6-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	 <20260212162328.192217-6-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-BWVk2ZDdh0XDsilTNcWN"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 1AF2748B2C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59884-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]


--=-BWVk2ZDdh0XDsilTNcWN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> The v4l2_ctrl_ptr union contains pointers for all control types, but
> v4l2_ctrl_hevc_decode_params and v4l2_ctrl_hevc_scaling_matrix are missin=
g.
>=20
> Add them.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0include/media/v4l2-ctrls.h | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 327976b14d50..a2b4c96a9a6f 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -49,6 +49,8 @@ struct video_device;
> =C2=A0 * @p_hevc_sps:			Pointer to an HEVC sequence parameter
> set structure.
> =C2=A0 * @p_hevc_pps:			Pointer to an HEVC picture parameter
> set structure.
> =C2=A0 * @p_hevc_slice_params:	Pointer to an HEVC slice parameters
> structure.
> + * @p_hevc_decode_params:	Pointer to an HEVC decode parameters
> structure.
> + * @p_hevc_scaling_matrix	Pointer to an HEVC scaling matrix structure.
> =C2=A0 * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level
> structure.
> =C2=A0 * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display
> structure.
> =C2=A0 * @p_area:			Pointer to an area.
> @@ -81,6 +83,8 @@ union v4l2_ctrl_ptr {
> =C2=A0	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> =C2=A0	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> =C2=A0	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> +	struct v4l2_ctrl_hevc_scaling_matrix *p_hevc_scaling_matrix;
> =C2=A0	struct v4l2_ctrl_vp9_compressed_hdr *p_vp9_compressed_hdr_probs;
> =C2=A0	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
> =C2=A0	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;

--=-BWVk2ZDdh0XDsilTNcWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafELhgAKCRDZQZRRKWBy
9Jw1AQCtkGFJo+V/dxiDLgp25Afo2/2Srsfj8WlBLY8Sax0oBAD/VPHQzDb4Kngc
cfQ5FyVVoCgUFbHWqCpU1pyk4dtJBww=
=dk1T
-----END PGP SIGNATURE-----

--=-BWVk2ZDdh0XDsilTNcWN--

