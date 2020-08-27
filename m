Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4022548CC
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 17:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgH0PNP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 11:13:15 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:44971 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728432AbgH0PNJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 11:13:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 203EF10EE;
        Thu, 27 Aug 2020 11:13:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 27 Aug 2020 11:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=C/+mFJaBBx5jcHqjlyBhhPH/qkk
        DdWRrn/96ZVyikyo=; b=ZcSb+TsyY8AG17EFmMntByiRrLy2Lh1IfkRkMEQymPZ
        cBcUY1EuPHNlGjHYWKjhW4pGw66Eg5mYIQnjCl3trZ7AnfpucJlzTEu+nV1BbKVa
        /4P1yYCuvveNxTtT63biuulyh0oCLxC/YxxjjmWoUk9dNGwAfuBBLdw6UvhZLWGw
        2zScotb/2225H9yv5N0SKsppUOs67egIThQIJd623FKPns4YQP/02DDyYVnqttER
        InUlKmC5oSu5YBf7WxYOPvxlImiyLk26wZhrLo6S33B5BtfnTzKe7P05NSY024zv
        5ZRhnTS+CVk/zpwrO9iEVul/U1zUBDJnbe8fkgo5uFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=C/+mFJ
        aBBx5jcHqjlyBhhPH/qkkDdWRrn/96ZVyikyo=; b=lwpSDbB1z9TXIfrhnhHFXk
        ZDgT7aOVf6k/VJCn2VeF7cDJWHqdiB6pinj8ywPIdwDAkr43aGpKLiWmPP1n5zM6
        cInkraCNo8y8R0rwxt33bug8JkzfU/dbNnUahI/Z9ZD7rL8f4iXuOioiIvkF0ns3
        OhIiTv+Wrb/y9vUF7KKtUskK8x2jglThLLtp7msp8cbsr9IuOYLPmybqc/8qV8nJ
        Uf2zR5/lq9roGEyymHhvnc5gL1Zuhy0OjGMNjOMK7wMqtNRoPbrRWDbm4vOPMoe1
        W13qwOPnJKNqlCop0wYuSMbXBOhkHqUxg1YMcuS41bBADysD3f5SsHypEOR+gIFA
        ==
X-ME-Sender: <xms:fs1HX7oexFet15xeOQMnDHXEvA1DZBkS1q0z_j0iWSj_NbGcwWSaKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fs1HX1pNinnZpn-Z99_x8lSk7hyrNk8L28GRWJAp71h3WSdtFHQfGw>
    <xmx:fs1HX4MjulN24sDECRxkoXxOEDYVbwMGXNBTMiDsjpJuFY2FFklXkw>
    <xmx:fs1HX-480H3lNDsRUh75-AHkzPaFCacIVGlmDUQeh3k5pyKHAmUKyQ>
    <xmx:gc1HX8R6BKTkBwn2zx2eBdBdqPd4VQTYYJUpRXKGIrwqJWOPM11BxQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6B5273280065;
        Thu, 27 Aug 2020 11:13:02 -0400 (EDT)
Date:   Thu, 27 Aug 2020 17:13:00 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     wens@csie.org, mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/3] ARM: dts: sun8i: r40: Enable IR on BananaPi M2U
Message-ID: <20200827151300.zu3drnnortto5647@gilmour.lan>
References: <20200825171358.1286902-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ot7wtlx72g4ekyyy"
Content-Disposition: inline
In-Reply-To: <20200825171358.1286902-1-jernej.skrabec@siol.net>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ot7wtlx72g4ekyyy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2020 at 07:13:55PM +0200, Jernej Skrabec wrote:
> This series first adds nodes to R40 DTSI and then enable IR receiver
> for BananaPi M2 Ultra board.

Applied all three, thanks!
Maxime

--ot7wtlx72g4ekyyy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0fNfAAKCRDj7w1vZxhR
xUAjAQDDiSUFApIM2/5AnuNCdLMGzEYkz0pHqwujbG61g6UOuAD+IUZ3P1fJUSKs
y55trL0dgZJ8dtwoyb94ofzk8tmhNwY=
=m1f1
-----END PGP SIGNATURE-----

--ot7wtlx72g4ekyyy--
