Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555562F467A
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 09:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbhAMI1w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 03:27:52 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33577 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726235AbhAMI1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 03:27:52 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id B61E75C0491;
        Wed, 13 Jan 2021 03:26:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 13 Jan 2021 03:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=+eb9MYVKw8kOQcjSGqOAjHWpQQ6
        2lU5ysMR3PLKD6qk=; b=B7syX42b4uZJYZaZITSe21+OF6hk1Q3B3hbmES1vZhb
        romumOtcSvsw2jC631FJ/Na5e8aHQHEui51obsb3sPuMQZ0wZI6DCmmo0DrynaCc
        bp7n5+94H7RILlnCdcYLUMdcAo7uEBNSX68LnwkNYc6EudnSaj3CEY+IIjLhumqm
        HL+q1jkzcZHIFMxJKBwrT+7WPJ2ARV4h3fdRi2wxywZNj3Ws4LYekK4Tl+XeY21l
        uBr6nKUyAg7045EdodPqbiLtnt4stfPz4y3mJG4s1oBlRAd04TtA80F4fDhRNOkI
        Ku12OKj0AKIShstqT1fWY91o5uy6oYu/GVOhENUeUGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+eb9MY
        VKw8kOQcjSGqOAjHWpQQ62lU5ysMR3PLKD6qk=; b=MfousZkgr07aOL1veQ1uF5
        FINfbd/MaNfUE49zqbL5aQCAsV/gB4Peu2K6kNsiJYepOe/N9ECotwpSoza0P+WV
        eaMZ/0GI/noxLM8tVT0A2nprGTVIa7wU/CSdD/SR9tFepTwjQ95eXJLpiDFk4pRW
        oooeAV1JzG21nI6rGykp3CHqSd8iqShs1agwj5GxA4mF0YtYCKNtgjmWtjnzV73f
        FmA9T/hbBKpzUdph99kxcHhzo6n2s4HhBYVFLZaGBGjXek0LBYhR3IELdXjj6PSk
        /en9fBPyJFcOHY7RmPsqUbsWq+I/RAokZzu8qXUkUejG/sDLmMNBRPllayN4D3hg
        ==
X-ME-Sender: <xms:xK7-X4u2ptIIOBJ1FPvfEXxFUi8O_Lf7YgcnA4UwF8ihw4IsjYIDVw>
    <xme:xK7-X1e3FpMjcX02RF9zGxWLZWfeboZm98pa43jk3u5e9yobNkE9A9p3h5NxTo3nX
    IfVbc1X6Wv4qmUNH_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xK7-XzyS-HZWUquiltqpCk3oNzT1gV-Ppr4C9-g_-gzORylxqXIZFA>
    <xmx:xK7-X7OXaxd2VQ9RaxJWk6gblkNEp0ox2eIie2lJ5xveBmYcks2Hwg>
    <xmx:xK7-X48tYvKbkIdHpqX7a243TdjrYgexS_9hG8hqrt3SKqTNfbTr0A>
    <xmx:xa7-X3nqmDeyFI9dSeTxUMkmKmY4tDjgypLYHiBJqOEoWxOUsfhfcA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 77790240064;
        Wed, 13 Jan 2021 03:26:44 -0500 (EST)
Date:   Wed, 13 Jan 2021 09:26:42 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/4] media: sunxi-cir: Cleanup and power management
Message-ID: <20210113082642.v4gdvnllk7mzihdj@gilmour>
References: <20210113045132.31430-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mjtxpnmpjvho7jip"
Content-Disposition: inline
In-Reply-To: <20210113045132.31430-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--mjtxpnmpjvho7jip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 10:51:28PM -0600, Samuel Holland wrote:
> This series cleans up some dead code in the sunxi-cir driver and adds
> system power management hooks.

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--mjtxpnmpjvho7jip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/6uwQAKCRDj7w1vZxhR
xb1LAP0XUvRBBMpXiuX3EtTe9jOWFfkmdtxcvMhWPed0R+u8uwEA1VWVV3Y8gI8f
kSozGZox57nNdNnM678q/9kfMiPRXA8=
=AMac
-----END PGP SIGNATURE-----

--mjtxpnmpjvho7jip--
