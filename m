Return-Path: <linux-media+bounces-53716-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJFtOYGdoWl8ugQAu9opvQ
	(envelope-from <linux-media+bounces-53716-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:34:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C1C1B7BC0
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E710530CAD5B
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE76231C91;
	Fri, 27 Feb 2026 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9ZwxSbT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113D623A9B3;
	Fri, 27 Feb 2026 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772199033; cv=none; b=AMp35iJj75je/PM5aePgQAM8UoWs3IoAiCj2se0YF4514Ot1PyE0muPxEluHZIDac5Q4hBlui6TRiBgu/5ncmGxunDSZAbROCOa0gRpfilX0XxCUn3FQ06ieJlf+5W6q6EkLCVfxuIUAWlxSXDWJdOaaCA+/omAQizD81ElBl1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772199033; c=relaxed/simple;
	bh=n4yX5l6q7fUwZBwFYRwfHjLdICdDCZUGrXzVl1z1sXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGJSCArRXC/7aw6CjR4+OWeRjO74NhXB1GVxOSxdMHRbUHS0+XjvoyeH9+1pfi77rTVhUFsxMdZ3vvfl+nsLrrEwpm6KhNyPDnXslWBcFeLbn93fPN9B/moZYjjGfTsQsqF2kQ5239g7mTu5LeSGoMD6zeoSlvoIru6kjgUj2ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9ZwxSbT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD5CC116C6;
	Fri, 27 Feb 2026 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772199032;
	bh=n4yX5l6q7fUwZBwFYRwfHjLdICdDCZUGrXzVl1z1sXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9ZwxSbTgLHYJpVWUuDP8wbZwcQB05N9yCc139iBS4j42M6KY7s3p9hu4NaBCEhuo
	 nm64rd+BuFeAnRt6r+oAAilijlNBgCpQX/8Vios1yk4BLbTekn169/1BPUBUTrR+T6
	 1g+44JrAY8+QcLwWcfR3VxE5sd7R3JpFvEq6uKMV8Bri2YlpIDYwvuMsAwFXM3JWGm
	 pewISR+4xeDio4bgZyALFItTtDfth0boMVvgA/jMury2H1cdCtzDDjLySkXPykIZDr
	 GGH1R7bvtv2st3HjQYncwcWM8GG61yNVbeKUuKLEXbAjzt1mCuvoy/MV8W1sqRTXFA
	 7QBd9EokKi1AA==
Date: Fri, 27 Feb 2026 14:30:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
Message-ID: <20260227-psychedelic-tireless-herring-0adfa9@houat>
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com>
 <20260226-adaptable-vermilion-nautilus-0aa6f0@penduick>
 <CANDhNCrpNU7QJgu+0CZRvdxLwKp8VNxZoG_zDo7qqxaE0mjoTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ybq2aqmqnxghgoih"
Content-Disposition: inline
In-Reply-To: <CANDhNCrpNU7QJgu+0CZRvdxLwKp8VNxZoG_zDo7qqxaE0mjoTw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53716-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlesource.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50C1C1B7BC0
X-Rspamd-Action: no action


--ybq2aqmqnxghgoih
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
MIME-Version: 1.0

Hi John,

On Thu, Feb 26, 2026 at 10:03:21AM -0800, John Stultz wrote:
> On Thu, Feb 26, 2026 at 2:18=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Wed, Feb 25, 2026 at 10:51:30AM -0800, John Stultz wrote:
> > > So heaps-as-modules is common in the Android kernels, and was
> > > attempted to be upstreamed long ago:
> > >   https://lore.kernel.org/lkml/20191025234834.28214-1-john.stultz@lin=
aro.org/
> > >
> > > And it got a fairly chilly reception, but maybe having the additional
> > > optee heap (as well as other proposed heaps) might sway folks on this
> > > now.
> >
> > I didn't know that Android was using heap as modules only, but I'd say
> > that it's even more of a reason to upstream it then.
> >
> > > There is also the kref bits you might need (which Android still carri=
es):
> > >   https://lore.kernel.org/lkml/20200725032633.125006-1-john.stultz@li=
naro.org/
> >
> > I'm curious about this one though. It looks like you add refcounting,
> > but never really get the references anywhere. What was your intent, that
> > on every allocation the buffer would get a reference to the heap so we
> > avoid removing a heap with allocated buffers?
>=20
> Oh, apologies I mixed this up. You can ignore that suggestion.
>=20
> In Android, once folks were familiar with thinking about dma-buf
> heaps, some (out of tree) drivers wanted to be able to internally
> allocate from a given heap (somewhat of a hold-over from the old ION
> drivers). So we have a convenience patch to provide that:
>    https://android.googlesource.com/kernel/common/+/8e1ec97355ef9927e82ec=
18c98312bdcd80bf289%5E%21/
>=20
> And since we return a dma_heap to the driver to allocate against:
>   https://android.googlesource.com/kernel/common/+/fc1310ebf8fe25ea7b9834=
00e6fa41f5a6d11966%5E%21/
>=20
> The kref bit is to make sure we're doing proper reference counting on
> that shared pointer.
>=20
> This ended up getting bundled together along with the heaps-as-modules
> changes in our out-of-tree changes, and I just confused its use here.

Understood, thanks :)

It looks like there's some people interested in doing what you described
though, so we might need your patch still.

Maxime

--ybq2aqmqnxghgoih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaGcdQAKCRAnX84Zoj2+
dlInAYDiZPR1HyqxbwSMVJaP54olybYOcsMkzhKqdmUzzyNp1PJL2iscONIeEv0g
z3hqowsBgJDNhcz09KstrR3FmwlC0rN908FYO2XMXAIcrplcSndu1qOliyhSfM9Z
3ioBgkbAMA==
=BqyY
-----END PGP SIGNATURE-----

--ybq2aqmqnxghgoih--

