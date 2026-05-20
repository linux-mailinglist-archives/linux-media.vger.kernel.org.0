Return-Path: <linux-media+bounces-62287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKwLMxm6DWpT2wUAu9opvQ
	(envelope-from <linux-media+bounces-62287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:41:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C9558EF88
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 15:41:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C92EF3075428
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCBD39B94C;
	Wed, 20 May 2026 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFZlCZC1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A703B2D97BB;
	Wed, 20 May 2026 13:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284337; cv=none; b=a2Q51ftmX0QKOJhNSVQtQqhwmm3OijZU2ybNodI/dvKX7LBWX9asYo3JjtUuGEeL30VZHblytBBOGXrjurlYIshj4fokumbdHVa4AOLK486XS3tAH4xGeGJ8Fy9AebGECzOUABA6ImEgOQ2+KM0nOxaH5e199tJy8a1QH8D2Nk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284337; c=relaxed/simple;
	bh=BBW9MkvpXkEKYlC0T9jL+xjuWtM4N4UIVsx7tlL26MI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAwKxEDq1wdY3nIjn17or/5+vrGuQrLkXwg3Ha90GZiffqFnbbU7kTfwGWhxjUmXKlXkIrjGPMYYco2lfCiNs9crYDKTlygzPN/mgGwjlWL9iEozlAj7sj+TRHWFt6WwOjU5lwzDOrOv2j6NY0vw4gv/ZgjvSMkNBWr+Eofmyls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFZlCZC1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6760C1F000E9;
	Wed, 20 May 2026 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779284336;
	bh=jK6lLNJVscZr4F/ruDQZQSIqU/TbDpAb9hmsx95/LbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFZlCZC15579EYba4dC/ohImqfmQdDMbKXkeQfXh810aMVmlzDtS97Lt2GK7MRN7r
	 Z0MB7FR0cI7btNwLP1SS/MWW+bSjznhfrftqDAtHK/G9JGDl0rRKDhlaCOP9BPQvFu
	 y2vGlCjGZOxUekQCg94V/JvQbj0yV6hRZadUawfVKq+NWDijecA5p+HxMLn+V9zNFb
	 /ccVI2h0D5taI36FDdZ/2JIP9XiVouko5nu/H09P1Ojqp34b9hBhsAzWnAblFC3S4D
	 UwX33Zu3Z8O74FwDJJ60vlnAnj7vgxQbqkI4mpkOq3DwA1M97wEBJJlLzL7trYs8YK
	 6iSdh0CTO97NA==
Date: Wed, 20 May 2026 14:38:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Wunner <lukas@wunner.de>, linux-media@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: fix controller registration API inconsistency
Message-ID: <3016d236-ed02-4998-b1d7-c50a6fa2a7a4@sirena.org.uk>
References: <20260512140131.998680-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4N4t6RWf6G4QiBv1"
Content-Disposition: inline
In-Reply-To: <20260512140131.998680-1-johan@kernel.org>
X-Cookie: Natural laws have no pity.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62287-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linuxfoundation.org,wunner.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 35C9558EF88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--4N4t6RWf6G4QiBv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 04:01:31PM +0200, Johan Hovold wrote:

> With most drivers converted to use managed allocation in preparation for
> fixing the API, the remaining 16 drivers can be converted in one
> tree-wide change. Ten of those drivers use the bitbang interface and can
> be converted by simply removing the extra reference already taken by
> spi_bitbang_start(). [4]

> Fix the API inconsistency by no longer dropping a reference when
> deregistering non-devres allocated controllers.

> - *
> - * On success, this routine will take a reference to the controller. The caller
> - * is responsible for calling spi_bitbang_stop() to decrement the reference and
> - * spi_controller_put() as counterpart of spi_alloc_host() to prevent a memory
> - * leak.
>   */

The xilinx and xtensa-xtfpga drivers use devm_spi_alloc_host() and
spi_bitbang_start() but still call spi_controller_put() in their remove
paths.

--4N4t6RWf6G4QiBv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNuWoACgkQJNaLcl1U
h9Cuwgf/W79A6W0ytZ4frCJx5fQJqAdg6GlPgss8sm0qh+uFUuyEllWvZzKZxDWG
jQYILvY8xfoTcOB2zyi0a3a+8zmc0wWlDvQJgMEUG+PGUhXSdtl3NMVQEuIHffCW
E4Ioz8BzquHx/vK2Z5a2ftpX/xAdw0WbOL/PyJ47b7jjZlTrK1kSYcS++5To7Z08
Q/P5M+CTJUkMNGzkkl5CJpS9j+OxK1VhUECMEd9ruYch1hbUM4F+fdidvQI3MM9U
t+ibWnr2lym8eNj1QKqnmn2hZbPTkbEQchPy4S9yvSoGMukVaU+P4IfqxOM4Al7t
HQJstbs4969NFZkuk84yDxBe490fjg==
=GZ3G
-----END PGP SIGNATURE-----

--4N4t6RWf6G4QiBv1--

