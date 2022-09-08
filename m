Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C06D95B216D
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 16:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbiIHO70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 10:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232723AbiIHO7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 10:59:19 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE401223AF
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 07:59:11 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 70F90320099C;
        Thu,  8 Sep 2022 10:59:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 08 Sep 2022 10:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1662649148; x=1662735548; bh=B83rY98fIK
        xNhBkujjfkIZwGKf/oisxIRy9bUQfBWE0=; b=gGzRVKIUbGDuZ7OMi0T3v9d8F6
        6kTJlzirE3zcFfK1wXDO+Ker+XZIjYA8kGrJ/fB90fE36owWTwzpNncPBSBNro3q
        Q+OpGkZJuZyI2NgOhf48kEuqh4hO+VhepgKyTJOFZGruVoXRk/s1IcnRlAB4NT5v
        Sm6DLZ/2G1xTEqobggJelkBehh7tNJ5nr+h2ulvng7FqNph9lrR5/uTrwFLaN3Mt
        fB24RS1lwTaL0g+/o3x9Dd6Azs0mOZhcggeeE7dtyyvOsaKHnz8f2qKV+dU6CPGO
        5jGJre/kCKLcsLy/QQrsHv23SVKOKEtji/QSMG5Je6gu+pkJrQrF3vDXrehA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662649148; x=1662735548; bh=B83rY98fIKxNhBkujjfkIZwGKf/o
        isxIRy9bUQfBWE0=; b=EHoin6PZH9Bpc4iE/Tjdj36ZKtQ3yvm28f34JB1+kE/4
        EI4rCnzWYAcFC/bf1iO+BGPSJ7VEfYTKz1t5c4nD76+IJBzHW/GUic9466cBHFcH
        GOX4cIPAhrkSphS3HfGkRZJUWvrM15vLNerGNPIRblbkNbiJwlGUavu0W5ggAv/R
        cZiCZFseyNKRAqU56YSzCJ09pfkEHXxn2A+Oe3almAUfCylyo3UMjzI8K4ztNjTA
        DN7/ESkE7LdvBLKXpBLJyyh1qiL3up/wXTPObeVD/915b4VCrvrbjzZHASIYtyny
        qDAt0wGSzxrACmZwmsTi4Zdr70v/PtzJ9TE43WpQeQ==
X-ME-Sender: <xms:PAMaY4t4mSLHJUq85AhZskIHWQhg8quwpuOZjne1j3DNq0JaxE_ssw>
    <xme:PAMaY1dRv4-USrtAT8C3yO4hfnw-LrhYKBeOcc2FnSKaDGulrUeGSU-CpWsuuRKml
    q0HBwDfW3JbTOy4uzI>
X-ME-Received: <xmr:PAMaYzwkHn0Fn90iMP1XFzxBCb-vTymnomInuHvg93ubJAc1YSfFmaDS2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtfedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PAMaY7PBlg7hlIu-BljZQGpxaqql7hGRDmKZKe6yKlsxCFc5Ykx7Fg>
    <xmx:PAMaY48Pf68DMU-aqdilvE9YGLr06ShwGutjTQZ7WyfVlp_84ysPcw>
    <xmx:PAMaYzW2zrvRt2OQVmo_FBOaSSJDp59mnhYP9j8Zv1AbeB3gxB4WRQ>
    <xmx:PAMaY72LPfgPhtcYCKD7fzdX8N7RzM-rO0_OBEwE4lpY-k5llVywAQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Sep 2022 10:59:07 -0400 (EDT)
Date:   Thu, 8 Sep 2022 16:59:05 +0200
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
Message-ID: <20220908145905.avq73a3hmt266o4a@houat>
References: <CANiDSCvqJegYDqsSL5PKvyAM-+HY3ve-Vs2=3cFS4kSRKzd3_Q@mail.gmail.com>
 <Yxh3ksdjuTVIRJWk@pendragon.ideasonboard.com>
 <CANiDSCt_KXX0Cn+WH7johLrgiZLd6ZzWmC9D-u=O3L6879cWVA@mail.gmail.com>
 <20220908080846.wursajjtc3mbja4u@houat>
 <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hi4muk45oyxj6fyn"
Content-Disposition: inline
In-Reply-To: <Yxn40Y5HDzXHITwP@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--hi4muk45oyxj6fyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2022 at 05:14:41PM +0300, Laurent Pinchart wrote:
> On Thu, Sep 08, 2022 at 10:08:46AM +0200, Maxime Ripard wrote:
> > Hi Ricardo,
> >=20
> > On Thu, Sep 08, 2022 at 09:11:11AM +0200, Ricardo Ribalda wrote:
> > > > - Still on slide 16, V4L2 as an API is usable without disclosing ve=
ndor
> > > >   IP. What is not possible is upstreaming a driver. I don't see thi=
s as
> > > >   significantly different between V4L2 and the new API proposal. I
> > > >   expect this to be discussed on Monday.
> > >=20
> > > I am only considering upstream drivers. There is not much to discuss
> > > for downstream or closed drivers :)
> >=20
> > Are we really discussing upstream *drivers*? If anything, it looks like
> > the Kcam proposal moves most of the drivers out of upstream.
>=20
> Given that the API proposal sets at a significant lower level than V4L2
> in the stack, the concept of "userspace driver" (I meant it in the sense
> of GPU support in mesa) plays a bigger role. It would be good to clarify
> what is meant by "driver" and maybe use the term "kernel driver" when
> only the kernel part is covered, to avoid misunderstandings.

I think there's a bit of a misunderstanding about what exactly is in a
DRM driver, and what is in Mesa.

Mesa doesn't program the hardware at all, it's merely a glorified
compiler. It's not more of a driver than GCC is an OS. Most importantly
for our discussion, Mesa doesn't perform any kind of register access (or
register access request), only the (kernel) driver does that.

What would be relevant to the discussion though was the userspace mode
setting, where X11 would have most of the logic to drive the hardware
directly.

That ended up being a mistake, and got superseded by KMS more than a
decade ago because it wasn't working.

> > > > - Slide 31 mentions that entities can send operations internally and
> > > >   listen to each other events. I'd like to better understand how th=
at
> > > >   will work without any abstraction in the API (as that is one of t=
he
> > > >   main design decision behind this new API) when those entities are=
 from
> > > >   different vendors, and handled by different drivers that are deve=
loped
> > > >   independently (for instance, the camera sensor and the CSI-2 rece=
iver,
> > > >   or even the CSI-2 receiver and the ISP).
> > >=20
> > > It is still under work.
> > >=20
> > > Hardware, specially for standard buses,  should be resilient (not
> > > crash) to format mismatches. Otherwise a mal-functionling sensor or
> > > too much noise could crash the system (with or without kcam).
> > >=20
> > > Drivers developed together should know about the rest of the system,
> > > so that is not the issue here.
> > >=20
> > > For drivers developed by different vendors for a standard bus, on
> > > hardware that is not resilient (that was a mouthful), then we need to
> > > prepare a set of read-only standard registers.
> >=20
> > I'm not even sure that read-only registers would be enough. I've
> > experienced first-hand DMA controllers that, when the camera has its
> > timings completely off, end up completely confused and write way outside
> > of its assigned buffer creating big chunks of corrupted memory in the
> > system.
> >=20
> > And that was by writing fairly legit values to registers that were meant
> > for that, so we wouldn't be able to defend against it even with the
> > smartest whitelist.
> >=20
> > And we were in a "good faith" situation. Giving an attacker basically
> > programmable access to DMA engines that might not be sitting behind an
> > IOMMU seems like a very dangerous idea to me.
>=20
> Do we need to preassign a range of CVE numbers ? :-)

We can do that, but I'd rather have some way to defend against that.

Maxime

--hi4muk45oyxj6fyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxoDOQAKCRDj7w1vZxhR
xShVAQCpBhYEe0nn7sx6R1ttlX9Pa3RB6EaOUvpm2LldTExfKAD9FYqIC/ydgjf+
kLNm2rYZ/uEdstFpTNzcD8AeRt0AzQo=
=eqzE
-----END PGP SIGNATURE-----

--hi4muk45oyxj6fyn--
