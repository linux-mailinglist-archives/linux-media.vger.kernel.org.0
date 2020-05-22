Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD4A41DE7C7
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 15:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgEVNMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 09:12:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:48240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729334AbgEVNMp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 09:12:45 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4C7E206B6;
        Fri, 22 May 2020 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590153165;
        bh=eJKC82/JdUZHlra7wt2AcwBxZx0GOUHbM5qLt27y8DM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f5GKNdFgRnnBIO23cQpX5VzjxVD3vjqLDm5zKWQYH9PGzsWz88uDSXU4smxDdAEXw
         DuNIoPjen0K7HCQd+h/fexnZt0GCdHeqg99S0u9/zoItXB2B9XKxiQ9/4fuSQ5PaaE
         bXVA5rstzRikNPoIOt1rnpDxZXLvYgs5dXdkH0XQ=
Date:   Fri, 22 May 2020 14:12:42 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Shengjiu Wang <shengjiu.wang@gmail.com>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Timur Tabi <timur@kernel.org>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, perex@perex.cz,
        Takashi Iwai <tiwai@suse.com>, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in
 probe
Message-ID: <20200522131242.GI5801@sirena.org.uk>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
 <20200520123850.GE4823@sirena.org.uk>
 <CAA+D8AOiVVi3B4dzU8r=rCMz=6w9R=wxBkzAQ=0=RAQLKCWy8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3U8TY7m7wOx7RL1F"
Content-Disposition: inline
In-Reply-To: <CAA+D8AOiVVi3B4dzU8r=rCMz=6w9R=wxBkzAQ=0=RAQLKCWy8Q@mail.gmail.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3U8TY7m7wOx7RL1F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2020 at 07:30:04PM +0800, Shengjiu Wang wrote:
> On Wed, May 20, 2020 at 8:38 PM Mark Brown <broonie@kernel.org> wrote:

> > Other drivers having problems means those drivers should be fixed, not
> > that we should copy the problems.  In the case of the PXA driver that's
> > very old code which predates deferred probe by I'd guess a decade.

> Thanks.

> For the FE-BE case, do you have any suggestion for how fix it?

> With DMA1->ASRC->DMA2->ESAI case, the DMA1->ASRC->DMA2
> is in FE,  ESAI is in BE.  When ESAI drvier probe,  DMA3 channel is
> created with ESAI's "dma:tx" (DMA3 channel
> is not used in this FE-BE case).    When FE-BE startup, DMA2
> channel is created, it needs the ESAI's "dma:tx", so the warning
> comes out.

Not really TBH, this seems like another one of those csaes where DPCM is
creaking at the seams :/

--3U8TY7m7wOx7RL1F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Hz8kACgkQJNaLcl1U
h9DJFQf+KOiSW3M/3ZDsfcMnTGh5HgNgjzZUpEU5f1ZyNw/EXh1ViAvYDpkQp2Er
kpo1Tgzodk1pkqsn1sWa5yWP+0c6LboBqkCq+02NHr3Kjyw3dQ6uV4ObJH35s/d1
39jbo9WIGQVqo8IOFdGhjpP4q72Vwxz1ki5asUYV3e1IO8aEowWvvbpnSIRlyuvH
rXKaqX6fYMsrMzXOhUx7afrt0n6HR/eBg/XkyIsnhXvvPpmxEAySIyKPOGGrftBM
rNmOV/XPKbLQXFzjWbK+3ChCcp6ETGTyUyHP25Dm+qXnIyvI6D1ssajhiZHN02RB
EdzpF/hkR+YLYUFNuN3fRvDOjQZT1A==
=fSbG
-----END PGP SIGNATURE-----

--3U8TY7m7wOx7RL1F--
