Return-Path: <linux-media+bounces-60451-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD+1G2cQ+mntIgMAu9opvQ
	(envelope-from <linux-media+bounces-60451-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:44:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD28D4D0721
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 17:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77DE130B5B52
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 15:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE2A48BD54;
	Tue,  5 May 2026 15:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dv9yHYRg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1626248BD44;
	Tue,  5 May 2026 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995558; cv=none; b=Mhnr4ysQdBlB2JmuJcxs7V61hJuFTXHI6I1NxIxV803ZrL5rXFlIoYaLKWPIJOK+zD3qWigBQefWns2tZ+3U1vPFG3JDmOLLNMaSfNcyMIfA6w7Wz3h9ayxhJ2cvv4mG8WzWx3mhDj7GECK8wYcm2TaGLmOPCVcQAkCtkKwRCkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995558; c=relaxed/simple;
	bh=oW8urFywtBGgYaeMzaIycjm0Q5Khia2Ux8S+ZavJSDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FciVupdqne77tI+lEyoDLvj+1RjRICh/+424kEENyO0U2bL2/GnNx5giCtQzCgUJ6dpdyLVS1TRBdQchrf2dIE76DrPG0zDXU7FsIpg96DTQ7kviHi/qem5HPvGIPvTXXO3JIrK07oScpwWWSkuBJs2RdoxzOJUUo5EqAqdQpZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dv9yHYRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15F1C4AF68;
	Tue,  5 May 2026 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995557;
	bh=oW8urFywtBGgYaeMzaIycjm0Q5Khia2Ux8S+ZavJSDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dv9yHYRgzZv41bUtSLycllT8iK2c+R7z7vKDCgLlrV/ijr4Z89tg6jsesE+d7pmVM
	 oAnbtFi5CCmdht7TUaKcSSsaR04DR5I3gnEqcH0yCNJuIgpfKfF18LAY2XjFtl7DjI
	 EzPi0uWgNdokNqp+F2keeVSvop6FZSM0YTKoWbK6T8nNPzX8r1zWR/cVHCxTD0+/cE
	 Nyy6Y2rSsetT4s4/kTjLCODtQoGY14LrgsVYYbeukxea71DKQNNDHztqNJP3rKjWS/
	 zKz0+Vm8M+OVCp5H/V+tJBkgopEzWZT3jTlb/nLfK7FSs67xNxxxen2wNUcjNbRO+I
	 ptzvwufIm2hkA==
Date: Tue, 5 May 2026 17:39:13 +0200
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
	Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 1/8] dma-heap: Add proper kref handling on dma-buf heaps
Message-ID: <20260505-spaniel-of-scientific-warranty-ca075e@houat>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-2-ketil.johnsen@arm.com>
 <20260505172048.1c48e030@fedora>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qg76aku2mqm5lrt5"
Content-Disposition: inline
In-Reply-To: <20260505172048.1c48e030@fedora>
X-Rspamd-Queue-Id: DD28D4D0721
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60451-lists,linux-media=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[arm.com:server fail,mediatek.com:server fail,tor.lore.kernel.org:server fail];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,gmail.com,ffwll.ch,linux.intel.com,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,google.com,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,lists.infradead.org,mediatek.com];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,mediatek.com:email]


--qg76aku2mqm5lrt5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/8] dma-heap: Add proper kref handling on dma-buf heaps
MIME-Version: 1.0

Hi Boris,

On Tue, May 05, 2026 at 05:20:48PM +0200, Boris Brezillon wrote:
> Hi Ketil,
>=20
> On Tue,  5 May 2026 16:05:07 +0200
> Ketil Johnsen <ketil.johnsen@arm.com> wrote:
>=20
> > From: John Stultz <jstultz@google.com>
> >=20
> > Add proper reference counting on the dma_heap structure. While
> > existing heaps are built-in, we may eventually have heaps loaded
> > from modules, and we'll need to be able to properly handle the
> > references to the heaps
>=20
> It's weird that this "heap as module" thing is mentioned here, but
> actual robustness to make this safe is not added in the commit or any
> of the following ones.
>=20
> >=20
> > Signed-off-by: John Stultz <jstultz@google.com>
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > [Yong: Just add comment for "minor" and "refcount"]
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > [Yunfei: Change reviewer's comments]
> > Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> > [Florent: Rebase]
> > Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> > [Ketil: Rebase]
> > ---
> >  drivers/dma-buf/dma-heap.c | 29 +++++++++++++++++++++++++++++
> >  include/linux/dma-heap.h   |  2 ++
> >  2 files changed, 31 insertions(+)
> >=20
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index ac5f8685a6494..9fd365ddbd517 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/dma-heap.h>
> >  #include <linux/err.h>
> >  #include <linux/export.h>
> > +#include <linux/kref.h>
> >  #include <linux/list.h>
> >  #include <linux/nospec.h>
> >  #include <linux/syscalls.h>
> > @@ -31,6 +32,7 @@
> >   * @heap_devt:		heap device node
> >   * @list:		list head connecting to list of heaps
> >   * @heap_cdev:		heap char device
> > + * @refcount:		reference counter for this heap device
> >   *
> >   * Represents a heap of memory from which buffers can be made.
> >   */
> > @@ -41,6 +43,7 @@ struct dma_heap {
> >  	dev_t heap_devt;
> >  	struct list_head list;
> >  	struct cdev heap_cdev;
> > +	struct kref refcount;
> >  };
> > =20
> >  static LIST_HEAD(heap_list);
> > @@ -248,6 +251,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >  	if (!heap)
> >  		return ERR_PTR(-ENOMEM);
> > =20
> > +	kref_init(&heap->refcount);
> >  	heap->name =3D exp_info->name;
> >  	heap->ops =3D exp_info->ops;
> >  	heap->priv =3D exp_info->priv;
> > @@ -313,6 +317,31 @@ struct dma_heap *dma_heap_add(const struct dma_hea=
p_export_info *exp_info)
> >  }
> >  EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
> > =20
> > +static void dma_heap_release(struct kref *ref)
> > +{
> > +	struct dma_heap *heap =3D container_of(ref, struct dma_heap, refcount=
);
> > +	unsigned int minor =3D MINOR(heap->heap_devt);
> > +
> > +	mutex_lock(&heap_list_lock);
> > +	list_del(&heap->list);
> > +	mutex_unlock(&heap_list_lock);
> > +
> > +	device_destroy(dma_heap_class, heap->heap_devt);
> > +	cdev_del(&heap->heap_cdev);
> > +	xa_erase(&dma_heap_minors, minor);
> > +
> > +	kfree(heap);
>=20
> That's actually problematic, because cdev_del() doesn't guarantee that
> all opened FDs have been closed [1], it just guarantees that no new ones
> can materialize. In order to make that safe, we'd need a
>=20
> 1. kref_get_unless_zero() in dma_heap_open(), with proper locking around
>    the xa_load() to protect against the heap removal that's happening
>    here
> 2. a dma_heap_put() in a new dma_heap_close() implementation
> 3. a guarantee that heap implementations won't go away until the last
>    ref is dropped, which means ops and all the data needed for this heap
>    to satisfy ioctl()s (and more generally every passed at
>    dma_heap_add() time) have to stay valid until the last ref is
>    dropped. Alternatively, we could restrict this only to in-flight
>    ioctl()s, and have the ops replaced by some dummy ops using RCU or a
>    rwlock. But I guess live dmabufs allocated on this heap have to
>    retain the heap and its implementation anyway.
>=20
> For record, #3 is already not satisfied by the current tee_heap
> implementation (tee_dma_heap objects can vanish before the dma_heap
> object is gone). The other implementations seem to be fine because they
> are statically linked, and they either have exp_info.priv set to NULL,
> or something that's never released.

That statement won't hold for long, see:
https://lore.kernel.org/r/20260427-dma-buf-heaps-as-modules-v5-0-b6f5678fee=
fc@kernel.org

However, all upstream heaps can be loaded as module, but not unloaded.
So once you get a reference to it, you can assume it will live forever.
That's why we didn't merge that patch before, even though it was discussed:

https://lore.kernel.org/all/CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3=
D7tA@mail.gmail.com/

Maxime

--qg76aku2mqm5lrt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCafoPGQAKCRAnX84Zoj2+
dvfDAYDCsqac+NUBBH3QPhD6jhb/xgsDVQpBWYAvr98JjIDj3r2oBlStiGGj/l40
GNBQd5MBf0dz2ZC/qasewer2z68+KtIIlG5X6Wmi/MNZs5nI6DOk70W68K3hw0lL
bLXqOrzshA==
=kct9
-----END PGP SIGNATURE-----

--qg76aku2mqm5lrt5--

