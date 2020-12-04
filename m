Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FEB2CF346
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 18:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731392AbgLDRmT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 12:42:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:39994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731103AbgLDRmT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 12:42:19 -0500
Date:   Fri, 4 Dec 2020 17:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607103698;
        bh=WGPvh/m1la/6pEZ0tQ/GOgG68+E+LycRUiq+bD3Iwkk=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=g/TkCIMmBnQxPWxPF2qMZYVzCmn31CDUYt6k0CzRPEhcaQop/372ntwpVszp4hjIE
         vIVuuPebp/OC1i7cGxGjhjvFCBH+ZOpJXrqSfBUsLkg92qAaqtHe1oRjW2/LiLKRoP
         uV66KhSBbnh6OLWt+7k76XvCzSFsllU2Y5flxry9vND+O+lxolnf60O50XwwBPh+yq
         SoPzZkAnY4VxswfQ2GzN2EHfELa7v8aeYr2tU6kH0grOPrleQ/frQmRoOuiQC9upQJ
         YrsyZgnwacEkiNSykQCi1T9S/rE+RUrXs3/y3O5y2YsUSe/DVXEgxaJHuUZ1ya5ze9
         iTXQfDZc1wffA==
From:   Mark Brown <broonie@kernel.org>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        alsa-devel <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/1] dt-bindings: eliminate yamllint warnings
Message-ID: <20201204174135.GC4558@sirena.org.uk>
References: <20201204024226.1222-1-thunder.leizhen@huawei.com>
 <20201204024226.1222-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline
In-Reply-To: <20201204024226.1222-2-thunder.leizhen@huawei.com>
X-Cookie: Not a flying toy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2020 at 10:42:26AM +0800, Zhen Lei wrote:
> All warnings are related only to "wrong indentation", except one:
> Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:4:1: \
> [error] missing document start "---" (document-start)

It would make life easier (and be more normal practice) to split this up
by driver/subsystem and send a bunch of separate patches to the relevant
maintainers, this makes it much easier to review and handle things.

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/KdM4ACgkQJNaLcl1U
h9BGjQf/UZkJEtI4D/7Y6K4QlL3HTskWfvSDmZF26Ea+sD/TdJ91T1YJulT15TOK
sKNLzMI5ERHHR+su1GGx0czMqpipoPYLvlULn6wLpL6fMbOx94cA+dc8Akr/JcjX
EfMthdqAlA+5P1Lz5FivyeWRk/B2YgNQ4+Pa9bbLW4iZogcNL2jZmN55GvBHYlSa
oyLVbN2YlJwy/t9b+c8mvlCGa5NyPDe5JmpplcFkCbn5DVZ9aFTHrGaQ0Ml1rv5W
DyyLnw1kpVUck0Phs49+unaEOb88Mh7FY4Jtsqz6SuqZDkHYZuWCwod5VHJG7q53
cpaFjB5+6e3/mAA/aRnxyzuOxLmoMA==
=82J7
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--
