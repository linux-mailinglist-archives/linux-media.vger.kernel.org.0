Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4982CE127E
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 08:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389518AbfJWGva (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 02:51:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:54280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbfJWGva (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 02:51:30 -0400
Received: from localhost (unknown [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 884232064A;
        Wed, 23 Oct 2019 06:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571813489;
        bh=hBmd5KPV6GhZmi3teZ7pgUcmVyOexynGR7kSJghi+Ig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zg/KpCnvvZCquZPkNV/bKcz4j8uihmbrrjeSjyqVX03QfN/9c4lefnzZgpNmiVCys
         j9LRFc4+UxKCVkjHtE8FQBcP+//WlTQTgezIXfawEDfRUvCqRwFo9Mg/ctX9a4l1EO
         l0sVppcq7djBD2yKfJ09z9t6wATXSxZFZtShIXZ4=
Date:   Wed, 23 Oct 2019 08:51:26 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: dt-bindings: media: Fixup Allwinner A10 CSI
 binding
Message-ID: <20191023065126.ckqgvqkzeqtt3j3m@gilmour>
References: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
 <20191003115154.6f2jgj3dnqsved2y@gilmour>
 <CAHLCerNoLyQ-e70=1VMPO_J_amA+-2vtHwfoUabo4dhUWj-H0A@mail.gmail.com>
 <20191007100535.6gp6b3h6ueyeln3b@gilmour>
 <CAP245DXT=HL+m-LqoC25EBnOaPmF1pUW0fEZp6EZB-MdgOJoWw@mail.gmail.com>
 <20191007104835.v6iqpoolqtajryik@gilmour>
 <CAL_JsqLVkikYVpjs1m+QqsOK2CfSm9+LfZWXbWEoszeSt3RGaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="meupzleynumtgrf3"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLVkikYVpjs1m+QqsOK2CfSm9+LfZWXbWEoszeSt3RGaA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--meupzleynumtgrf3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Tue, Oct 22, 2019 at 11:17:35AM -0500, Rob Herring wrote:
> On Mon, Oct 7, 2019 at 5:48 AM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Mon, Oct 07, 2019 at 03:45:29PM +0530, Amit Kucheria wrote:
> > > On Mon, Oct 7, 2019 at 3:35 PM Maxime Ripard <mripard@kernel.org> wrote:
> > > >
> > > > On Sat, Oct 05, 2019 at 04:15:57PM +0530, Amit Kucheria wrote:
> > > > > On Thu, Oct 3, 2019 at 5:22 PM Maxime Ripard <mripard@kernel.org> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Thu, Oct 03, 2019 at 04:52:24PM +0530, Amit Kucheria wrote:
> > > > > > > This new binding fails dt_binding_check due to a typo. Fix it up.
> > > > > > >
> > > > > > > linux.git/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
> > > > > > > linux.git/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts' failed
> > > > > > > make[2]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts] Error 1
> > > > > > > make[2]: *** Waiting for unfinished jobs....
> > > > > > > linux.git/Makefile:1284: recipe for target 'dt_binding_check' failed
> > > > > > > make[1]: *** [dt_binding_check] Error 2
> > > > > > >
> > > > > > > Fixes: c5e8f4ccd7750 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > > > > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > > >
> > > > > > Thanks for your patch.
> > > > > >
> > > > > > It has already been submitted though:
> > > > > > https://lore.kernel.org/linux-arm-kernel/1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com/
> > > > > >
> > > > > > I'm not sure why it hasn't been applied yet though :/
> > > > >
> > > > > Perhaps a Fixes tag will allow more attention to it?
> > > >
> > > > I've added a fixes tag and merged it through the sunxi tree.
> > > >
> > > > Sorry for the time it took, and thanks for sending that fix!
> > >
> > > Will it get merged for -rc2?
> >
> > -rc2 was released yesterday, so we're a bit late for that, but it's
> >  going to be in next tomorrow.
>
> Is this going to Linus anytime soon? It is affecting anyone submitting
> bindings against current -rc's.

Sorry for the delay, I just sent a PR

Maxime

--meupzleynumtgrf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXa/4bgAKCRDj7w1vZxhR
xUD5AQDHOQrg1fK8A/nnxv6B5Ya2z3WganmGJXv2EF+TFJppWwEA2zroQ3o10xRD
FT086EzZEJZgS5tYvtRNiHiZJZpaRQM=
=enB/
-----END PGP SIGNATURE-----

--meupzleynumtgrf3--
