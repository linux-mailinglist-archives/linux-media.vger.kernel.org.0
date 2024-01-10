Return-Path: <linux-media+bounces-3390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C81BF828476
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC2E286CD4
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 11:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034B736B08;
	Tue,  9 Jan 2024 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ozRW/dUl"
X-Original-To: linux-media@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEA1364DF;
	Tue,  9 Jan 2024 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1704798420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=maPpi5pmUERxsgHdYN5Es/kkWeI0IWDyPa8TG0tWmAY=;
	b=ozRW/dUls20TeIDbAFZQAcNeK5YMmXnYU/JGcPaHKHXpcKEv1EWitSfDamlyeWr5T20L5O
	w0lsQuvK43q8ByVCo2FnUyLX73HApccAv22vd8MF078D5KlULSsUO9aJxws/CRQR2Bx0EB
	Hc4OTHXRJXEERk4EDxFUbNMPX0EZ5NU=
Message-ID: <31e56028b4d865c60b7c01b2a305b3dd8a21ff7a.camel@crapouillou.net>
Subject: Re: [PATCH v3 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
From: Paul Cercueil <paul@crapouillou.net>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>, Michael
 Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>,  linaro-mm-sig@lists.linaro.org, Nuno
 =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>,  linux-media@vger.kernel.org
Date: Tue, 09 Jan 2024 12:06:58 +0100
In-Reply-To: <ZZxKvR9gjH8D5qxj@phenom.ffwll.local>
References: <20240108120056.22165-1-paul@crapouillou.net>
	 <20240108120056.22165-4-paul@crapouillou.net>
	 <ZZvtEXL8DLPPdtPs@phenom.ffwll.local>
	 <a44aca93adc60ce56a64c50797a029631900172e.camel@crapouillou.net>
	 <ZZwU827NMHbx7bsO@phenom.ffwll.local>
	 <2c0d4ef1b657c56ea2290fe16d757ce563a3e71b.camel@crapouillou.net>
	 <ZZxKvR9gjH8D5qxj@phenom.ffwll.local>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
	YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Daniel / Sima,

Le lundi 08 janvier 2024 =C3=A0 20:19 +0100, Daniel Vetter a =C3=A9crit=C2=
=A0:
> On Mon, Jan 08, 2024 at 05:27:33PM +0100, Paul Cercueil wrote:
> > Le lundi 08 janvier 2024 =C3=A0 16:29 +0100, Daniel Vetter a =C3=A9crit=
=C2=A0:
> > > On Mon, Jan 08, 2024 at 03:21:21PM +0100, Paul Cercueil wrote:
> > > > Hi Daniel (Sima?),
> > > >=20
> > > > Le lundi 08 janvier 2024 =C3=A0 13:39 +0100, Daniel Vetter a =C3=A9=
crit=C2=A0:
> > > > > On Mon, Jan 08, 2024 at 01:00:55PM +0100, Paul Cercueil
> > > > > wrote:
> > > > > > +static void ffs_dmabuf_signal_done(struct ffs_dma_fence
> > > > > > *dma_fence, int ret)
> > > > > > +{
> > > > > > +	struct ffs_dmabuf_priv *priv =3D dma_fence->priv;
> > > > > > +	struct dma_fence *fence =3D &dma_fence->base;
> > > > > > +
> > > > > > +	dma_fence_get(fence);
> > > > > > +	fence->error =3D ret;
> > > > > > +	dma_fence_signal(fence);
> > > > > > +
> > > > > > +	dma_buf_unmap_attachment(priv->attach, dma_fence-
> > > > > > >sgt,
> > > > > > dma_fence->dir);
> > > > > > +	dma_fence_put(fence);
> > > > > > +	ffs_dmabuf_put(priv->attach);
> > > > >=20
> > > > > So this can in theory take the dma_resv lock, and if the usb
> > > > > completion
> > > > > isn't an unlimited worker this could hold up completion of
> > > > > future
> > > > > dma_fence, resulting in a deadlock.
> > > > >=20
> > > > > Needs to be checked how usb works, and if stalling
> > > > > indefinitely
> > > > > in
> > > > > the
> > > > > io_complete callback can hold up the usb stack you need to:
> > > > >=20
> > > > > - drop a dma_fence_begin/end_signalling annotations in here
> > > > > - pull out the unref stuff into a separate preallocated
> > > > > worker
> > > > > (or at
> > > > > =C2=A0 least the final unrefs for ffs_dma_buf).
> > > >=20
> > > > Only ffs_dmabuf_put() can attempt to take the dma_resv and
> > > > would
> > > > have
> > > > to be in a worker, right? Everything else would be inside the
> > > > dma_fence_begin/end_signalling() annotations?
> > >=20
> > > Yup. Also I noticed that unlike the iio patches you don't have
> > > the
> > > dma_buf_unmap here in the completion path (or I'm blind?), which
> > > helps a
> > > lot with avoiding trouble.
> >=20
> > They both call dma_buf_unmap_attachment() in the "signal done"
> > callback, the only difference I see is that it is called after the
> > dma_fence_put() in the iio patches, while it's called before
> > dma_fence_put() here.
>=20
> I was indeed blind ...
>=20
> So the trouble is this wont work because:
> - dma_buf_unmap_attachment() requires dma_resv_lock. This is a
> somewhat
> =C2=A0 recent-ish change from 47e982d5195d ("dma-buf: Move
> =C2=A0 dma_buf_map_attachment() to dynamic locking specification"), so
> maybe
> =C2=A0 old kernel or you don't have full lockdep enabled to get the right
> =C2=A0 splat.
>=20
> - dma_fence critical section forbids dma_resv_lock
>=20
> Which means you need to move this out, but then there's the potential
> cache management issue. Which current gpu drivers just kinda ignore
> because it doesn't matter for current use-case, they all cache the
> mapping
> for about as long as the attachment exists. You might want to do the
> same,
> unless that somehow breaks a use-case you have, I have no idea about
> that.
> If something breaks with unmap_attachment moved out of the fence
> handling
> then I guess it's high time to add separate cache-management only to
> dma_buf (and that's probably going to be quite some wiring up, not
> sure
> even how easy that would be to do nor what exactly the interface
> should
> look like).

Ok. Then I'll just cache the mapping for now, I think.

> Cheers, Sima

Cheers,
-Paul

