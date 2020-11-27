Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203E32C68BE
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 16:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729872AbgK0Pda (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 10:33:30 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49065 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726889AbgK0Pd3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 10:33:29 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id CB10FB6B;
        Fri, 27 Nov 2020 10:33:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 27 Nov 2020 10:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=hQLCTWDFJXTqt/TRJyvFvGq5fMH
        QZAtbHsSz8Psfm7E=; b=CYjp5xaO26pwxXS2+e3CqDLRKt0bUvZqk1qwDhaluPt
        pHccC+49dgwyfIhx0q8/TbXJOKrcMbz6tuCwsdxGmkVFjf5rmSOnyPRB6tjEj9Q2
        umea3Q7zn+Dci9LSBXpdei3QWg5DZi0xZ73Ju60DWmWr4NTkQa0FnePPKWrU1S7j
        GcMHXmS1Xc7/k+mWU5fRNnAlymneY+wkZI40OHouY7Ii9mVabbq4dx9pdCO0yioC
        4DVbGggkWGdhim56+UO/Oy/Ne/QTrCeBF7OCUFYQwbJkbWvxsHqrwrLXPX1/hpjV
        /1LFMRJJ2mSmCB+HxLg+42Fw2tsWoGP3SICq4tdT+QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hQLCTW
        DFJXTqt/TRJyvFvGq5fMHQZAtbHsSz8Psfm7E=; b=hrzfFuIvtCEKdl//uGOagq
        Xqj6th71MCHh4UAfvX906fY0qRVfrFAFoXwBqtIogEhlX1u7Y1l1O6ViR//kUDqm
        q6OWdEu454URBvFvLoAKUeUdyhgA5IrzdwYbtFWb8jahwN98TarG98FHLZOCrOO2
        KAV5jJPLRmBDDC9NriyPWkDHa23aVq83oPm0+3p2gV7noXRJBFO4qMrNK1MIgoSe
        XF321biLEVYjl7bJRNkv30JTFFXKdTi7DSYdpU9kWzueYFXWBg1wsGHYFn0i3Lhn
        O//ruOfe/B/Cgr4o5uoCRLOPDkUCqtMUXx3INeg86Vfcr7B14Qr4wtKh16JiTkWw
        ==
X-ME-Sender: <xms:RxzBX2yV7ZUrj61pnLIwSLhaK1hnOzqn-2SsqlOAWNK00fIoQVHAEA>
    <xme:RxzBXyTD7fmoH0s5258TZcJQkFcPu84sTEBu2I7Yt6J58W55lAkjg_qpIiPP-C43Y
    DIS6H2XY5LDbb5u73c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehgedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
    ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
    rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeelkeeghefhuddtleejgfeljeffhe
    ffgfeijefhgfeufefhtdevteegheeiheegudenucfkphepledtrdekledrieekrdejieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
    hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RxzBX4XGHhzNTh-PjkVdifYOHZIqgpm8Zw_QmWVf2q9xGBuQ0SDxtw>
    <xmx:RxzBX8hw9TysvMwZrwRfcEy7ARu-JN-U3pkJrwcqzeMJ0B6OjipP4g>
    <xmx:RxzBX4B5eBx9qH_OmCXMPwUh04OphhhZJxGEszldFWaaw_iTjdpEVg>
    <xmx:SBzBX3-20eNvC_eiOfUElOBgHnBr5b4ts_9OzjiPPy2I6XfiZ8FoTQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 931ED3064AAE;
        Fri, 27 Nov 2020 10:33:27 -0500 (EST)
Date:   Fri, 27 Nov 2020 16:33:25 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH for v5.10 0/2] pulse8-cec: fix crash and support v12
Message-ID: <20201127153325.54np4xyx4fn3c25s@gilmour>
References: <20201127122214.126701-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fprdwqlv3uutvl3s"
Content-Disposition: inline
In-Reply-To: <20201127122214.126701-1-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fprdwqlv3uutvl3s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Nov 27, 2020 at 01:22:12PM +0100, Hans Verkuil wrote:
> The first patch fixes a nasty bug where disconnecting a Pulse-Eight
> would cause a duplicate free and crash.
>=20
> In addition, it turns out that Pulse-Eight has a newer firmware version
> (12, but the same issue is present for any firmware >=3D 10) where one
> message was removed. This caused the probe() to fail, and then hit
> exactly the same issue with a duplicate free. Both issues are fixed in
> the first patch.
>=20
> The second patch adds support for FW versions >=3D 10 by skipping the
> removed message.
>=20
> Thanks to Maxime Ripard for reporting this.

I just built a 5.9.8 kernel with your patches on top, and I'm able to
start cec-ctl in monitor mode without issue. You can add for both patches:

Tested-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--fprdwqlv3uutvl3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX8EcQQAKCRDj7w1vZxhR
xdfWAP9Caoj2YmFgucoz4pgOWMqPc3SyxmpdqIWct5rsnghtNwD7BBJ+1eYpRkNV
6rWMGprulUZsEBd6kDTMqpls3LiVbQc=
=mI7a
-----END PGP SIGNATURE-----

--fprdwqlv3uutvl3s--
