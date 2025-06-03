Return-Path: <linux-media+bounces-34011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4657EACC76C
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 15:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 128737A2150
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 13:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339BA22F740;
	Tue,  3 Jun 2025 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpgetnCo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9486F22FDF2
	for <linux-media@vger.kernel.org>; Tue,  3 Jun 2025 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956429; cv=none; b=NAP6MloeradIIdP+BHFGYF2CB8GglZINzzuWEi1Pfmqpp8dtxlq+ES20gJwh7ZfAF4Ww30yvksc/MBR4MloSCARWQBEKs5vF7jUqE910cU4POzeID2bZS1zmQ4zfUNhY8XXPpAd/xCIrh5Vv8X0o58zq2Gd0GIuZdeq1e5op3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956429; c=relaxed/simple;
	bh=39QVSQdlEunyDPQMXllJix/sOLusRs7AyHXNLyYHebo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uATjkTxUduKpwjOAV452eLuumLPBJgyxFvUxU0xl4lma83BNLYxuzF4m6JwfUOwXN3MLJunWP8woSz0joAp26/6vLQxwsazZGzm5vJifl8C78Pzo/+ZC/W1f1mxVL+d9UDqZMR4fuVRY+eCW+nDLdDwFAwIVK10adg6TRa4/dDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpgetnCo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAFAC4CEED;
	Tue,  3 Jun 2025 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748956429;
	bh=39QVSQdlEunyDPQMXllJix/sOLusRs7AyHXNLyYHebo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpgetnCodjjXd8xYtQ0AJXBj6gThGptV1PPVXhRTFPf/ZW9mXeevHkJ422HpPi9IE
	 3cluumTXUPGLdV5XsERn/VfOi8xgnsocmRxb05lr5pudms703buYhdSw+OvcvCnwF9
	 CyqtkWtgIs30VMlAViK/SZ+IKzcZ2qb4mNJtYopCf+Xmby9eg1IYcmhvjtUTPhg9Po
	 TcW0nguoR21uy5BQptps8fJ3+ZXwoVWOBbazHvATqSEN0xbD7N9rFgT5ODO5fpLm1+
	 rlBtX7DS2zbd5CLgCF1GpkUjP4XapI02R2XyPO5HjUPkdhqvAfNe3Z273BhJhatZmy
	 VlRq7y5DpNqow==
Date: Tue, 3 Jun 2025 15:13:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
	dri-devel@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	kernel-dev@igalia.com
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
Message-ID: <20250603-outrageous-kakapo-of-felicity-6dc41a@houat>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dqnx5uyzsy7xnzpf"
Content-Disposition: inline
In-Reply-To: <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>


--dqnx5uyzsy7xnzpf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
MIME-Version: 1.0

Hi,

On Mon, Jun 02, 2025 at 04:42:27PM +0200, Christian K=F6nig wrote:
> On 6/2/25 15:05, Tvrtko Ursulin wrote:
> > On 15/05/2025 14:15, Christian K=F6nig wrote:
> >> Hey drm-misc maintainers,
> >>
> >> can you guys please backmerge drm-next into drm-misc-next?
> >>
> >> I want to push this patch here but it depends on changes which are par=
tially in drm-next and partially in drm-misc-next.
> >=20
> > Looks like the backmerge is still pending?
>=20
> Yes, @Maarten, @Maxime and @Thomas ping on this.

It's done

Maxime

--dqnx5uyzsy7xnzpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaD71CQAKCRAnX84Zoj2+
dp9jAX9u79CLhp4GCgWfIOWa3qsFqPl6tJ233zRU0nefH4IQ5uGsfi13qF6RXPic
qi8D9QMBfi8ZjYy/0C1GdO3wm3XAOpv8rhv8JVUNzDAe0KFrs6bFRLLTmXpBZ7RZ
qswqWy6hJw==
=2vgs
-----END PGP SIGNATURE-----

--dqnx5uyzsy7xnzpf--

