Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54BA3FD6AA
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 11:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243605AbhIAJWV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 05:22:21 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:42607 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243418AbhIAJWU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 05:22:20 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id AD3785C012B;
        Wed,  1 Sep 2021 05:21:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 01 Sep 2021 05:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=qiHXnNjIN4q+hXuGsmo1K3sGTz0
        RPyZxCI10POS99NY=; b=rBJysFNX6Hic+LxESnnWe++SIpanJqXSv1iv/rOaDmE
        XQfW6+GNK0auVNdnWFTIYmwsvIxXGvX3ANcYXrYznZd5LD1te00ePN7Nd8AFj4Yo
        wcBWEy9HZI62h2ILOiMvSL70I2FhKmPgFISN7duah56BvhPotSixglU1DJlZNJKe
        ZNM3gFKwsiK3dRw+l9v9r5hHlN9UCJwJB8ro1Mtk2SW0QqDOfvPp50jqXbMvmUu5
        QUvyA+Se/XqUVzvCRGIwdlpcCnb+g7BswTLTMJLkqkrMkGti+dSUlznZPp/hTLQz
        v158z8MRFhqBLMm0bemHbjiYraNNcWb5gWphCycYddg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qiHXnN
        jIN4q+hXuGsmo1K3sGTz0RPyZxCI10POS99NY=; b=nGTMBRV0K+uM6B6Sv5sPtw
        vDy5dTD+gM2StyTmuhW4L7tU9jCoF1nkXCejDt2puKwlVq0wudL+40WH9+O2VbGc
        Nc/c8Sm+voVubPSPF4gOSusdx5LU58P3NRT4j1+wm3f4gCDe9WEiIkibZQey5ikx
        0qoOBKtqk6JW05f69bUxm327+7oAh8XQ4jaHkpx+iKnhk2HjRDCoAfaHWkO/6GBN
        Yr+25MlWInMzt+3Ane9xKoRtM/fqrSVvDWSOlaWn89GTJBoZ1YRt8SP7BkxlXJDJ
        queosHaHUWED78nRodiGR66lldMRwSm0tVfOmzfBydAfmk4eKaut9PtlQB03O07Q
        ==
X-ME-Sender: <xms:EUYvYXPYUDi4RXglKRnp_ksLuWe1XNHjMDetJ2LS7RDgLPqlHLDBcg>
    <xme:EUYvYR-X3Sjy2ljvzaSdCOVI-gplbr3rbE8Ws1jm7PH6UsODHxxYFmW0JhVEj-kS0
    TcjnIVHVQSVxyXBJJQ>
X-ME-Received: <xmr:EUYvYWSKE6aODhOJccFC1frTquHw94ERdjNYug7ED6-jzMl_wxvTLHuvmTAXLc2wk6aedEhO3f-IxdgHl2jKtxL3s6PfxJc8Slo6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EUYvYbswu9V3-FacHgxFxoup3az0HjuyRNhH1jaH9FzQki_HWZ6gcg>
    <xmx:EUYvYfeFI4Eh2XtuAGx3dOoe2-rGADxxKxmp_w1aeg4UBXba6wWEvg>
    <xmx:EUYvYX2QFhkGHkCPl5RPdn9m6ZPCHKxugnFjUA5WzssM8_nlUGUZEw>
    <xmx:E0YvYRsn5yfOEUvcHCFZ7FVSpidT7FlIuptqORTqfNRokmbbZu0xSA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:21:21 -0400 (EDT)
Date:   Wed, 1 Sep 2021 11:21:20 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Yong Deng <yong.deng@magewell.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: sunxi: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <20210901092120.g6v5ug57ojr73aos@gilmour>
References: <20210901055654.7979-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dgostsm5f4gqjmbq"
Content-Disposition: inline
In-Reply-To: <20210901055654.7979-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--dgostsm5f4gqjmbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 01:56:53PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--dgostsm5f4gqjmbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYS9GEAAKCRDj7w1vZxhR
xVFnAP4/zVD62+m/OZ3fNsxueRD6sZrgPTvxrSuxAVwP1l+8JQEAtOqWjgp2V6qL
OTTotVTle8T+S2x/pF0XYla1YaspoAo=
=D6bC
-----END PGP SIGNATURE-----

--dgostsm5f4gqjmbq--
