Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78A68260AE2
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 08:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgIHGXf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 02:23:35 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:42643 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728009AbgIHGXb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 02:23:31 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 5B965D31;
        Tue,  8 Sep 2020 02:23:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 08 Sep 2020 02:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=8PeJUwpZWqv0vmkZd7YAC2nu4o8
        KiLCP0IQDcIlnSOo=; b=ZuF+MoBRPeJv/T6zjra7/jOdL5LsazsWA6d2xxmB0Pb
        R7WPMM4onVuWLRbFYKVFiDAQfSp8mIcXPdkNuo3iEHpOPx58Lw9BVnexpT6i43KR
        gGTirBBDiZ2y/RD4bVpjeVYLM6ceEapi9PQ6skZnx+hbn9+aL+SEmh0ENvV+Cv5J
        DUZi+t0R80p463Kr4msD0LHGcCQDCkziK2l67GkzkuN8lD6lgFfj3agEBCs7wQu6
        PP2Q5d8bwYZrNrsSlmGk2V7E4YpKpqRC1m07QS/9ogZpvjnFCGxQHb7kNO5p50Q2
        iMlv23fASXV0OzGuUWU1pqBDaRFr2R4AgkzxfDq+Z/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8PeJUw
        pZWqv0vmkZd7YAC2nu4o8KiLCP0IQDcIlnSOo=; b=GTZf36Cany/gjRwOXn7Ic7
        uQLF77zuPvk5r4fut2E7gGmf3H1s7bzZFo9lbvY9zzlucSzMiCjoHTLstla6QzBE
        pmBN7Podzt5RDzSelNcfuXTtYBpyZpCCiG2m+hWwndspCZGGbhNrzWPyVTuFFq+e
        VZwhz6cGzqBmX36xKkmmcyACtgxmyvDppa4QX69WYr34FnR6GzE7pJeJwK5KTusE
        Y/JdCjjWxEbhobBJ0yx+Rn/dB6hm7yUmSXOv5yZJmJW1tUNH3MrhjOc2i07rLSZX
        Ou5CqKYc9AScW3mKXDy6mDfVI4JzxyuYFoBs7SOBKW+cU71kVnLay793GpRuyfPQ
        ==
X-ME-Sender: <xms:YCNXX2UgErBiRdbujEhwkEIsRdNlQh46_OYzYA0GFNnSObo6kvaLSg>
    <xme:YCNXXyml5PsQO6HK6Oc-Mx8Xj1dOsbi5w2FA5JygQosZWVNZh8KhwnJ2z0N8Rfom5
    PUs_RUoJD_WMSKMOnU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehuddguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YCNXX6aA6XP7FcQ7vAnSs84CykRxh6pIDAEmJkG_0Ezltc18Bwe_cA>
    <xmx:YCNXX9VW7PVPnu24SXyGTD6cazPERfiK-GsiUJ312VOSz9MdP5GcYA>
    <xmx:YCNXXwkbRAobrRfVg_mtQB0ELVx1gyOrEXZSh90RpTxkd8AT-J7W9g>
    <xmx:YSNXX67eMQSUQGB8SVRgN3mCY746la5Pt9qVueY9EUQo23vpsvxV3jGRLOk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7A28F3280059;
        Tue,  8 Sep 2020 02:23:28 -0400 (EDT)
Date:   Tue, 8 Sep 2020 08:23:27 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Martin Cerveny <m.cerveny@computer.org>
Cc:     devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/6] ARM: dts: sun8i: v3s: Enable video decoder
Message-ID: <20200908062327.7o4abjnosvghtafy@gilmour.lan>
References: <20200904200112.5563-1-m.cerveny@computer.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yeunpu5qtdhq4w3a"
Content-Disposition: inline
In-Reply-To: <20200904200112.5563-1-m.cerveny@computer.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--yeunpu5qtdhq4w3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 04, 2020 at 10:01:06PM +0200, Martin Cerveny wrote:
> First patch extends cedrus capability to all decoders
> because V3s missing MPEG2 decoder.
>=20
> Next two patches add system control node (SRAM C1) and=20
> next three patches add support for Cedrus VPU.

How was it tested?

Maxime

--yeunpu5qtdhq4w3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1cjXwAKCRDj7w1vZxhR
xV8GAP0cNYAAAy/pw2iH4/pxcs9qpz9Yq4xEwKOO219Fvk4puwD9EU7b+Q9/2v/p
2OT6tPxEesH157Xx1P4yiIB53HjDIQs=
=Kt/J
-----END PGP SIGNATURE-----

--yeunpu5qtdhq4w3a--
