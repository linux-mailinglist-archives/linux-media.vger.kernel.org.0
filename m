Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 506582A5F26
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 09:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727672AbgKDIOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 03:14:18 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:41657 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725896AbgKDIOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 03:14:18 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id A455BFDD;
        Wed,  4 Nov 2020 03:14:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 04 Nov 2020 03:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=XXFAaRSb32pxervJ1Zv7TKZ0W1s
        w+VVFPoX3IFt124k=; b=iCwoYVLLUuVNNTENXSZz+PtAZLQH0NKPIcbefvT6PAz
        8tNPUABoqO+CJOiPRKxLT77evcmvx99BOPBIVjGOlUnMc2ahCWKNczXUMNhN1Qy1
        6WLapO/of98Ad3Y5qA0R0QuxhGJss8NWIdpN2yIoCetNyZ4W5GlO3sf1RhBlGPpd
        L7fOWZDcMH00O6m9ZkuW02wWh+jm1eCkVAB4uLXOV0991EDg9x6rEwE2LasMz2D1
        mzFmFDXzdZ4DOBt0TfuGpqNACvWEefe3T4ta178S7CSXR6g8tGx772bOSvIBh3pk
        X63RPUU9PmFv5GTiH5jWMSm6zYnwMV1zzhk4JqkvqQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XXFAaR
        Sb32pxervJ1Zv7TKZ0W1sw+VVFPoX3IFt124k=; b=paXXPDf3g4w2iHpy7gvEr+
        WWbQX+cocXbs7LnYqP7myPSy9nGA2kWSgaoH3ExVLATUNre/rDp/eVzzWw5kmA6M
        xsIXpAYV4C/ja7niS/cqY2FARy5nQksloiNyA4hwoDyHwwQ4xtLDZrB+3XTZuahw
        t+bSL4JaBeIdKgCjZ2tbiS72uVSk7IS3yysiY/75OJfW+IrSIwD0Vht8QfJBTXNq
        OGrLs/N+9jSiXf/jCGMhqFbsB/J8yMdUZecKW58h9h9IhK618if6bktxR/NlFHpk
        brV+Jw09uzy2XJS+3QcqTS19CNhGnN3fhPcV4MAV6GRMSR6UQMfbEX5ar45KetWQ
        ==
X-ME-Sender: <xms:1mKiX9Uw7IzIEenw8GEh7Bxgnf68CeebqvVMP6DXsP8SIwOfA_FNcQ>
    <xme:1mKiX9lEwja08z2fB_8rYkMXpeBD7OUQeWBugc8CE-SmCSKFfTzeShMJeoA790gyx
    1GKXcwAgfhDClQ_jdc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtgedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1mKiX5ae_ncy_0iLL_K73gy0kfa6uzRxio7UfwfhB0QcC_NGb9PBdg>
    <xmx:1mKiXwW2D2UVSmXop5Vr6IM_Q_Q4HzsadzAwj-ZzTN_tzDm1_ZGyxA>
    <xmx:1mKiX3nCGITQ660Ht2PtiifK258kb2m8rUY6OPWDIih-t34sHfHtjQ>
    <xmx:2GKiX1W3mvCko0ApKlkI6NDW5jRTTxv-cEEqAhfUsb-yXNDsSgxF3A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id D3DE3328037B;
        Wed,  4 Nov 2020 03:14:13 -0500 (EST)
Date:   Wed, 4 Nov 2020 09:14:11 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Chen-Yu Tsai <wens@csie.org>, Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: Re: use of dma_direct_set_offset in (allwinner) drivers
Message-ID: <20201104081411.bnt5kixgunaczbzj@gilmour.lan>
References: <20201103095538.GA19136@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dpottggxee74tnew"
Content-Disposition: inline
In-Reply-To: <20201103095538.GA19136@lst.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--dpottggxee74tnew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Tue, Nov 03, 2020 at 10:55:38AM +0100, Christoph Hellwig wrote:
> Linux 5.10-rc1 switched from having a single dma offset in struct device
> to a set of DMA ranges, and introduced a new helper to set them,
> dma_direct_set_offset.
>=20
> This in fact surfaced that a bunch of drivers that violate our layering
> and set the offset from drivers, which meant we had to reluctantly
> export the symbol to set up the DMA range.
>=20
> The drivers are:
>=20
> drivers/gpu/drm/sun4i/sun4i_backend.c
>=20
>   This just use dma_direct_set_offset as a fallback.  Is there any good
>   reason to not just kill off the fallback?
>=20
> drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
>=20
>   Same as above.

So, the history of this is:

  - We initially introduced the support for those two controllers
    assuming that there was a direct mapping between the physical and
    DMA addresses. It turns out it didn't and the DMA accesses were
    going through a secondary, dedicated, bus that didn't have the same
    mapping of the RAM than the CPU.

    4690803b09c6 ("drm/sun4i: backend: Offset layer buffer address by DRAM =
starting address")

  - This dedicated bus is undocumented and barely used in the vendor
    kernel so this was overlooked, and it's fairly hard to get infos on
    it for all the SoCs we support. We added the DT support for it
    though on some SoCs we had enough infos to do so:

    c43a4469402f ("dt-bindings: interconnect: Add a dma interconnect name")
    22f88e311399 ("ARM: dts: sun5i: Add the MBUS controller")

    This explains the check on the interconnect property

  - However, due to the stable DT rule, we still need to operate without
    regressions on older DTs that wouldn't have that property (and for
    SoCs we haven't figured out). Hence the fallback.

> drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
>=20
>   This driver unconditionally sets the offset.  Why can't we do this
>   in the device tree?
>=20
> drivers/staging/media/sunxi/cedrus/cedrus_hw.c
>=20
>   Same as above.
>

We should make those two match the previous ones, but we'll have the
same issue here eventually. Most likely they were never ran on an SoC
for which we have the MBUS figured out.

Maxime

--dpottggxee74tnew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6Ji0wAKCRDj7w1vZxhR
xfhqAQCGVXPQjuqueGxzvosMw+xeQPBqXhmwv85fYyeue+LdyAEA32seUuD5LvjK
NYOXbQBiz2tBS6ESieNJ73KOZrgtHgs=
=h/j1
-----END PGP SIGNATURE-----

--dpottggxee74tnew--
