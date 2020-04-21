Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8841B316D
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 22:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgDUUrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 16:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726024AbgDUUrI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 16:47:08 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E644C0610D5;
        Tue, 21 Apr 2020 13:47:08 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x18so18179995wrq.2;
        Tue, 21 Apr 2020 13:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jnq/nuM5n2gT/9iOx5wyBoI6pa4qQ1+BqbVOvQqbP4Y=;
        b=FHDUjJ+rv5kQ+zQpnCvq/ina1G05Te+1qussHyawnYL0TCXpqsnkdqS563HqRG5d+i
         EqSRfUzzBlSBUuelWQbYhYkjUi3oVOq1Wp7PtiWeIMkudAzCL07J/yIcj4PYGOJ9II0M
         6wVWS6LjehFXJ5TNif5H3vids09rBI+rHj3rV8Vng51bbslJiafPSlgAE96UA2mGQhD+
         cOIRTbRmE2vm8KLHUvKFDgq8x01PL41ejJdr/rg2YBzxrGONiABKN+zgOnHe5B4OOFnr
         ZiD8WYkb6NsQpi+7zr9/eSXNhqHeRKUNUJfMf7XawrxbH4JbA1eD/cSsZt/uhIDB4SXL
         +GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jnq/nuM5n2gT/9iOx5wyBoI6pa4qQ1+BqbVOvQqbP4Y=;
        b=L40zuAh4epk5dtI+az3mxC49n5Wxi56FBbNMixl+DJSrhof4npI6dh8mlfQUPtk8hm
         Zk/rqlmAhDWUxzNjj226Vn3ukEK9tayfVURTfV14i3mUbpUDudoD4PPKTrqVoK2ZyqwZ
         0QCmXwTLUpiGtaY7fIGD2XyY6PGiy2Rxrlch+YotwF1uKFdPt3knG9eVKpZjuOa3G3ib
         3n5mc1OeNdWWcv5kIK0BiU07/9PjPIFgq5wZq88IlO7PiLR3t3Wci9R9QZpWNLhKd0z5
         Lc9kVAzkWMzAzlcuAiVUGfYhJRptxxw10eSmJ8OZCPM3VwlypMhwzOqmhQlMw83oGxB5
         UHhQ==
X-Gm-Message-State: AGi0PuY0cjg87jp+0jGKVrlFffsoJ1mj7uoH1yJQpaAw/aiN1Nr8JWiK
        FrA1ZbXB6hK0PTVmUuMzxlo=
X-Google-Smtp-Source: APiQypJ2uzlbuaWtVVSegEIo/nPzuNM7hSSg4SLjdBKUp/riZ0Up5KggtEzyxr7EdYa3vU3khWr8oQ==
X-Received: by 2002:a5d:5081:: with SMTP id a1mr28264718wrt.81.1587502027373;
        Tue, 21 Apr 2020 13:47:07 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id l4sm5209147wrv.60.2020.04.21.13.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 13:47:06 -0700 (PDT)
Date:   Tue, 21 Apr 2020 22:47:05 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, helen.koike@collabora.com, digetx@gmail.com,
        sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v8 6/9] media: tegra: Add Tegra210 Video input driver
Message-ID: <20200421204705.GB3233341@ulmo>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <1587427874-3291-7-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <1587427874-3291-7-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 05:11:11PM -0700, Sowjanya Komatineni wrote:
> Tegra210 contains a powerful Video Input (VI) hardware controller
> which can support up to 6 MIPI CSI camera sensors.
>=20
> Each Tegra CSI port can be one-to-one mapped to VI channel and can
> capture from an external camera sensor connected to CSI or from
> built-in test pattern generator.
>=20
> Tegra210 supports built-in test pattern generator from CSI to VI.
>=20
> This patch adds a v4l2 capture driver with media interface for
> Tegra210 built-in CSI to VI test pattern generator.
>=20
> This patch includes TPG support only and all the video pipeline
> configuration happens through the video device node.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/staging/media/Kconfig          |    2 +
>  drivers/staging/media/Makefile         |    1 +
>  drivers/staging/media/tegra/Kconfig    |   13 +
>  drivers/staging/media/tegra/Makefile   |    8 +
>  drivers/staging/media/tegra/TODO       |   10 +
>  drivers/staging/media/tegra/common.h   |  262 ++++++++
>  drivers/staging/media/tegra/csi.c      |  605 +++++++++++++++++
>  drivers/staging/media/tegra/csi.h      |  149 +++++
>  drivers/staging/media/tegra/tegra210.c |  709 ++++++++++++++++++++
>  drivers/staging/media/tegra/tegra210.h |  190 ++++++
>  drivers/staging/media/tegra/vi.c       | 1123 ++++++++++++++++++++++++++=
++++++
>  drivers/staging/media/tegra/vi.h       |   85 +++
>  drivers/staging/media/tegra/video.c    |  151 +++++
>  drivers/staging/media/tegra/video.h    |   31 +
>  14 files changed, 3339 insertions(+)
>  create mode 100644 drivers/staging/media/tegra/Kconfig
>  create mode 100644 drivers/staging/media/tegra/Makefile
>  create mode 100644 drivers/staging/media/tegra/TODO
>  create mode 100644 drivers/staging/media/tegra/common.h
>  create mode 100644 drivers/staging/media/tegra/csi.c
>  create mode 100644 drivers/staging/media/tegra/csi.h
>  create mode 100644 drivers/staging/media/tegra/tegra210.c
>  create mode 100644 drivers/staging/media/tegra/tegra210.h
>  create mode 100644 drivers/staging/media/tegra/vi.c
>  create mode 100644 drivers/staging/media/tegra/vi.h
>  create mode 100644 drivers/staging/media/tegra/video.c
>  create mode 100644 drivers/staging/media/tegra/video.h

Acked-by: Thierry Reding <treding@nvidia.com>

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fW8gACgkQ3SOs138+
s6FelRAAs4R2//XI/InkuB2gn+oXihgPqbXskXdym+k+JEyLU97w8L64/i25yIQf
/eCEE/fTZfGjTJy60PYVYMcai5sq2Kd9uT6iosuX6Z651yZOEAuQ52bRvS7oo9Pn
hTN2jCa6U9NQFrGXLyhLU5gAyN8lyuDAsOO8VB6ZU3BXcVlcfgPD2QX+CT15fW3r
UvpFWvyvwJDfZK8ndognGlxQ4ALBuUJOlRGWgcTPHqX1puxQC4aj8U7Edjxvy87D
3zC9vbhSKshhMKC3DPatFGzfVkX/mKsXSHIcbIeGbaAECWLBuEHe9GZBb5IcZR14
o6OE+o5vY3iLbbgpKsUvDH3uWy9W7KANO5LsiE3gzE9c49wzZ09ckwmY/oStFTEf
1wHXoKEnemDvXtQ4GsMWcjuI3c/uxU8nWSSNvQW2cSFdAy3R4O+i2anjaVqsGYnb
X0MfrmXZoLZg/cEVb9OCw0c3PGbQkvtxOCIWqqMKL8pKZMN5Hy6pAqnIvsmY4rEO
Q58bftmMOLaF0LS3YTRbnZR2wHIpWCrb+zOM77otioRSlt1xGfUKjlqtrogckuMU
3UwlCmOjns1TsWCIaDQuv32UxKfL02Megzr4vB4qRnBVdY4sJRZUavDeeF1UjhM7
Ll1Rl/+jeTjZIwUeLk0HV/PEBhKmNvspHZvb62Bz5nLSAAAaiqs=
=WO+F
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
