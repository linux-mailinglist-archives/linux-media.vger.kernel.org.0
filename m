Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C033FD6A8
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 11:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243571AbhIAJWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 05:22:04 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40717 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243457AbhIAJWD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 05:22:03 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id D07695C00FE;
        Wed,  1 Sep 2021 05:21:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 01 Sep 2021 05:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=OB+8RRzrdPG1A5Ogb6FQwfKtpYD
        oJ9W4IgGEK0T3ofI=; b=MxFTN+0dIHYqMEO0nEuv+piHBjA7iZe5f+A5QR4nxgR
        QqEJUu7wdIQcnY86UfheJXZWzLA57q6gtPGQ0rerSsePAi8EWZ59Pyz+kpHJTVkz
        YyBtOTHZPbKvVnLGwxsemeWcF9L2ujMrn1nLJ4LL6WDhYRdDQLpSLPZFLZXin9B2
        8QfL2JVM+bvrQr7HJ28mtu2mxE1BwtBtJMEff61FDLuwAs6KKmQutDbY8op4EjZ0
        TUAAeiThIMqnIYJWE0svdPS59ofbF/hmIepTqu6OHJwKk9djpTqC7hyHauFJDpTv
        S7FqxxX37zFtXYTwKQ1NXaVqGN9wHM5V31pC3EzYYrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OB+8RR
        zrdPG1A5Ogb6FQwfKtpYDoJ9W4IgGEK0T3ofI=; b=NnDvLKlz+PWVeqcTHVLVmJ
        6C5Wu8IzOKElgP3I95xyP7yibcqnvVj5g9BMsgjeRyESYP/tjgF4HYoHPS5eN8im
        6o00BDTXeW/oAIp6M/qGvIg/5znn000e4Sso5P8hPTDtA3OGqlCiHEQEJM0h01k6
        yBDW8W9ibHCNAqPfbWQAxDAfx611W7rNH4HpwGHh5RbFe0dhiEClTnV9Vg88pQpo
        BwLScre/PKfM3T5/di3yx9sB6tPx2AqSj3dRSekxOPMH7UR38XQ5GQmpjk2Xm/Up
        +s4ewbZfPT2Ep0VFeXk/AJcYwFEL8+QtcbYaLlzN4j2gT+iJMSqGCBEvAYhgVFPQ
        ==
X-ME-Sender: <xms:AEYvYYOso_2bmdoiGxfhLfzC31fQw2bzed55RsgEg37BBkA6ZFQrsQ>
    <xme:AEYvYe9BaPbDvxj0E_Hg1ftcnNbkIkTZs-dmCA2jBsdJKZeRnhU8E2WdqY8Ntwwpw
    IR317JS6sOLo04tId4>
X-ME-Received: <xmr:AEYvYfQkVZf7H6wVejP2FWyu-N-05L3-uhnoqW_iSKVpCFJD1XQT4n26dh1W3JjjW24klALB9DJfJCdXbP_fZYH_Fo-juCDLAw7e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AEYvYQtgR9xmsT-4pkNySCGHxmjDyr4iGBouFNIQIZ1VXwmwY3vjPA>
    <xmx:AEYvYQeLFTtjxoPA_GQaQhsXfjlbBcepIaxedsHOgQJyw2CIU2mDYA>
    <xmx:AEYvYU0Yb0A1DxnOS-n4c50vd_Io024i4CXwwERK-160s3EfQ9i3Lg>
    <xmx:AkYvYeslstPYZYLFonFNfmjWpzmlZVuYta539Q5dsj3BDS4ifeuK0Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:21:04 -0400 (EDT)
Date:   Wed, 1 Sep 2021 11:21:03 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rc: sunxi-cir: Make use of the helper function
 devm_platform_ioremap_resource()
Message-ID: <20210901092103.yu5gybxhsrpbdgu3@gilmour>
References: <20210901055503.7229-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6cy75rcudj2atty3"
Content-Disposition: inline
In-Reply-To: <20210901055503.7229-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6cy75rcudj2atty3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 01:55:02PM +0800, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--6cy75rcudj2atty3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYS9F/wAKCRDj7w1vZxhR
xYG3AP9YvKENzecFXG6r1AOhoMkieMemV3lVRglmZ6O1uGfNZwD+JWFMJcZQRrpG
hNU4BCrPaUuvKMCYvsIue5Yt1pju5wA=
=XPld
-----END PGP SIGNATURE-----

--6cy75rcudj2atty3--
