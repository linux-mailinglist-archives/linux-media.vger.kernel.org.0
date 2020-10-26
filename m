Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C85299309
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 17:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786662AbgJZQzk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 12:55:40 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:52119 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1786658AbgJZQzk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 12:55:40 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 103AC5805EE;
        Mon, 26 Oct 2020 12:55:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 26 Oct 2020 12:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=M8kp8FUl0yBH5qF8BLQ0PYleVAI
        QmHiMFKU0Eh6vdz8=; b=CRStDMWuLRxnLAtkavqed8uHZNGIheO7/+mVWFzjE+B
        mOcHEp8WwqFl9YUCRRI4KfCNhfgmumWDmvblpcPPLQ+HPQJRXkS2haw0p6liOpZY
        HWBtEGmbnK1SAXaIXknVare0K2SrjjZ7NFzIK6FXM53RnkHR50ZXh1BhAaNafNyH
        gINVRenqnzDzLp4OYdDEpt3OFo3oilKZE2mu9pUdBRRs91dp5bqh9N2C/4JHNXrC
        2x+IDVsc0br1zi5qJzZxG5ltZyt9RZ+SBYP7lPPM/nkf8fxE0qCiXfnYyr6fwRhU
        ffKl1SZ9zXGLspp+p5S/QKBWCeiaotXwqz79hFlpjvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=M8kp8F
        Ul0yBH5qF8BLQ0PYleVAIQmHiMFKU0Eh6vdz8=; b=HDegbn0mDeSBFU3jDQ7KCF
        W6ebub140KBW2IrMWk0zW+uP0Wt7bTxnEdgNKAeL89D9qTE/QEB+NpEqxzp9SQ6p
        gv1gQY/lCRpt6KZVsetHdQj+qkURYEKMLxoiYFK76EaJM61oIYqgU9pRSC6kIVTT
        7MgFAMEC6+hViAIgLZ9oyUIbG1JNDb5lq7Qq4k0xp2XrucOeE35liZ2q5TMmOQW0
        V6Z/HeICqWOuMyIYNWhj0pZDwYhVWsna0Vs0eKeouUKUube0+0nLcnu6OuSlkQdj
        4l68vypbra9r47bOK5Fc5mWo0sFrQsYOucJQND+qdkaU4iopD20DLJ61Vc1kuV9A
        ==
X-ME-Sender: <xms:iv-WX70AHhjvjIAoeCM03NVd-MOp3qiVSfYP5fMts_koBhFUuiB5nw>
    <xme:iv-WX6E6ohWAjGIx21-CIegBWIAB0nI54E300CitazGUTp-klf887-BkLetpZZKUd
    bphYuYTqBRO4PQc57Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iv-WX770i5hYrBEXFX8AhXqhLUPxtLQNO56Ec3v3oNaeidWknUO6Ow>
    <xmx:iv-WXw1VhVlPp3qRtFdffSpVdEHZ9FhvGAMj-9b63NsXglm_4HNRQg>
    <xmx:iv-WX-GobtIsJS0T8yzBeBFJsQ4rlxcahrYYSb-0v-yIp3XZXjunHQ>
    <xmx:i_-WX8_Fa4EmgNAGYp7IH8XFFGt4u-HTDf7k3axzicPgp5pwN-RIAA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 64D163064674;
        Mon, 26 Oct 2020 12:55:38 -0400 (EDT)
Date:   Mon, 26 Oct 2020 17:55:36 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: Re: [PATCH 10/14] ARM: dts: sun8i: v3s: Add MIPI D-PHY and MIPI
 CSI-2 interface nodes
Message-ID: <20201026165536.glmo727mzixtrtq5@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-11-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zcfibetqyhgzzpse"
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-11-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--zcfibetqyhgzzpse
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 07:45:42PM +0200, Paul Kocialkowski wrote:
> MIPI CSI-2 is supported on the V3s with an A31 controller, which seems
> to be used on all Allwinner chips supporting it, except for the A83T.
> The controller is connected to CSI0 through fwnode endpoints.
> The mipi_csi2_in port node is provided to connect MIPI CSI-2 sensors.
>=20
> The D-PHY part is the same that already drives DSI, but used in Rx mode.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Especially since you haven't tested CSI0 without MIPI-CSI, you can
squash that patch into the previous one.

Maxime

--zcfibetqyhgzzpse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5b/iAAKCRDj7w1vZxhR
xbAjAP9CP/SEWp6kG8clryOH7rRuMR0ZbxY3MUewfpakLBpAAgEAukaJS8Bwt8EA
oXawwEY8ttfUtVYweh72ULszOhy2SAk=
=152k
-----END PGP SIGNATURE-----

--zcfibetqyhgzzpse--
