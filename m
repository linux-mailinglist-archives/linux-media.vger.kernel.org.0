Return-Path: <linux-media+bounces-56529-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHxjAABMvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56529-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:30:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F052DB00C
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74383305F496
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDC8366567;
	Fri, 20 Mar 2026 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mqU8gby1"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01EA346E43;
	Fri, 20 Mar 2026 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013109; cv=none; b=IwvbJYRaf8qWbswt7sjZ6n/b+7I3HvLwFWLbRbMDKc/kiO/CjHzbI9NzrQ4+IiKMLvycgbS9PuNAyvocspXsXv8z1LzuCubQ56AhRAUCUk0PMJoZXCFlpYh7XxvMtYlZ+WAVAHka3ZJwpQNTsATcjWOxKeCm6boYQy51ux4utaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013109; c=relaxed/simple;
	bh=jKbYNswxjOeamgZTlj4F64E0aPg8AsoGXFGTbWuoPjM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bXFxhvVpgSiXjeACJrSUDaMBpkSTXLpWFrmjYleLPATA/kEZ/5xDfVhMk4heWpzYgnTwjKzRx2AfUcQFbQ3hxJFJr8Gj1LFDaTUSqr0WUGQainlMpKJwznwFi4KjK84/GmG5Uz6fb3G0LPlKEKIInBt+W2d+T+//4/cQSFFfZzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mqU8gby1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774013106;
	bh=jKbYNswxjOeamgZTlj4F64E0aPg8AsoGXFGTbWuoPjM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=mqU8gby1IR1X4VhbqZKmVOtUmil1GcTh8rKwmXgWixWoZPmKmBqgjBx57xFwQt9In
	 J+iJd6Bq7pmVu5HyPg6qz9hvAFxVmELH9eQVS9IcV/kro594A29HyjQc/AzfJOWsq+
	 U10unWS1Jrp/dcX+35yWJfGoB8Jd2eTpkzt5qaHSsLXggjk8dobZo9phyhIPYSlsQx
	 EhfTIa5xuqt/CRFhkhyo27AINBZCo+PONJbJ5xbcfjkuDEYGwSsd/cZnQE7R6rEhAc
	 rV8u7bT0wNcuRz493GRkbZNG+R+UDqsz8pzQDgj7OCK+kf5722os/KQ53BUuJt7VnG
	 ZVGZUEDSpDr3Q==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D79B417E026C;
	Fri, 20 Mar 2026 14:25:03 +0100 (CET)
Message-ID: <7f488608508e8a6368117270191c1c9ace36ddbb.camel@collabora.com>
Subject: Re: [PATCH v0 1/3] media: chips-media: wave5: Add Support for
 Background Detection
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>, "mchehab@kernel.org"	
 <mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>,  "bob.beckett@collabora.com"	
 <bob.beckett@collabora.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>,  "b-brnich@ti.com"	
 <b-brnich@ti.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung	
 <nas.chung@chipsnmedia.com>
Date: Fri, 20 Mar 2026 09:25:00 -0400
In-Reply-To: <PU4P216MB1149773711B9A9E0642D0945ED4CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
	 <20260319053210.90-2-jackson.lee@chipsnmedia.com>
	 <PU4P216MB1149773711B9A9E0642D0945ED4CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="=-wyqkt1SsmgPTN6mxqb08"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	TAGGED_FROM(0.00)[bounces-56529-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[chipsnmedia.com,kernel.org,xs4all.nl,collabora.com];
	HAS_ORG_HEADER(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:mid,gitlab.freedesktop.org:url,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 61F052DB00C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--=-wyqkt1SsmgPTN6mxqb08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 20 mars 2026 =C3=A0 06:37 +0000, jackson.lee a =C3=A9crit=C2=A0=
:
> Hi Nicolas
>=20
> I got the message below from the CI robot.
> But in v4l2-controls.h, none of the defined strings include spaces around=
 "+".
> Can I ignore this warning?
>=20
>=20
> # Test checkpatch:./0001-media-chips-media-wave5-Add-Support-for-Backgrou=
nd-D.patch checkpatch
> CHECK: spaces preferred around that '+' (ctx:VxV)
> #134: FILE: include/uapi/linux/v4l2-controls.h:467:
> +#define=20
> +V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION(V4L2_CID_CODEC_BASE+238)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
>=20

Actually, the older definitions don't, the newer definitions do. Please ado=
pt
the CI suggestion, I'll add to my todo to fix them all in separate thread.

regards,
Nicolas

> total: 0 errors, 0 warnings, 1 checks, 81 lines checked
>=20
>=20
>=20
> Please fix your series, and upload a new version. If you have a patchwork=
 account, do not forget to mark the current series as Superseded.
>=20
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/956503=
11/artifacts/report.htm=C2=A0.
>=20
>=20
>=20
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>=20
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>=20
> If you believe that the CI is wrong, kindly open an issue at https://gitl=
ab.freedesktop.org/linux-media/media-ci/-/issues=C2=A0or reply-all to this =
message.
>=20
> > +#define V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION
> > 	(V4L2_CID_CODEC_BASE+238)
> > +
>=20
> Thanks
> Jackson
>=20
> > =C2=A0/* CIDs for the MPEG-2 Part 2 (H.262) codec */
> > =C2=A0#define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL
> > 	(V4L2_CID_CODEC_BASE+270)
> > =C2=A0enum v4l2_mpeg_video_mpeg2_level {
> > --
> > 2.43.0

--=-wyqkt1SsmgPTN6mxqb08
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab1KrQAKCRDZQZRRKWBy
9F/4AQDr5jnRg253NsE9jFM1sMSXubtDCrWtU06noL52KeNTdgEAwUNlJotTeK/x
jKOwARLqOQtGVa1F4k+xoXRbKwnw5AU=
=pIum
-----END PGP SIGNATURE-----

--=-wyqkt1SsmgPTN6mxqb08--

