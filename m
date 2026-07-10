Return-Path: <linux-media+bounces-67328-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BRvjGuplUWrzDwMAu9opvQ
	(envelope-from <linux-media+bounces-67328-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:36:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04A73F045
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 23:36:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=IlRps419;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67328-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67328-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4857C30E4DC0
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 21:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A1E3C062C;
	Fri, 10 Jul 2026 21:28:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92353BBA1E;
	Fri, 10 Jul 2026 21:28:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718896; cv=none; b=mau6Ut21WX3R/5591qiQDwmQX3GDk8pJ2tXJ9iIOB7z0sbIel3L9yXKZ/TMtgq6e5b8nSVz4GDePQ/30yoxNL5D2y4lv2CeoGYdwKndOIkORCOoQ+y50MhxcATUehZjad8ik9CYz4fdBfbKL2IrsJNx2mPGEgaRkPWWZtWEMZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718896; c=relaxed/simple;
	bh=/FLJAhf+HrQPx1nb1Lq2j916SVxv3SASnYd4Z4gcWXQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i7tTjC9g168OsC1goeO+S6f+uN22g6w41HHWmAiRDv7YsFFx9/3o2F3Hf4Bg4u7M0+HQ7BC6xq9uXlHjNqY/qAOb/dkhPXVS0I69W9nzVTUbSKBYrGwddYvvdIzezGNKmkDuv1zICvKZmcORBCdhQecotR7JI2On2CNLKc2wK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IlRps419; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783718893;
	bh=/FLJAhf+HrQPx1nb1Lq2j916SVxv3SASnYd4Z4gcWXQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=IlRps4195ioPuhR77He7Agm5J2N8mUoRfqy3CKrjQ/SPvZAm0BFKk7ynTzMekg9RB
	 y4/l+uUm/vsSAoEIx0sBmU7RsGuaQzg+UMSi2WMLM7glUU7i3uFzCMpghPZC5grOSW
	 SlmQ4hnbLd1BXXQr6Te/xmt+7kiEtMZaeR2x67gkOMoUXe/t3Nrvceh8XRKYG3rBYf
	 xYweIL8xRJjpIKIY116SkqXE90cIbxVjESQlpOd+1n47WRxEJ2wl6Uy5X4kdmUnzNO
	 Rrq6mSe2KPkWy66YPKLZW4zdrwkYMzAzHxZilxeiegwFf79W+L7IPjJg2GtqRlmmC+
	 ubsVW08qV+jRQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67A0F17E07A2;
	Fri, 10 Jul 2026 23:28:11 +0200 (CEST)
Message-ID: <8eed484696b34d828d7df92557c30ae5a6343e80.camel@collabora.com>
Subject: Re: [RFC PATCH 1/6] media: mc: Implement shared media graph
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, Paul Elder	
 <paul.elder@ideasonboard.com>, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, 	laurent.pinchart@ideasonboard.com
Cc: xuhf@rock-chips.com, stefan.klug@ideasonboard.com, 
	dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
 sakari.ailus@linux.intel.com
Date: Fri, 10 Jul 2026 17:28:10 -0400
In-Reply-To: <a6a32617-f3c9-4cf2-b020-daecf7ec18f1@collabora.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
	 <20260619052637.1110672-2-paul.elder@ideasonboard.com>
	 <178229758404.3075020.12553514371020830845@ping.linuxembedded.co.uk>
	 <178237578321.292172.5229006087283359591@neptunite.rasen.tech>
	 <a6a32617-f3c9-4cf2-b020-daecf7ec18f1@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-gw40z93wvCRsLGCi92mT"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-67328-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michael.riesch@collabora.com,m:paul.elder@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:xuhf@rock-chips.com,m:stefan.klug@ideasonboard.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:ribalda@chromium.org,m:sakari.ailus@linux.intel.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.dufresne@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,collabora.com:from_mime,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB04A73F045


--=-gw40z93wvCRsLGCi92mT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 10 juillet 2026 =C3=A0 22:42 +0200, Michael Riesch a =C3=A9crit=
=C2=A0:
> Hi Paul,
>=20
> On 6/25/26 10:23, Paul Elder wrote:
> > [...]
> > > > +// TODO figure out locking for when multiple drivers touch the med=
ia graph;
> > > > +// maybe macros for shared versions?
> > >=20
> > > Do you mean for when drivers are trying to change link state directly=
?
> >=20
> > I meant for all the operations that act on media device. I'm not sure w=
hat
> > there is because I didn't really find anything significant, and I found=
 some
> > action point from some meeting notes somewhere that said "deprecate med=
ia_ops"
> > (not assigned to me) so...
>=20
> Oh yes, for some reason this ball ended up in our side of the field. But
> actually I think the media_ops are not much of an issue, as you don't
> set them when you create the shared media device. Problem solved, right?

If we effectively don't need them in any drivers using shared context, let'=
s
find a place to add a BUG_ON.

Nicolas

>=20
> > If there aren't any then it's a non-issue, but if there are then I was
> > wondering if we need to return the shared media device to the driver (a=
s
> > opposed to a non-shared regular media device) and use shared versions o=
f media
> > device functions that have locking.
>=20
> +1
> I would recommend that just to be on the safe side. And I think I would
> make the shared media device an opaque pointer to make sure that there
> won't be any monkey business.
>=20
> Thanks and best regards,
> Michael
>=20
> >=20
> > >=20
> > > > +struct media_device_shared {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct media_device mdev;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head members;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head links;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head list;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct kref refcount;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *removed_device=
;
> > > > +};
> > > > +[...]

--=-gw40z93wvCRsLGCi92mT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalFj6gAKCRDZQZRRKWBy
9JLiAP0UOyPyCM16q6zkWSDCSo9l3pmjTa8NL/r1+uhhmnE//gD/ak5D1OcaSFHo
5DM87seeiJSgCkDLAviyDaSDng88TQk=
=n4/E
-----END PGP SIGNATURE-----

--=-gw40z93wvCRsLGCi92mT--

