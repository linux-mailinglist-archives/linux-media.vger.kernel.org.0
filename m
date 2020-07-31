Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42522234932
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 18:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731597AbgGaQ25 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 12:28:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:35230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbgGaQ25 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 12:28:57 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4800F206FA;
        Fri, 31 Jul 2020 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596212937;
        bh=H7C2F+/lvtEPC5IITYczg1d2DskfIXz1HAMfgy/sG/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qmmA8DGr2nidy3CFpX69D53Znb7lLqCFSMrXmHEa/vyE5cK4eCne7dvHN6sWb06Xw
         SXRqrHdozU4KWaeBeR9PLX8GrEsO0bJvnNMYnA7HxhbjzDp4JbzeT7X/OgIjLF1Kb8
         i2knsn2WljpB8u61AXgRWMNmkir+FvvU0WQIAgMQ=
Date:   Fri, 31 Jul 2020 17:28:36 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, luca@lucaceresoli.net,
        leonl@leopardimaging.com, robh+dt@kernel.org, lgirdwood@gmail.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: media: imx274: Add optional input
 clock and supplies
Message-ID: <20200731162836.GA4510@sirena.org.uk>
References: <1595264494-2400-1-git-send-email-skomatineni@nvidia.com>
 <1595264494-2400-2-git-send-email-skomatineni@nvidia.com>
 <20200731161908.GA6401@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20200731161908.GA6401@valkosipuli.retiisi.org.uk>
X-Cookie: Some optional equipment shown.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 07:19:08PM +0300, Sakari Ailus wrote:

> > +- VANA-supply: Sensor 2.8v analog supply.
> > +- VDIG-supply: Sensor 1.8v digital core supply.
> > +- VDDL-supply: Sensor digital IO 1.2v supply.

> I believe lower case is preferred.

Either is fine from my POV.  The code always used to use upper case but
it's not clear if that's the best choice when it makes its way into
bindings.

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8kRrMACgkQJNaLcl1U
h9DpGgf/acpY5u4l9/lKBPzkYCg51WEvU1mqUSpcxFCdgWGBQERMzz9U+sPdkTDs
yJKJH6+LNtSs5TOuLTq0PHI8NtuNbIeBNx2seYyT+i6pxwrqLCgu09U8RGbosggV
61KVKB5m2TPxfRAQrzNXt7EKjgqomYHbpJPePLSGHbyHjXtDJkWmnIhJULrpOKjG
JiuDD77ifu+Aww5j5DoCX5wHGWySzbSCiHBnGYsVk+L0GJm1XnSN3AdwkVt88Jlh
/c9fIapdg4WycEosAsMrZsl6Fz5JYDQbntmDo3nRDJsc58xW4QWcXG0QSi4GUsrr
6CNNiy5YIOMSJMkg8REiOhtCXbeXfQ==
=T7gY
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
