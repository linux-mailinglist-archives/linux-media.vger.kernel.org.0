Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897C41CFAAF
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 18:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgELQ3i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 12:29:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:60208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgELQ3i (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 12:29:38 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 55A23206CC;
        Tue, 12 May 2020 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589300977;
        bh=3d503rEnrQlmVr866ZPQoKe91PbqWA5B0K8eCi6d+h8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TzkHsJD9TKt1uTGXxBVK8qQwaO2x5Vkdd6IgJpZaAHgSH8RakzYlSg9F+tf/r4aED
         mzrR1Z4ivV7xC7YQYKyZdTKwZhXhaKLfVKfzLzPrVHKi0KEwuhQ/+ykrHyQO1Zqzwg
         YgYyfKpjVIrFF0JI8dxRZWp7nrgnVkIinisfTq1k=
Date:   Tue, 12 May 2020 17:29:35 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 07/11] ASoC: mmp-sspa: Prepare/unprepare the clocks
Message-ID: <20200512162935.GJ5110@sirena.org.uk>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
 <20200511210134.1224532-8-lkundrak@v3.sk>
 <20200512124520.GH5110@sirena.org.uk>
 <20200512153654.GB604838@furthur.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x0KprKst+ZOYEj2z"
Content-Disposition: inline
In-Reply-To: <20200512153654.GB604838@furthur.local>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--x0KprKst+ZOYEj2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2020 at 05:36:54PM +0200, Lubomir Rintel wrote:
> On Tue, May 12, 2020 at 01:45:20PM +0100, Mark Brown wrote:

> > This fix should've been earlier in the series so it could be sent as a
> > fix.

> I'll order it earlier on v2.

> However, there's not much of a point in picking this patch alone,
> because the driver is certainly not used anywhere and very likely
> doesn't even work to any sensible extent without the rest of the
> series.

Well, I've already applied everything except the DT patches for that
reason - it's just worth pointing out for future reference.

--x0KprKst+ZOYEj2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl66zu4ACgkQJNaLcl1U
h9Aq3Af/XxOVbeB+Ka1Fx53Uc5Q7nUyY8DTdZHXv04vHSuKsFwz8dizJreQsaqkr
Etk4+e/aCd0Uso/rFVLzRQWv6MerNvjv8pQtUOEqqc+2P4X9uIc1UTdnQZCP/bN6
7DX8KQoP7gPLG8hFdyDC0OBdIaZLAm4FZkn82A3mqs/OVA4Qu07ikOYW3Ry64oTc
/22zS3mA2jx4sLMpS/shHJviypaD8bw0AXK5FsThoYNRsRG23PP4omFqh5elL8uY
x7qwVfrg9SvLZ0B7q3phDcgUwtVYEQPwSyPMqRtiLMRwDhP81D0g4dZajuU0CXMd
xWC+u4Nm3Xw3VBO0IUq2Jo6Fp7yPNg==
=lL11
-----END PGP SIGNATURE-----

--x0KprKst+ZOYEj2z--
