Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8893F2519FF
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 15:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgHYNpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 09:45:51 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48387 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726222AbgHYNll (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 09:41:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 9AB6E58042E;
        Tue, 25 Aug 2020 09:35:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=ojmseEKHzxoiGqB788p1XAtMfVn
        G9Y87jZdv0bH8iWE=; b=MCRsTNJnWzXk9w8vclVSRjI++JPspgkJnMOA7vlbc3n
        2BGrls9MO4acqbXQq3avMJLWlJbyeykiadgy+pA4CFkpN2plJmY5vupBbsXEwWbY
        3V6CTg4yDI9Ha9R2qoYYjnmrMWvw/iogG7iufUAjz4I+CO3sPkI0Ew8R6tbwGAnr
        5JcY7bs2dSJnivpEGc1ArzJ/qLhkiL/ROmcHCtg7vsT9EcEdRmi5YtXXKur7dui8
        BES1GXueKXi02W3hGBouwDJ/ypXJTzAKr7yqyseInqGsbXgg0ZwbUQjMgniCNeOR
        C+IdsOHpsAO+XX/mQERWIQMsnNX4ugUY9lNESKYNORg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ojmseE
        KHzxoiGqB788p1XAtMfVnG9Y87jZdv0bH8iWE=; b=rKqjw58rqy7uCIb+DDNORU
        olRXuwt/cUxRQj+RlZvtrFH0gPWq51xcpRN4aJl7MyOtvbQqaMEBNsFcfhr6Ayjf
        h1By9naU3BkTTuxJwOt8JzacwJftRvDPRfJLV/g6jg9BLxxAHKyi9XA52KjSJVzf
        6X6I77fSxvdnfNhHgYoaf+roZMDx5m4cXMMRV3cPyn6d56zyp3Krq2cwjev0Ukcu
        sNcvvubJpnbYgnKy23DvluNTOh1uh/zd2OFnmFo/wq+0uzbOMIoXUksWMrILBpbs
        CRAow3ee/0/Gh+jpKue7nGTZ/riCtaEzDqgdKYck2lV5LoUiRlXoftickV8LJ8xw
        ==
X-ME-Sender: <xms:thNFX_6NlrgGqglkP6kcrUyexVbFsV7qHokZLVxCxe4zwngaDeAIBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:thNFX07Fyk2e9VROTjTBQzUNe7VeVyRlJI4nkosjP-XeHGD3kkWSeA>
    <xmx:thNFX2du4subVK53IYoS_Arv2LfhpedppmYFebGKSNLyCPP0y38HZg>
    <xmx:thNFXwL4cJympLRTlTvvA5a3vJBVzambWHD-RG7ezuxGkCKd1N-1Kw>
    <xmx:thNFX0UdnNiY7WlVSzZjw-yksRmZALcOET-BwHw3cekgzqOSAJnfJA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B826A3060067;
        Tue, 25 Aug 2020 09:35:49 -0400 (EDT)
Date:   Mon, 24 Aug 2020 18:52:44 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 0/7] Support of MIPI CSI-2 for A83T and OV8865 camera
Message-ID: <20200824165244.x5rnon47kmtxojg2@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6inilh36kvmcvg6m"
Content-Disposition: inline
In-Reply-To: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6inilh36kvmcvg6m
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 21, 2020 at 04:59:28PM +0200, K=E9vin L'h=F4pital wrote:
>=20
> K=E9vin L'h=F4pital (7):
>   media: sun6i-csi: Fix the bpp for 10-bit bayer formats
>   dt-bindings: media: i2c: Add documentation for ov8865
>   media: i2c: Add support for the OV8865 image sensor
>   media: sunxi: sun6i-csi: Move the sun6i_csi_dev structure to the
>     common header
>   media: sunxi: sun6i-csi: Add support of MIPI CSI-2 for A83T
>   ARM: dts: sun8i: a83t: Add support for the MIPI CSI-2 in CSI node
>   [NOT FOR MERGE] ARM: dts: sun8i: a83t: bananapi-m3: Enable OV8865
>     camera

You should have a cover letter here to provide some context.

There's a bunch of things that would need to be explained and / or
argued for here, in particular:
  - Why did you need to plumb it into sun6i-csi?
  - You're naming the CSI part as the A83t CSI, while MIPI-CSI has been
    supported since the A31(?), is there a reason for that?
  - This is not documented anywhere, what did you base this work on?

Also, I think that documenting the general challenges you faced (which
were likely because of the first bullet point above) and how you solved
them here would be great to start a discussion if needed.

Finally, iirc, Hans requires a v4l2-compliance run for any new driver,
which isn't strictly the case for this driver, but isn't really *not*
the case either.

Maxime

--6inilh36kvmcvg6m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0PwXAAKCRDj7w1vZxhR
xVcYAQDaPS4QQ1Gi24DL+makRUO9jaKTktQUPcL9pxgsiF10fwEAit94g5iWgJcy
Au+vTT0bokw+qv26aQbdeHa5l3a/4Qc=
=LI1/
-----END PGP SIGNATURE-----

--6inilh36kvmcvg6m--
