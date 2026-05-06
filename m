Return-Path: <linux-media+bounces-60598-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FVNFlM/+2nTYQMAu9opvQ
	(envelope-from <linux-media+bounces-60598-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:17:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B535B4DADBA
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C606A30A4066
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F83C4611EE;
	Wed,  6 May 2026 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKPmIlxB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F341F3F1674;
	Wed,  6 May 2026 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778073161; cv=none; b=nbEjldntj+y7wDIkzuz8hxuJ3BaFkt+Ux04sGo63Imw+0sXUb5QzLEi3qEOJYQV6RJy/WiRR5pMv+bt322wdg93PREBvs0z9z9sLiKOKPUI0eEaP8ZLDCElV13zUp2Aw0qd9dPETx4b7pgQwSXW/DgV/eecGmlZC5Ky0Zye76wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778073161; c=relaxed/simple;
	bh=6zgK85Psgb7v1JIE4C66zEivfyBHwwFQ3efCNdsjulc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE4wdvmyaWuKCqMwLPwj8ufAH5deZoqrnWguQmZZRgqmAgqcnULUQuril2bL9ZwsRUO7RShsGNw14qXJQ3Bt54S3ZHWjC5kYeBW/ycSFldEzLPyeNUn86VkENb8MfxpDkJpvy+x6HvfroaxVu4Ujz+g822fCM3+ydqCjWJhBUW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKPmIlxB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326C0C2BCF6;
	Wed,  6 May 2026 13:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778073160;
	bh=6zgK85Psgb7v1JIE4C66zEivfyBHwwFQ3efCNdsjulc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKPmIlxBPl17FHX9eU6Y03CHlL1kHunU2HwcFaSaH7T+ZPqg/w8f6/nqgMzptpyAk
	 YzL+yGG906Pkp/5O9MHKzS/q/vR9Pirlwr1Mi0px1zIV+12NXOblyIJDbutm/B6yFx
	 d/Bt9+6yqS4clBaG5KurgIRzPtVHcGu2iBYyMdxk9EG6t1IgvRSKsLj/P5ZT88jMcK
	 WLmkjfwR7rHlHfEPs9MzFMJjTIUedHJZSuUwNTwChx4j0WvKOt2JZytfozCOPYnwuK
	 FPW9ukJ/NsyFAiLq9AhI4BXd0at+zUD5J8gnR85dxwqEUsxVYfdvfT3Cm60m6PKBh4
	 RXLmaJ4fIuPRg==
Date: Wed, 6 May 2026 15:12:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
Message-ID: <20260506-golden-python-of-aptitude-ff972a@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com>
 <20260506-energetic-azure-pig-2b6ec4@houat>
 <20260506125015.0108ef44@fedora>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jsgwzb7lbdee6dei"
Content-Disposition: inline
In-Reply-To: <20260506125015.0108ef44@fedora>
X-Rspamd-Queue-Id: B535B4DADBA
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60598-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]


--jsgwzb7lbdee6dei
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
MIME-Version: 1.0

On Wed, May 06, 2026 at 12:50:15PM +0200, Boris Brezillon wrote:
> On Wed, 6 May 2026 12:08:24 +0200
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
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
> > > heap provided to the driver as module parameter. =20
> >=20
> > I know it's what dma_heap_find asks for, but I wonder if it wouldn't be
> > better in the device tree and lookup through the device node? heaps are
> > going to have a node anyway, right?
>=20
> I'm not too sure. Take the PROTMEM (name=3D"protected,xxxx") dma_heaps
> instantiated by optee for instance, I don't think the originating
> tee_device comes from a device node, nor is the underlying heap
> described as a device node. The reserved memory pool this protected heap
> comes from is most likely defined somewhere as reserved memory in the
> DT, but there's nothing to correlate this range of reserved mem to some
> sub-range that the TEE implementation is carving out to provide
> protected memory.

Maybe we should be working on a dt bindings for heaps then? Something
simple like we have for clocks with a phandle and an ID would probably
be enough. In optee's case, it looks like it would map nicely with
TEE_DMA_HEAP_* flags too.

The only two that wouldn't be covered would be the system and default
CMA heap if not setup in the DT, which shouldn't be too bad for this
particular use-case.

> > This would allow you to have a default that works and not mess to much
> > with the kernel parameters that aren't always easy to change for
> > end-users.
>=20
> I guess we can have a default list of heaps that we know provide
> protected memory for GPU rendering if that helps. Right now this list
> would contain only "protected,trusted-ui" :D. The other option would be
> to make this list a panthor Kconfig option and not expose it as a module
> param.

My main concern is that firmware builds are board specific, and thus its
capabilities isn't something we can reasonably expect to be consistent
across boards, SoCs and platforms. Kernel images (and the kernel
parameters) however can be made generic and unreasonably hard for users
to modify once you start playing with things like secure boot or
measured boot.

The only thing bridging the gap between the two is the DT.

Maxime

--jsgwzb7lbdee6dei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCafs+PAAKCRAnX84Zoj2+
do/dAYCsFzskHm3rONL7gbWKGNrMZhZjrhqTYx/ppxLU2/mdI1esaru0x+30gIoH
nAbsF0cBfRycq8wqS/81+OsbptnyvCrcfE8WBuuTjYVh1soyjUZwMGn7aT+MO70j
Za2ft8aPZg==
=ON6G
-----END PGP SIGNATURE-----

--jsgwzb7lbdee6dei--

