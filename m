Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C92905B2265
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 17:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiIHPeq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 11:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiIHPeo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 11:34:44 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4530BE0D2
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 08:34:37 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 1168E3200944;
        Thu,  8 Sep 2022 11:34:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 08 Sep 2022 11:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1662651274; x=1662737674; bh=LfoOh+XZat
        jvxxDmSeIlkLbJeZ5jG3uV6lQsyXX1mm0=; b=CrewmuEpqp8awf6Hk/1THXVFvE
        J7+UwW3M0CaIGh8HDDuqOLi1mq6nWi96evqjsszWv4xOx8hDgjPlybDFKuXEdnEu
        K3+4VjreJbFJ+NhpXD6VhYbOg0XddThk3McWZm9T1JX7DSZIxzl9y+XfnHagnF6I
        PSGttYwHFzBILpn7aL9wq92bjhIrCsZVevek9wxA1OfJhcXfWg2x5DWRttPfUOcz
        59PIPiFHQGSQEEMs2oIWHVTfSuc5B90WH831qeTE4CCZL3ujnayydMEV5QFYX4qT
        OXPh85nZy0vT8wzd4IRxmSV0og05kvCqx51r8vSttWgy5fRJ5ZHnJR+Ft7Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662651274; x=1662737674; bh=LfoOh+XZatjvxxDmSeIlkLbJeZ5j
        G3uV6lQsyXX1mm0=; b=LcBJlYP4i9uIdlzb79fJ0OT9U5CTnddhjIe3DS7uuJ7d
        qkr0cQ2OcZAhViYtTM4I2SJyemIrA2LtPGdUxKPrz6LPmaVd4NnnrRxQ2B3BVqS8
        67+J7vA34QImEtdmlz6uQ/2G7qQXpHshYij0eXdtYJ2CwydBMFlwGd6Jufe95frd
        UGglpyMIXLr5qvF3U8MEBSmDQ0QatgxXVtQ4RXf3xtPPAq98HuHZzuYFcai+SePC
        kl7g5v0E0I19EmdhA4NSGMhTz++AqFtGjN4JU61kTVdi5pJcDQJ+kbeLENDkW1Gc
        4Wpj0OrgVbvkF7xfRIttpTuRba3qQHokEsM5k08KyA==
X-ME-Sender: <xms:iAsaY7OOYJmWuXrJD1OGZuX-KmUzO4UWaaYuKZBbQBzsbBXxJTNppw>
    <xme:iAsaY1-wSx0bMgDXWJfSmi0JEeT1S3Rd6odrda64L93E-P553haJxqyp1nHlC4Zzm
    h-kXpZ0Ls-bE83LPTs>
X-ME-Received: <xmr:iAsaY6TKo2oyhA9sHtORWW3ECiTU9tGOeFqkK-KsMJlSbtQJryQt9Wnglw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtfedgfeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iQsaY_sL4NvFF5vtvIjpxOaDVxTS-1gmWvGwqJw857_g22TFP4qYTg>
    <xmx:iQsaYzdg0Np1OErNuN1iTIIXdswxSVUkbV1MmZoUkKQE16sJZchP1A>
    <xmx:iQsaY739xEafV9MmFHEjC02bcclbzl9L9Ml_10JHTMN3ANS3P4LBeg>
    <xmx:igsaY2UDpG3AICKLku7GZT5t2jZOrq-g34iW_cDwiX4NUx0JH9MUEg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Sep 2022 11:34:32 -0400 (EDT)
Date:   Thu, 8 Sep 2022 17:34:30 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Hidenori Kobayashi <hidenorik@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Michael Olbrich <m.olbrich@pengutronix.de>,
        Daniel Scally <djrscally@gmail.com>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin MUGNIER <benjamin.mugnier@foss.st.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [Media Summit] ChromeOS Kernel CAM
Message-ID: <20220908153430.fctitaofbj6hqot3@houat>
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
 <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat>
 <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
 <20220908145905.avq73a3hmt266o4a@houat>
 <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cp3lrzserzq7hlxb"
Content-Disposition: inline
In-Reply-To: <YxoHWNusFEuVdOha@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--cp3lrzserzq7hlxb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 06:16:40PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 08, 2022 at 04:59:05PM +0200, Maxime Ripard wrote:
> > On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrote:
> > > On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > > > Hi Ricardo,
> > > >=20
> > > > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > > > > - Still on slide 16, V4L2 as an API is usable without disclosin=
g vendor
> > > > > >   IP. What is not possible is upstreaming a driver. I don't see=
 this as
> > > > > >   significantly different between V4L2 and the new API proposal=
=2E I
> > > > > >   expect this to be discussed on Monday.
> > > > >=20
> > > > > I am only considering upstream drivers. There is not much to disc=
uss
> > > > > for downstream or closed drivers :)
> > > >=20
> > > > Are we really discussing upstream *drivers*? If anything, it looks =
like
> > > > the Kcam proposal moves most of the drivers out of upstream.
> > >=20
> > > Given that the API proposal sets at a significant lower level than V4=
L2
> > > in the stack, the concept of "userspace driver" (I meant it in the se=
nse
> > > of GPU support in mesa) plays a bigger role. It would be good to clar=
ify
> > > what is meant by "driver" and maybe use the term "kernel driver" when
> > > only the kernel part is covered, to avoid misunderstandings.
> >=20
> > I think there's a bit of a misunderstanding about what exactly is in a
> > DRM driver, and what is in Mesa.
> >=20
> > Mesa doesn't program the hardware at all, it's merely a glorified
> > compiler. It's not more of a driver than GCC is an OS. Most importantly
> > for our discussion, Mesa doesn't perform any kind of register access (or
> > register access request), only the (kernel) driver does that.
>=20
> Mesa compiles shaders, but also more generally produces command streams
> that are passed as blobs to the DRM driver, which then forwards them to
> the device with as little processing and validation as possible (when
> the device is designed with multi-clients in mind, that processing and
> validation can be reduced a lot).

That's true, but at no point in time is the CPU ever touches that
command stream blob in the case of DRM...

> Recent ISPs have a similar architecture, with a set of registers used
> to communicate with the ISP firmware, and then most of the hardware
> registers for the actual image processing blocks being programmed
> based from the command stream. "Command stream" may not be a very good
> term for ISPs as it's not really a stream of commands, but
> conceptually, we're dealing with a blob that is computed by userspace.

=2E.. while in Kcam, the CPU knows and will interpret that command stream.
Maybe not in all cases, but it's still a significant difference.

If we had to draw a parallel with something else in the kernel, it looks
way more like eBPF or the discussion we had on where to parse the
bitstreams for stateless codecs.

The first one has been severely constrained to avoid the issues we've
raised, and we all know how the second one went.

Maxime

--cp3lrzserzq7hlxb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxoLhgAKCRDj7w1vZxhR
xVGDAP9Bw1banrjq3ui/2nD+yd3nmma3pJCXOi/XyihRjzI2egEAnLeRfnK6hSnw
aqE+0C6fKPMPT/HEUr01EBJ73zpHdgA=
=CwHK
-----END PGP SIGNATURE-----

--cp3lrzserzq7hlxb--
