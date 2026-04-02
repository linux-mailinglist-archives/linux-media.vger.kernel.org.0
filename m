Return-Path: <linux-media+bounces-57963-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPG4EZtuzmnxngYAu9opvQ
	(envelope-from <linux-media+bounces-57963-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:26:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87510389B1A
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 15:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C376E308A174
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 13:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCCD371D0A;
	Thu,  2 Apr 2026 13:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSszUspE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940191F1304;
	Thu,  2 Apr 2026 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775135522; cv=none; b=UFturqizcqv1DA1CeckIRrXLulCnUUMO47kZ7cGSFXdzG03V/WZ0Lr7z7PbLcJIGEFrSBbS2vJAVXNVCCP2QGxQYcoq1p9suL/V6ZOeyil3LjxG+Jef34zSJh43Ry6L5W9FO7bCblxNurZf4ZbNe6rDslYbJ0Gwf3nP8cvq4WQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775135522; c=relaxed/simple;
	bh=a7x/ysTtVW24aU35eMPirkt+sO+v8dpDAEKDhxuDe60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8+9JkBz5LW1a+yy99lkP3ZvM5gaHglIkZVq0cGRwkBsFRMcynu2jz9PRmgDsk2eoOlWMFT+CexT/UTEghE5xBFXJIhQFGVawPSvhkxXiMi2mKf4389ZptblpFJ5HQooRspjLDpsYEuRW1/w7laiwoEgvobpUw1Kl7rh2W6Cuek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSszUspE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2097EC116C6;
	Thu,  2 Apr 2026 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775135522;
	bh=a7x/ysTtVW24aU35eMPirkt+sO+v8dpDAEKDhxuDe60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSszUspE9dzXyP1vG2gMcdzvhWi9nAi5ipcnGtuyZonB7RZAGmX1hwDPduMtfEj0f
	 lW2LoRIl2ShIjcyVDeuG1hlvOO/zqpCeA0Z146DRKKA0duBquAvj+fJQT/uscVbkZe
	 2wg5nQmX87424MYUc//sb0M9cOh0Ho+XSCi8NXobJRbr+fliundDiCPi1S/NRwsAeC
	 kc4nITLm01qhH8H8Sxex1i7X4/hTzJrnBqisiAgNMciIgTmVqODXmYgxMjwhE4MTBg
	 w18ZXyGoeIRDg6/g/t6PcP82CKsFc0A1CC7A5a4HCiyOTIneD54u7brrQ1GJ5SK+vp
	 +XGiv48Yu5boA==
Date: Thu, 2 Apr 2026 15:11:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Albert Esteve <aesteve@redhat.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-mm@kvack.org
Subject: Re: [PATCH v4 0/8] dma-buf: heaps: Turn heaps into modules
Message-ID: <20260402-burrowing-fine-bloodhound-afcebc@houat>
References: <CGME20260331100026eucas1p19bdc2aaca4c9a48c6f6ac8fec71478d8@eucas1p1.samsung.com>
 <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
 <46397de2-eedf-4e09-a83a-3b683d154fe7@samsung.com>
 <CAO_48GEFQE_FJjuq1UqP=DC6LJE8jjE3C+4FdAyB4uEZDsnFJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="me4gicdwmutl43x6"
Content-Disposition: inline
In-Reply-To: <CAO_48GEFQE_FJjuq1UqP=DC6LJE8jjE3C+4FdAyB4uEZDsnFJw@mail.gmail.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57963-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,samsung.com:email]
X-Rspamd-Queue-Id: 87510389B1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--me4gicdwmutl43x6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/8] dma-buf: heaps: Turn heaps into modules
MIME-Version: 1.0

On Thu, Apr 02, 2026 at 10:36:48AM +0530, Sumit Semwal wrote:
> Hello Maxime,
>=20
> On Tue, 31 Mar 2026 at 18:24, Marek Szyprowski <m.szyprowski@samsung.com>=
 wrote:
> >
> > On 31.03.2026 12:00, Maxime Ripard wrote:
> > > The recent introduction of heaps in the optee driver [1] made possible
> > > the creation of heaps as modules.
> > >
> > > It's generally a good idea if possible, including for the already
> > > existing system and CMA heaps.
> > >
> > > The system one is pretty trivial, the CMA one is a bit more involved,
> > > especially since we have a call from kernel/dma/contiguous.c to the C=
MA
> > > heap code. This was solved by turning the logic around and making the
> > > CMA heap call into the contiguous DMA code.
> > >
> > > Let me know what you think,
> > > Maxime
> > >
> > > 1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wi=
klander@linaro.org/
> > >
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> Thank you for this patch series; now that it is needed by more folks,
> I think we can merge this.
>=20
> Marek, I'll coordinate with you on this - thank you!

If Marek plans on sending it during the next merge window, maybe the
best thing to do for us is just to wait for -rc1 and apply the rest of
the patches. Otherwise, we can merge the branch in drm-misc.

Maxime

--me4gicdwmutl43x6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCac5rGAAKCRAnX84Zoj2+
drvAAX9Gv+TrbX5Ru5iTuTfrjby3dUGZF6Vd9/L4HY+x15swwQBj44P2X43WwAnM
cMhPq+8Bf00cagtlOIBhV4Hse29yKk8z2Is7iRaewRIPe/yQho7wdJK8x1cnDkbD
NQuA+jE9OQ==
=+ZbZ
-----END PGP SIGNATURE-----

--me4gicdwmutl43x6--

