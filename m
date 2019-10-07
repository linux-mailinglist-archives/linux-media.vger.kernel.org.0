Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFF7CCDEAC
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 12:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbfJGKFj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 06:05:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:33618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727262AbfJGKFj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 06:05:39 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C42F52084D;
        Mon,  7 Oct 2019 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570442738;
        bh=SgJfuXvgpHLIgRHdUoCoVb90LQ5tYsiPi7rkeX7IDoo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IiXGhHX+pw00yNbyyHAgafyNp2EdL/uxZ76eoMGtfM9NuBzo/xQCD7tBF5whlxPZT
         Sdo16fZWfShNlGuiaW6vGtdQK7V2QYAw8ImgMRALSkI0JPaYphoODCd61OXkoGZpNA
         6wiRsL0tYJSM8cHxg0gU8i8QOA63vrCCKxAomMcg=
Date:   Mon, 7 Oct 2019 12:05:35 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: dt-bindings: media: Fixup Allwinner A10 CSI
 binding
Message-ID: <20191007100535.6gp6b3h6ueyeln3b@gilmour>
References: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
 <20191003115154.6f2jgj3dnqsved2y@gilmour>
 <CAHLCerNoLyQ-e70=1VMPO_J_amA+-2vtHwfoUabo4dhUWj-H0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtzhpa6icwubspzk"
Content-Disposition: inline
In-Reply-To: <CAHLCerNoLyQ-e70=1VMPO_J_amA+-2vtHwfoUabo4dhUWj-H0A@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--vtzhpa6icwubspzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 05, 2019 at 04:15:57PM +0530, Amit Kucheria wrote:
> On Thu, Oct 3, 2019 at 5:22 PM Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Thu, Oct 03, 2019 at 04:52:24PM +0530, Amit Kucheria wrote:
> > > This new binding fails dt_binding_check due to a typo. Fix it up.
> > >
> > > linux.git/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
> > > linux.git/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts' failed
> > > make[2]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts] Error 1
> > > make[2]: *** Waiting for unfinished jobs....
> > > linux.git/Makefile:1284: recipe for target 'dt_binding_check' failed
> > > make[1]: *** [dt_binding_check] Error 2
> > >
> > > Fixes: c5e8f4ccd7750 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> >
> > Thanks for your patch.
> >
> > It has already been submitted though:
> > https://lore.kernel.org/linux-arm-kernel/1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com/
> >
> > I'm not sure why it hasn't been applied yet though :/
>
> Perhaps a Fixes tag will allow more attention to it?

I've added a fixes tag and merged it through the sunxi tree.

Sorry for the time it took, and thanks for sending that fix!
Maxime

--vtzhpa6icwubspzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZsN7wAKCRDj7w1vZxhR
xZuhAQCdgJicTIV+SZaFXhQJ8O/6nn4LmVV2y3ElJZkaqAR2wgEAqJe2O+Nq++LE
h2S1IrtaQMzZpcMjzksWn8n5JRZYSQA=
=4Pja
-----END PGP SIGNATURE-----

--vtzhpa6icwubspzk--
