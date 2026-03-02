Return-Path: <linux-media+bounces-54094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO8ZOW+XpWmPEQYAu9opvQ
	(envelope-from <linux-media+bounces-54094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 14:58:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3061DA3C2
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 14:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75745303B972
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 13:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4457B3E0C6A;
	Mon,  2 Mar 2026 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XIvurVV6"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A36A3CC9EC
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 13:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459713; cv=none; b=oSO16Zf1sXBnBXS4KpXdyZob7T0rG5pK+dJQIJBhuJFTDCzphqVU8Zw+Efbkf6qKgHNczDZBwQ72HM3rAk5kCXHSINW3uWwF7cx2+3Rjaz2akub7d4XX3wJQDEp88oKVw/xYFUzoNnYA0HoICAv5EcA4QlCOSzSbPHg+SozXGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459713; c=relaxed/simple;
	bh=A3kWbDf+XTMiYy5cZ9gez7JIkFWT0d4+Z4h9ALLZX2c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uxgRQBdqUVfDobav7q4AZu0XKRfzRkpUvwe8YVipPFqvJHBlHfIy67JoI9n0eMIcnbCG8n3wJEH3HeC9d4UUzmlY9LJGWTFqcaOhltVP93nNSyHcDPAxwT7Jn3ljOV++4rFOsUxaqECttG9sIZ/0mvHW3pCZKzod9hFDw3vHpXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XIvurVV6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772459710;
	bh=A3kWbDf+XTMiYy5cZ9gez7JIkFWT0d4+Z4h9ALLZX2c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XIvurVV6Y8P5oaJboCzy54WZQjRdZqrE60DnhjjB8P4Kh0gvm+FA2qGUXUBrZ38eX
	 lKmBw8mjQ2fjjT/5Uu+mmazXSqltbb3cKW1dlumE2cntUFUN2cUy+9nTy4aS0Irsxs
	 PC3vd12j58S/CrK1hNqMbGtJlwnTHmYmUa6dGyvtvucCn79eNp2EwlIaNSVnV1UWl/
	 lM7gB8oPIflXqCZ/zR5eNnJN56Ivcj0dTL/Zo4jskYLXggXx/yEiybf0Gn3bhmcE4c
	 U64whPKtXWbk4mqR3LIzEDENZEYv+4mZrU8ijaeVK0bBboNUYdr7jAQSCWdjSKn+Fq
	 0BP5DkRb4e3xA==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAEE117E0451;
	Mon,  2 Mar 2026 14:55:07 +0100 (CET)
Message-ID: <77aff6321715c2141257d1f114c6bd70c7ac2d29.camel@collabora.com>
Subject: Re: [ANN] Media Summit on May 26th in Nice, France
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil
	 <hverkuil+cisco@kernel.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Tomi
 Valkeinen	 <tomi.valkeinen@ideasonboard.com>, Alain Volmat
 <alain.volmat@foss.st.com>,  Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Michael Tretter <m.tretter@pengutronix.de>,
  Tomasz Figa <tfiga@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Steve Cho <stevecho@chromium.org>,  Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Kevin Hilman <khilman@baylibre.com>,
 Paul Kocialkowski	 <paulk@sys-base.io>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Hans de Goede <hansg@kernel.org>, Maxime
 Ripard <mripard@kernel.org>
Date: Mon, 02 Mar 2026 08:55:05 -0500
In-Reply-To: <20260301150259.GD2860169@killaraus.ideasonboard.com>
References: <92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org>
		 <2f0c3f41-93fa-4a1f-aad2-b59ebbc59909@kernel.org>
		 <20260301150259.GD2860169@killaraus.ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-RFUDbGgvkJ9ZEBJj9rBc"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54094-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B3061DA3C2
X-Rspamd-Action: no action


--=-RFUDbGgvkJ9ZEBJj9rBc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le dimanche 01 mars 2026 =C3=A0 16:02 +0100, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> I would also like to revive efforts to properly support dmabuf import
> for multi-planar formats with configurable plane offsets (a.k.a. data
> offsets), but I think this requires a champion to resume the work more
> than a discussion at the media summit.

I haven't sent my RFC yet about that subject, that will probably be after
Embedded World. But I think it can serve as example of "possible" way forwa=
rd.
And I believe the ChromeOS request should be cited. I think we need more th=
en a
champion to resume the work, since I personally don't believe in the ancien=
t
proposal from Collabora. I'd say plan for a little more time on this subjec=
t.

If possible, I would like to add to the agenda a short update related to Vu=
lkan
Video side of CODECs, what are the viable options for Linux Media and what =
is in
preparation outside of our subsystem. The second aspect is informative as t=
hese
discussion don't seem to lean toward our subsystem as the foundation. But I
think its rather useful for everyone to understand why and what is included=
.

regards,
Nicolas

--=-RFUDbGgvkJ9ZEBJj9rBc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaaWWuQAKCRDZQZRRKWBy
9N2YAPwL4oJTtDNn/w8siDZOqo4YMAqFwh85FSxKtA+ZryXwoQD/fTXmZAfIGqBE
+VtaP4XPW9VUfKrLTOv+3ODGMEWbTgs=
=0KKU
-----END PGP SIGNATURE-----

--=-RFUDbGgvkJ9ZEBJj9rBc--

