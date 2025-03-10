Return-Path: <linux-media+bounces-27966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1391EA59789
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 15:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E55033AB064
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 14:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E05F22C336;
	Mon, 10 Mar 2025 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WM+PScBP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2989229B1F;
	Mon, 10 Mar 2025 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741616814; cv=none; b=h+4knsPexUrxvZzVILUMRGE57Hic+Cg7A/KiAKbFYThdLn6l9c8PFTrlKIUt7kZKV6lKvs3FQkVaL6RghaLqUxm3NrOU+FJ5KqJNua1V1HF4i9PPWdLW6X5Sc2KXnQ2TT+XMp4xBbGpaprhPGOPDKX9NdC4BSTiHFCdCiwW2iQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741616814; c=relaxed/simple;
	bh=POtmH2Pk7YZquZ7ykg+i1ChooTzaYIGRWYlQYgqXhPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W16Zx2eBhsTID8yHHLTah+dh7MmXWvaAs1LY1xtNj9O+LqOas52VEklswgr7wlh9dE/crlYjlEnlto3TWVC/OHWwlfQQ3jhpkdxgi4xcxCygf+/UflbMRopzMYyKjmnQXZrMq5jSdrSbrKiTi5HLFr0kMrULS29cQIFTeOPaYiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WM+PScBP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F40AC4CEE5;
	Mon, 10 Mar 2025 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741616814;
	bh=POtmH2Pk7YZquZ7ykg+i1ChooTzaYIGRWYlQYgqXhPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WM+PScBPqE5h/eL2Yaf49hmt3QKMZNb8yvz11tDPXr9ktrDYrvV4GQMZv2EE6PZZq
	 trZ3j0IX9sSWUAjmf9ZtuRPDLZ2iFu7dDsXSJ5d+S3gKp+LrhtThNHL5wC0H1gMkEs
	 +vvvRcbQ60w2/ecqyK+UIiVoeo+kjxQ0wz7p75Ci+F/zerF53xFn4FeCxyBbI4dWGg
	 Tf0H5ghqCqPjxQNJosfZ2XS5qNAQVVFMOkB/GmFpXQnQXMHbHgbIIwunlYxxVYF+xh
	 eDke46hNOfMA0wtUpzF1dRdPYVB9WwGpPynz5iKydvkeuRMYQ2XhOa1KBVmPkqy03/
	 XA1ZpP5BnfQ+A==
Date: Mon, 10 Mar 2025 15:26:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
Message-ID: <20250310-eccentric-wonderful-puffin-ddbb26@houat>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v4rwoqplwp332trx"
Content-Disposition: inline
In-Reply-To: <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>


--v4rwoqplwp332trx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
MIME-Version: 1.0

Hi,

On Mon, Mar 10, 2025 at 03:16:53PM +0100, Christian K=F6nig wrote:
> [Adding Ben since we are currently in the middle of a discussion
> regarding exactly that problem]
>
> Just for my understanding before I deep dive into the code: This uses
> a separate dmem cgroup and does not account against memcg, don't it?

Yes. The main rationale being that it doesn't always make sense to
register against memcg: a lot of devices are going to allocate from
dedicated chunks of memory that are either carved out from the main
memory allocator, or not under Linux supervision at all.

And if there's no way to make it consistent across drivers, it's not the
right tool.

Maxime

--v4rwoqplwp332trx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ872qwAKCRDj7w1vZxhR
xfDdAQCFXvj/doesASzkIHFH0zB9NLLN59l3YZOIRTbK66YYRgD+KKLR7EXgcgov
1vvbHZ0EY8qhZsF/1+Mwgg9bFZh+1wk=
=KuAg
-----END PGP SIGNATURE-----

--v4rwoqplwp332trx--

