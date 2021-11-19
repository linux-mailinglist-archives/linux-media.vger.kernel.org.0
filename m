Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C964E456B8F
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 09:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbhKSI0D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 03:26:03 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:54031 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233909AbhKSI0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 03:26:03 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id DF91D58082B;
        Fri, 19 Nov 2021 03:23:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 19 Nov 2021 03:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=rioO4rk8sMQEKVcYrridlBO6Q3g
        UR1YFmapND1lsvQc=; b=SWchOu+zWoEoSIzxqLZj3qeuoa/I2TSvz1V4KGI80tn
        sSjIYqCBtSgnru22fEGTLcBUCUbfM/wKxGl4goumnqphXOz2K1Snkf/uPou4dGzx
        HriTO9AGL5zqVkzAvc5ojGQ/yp0QKrlrtkWGGYCo5gZ9xD97ktWsgdN/9ELYxzLe
        Mkxjw8GktbLjajkioUMYErK67/Ve/05v6+WvjBSn7TmVbiNI+NNXLaGbGkWgV0pz
        TLb1ePHxxg/wTb0wGeLRWnIQYBq0t8P4GFfGmCrmh3DmS6N7MXBTmUDiX9ZsR5qL
        e0EnoFVNlgS5NudJ3/OfyLPDw+Fs+vUinUBVcc0d66g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rioO4r
        k8sMQEKVcYrridlBO6Q3gUR1YFmapND1lsvQc=; b=JZcxMkBhimSBqQ6ndlh35z
        3UPVDxdAMbny6dQGX8cdlwA/bCVCnoIUBI7DE8CcrBQnM7t2MDmzln1ONdevwfKY
        UhU9/v2uzgL91BFLol9ic5Bc62mxLY3tbadWkuNFCRuc+dQ/ffB1Tw04cc02DMQY
        CDKlyRA5FPBRwI2MDrh7oYoXvYAXj98z+oH9qFFWgmjIxr0qo32HsL9WpGNP7Nlk
        NPQJZlNBKjtoPbSvH3iBFLV89Ehw9KVi4m8Hm1qRZRVvwdx/RI/I2ybIh1uJqmY+
        xfzt5ex+CzM0Jyq10UZ6/sGcsvZ1oQOpJI1BphBQNpHLi8UqCF0E899Nj3A4flZg
        ==
X-ME-Sender: <xms:5F6XYaX8oz6nWaPVUgbHZTdSk17p1eOvCQkja5es8j14Zc1iKMQB5A>
    <xme:5F6XYWns4EYIXhaWy33ilYW0KxPMeZnhS24ZTOYSKikg8mzr93MQ9JbbZPAgjQnFj
    k-YjYtlL7A3OH_IpuI>
X-ME-Received: <xmr:5F6XYeZWVzhf49cehy-lBIElkV2x4ySsyeMSUZKEsyJjaWHWCIPED5uYMyPd75IOCBnyq229WPHRYuTaRkIt-ySj1XlfsgW4RGnjYo5Gq24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5F6XYRUQLkqnkXM9_bRyX34ruyH4H6EmOJT-q2DRh_Vy0MKk67cp0w>
    <xmx:5F6XYUl7rz1ZcdgiT9nxell35SffvquaHcy4sxZqSqgv6lXvqifKgA>
    <xmx:5F6XYWewrWIvuhffLpZg3NQ-GIO5TFa9UBFUzP3LJLkvcM9VcXTf-A>
    <xmx:5F6XYRhga3j89aC7HQIZyAlx2WYM1qYjdDs3059RFqrCkjuiV1C0sQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 03:22:59 -0500 (EST)
Date:   Fri, 19 Nov 2021 09:22:57 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: Add compatible for D1
Message-ID: <20211119082257.54jz4v7pmoxlm3t4@gilmour>
References: <20211119031519.23430-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zfwns3qbqb3tp6e2"
Content-Disposition: inline
In-Reply-To: <20211119031519.23430-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zfwns3qbqb3tp6e2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 09:15:17PM -0600, Samuel Holland wrote:
> D1 contains a video engine similar to the one in other sunxi SoCs.
> Add a compatible for it.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--zfwns3qbqb3tp6e2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZdewAAKCRDj7w1vZxhR
xaEYAP4l/WEbHsbkfY8QIW2/shaZjLs4O2sEgVo3/X0EEj/DyQEAzH54UJtjiXSA
XGiw+BRfJTxTN9AsakHuYxraC4cU1g0=
=O+po
-----END PGP SIGNATURE-----

--zfwns3qbqb3tp6e2--
