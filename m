Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D269C30732D
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 10:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232090AbhA1Juu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 04:50:50 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:58577 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231674AbhA1JuH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 04:50:07 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id CC34B580777;
        Thu, 28 Jan 2021 04:48:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 28 Jan 2021 04:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=TV859JvWohvleWj2mlFpPgmtkri
        A19iCS+DM5VX5zO4=; b=fA7G8+msT4KYcqnHIgLxQP+PqklcjUp1JZ+v1tH8kqI
        bfcRaN8oQIGt8feTaYgoQ797EGT4peyAf0gzWMd1ognhfVbmYQgBmhgw60DKKwyF
        OkCr7MzW/hkSHxjIGOjhi3L4+CQIUvZJMCv1ClRvZk1ejkP+0D978Y1mC77LWaDR
        2Qv8RqW46xThBokYMhl4Yl41IQKtMc3cBQDW+qUa7K+knCKcRhd25b4DxnyEE5t8
        AIKB0H3hBJmhaO4BCdg+bMMJyym8WZO3ys5RNKNbU9VU93sxoN3eGAliw8DcVBVx
        JH4ElzvJB47Sm3xtSSMHKG/jLO4fGowAXci8hEdVKyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TV859J
        vWohvleWj2mlFpPgmtkriA19iCS+DM5VX5zO4=; b=GhODBhboPsDZZcXYC4C7Fd
        GFtz/Nerkl/LyDWteUwO2WVRURMcZxsQI0bjETRzoTCgrm98a5xmbZ5rz4aWcPAb
        37/I6AevS2omsNi94Dg9Iuv3BkbAgDdthef/2hVImSL/KMUjm8bCZouiSKutu2Z8
        OkfFwvjnnFGQXr89HTfrIE/jdbfudB6aqaiw2H2JkmkzmwwgZhopwXLeFfHgJvSj
        hR6t43g22N9fMI2DVNp46biqC8hYjHbDXioBnwU0HSokS/RIg2HsquQKUErjHAf6
        rZxT0HDTScO+FLCBgAu9u8fYNTa2r+fdU64CTm+8MljxCKaWRXFJsz6f+2/8pPHg
        ==
X-ME-Sender: <xms:g4gSYIpPEYZg8W6QasCiNpwsxO1K-SEnjT7vF-e1MbYr55R98toN8A>
    <xme:g4gSYOr1AupiGrRkxJrRal_nRoEO_AbaZBNnJ3kipsX0Tw33xWhOdNeYYaXbpePIQ
    G_5rlnsk7RPVvvhKMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hIgSYNNIS-Nmwee4hfp0b5Qp-_i8qySVH2DpNB95c9EPMkKTxfk8Og>
    <xmx:hIgSYP7_4ssmloHnIfI11jndKRxEOFAwppQu-ik5BnIFnz91qSUxqA>
    <xmx:hIgSYH73EECJsEFmHEaqT4sNbcaS0WmWjG9WYdw9QTnZaRDLjO9daA>
    <xmx:hYgSYPw-gWN3drIkmH5-4V--xcluONBqCQoJdFkYBzfFU06BT9yMfw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id B2A7D24005A;
        Thu, 28 Jan 2021 04:48:51 -0500 (EST)
Date:   Thu, 28 Jan 2021 10:48:49 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Eric Anholt <eric@anholt.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        bcm-kernel-feedback-list@broadcom.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/15] drm/vc4: hdmi: Add CEC support for the BCM2711
Message-ID: <20210128094849.5hxx6ui3tgkmu5p5@gilmour>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <acd2ba9f35732ba3fb7c31ba05132434ec99fd66.camel@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="puhomd6fgdwr2xp5"
Content-Disposition: inline
In-Reply-To: <acd2ba9f35732ba3fb7c31ba05132434ec99fd66.camel@suse.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--puhomd6fgdwr2xp5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, Jan 25, 2021 at 10:03:44PM +0100, Nicolas Saenz Julienne wrote:
> Hi,
>=20
> On Mon, 2021-01-11 at 15:22 +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > Here's a series introducing the CEC support for the BCM2711 found on the
> > RaspberryPi4.
> >=20
> > The BCM2711 HDMI controller uses a similar layout for the CEC registers=
, the
> > main difference being that the interrupt handling part is now shared be=
tween
> > both HDMI controllers.
> >=20
> > This series is mainly about fixing a couple of bugs, reworking the driv=
er to
> > support having two different interrupts, one for each direction, provid=
ed by an
> > external irqchip, and enables the irqchip driver for the controller we =
have.
> >=20
> > This has been tested on an RPi3 and RPi4, but requires the latest firmw=
are.
> > It's is based on the 10 and 12 bpc series.
>=20
> I applied patches #1 and #14 for-next. I'm waiting on Hans' testing for #=
15.

I've applied to drm-misc-next the patches 2 to 13

Maxime

--puhomd6fgdwr2xp5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYBKIgQAKCRDj7w1vZxhR
xcFjAQDyhilWiZOnBtF/6Ds6w1BfcUQewBo/s/AMDRirS7HODgD/RWnajJxfaPQ/
BJAVsfoxNFRZbgY7Cl/919hBHx8nfA8=
=F65t
-----END PGP SIGNATURE-----

--puhomd6fgdwr2xp5--
