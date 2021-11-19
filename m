Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6EC456B92
	for <lists+linux-media@lfdr.de>; Fri, 19 Nov 2021 09:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbhKSI0N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Nov 2021 03:26:13 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:48059 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233909AbhKSI0M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Nov 2021 03:26:12 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id DBA4B580839;
        Fri, 19 Nov 2021 03:23:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 19 Nov 2021 03:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=fH8UWWwhRdsoVeWKQCjiZSlkqy1
        TytBtq7tiuhzF1E0=; b=nGL+14vY16pfLmkhnn5BulPIW4f0UDwXCW1Z6Ks6xmE
        ItkO7dtlPQx7futTeggOVI8Wwq0vq6vzKbvsEg06YWF62dHnQ9aCDbVDOUoeE/IE
        so3vUzA76jO7nh06buaoY2tTDj62Aqc22+EWYR3/f7skdRxovwxXtQ+mVT2/2b1I
        XAlAnEMddqBj9I7ZeJYpSTM5eWyogwZ59eeDrfE4hiRQHBZpwbUNmBwiACQUJgP4
        TJ2c5qJQIP+3wo0VBdaxyarKJ0kCdwvTyDb4LB48TDIL/3WQq54ccxmN5ADKmzHW
        y/GigD6PAk2lWkRmRlGnsu/WApNBcazXHdJtuIKMPMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fH8UWW
        whRdsoVeWKQCjiZSlkqy1TytBtq7tiuhzF1E0=; b=dRE94y0G6IXse8R6r1UJ6F
        Ptl9/6mKzHxMKD7eithJKt1cM8PJPZ8nGoCTHjAkPQFLKp501rtXy5XJULJhzz41
        +VwtHodmZB4KKCUgCx8l3+yhB4BP7+qCQdYb2xRVkcODSl3RjnzHNDGJDOmBGA/q
        uCEoqjmqvvHyI5qXJBDJE0J777mYOTbYxlyOJUYGEeUYqrF96H5R9C/e86VMNT4b
        mffZw1Vuor7AO+eazYy/TUplPCrX/Th10UAAE2drNZ9Z1JDfv4Swv8iD3zs8hMZs
        iW2f7ypBtYSuz449ljNj3kgXVBk2XdG9fXpOMRDLbCOUPVO2A9o7rQi5/GuGDYXw
        ==
X-ME-Sender: <xms:7l6XYUbqsD4Z5sR6ZvwP7aDvxfF0gP7YApi2jViM2VCy6nUnqOkitQ>
    <xme:7l6XYfa_TJjWdQaN5ImwKdRXjms47agMZnKaq5m3glzS8BqRQumFMqyjBORmlGiBT
    sDfgXsONENmlxdgsT8>
X-ME-Received: <xmr:7l6XYe8XTQ_-W6SnuTXF8pISLujiiASsM_45zDDZEIjTtwkYkKru6a2RBFVM8GjjUNph9Yc3J6ubU1KN32Ek4JpbQu7lyA-U5UhQ8a6KncQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7l6XYepWi16o_rbNCat4sB3_dd0O6wwK2atE0sTmovf1Nh0evFDaUQ>
    <xmx:7l6XYfoBZrmtKp5rH5DlMnHevzIqJulbgWiIUQG2MEd-_ouJByv74Q>
    <xmx:7l6XYcQPlLWmUhKGe41dE0_suPl6oX1cTfzQMFBD6Qg_XshRqzZL4Q>
    <xmx:7l6XYYSbHSYZmzSs6-LgvS1Ld1QujsLTCjgZau4vQ8jvjNUR_F7DIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 03:23:10 -0500 (EST)
Date:   Fri, 19 Nov 2021 09:23:08 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] media: cedrus: Add support for the D1 variant
Message-ID: <20211119082308.2tc6mpnmr36m4nwq@gilmour>
References: <20211119031519.23430-1-samuel@sholland.org>
 <20211119031519.23430-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4cfaoqdsthlokqps"
Content-Disposition: inline
In-Reply-To: <20211119031519.23430-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--4cfaoqdsthlokqps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 09:15:18PM -0600, Samuel Holland wrote:
> D1 has a unique variant of the video engine, which appears to drop the
> VP8 support found on most earlier variants.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--4cfaoqdsthlokqps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZde7AAKCRDj7w1vZxhR
xfUkAP9/kmkUHrB8UAkA47UZrdJORmB5i0s7uRA6P/5Tgw+U8wEA6doJM16BjxUG
v+XmYJppXhIEBWIOmsT3spUul0IP9gc=
=IyNX
-----END PGP SIGNATURE-----

--4cfaoqdsthlokqps--
