Return-Path: <linux-media+bounces-52256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNZOMEWohGmI3wMAu9opvQ
	(envelope-from <linux-media+bounces-52256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:25:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B85EF3EB2
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 798DC3016C89
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 14:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741403EFD32;
	Thu,  5 Feb 2026 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iQ2mzybV"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA5A221FCF
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301471; cv=none; b=o03LCvko4SzrCSDobAZSaadWyqx8WL6ONRVYbqAOVSVf0NtEsYr76TQ9eo5UrzaupXO7IODlXiFRgV94H6CsRMOJIzC+bqamwduWoAZrHQXAPXFjf6y6pxusWb66m2oVza/16xtmthOHJXepPb2tDEr/6BHPzoeJtTJ96kOtnS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301471; c=relaxed/simple;
	bh=5jFiY0cPrXV+MkyPAfGA7yuayjrXEnAoF53dOk6Pm1o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aqLzh6pgJoNg+8kf4ch+jYVuqqjVFlw4I47Xl5nzKRUEqpJUo+Lx+fLdRxLhXpg+Upp3jaSdJZAHhkcRSzD/G2gpRbC81FjWPP0lbPEyHVN29Muv1Bh3cLMYwVLhP80Q1Zn9ESQNjDIx75kGN1B1LgJSatcnwnGu0YXDiOSv7SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iQ2mzybV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770301469;
	bh=5jFiY0cPrXV+MkyPAfGA7yuayjrXEnAoF53dOk6Pm1o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iQ2mzybVEkTBCuCVQWOD2vB5Y1F4EFcBjHaESy8S1KWI20+Q+/sZR5MvATahKKwD0
	 GNA0rL8Q1IZIkYbVfLxjmBeX5fjG4A6rpe95Nbi6sHeUwOJVlKRsbtwP2f54O41rlc
	 R4N68wkMKIMUflRd856ebXF3NRz52JYHxOYI3tHgCVth2Lc+VHAt/0bY/hKLD9AXrp
	 eo9iVKS2PqSLUIPdKBSDTFE2UWik3Q3xbd82ObQ2M181LhfW5KkVX/tjBvie5Pq+09
	 nyRJQTte6XHMW5YjdGDrUfnP2cWztDnPScieCXGQEj6wIMBFrwVRnXY77md7Yhjk0M
	 U87wqv0DRhr+g==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C49CD17E00A3;
	Thu,  5 Feb 2026 15:24:28 +0100 (CET)
Message-ID: <444435bf1e67841c49b22cb9b4a41c8c17c710e4.camel@collabora.com>
Subject: Re: [PATCHv7 2/3] docs: media: document Media Maintainers
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Bryan
 O'Donoghue <bryan.odonoghue@linaro.org>, Ricardo Ribalda
 <ribalda@chromium.org>
Date: Thu, 05 Feb 2026 09:24:26 -0500
In-Reply-To: <74976e732f6be2964e0371c73407c9dccf755424.1769511207.git.hverkuil+cisco@kernel.org>
References: <cover.1769511207.git.hverkuil+cisco@kernel.org>
	 <74976e732f6be2964e0371c73407c9dccf755424.1769511207.git.hverkuil+cisco@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-h5klbc5ztkTDcdWOf+bw"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52256-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,ideasonboard.com:email,collabora.com:email,collabora.com:dkim,collabora.com:mid,mess.org:email]
X-Rspamd-Queue-Id: 1B85EF3EB2
X-Rspamd-Action: no action


--=-h5klbc5ztkTDcdWOf+bw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 11:53 +0100, Hans Verkuil a =C3=A9crit=C2=
=A0:
> Document who the Media Maintainers are and what their
> responsibilities are.
>=20
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
> =C2=A0.../media/maintainer-entry-profile.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 47 +++++++++++++++++--
> =C2=A01 file changed, 44 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst =
b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index be4728b97759..4f73ee073860 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -346,13 +346,54 @@ With the pull request workflow, pull requests shall=
 use PGP-signed tags.
> =C2=A0For more details about PGP signing, please read
> =C2=A0Documentation/process/maintainer-pgp-guide.rst.
> =C2=A0
> -Subsystem Media Maintainers
> ----------------------------
> +List of Media Maintainers
> +-------------------------
> =C2=A0
> -The subsystem maintainers are:
> +The Media Maintainers listed here all have patchwork access and can
> +make Pull Requests or have commit rights.
> +
> +The Media Subsystem Maintainers are:
> =C2=A0=C2=A0 - Mauro Carvalho Chehab <mchehab@kernel.org>
> =C2=A0=C2=A0 - Hans Verkuil <hverkuil@kernel.org>
> =C2=A0
> +The Media Core Maintainers are:
> +=C2=A0 - Sakari Ailus <sakari.ailus@linux.intel.com>
> +
> +=C2=A0=C2=A0=C2=A0 - ISP
> +=C2=A0=C2=A0=C2=A0 - sensor drivers
> +=C2=A0=C2=A0=C2=A0 - v4l2-async and v4l2-fwnode core frameworks
> +=C2=A0=C2=A0=C2=A0 - v4l2-flash-led-class core framework
> +
> +=C2=A0 - Mauro Carvalho Chehab <mchehab@kernel.org>
> +
> +=C2=A0=C2=A0=C2=A0 - DVB
> +
> +=C2=A0 - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +=C2=A0=C2=A0=C2=A0 - Media controller drivers
> +=C2=A0=C2=A0=C2=A0 - Core media controller framework
> +
> +=C2=A0 - Hans Verkuil <hverkuil@kernel.org>
> +
> +=C2=A0=C2=A0=C2=A0 - V4L2 drivers
> +=C2=A0=C2=A0=C2=A0 - V4L2 and videobuf2 core frameworks
> +=C2=A0=C2=A0=C2=A0 - HDMI CEC drivers
> +=C2=A0=C2=A0=C2=A0 - HDMI CEC core framework
> +
> +=C2=A0 - Sean Young <sean@mess.org>
> +
> +=C2=A0=C2=A0=C2=A0 - Remote Controller (infrared) drivers
> +=C2=A0=C2=A0=C2=A0 - Remote Controller (infrared) core framework
> +
> +The Media Driver Maintainers responsible for specific areas are:
> +=C2=A0 - Nicolas Dufresne <nicolas.dufresne@collabora.com>
> +
> +=C2=A0=C2=A0=C2=A0 - Codec drivers

I also took care of M2M color converters lately, while trying to delegate w=
hen
it makes sense (such as DWL100 delegated to Laurent). So we may (or may not=
)
add:

       - M2M driver not otherwise delegated

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> +
> +=C2=A0 - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +=C2=A0=C2=A0=C2=A0 - Qualcomm drivers
> +
> =C2=A0Submit Checklist Addendum
> =C2=A0-------------------------
> =C2=A0

--=-h5klbc5ztkTDcdWOf+bw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaYSoGgAKCRDZQZRRKWBy
9AMJAQC8V1y1/ynnxtTCHVwv0mT3Yt13MwuuvvxJvxxPCiIFAgD+O3yARV54CdYp
LH8svz8udM21QF0tFuLrHHf8EX/V2wY=
=rcYy
-----END PGP SIGNATURE-----

--=-h5klbc5ztkTDcdWOf+bw--

