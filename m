Return-Path: <linux-media+bounces-1276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F17FBBA2
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 14:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55E20B21C5E
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 13:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC57058AB8;
	Tue, 28 Nov 2023 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGtQ2wcz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1015578E
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 13:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2F1C433C8;
	Tue, 28 Nov 2023 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701178320;
	bh=XaLbU8H1rEGdfg4Iqk3KSxG5DRQC6e/xw+Mqlqs3K+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGtQ2wczoebGP3LbwJj1/8gibC1gvR9QIsZGJlC9Ue0O/39oySnC/PSQyfB6qFfvV
	 3KhpsAhLGFAvlyzVwVTygKq4p5MyJ5WY2v7x9qSgl03OrNd9NfIonsjCz3uNLI252M
	 jnaw639UHdJZirBm6ZMad7l4dfjlj1LqQtQcwge24d6Zc9alhZcZc6IFyuttGMkruE
	 zogVQ/ygyP+UQJJv1TJzVvbMSZMhy+fwNMbw59cYacbimXjmMb/rw1akVnidxHUQKX
	 3N/OkOUa/1W6OERP5EoJcXB7zzP+OxNlxZsCYZhqivWl7Y8pNQMRwj72n5SDtWPMR4
	 9E4LAeg0pN6DA==
Date: Tue, 28 Nov 2023 14:31:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marco Pagani <marpagan@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian Koenig <christian.koenig@amd.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <wmv55cgrjx343k2pvdlnigrtehv6oq7hiss3k24xmwec7hepes@riq75ckh7eh5>
References: <20231123100147.212645-1-marpagan@redhat.com>
 <dkh6t5cya7tw4wz5aqrgvnqqnyzzgvbyvezxexy6pyspju5qbd@cdl4vvs7kvnt>
 <9fb1cd9d-89cb-4f45-9d0c-9f0102e000e6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xa3olno3bho23d7h"
Content-Disposition: inline
In-Reply-To: <9fb1cd9d-89cb-4f45-9d0c-9f0102e000e6@redhat.com>


--xa3olno3bho23d7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 11:15:12AM +0100, Marco Pagani wrote:
>=20
>=20
> On 2023-11-24 09:49, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Nov 23, 2023 at 11:01:46AM +0100, Marco Pagani wrote:
> >> +static int drm_gem_shmem_test_init(struct kunit *test)
> >> +{
> >> +	struct device *dev;
> >> +	struct fake_dev {
> >> +		struct drm_device drm_dev;
> >> +	} *fdev;
> >> +
> >=20
> > [...]
> >=20
> >> +
> >> +	/*
> >> +	 * The DRM core will automatically initialize the GEM core and create
> >> +	 * a DRM Memory Manager object which provides an address space pool
> >> +	 * for GEM objects allocation.
> >> +	 */
> >> +	fdev =3D drm_kunit_helper_alloc_drm_device(test, dev, struct fake_de=
v,
> >> +						 drm_dev, DRIVER_GEM);
> >> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);
> >=20
> > Sorry I missed it earlier, but you don't need the intermediate structure
> > if you use
> >=20
> > struct drm_device *drm;
> >=20
> > drm =3D __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0,=
 DRIVER_GEM);
> > KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> >
>=20
> I prefer to use drm_kunit_helper_alloc_drm_device() with the intermediate
> structure. It makes the code clearer, in my opinion. Initially, when
> developing the suite, I was using __drm_kunit_helper_alloc_drm_device()
> as most test suites do, but I feel the list of arguments including
> "sizeof(*drm), 0," is less straightforward to understand.

Then we can create an init helper, and you can allocate the drm_device
through drmm_kzalloc, but I'd like tests to use consistent constructs.

This can of course be made as a later patch: you use the same construct
the other tests do here, and later we work on the init function and
convert all tests to use it.

Maxime

--xa3olno3bho23d7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWXrzgAKCRDj7w1vZxhR
xSfVAPsF1Ca6WiaICCCMiadpBZDVn0JEV/LwVOotZsctwQGtpQEA2rrnLlTgWe0H
4ABF/XTvcd0zP3qiEHeNWwTFCT8/swE=
=SzdI
-----END PGP SIGNATURE-----

--xa3olno3bho23d7h--

