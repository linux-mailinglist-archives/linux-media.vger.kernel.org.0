Return-Path: <linux-media+bounces-59427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCP2M3Mv6mmVwQIAu9opvQ
	(envelope-from <linux-media+bounces-59427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 16:40:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE0C453CF7
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 16:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7764300ACAA
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 14:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE3033F5B6;
	Thu, 23 Apr 2026 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSKQ1dmY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6599337B99;
	Thu, 23 Apr 2026 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776955240; cv=none; b=YU801NQdEspA55ogCZz0Wqr9aVM3VRXjIWXEwkkhYUas50S0Ks8OJL2I8g4ttIPYHSd4zhJO8L5ChoPwFilCF7mGUwnF9ZUKfg6i/XilL75C3XrUEcyzar/cN6AgGvsjaV8IgWXc4y+pcmyI/WzZGyPH1hfdl7FVj5AFYkfHCGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776955240; c=relaxed/simple;
	bh=iOuTeIMM5oJVlgiNLic8wDJebWv5mgIFlZH4BXGyXY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVvQKQebBOFG0NsQAFM4wGkWo9chBEXF4rZn9r7MOQ/nQ40nbtTnkwCFIrEelo/j6nRzN6Mb6S+qquGPI8ddDY2FKGJjILnpJmaYUSI8+bFGgthMPtVBPIFXbzIw8P9aqH4C6JSl0IR8oUapvpUbMEUEQaN+E0ug5UAiyo291Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSKQ1dmY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495CAC2BCB3;
	Thu, 23 Apr 2026 14:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776955240;
	bh=iOuTeIMM5oJVlgiNLic8wDJebWv5mgIFlZH4BXGyXY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSKQ1dmY1dK18rDYdZ5sVB6QDt82TplOn12kBIldh1+DF6Tqc8K+/AtVvtxK9BeuB
	 2OyMwQdNmk4i9UL4gEPJyMgknL6uZoBOCEPuxWRzZG6JWfmJUMtJj12R5hrc0zNE2X
	 J7p1mihItoNzLV7sjMXCJSKaeK/sIZ34o9MEBYiyEf85wqjgCH9Kj5PtaWoA59K4yC
	 9PNipkTjxxWVOImzOXaOrAxARehJe3OFNEBThl3lwXh3iYoBqnuNOeSkZapHbxJ+sX
	 QZ0tj0Jahe+/8jtZjfumIeJoRVlyjQFi+su3JRYTrmoi76UenSDXV7wZF54kjKaAH+
	 nWPdVO8Gi3fNg==
Date: Thu, 23 Apr 2026 15:40:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: sakari.ailus@linux.intel.com, hansg@kernel.org,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: AtomISP tree for Linux Next
Message-ID: <132d71a4-25d7-48b5-9705-0e7d7dfeef20@sirena.org.uk>
References: <aeop-rkoHOgF2OgQ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jA4Bq4Fj3Sly1y2v"
Content-Disposition: inline
In-Reply-To: <aeop-rkoHOgF2OgQ@ashevche-desk.local>
X-Cookie: I'm hungry, time to eat lunch.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59427-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxtv.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9DE0C453CF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jA4Bq4Fj3Sly1y2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2026 at 05:17:30PM +0300, Andy Shevchenko wrote:

> I think I will express the thought hanging in the air that AtomISP driver needs
> to be exposed in Linux Next tree. Currently it's being stored on linuxtv.org
> servers [1] which I think is not often appear in the Linux Next. So, for now
> can you add that tree to Linux next

> Also note, that one of the reasons behind this is a flow of patches against
> the driver that basically repeat each other or unapplicable due to newcomers
> have a hard time to realise that they need to be based on a niche tree.

> [1]: https://git.linuxtv.org/sailus/media_tree.git/log/?h=atomisp

> Tree: git://linuxtv.org/sailus/media_tree.git
>       https://git.linuxtv.org/sailus/media_tree.git
> Branch: atomisp

That'd be totally fine of course if the people working on the tree are
happy with that - it looks like it's Sakari?

--jA4Bq4Fj3Sly1y2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnqL2MACgkQJNaLcl1U
h9AHiAf/QlMhaiphPlnG4Vflt9MmEJ6q/CKe/Usnt2rLfEsyvm3CeSrZIlE1DO5t
mK7l839VMt+zgX4Kt4X3ZaSAcsjFMuMXJZ4LgfyWir2EB4jhLXyAtmSDzehr079/
eUJtXfr8CXMTRLfjtNqHbzI3XH/vkRCCscTtADGCfrImz+ct5+FhR1Iel752wrrG
JfLLuPmFGzaTs9ozW8/NC/WaLhCsbdROo+JDI5OvG7n3ch8f63+C8lNzDrRqhH8M
jHTMvWh4ctrw6Y3ecimH8rszPoGqo3dOIVyy3nFZ4Gv+LTKtDmXzgP9QmkSSY5PV
TnYzH2oZjfxX/MXeekQS6A9z6e8/IA==
=T4nD
-----END PGP SIGNATURE-----

--jA4Bq4Fj3Sly1y2v--

