Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDD01A1E25
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 11:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgDHJlV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 05:41:21 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41221 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726687AbgDHJlV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Apr 2020 05:41:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 6488C828;
        Wed,  8 Apr 2020 05:41:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 08 Apr 2020 05:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=N6JZm45kpxMIuSYKJzXOxy5rA2O
        Mlv07ymdp36yM5Es=; b=lecMA//UQ3o36d2jqwptLM9DbXnYiv3+BeefvmnaOj7
        /kY5287cYPdtH030+1jP0pTBVLW4o0oN4aqDlDUvfvV3QlLEJSMCEaTng9HuzRno
        OxgLe69BsgrO6Mg5r2NLfVVC7Vb6PLF261fqIcLtyGRQcuhnz2S3YFNUbLaqXjO0
        ozBWsOZ74vRWzgKmlMmPTE4V4w87MdU83Oe0iSXElsza0XgjG1NObwBuXjjtjKJF
        67vPLaEPbv9jLM/B2AnAmGPmJo48VK5ArPgg4hAJg2fhiDKQdzYG30pK//Dvkp5u
        Kw/F91KSwRcv27zawq0bawbv3W6PiXaZhgukr+ZbhTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=N6JZm4
        5kpxMIuSYKJzXOxy5rA2OMlv07ymdp36yM5Es=; b=KhYZn+cLplG+ZzJO4uM3WG
        NGtUzlqwMVmOGJzdZErbE0fG3fha3cEovw+UkA2yhEcrr+1wvRL7nvw1NZcWWCvG
        jPaqytcZESplqqw3FJ0Z49GhjuAgz9BIcDCL+5LdN9lzcI6wOB79STLEqSV+oRjj
        XXpt3QhOmYXKtJTaBm21PXoQhH0+mMxmfXkvdB6wvzG5Gw1nRGQpLvpiz/6uZAgY
        itnHmG+ZvJt5XvrncYznRzD0W68mkuPKIuiRQqkDEJhX+xuN+P557Dz1w2+wn3rw
        wxbnLlsieiAQf6TXJzN9aIuCchjx5Zy5xstS93cZX1IN/1EHixxwdtPVhNhuafhA
        ==
X-ME-Sender: <xms:O5yNXj8LnITlyadBgK_0uoQzdAcw0sjXTY-DMTSZJPCkTw1ec4utlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejgddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:O5yNXiKQKBqeYUMznPmkhqaRF3j-AqVmNp8ygIvioCUkTB6gekWyqQ>
    <xmx:O5yNXuvLUP1OZNkhkW2VU8npKRfG2Xr6F2Gj-Zb3GpL5mgAcv1FwIA>
    <xmx:O5yNXunlJrAqYf1n60qlTu1lKlSCdAIpGW7EsYIGFovjL4f190u8VA>
    <xmx:P5yNXnwoKkq2E3y4bNGIGy49iLmnYpR3CUkrWwfYewePt2i371o9ow>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id CE97F3280065;
        Wed,  8 Apr 2020 05:41:14 -0400 (EDT)
Date:   Wed, 8 Apr 2020 11:41:12 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH] media: cedrus: Implement runtime PM
Message-ID: <20200408094112.uzbsl4yhtjs5vhou@gilmour.lan>
References: <20200408010232.48432-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ms6v2x4wwxcyhvkq"
Content-Disposition: inline
In-Reply-To: <20200408010232.48432-1-samuel@sholland.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ms6v2x4wwxcyhvkq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 07, 2020 at 08:02:32PM -0500, Samuel Holland wrote:
> This allows the VE clocks and PLL_VE to be disabled most of the time.
>
> Since the device is stateless, each frame gets a separate runtime PM
> reference. Enable autosuspend so the PM callbacks are not run before and
> after every frame.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--ms6v2x4wwxcyhvkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXo2cOAAKCRDj7w1vZxhR
xb5vAP4xQRPypcxDFGdSp7ZspsH/B1RLDEoyE7lvECbEQlmvpQD+Ij62STTM7hna
bWVw1hXRzBto9JUYuynQjMbCNZ9Q8A4=
=+1/C
-----END PGP SIGNATURE-----

--ms6v2x4wwxcyhvkq--
