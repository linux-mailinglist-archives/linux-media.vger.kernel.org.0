Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD40299337
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 18:00:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786745AbgJZRAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 13:00:48 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:54105 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1775582AbgJZRAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 13:00:47 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8D8D75805DF;
        Mon, 26 Oct 2020 13:00:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 26 Oct 2020 13:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=C2vT4YWldJbuxSY1g9g5EETM2zW
        xr1fwz0Zt7cC50Ks=; b=UGqDC3y+c6CfUFj4e9uOe+gGA5WC6bYlniMNyOZlum1
        wHmoClQJc/d7CmU9FK+UXbnPe7TJMsjr4BUaJaKxK91Eiqcjeqk3yO2zFnGSOoLw
        qnJ/vCgRiaD9qAggPd6LYaEwJvE5c+fmrXu1N5y1atHiK7MtSB5/EWgy1hg20LwO
        AHAO5AtrcqYUaJ+hE86VVDZHlCZNRg4sVaOFUvC3DjM5iCG12GfECe7pposwYO05
        zvgek4ktJK4x/qnwRSvx/uXBvIkqH5eRG7YnFUAkPbdEUy8bl93lxDXw5nlEJ/d3
        nvNA+zqL3GtrWfHTDENwjDdHM4rhSX2znpOtv7uMmAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=C2vT4Y
        WldJbuxSY1g9g5EETM2zWxr1fwz0Zt7cC50Ks=; b=LZYxVdBt+VytNDBZwg3ILL
        uBCamcXGvYcz8uSMfYZZLmpvb3HlqiK0Vpvj78yQAak6O2oOy6W47TftHp8FD4aQ
        eX8e0EIngTvm6ZUNugrDSQFa+/gy5KZAyfol+56hLYUftd9eBBFQmU+xxGdvvep4
        Y4ygSJJl9Dx9CjGZyoGgUACpfge4x2KlxthOBzinlEOGCuw226EGawqxSuvIm7K9
        YG7i7sPF69qvA0R3NTTEFqEbcQBrTWphcZaQaoodFi6wOPj5Bp+mmsG/ViRpeM/w
        p/m0bVE2MwH1gO0wOFqrWf9ozw31AyK2QprdiydFhTvM+sCOUnSVunTDvnnUB6Sw
        ==
X-ME-Sender: <xms:uwCXX-ILvrkKYZU_q3XlYxh8EhtZviUsPUAc0yAZVq_qdjy8sAccwg>
    <xme:uwCXX2I35gzBUB-w07WupOXqO-PmMnwUQLvTjJZatJ6UeMx2Ai6PkWsLhES6R-gYn
    7Vq1PSxyi2opHhzEHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
    veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uwCXX-v4f1VoDPQ0qKwBjnaoVDGoD4vBy9dPkPXoBBTN8i9Qojd05A>
    <xmx:uwCXXzaKp-iYeJd-w-56B1hgT8la6bqH58zehO8jV5km6zqwphvYEA>
    <xmx:uwCXX1Yhjg86n5kkEHXaMmnsdD2dYkOqapxIzpIGb9ec8HQUc3Gusg>
    <xmx:vgCXXySnKFYtW-gQXpz9FmU-tCdCSJGlJj8hHYtXogExLdLvDjxe9w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 065263280063;
        Mon, 26 Oct 2020 13:00:42 -0400 (EDT)
Date:   Mon, 26 Oct 2020 18:00:41 +0100
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
Subject: Re: [PATCH 12/14] media: sunxi: Add support for the A83T MIPI CSI-2
 controller
Message-ID: <20201026170041.qsjzxlurufuuhcsq@gilmour.lan>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-13-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fifha5mo6q7tep5s"
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-13-paul.kocialkowski@bootlin.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fifha5mo6q7tep5s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2020 at 07:45:44PM +0200, Paul Kocialkowski wrote:
> The A83T supports MIPI CSI-2 with a composite controller, covering both t=
he
> protocol logic and the D-PHY implementation. This controller seems to be =
found
> on the A83T only and probably was abandonned since.
>=20
> This implementation splits the protocol and D-PHY registers and uses the =
PHY
> framework internally. The D-PHY is not registered as a standalone PHY dri=
ver
> since it cannot be used with any other controller.
>=20
> There are a few notable points about the controller:
> - The initialisation sequence involes writing specific magic init values =
that
>   do not seem to make any particular sense given the concerned register f=
ields.
> - Interrupts appear to be hitting regardless of the interrupt mask regist=
ers,
>   which can cause a serious flood when transmission errors occur.

Ah, so it's a separate driver too.

> This work is based on the first version of the driver submitted by
> K=E9vin L'h=F4pital, which was adapted to mainline from the Allwinner BSP.
> This version integrates MIPI CSI-2 support as a standalone V4L2 subdev
> instead of merging it in the sun6i-csi driver.
>=20
> It was tested on a Banana Pi M3 board with an OV8865 sensor in a 4-lane
> configuration.

Co-developped-by and SoB from Kevin?

Looking at the driver, the same comments from the v3s apply there

Maxime

--fifha5mo6q7tep5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5cAuQAKCRDj7w1vZxhR
xQA7AQCD+RWN+ye76Hyh+RC2HCeFniYs1GUZ+zYbJ4AwNgCE9QEA3lh5d35xT4LL
Q85GQqjRb2oIKo8G2euZT7n4hqW5hwY=
=3VJd
-----END PGP SIGNATURE-----

--fifha5mo6q7tep5s--
