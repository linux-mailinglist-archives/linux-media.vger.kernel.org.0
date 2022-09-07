Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0735B036F
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 13:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiIGLyF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 07:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiIGLyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 07:54:03 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1B984EC1
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 04:53:56 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id A62803200935;
        Wed,  7 Sep 2022 07:53:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 07 Sep 2022 07:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1662551634; x=1662638034; bh=a3QCuZab5y
        lDfFn9Okzvq1FaAYSQ4ulrAtSzx6kUlvs=; b=NpgUrpuPzjU3qn4WTrLOePueOR
        h1c0A2FWZbhlMtSfSIw67+aKJT9Bl589XmyTygwFXtMpGTuvst/4DJIJWLyxcWNE
        tbCVkheaAe/OWG2a4SqUU+ygkZCc52yE5r/1MHuF3jPjAjw+FOrqbcdIXatCdT0I
        uQ+94pD9nkDbZeJyA99jnAv4NY+lAjN9E3Qkc0AbKg14R+202RXzDH7mpx5m2CmB
        2i4hHhsFn3OP9pOvoP6iqYCWFjxd6UqZH948ggtBYZAR+hBCjnRGTqGz1rYC+2M5
        7LaxM5W2MiG/kLxkphuOuY2TFTwX7dyOy1b6CUuNxLX/FvOPorDy44DOch0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662551634; x=1662638034; bh=a3QCuZab5ylDfFn9Okzvq1FaAYSQ
        4ulrAtSzx6kUlvs=; b=KX3/dnDT6uw5sta+A5MKTphc8V/CHL+OK8eQSUkudE4c
        PImaHIWfHahGHkiOBctdXQaU+Mrhuw+VEEA0HjYKuaI+RMF6wJL4mGvDJx3L4Fnh
        tYh0rY/Xmr9xut+Crmh2UhsCt7+sP5/9SJgf793BjOpoGar5Mjcz9g5LL1gVHPLR
        prBrpYniZ6JVMWv7v8yEeqGAk/u92u6+XjKgPdieFsHdiSfqybwgh8UWZNWJc+Kb
        ku36G49JZKmE0Zp+sn0ojhfnoGPw48lUjc7LeQIUixjjruZuGwMNZ50sVb+ojrKZ
        pXddmyroLc/W5NzDd+fz+KpdWPZcr6Uu7/tOjRy6oQ==
X-ME-Sender: <xms:UYYYY1CJY1W1py7reLtO-xWyAoIlrBeNlKGe0pc0VK9yL_OIIwG_Xg>
    <xme:UYYYYzhzdQY_h7SeSMJ8ThLBmHpM2J0zsWPCLEDLJxTXqTqyHGIf9oK2sJymu1G6L
    jBT00K4YRZvtNhTdUU>
X-ME-Received: <xmr:UYYYYwm3hgQGBDOWn5LkQz9wfrItlnrwau8MXYse-IXXQ2trjKXSdswj2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UYYYY_xw_cQF0j0ThN-ctS4GiguatcJmyh9Gmo8LIeR8z1TGo8Utaw>
    <xmx:UYYYY6RH_39NbpeRB74ylIoMSewbqwK7yInc5o7iLw0sBJWratmoJQ>
    <xmx:UYYYYyZ1JZ50JRUUFP8uJqgy95DFoU_PEIluG91eZSolnuxA0eA0Vw>
    <xmx:UoYYY0DrtamMUbCd9OtmFGaL6FdXwGLWegEX47h1oZ56_AykMg6qQQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 07:53:53 -0400 (EDT)
Date:   Wed, 7 Sep 2022 13:53:51 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [ANN] Media Summit at ELCE Dublin, September 12: Draft Agenda V2
Message-ID: <20220907115351.d774wruu22fdohwl@houat>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="idr2xlth4usjz2zr"
Content-Disposition: inline
In-Reply-To: <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--idr2xlth4usjz2zr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 05, 2022 at 05:44:26PM +0300, Laurent Pinchart wrote:
> On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > 16:45-18:00 Anything else?
> >=20
> > I think it'd be great to have a GPG key signing party at the end of the
> > meeting.
>=20
> It's a good idea. Could everybody please send their GPG key fingerprint
> in an e-mail reply to prepare for that ? It can easily be retrieved with
> 'gpg -K' (make sure to pick the right key if you have multiple of them).
> I'll start:
>=20
> sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
>       94231B980100EC619AC10E10F045C2B96991256E
> uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ideas=
onboard.com>
>=20
> If you're generating a key for the occasion, create a primary key with
> the Certify (C) capability only, and create separate sub-keys for
> Signature (S) and Encryption (E). There's little reason these days to
> use less than 4096 bits for the primary key if you opt for RSA. The
> subkeys should have an expiration date.
>=20
> The primary key can then be moved to safe storage, you will only need
> the subkeys for daily usage.  The primary key will be used only to
> create new subkeys and to sign other people's keys.

sec#  ed25519 2018-09-15 [C] [expires: 2023-03-17]
      BE5675C37E818C8B5764241C254BCFC56BF6CE8D
uid           [ultimate] Maxime Ripard <maxime.ripard@anandra.org>
uid           [ultimate] Maxime Ripard <mripard@kernel.org>
uid           [ultimate] Maxime Ripard (Work Address) <maxime@cerno.tech>
ssb>  cv25519 2018-09-15 [E] [expires: 2023-03-17]
ssb>  ed25519 2018-09-15 [S] [expires: 2023-03-17]
ssb>  ed25519 2018-09-15 [A] [expires: 2023-03-17]

Thanks!
Maxime

--idr2xlth4usjz2zr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxiGTwAKCRDj7w1vZxhR
xa2KAP97I1ttHL6kdazM3w81Lx/Q/1VCMEjDxFOEvpVTWIYKRQEAiYclgs85LR6g
peMX3+CxnTktj4NgGTx/bdxBvsC8oQQ=
=c728
-----END PGP SIGNATURE-----

--idr2xlth4usjz2zr--
