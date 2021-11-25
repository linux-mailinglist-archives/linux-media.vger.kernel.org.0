Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A0345D98E
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 12:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbhKYLxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 06:53:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:58418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238055AbhKYLva (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 06:51:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85F236023D;
        Thu, 25 Nov 2021 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637840898;
        bh=l6Jyc1tU0WmNF0iSFJgB3zxp5No3x8K6EvftOagYU7g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o6dfwCAkAl1fjepojlG72yCZ++ZQCm5u6FOKpszbwGv729SfP7wkjsNpZ0UusOmkD
         bt5OolF7wWJRr1GSVwtkG6U+yv1BZ3EwRSz5r2RrawceGL66NfIIVj3n87gkEsb3Br
         H7Q7NBduqqj8nDRUkDryW+E+aaGzdZ7Ou5gAuHFA6Ul2YE8rUYQYF1+ubhbOs5vpJC
         OYwpViKm1ySvkdvg15+rbxeoIeDzNNESFWsWqYyx3HLGLdd685UCEItUZfdIE0HtqS
         xLYZ3H9akLCYhFGLNHaEl3q1IIQP6bvaY/oW7/8kYucs0UvKOww5TMacZAzYuqOCH9
         tFWSExcQe6DxA==
Date:   Thu, 25 Nov 2021 11:48:13 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     sakari.ailus@linux.intel.com, mchehab@kernel.org,
        lgirdwood@gmail.com, linux-media@vger.kernel.org, kernel@puri.sm,
        linux-kernel@vger.kernel.org, Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH] media: i2c: dw9714: add optional regulator support
Message-ID: <YZ93/dhTH3pUUHm2@sirena.org.uk>
References: <20211125080922.978583-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4QVRVVhlXziUnvSo"
Content-Disposition: inline
In-Reply-To: <20211125080922.978583-1-martin.kepplinger@puri.sm>
X-Cookie: This bag is recyclable.
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--4QVRVVhlXziUnvSo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 25, 2021 at 09:09:22AM +0100, Martin Kepplinger wrote:

> +	dw9714_dev->vcc = devm_regulator_get_optional(&client->dev, "vcc");
> +	if (IS_ERR(dw9714_dev->vcc)) {
> +		if (PTR_ERR(dw9714_dev->vcc) != -ENODEV)

This looks like an abuse of regulator_get_optiona(), unless the supply
might be physically absent in a system it should be using a normal
regulator_get().

--4QVRVVhlXziUnvSo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfd/wACgkQJNaLcl1U
h9Cl1gf9GoBR+vf/0EfzsbiofJ5XWkU85yZeb9CHrqdjL2qDftsuuzNtTYUMQNYO
fUVEQ3Gt76NLGDIf/h68BsRi00I8Lkug3VoIZtQSf5CNgO/6yKlzgjjTnsqPsGV7
bTtzlfE6uJr4YPZPwg8cj5cIk+22ixWs21XMMS1Ho/mvn/8ECoDNd/XoXTz7wsTZ
lRGUW6v1XOlvNASOqDX1LNe6p05S7eFc0guqPKgHonnOntOTu1QqRTVDsLWqCmpK
DGzgi/Mcd/D5JYjeWy7zc2tYSJQzmtrx2ZVnzzMfY0QHFyo/zcORDIQ4WUT2An1I
o/XVw0bGVfooWL2wXLC56R9rZ1Go/A==
=eA3p
-----END PGP SIGNATURE-----

--4QVRVVhlXziUnvSo--
