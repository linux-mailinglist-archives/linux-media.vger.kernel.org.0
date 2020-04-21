Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A9C1B3173
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 22:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgDUUr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 16:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725850AbgDUUr3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 16:47:29 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D97C0610D5;
        Tue, 21 Apr 2020 13:47:28 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id y24so5067435wma.4;
        Tue, 21 Apr 2020 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NVnGxRHURprxPSzrmUftjbpbDyGetdlGQ/PEbgXXXqE=;
        b=FTqF2hrya87rOyGOeeVn7XVW8n4Gt618Ct1ZWfTwB7QOC+hkpJbpiyYY1g73StcL2b
         aDqHbhnTYQDhBfp5g0N4Uki6lS4qDNTrrRw8RUkCBgyfxBV3DdHn5fruhWPRR4PUlE9r
         zdsT22134iU9ypqvIFrjZU3XHxtmdOPRDUxto2jYZQV2rjDk2A11HxsU1s6OouITWe2q
         Xdxo4pPzfkqXfJ5qnrob+1O/nMppjMshMW9e/IG9P/ZPufSWFkcMhA5nEn3GNNuC3dY5
         Co/e8XEvQdVYx9iVC5mfRBvO6opmNVYdXBVT/Kskf6KY/oknKRUwpMrwrj5ZLZ/urrql
         wS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NVnGxRHURprxPSzrmUftjbpbDyGetdlGQ/PEbgXXXqE=;
        b=lmtvZ0yXtV/pTuXE9KmM+gF3LWLTJ7Dvqxznqfz0r/ATopSK10AxIuzCtyq0SYYHVO
         1NQPW2ud5hX6uPL5TW84CsRqywCqnhvaALdn4eIwYKw+wK6OikgqfSL9ZJdidegML74J
         19HgOClufi/y+C75LTYyktSMbsL+rtieSeeLiSfe3UQRx/g3p0ScIim8eJZ5BSChzrkK
         ee9fbusQVIU9NHXXK7rUx201J/9db6xsZywuEEf9R6sQ2eCobqccQkuXDT+T+N7pJXL2
         ymwDsUG0r+rXwhlJp5vGbrEAZOXFXtKKD4+Vvy4zW69sv1UTZ99BhSvbd6PVpVdmRxs4
         ojmA==
X-Gm-Message-State: AGi0Pua0xEfYmVa0RZZc+Azpitr5JDPE+EUuRGIQT9xDpkRMUZICMdkI
        iBJs+1FxAWm6RifB2rD0jog=
X-Google-Smtp-Source: APiQypJnC2ErXDaY9zL9JmFoJcPrn/ry4LrQUQcEMWqsV+M99VXc1qLFpDhbM/VvujxWqZSVtglU3g==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr6477574wmi.187.1587502047595;
        Tue, 21 Apr 2020 13:47:27 -0700 (PDT)
Received: from localhost (p2E5BEDBA.dip0.t-ipconnect.de. [46.91.237.186])
        by smtp.gmail.com with ESMTPSA id h6sm5075141wmf.31.2020.04.21.13.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 13:47:26 -0700 (PDT)
Date:   Tue, 21 Apr 2020 22:47:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, helen.koike@collabora.com, digetx@gmail.com,
        sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v8 7/9] MAINTAINERS: Add Tegra Video driver section
Message-ID: <20200421204724.GC3233341@ulmo>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
 <1587427874-3291-8-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline
In-Reply-To: <1587427874-3291-8-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 05:11:12PM -0700, Sowjanya Komatineni wrote:
> Add maintainers and mailing list entries to Tegra Video driver section.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6fW9wACgkQ3SOs138+
s6Fgug/+ICPSXT6M9xolS3jX25tiXb3++ZZ1MNufNhKLjeo4SWcdN9Ny55unMCP5
HsAT8RdD1vpdiQp3/5n5djCS2+Cq9lRQX1YiVxfmgT9fmllRgRWRmRG56yO0bGc9
GPphxhknJJHL33xdfJUiKYfTTyHmI46l8PzU1D8VaAzdl3NTLZ2lnemMX/Evt6m3
MC42fqGIO8uEU8ZBDk/RgRB9lGpVw6OmrrjjA5Vk+4vYmM1xo+RJSapsre4ovXK5
HDKhGJ4hO7pzC37cPMr4cJ8/Jk2+hJFufROZ7SwKTc2MShhn2nzzzBPLsgLZvntI
igI8+gr+RH/cFuu4HLGuHLcPvbbHyLviouLYIkEfz8DUSUAr75Mo64JYhsH4n4fF
biFNDyLfydo+d4b+OAIuLwNpoGPOl+JiXClJYIs+6Z1ExDvE4nWetraFApXBkK2i
L6Y7u9ZgLh2vowGd3yWeu5dtTxM+LzJdqZT4ejEw0qspr+NJpenh2HGDd41lsrgQ
zbaefYyDgWKd7ns/4Yvys+LEpfb8ZjQW/CynZO7DEl3trASR/z9bT/BA6MYWRNTf
zpBQk3XVu1ZmBHc9HEfAlFevzesaNsV7ieFEo9OK7XMLMq4gwsQqgtaAG+kS77zG
ol6XX78lfWc5RCBZeO7xRvioulujpOQk8V2pJ2igD5Grm1Mjwg4=
=MMno
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
