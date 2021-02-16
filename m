Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9199031C70D
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 08:57:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhBPH5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 02:57:04 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:50869 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229796AbhBPH5C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 02:57:02 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5FB7D580248;
        Tue, 16 Feb 2021 02:55:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 16 Feb 2021 02:55:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=OgE+B+oYIxnbEc/wQ/LZmClawQt
        IgqJ46vVdtsUhNXI=; b=fMiVYrjcYk9CH/Awu1GqkqmCLGes4PLTrvCh4EuQiCK
        KG1NPuzfSttgEOSCHRzp6SERcMUaQ2cUT90wLZYHOJ+YV8o+lr6q+igOhtJ2hzoO
        eskXTXPHpZNKZLk5E7SBuWd+o5dTgL38/eigGBu06ijeEwjzBuZu609Oes88mJYr
        RS3ExWgmbman4kQgJc+7t6TlXHS/ZUTdHiCGoZqVXxdV4PYErzeiiUCPc0VOlAvq
        q5Zf1/Z6NhEUI+K6O15514n4/pWXMxRBozR3x2QvSaNDfOfuG77OjXtgKsOiNYaE
        PhNJQT0T+7cQxgs8N4M8uKoEAlgzY0k/EknhAB4DNAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OgE+B+
        oYIxnbEc/wQ/LZmClawQtIgqJ46vVdtsUhNXI=; b=nfX/AACZEa5FjTMPGztF3S
        wvaC+7RARDsQQm0PmaGGwZY5Cpkk5kcDlWiOnw7rjwAxaWaPNHp3qCgzEIbnT3Nc
        PblA1kb+h0kml4a9tyYbIsoFQGaQ7FQcuXCdQd2XYHHz9Wh+0hYP8a5LQxnFkyc4
        y/79wV6uJy1GtkLPjrEoBGHywd0D1vjIvgPZ4p5EvqIC/KkqxKm5p81AEBpRLHwk
        PNWlY4DuyHIKXydIk5jeeKOJ4cbYne3yk/cRbZc8Et6H4jfE0EGoTzMJJWT6ZKke
        B+25B7HCmlYCrcIBOSbMZMtYt1IRcFUudlNgv+3kCT8zzkeP0H3aoVJ7A837C7fg
        ==
X-ME-Sender: <xms:iHorYBVBGtp274OIDmFKHo3n07rbyIYuL4W3ZIzNH6fYM3oHSzFLSg>
    <xme:iHorYBmw-PAUi-eQ6BfEQ2rEyTLVbY9ASvRB_DA_mWd1GGev41XeaMfnjdwY4EXf6
    dKF9EHif3MnLyJnlcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieelgdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iHorYNbIhQQCs_6oNXVb_ggg_NV3zuhuhHUUVA_fiLHgc74a4ZaLlg>
    <xmx:iHorYEUzkh1icnNBCqfzwaBzEYO41aX4FJqMATPCFaiBgEZpaqw-Yg>
    <xmx:iHorYLmWL0e_Lq68nbrk50nYdaDFL-d8i6aCBQiZ182XDbn_AoaIUQ>
    <xmx:i3orYFkRC-d10TG9p5HJM4A8z2vc55OEkSxFiQ7JjzhiBCzHw3mZlQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 38DEF24005C;
        Tue, 16 Feb 2021 02:55:51 -0500 (EST)
Date:   Tue, 16 Feb 2021 08:55:30 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        dave.stevenson@raspberrypi.com, maz@kernel.org, eric@anholt.net,
        tzimmermann@suse.de, linux-rpi-kernel@lists.infradead.org,
        hverkuil-cisco@xs4all.nl, nsaenzjulienne@suse.de,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "ARM: dts: bcm2711: Add the BSC interrupt
 controller"
Message-ID: <20210216075530.knleci6sv4m667vv@gilmour>
References: <20210212191104.2365912-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6bxcug5x2bcw2xf6"
Content-Disposition: inline
In-Reply-To: <20210212191104.2365912-1-f.fainelli@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--6bxcug5x2bcw2xf6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 11:11:04AM -0800, Florian Fainelli wrote:
> As Dave reported:
>=20
> This seems to have unintended side effects.  GIC interrupt 117 is shared
> between the standard I2C controllers (i2c-bcm2835) and the l2-intc block
> handling the HDMI I2C interrupts.
>=20
> There is not a great way to share an interrupt between an interrupt
> controller using the chained IRQ handler which is an interrupt flow and
> another driver like i2c-bcm2835 which uses an interrupt handler
> (although it specifies IRQF_SHARED).
>=20
> Simply revert this change for now which will mean that HDMI I2C will be
> polled, like it was before.
>=20
> Reported-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--6bxcug5x2bcw2xf6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYCt6cgAKCRDj7w1vZxhR
xcslAP9KUslpDXYO8/ygfAO7HvtHmi3uBgecVib764++4rZFsgD/SdzNpTEgfZSr
dO28YRr8RYfy/OT6Y3dnkNhI0P1T9QU=
=8p02
-----END PGP SIGNATURE-----

--6bxcug5x2bcw2xf6--
