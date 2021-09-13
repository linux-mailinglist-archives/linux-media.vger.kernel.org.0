Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B964086A1
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 10:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238243AbhIMIdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 04:33:12 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:45209 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238026AbhIMIc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 04:32:57 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id E4595580B02;
        Mon, 13 Sep 2021 04:31:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 13 Sep 2021 04:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=4z6zePSoBjeWsjoNDVFhA/Ago/a
        0rXEqKZSBXpOMmgs=; b=3gsTSe2zYxyA7Wr79PMvbFNcKOqZL/5qsW9YTG02cb9
        891aI5uksQuA3y4OFk2R4Bgx10oLFNJ+uKVM/0B5kEymwRjkoFhSwCtZEj/w7K/e
        WYfmDyOuTyWZLPT9xqEclMq4z0jWHeotyMd/5wQu2Gz2i660QVOInnWDp4k0YACJ
        iyzxGK714aAn+obuOV4YgBn2fWhCyulax6b+EhcLC5vY9lGPe6cnfJv49d4qmTwv
        rQMfRHwhS7gGCiGB0uv+U6+KtTagSHQeZEbLVWNZN0+9/K7XcaNfGH2/57wxaY3K
        OLqHuDOkrbjCmRsjfXCuHNTXApTVL3IoH7XsE0exL1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4z6zeP
        SoBjeWsjoNDVFhA/Ago/a0rXEqKZSBXpOMmgs=; b=CYvZWhvRfErfJfWiykQPA9
        7h9/uEQ9oWpTBEJJ5X9C+7f7MIsGDwrOWzqjHFeGE0TediprO+ahqfUfie9/RjyG
        rAg/QDypLJWiC91MMC+9mW+hlj9Dp9ejNmRWaqdDlI49n3QmJR0mkOKIyf1ipJhY
        euN69QTTM+lkwq+gVyHBnmuqj9XkFmXH4uKI5ATj81IGN3oh3S53bF8mjkn4xmxX
        l3Um63Z2+i2fF+MNr11WJeR71W8fTqfrV0fZdJMtOn6oCao9BcD5wAJsC4xVK5M4
        2v6gSVH7V3u1tzdaFSofzT7ANVobNLaUWY72gm73ZqodhIXUbZSKK1QlxzrST9MQ
        ==
X-ME-Sender: <xms:agw_YTues2SsQMnb1m0hTTHXFaVaD-oOlT-UYiZ6w6Tu7RIiEIDHaw>
    <xme:agw_YUd9_ZBMdQ2eX1w_8tc-9-RUlkAwbuNtEzVWRyuF7zsjckrV75v-vlgJ9pNzC
    u5anc-DU-ZXO8IVyB0>
X-ME-Received: <xmr:agw_YWx5UIEaxVIIKPvL1KRRAvzYWpC0nAlgugpgQiWeLLPWvoOL7CNDVS61MwK_LYQq5il-dqBsuii1kO3sjr_0ZIFVlvKpl5rQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:agw_YSMnzjg8S2CTsLN44s5xRob7s0OfL3m6Hu6OJ-HKS_2aIPRK5A>
    <xmx:agw_YT_gdxF8UqBs81a2XOmmuqVuzopoICI7Ku4-hdk8JLbusDoPoA>
    <xmx:agw_YSWxfQDozW58LZzXvKCy-9N9URMG5T1hRpKFGkf48LmQzKSELQ>
    <xmx:bAw_YW3OmKz1TeS6Jnk_TNkr2aczQQ1HivQd_fIsNn5acxbxGapEcQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 04:31:37 -0400 (EDT)
Date:   Mon, 13 Sep 2021 10:31:35 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 20/22] staging: media: Add support for the Allwinner A31
 ISP
Message-ID: <20210913083135.v7q7joux2xckat62@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-21-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jbaigkkcxkmfnrsb"
Content-Disposition: inline
In-Reply-To: <20210910184147.336618-21-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--jbaigkkcxkmfnrsb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2021 at 08:41:45PM +0200, Paul Kocialkowski wrote:
> Some Allwinner platforms come with an Image Signal Processor, which
> supports various features in order to enhance and transform data
> received by image sensors into good-looking pictures. In most cases,
> the data is raw bayer, which gets internally converted to RGB and
> finally YUV, which is what the hardware produces.
>=20
> This driver supports ISPs that are similar to the A31 ISP, which was
> the first standalone ISP found in Allwinner platforms. Simpler ISP
> blocks were found in the A10 and A20, where they are tied to a CSI
> controller. Newer generations of Allwinner SoCs (starting with the
> H6, H616, etc) come with a new camera subsystem and revised ISP.
> Even though these previous and next-generation ISPs are somewhat
> similar to the A31 ISP, they have enough significant differences to
> be out of the scope of this driver.
>=20
> While the ISP supports many features, including 3A and many
> enhancement blocks, this implementation is limited to the following:
> - V3s (V3/S3) platform support;
> - Bayer media bus formats as input;
> - Semi-planar YUV (NV12/NV21) as output;
> - Debayering with per-component gain and offset configuration;
> - 2D noise filtering with configurable coefficients.
>=20
> Since many features are missing from the associated uAPI, the driver
> is aimed to integrate staging until all features are properly
> described.

We can add new features/interfaces to a !staging driver. Why do you
think staging is required?

> On the technical side, it uses the v4l2 and media controller APIs,
> with a video node for capture, a processor subdev and a video node
> for parameters submission. A specific uAPI structure and associated
> v4l2 meta format are used to configure parameters of the supported
> modules.

This meta format needs to be documented

Maxime

--jbaigkkcxkmfnrsb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYT8MZwAKCRDj7w1vZxhR
xfCSAPwNpePQefQ1qY48RKWEqQCFEJEtyeWg8x+EPAkBtwyHhgD+L5rlC9YsjQxc
0BfJNJ8/18oWOFR8e3TB8hFtggnpbA8=
=eqH5
-----END PGP SIGNATURE-----

--jbaigkkcxkmfnrsb--
