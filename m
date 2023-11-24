Return-Path: <linux-media+bounces-960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4BE7F6EDC
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 09:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C6FC1C20E21
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 08:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 826B08BFA;
	Fri, 24 Nov 2023 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPkLbo7W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F34C6E
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 08:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B774C433CB;
	Fri, 24 Nov 2023 08:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700815743;
	bh=ts0KYH2uDH1q8ALGoS/p959d2Z3AhGWJPg58oHHCRiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPkLbo7WvA5ps/jIBO4P0QiKaOtmRQvI+hrI43BegqFBdXQ0euxanJoeOutDImOzZ
	 26rKPC2WhMG2dFM6otNzxvJxKZ9ucdxy5MbV8I94wwaCOzlYMCBzEhYQ0xtznrkJi3
	 brGuMwgvz6TTB5x50Ggg57G8n40J6dSlvfaEijB+Cv5ptnROBVXgy9l43PcGPp6zoV
	 2NWARGz6wntemBdtMKqNV+Xt7OFKIwKE0R3whpBkYfuXrmqTAGyKkasar+T2QRsnbo
	 RBDdftQw/wva2ea2uW42I821gm8uFZ7OIAHU7WkhUgCMzVwmBjIuYOiU1Xowyll51U
	 rj+QjC1pXZLLw==
Date: Fri, 24 Nov 2023 09:49:00 +0100
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
Message-ID: <dkh6t5cya7tw4wz5aqrgvnqqnyzzgvbyvezxexy6pyspju5qbd@cdl4vvs7kvnt>
References: <20231123100147.212645-1-marpagan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtvjqun5bfrvozeq"
Content-Disposition: inline
In-Reply-To: <20231123100147.212645-1-marpagan@redhat.com>


--rtvjqun5bfrvozeq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Nov 23, 2023 at 11:01:46AM +0100, Marco Pagani wrote:
> +static int drm_gem_shmem_test_init(struct kunit *test)
> +{
> +	struct device *dev;
> +	struct fake_dev {
> +		struct drm_device drm_dev;
> +	} *fdev;
> +

[...]

> +
> +	/*
> +	 * The DRM core will automatically initialize the GEM core and create
> +	 * a DRM Memory Manager object which provides an address space pool
> +	 * for GEM objects allocation.
> +	 */
> +	fdev = drm_kunit_helper_alloc_drm_device(test, dev, struct fake_dev,
> +						 drm_dev, DRIVER_GEM);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);

Sorry I missed it earlier, but you don't need the intermediate structure
if you use

struct drm_device *drm;

drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_GEM);
KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);

Maxime

--rtvjqun5bfrvozeq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWBjfAAKCRDj7w1vZxhR
xXUQAP9od+klgBILfGLPVPTSdxphG1xUGLo3XXyblMPTgFMz7gEAxqV2NxcgWYJO
vkBCPIX+LUVttVYWyhQvIJ3y+kFqogM=
=eplg
-----END PGP SIGNATURE-----

--rtvjqun5bfrvozeq--

