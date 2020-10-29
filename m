Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349FC29EEB2
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 15:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbgJ2OsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 10:48:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:58418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbgJ2OsW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 10:48:22 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2207206E3;
        Thu, 29 Oct 2020 14:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603982902;
        bh=1WVgpSeBTg23BnkNEmrqmNenj4irnsi1ikEUl8Vv6Wo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i4FEJ5HPwWmEOBfL7UrgMlFlHNz8cK6TPZeEdahQV/hnidqkE5aDW1VXDW8bcEZ3k
         nKSm+dMHUiYT3k+i5SjzOonCiCk9sfD5brDCx7hZ3DWjgJar4/xK7v3nhCd2yp6IXP
         r8lt84NFqgwlM37J9zt9IN2eSKblG3BWWGdWZvtI=
Date:   Thu, 29 Oct 2020 14:48:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 00/18] Add Hantro regmap and VC8000 h264 decode support
Message-ID: <20201029144815.GA5042@sirena.org.uk>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
 <d4d080658113ad97816eda9262736e5fcc7b017c.camel@collabora.com>
 <0dd9fb9d-3f33-b9b0-a7a8-6d3111e92d64@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <0dd9fb9d-3f33-b9b0-a7a8-6d3111e92d64@arm.com>
X-Cookie: Monotheism is a gift from the gods.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 29, 2020 at 02:15:10PM +0000, Robin Murphy wrote:

> Or maybe the regmap API itself deserves extending with a "deferred"
> operating mode where updates to the cached state can be separated from
> committing that state to the underlying hardware.

> ...which, after a brief code search out of curiosity, apparently already
> exists in the form of regcache_cache_only()/regcache_sync(), so there's
> probably no need to reinvent it :)

Yes, exactly.  One of the big use cases for regmap on MMIO devices is
being able to access the register map without the hardware being there,
this would be another application of the cache stuff.

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+a1i8ACgkQJNaLcl1U
h9Chkgf/YvgbkyG7kUEIq4QfEROF8JYpkMBdUkwEFiZ29CTsLlroKBVQ5tAuawRY
pfo16Z2PmnfFoxJ8TOXEZgBjCPiKHpaONRLUICnX6eVBYr0toBty+CCxIYLfZZ9n
LZscGBuAFAwZx6wbsLmnEFUeB5WemZUelSGwPPLg9pf3Q3o/7ujGCd6jRpkcApCf
RSxUi+wCAWsXA5RV/loCcfnRWPdtcZTH57uUrLtkYblhZXrsvLyijzErixL1Dhdd
BSOLkG+c4h/Ji2M7QgUYQVbK5Qnt72Q7CotPmJKtGCnjAu/il+uVZGE+SHziWr/r
f0wS3wW7YIxIpC71JOo48eKTyJrhCQ==
=FSAs
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
