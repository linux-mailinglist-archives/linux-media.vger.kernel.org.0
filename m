Return-Path: <linux-media+bounces-33036-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF4ABF944
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E55771BA1E44
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AECE1EB5D8;
	Wed, 21 May 2025 15:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AE7BvIJ1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8773B1DE3C0;
	Wed, 21 May 2025 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841383; cv=none; b=jE9zrk4JvZnDoJS9mAKZYKjDxDpcnxeO+9+m9r0ZD1uzgXnJ/iqU4ZKBZHpQkMUr7kxdf7tIODryRWj9hDTteLrGz858yzRqFa8UxTvoCafN63r1IvzTSwGYj+z7T9TblEuXUg9jxt5HAxvyR3xJ7/ZgYL/C4900/6RBdJwmb2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841383; c=relaxed/simple;
	bh=qlXssQ+zC+nvTT6qYoRyNT3Tx8K4SII3RQNRlGCTdtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uApHarQawKge5Gp6DgRMJRZGY0I/65vM03yYOWmZvBg9Ruts2M+iDbfV+ND7DSM4IO5wrctBerSiV14hneXlP7ZXqLt8OmS1FGfYppRTVgowOTdo+62JO7aFpJA5Yuayp2D2iYE1Z2+mYb5ZQP6FUp45X53a11yU52j/Y6nwyIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE7BvIJ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90925C4CEE4;
	Wed, 21 May 2025 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747841382;
	bh=qlXssQ+zC+nvTT6qYoRyNT3Tx8K4SII3RQNRlGCTdtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AE7BvIJ1UqmiwFoAVamkAODvZqa+2XTKYBHLnCRt+g3vB8lTIfGdeslGD4aGcEtgw
	 4larKn1k0IQ/b1oUPWgsjM32z1PJe3f/EX5IqpfOEL8i2S/2aPIo7ujIhBUBPdeMOd
	 5WXXViniJ0x6vHnp1jL4PkQenpT25HFObsn+SxVIJ9+aYwnW9chLk2WVP3JR/z6DfC
	 fKAENgM/qNZVoITQtSTib0RE5+C7NJO1vzuSUSJEYX+jKQQwFbSnTNlVJkW5dQhh7x
	 XgFlx8z6dvJblnlAULCTUtFR9FYT/zgr1zO7FRLgE1mFED/KnWY37uUTETrXvMBa48
	 tWLar7Q3RR4Ag==
Date: Wed, 21 May 2025 17:29:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <20250521-curious-dolphin-of-perspective-4cc8c2@houat>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
 <aApirJb9P-LOOB8j@jkangas-thinkpadp1gen3.rmtuswa.csb>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rl37qy3jxoobtiw7"
Content-Disposition: inline
In-Reply-To: <aApirJb9P-LOOB8j@jkangas-thinkpadp1gen3.rmtuswa.csb>


--rl37qy3jxoobtiw7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
MIME-Version: 1.0

Hi Jared,

On Thu, Apr 24, 2025 at 09:11:24AM -0700, Jared Kangas wrote:
> > >  struct cma_heap {
> > >  	struct dma_heap *heap;
> > > @@ -394,15 +395,26 @@ static int __init __add_cma_heap(struct cma *cm=
a, const char *name)
> > >  static int __init add_default_cma_heap(void)
> > >  {
> > >  	struct cma *default_cma =3D dev_get_cma_area(NULL);
> > > +	const char *legacy_cma_name;
> > >  	int ret;
> > > =20
> > >  	if (!default_cma)
> > >  		return 0;
> > > =20
> > > -	ret =3D __add_cma_heap(default_cma, cma_get_name(default_cma));
> > > +	ret =3D __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
> > >  	if (ret)
> > >  		return ret;
> > > =20
> > > +	legacy_cma_name =3D cma_get_name(default_cma);
> > > +
> > > +	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY) &&
> > > +	    strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
> > > +		ret =3D __add_cma_heap(default_cma, legacy_cma_name);
> > > +		if (ret)
> > > +			pr_warn("cma_heap: failed to add legacy heap: %pe\n",
> > > +				ERR_PTR(-ret));
> > > +	}
> > > +
> >=20
> > It would also simplify this part, since you would always create the leg=
acy heap.
>=20
> By "always", do you mean removing the strcmp? I added this to guard
> against cases where the devicetree node's name clashed with the default
> name, given that the DT name isn't necessarily restricted to one of the
> current names in use ("linux,cma" or "default-pool"). It seems like the
> strcmp would be relevant regardless of the naming choice, but if this is
> overly cautious, I can remove it in v3.

That's not overly cautious, that's something I overlooked :)

You're totally right that we should check for that. We should probably
add a more specific error message in that case though

Maxime

--rl37qy3jxoobtiw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC3xWAAKCRAnX84Zoj2+
duoJAX9hAWq/z0ihm1zZTbF17+eFM+dkCOxQNGkpF7/zsL9i44NQmwLDKPkIqTNv
euwhPhABf1kJHpTOiIbhwIC7VQYsdPmlucG8eH8pJSrd3FSG5iyuhauInEQ62awL
1HmM16MzAg==
=0SOR
-----END PGP SIGNATURE-----

--rl37qy3jxoobtiw7--

