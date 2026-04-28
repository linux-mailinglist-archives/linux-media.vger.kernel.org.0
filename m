Return-Path: <linux-media+bounces-59892-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAjGFnoT8WlZcwEAu9opvQ
	(envelope-from <linux-media+bounces-59892-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:07:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A616748B72B
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 22:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A775230554B4
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 20:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5C93C7E0B;
	Tue, 28 Apr 2026 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RGv6v9ku"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357C37DEAE;
	Tue, 28 Apr 2026 20:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406838; cv=none; b=qh5MSG7ZUs33zyznYAQIjC9Gdyzgg4vAgYg71iUbaf0Z1f4+R20aOXLA52TOWQEFE8XL0bfUa+G5/fPjoePujAC26JkYVW05qrLB6XaeSSDHIMmJ6ph+m2kPyrBqBZO2QBdI+IWJMW1r3eVjQ61GbPynJBW5E6virjc6nUY+3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406838; c=relaxed/simple;
	bh=Ev8aX7stxAx9Q7bxIzYbAML6rU3CMkG5o51TUX4ilvg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JKRnFeeEsfMME6i34u83gryOavS1H16OB7WH3anKdf7GAqFej1kwbqStz4Lc2DHaoPQmMXHx7hA/NDnXrvNzZc3PDr1Qsgm1sSJAqQqHO1W5GVDJ8ZAgdfHRlx7ixdZrkl9Ou05SaDtzdc/MN7rPTM3Jtc4HTHQvBB3pyQbhJPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RGv6v9ku; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777406834;
	bh=Ev8aX7stxAx9Q7bxIzYbAML6rU3CMkG5o51TUX4ilvg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RGv6v9kuSEWj255hrs2/XxoBNOIndWTlAqF19bOAkE5QfhY35+T42ka4z+nV73Gz5
	 no0Ua2ivRTaBBrjB76rJJUxWHyqymsoGY8wq2MY/matZeHE9VM/jDXCIJk+X6Grib1
	 2V1ZkR8c1svVqiYRsDIm+RiQc44Pz2ebsnnc2Uk6G90xN8ZIsknQvtm21QV+p7Or5V
	 wGwjAkZt7E1P9gXNaUt3NjbimQSFvvahaO2vqGp79SAZ8NSsXg6dwu0RlMPNtiYFQy
	 9mclmS0+nc45vjs3SpkM/rUqoLTdCIjZEdWun9wZimShBe4KY2DuG6jVeccK7ycn0I
	 5osI5H2MJ718A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1B5F17E1513;
	Tue, 28 Apr 2026 22:07:12 +0200 (CEST)
Message-ID: <9be87e9d1f24d67423d2062bd2e31284773fd286.camel@collabora.com>
Subject: Re: [PATCH v6 1/6] docs: uapi: media: Clarify HEVC slice_param
 bit_size, data_byte_offset
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Laurent Pinchart	
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>,  Dom Cobley <dom@raspberrypi.com>, review list
 <kernel-list@raspberrypi.com>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 28 Apr 2026 16:07:11 -0400
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-1-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
	 <20260304-media-rpi-hevc-dec-v6-1-93868ae6dff8@raspberrypi.com>
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
	protocol="application/pgp-signature"; boundary="=-7EA+qBz5VcXUAxImbcuP"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: A616748B72B
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
	TAGGED_FROM(0.00)[bounces-59892-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[kynesim.co.uk,gmx.net,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]


--=-7EA+qBz5VcXUAxImbcuP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 mars 2026 =C3=A0 14:05 +0000, Dave Stevenson a =C3=A9crit=C2=
=A0:
> From: John Cox <john.cox@raspberrypi.com>
>=20
> Clarify exactly what bit_size and data_byte_offset mean when there are
> multiple slices in the bitstream data.
>=20
> Signed-off-by: John Cox <john.cox@raspberrypi.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst=
 | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index 3b1e05c6eb13..a54e8ea29440 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -2399,10 +2399,12 @@ This structure contains all loop filter related p=
arameters. See sections
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 * - __u32
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``bit_size``
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Size (in bits) of the current slice dat=
a.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Size in bits of the slice_segment_data =
for the current slice including
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 any emulation prevention byte=
s.
> =C2=A0=C2=A0=C2=A0=C2=A0 * - __u32
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``data_byte_offset``
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Offset (in byte) to the video data in t=
he current slice data.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Offset in bytes from the start of the c=
urrent v4l2_buffer to the start
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of the slice_segment_data for=
 the current slice.
> =C2=A0=C2=A0=C2=A0=C2=A0 * - __u32
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ``num_entry_point_offsets``
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Specifies the number of entry poin=
t offset syntax elements in the slice header.

--=-7EA+qBz5VcXUAxImbcuP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafETbwAKCRDZQZRRKWBy
9Ap+AQDAwcqqlDsM/bas7xT/tgtXpUgO0TPivPBSGOOaKMBRrQEAzzS8JahEFtdO
ikRTjkOUHBpaoCFYVemwuzPvOAAutgc=
=Yyrz
-----END PGP SIGNATURE-----

--=-7EA+qBz5VcXUAxImbcuP--

