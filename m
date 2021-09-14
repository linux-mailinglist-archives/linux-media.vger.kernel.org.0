Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C61C140ACB3
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 13:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbhINLtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 07:49:45 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:46781 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232378AbhINLt1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 07:49:27 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 344122B0136A;
        Tue, 14 Sep 2021 07:48:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 14 Sep 2021 07:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=/FO+XkH3e9OeFf1oDJJDRN3NS/p
        48CW6gbe2PBdmjAU=; b=sOQ8lZWOfqrUG+oxYfqJG7PAg2SiMP5MlA3sT3ch7p+
        mpCfwR9MolGtqYSYtH1RGNgXNF2P6OiylQtWVE9g6KSI8M+yh6wxDbUe0LPL0wIg
        Gls1MJnJN2F26x4xyQYw9E0qKYvZWDyvEUdNusYQee70eb/9WNVJJjr7X57zGVf4
        TXFnhU3QM4ce4NBuhNRPVwBRIRJrKQImnCJjTgbyRNZhkjeLn05hL2nAe0GWwite
        P0dtpjlt9s+3fertoi1thbDJ0ZUKS/PxIh30CBhK1QDmecyvdHVppkG79SSfIgOE
        7Q+4W+NlR4diozfdJaMrcns/t1LV5mYqZeSUX1ZJ9Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/FO+Xk
        H3e9OeFf1oDJJDRN3NS/p48CW6gbe2PBdmjAU=; b=LiaLcPYSWdjwjzqCqyNcFC
        Dg1MN2bC5JNwW9l9L7vEJ1IK8m+mRIlOJfisFe9pnGeH7VqsZ2g7aFo/PVGCH8u2
        q2qU/Kxe0xrxRAmjQA0UfV+3DKnsA1OeakfWxtBm9OtDNJg+/zTkfcvgsZFYI9+i
        hwHrN9mwptLYHyRBpNQDglH2vG+wOVKRu5+Fxlv3lhDaizcn7bI57KUQGaJhGBrw
        f0jYmaQFO0z8W8B7ywgDLW7wJeaxOTd1CXjNrkh3F36IfFENYcK56THk6K2Zv9Gw
        UviR0Y0WXJNtPZD1Pg83E45Lt5D0DVPUSyDpAIr91O2YZYcBBnxtM1Pa2dcD2OYw
        ==
X-ME-Sender: <xms:9ItAYStGiCN4j-mogi1-2MxUb9LMxUZ5N84Gu0Vw6qFkCqQyWdbc6g>
    <xme:9ItAYXeeqtFKeIT2wjyUwGSFRLSjmRchsw_WMlD2KYY73E9sFsPDCiEMvVCyRB8ZU
    ec-IkcjtYX_pgJaV6k>
X-ME-Received: <xmr:9ItAYdy6GM-O_upEoYCJxFg9pS47K1A_IgpttINATnCA-oKpWE8ILW-DUOy2-prSTLWsWF0OuAy1c2CETsQZatCuxsg8K3gqN3Qz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
    jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9ItAYdOjHLWzmqmps8fUAxQastkf1ChDebTG5LgtD1G2a_3S_jVE7w>
    <xmx:9ItAYS8XKRUwsCK_tryagUFfwMY6bqwlft769BXhljdlV1seWfzXfw>
    <xmx:9ItAYVW1jY9jsDYcn95FSFL78DmGkpGOvXMv9bZcpLpps84cRtlbXw>
    <xmx:9otAYV0PEy1uIb3OkFdatdBkka3a8F3KMFF6IgNJxzRT_iimR9wxV06uq8o>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 07:48:04 -0400 (EDT)
Date:   Tue, 14 Sep 2021 13:48:01 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 20/22] staging: media: Add support for the Allwinner A31
 ISP
Message-ID: <20210914114801.krmzxbkwj6u7lfjd@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-21-paul.kocialkowski@bootlin.com>
 <20210913083135.v7q7joux2xckat62@gilmour>
 <YUBUUQxBaGUkjzMP@aptenodytes>
 <YUCDVm4OA3C3Re09@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rvmu2elmhrznwm6w"
Content-Disposition: inline
In-Reply-To: <YUCDVm4OA3C3Re09@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rvmu2elmhrznwm6w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 02:11:18PM +0300, Laurent Pinchart wrote:
> Hi Paul,
>=20
> On Tue, Sep 14, 2021 at 09:50:41AM +0200, Paul Kocialkowski wrote:
> > On Mon 13 Sep 21, 10:31, Maxime Ripard wrote:
> > > On Fri, Sep 10, 2021 at 08:41:45PM +0200, Paul Kocialkowski wrote:
> > > > Some Allwinner platforms come with an Image Signal Processor, which
> > > > supports various features in order to enhance and transform data
> > > > received by image sensors into good-looking pictures. In most cases,
> > > > the data is raw bayer, which gets internally converted to RGB and
> > > > finally YUV, which is what the hardware produces.
> > > >=20
> > > > This driver supports ISPs that are similar to the A31 ISP, which was
> > > > the first standalone ISP found in Allwinner platforms. Simpler ISP
> > > > blocks were found in the A10 and A20, where they are tied to a CSI
> > > > controller. Newer generations of Allwinner SoCs (starting with the
> > > > H6, H616, etc) come with a new camera subsystem and revised ISP.
> > > > Even though these previous and next-generation ISPs are somewhat
> > > > similar to the A31 ISP, they have enough significant differences to
> > > > be out of the scope of this driver.
> > > >=20
> > > > While the ISP supports many features, including 3A and many
> > > > enhancement blocks, this implementation is limited to the following:
> > > > - V3s (V3/S3) platform support;
> > > > - Bayer media bus formats as input;
> > > > - Semi-planar YUV (NV12/NV21) as output;
> > > > - Debayering with per-component gain and offset configuration;
> > > > - 2D noise filtering with configurable coefficients.
> > > >=20
> > > > Since many features are missing from the associated uAPI, the driver
> > > > is aimed to integrate staging until all features are properly
> > > > described.
> > >=20
> > > We can add new features/interfaces to a !staging driver. Why do you
> > > think staging is required?
> >=20
> > This is true for the driver but not so much for the uAPI, so it seems t=
hat
> > the uAPI must be added to staging in some way. Then I'm not sure it mak=
es sense
> > to have a !staging driver that depends on a staging uAPI.
> >=20
> > Besides that, I added it to staging because that's the process that was
> > followed by rkisp1, which is a very similar case.
>=20
> Maxime is right in the sense that uAPI can always be extended, but it
> has to be done in a backward-compatible manner, and staging is sometimes
> considered as not being covered by the ABI stability requirements of the
> kernel. Not everybody agrees on this, but there are clear cases where
> userspace really can't expect staging ABIs to be stable (for instance
> when the driver doesn't even compile).
>=20
> I think there's value in having the driver in staging to facilitate
> development until we consider the ABI stable, but I'm not entirely sure
> if there should be another step taken to mark this ABI is not being
> ready yet.

The rule seems to be about whether or not the user-space gets broken in
the process:

https://lore.kernel.org/lkml/CAHk-=3DwiVi7mSrsMP=3DfLXQrXK_UimybW=3DziLOwSz=
FTtoXUacWVQ@mail.gmail.com/

Something that wouldn't compile cannot generate a regression, since it
never worked in the first place. Changing the semantic of an ioctl does.

Maxime

--rvmu2elmhrznwm6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUCL8QAKCRDj7w1vZxhR
xTToAQDDtt/uV0Mc20Vef8PiiT2oboXw4IMiKcGnaGkiGeJF0AEA2qTN9vI6Lp2E
c1Q7OUUDoHcGOrZWXlkbdAD1T4FyvQw=
=vImF
-----END PGP SIGNATURE-----

--rvmu2elmhrznwm6w--
