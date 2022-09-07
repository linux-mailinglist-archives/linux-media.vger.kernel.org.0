Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7E955B036C
	for <lists+linux-media@lfdr.de>; Wed,  7 Sep 2022 13:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiIGLxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Sep 2022 07:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiIGLxW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Sep 2022 07:53:22 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3628696D4
        for <linux-media@vger.kernel.org>; Wed,  7 Sep 2022 04:53:14 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 0E65C3200923;
        Wed,  7 Sep 2022 07:53:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 07 Sep 2022 07:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1662551588; x=1662637988; bh=Cz9KHOTG7h
        qtW3fndlnI3JNyFbdiz1oaPzQmHizmbFQ=; b=S9fK6E9TW2l3L1ms2z7SpichFH
        xF/RW6FK06CHk70CoDoIX04hg7muRcz+Qo77tr6yLO2SAw1xuHaNByeYNVG/lorg
        NbPk0uIYsfzP4yWna7tQsjxWbE8HRV2LQkohX8d/myA1wnGMymsNnI4gTUyru1cB
        cRhSQNoeT/dk/ooc6P0OMHeQsrh28o+lQwkzsVLhStCTkMGoC+XrkOYA9Caqnyyf
        uJlhzvdnhW8BoG3Rut7k+BBg74cBHc0DI+meqVi+6AF+BU14tmq8TUZacBRNRFFp
        h+msKPpcpgXowPAM11LJ4PeVqd0uUM3AM6wuSTfHaHs3AqVN6Lg6eLv930Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1662551588; x=1662637988; bh=Cz9KHOTG7hqtW3fndlnI3JNyFbdi
        z1oaPzQmHizmbFQ=; b=ovKd7/34PXByfg2WxoARQbHPJvW7+EYL5eHaS/AKrjs4
        HFTYA/3Qct250rPk5eti0PYZmxYTwLaphFvhh0F/7RCFGu59JEAlRUkiOCSRHUQa
        Q7eg/uMgZQxc1zvPr214o6wnaSpo01ZW+FONlESrsAcof+YFdwH75kV8of1+8iNz
        vzkL+ER7XfPgaaJ7PT3pRYeQ2+W43p7bXXjHJ7+07EfKWf1/4wJlE78wfySEFnfb
        OkLNdkLEdHIo32IOrgJvdOeH2aGzoCUOTvp0r5l/FITnTnnHjKhu3I3xPpWKZFU5
        AKw2S5OIRK7BSQDM1HcJhMEP/1DXVARUhf3yNzuoIA==
X-ME-Sender: <xms:I4YYYyWhNw939A-l37Xog66sysKS_VpeOaM5hCvef3I5wnxzMUWPCA>
    <xme:I4YYY-n2iGGPIPnsqPOafmc-LNfNCT3CM0h1BJdncgg56vTKCKO85lsYQ86omAxUM
    vGmAWtQioONwO9pRiQ>
X-ME-Received: <xmr:I4YYY2bPUjloZg8DIrmYAG2P_q7TjuHNz3xNWpFFj_O5l3s38B9LXSQ1Sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejfeetffehleetkeekjeduleegffekheegieeugeelkeffudelhfefueeu
    keefudenucffohhmrghinhepohhpvghnphhgphdrohhrghdpuhgsuhhnthhurdgtohhmpd
    hkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:I4YYY5Veg7klpOUSaLF_H--aouJt3ef9yS4J1aVjm__eDyTgC3nw4w>
    <xmx:I4YYY8nniKfNeU0elqFGChddr8neVzA-38Z9TcjF70scXD7bE78bvg>
    <xmx:I4YYY-fiu9Gi--HayzAtJxmRIwiHpmjDwnmDC0xamdPRB-GxMlBFgw>
    <xmx:JIYYY6lV5mk5NT6ogTkEzzIOX31MECkEndJMDJBMaJCvSJbfd22w9g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 07:53:07 -0400 (EDT)
Date:   Wed, 7 Sep 2022 13:53:04 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org,
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
Message-ID: <20220907115304.55ld54hwn2xij7mg@houat>
References: <3840c3cc-00fb-45dd-cb89-39b36fb6d733@xs4all.nl>
 <YxX8dzSsquJmO5hP@paasikivi.fi.intel.com>
 <YxYLSk2pKdGnNDP3@pendragon.ideasonboard.com>
 <b76bd2fb-d0bc-2e71-26ec-b98b9949700d@xs4all.nl>
 <YxhplLKtRAQzlSK/@pendragon.ideasonboard.com>
 <34f930db-db94-b134-4a1d-b9586e5b54be@xs4all.nl>
 <YxhtOfpRhrxQCeGZ@pendragon.ideasonboard.com>
 <fcbe42bf-5a9a-69ed-6930-f20d70f2e168@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4d7e5y7awynpi5yw"
Content-Disposition: inline
In-Reply-To: <fcbe42bf-5a9a-69ed-6930-f20d70f2e168@xs4all.nl>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--4d7e5y7awynpi5yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 12:30:36PM +0200, Hans Verkuil wrote:
> keys.openpgp.org and keyserver.ubuntu.com do find my keys, but pgp.mit.edu
> doesn't appear to have it. In fact, I can't find your key there either. T=
hat
> suggests that that one doesn't mirror from others.
>=20
> So the only two that appear to be reliable are hkps://keys.openpgp.org
> and hkp://keyserver.ubuntu.com.

The kernel.org doc mentions openpgp.org:
https://korg.docs.kernel.org/pgpkeys.html#submitting-keys-to-the-keyring

They also seem fairly active in developing their infrastructure:
https://gitlab.com/hagrid-keyserver/hagrid

Maxime

--4d7e5y7awynpi5yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxiGIAAKCRDj7w1vZxhR
xazeAP9q3vpHzouRENm3deI9fXpbpadGH7qzD+IJCwEA5sTzeAEAydXB8MAm97Is
46+a0C7f1CjI0h6lx6QUC+TFn4oNtwM=
=jJ6V
-----END PGP SIGNATURE-----

--4d7e5y7awynpi5yw--
