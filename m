Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101802B1EC5
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 16:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgKMPcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 10:32:20 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35191 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726734AbgKMPcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 10:32:16 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 988185C013C;
        Fri, 13 Nov 2020 10:32:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 13 Nov 2020 10:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:date:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=avQFE5LsyEoJ56hYbJM1xHsGDfY
        c05YUSV/YRbdoAFc=; b=iPDt5rszeBUmfzCk11CPYDgX65ES0epZtxaW+Bh1m44
        Z1iVjhbvJexw4aQeYBDGWZ9/fUjGhpG2Bfj1evOgrrGVgMr6+WOgoKMOPs+/wDxO
        j6tCsQ633Fzkj/BhX2v+2LhyZPWW6c9PWMqYhqh7zHRsR7wv5gCTnsERN9Vf6xqh
        VXzV/i2DyFRTFrVSUYQ6narX7++gSJ+dLyL3aLGbteqxfwUJXydPiuM+c0DVbBbD
        XhLU7ZfinWRGZhgkhdhkS1617sLHX+q+OZzYuSReSOr5yi53HBMHGHBLo+NOSH7U
        L9VZbHSW7xuUUbzYYNvVQDJo7PwzVh9SBeV+fScOnlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=avQFE5
        LsyEoJ56hYbJM1xHsGDfYc05YUSV/YRbdoAFc=; b=GTpFvQGM5kdBdC6G74Ux6E
        MCJ7YJedVUbIHpR6xXiXpqnJwTyHzVXYpcbB7QfHwS/4iGA3qZ6gXIMzc+X4Y20C
        ezSGP4OgjIr51sgcP6rNnFjLK/KvY7bPETbcnMKr74B9pwTZYiglHw9BPkMxNfSv
        Txsh4ByLgAgkW+9Q1nUrdAHm1/E+X/ad1eQ+COFxDK7CYEMmw/yzVgySL772NxXR
        BaHIlcpT2kpaNqxvntCZRJjU1JHrS8Bedw2gkR9a4+IotUpTibLIKub0B4CTBxHa
        H0+Awawju1m12SZJ2FQ0+JUJQ5/ZBMKIyJAS0lWUTItLLqyfIN1BNN5hNdP4i5wA
        ==
X-ME-Sender: <xms:_qauX2sA-s59UwZG96S3_K4cfo7OtMZ7GRzRhqsKEAfPNyPTmo-L2Q>
    <xme:_qauX7drbDHoQ_GdOH_wVclpHOJXZqqNzPgp7tiEL6LQ_oLCi18v9zhzA4h8W6A6t
    zF1rz0reLiBf3dxsTE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvhedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpehmrgigihhm
    vgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhephffffffgteejgeeiteelue
    dvkeffudekjeejheevleekgffggfekkedvhfeigefgnecukfhppeeltddrkeelrdeikedr
    jeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_qauXxyfBGrKj0HJLb_bmhOSo8XPmd9XvFzSjrBK2IwMBdriGba2wg>
    <xmx:_qauXxNTnoUDIEvajyPN3wp1xBA7ck5SirjaYM2T4thw7qMQjlwPHQ>
    <xmx:_qauX2811G6NvmKADn7jBbh1BOhHpQR4ujvgSZdF7X8BTBzCh7RSAg>
    <xmx:_6auX8mNF3laGpbRfw-tqg5kx6FCGmSjHlSCGU8lVH_VMrN17TeSJA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 74CFC3064AB0;
        Fri, 13 Nov 2020 10:32:14 -0500 (EST)
From:   maxime@cerno.tech
Date:   Tue, 10 Nov 2020 13:11:22 +0100
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] media: sunxi-cir: allow timeout to be set at runtime
Message-ID: <20201110121122.uulmlemsc562n4ot@gilmour.lan>
65;6201;1cFrom: Maxime Ripard <maxime@cerno.tech>
References: <20201110091557.25680-1-sean@mess.org>
 <20201110091557.25680-2-sean@mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="65xsjzn3pufedwsz"
Content-Disposition: inline
In-Reply-To: <20201110091557.25680-2-sean@mess.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--65xsjzn3pufedwsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 09:15:57AM +0000, Sean Young wrote:
> This allows the timeout to be set with the LIRC_SET_REC_TIMEOUT ioctl.
>=20
> The timeout was hardcoded at just over 20ms, but returned 120ms when
> queried with the LIRC_GET_REC_TIMEOUT ioctl.
>=20
> This also ensures the idle threshold is set correctly with a base clock
> other than 8000000Mhz.

That's some pretty hardcore overclocking :)

I guess you meant 8MHz?

Other than that, for both patches

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--65xsjzn3pufedwsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6qDagAKCRDj7w1vZxhR
xSH4AQDMyZp9jGUKiIoAhlrI4ZZHsByN1KabEAU4xkQeFyWrlAD/QAWomEJFIFgB
y2ToZhVrWUNbFWEHkN35mGBQo0nSngw=
=BThl
-----END PGP SIGNATURE-----

--65xsjzn3pufedwsz--
