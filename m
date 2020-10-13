Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0793328CB96
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 12:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730716AbgJMK1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 06:27:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:58932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730508AbgJMK1C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 06:27:02 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8FA32080A;
        Tue, 13 Oct 2020 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602584822;
        bh=19VK6zpHdezOuuklZf7plr8Sr0Qgx/oJRYyG6wSDmqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tJD3ZNlx+zgGQVmwQIEJy8GJzYiSbN7sxe5T+h7NPSViVO3e/dOYlWxi5AXaAHbaH
         24cjQgTtTOIzMvXCvwr+yVJamjEORZ6Hu+ao/OqFQS7UJ9idcv9YpeEIt91Npl6IfH
         QmW+JGyWMkWblEEIKKUSnT9Bdd2iP1vIp7GJ48ds=
Date:   Tue, 13 Oct 2020 11:26:56 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Adrian Ratiu <adrian.ratiu@collabora.com>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] regmap: mmio: add config option to allow relaxed
 MMIO accesses
Message-ID: <20201013102656.GA5425@sirena.org.uk>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
 <20201012205957.889185-8-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <20201012205957.889185-8-adrian.ratiu@collabora.com>
X-Cookie: do {
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 12, 2020 at 11:59:46PM +0300, Adrian Ratiu wrote:

> -	writeb(val, ctx->regs + reg);
> +	if (ctx->relaxed_mmio)
> +		writeb_relaxed(val, ctx->regs + reg);
> +	else
> +		writeb(val, ctx->regs + reg);

There is no point in doing a conditional operation on every I/O, it'd be
better to register a different set of ops when doing relaxed I/O.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+FgOwACgkQJNaLcl1U
h9DfBAf/aCgHrO/JPO6kC9zlq8FPBcVZgOCd/XI9J+z55ZKCSSN6Ikr+Bf8JqOpd
E6QaabPUOJUcGLeJh3bf04rAq8De42ez6sq71N9UzwHEuQtDjqNExwkAdS5UjlD7
2nFyJwB6xg5tFRX8yJTKI8A2i1HSWBOz7COQ9+c88EnziZHIpMVK/CKln+dUM4Iq
SaxqQpcFtLqAOgq2EGB3SEViUui5oBGqMrKzZMNvDnHJSRqT0FijXPCw2IhOs7fe
gEP8AL3QDSJCNe/nLC3UT1/hw1RMWbpEUN2cVWuqCnFAUrAKIIuGAQLBb4zH9AuE
XTXIVY9BdeTsBxaQZCIQVHVn6Jvbhg==
=S9Bp
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
