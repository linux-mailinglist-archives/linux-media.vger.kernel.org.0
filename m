Return-Path: <linux-media+bounces-60600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKw5NKlC+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:31:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CDB4DAFD5
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3EC9301023E
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A6E4657DD;
	Wed,  6 May 2026 13:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5qwe4Px"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E504611C6;
	Wed,  6 May 2026 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074275; cv=none; b=H5GoRLkGVpqtkBBooU5U3XD3I085HqplgrPAL47gabFeQUCzCtjqWR1NAhF6DKRWbF65nReOJz2YlPuLZm16DCzB1O/BYYNk4ykdb+uJ37aL//cOWhts9XrZPVSg8WHwAY131pbq5B5ht9T+/EoneZTfPSyHiPkL9FDNAeuJ41A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074275; c=relaxed/simple;
	bh=NrQ+dSjs384ZRfIyJS33HBam4QDZDfVx4xzhTdvPuwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/wxzmuU7ruBIBGO/r/fHXn93dBRP+GPQVJTrcveADh8QrZiPrCVzFo9j19ITRukvvyyWHyvc2aPgfZNrDJO9d8027yhOZWXt6o6iNyvVRD+pQaQ6XWiqeiTVb6Umro1LCxNiJcaIiYvLG6l03y9L+UY6Dui8EXCgJCoYdxT7l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5qwe4Px; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAFCC2BCB8;
	Wed,  6 May 2026 13:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074275;
	bh=NrQ+dSjs384ZRfIyJS33HBam4QDZDfVx4xzhTdvPuwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5qwe4Px1vR/zhejuZ6rq139PRRBewNML9UMUMEP44GXpxMQjJJUwlozQKB9SGRkv
	 zWV7fllywcM+I1MXoddI0ycvpS1NehEDsIHhNQgGF8vvgVdM8vn/GSrFBDgh6NnWhW
	 2nFnnf9H57o3AsN+ToNpEAGTGOENHH3KOhv+VX91unTD1ZzLqP+X9GMfCqD2rnXibz
	 TV8RLx03eMbuDn/0SgUY/4OAxxIKoMeprEs+SOoDWbCJBL1nPMfZpv0ngUVKXdVRXm
	 iNr6GR+ja8rjfwkt8/Xw979sVHEXqDCJQfNdArL8mlh0Rs2TIcmHCMYDn5hy6SAc89
	 Ng/POKlY0fyHA==
Date: Wed, 6 May 2026 15:31:12 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260506-certain-busy-warthog-bd42d7@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260506-energetic-azure-pig-2b6ec4@houat>
 <SurytM7FTOazQNVXXqCU7g@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ulftqthwgql3ly5x"
Content-Disposition: inline
In-Reply-To: <SurytM7FTOazQNVXXqCU7g@collabora.com>
X-Rspamd-Queue-Id: D3CDB4DAFD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60600-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]


--ulftqthwgql3ly5x
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
MIME-Version: 1.0

On Wed, May 06, 2026 at 02:43:42PM +0200, Nicolas Frattaroli wrote:
> On Wednesday, 6 May 2026 12:08:24 Central European Summer Time Maxime Rip=
ard wrote:
> > Hi,
> >=20
> > On Tue, May 05, 2026 at 04:05:10PM +0200, Ketil Johnsen wrote:
> > > From: Florent Tomasin <florent.tomasin@arm.com>
> > >=20
> > > This patch allows Panthor to allocate buffer objects from a
> > > protected heap. The Panthor driver should be seen as a consumer
> > > of the heap and not an exporter.
> > >=20
> > > Protected memory buffers needed by the Panthor driver:
> > > - On CSF FW load, the Panthor driver must allocate a protected
> > >   buffer object to hold data to use by the FW when in protected
> > >   mode. This protected buffer object is owned by the device
> > >   and does not belong to a process.
> > > - On CSG creation, the Panthor driver must allocate a protected
> > >   suspend buffer object for the FW to store data when suspending
> > >   the CSG while in protected mode. The kernel owns this allocation
> > >   and does not allow user space mapping. The format of the data
> > >   in this buffer is only known by the FW and does not need to be
> > >   shared with other entities.
> > >=20
> > > The driver will retrieve the protected heap using the name of the
> > > heap provided to the driver as module parameter.
> >=20
> > I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
> > better in the device tree and lookup through the device node? heaps are
> > going to have a node anyway, right?
> >=20
> > This would allow you to have a default that works and not mess to much
> > with the kernel parameters that aren't always easy to change for
> > end-users.
>=20
> Hopefully the kernel parameters aren't easy to change for end-users on
> systems that deploy this. :) The use-case is copy protection for embedded
> devices running on locked-down systems. Though admittedly the mechanism
> works even on "tampered"-with systems, as long as the underlying hardware
> implements the access restrictions properly.

I guess it wasn't just about the user tampering it, but also about
distros shipping, say, a signed UKI that would support multiple
platforms with 42 versions of optee but all using panthor. I'm not sure
we can expect a single heap name to work for all of them.

> I'm a bit hesitant about making this DT myself. It would solve the problem
> that panthor could probe before the heap provider and needs to handle
> deferral by itself, but it does mean that we'd be putting software
> configuration into the device tree.

Is it? If the system has a protected allocator, and if panthor
absolutely needs to allocate from that allocator, it's not software
configuration: it's a description of what the platform looks like from
Linux PoV.

Or put it differently, it's not more software than optee is, and yet it
has its own node.

> Having the secure heap be a node with no address would allow the tee
> (or whatever else) to still dynamically allocate it wherever, and let
> us handle the dependency relationship between dma heap and GPU, but
> then we require that tee heap driver implementations play nice with
> this scheme, and bring OF into the dma_heap APIs.

I mean, it's a dma_heap API that we create so we don't bring anything
more to it :)

Maxime

--ulftqthwgql3ly5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaftCnwAKCRAnX84Zoj2+
dhXNAX0UyoGSxTfl5B13C2G2JHLqgb01BTvh/1Ob1SVJrqGkUfDzg6CRc+vjIxPh
fsftM88BfR4cCx3hWDWF7WDUDVxG50bXC1qkh0VN5jFTn3OoLjwjh1LahaWy8Z09
NmujI7ISBA==
=xA7h
-----END PGP SIGNATURE-----

--ulftqthwgql3ly5x--

