Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0396029F3B1
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 19:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgJ2SAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 14:00:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:53434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725613AbgJ2R7v (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 13:59:51 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85B6F20790;
        Thu, 29 Oct 2020 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603994390;
        bh=AZhOU2W6PRWrW++sUwojyV8r0hQKprOKEkuphmHahJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pIEzdSBlrcWxEoEuNilbOwp5u8kO4Q26+P+M2ItJj0B4B0jOS8vPB+rK7f2uCMBqP
         E3CxhD3RUIbUpQkg5ZEUJwilewx80cqkLghXR+y/A1dSSuVeWgjXf2lgGqjSyDk52y
         C9cxJ8EjkUqHMLg6YkSrTj7sn2nNt4mOikajvZsA=
Date:   Thu, 29 Oct 2020 17:59:43 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 00/18] Add Hantro regmap and VC8000 h264 decode support
Message-ID: <20201029175943.GE5042@sirena.org.uk>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
 <d4d080658113ad97816eda9262736e5fcc7b017c.camel@collabora.com>
 <0dd9fb9d-3f33-b9b0-a7a8-6d3111e92d64@arm.com>
 <5a653c86f887bf8f3d34c4d620471300b612a4d8.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline
In-Reply-To: <5a653c86f887bf8f3d34c4d620471300b612a4d8.camel@collabora.com>
X-Cookie: Monotheism is a gift from the gods.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2020 at 01:27:08PM -0300, Ezequiel Garcia wrote:
> On Thu, 2020-10-29 at 14:15 +0000, Robin Murphy wrote:

> > Or maybe the regmap API itself deserves extending with a "deferred"=20
> > operating mode where updates to the cached state can be separated from=
=20
> > committing that state to the underlying hardware.

> > ...which, after a brief code search out of curiosity, apparently alread=
y=20
> > exists in the form of regcache_cache_only()/regcache_sync(), so there's=
=20
> > probably no need to reinvent it :)

> To be fair, and despite it could seem an anti-pattern, this particular
> wheel is so tiny and trivial, that I'm starting to seriously consider
> reinventing it.

> I've been thinking long about this but just can't seem to see exactly
> what benefit we're getting from using MMIO regmaps here,
> as opposed to just a simple macro with an index, a mask, and an offset.

As a rule of thumb if you're not using a cache or fitting into some
other higher level framework stuff that uses regmap then I wouldn't
bother for MMIO devices.

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+bAw4ACgkQJNaLcl1U
h9BrSAf/dmEzyzrzFZNPwE6FzIAV8o45wj261p4lQVkPR6Vl5CvsVKpC+h8d9ArY
t3plejxUu4tD6bQxgr4Z8hH21CstLRRfTBvMxw3B30qRx+WjCcoUp3ITBvQ4un9G
wUQsSkBqR9sbYFROEenraceUC4digdUJ4zUF+UKtmLcOH/qmrio1PSBsJyOugFRd
KHp5PxSUG18I93T1S/MLSuxpi11ZTvgXp3g41eDRia+joSz7OAHbTkeMsn8vkLYy
rMJpJDOC/UN+lOMqM7XLaD6nuY3jVDVoJqRPFDHOij/tPaDOmScjK4RRvWQwyNR3
OV4/0EqCGUf6z5RAwF6t6yedKSYzSQ==
=uxou
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
