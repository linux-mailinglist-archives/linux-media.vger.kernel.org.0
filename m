Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146E35B1662
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 10:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiIHIJu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 04:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiIHIJO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 04:09:14 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26B9D6B8E
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 01:08:53 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 7C4B33200990;
        Thu,  8 Sep 2022 04:08:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Sep 2022 04:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1662624531; x=1662710931; bh=0FicB1lWf/
        uXmDHB8fUqbEmFaBZaGQ1QIJxx0ouGSyM=; b=Ls53Z23VqCrX3rx7CA5Ogj+F5+
        TguVTOSG4ZiR0LnTKrCpiWWm0kx5C6c2m9ertp4g4qxdeBFWzE+ovEzt94XQ6GxO
        RNyPfVs4Rys7h51sUxtBd5H+LtMlMQHOK1SIjrAw3rs1WLgqIo/eNOsOjgD2Wzut
        Y/h1/2vFb2tvi7mfffMhGNfFVSS78qWxGwrU81gwPYZw47wBs7iaCFwgHK9ZROZ2
        aj4JNUfX6TT/BBEC3GyJe+WIL4T1zrOW7FoC3U6l9YddyYJdCHQ2tp0nGfyIAbYm
        AO0t2w/xYqqFbZe+pjH65rqBE5Z2B/orMa8uJQfig/aa58MaLebeb6EicZVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662624531; x=1662710931; bh=0FicB1lWf/uXmDHB8fUqbEmFaBZa
        GQ1QIJxx0ouGSyM=; b=ZNf00sQ/a0RiHPYtUUp2mOoxfDsCle/IgbgW/y3iYrRJ
        hg5WSiKCdy3Vg1CppUkSsSGLXWRVuqiwDqipTESUX+HBQCTrr7QLk+K4/0Ykt83u
        RFpLM2ol2ke0jLv7uEJpzlOvD3XRXjtr48u22OUwe7Wv20ufpYX7ZjEpZf5aORLW
        FhN+xRcKtKfkaTRmOfIgle02lD9bRK3QeMwMwwLLHCOUK/+VqVEX7DAfa1a7L2Jq
        yfDvgAl0C/FRyg29BlVUm4HvYHGNNgY6wrZewu9sHFP/e1oeaZHco6OW05xnyECt
        i/0bffDBPS/XQM7547Htl3KdIAU8zsj/mFO8+HD6Hg==
X-ME-Sender: <xms:EaMZYytRCZklenP5RvjMcBDDltL78v2gC8WhZjZVtKEMKhbPZKJcMg>
    <xme:EaMZY3dNfu1Ww_AxsAy-HM9mjWou9KE8rX1GQOrAaKrReLTKWztR7ZqARIw-ra4wR
    zhCURCAQZs2n51aJUQ>
X-ME-Received: <xmr:EaMZY9w9dCtrDnspi0ESfgTMto0jCjuywzaUqS7Io8cEFkqxVZLAoyUaDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtvddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EaMZY9NqxQNmfwYev3dIAWkBQ4jsR6cwFwXZn1x81vduK6OXHsu5Zg>
    <xmx:EaMZYy_Sz6khu9G66RNoN6vs1u3e3cSrA-FkRX2lHl32oeVObQQgvg>
    <xmx:EaMZY1VUjQp5eh1lyI3yNwqWdVf9GhiMHbkyJNAs4RheTi0McpYLVQ>
    <xmx:E6MZY13qshbHITKKwkmQU-AxFdXph4FP82IGJ1bwpLz5eulwq1xk9g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Sep 2022 04:08:49 -0400 (EDT)
Date:   Thu, 8 Sep 2022 10:08:46 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <20220908080846.wursajjtc3mbja4u@houat>
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
 <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2q2w5ewnfdga5cph"
Content-Disposition: inline
In-Reply-To: <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--2q2w5ewnfdga5cph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > - Still on slide 16, V4L2 as an API is usable without disclosing vendor
> >   IP. What is not possible is upstreaming a driver. I don't see this as
> >   significantly different between V4L2 and the new API proposal. I
> >   expect this to be discussed on Monday.
>=20
> I am only considering upstream drivers. There is not much to discuss
> for downstream or closed drivers :)

Are we really discussing upstream *drivers*? If anything, it looks like
the Kcam proposal moves most of the drivers out of upstream.

> > - Slide 31 mentions that entities can send operations internally and
> >   listen to each other events. I'd like to better understand how that
> >   will work without any abstraction in the API (as that is one of the
> >   main design decision behind this new API) when those entities are from
> >   different vendors, and handled by different drivers that are developed
> >   independently (for instance, the camera sensor and the CSI-2 receiver,
> >   or even the CSI-2 receiver and the ISP).
>=20
> It is still under work.
>=20
> Hardware, specially for standard buses,  should be resilient (not
> crash) to format mismatches. Otherwise a mal-functionling sensor or
> too much noise could crash the system (with or without kcam).
>=20
> Drivers developed together should know about the rest of the system,
> so that is not the issue here.
>=20
> For drivers developed by different vendors for a standard bus, on
> hardware that is not resilient (that was a mouthful), then we need to
> prepare a set of read-only standard registers.

I'm not even sure that read-only registers would be enough. I've
experienced first-hand DMA controllers that, when the camera has its
timings completely off, end up completely confused and write way outside
of its assigned buffer creating big chunks of corrupted memory in the
system.

And that was by writing fairly legit values to registers that were meant
for that, so we wouldn't be able to defend against it even with the
smartest whitelist.

And we were in a "good faith" situation. Giving an attacker basically
programmable access to DMA engines that might not be sitting behind an
IOMMU seems like a very dangerous idea to me.

> > - Does the bike on slide 32 illustrate the difficult discussions we've
> >   had in the past and how progress was hindered ? :-)
>=20
> This is how we do code review at Google when two developers do not
> want to work together. We take the bike to the rooftop and the two
> developers that disagree tries to push the other developer to the edge
> of the building.
>=20
> The first second, when you see your colleague falling you think that
> you have won.... then you realise that you are falling with them.

So the optimal solution would be that both stop pushing, or push the
other just as hard without bulging? That doesn't seem like a good way to
end up with a compromise ;)

Maxime

--2q2w5ewnfdga5cph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxmjDgAKCRDj7w1vZxhR
xY2ZAQD4qxIiu8JTf0a/jgyHl3hM23cyt3Bp5FgvmorvlK1hQgD/RWgmEqPjrG8N
shWh6en4HOws0asIeQkrHSsD8pgGuQ8=
=wZVa
-----END PGP SIGNATURE-----

--2q2w5ewnfdga5cph--
