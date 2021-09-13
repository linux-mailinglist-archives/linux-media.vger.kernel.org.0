Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70BD4085DF
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 09:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237995AbhIMHzo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 03:55:44 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41885 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237748AbhIMHzh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 03:55:37 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id BCC0E580B19;
        Mon, 13 Sep 2021 03:54:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 13 Sep 2021 03:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=H8iC8iHH15qxrWE5p36hpaSNhVm
        Drj/cFBvDF2mQy2E=; b=UCfz2XtPhqhQXdFg6bLxKSpWTWtfkqIOg2guL+fXvKA
        Wcj8/ouyHsRZ2ZHZXxWkf5xBKf6EX71bJkf/399vs4ctj0s/vD6p8TP8Zo9cKfMb
        f8nQ9kMWaVKfaR2dBzFZQ77Yz7VSXQ59S5mqjLEslbHo9VllCnLshbv+ynNle7gU
        5lI7nAKGcFk3gYj1IAVs+bOBKjuFm+UdM/9NrwmlLSggIMQY85+wvmsyvY99uujL
        OVIg0EZjOko0OZthW8+bfP2kHkKZhMfGEfpJmIn38C4ntfryqB/xb99J0v8ENOyL
        6x9/xDWbxYkqOf/PkLeTqtT1WFyZTDkCeWL/a2wE6ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=H8iC8i
        HH15qxrWE5p36hpaSNhVmDrj/cFBvDF2mQy2E=; b=nELtx7Ev2gebBVUNhEEN+m
        Cf5eZIoXUV3lQ+EMzuH94Xo8HlKTUEf1mYwKaoooBH0CPzaUvEygsKgbnTAA2Tme
        I9lKc6uP7dQOawMGp6kE0RZ5RofgBbeVyUva8j+3HAyqZxSfx1qui0km3xyxOhct
        qgstkYSYWcQNiJFcNX8Af4EGFVrcmteFwJLud30Qn54AJw1StUl2fLymPUpyq4q/
        TFMqaoDjUWjTQG9WgS+a7+09XD+LmaRU460/QhcXrExjRmg6G9rXlVi08urHV47x
        Cd+zIvrQYIEeja0zJAQ3lQzjdyTwvMKd3wS8QTCqjB4Wl1wF5EKGfQecfo8k2Kdg
        ==
X-ME-Sender: <xms:qwM_YSb2_yyHGTFILvfkS5qEZ5gNxUFrH039nCy2LqcC94W4CjxBGw>
    <xme:qwM_YVYOIEfRBp5oXNHGQD5K7RT7jlhmJGRxrsEzWk_M2lEsx-G-Ja-8Ahq6pjfYx
    43GcNOII36jP8RTXkM>
X-ME-Received: <xmr:qwM_Yc-2L9iHoeRfv2AuUXDhCod8wYzL8UCI77i4J9LNVbs1yCzQlKwig1sstlUeehRMupesSZjpxl8y44EDuyA5qbelzGeO7LzY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegiedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
    heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qwM_YUo8RjhvzG1itXj-wb4NbexHe3mO6PZO9nrUu3St7r4v1NPFKQ>
    <xmx:qwM_YdrrjQxCRyoocyi3XVLb1LVaZ8rWke5r3pYhH0dXc59CODjplA>
    <xmx:qwM_YSTkMdTh6OyqL4MyRtkEwblNxGRqtOrTll-QHrlCFe96Qgvg8w>
    <xmx:rQM_YSiHQeCrBXAszl-g_7wRnf5eToxq8Xy16SfZF1xTIf-eFYQsJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 03:54:18 -0400 (EDT)
Date:   Mon, 13 Sep 2021 09:54:17 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 01/22] clk: sunxi-ng: v3s: Make the ISP PLL clock public
Message-ID: <20210913075417.ampb2jt4quftpqzj@gilmour>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-2-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3eyvvraksbaukjuq"
Content-Disposition: inline
In-Reply-To: <20210910184147.336618-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3eyvvraksbaukjuq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 10, 2021 at 08:41:26PM +0200, Paul Kocialkowski wrote:
> In order to reparent the CSI module clock to the ISP PLL via
> device-tree, export the ISP PLL clock declaration in the public
> device-tree header.

You use clk_set_rate_exclusive in the ISP driver on the module clock so
it should prevent what you're mentioning from happening.

If it doesn't, then clk_set_rate_exclusive has a bug and should be
fixed.

Either way, using assigned-clock-parents is not a good solution here
either, it only makes sure that this is the case when probe is run.

> Details regarding why the CSI module clock is best parented to the ISP
> PLL are provided in the related commit.

This is relevant to this commit too and "the related commit" is far too
blurry when you consider the entire Linux git history.

Maxime

--3eyvvraksbaukjuq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYT8DqQAKCRDj7w1vZxhR
xTZvAQCBM99MGd6qVMOuUH5pAUXkNRCjmqWYffeGxv1bEMviLgEA9/VMtVKq1DGw
cYRuC53YO5a08nIT5L/y26XC1yd/CAg=
=3hm0
-----END PGP SIGNATURE-----

--3eyvvraksbaukjuq--
