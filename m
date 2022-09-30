Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD09B5F140D
	for <lists+linux-media@lfdr.de>; Fri, 30 Sep 2022 22:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbiI3Uq5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Sep 2022 16:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiI3Uqz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Sep 2022 16:46:55 -0400
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548161F8996
        for <linux-media@vger.kernel.org>; Fri, 30 Sep 2022 13:46:49 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 3B3B72B06A2C;
        Fri, 30 Sep 2022 16:46:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 30 Sep 2022 16:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1664570804; x=1664578004; bh=W2pbvLYGON
        FUosjwyJgo8hP1rhxN3jwEeV/fCKjZjLw=; b=Faq7wL7qoxBGjQb622CJmqkfYw
        UJcoIL/a48M14uhz3SyyxslkHjid0UV3Y71ORAsFh4FqdidsgnMQR/X5gJFL8Rym
        YpAFb6qnr+I0kAkDCB0XmJOvYWsukuvxSPyGIY0XK9mtMaiakqAa0nt9HuM/exte
        IZKhjKjH5EK+kx2G2NRZUH07naFoiznYSZLuji7JBc0GGOLDe+eNbBjgy54Vx1II
        auM4oPQHPrFeZgzdnvSKVcCyTF3mUv9LH0CRuAhIizGmPR840O1vzAP+ivjuPqhI
        FDB6wQG2E3jdcyG+Wm4cDUp3RUby8D/F2ASKMzNpZ1cu32A6ShMdXz2OCRNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1664570804; x=1664578004; bh=W2pbvLYGONFUosjwyJgo8hP1rhxN
        3jwEeV/fCKjZjLw=; b=b7PF89xwZR5mv1Ym0EvKkMHMCv7KxrAFBYG85ZAAlARk
        dNVUGD20pMQdfGGpedeD+CK4iMnPDoljv1SvmeJhbPX4ByzOpT5vqmE0ariiCpVS
        TONOcykZaQM6G3lHZ8MyyhLAWWSxcE4dQkW+p/AUZ2TXxpI9fueCwd0cVF2ZunLS
        w+kS/4YJkNwg4CJjAW00KWFNunScZwO/FW6eBOdhgjZuqJlx8gBre95C31GEeFXM
        QZYrKlf9MtJHO0pApJRVtX0gkKIMM+LBwNbLvIlKK7JlxrqpmaQBhX0YNIiIeHxC
        mSw7BENE6k7BJ/Ia91UYxhSh2CadGCrvK9y4a9yQYw==
X-ME-Sender: <xms:s1U3Y6ktHZKqKla90-jx1Sws5dGgzeMwWhK9OgE9tJWsHWKhO4c4DQ>
    <xme:s1U3Yx1jNFvvJ7-F7lXd8xsSFht_KNl0Am-0Z_XoshCm0wHsxU9DgCXVOaJUZ3bl4
    omYDc-f15bEFRGt7LI>
X-ME-Received: <xmr:s1U3Y4qZdmIWsDar55HkyMB4rpub2d6jtV5wYVXEL3SeSg5X7__vfrK0Lg_N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
    fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:s1U3Y-nHjPbqROMBJp_tqpE01hpX8oGUY5aMtCfqDLwiWWyeUDsnsg>
    <xmx:s1U3Y404nApUIt873zjn48AdJnNzfCCs9QX3xmrnZ7oJHOLBe8q6-Q>
    <xmx:s1U3Y1teNchJIisrc1oBL2FXIffOqojj_57JPwpPLpBMIhWo1z4bog>
    <xmx:tFU3Y_BvNGNyOcqDsjtIkzHiB6anBfbOO55uLTh0iIPWuekl9qFVCPeL-jw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Sep 2022 16:46:43 -0400 (EDT)
Date:   Fri, 30 Sep 2022 22:46:42 +0200
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
Message-ID: <20220930204642.o6l7qtgg4mhvlthe@houat>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
 <20220907115351.d774wruu22fdohwl@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="35konu2kuabjboxl"
Content-Disposition: inline
In-Reply-To: <20220907115351.d774wruu22fdohwl@houat>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--35konu2kuabjboxl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 07, 2022 at 01:53:51PM +0200, Maxime Ripard wrote:
> On Mon, Sep 05, 2022 at 05:44:26PM +0300, Laurent Pinchart wrote:
> > On Mon, Sep 05, 2022 at 01:41:11PM +0000, Sakari Ailus wrote:
> > > On Tue, Aug 23, 2022 at 12:53:44PM +0200, Hans Verkuil wrote:
> > > > 16:45-18:00 Anything else?
> > >=20
> > > I think it'd be great to have a GPG key signing party at the end of t=
he
> > > meeting.
> >=20
> > It's a good idea. Could everybody please send their GPG key fingerprint
> > in an e-mail reply to prepare for that ? It can easily be retrieved with
> > 'gpg -K' (make sure to pick the right key if you have multiple of them).
> > I'll start:
> >=20
> > sec   rsa4096/0xF045C2B96991256E 2014-10-09 [C]
> >       94231B980100EC619AC10E10F045C2B96991256E
> > uid                   [ultimate] Laurent Pinchart <laurent.pinchart@ide=
asonboard.com>
> >=20
> > If you're generating a key for the occasion, create a primary key with
> > the Certify (C) capability only, and create separate sub-keys for
> > Signature (S) and Encryption (E). There's little reason these days to
> > use less than 4096 bits for the primary key if you opt for RSA. The
> > subkeys should have an expiration date.
> >=20
> > The primary key can then be moved to safe storage, you will only need
> > the subkeys for daily usage.  The primary key will be used only to
> > create new subkeys and to sign other people's keys.
>=20
> sec#  ed25519 2018-09-15 [C] [expires: 2023-03-17]
>       BE5675C37E818C8B5764241C254BCFC56BF6CE8D
> uid           [ultimate] Maxime Ripard <maxime.ripard@anandra.org>
> uid           [ultimate] Maxime Ripard <mripard@kernel.org>
> uid           [ultimate] Maxime Ripard (Work Address) <maxime@cerno.tech>

I'm not entirely sure what happened, but it looks like all the
signatures I received so far (Laurent, Jernej, Ricardo, Kieran, Jacopo
and Chen-Yu) have been missing that UID

Could you make sure that it's signed?

Thanks!
Maxime

--35konu2kuabjboxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYzdVsgAKCRDj7w1vZxhR
xbIWAP9EMhRQyfeOikL10URbbo+gLQIWTwbc6hoHVQU/bcTfJAEAuPjpCwYIv7Ro
P6u9Wn4jktIWlCmeznps/5MWGtfVXwg=
=Nqpa
-----END PGP SIGNATURE-----

--35konu2kuabjboxl--
