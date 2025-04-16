Return-Path: <linux-media+bounces-30297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3E9A8B149
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 08:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B08603AE78D
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 06:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E0C22FE0D;
	Wed, 16 Apr 2025 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Yi8PPqJu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881122E3E6
	for <linux-media@vger.kernel.org>; Wed, 16 Apr 2025 06:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786473; cv=none; b=qqj051pnSw5UQjIFAZuR90976Amgpa5k0aMD88iXAu0XNwUQGMsUA5sDe19t+0dZ1e2cl2+ACqnYIlh9oADW+xZEIYOo/wX5YD55IHkG624tZEKXzmqw3iPPun7YJrKDLe0A1hmlKPLOHYoeDrfYOaQc4b4taBPPlm6O85KGmj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786473; c=relaxed/simple;
	bh=6Ccyemn7n/IGopP/M5/PBB8KrR3LgWUjyMhQTKk71ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arNBM5aGYdReknhZ/uiu2Gg4VE8zgo0L+aW+kDy5EaydC/XEAWUZUsyi8DTjZmCGrspVoCRsDbjTGCFgMOJwaD2Uc9P2T06plljfsNEF3HS5znH4z6nY1eXO/0Af1wB7aMij0TbuIu5OSD05+MHXcdsbo5Jd/8Pd5cwkHHzFa3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Yi8PPqJu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6Ccy
	emn7n/IGopP/M5/PBB8KrR3LgWUjyMhQTKk71ps=; b=Yi8PPqJuCbHGR6gMxK57
	fhDycub62seGjI4HDqfNSvSE81uAfw5bqcC3aHRPifOl3IUQd95uvbk2EK0gFGvt
	OmF0OCNMl9wM3s8B1rayyLHlMcGNNrrz3g1++OqMlslO/xaSkwB3a6Bj7yX/2NlC
	K7bKr95zYzuRoctOnu7tSG6vZtDQuoCzzJDouXRDC/a/tF/fm6IOJpNBpOSFFtxK
	woIgJSjy++DLpc8Jtsvl4ac8wCvIDickZWP05K+qe2fvMl2+3/RLUOFUdBh3lSvn
	+NbZb9J1Hyh0E6kZUfiSXpIoVN3/rsnIf4y19cMcXpDFGoozSNKRypPLL5UPABKA
	ng==
Received: (qmail 601105 invoked from network); 16 Apr 2025 08:54:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Apr 2025 08:54:24 +0200
X-UD-Smtp-Session: l3s3148p1@7KFhwd8yYpkujnsq
Date: Wed, 16 Apr 2025 08:54:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 6/7] i2c: core: Deprecate of_node in struct
 i2c_board_info
Message-ID: <Z_9UHrgho0dGoUrG@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250414100409.3910312-1-andriy.shevchenko@linux.intel.com>
 <20250414100409.3910312-7-andriy.shevchenko@linux.intel.com>
 <Z_69Jml3-CKi13wB@shikoro>
 <Z_9NEK7BDrvAQ0Qo@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iRsCyH8BhKmBPv6F"
Content-Disposition: inline
In-Reply-To: <Z_9NEK7BDrvAQ0Qo@smile.fi.intel.com>


--iRsCyH8BhKmBPv6F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > that Linux kernel supports. Deprecate of_node in struct i2c_board_inf=
o,
> > > so users will be warned and in the future remove it completely.
> >=20
> > Is there a plan or volunteer to do the conversion?
>=20
> Yes, long-term as I'm alone for many janitor works.

I could help here if you are not keen on doing it on your own.


--iRsCyH8BhKmBPv6F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf/VBsACgkQFA3kzBSg
KbY1OhAAr1AFwa5djh2CwYoBcbnm3fRtqdnx9velF2OW4wCAM02+qjiwNLHAQjTe
EiLswXHEkuKaPa7fK3zRk1ZNFdW+HO2aTMsN23NSa7FXx/5mnkD5BRzsasqLOAqL
deba4iUZ3dTOlcfqsYaVCyp2Z6lXGAqpeFTfjQL6bmt1rzZ4CNeF8ysQpy0ZgZRp
/ySNVzCumNH1/KE7qBCLXsdmdJKHotKP+WpkdFdQ2liVfrj6bJuBm902cRMcFwcK
E3fjqjF1zJ5NfeEh8gwBEmUc8f/IOzSk0DcPW727VMmbIedTUFnUi6Y7ynl4QyBX
a0XeJgvY9Jd1yl7hFrGb0QcCj1Cw2RwoTwaiMJIo+6FXX/9YOFE6mGw1QsOsJ0HN
GGLYUYen5fKXFguYen3Msurt0O+Bya0EvFnzVSggTNlIqL5Rr41jrfCIJKeuyfo5
8nbGsS1qpGUt6sihBqt8Db2XUGS0zLOUXDwu5J7miR/rIh+Mpo7AM+PWbgHhtBsN
Jj+3B72GSoLDLtH7zdqmla3ab1hvvDe4sNooDtexUmrKxwrYQuId5/YvqpPE/Lxt
LHOVwzdNM4SqHibSts956gn4AXi27Th3EUEl0wO1lSRFm5asHmCl5XCL9Sj3OPAE
jt6/C7RmagJjS4KHncADzDZwi4rlJu5QHTCYgxn4GX0AyWWtY+o=
=nWsS
-----END PGP SIGNATURE-----

--iRsCyH8BhKmBPv6F--

