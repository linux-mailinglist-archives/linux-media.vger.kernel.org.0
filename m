Return-Path: <linux-media+bounces-50044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E86F5CF9221
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 16:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95ECF30124D5
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 15:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C01345CA8;
	Tue,  6 Jan 2026 15:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="rG4L4MXJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C846345CA0
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 15:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714264; cv=none; b=NGqZW+5IG9+VlWx54TzBqn5pwsQacjp8NvfHXGAy2WoDp23WulCbX7NIMOeWVdti8mrCg1PLFCte47OLsxX2vrutLhitN2Ziekl1xmL3Ib7GcL9l+J5PDDYoeeEJ8uKtkc43K90mNs6sKpf7idmKH63+EQEVls/Ipe6/FRiL2kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714264; c=relaxed/simple;
	bh=wivJ7felNUHvUVLgibxXU9HP050SGeUS1In0+3vMtEg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=owOUJ8q/wPAnakK3Z9EetMJc6zXKZaNugdMuThW0dOFa81b/HCi/yapsAAXlsCc8fULk8qkZdf4CuHc8ZVgX0W0W2jnhBgFY7Rd3d2f6bbfsD2Fei05xhuXj0bLSJIxgQo6ASjEIEtQSNVZgozFznvoAiFqyprJfANI7S4jsP1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=rG4L4MXJ; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88fcc71dbf4so6337736d6.2
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 07:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767714258; x=1768319058; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wivJ7felNUHvUVLgibxXU9HP050SGeUS1In0+3vMtEg=;
        b=rG4L4MXJFphDVlSor/KLgeuQYL5WWcwjQ1hzeobFahwTk+Z7pCl9Dmk8dqtBf5wZjn
         ng3I6SgJbjISx/K61uBqU6ySh727pjlD/MtFyvtuKDMvtCE0Bi+TeVBNTEPIXGocp+Wv
         foo9sRPBsE1S3h677wEYSKyTx6jdBQ+/pbFQZNaUj2dKxih460g7xZnumOKBs9r/UVxN
         AuqbborI0FiC6AUibWouy72UHw4HUzDk+CqEM4m5vka5Fafebg0jFsCDjuHyUYlsiRGz
         kVYq/erpN+XjMhK6TCLr8DyFhbe969C0KJOR36mlklmDCFJEYFmUUFG3v+3qYLbGxD+L
         Jufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714258; x=1768319058;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wivJ7felNUHvUVLgibxXU9HP050SGeUS1In0+3vMtEg=;
        b=OFl0l1NDNjOupGx398lRqrTCrYLC5CwJM9D2vtN6gkLXC3P7FNd7flz2NegfGzeGG/
         WKYSpuSlESE3MdFpVEvTTWGVEmxKnBMc5s+4ALrsfORmRIbW9uuE0jSI3UWN/U//ASJQ
         cRaI7Po+rXU8SxjPNuU015pYTuwJ4bhTTsJHusEAp2F5FUhzu6ud0fPV41zh0q0z+u3N
         feTyGPCQ+B+lVQxVKxV73ekWTwaErDJHQyYnDdV+YGC5QNWqyjfbMCmIH9pxq+vdn1Sy
         l9b1wowM9Bc9Ydeh+l5aL395ymBdmZDRIyxioEHn2xDX1dRxJzWtKqkB9uxUcogKpmj6
         g3qw==
X-Forwarded-Encrypted: i=1; AJvYcCXMGRRuSobsaxDIPh3lxiZcVhvezxHxnQ4l9YFykWap/7jFWlD2cLhFZiK8a6SLHJuR408y7kfLPNeWlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ObYHGYZu+B3TQzqthW6G9/N90IzAvBEOJi0ptzvsxEOrniMT
	uBgwwPToHd0WlaP/PMtRSAmltG/SvP2DwudvIXfyNr40TUcxfY/zxRPkz7/CfuVw5eI=
X-Gm-Gg: AY/fxX7TXoszho0JlAI6I0I+asmjLugsmkCblmTSOHPO+wF9rDdPXZh6ZNGAW2OV2pM
	026MhPCXRyXvvB0fCE9JYfDlhLymSwIKH818gAYN5GDD88NhsPuVKPl5WAhCAx+84r0APIm96iV
	iS/EFVANCAqZvUEW5oTJXnxOlOK2qOlEJbtwl2ToWnbYwQvXa5fjzkjuhootX4KeEHqCcVFhmRm
	6vMoFllKjXT2UHQsGJvYzcT/S+Ji9ENFomjYSMuNa/zS2s8pSPXpB0oTNetGvb7Wyn9ONPQkpXT
	sdc7thAHvTmHVU7ndiQb5PpjuP9xkOVULF+JRUAqCVZh6yhGI6Hu4vNWWJHBwywLbg5dzuWGFeO
	LneE9PzSY5XHoaaJMoh01tnXE5aMBqbCcnBXkZqdkKA2fC8RrYZIhjca/MhJiriiJCTFAMxvZyZ
	4F3IbfqnqUuZs4ag/z7WPRVSu3rH4=
X-Google-Smtp-Source: AGHT+IH30kwxuPyB0HdKD45B3C5FJpr1+vJ0SQ87m9C7GJ87NTgkQBGmR4/iCOhQs5nEjUWqZnP+Ig==
X-Received: by 2002:a05:6214:e61:b0:888:87ea:c7db with SMTP id 6a1803df08f44-89075ee369bmr44553266d6.39.1767714258381;
        Tue, 06 Jan 2026 07:44:18 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253218sm15274796d6.43.2026.01.06.07.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:44:17 -0800 (PST)
Message-ID: <5e6655351d22721344340d5227492bd55cd12a21.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: dw100: Implement V4L2 requests support
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stefan Klug <stefan.klug@ideasonboard.com>, Xavier Roumegue	
 <xavier.roumegue@oss.nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sebastian Andrzej Siewior	 <bigeasy@linutronix.de>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt	 <rostedt@goodmis.org>,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Hans Verkuil	 <hans@jjverkuil.nl>
Date: Tue, 06 Jan 2026 10:44:16 -0500
In-Reply-To: <20260106145939.GC26157@pendragon.ideasonboard.com>
References: 
	<20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-0-65af34d04fd8@ideasonboard.com>
	 <20260105-sklug-v6-16-topic-dw100-v3-1-dev-v1-1-65af34d04fd8@ideasonboard.com>
	 <40dfd12b585681d8edf9641967160c086cc120c3.camel@ndufresne.ca>
	 <20260106003302.GJ10026@pendragon.ideasonboard.com>
	 <176770897731.12184.12302111059048415045@localhost>
	 <7c514e1165f49c2e043b7f4ab5fcbd1003c517ae.camel@ndufresne.ca>
	 <20260106145939.GC26157@pendragon.ideasonboard.com>
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
	protocol="application/pgp-signature"; boundary="=-NKZAV5Xowi3wbKejnDM5"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-NKZAV5Xowi3wbKejnDM5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 06 janvier 2026 =C3=A0 16:59 +0200, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> > I'm stumbled on this one too, but I completely forgot what this callbac=
k was
> > about and assume something like this. I suspect it might be some left o=
ver
> > from
> > when we required all request to hold all the controls, we should find a=
 way
> > to
> > make that optional, and sort out this field thing, but I'd say its not =
a
> > problem
> > for this serie.
>=20
> Definitely not a problem for this series :-) Please see my other reply
> about using .buf_prepare(), let's avoid splitting the discussion.

I replied 22 minutes before you did, so to be accurate, you did split the
discussion.

cheers,
Nicolas

--=-NKZAV5Xowi3wbKejnDM5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV0t0AAKCRDZQZRRKWBy
9CPCAPwNlgOMCYz1GIjZeOfS+Fru6cfY2/EhiWeL/fmSUMB9fAEAsKSZI7IenrJq
kWi0l7O8c+VMwUl4/imkqmQrNA2HwgI=
=Ld/d
-----END PGP SIGNATURE-----

--=-NKZAV5Xowi3wbKejnDM5--

