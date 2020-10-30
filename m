Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59482A0AB5
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 17:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgJ3QIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 12:08:20 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:46553 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725355AbgJ3QIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 12:08:20 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id DA866B1C;
        Fri, 30 Oct 2020 11:58:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 30 Oct 2020 11:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:subject:message-id:mime-version:content-type; s=
        fm1; bh=XXGVRjDya5GFC7aeRrAcXxJhJbAIofYQW1AF33SAmE8=; b=K6WpM+zC
        knlkR3nAWhA8r3TfsXlFVMVUdVFpF0fUw0f5Qb5K2yV8CLHEshBw7vMuLV8KH43s
        pZ4ugUkKckS8/LnXHPfWhECroW+HjIHrAzvP4Grx9PjHnVKCfknkvXe/ooQjct16
        mZ5vUoY2v/2Cwzz74PsfpPThqw/GSUBj6RLxs7AAVMt+yMRA7ARkr9pmEp/qJQPr
        MAu0waY22va1p0KfCaRwVjkX49hyucX6BLiEBdx5vaLpMF5f6LY35GWpSTcOEVjy
        zDZcu5QsEHuC8+ywuMoNPGtUWb9MNMAlwLRuTTa/zXtyizSAiMJM9pk+15o1FXJB
        PpqMZrRt1D/p2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=XXGVRjDya5GFC7aeRrAcXxJhJbAIo
        fYQW1AF33SAmE8=; b=hq9pvRo0FtPRK898Ol2DYu0gprcbEE82Zauhn15+7MN5R
        dtrbVaNfvBfsdZC8LIVZ9XsesagXqUeQdnqMJETIl+cGltno0lG91qTvhTCs5Zy9
        abkx3Nzk8iEKi/RSnF+5CMkbmDvCSden8qd6OUEPSKJxTstVgRmDCbldnRBpkSlI
        yZ4b5z3npLppYJ1nnjZTEnEp+28LUzuauIAGLwgiXvNLkJyOQormS3YBLhFmkz6f
        h7dbkB5RJp3wr2VYfg2ht/xl7BRTriBpTnZCWNwF2Z3zDZU8SggSvurPCwlv8vxz
        R5rKg21S8AhiMCl8JEyp4WHZqH02CEltdfMMYO41Q==
X-ME-Sender: <xms:ITicX4y7nbi2oEy_bV2UyEGFR_2uHVKnSEouoP8dAgrqYadvsw4prw>
    <xme:ITicX8S-rubSZlW16lXyCYgUWZGBLsT_I36sIhd9tkD0qtAWrCkb1laf8LGXmlUUN
    3uFK7WY4JGlBorGC-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleehgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
    hnpeeghedvvdffleevieeugffgieeuuddvhfefuefhgfeljeelgefhvdegtdevgeelkeen
    ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ITicX6Wp2wP4HnClKn3Q-QW3dpfSi8xZ4lz2leCxxNuE7qVKE5QH8Q>
    <xmx:ITicX2jl8L1HzmU7GouvX1t1ZQOTezqnAyJpbWjc0lDsZJqUHUQeFQ>
    <xmx:ITicX6Dh0DXTGBuE7tBFKKjezuWE6fSXtRRO4uYa5ChkEYzu2babEg>
    <xmx:IjicXx-GGgNwmfKOXIQ4ljCjogdi_xxG9HocHGiP6CfUzsvMmfYe6g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id AB1D13280059;
        Fri, 30 Oct 2020 11:58:25 -0400 (EDT)
Date:   Fri, 30 Oct 2020 16:58:24 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: edid-decode: Bug in ratio handling?
Message-ID: <20201030155824.ldygcqaclat3vrul@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h5kdeov2wrxodeby"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--h5kdeov2wrxodeby
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I was playing around with some code to generate EDIDs, and I think I
found a bug in how edid-decode parses the landscape and portrait ratio
in the base block, bytes 0x15 and 0x16.

The spec (section 3.6.2) provides a formula to get back the aspect ratio
=66rom the stored value which is:

in landscape
aspect ratio =3D (stored value + 99) / 100

With the value in the byte 0x15

and in portrait
aspect ratio =3D  100 / (stored value + 99)

with the value in the byte 0x16

However, parse-base-block.cpp has:

if (x[0x15])
	printf("    Aspect ratio: %f (landscape)\n", 100.0 / (x[0x16] + 99));
else
	printf("    Aspect ratio: %f (portrait)\n", 100.0 / (x[0x15] + 99));

Which applies the same formula to both ratio types, and seems to invert
the bytes supposed to be used?

The spec provides some example later on, for example with 4/3 (so
1.333333...) where the stored value is supposed to be 34/0x22, while
edid-decode parses that as 1.010101

Maxime

--h5kdeov2wrxodeby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5w4IAAKCRDj7w1vZxhR
xcXiAQC9mRrtX9X3ftwQ3WbPcZ55v2fQP90FTn2daf0UzY1zQQD/Zr8s/NuY999n
dHVSnLaPFMRBthUTMQUY6gQuYWFVSQE=
=FFrQ
-----END PGP SIGNATURE-----

--h5kdeov2wrxodeby--
