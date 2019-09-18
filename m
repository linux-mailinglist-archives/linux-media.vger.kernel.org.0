Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D37B661B
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 16:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbfIROaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 10:30:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:42062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727273AbfIROaR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 10:30:17 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BD8F218AE;
        Wed, 18 Sep 2019 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568817015;
        bh=n7hEc4U3JFOCFiwdHi6OxEy+MNo9Uxm6c6RnEDR8WCk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u0FC0ls3vLRORjqiIUVr1q5uIM4D5c4rEUU4iQtMFK+Zkh4h99Regs1s/KZ3GBhWq
         Cl8vuE9rrla1mh+Y+QW3Vxw9p3O8xmlC2DfI34/YeRkgXBIDmStGfXKkhtIJ9zmCf2
         EZ12GpdDZk3k7CnbMblC+5hiUGtkMC/B7Ps3/BLY=
Date:   Wed, 18 Sep 2019 16:30:12 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc:     wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mchehab@kernel.org, hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 5/6] media: sun4i: Add H3 deinterlace driver
Message-ID: <20190918143012.4o54doeauiv3j42z@gilmour>
References: <20190912175132.411-1-jernej.skrabec@siol.net>
 <20190912175132.411-6-jernej.skrabec@siol.net>
 <20190912202647.wfcjur7yxhlelvd6@localhost.localdomain>
 <3227980.eWD6USAIP4@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="murlg7gnizd4neyj"
Content-Disposition: inline
In-Reply-To: <3227980.eWD6USAIP4@jernej-laptop>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--murlg7gnizd4neyj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 14, 2019 at 08:42:22AM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 12. september 2019 ob 22:26:47 CEST je Maxime Ripard na=
pisal(a):
> > Hi,
> >
> > On Thu, Sep 12, 2019 at 07:51:31PM +0200, Jernej Skrabec wrote:
> > > +	dev->regmap =3D devm_regmap_init_mmio(dev->dev, dev->base,
> > > +
> &deinterlace_regmap_config);
> > > +	if (IS_ERR(dev->regmap)) {
> > > +		dev_err(dev->dev, "Couldn't create deinterlace
> regmap\n");
> > > +
> > > +		return PTR_ERR(dev->regmap);
> > > +	}
> > > +
> > > +	ret =3D clk_prepare_enable(dev->bus_clk);
> > > +	if (ret) {
> > > +		dev_err(dev->dev, "Failed to enable bus clock\n");
> > > +
> > > +		return ret;
> > > +	}
> >
> > Do you need to keep the bus clock enabled all the time? Usually, for
> > the SoCs that have a reset line, you only need it to read / write to
> > the registers, not to have the controller actually running.
> >
> > If you don't, then regmap_init_mmio_clk will take care of that for
> > you.
> >
> > > +	clk_set_rate(dev->mod_clk, 300000000);
> > > +
> > > +	ret =3D clk_prepare_enable(dev->mod_clk);
> > > +	if (ret) {
> > > +		dev_err(dev->dev, "Failed to enable mod clock\n");
> > > +
> > > +		goto err_bus_clk;
> > > +	}
> > > +
> > > +	ret =3D clk_prepare_enable(dev->ram_clk);
> > > +	if (ret) {
> > > +		dev_err(dev->dev, "Failed to enable ram clock\n");
> > > +
> > > +		goto err_mod_clk;
> > > +	}
> > > +
> > > +	ret =3D reset_control_reset(dev->rstc);
> > > +	if (ret) {
> > > +		dev_err(dev->dev, "Failed to apply reset\n");
> > > +
> > > +		goto err_ram_clk;
> > > +	}
> >
> > This could be moved to a runtime_pm hook, with get_sync called in the
> > open. That way you won't leave the device powered on if it's unused.
>
> Currently I'm looking at sun4i_csi.c as an example of runtime ops, but it
> seems a bit wrong to have suspend and resume function marked with
> __maybe_unused because they are the only functions which enable needed cl=
ocks.
> If CONFIG_PM is not enabled, then this driver simply won't work, because
> clocks will never get enabled. I guess I can implement runtime pm ops in =
the
> same way and add additional handling when CONFIG_PM is not enabled, right?

Ah, right. I guess you can either add a depends on PM, or you can call
the function directly and use set_active like we're doing in the SPI
driver.

> BTW, which callback is get_sync? I don't see it in dev_pm_ops. I suppose I
> need only runtime_suspend and runtime_resume.

get_sync is the user facing API, ie what you call when you want the
device to be powered up. This will call runtime_resume if needed
(there were no users, and you become the first one), and on the parent
devices if needed too (even though it's not our case).

> Off topic: sun6i_csi.c includes linux/pm_runtime.h but it doesn't have an=
y kind
> of power management as far as I can see.

That's probably something we can remove then

Thanks!
Maxime

--murlg7gnizd4neyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYI/dAAKCRDj7w1vZxhR
xevqAQCkxjBKYVgA/AYg52M5egxPmCw9EbU+dTVOFOS3HnL94wD8C/1DfMGYclzH
K2NXT3v5e5dek4yjiUUAdMyPuzrn4gU=
=xZgs
-----END PGP SIGNATURE-----

--murlg7gnizd4neyj--
