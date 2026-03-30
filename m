Return-Path: <linux-media+bounces-57606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIunMqxjymn27gUAu9opvQ
	(envelope-from <linux-media+bounces-57606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:51:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3030535A8F2
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 13:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BE6E3080124
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 11:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE353C73E7;
	Mon, 30 Mar 2026 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izHckPnY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557F8635D;
	Mon, 30 Mar 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870868; cv=none; b=I2mzdOFNI9raajArjkBpxUjtcJRjeWdzF+d4HB/cIeOrvIdQP3IUMvBt4tzJGTu2kNdDzXyNdWzEwp5lnYQn7YZPfwms/mAcdJXJ+sXg2dQKvVY9pYfPoZMtp+FCqxEMnb48J9KxXTzurI1ovzVjahRgtbRzV5B+7F8kBK+ld2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870868; c=relaxed/simple;
	bh=vk0GNBm38cxPUL8hx1BYmlngLAKrpbaO0Fp6gXCGVh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVwVPbVngWXGUkdyJgjgDkq89/xpEaTpXBReg0O00DEqwmRQRl/5o/LQi4QU7Ls4qo0m6ZZYDY0TsFYCRKViqyQaCMgrxRBVnubT5fv6zznKUn9irAMV6VudsHxhjacqUd8XbClbj6Wj9/QgJ+Gfoq0yehY1H31xnF+W3yneXI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izHckPnY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7519C2BCB0;
	Mon, 30 Mar 2026 11:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774870868;
	bh=vk0GNBm38cxPUL8hx1BYmlngLAKrpbaO0Fp6gXCGVh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=izHckPnYW1xfOIcSwg9GAt25PbGRMGvBIsGYaGbGnrweBGfBRY2vHEf5rdVD6LnwH
	 2FCxl2BryECaSFHqICoKNgSsY/2ngfwVKChP9wClMA5d4UnhiG/NgPGPdZ70voJc33
	 2CNWeHCd0ghuwBy9INw4dHgzT/PID/bug/ByBtxVJqYjBnGnyGa96W56k0iZpKwJrr
	 eDtEkudoXt0yFFWt1nLc/jccK4twXlc3wEyCjGa8I9FxlphkrdP3AaFD7icAAAaF2Y
	 kdrJHf/9Jg8kbrn6sXloXiK3O5ZcxnI0KU1ueox6ZFZkDxMEYAt3z5B5lP7wrlzSBL
	 HlI/6mRQAVUdw==
Date: Mon, 30 Mar 2026 13:41:05 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Robin Murphy <robin.murphy@arm.com>, 
	Albert Esteve <aesteve@redhat.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] dma/contiguous: Fix broken build
Message-ID: <20260330-glaring-pygmy-dodo-fa06f3@houat>
References: <CGME20260330084111eucas1p1e7cd5c886e34d0ed41226fe524d2a55a@eucas1p1.samsung.com>
 <20260330-dma-build-fix-v1-1-748b64f0d8af@kernel.org>
 <62b9e47c-1c31-4654-8347-16516faf73f0@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="oawew4tnfndq6thp"
Content-Disposition: inline
In-Reply-To: <62b9e47c-1c31-4654-8347-16516faf73f0@samsung.com>
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
	TAGGED_FROM(0.00)[bounces-57606-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3030535A8F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--oawew4tnfndq6thp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dma/contiguous: Fix broken build
MIME-Version: 1.0

On Mon, Mar 30, 2026 at 10:59:48AM +0200, Marek Szyprowski wrote:
> On 30.03.2026 10:40, Maxime Ripard wrote:
> > Commit 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic
> > around") didn't remove one last call to dma_heap_cma_register_heap()
> > that it removed, thus breaking the build.
> >
> > That last call is in dma_contiguous_reserve(), to handle the
> > registration of the default CMA region heap instance if it's declared in
> > the device tree.
> >
> > However, the default CMA region instance is already handled by
> > retrieving it through dev_get_cma_area() in the CMA heap driver, so the
> > call to dma_heap_cma_register_heap() wasn't actually needed.
> >
> > Let's remove this call, the now unused function definition, its now
> > empty header, and all includes of this header.
> >
> > Fixes: 3a236f6a5cf2 ("dma: contiguous: Turn heap registration logic aro=
und")
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Closes: https://lore.kernel.org/linux-next/acbjaDJ1a-YQC64d@sirena.co.u=
k/
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/dma-buf/heaps/cma_heap.c  |  1 -
> >  include/linux/dma-buf/heaps/cma.h | 16 ----------------
> >  kernel/dma/contiguous.c           |  5 -----
> >  3 files changed, 22 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/c=
ma_heap.c
> > index f8a3d87f3ccee9630383ba28502eb40b10671cc2..cc517ac68a0bec0788abcb3=
38c03f530d169013b 100644
> > --- a/drivers/dma-buf/heaps/cma_heap.c
> > +++ b/drivers/dma-buf/heaps/cma_heap.c
> > @@ -12,11 +12,10 @@
> > =20
> >  #define pr_fmt(fmt) "cma_heap: " fmt
> > =20
> >  #include <linux/cma.h>
> >  #include <linux/dma-buf.h>
> > -#include <linux/dma-buf/heaps/cma.h>
> >  #include <linux/dma-heap.h>
> >  #include <linux/dma-map-ops.h>
> >  #include <linux/err.h>
> >  #include <linux/highmem.h>
> >  #include <linux/io.h>
> > diff --git a/include/linux/dma-buf/heaps/cma.h b/include/linux/dma-buf/=
heaps/cma.h
> > deleted file mode 100644
> > index e751479e21e703e24a5f799b4a7fc8bd0df3c1c4..00000000000000000000000=
00000000000000000
> > --- a/include/linux/dma-buf/heaps/cma.h
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -#ifndef DMA_BUF_HEAP_CMA_H_
> > -#define DMA_BUF_HEAP_CMA_H_
> > -
> > -struct cma;
> > -
> > -#ifdef CONFIG_DMABUF_HEAPS_CMA
> > -int dma_heap_cma_register_heap(struct cma *cma);
> > -#else
> > -static inline int dma_heap_cma_register_heap(struct cma *cma)
> > -{
> > -	return 0;
> > -}
> > -#endif // CONFIG_DMABUF_HEAPS_CMA
> > -
> > -#endif // DMA_BUF_HEAP_CMA_H_
> > diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> > index ad50512d71d3088a73e4b1ac02d6e6122374888e..9fe001c712339f8388d3f40=
cca3dfff3f707fcbf 100644
> > --- a/kernel/dma/contiguous.c
> > +++ b/kernel/dma/contiguous.c
> > @@ -40,11 +40,10 @@
> >  #include <asm/page.h>
> > =20
> >  #include <linux/memblock.h>
> >  #include <linux/err.h>
> >  #include <linux/sizes.h>
> > -#include <linux/dma-buf/heaps/cma.h>
> >  #include <linux/dma-map-ops.h>
> >  #include <linux/cma.h>
> >  #include <linux/nospec.h>
> > =20
> >  #ifdef CONFIG_CMA_SIZE_MBYTES
> > @@ -270,14 +269,10 @@ void __init dma_contiguous_reserve(phys_addr_t li=
mit)
> >  						  selected_limit,
> >  						  &dma_contiguous_default_area,
> >  						  fixed);
> >  		if (ret)
> >  			return;
> > -
> > -		ret =3D dma_heap_cma_register_heap(dma_contiguous_default_area);
> > -		if (ret)
> > -			pr_warn("Couldn't register default CMA heap.");
>
> After this change no dma-buf heap for the default CMA area is=A0created i=
f it has=A0
> not been specified in device-tree. This might be especially a problem for=
 the
> non-dt systems.

I don't think that's the case? My understanding is that
dma_contiguous_reserve() is called by the arch code, and will create
that region only if it hasn't be set by the DT (that excerpt above is
run only if !dma_contiguous_default_area).

However, for the DT case, dma_contiguous_default_area will be set by
rmem_cma_setup() a bit below if linux,cma-default is set in the DT.

dma_contiguous_reserved() is called (on arm64 at least) through
bootmem_init(), called as part of setup_arch().

rmem_cma_setup() is called through RESERVEDMEM_OF_DECLARE, so through
__reserved_mem_init_node(), so, if we consider only the public
functions, through:

  * fdt_scan_reserved_mem_reg_nodes(), called by
    unflatten_device_tree(), called right before bootmem_init() in
    setup_arch();

  * or fdt_scan_reserved_mem() and then
    early_init_fdt_scan_reserved_mem(), called in arm64_memblock_init(),
    itself called in setup_arch() earlier than both
    unflatten_device_tree(), and bootmem_init().

Thus, the DT case will run first and set dma_contiguous_default_area if
relevant on that platform, and if it's not set, the non-DT case will set
it up. Either way, dma_contiguous_default_area will be set.

The CMA heap runs much later using a regular module_init. It will
retrieve dma_contiguous_default_area through dev_get_cma_area(), and
will create a heap instance for the default area.

Am I misunderstanding something?
Maxime

--oawew4tnfndq6thp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCacphSgAKCRAnX84Zoj2+
dvwdAYCmcyKvMESVpeaaNthy5eoJ9HB7FC2w6O914qcCct0mA3kBFdDvzKV9xSrp
OpFv8SgBgNJpXNnxa1IQssIl+lW8z1VdQul6SZuorIUoKSuLdAB5lfHsCkMxvdmo
fLIaKexBEA==
=PScu
-----END PGP SIGNATURE-----

--oawew4tnfndq6thp--

