Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D19E28E058
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 14:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729548AbgJNMM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 08:12:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:38566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgJNMM4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 08:12:56 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF06320848;
        Wed, 14 Oct 2020 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602677575;
        bh=cmKTV1EBll0j+ItdD8eP3aHKUumuPZb6PnNWSGoC0ec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lFyLPmV+KiUAhxMxiAYwGMF8OsX3RT+mdfLJ/P03BmP4zIS/RIqVxwt9BeXs8dKVc
         oKu26geObF7+BU8Be0buKPtbEmJFASNBtI2iE+CtnyS9ZuHFlPNBtrG53AaGWqIBJ7
         CWgdTUIE9BIx/5uUDyu7suGLzcwKXYDE0/6GG++U=
Date:   Wed, 14 Oct 2020 13:12:49 +0100
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
Message-ID: <20201014121249.GA4580@sirena.org.uk>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
 <20201012205957.889185-8-adrian.ratiu@collabora.com>
 <20201013102656.GA5425@sirena.org.uk>
 <87o8l581ql.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <87o8l581ql.fsf@collabora.com>
X-Cookie: Take an astronaut to launch.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2020 at 02:51:14PM +0300, Adrian Ratiu wrote:
> On Tue, 13 Oct 2020, Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Oct 12, 2020 at 11:59:46PM +0300, Adrian Ratiu wrote:

> > > -	writeb(val, ctx->regs + reg); +	if (ctx->relaxed_mmio) +
> > > writeb_relaxed(val, ctx->regs + reg); +	else + writeb(val, ctx->regs
> > > + reg);

> > There is no point in doing a conditional operation on every I/O, it'd be
> > better to register a different set of ops when doing relaxed I/O.

> Indeed I have considered adding new functions but went with this solution
> because it's easier for the users to only have to define a "relaxed" config
> then test the regmap ctx as above.

It seems like you've taken this in a direction other than what  I was
thinking of here - defining separate ops doesn't mean we have to do
anything which has any impact on the interface seen by users.  The
regmap config is supplied at registration time, it's just as available
then as it is when doing I/O.

> Thinking a bit more about it, yes, it makes more sense to have dedicated
> ops: this way users don't have to be explicit about adding membarriers and
> can combine relaxed and non-relaxed more easily, so it's also a better API
> trade-off in addition to avoiding the conditional. Thanks!

I'm not sure what you're proposing here - it does seem useful to be able
to combine relaxed and non-relaxed I/O but that seems like it'd break
down the abstraction for regmap since tht's not really a concept other
buses are going to have?  Unless we provide an operation to switch by
setting flags or somethin possibly and integrate it with the cache
perhaps.  Could you be a bit more specific about what you were thinking
of here please?

> Question: Do you want me to split this patch from the series and send it
> separately just for the regmap subsystem to be easier to review / apply?

Sure.

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+G60AACgkQJNaLcl1U
h9B+Jwf/XOdvtPoXpgJ7rC8kdzSUBfvgEXpd8VEr0zJtWSXU2NbIb3vbR0fVsRSL
ybbGwGTzR7DzFlOqNfl+Rq7/DxGjL5WXo+HAdlOreida+X5fq9hsPjijp/cMuY8K
pQPU55p+uXFdbKQ4YnQKI32wgdFJE0zNAsmPJ4xPTVjL8f35D5Sz7jPLzke8AyPX
1AU+ZLrsdkb3FbPc/9iFR/rK2dHJnP1+4+869Q2nqdQRmBS6J3rhgMDIII3WjjcE
2f6eTQ9Nfk2Bh5RUhv06v7XSgAFa52SjxPntzcSycw1NeWw4LG+xd38Mhbs0qGR9
Y7XiGt0GEcQ76mjFHzyzV6GD6OELdw==
=gcB2
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
