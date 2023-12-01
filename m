Return-Path: <linux-media+bounces-1461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E70588005DD
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 09:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 771D4B212D2
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 08:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA47F1C29A;
	Fri,  1 Dec 2023 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUbR3C5N"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462DC12A
	for <linux-media@vger.kernel.org>; Fri,  1 Dec 2023 08:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1222DC433C9;
	Fri,  1 Dec 2023 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701419897;
	bh=BF9TFx1XQRac5K0WxDFgJSLMvWyF3UMV5o7kl6PNa3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUbR3C5Nni4f/AK5YCWL0GZf6G4OsCk6eTNWOASK4uFyMOSH0dxh2GOnmVZPc37ZI
	 IeVg5DuQmbxU0fOsLeTgNUUh930IaFFN9cwRwd7mvzohJSwIbcXY6Brrr8pUOybC01
	 4bNJUhqEWpNbc0K2P3m+OiNyjkYcMCZxd4l4cRnWJ8nx3nlaMVzIj27HW6vg7ZjrFq
	 wJBq/S1/wxixgSRbBCrvxFcgtV/clGEziSghBb6GOUxz4042uxqUy6qpTGKs14eR4p
	 qxxT31tdSRHCAYvndC6a/xn6lIbsydwDh4jWA/yR4qM+YX4gMN6YQj5pIOL/6YBi5V
	 AJPExUEnfJwvQ==
Date: Fri, 1 Dec 2023 09:38:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marco Pagani <marpagan@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian Koenig <christian.koenig@amd.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <gvnahzwy2r2bjw3nrfkyz2oqbtbvmhx3gkygiwujkrhshofvsh@g5qwttznv4ul>
References: <20231130171417.74162-1-marpagan@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eanybzkzl3a5ywpt"
Content-Disposition: inline
In-Reply-To: <20231130171417.74162-1-marpagan@redhat.com>


--eanybzkzl3a5ywpt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 06:14:16PM +0100, Marco Pagani wrote:
> This patch introduces an initial KUnit test suite for GEM objects
> backed by shmem buffers.
>=20
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marco Pagani <marpagan@redhat.com>
>=20
> v5:
> - using __drm_kunit_helper_alloc_drm_device() to avoid local struct
> v4:
> - Add missing MMU dependency for DRM_GEM_SHMEM_HELPER (kernel test robot)
> v3:
> - Explicitly cast pointers in the helpers
> - Removed unused pointer to parent dev in struct fake_dev
> - Test entries reordering in Kconfig and Makefile sent as a separate patch
> v2:
> - Improved description of test cases
> - Cleaner error handling using KUnit actions
> - Alphabetical order in Kconfig and Makefile

Applied to drm-misc-next, thanks!
Maxime

--eanybzkzl3a5ywpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWmbdgAKCRDj7w1vZxhR
xd2VAQDEvdtX1QM/J4fJnipIrY/CcDfinJMPhqX/YZ3XI5PWyAD/VAJ1W1AT0Qav
/9ccIWyYaCF7NHxu8TIL/afyEbb7KAY=
=WKS7
-----END PGP SIGNATURE-----

--eanybzkzl3a5ywpt--

