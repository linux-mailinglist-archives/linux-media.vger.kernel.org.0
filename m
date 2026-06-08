Return-Path: <linux-media+bounces-64249-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XazuOJomJ2qnsgIAu9opvQ
	(envelope-from <linux-media+bounces-64249-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 22:31:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCBE65A733
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 22:31:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ndufresne-ca.20251104.gappssmtp.com header.s=20251104 header.b=oaSB5aYn;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64249-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64249-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=ndufresne.ca (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DAE331026AB
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 20:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9743E9C36;
	Mon,  8 Jun 2026 20:20:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676273ACEE9
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 20:20:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780950014; cv=none; b=XPbbADtfjEwF1drBDNf2Dc/DX2pPJFyh9pULx3URDTmwomfs4PZthvXD1nfl2Zzdl8iJKq5xkuhenxwAUVyf5jF51kE65mPJU1SDUb/OzlxWIQ8fxJAvZh0G8mA605GpLfSQ/Zbf5gdpwOJNK/1uCwfcCIfQBq/w6YRQzAUz15U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780950014; c=relaxed/simple;
	bh=tzuyC1atyxd9zJrlibRKntcjylXuE+/9E3v4LGDaze4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z8cFTfjf+Ev921WdvhWNu8pXhCEUf2/jlIhkiqotiRpoghLjXcCqNQ9pFczr+kA4UjkG9V0SgfhduHZ9zdCtSraUaPSr8FJ598ViYzdT8/HfxpwJQAFkB6+ue65DO00boHPMWRkEu34jzmeynKyHGPrK6QpMEWBZShuMXetRCH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=oaSB5aYn; arc=none smtp.client-ip=209.85.219.66
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8ce9df4732cso50478456d6.1
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 13:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1780950012; x=1781554812; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tzuyC1atyxd9zJrlibRKntcjylXuE+/9E3v4LGDaze4=;
        b=oaSB5aYnHjzYxavTgu0ac1vFTpBbc6iNOE2NznEWp5QTXffvxzSKP0qzOuB7y+zVG1
         m7NfyBkVy8JhnRTT3Bs32mtdZ3222GB3J1Vc3NUbnxMUeqms6ZPBtV7N2Y8fGQly2SUH
         0Wd315Jyif7eTb//3jePCR7YQlSeZu4dX+hlq9hk5+tzdsPuCa3ihWtY/cEo2Zi+7I1P
         DPR45JNa43aSyFVFDNshwRv6AUfmxTuuqHekoKGUbnbr2Pa/8O9kJwMa2lIT6q4hcDcQ
         U2YePHnbhx7doiBOVBMwJOV+7oklPW2pfoAV397CJvYLHMnX9q+VYFJxMC7m9B8u3I8G
         4yIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780950012; x=1781554812;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzuyC1atyxd9zJrlibRKntcjylXuE+/9E3v4LGDaze4=;
        b=asva1RK0fOb4kVz8D0bCdM0v5KmUdFq4BtCjmiqVy/cTLTiOqoAsdIFk/rJ2wb0Uwq
         uAYquItICgqqRAkjldCJmEjkXlANPdFXSJyMZ38kdfd8sld3nR7EQaf6sJ+49kWJUPkW
         VLaFAMtCA9hYmVNPIKQ6NIbKZsvqJ2NM09S3BJ1ETFH+f7CnsCCStTOwTry4saX2Kbvw
         YZe6bbvn3E0Dq731PexjzBe60+PwVbA0FdJHvmSVrazjsFEX1SqBxE0IXKAy5e1Y79jG
         MHB83NGzoq6jr57B+lKVjm6oTj3zJxYewG6gryzrPgHmDqr5WzuEdlCyQdfnOoz9kZlU
         L4bA==
X-Forwarded-Encrypted: i=1; AFNElJ9ItTptwWH5Nqmhrh022l/Zde2Ev/2p9lvFz18eIVPL/8xE4pJT64HXBzIIeLEyqlhmvPbpm4ZrF2MQzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCFdiQyjs1kxgL1cttUmLLcBNaU2O1Zz5NT9jWpa3VwUu1iE2u
	nEE1yU4YYg5nv5zwI7UccqrjUAkna6IXNqXY4WqNhcMzD/Grx/ddrkky+MRSRcXkri0=
X-Gm-Gg: Acq92OEDUtA81PTfh1qP8ifpWtsOIfBt/MERreGpHZMJdFTv34rFAUwQUL4FlyrHOzS
	DcWlUUy6z8BA5zZJEcALzv9im0irGFaKbZJxVVstgW3C7XvcTrXwbxYOLqdTbV6PasvVfkBuxsH
	4Wb/lSwdLEOT5wPJBrUUCfI6Uamij1TjQr/JAnaiomdqCLqREi3CcGLsuuFq7YpSUetex9cbA1t
	d+E0V0/6pEKQwPFrKWYJYQhFQ4Ot4MeHclbvxqYyav6wkIfKKiPxQSYsZbpV0lzcv6W8dwlNJPr
	CpmefYNPSe+Thrc1xDRx1Kk8uO6ElGt0gUgzL7NeOMWcMn2TXJceJvHkGNUQQ4tseGH+zbfMl/s
	I7WUVLAu2nVF7s3LrhWMRcbk5Y77kCYYhKQ0lbWRVvrxSnPCOha1qrubotVzsTIX37qt8M8y4pr
	ZNwaHCuVLaScX/bmL0HwdRoczztNW8zStnu98RcHWMNRP5aF3+t59axjclUDOB/Cfo7jVkYaZOy
	qcOBG8=
X-Received: by 2002:a05:620a:8085:b0:915:d443:e6db with SMTP id af79cd13be357-915d443e7bfmr894995285a.20.1780950012349;
        Mon, 08 Jun 2026 13:20:12 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3c2492sm1985019985a.34.2026.06.08.13.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 13:20:11 -0700 (PDT)
Message-ID: <f8352762151d02c0ade63a087e48df9f8bb23ba9.camel@ndufresne.ca>
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal
 de-blocking edges y=4 and y=12
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Simon Wright <simon@symple.nz>, Detlev Casanova
	 <detlev.casanova@collabora.com>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Date: Mon, 08 Jun 2026 16:20:09 -0400
In-Reply-To: <66768711-6943-43f5-95fa-3d97dc638844@symple.nz>
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
	 <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
	 <2565c949-a558-415f-8c79-e47812db8341@symple.nz>
	 <e3b93bda-fed8-4f21-b3d8-cdf28bfaba1c@collabora.com>
	 <4358f22d-247c-43d3-89d4-27b57bbe90aa@symple.nz>
	 <66768711-6943-43f5-95fa-3d97dc638844@symple.nz>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-MCkvM12u65+NW5/0jyeT"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ndufresne-ca.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ndufresne.ca : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-64249-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:simon@symple.nz,m:detlev.casanova@collabora.com,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ndufresne-ca.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas@ndufresne.ca,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ndufresne.ca:mid,ndufresne.ca:from_mime,ndufresne-ca.20251104.gappssmtp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CCBE65A733


--=-MCkvM12u65+NW5/0jyeT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon, Detlev,

Le lundi 08 juin 2026 =C3=A0 17:11 +1200, Simon Wright a =C3=A9crit=C2=A0:
> A reference implementation -- the DMA priming buffer plus the
> link-register kick sequence, ported from the BSP -- is in the repo I
> shared (the warmup code itself is in the sibling rkvdec-vdpu383-vp9 /
> -av1 repos, src/rkvdec-link.c):
>=20
> =C2=A0 https://github.com/SympleNZ/rkvdec-vdpu383-h264-bug
>=20
> I'm not sure of the right mainline form for a vendor-disassembly-
> derived priming sequence, so I've left it as a report + reference
> rather than a patch -- you're much better placed to decide how, or
> whether, it belongs in rkvdec. Happy to test any version on the RK3576
> boards here.

just a two cent proposal. We could save the resume state, and on the first =
frame
after resume, we'd prepend the workaround decode operation to the TBL. That
would be a bit cleaner, and would batch the workaround without having to
manually poll. The resume state is then cleared on the workaround decode IR=
Q
(IRQ needs to be enabled in the workaround). Its not a very impactful on
performance otherwise, but we know from past mpp workaround that they don't
always imply a HW bug, they often use workaround as hotfix for other issue =
they
haven't figure-out yet.

Nicolas

--=-MCkvM12u65+NW5/0jyeT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaicj+QAKCRDZQZRRKWBy
9M+QAQCTtPyD7lCtZf2HNB2JbSjgWXixyDS4aGR3BVaWoNddDAD9HQtb1MNy+GMU
kDveoq488iqQhuIlOoobfBc9GcLqJwc=
=105d
-----END PGP SIGNATURE-----

--=-MCkvM12u65+NW5/0jyeT--

