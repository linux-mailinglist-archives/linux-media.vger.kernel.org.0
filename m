Return-Path: <linux-media+bounces-62618-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCK0JKZHEGoRVwYAu9opvQ
	(envelope-from <linux-media+bounces-62618-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:10:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E95B399B
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D089F3027334
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89983672A8;
	Fri, 22 May 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLvoq88t"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327632FE057;
	Fri, 22 May 2026 12:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451805; cv=none; b=ut4qniWRoBufrG6/2jtDz/rAEWbXrku5EPmxrqiKNiM9GB9FREnnbJBjPoCXZYTM0oQSWDoB7OFzkkwqYg/bPg2GCnKGvEMXcHFoYC7sTrivUEn9WwsBd4eZMSR55rssw3ejkvXtCauZipoYHL1LTFWWVTbP4UoxmQ+RQreDywg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451805; c=relaxed/simple;
	bh=3Rmn/kzBs9r48TbqNB3vKX5ssEhg8rzMgCYbvtVU/hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+pntEDsj1XvFjoq9BeWkIoZPxEN0uF6xTn/0Su//ou/akNd3XMe1COHAP7aw+KrLBdNjZCWIwG9O0EpA/FYPn7kTOubBA7KnWotlTgtwOvH8x1BI++0xIh/mO9XBG+m1WwIch48XyOH22dPM/s9bxTdc0EMCmOm+Uby7Mp4pBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLvoq88t; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0401F000E9;
	Fri, 22 May 2026 12:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779451803;
	bh=3Rmn/kzBs9r48TbqNB3vKX5ssEhg8rzMgCYbvtVU/hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YLvoq88t6VB69PloPhfyZliK0nxYZQ8P14870FxG22NzsHhdoxvf1COISYePIDWfv
	 su8m4IepueRymWfWZeDPlLrHhHSrJu7N/TTfLq5VGAgQS9qW8xXik+NjOW6YiYaHWl
	 /VjAjeJQVVtqZJJ+GzbhoHVs9/ukaCtqu8muWZ5zp26TjpAQcbQVJaJierMNbvAA67
	 wYz7Ma3XYyloWdkMiuaqfy0SmUZtwBtWL6CCMF9dP5xBKDPok3ObvSYZpm0T9VYC2D
	 gilfi2aIdkFjrJgnmwoaI1SlKVy+UCKzNwDsNdr+VeRA3VJT6QgPrkJT6C21m9llr6
	 RxmDwVl99EjsQ==
Date: Fri, 22 May 2026 13:10:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, hansg@kernel.org,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: AtomISP tree for Linux Next
Message-ID: <62b17869-008e-431b-a450-1b2e95111734@sirena.org.uk>
References: <aeop-rkoHOgF2OgQ@ashevche-desk.local>
 <132d71a4-25d7-48b5-9705-0e7d7dfeef20@sirena.org.uk>
 <aeskxK7GODqMUNsH@ashevche-desk.local>
 <ag_-6fqLzpvqNKw7@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cAWGZQbomoLVB9wr"
Content-Disposition: inline
In-Reply-To: <ag_-6fqLzpvqNKw7@kekkonen.localdomain>
X-Cookie: Celebrity voices impersonated.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62618-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid]
X-Rspamd-Queue-Id: 0B2E95B399B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--cAWGZQbomoLVB9wr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2026 at 09:59:53AM +0300, Sakari Ailus wrote:

> I guess I could push patches to the atomisp branch after running them
> through Media CI. But I'm not sure it's really worth it: the long backlog
> of patches is now largely gone and the same fixes or cleanups can be only
> merged once anyway. So would you expect the flow to still continue at a
> similar level? There's a limit to which degree this driver can be improved
> with such cleanups.

FWIW so long as they don't cause conflicts all the time the marginal
cost of including a tree is effectively nothing.

--cAWGZQbomoLVB9wr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQR5cACgkQJNaLcl1U
h9DvEgf+K3D509s9GnyhgwKNzFOLaN0VIRDMxx3nILrR1cvvafnTqBOzvCFnzBxg
kS6Nmm9m2IbQeUaPydPo5sAPRxnaBoU7YbBTarT4HP/vmU6MoX+uYiOl+kRbcx4K
e9cGmysFUzPoGBwDxq4W8MMfFMspzd8ihdWh6thcP7Sh5vMvZ1v70Ng9g9P8tLzM
mzMl0IgIltoiB95pDA2n0m77if619NOoIrNsVsdWbnpkz15C2/X7MsJUEQcR5AAz
hhF+YF1QtsukMHcXM3MVhRBA3nHEBToQahqS9YyHY04aCMoFpyl925V7QY7rKiUB
nvb+VqkIhXilHyjcAFI8v16saXLh/w==
=O2lQ
-----END PGP SIGNATURE-----

--cAWGZQbomoLVB9wr--

