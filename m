Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2A520AD75
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 09:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgFZHni (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 03:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbgFZHnh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 03:43:37 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90BC6C08C5C1;
        Fri, 26 Jun 2020 00:43:37 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l12so8384995ejn.10;
        Fri, 26 Jun 2020 00:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3yJ82f9BPEQUN7JLYmeqgANkQ0MjK9DvwvjuJ/fNfPo=;
        b=Nn06aiq83iYmWi0EkxFhcC3cdp2tRFj4IjGqSjmF/POte6PFnDxFYoVA+u/jzpBNq3
         UD23kLfqwMAICTvv4tZojnM2RyCqLIrKbqLwacwTFLlKUo5sBPvRfvg3Lhho5o/IM+cE
         YDtGs6gE0vEkPPfnscsF6KcmZVlgbLy6E7kb7fM/4ll7pJEOo4bhdBISPSWBXM2ywmSl
         j1UHerRv65FPRKqE1I8PaTCl8ZZd7I1G5LVXMom3o4cY0YQzPlhQJd1N71mZsDg20Bdj
         NDu/ucYreZCIlqr2oBj1cOL1DElEgYbmAmvDsTGe1tBEDc+1omKF3nKXWBkhkz9z1nvh
         q1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3yJ82f9BPEQUN7JLYmeqgANkQ0MjK9DvwvjuJ/fNfPo=;
        b=RfuNE0mti/RWVEkJaVhyIqdqNlTLXivkqUw2ljgLu8EVtuMKPxEwMzDsMbOsr6QIYY
         R2hVcMZdcm3i02XwHjRQR5Dfw4QtgKD2VmtSZOlGNhluce3tJhdjbtyxUuC4SDCOEcfv
         wRgHNVXtxPaxdqN2ADrTeSPr02aDSWLw1ksoIZkAhnJzBzocHBqAVMV5O8phA+VHaTkD
         2Oy85j9TQm+d8G4Vq3GtOjgJGwokzN6vp+QSwR+1oJhBtEufdhdfm9O0EW4OtGiDWYOc
         V6FYpftPI9cNK7QI/fs/TIUSy9IGG/TKs5OMc6LRU28DAbgQXE9rUXtpnMzyQvEXPpOY
         jSMQ==
X-Gm-Message-State: AOAM530YbuFOikeai+/ZLZntQ6sIrxSL6EVE1EbkeG2QO1Z5uPbXYtHF
        m0iYCg4jSGuM62pgfrZYMrc=
X-Google-Smtp-Source: ABdhPJyMuYQbZiFGkRDmBWgsi5klIv7Zbl33i2Thb5I4DzbIWId5Oe4mx8pFBA08+4iCtQfnQi044g==
X-Received: by 2002:a17:906:4f13:: with SMTP id t19mr1373989eju.269.1593157416369;
        Fri, 26 Jun 2020 00:43:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g25sm20051925edq.34.2020.06.26.00.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:43:34 -0700 (PDT)
Date:   Fri, 26 Jun 2020 09:43:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] media: staging: tegra-vde: Turn ON power domain
 on shutdown
Message-ID: <20200626074333.GB3109062@ulmo>
References: <20200624150847.22672-1-digetx@gmail.com>
 <20200624150847.22672-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline
In-Reply-To: <20200624150847.22672-4-digetx@gmail.com>
User-Agent: Mutt/1.14.4 (2020-06-18)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 06:08:46PM +0300, Dmitry Osipenko wrote:
> On some devices bootloader isn't ready to a clamped VDE power, and thus,
> machine hangs on a warm reboot (CPU reset). The VDE power partition is
> turned ON by default on a cold boot, hence VDE driver should keep power
> partition enabled on system's reboot too. This fixes hang on a warm reboot
> on a Tegra20 Acer A500 device, which is handy if Embedded Controller
> driver is unavailable, i.e. cold reboot can't be performed.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Unfortunate that we have to do this, but looks fine:

Acked-by: Thierry Reding <treding@nvidia.com>

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl71pyUACgkQ3SOs138+
s6F5dw/8CW7nKPapQO4CpytXDxMMoCTTtQyWgDFYQ/xU3ylzovRIiKhI+LeVqVTn
Rdi4QA5q5nZPPASa5H9gKccbKel0rgoZFmRt0Lfsz49e/vM7VsoN0+STNG0/cLP8
cn2+ZKSNi1Pdp+kjoHdet3Lep5X3u3wRWlYP18r6D2zRC40WQnV9xzREOwoLZbi2
6MqN1AgbJoLJuKjSFLTqWmegx+J0UtpNhU7SMzPT4BzyGSbssdsu4dkBzDsknq9X
tXGCHE5yYwNZ8L4qqZJHs5Z9B5Xgt4S8hoV3fLHBPHiULPsPbqRrCu/Olto1z2br
wNfzo3idaet4Rpt1LeaIQf4XFikpOyJzFAmWk05rrcdOV98lGDS/wYiffwl0VF9C
FaYtJpoQBKLWAlAGtDyYOUCdpRsRnTYr2D8fQU5li5E+NixhF0MmIAkKmBty8w9l
3sO3na4DMbOmVv6TyT41jpWyYQBgENBeQm1CyxifcgdvTcnuXlW3LAShO3BlVuRi
pEOKovKDd0o/BDnjrcJCBuXebZjFs9tdJMNFnvWcGFcgmW48Q1NNrn+8uJhCEjej
8dX50tDvBKvGgD7rhQ5XhV/UxSU9pi5WjHBWzWuPoQo3M0prZzktl6aLRZCMT6Wo
NIxCf/cuXOtvwQrGeVse3gFZijVOJdNs0OdVbIsCCAEmOthIDl0=
=jvXi
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
