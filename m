Return-Path: <linux-media+bounces-62659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOkkANXjEGqOfAYAu9opvQ
	(envelope-from <linux-media+bounces-62659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 01:16:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E0F5BB6A8
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2026 01:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0523D30074ED
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F033921D0;
	Fri, 22 May 2026 23:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiOGX3se"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B45A349CE0;
	Fri, 22 May 2026 23:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779491788; cv=none; b=dauSDv88cA5BV5z9uS9wtwJU/3O3prThKt2D7BUJcTi0od4SwNxWftz/sjI/tSfCVmSEvA+vl4GF4XiH1IZUAXtN+StlJmOWqVcdY7YgeaIUJajmxe81fDj51gFNOucyEdbz0QRJIvtOMBehP6sR3eVlLZLHym/HnR1ROOLSNVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779491788; c=relaxed/simple;
	bh=4YPCWcxAu0iOF8i7h04XZSQDVUC22NXQoLRVN0uSfYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsQzjU4EBehXAzvbv1J5iR7IxnAtCrdZUsuGJFgv3DXUfBTjsn6c5137Qs6a/T/lVTv5FGUlLpO3aWlKFO70Y8XE5yr/tRpaLPV5pKuS3TkBvjjIfy+BngmKie/OIHV+GE8Nlr17mXseUHZFtrJI9XlerN/IyuYO/XUUKrsbVH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiOGX3se; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5641F000E9;
	Fri, 22 May 2026 23:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779491786;
	bh=4YPCWcxAu0iOF8i7h04XZSQDVUC22NXQoLRVN0uSfYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RiOGX3seS6q1O/Nql+cOa1oyVDOPF1FjX+PmoEcGaIvcQueRbAbv/K/ayBB+QIEeS
	 eBkP3ZEYcCBGmJb8tk/meb+ptgEhqxwQWQGzOUpoDqGUvmowc/zdUBd8OJAK7FiWMn
	 evn6A1z35Xatn31mEshfG/1OnnZpjUu2LTFe+DX2UhvRQstl0rvhPC/g7cxzWUucdm
	 Tn8O+QNTZm3SyrhQXY5x3+xe1Nb3RIVfsHklJ6DvtnIN1yH+XTkB3qUR6oMM4NiaBO
	 j/xGFZTTxxN5nBq22o32XWypmAa6uZmC12AcpsVVOKmEKLqZpIHMSM2NUPEYG64QMb
	 TkHqcBtjs9qBA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 833452492F1; Sat, 23 May 2026 00:16:24 +0100 (BST)
Date: Sat, 23 May 2026 00:16:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>, hansg@kernel.org,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: AtomISP tree for Linux Next
Message-ID: <ahDh37ErjwILeswF@traversing.sirena.org.uk>
References: <aeop-rkoHOgF2OgQ@ashevche-desk.local>
 <132d71a4-25d7-48b5-9705-0e7d7dfeef20@sirena.org.uk>
 <aeskxK7GODqMUNsH@ashevche-desk.local>
 <ag_-6fqLzpvqNKw7@kekkonen.localdomain>
 <62b17869-008e-431b-a450-1b2e95111734@sirena.org.uk>
 <20260522202336.216559c0@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kCHBICCpzkwx1trR"
Content-Disposition: inline
In-Reply-To: <20260522202336.216559c0@foz.lan>
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62659-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[traversing.sirena.org.uk:mid]
X-Rspamd-Queue-Id: E7E0F5BB6A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--kCHBICCpzkwx1trR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2026 at 08:23:36PM +0200, Mauro Carvalho Chehab wrote:

> If nothing have changed, linux-next also has a similar policy of not
> wanting patches that won't be merged for the next Kernel cycle,
> which means that media patches after -rc6 would also wait for the
> next -rc1 to be merged on a branch that goes to linux-next.

That's correct, yes.

--kCHBICCpzkwx1trR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQ48cACgkQJNaLcl1U
h9Bhvwf9Hlshf4PnNA1UZ9EezbVHZYikmk8zOvU6x5Nr61ckDhuhgR5bbwJC16wW
DWIMCb8FnLEOeRNz5B2bomepUK8DOJJswJD77rfQrFw3dbZnS7OML5/cB13x/3Zq
ipkiH9vvGkVYhjNItvXb7ipvJMEJkkz8TLTgVdDyFXk0vTt84cbzruxyx9rEzBiQ
WaUVi6pWgnlLLxWy8Gp2b592OuwzqTFAnV3P0hrp4Hkqh42RZ9IEFtAzqAB6aZCa
uzk83htneiiVhBxLs50oEr8ofdOqQYViZqKZ2/JAiPf0LTCYrnlDD2bD4rtVacXV
qKIU7wubf+RdYdSBJM0QskcUg/feEw==
=xeRx
-----END PGP SIGNATURE-----

--kCHBICCpzkwx1trR--

