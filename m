Return-Path: <linux-media+bounces-24880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C1A150EA
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 14:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F7A07A34C2
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 13:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219AF1FF603;
	Fri, 17 Jan 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkGeUo2S"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C41DDC2D;
	Fri, 17 Jan 2025 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737121771; cv=none; b=gMYl1ZI6cNkT5s3w9l6F32OYweYTZWnbD1DMUtOqD1SJpAertZkjQMMcc7kQkoeYXE588Lun+3KUbFm+QGVnK5h36BX5UbVzYVXc7roslK9d4heoH4UCHtl0mD9pPZuiMJivPpufoApyvf/LdbH/DmnNEv8bb0EPIX8o6n63Rsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737121771; c=relaxed/simple;
	bh=O7JFQicJ0NtEcx4CvhyxwTYghPzU/D+bqAd4IyrgR+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vD9lJKMgR/OdMQhRYIVYInanOuF/itBERBKXwhM6e3039Grd/k7Gye6UAyaYmTP2j5gcAXMKS0wJKzoHkZN6WnqWfPR4DDIeH+4DmRJZ4DpxCL9xKKFkplakMPgiDDkYabrTg4y5RsBKjmLD6oVxZFm29zJ260zxVTENprBb4SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkGeUo2S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95310C4CEDD;
	Fri, 17 Jan 2025 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737121770;
	bh=O7JFQicJ0NtEcx4CvhyxwTYghPzU/D+bqAd4IyrgR+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkGeUo2S32+36cRZd21fSE2lwlcQGITIoU2+TwX2FccHaYYL2FbZLe7r1806Hk/59
	 u2XA9D2Vnqxv9ltTp/Lez19Tc+i/+U3WVxOC/5ESVKODlaFQLanM0ltpgmdMrvh2XS
	 ZumNPpdZediTeToDBFV6JI8zbr0HRUOdii6FwVJ82oIvUZ1QlYnPeMv131/lgqv0kh
	 Wp6EubFOWl5H4kabsxuqtpOa32x8qBU8LjVbrS/6lZi0Ihybe9Dj+w+s2FcEgXbJiR
	 z9fHDGnjorEw2WKqV23w5BIKr2+o0tJgPIWIscyjxU+39WkPqJ2wmy8vB9MD6Lk9pE
	 medndEQ+J8pyA==
Date: Fri, 17 Jan 2025 14:49:28 +0100
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Andrew Davis <afd@ti.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name
 definitions
Message-ID: <20250117-teal-limpet-of-attraction-cc30dc@houat>
References: <20241202115827.50388-1-mripard@kernel.org>
 <CANDhNCpTnc6=YkjQgQngRCw1_xLWgOFrcjTxrrGX+bRhvGb5DQ@mail.gmail.com>
 <20241203-cerulean-ringtail-of-speed-920c5f@houat>
 <f6412229-4606-41ad-8c05-7bbba2eb6e08@ti.com>
 <CANDhNCqtMUaO4Y_7UYGJebDEdN==vTAQRexuuek5SZt5rqd8sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dtdfvpfetnsaprru"
Content-Disposition: inline
In-Reply-To: <CANDhNCqtMUaO4Y_7UYGJebDEdN==vTAQRexuuek5SZt5rqd8sQ@mail.gmail.com>


--dtdfvpfetnsaprru
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name
 definitions
MIME-Version: 1.0

Hi,

On Thu, Dec 05, 2024 at 03:17:57PM -0800, John Stultz wrote:
> On Tue, Dec 3, 2024 at 11:04=E2=80=AFAM Andrew Davis <afd@ti.com> wrote:
> > On 12/3/24 1:44 AM, Maxime Ripard wrote:
> > > On Mon, Dec 02, 2024 at 11:12:23AM -0800, John Stultz wrote:
> > >> Hrm. I'm not sure I see the value in enumerating things in this way,
> > >> it seems like it will be a nuisance to keep current?  Maybe something
> > >> like:
> > >>
> > >> On most systems the default cma region is named "linux, cma" or
> > >> "reserved", with a few exceptions:
> > >>      - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> > >
> > > I'm a bit worried about doing so. What if, on a "linux,cma" system, we
> > > have another "reserved" heap created with different semantics?
> > >
> >
> > Having the "default CMA" heap get its dev name based on the method that
> > created it was arguably a mistake made when first upstreaming this heap.
> > We should fix this, then maybe add the old name as a link just for
> > backwards compat as needed.
> >
> > exp_info.name =3D "default_cma";
> >
> > All other CMA and carveout heaps will have names based on their
> > method of creation as there may be multiple of them, but there
> > will only every be one "default CMA" area, and its heap should
> > be named to match.
>=20
> This seems reasonable to me. Maybe putting the link creation behind a
> compatibility config so they can be later deprecated?

I gave it a look, and while I'm not super experienced with fs in
general, it looks like there's no easy way to create a symbolic link
in devtmpfs from the kernel.

I also tried to cheat a little and create another device file with the
same major/minor, but that doesn't look trivial to me either.

Do you know how to do so, or are aware of any other part of the kernel
doing something similar?

Most importantly, do you consider it a requirement before merging that
patch?

Maxime

--dtdfvpfetnsaprru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4pf5wAKCRAnX84Zoj2+
dhtAAYCFvHr/OFIpzNt69O/MpCCKxMRZUiBIx4bA83PUEIA5vMesA6BYgmG4/jK2
w2V9F40Bf1Shy5XU83T4+cN0Ry59H7i+EPtgGeLOMcOH2Vm2BcCRcNCi4CJbH4RR
WTQDDsHnng==
=cN3i
-----END PGP SIGNATURE-----

--dtdfvpfetnsaprru--

