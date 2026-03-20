Return-Path: <linux-media+bounces-56433-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7jD1NFmWvGnE0wIAu9opvQ
	(envelope-from <linux-media+bounces-56433-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:35:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6322D477E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 01:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A597B30743CE
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 00:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571B021256C;
	Fri, 20 Mar 2026 00:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="o9iRXE22";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aHcOmJ7z"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A551C84A0
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 00:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773966930; cv=none; b=K4meFz783BIQ2gXgicd8pdHJv3OUPTMcqlOpkQStL9pvL0q0IVgz7d1C6WkeuuWVB9KMsb0mdlRvhA15JKhSMBFC5XOHuvhQfKUkRS1eq/rV3OSSgfj8Swf2ZMockl/xn5RTbjD8DQFhO8ILS2kXjb4eBIYRaz7ONdvBG4lLFWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773966930; c=relaxed/simple;
	bh=j7QjpZQhiVE57gCK0RTyHucoH872U8FmVMG0ksAnbk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyomRsYYHFqmZoFl8YvHOms3IDZgJkP1i9rNc1aNQRidsYHDyAoiHbXm28WYlhFDisUzY4tV+LplLBU113Fa2Nv1Lnn3zEzczV/+dTAEdcAbkCM+sXajijRGEwSsfO2BXceNlAyYB5WvhCe2G8BfOnV9f1pvrO1DZt0/T3ie6BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=o9iRXE22; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aHcOmJ7z; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 3405DEC01DD;
	Thu, 19 Mar 2026 20:35:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 19 Mar 2026 20:35:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1773966927;
	 x=1774053327; bh=JcONGwatR7I2a2nbnBcn4nDdjiD848qctkczcd/135I=; b=
	o9iRXE22s4v3SibxaC9hpc6A6uyuS+CaFY0enqTN+htegyVqj9n4jY5e5KjzSG/5
	G8AKSWMNKCAY2RX93lNRZl+5LG571pYpQVGaJpFkAu3ySjaw0bz/DuyeMqW25II5
	+JnoI+tVg1jrLTQsvPaejhxeMcfOzZ1bU7Ei6PSyUBv7zWHaxDEK3MBadIjBCaYc
	YmIhF8FFm7OqTwiGsZtKQiwekGCxX+Z+BkSC10ATaHxLlHVKz9BNevbCGHWld8cI
	yM9hx1+U0Nxpg9Z92ADffOiOWsl5EVyYODmLjpIAAxht/kFB8afE+QUHCIBAnOe5
	SqCQy42dAKMPD5dPXJSzPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773966927; x=1774053327; bh=JcONGwatR7I2a2nbnBcn4nDdjiD848qctkc
	zcd/135I=; b=aHcOmJ7z78hfcHqG88kU0UoJ7OiJ9gSWCciMgCIW9Oe1aj12F/w
	sz4BhUijpJi+6Mg9B1QwFNMMzEKP2cVL2kbQj5Pq4tKtN8FM1Cu5v92XtOTg3JNa
	tWKrdTWaNuqBOz+SCl1u3UUQKUAPUfD35ZL/39vqFJgWyW/heuXiy6TRPAVqP6K8
	x7W66zvshvDLNJS4acOdSpgnBFzYrf4jBv+j2BT1gRRA+eMZDs3+KDYrdw87hG9V
	OjUbXXwg/rVUvx53/ZYdfeKBPoK3CkRKbuOjTgqAubXzd9dO/18dquC0xtHXn02k
	7rxxDr234hGp/90mGkDCgWrmwRLgsZAcvfg==
X-ME-Sender: <xms:Tpa8abB1Mh9xKU831dYLGOf9C6-gOg3F4gGiSC4ZzPJNsq8ASPu5qA>
    <xme:Tpa8aYYipdefJhwZUgg9VnTbVPWFfnPSk6QjTER9tU9__Mq2UEftTwVH_7J_UgB3f
    PJqfs-Ta6za4abhtRdeCEahiaKWzty_68_7KWMSCQPdFHo2ADQ>
X-ME-Received: <xmr:Tpa8ae6p7thI7tVHbo1jUP2kbaB1sUfFzAOQy_SIsWpkmyeIxlZyTilAutZTMnAGKVg33a5wSwW7bdXNe9I5M6V0vhKr0Ycitbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdekgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhisggrlhgurgestghhrhhomhhiuhhm
    rdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsoh
    hnsghorghrugdrtghomhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhg
X-ME-Proxy: <xmx:Tpa8aZZYU1sq9eJFrSdXRSVwLvv9Ra_1e_pgcZJaGC8RxTbeXsJ04w>
    <xmx:Tpa8adg4cbdZ8QxKyglo3HzlpH5EOEdSMvXAnAihPwcPjYQJw_bFtQ>
    <xmx:Tpa8aa-dY4_QFgHrmps0ESRVoKKZUWVqM_oaffD2gPFbo3vYCPqwAA>
    <xmx:Tpa8aYqlogKH7xeGqaaxibNI2Ay9Wa3qsF9MWY-piWy6YG2cSpx8Uw>
    <xmx:T5a8aaK5f7tdsb7Fqw207TKEnVi7mG-7YR-leIYSvDsFGigO3TratenH>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 20:35:25 -0400 (EDT)
Date: Fri, 20 Mar 2026 01:35:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: Linux 7.0-rc4: v4l2src0:src: page allocation failure - increased
 memory usage in 7.0?
Message-ID: <abyWTGIlD_rncMds@mail-itl>
References: <abtAylIlW3I8s1T-@mail-itl>
 <CANiDSCvqt574XbMAz0qUunu7xDY=oScL+sx533X6ke=fcEdr+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3Wmh7zzAptM1+3iD"
Content-Disposition: inline
In-Reply-To: <CANiDSCvqt574XbMAz0qUunu7xDY=oScL+sx533X6ke=fcEdr+g@mail.gmail.com>
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56433-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: EF6322D477E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--3Wmh7zzAptM1+3iD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Mar 2026 01:35:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: Linux 7.0-rc4: v4l2src0:src: page allocation failure - increased
 memory usage in 7.0?

On Thu, Mar 19, 2026 at 11:19:38AM +0100, Ricardo Ribalda wrote:
> On Thu, 19 Mar 2026 at 01:18, Marek Marczykowski-G=C3=B3recki
> > Additionally, this failure isn't handled gracefully, it's followed with:
>=20
> That should not happen.... Could you check if this fixes it:

Yes, while the page allocation failure still happens, it doesn't result
in follow up errors anymore.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3Wmh7zzAptM1+3iD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmm8lkwACgkQ24/THMrX
1yzZqgf6A1X1/vuRf+H4NNzBAsVYrRbNQzGgQKlEkx/IG/lvr3pV3QaNCxsgpHyi
rMbm1sd7/PSW5kmL4TcqeozhJcH+RSE26nGL2PfTsGu9vG+u1C3J3x4EszM86Via
7P8rj9uc4bESWCDsIvPevH5o6f7YRN2idp4YpOfm2e5iVMDFclSN/N3PAT/TZEmM
Jir4SEiuu1C1tXlrsB5FTzipvS2oJUpOTD+A0f6PEhqzKVaCbnFYvSz38IVmk1Kz
voPL8FtD1fopAWdFIuDCF1Y+oJLSPbz4AAxVt818xMmcIzXi35NgdGX8th+9Tv0G
9gBAr80v3xSVPv7peCA742lU1bUsww==
=uE5Z
-----END PGP SIGNATURE-----

--3Wmh7zzAptM1+3iD--

