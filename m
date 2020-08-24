Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A773C2519F8
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 15:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgHYNoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 09:44:01 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:38231 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726347AbgHYNll (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 09:41:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 90E6C580434;
        Tue, 25 Aug 2020 09:35:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=heSxZ0v/Qu75xj28+50fhvskv1q
        2grCRuH7m6PwDOjk=; b=DH/bvnqJ1QzGZwBII8NxBpiFHWiMB8VukcJblX4AFFu
        OMc8FJa2a9X5N05NSCKbSb/rnIzDssBW4WPBci8FdiVIDyc2laI6vX4EAwVry+R8
        h8oIchfUux44zZhfh2KDS9YOnTGdFXCvb/W4eC/zQT8hQQqq+Klpx7UTsQ8iA++3
        y5RBr29dBD1KKyfcmIy7dLySeCnAa3GzQj3HcD5UdBePQ0DCsp0GiCmyERg2xSDV
        20dndS7arFJ9SDyRSjpPqiTDQJNpaQFGnjqxMjNCpMJYSnx8hAxUlMDgrT+XKGwN
        4EnQkaXy55l7hFISvsX0n2R6YcplFbL7m8boSTnvPfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=heSxZ0
        v/Qu75xj28+50fhvskv1q2grCRuH7m6PwDOjk=; b=PjL8jOqBbN2/dyjFswTwf4
        lafzm/B4hXrVcRrNGkDYYg+rIRu1qK2VoCq3OsL4g+uVAVtaifdx7Vq7oS8M0tt5
        w4IsaXuOvjglMtGAmEVhK21rAfku6z1aOky8UzXbklc5FdpJIq3DZxUZLnF2lHOE
        YndBGq4Yz3fTRWPBNCO5q/5KGNyPwAAA+Rr205pqOwN4gInJToMugSotPHbaGP8k
        LN1D6CZI3G0/47X46Yp/mBPCop7utYkv8XRkeRIQQ8xjU9Pual9as157XTbbqgvb
        fb5S9o4/C3lapGTCyXMDyfKGTSNHGA+P5csFFu35B3bIDqDfYKaCUuA82cv/W3Ew
        ==
X-ME-Sender: <xms:txNFX737rV-DUl0MlMstx4oiRki0TTIUKW5NAUOX_slsz_vq7fEWww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
    gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:txNFX6EZck0H6IrsZO7P67Ab43I8ZOb3PgYwhWmtkT0Wzijf8aP6Mg>
    <xmx:txNFX77nZ7Jqtz-EVuw0-UC7QAplMOWGckl_6zpi1ZeBrbfRfhDYCQ>
    <xmx:txNFXw3MffyXBUovYTVQhoqj4Z6BgpznrhjFBbl1u3zm0XVrlRL71w>
    <xmx:txNFXxAKgopu3A7oS7t_oTx_iTYelc2zYe_9gSjzEcFMjBa25TYwGw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 331FC328005A;
        Tue, 25 Aug 2020 09:35:51 -0400 (EDT)
Date:   Mon, 24 Aug 2020 18:55:36 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org,
        yong.deng@magewell.com, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 1/7] media: sun6i-csi: Fix the bpp for 10-bit bayer
 formats
Message-ID: <20200824165536.u2yzonoskiqu3c5j@gilmour.lan>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
 <20200821145935.20346-2-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bfmdwl5kcym7nka4"
Content-Disposition: inline
In-Reply-To: <20200821145935.20346-2-kevin.lhopital@bootlin.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--bfmdwl5kcym7nka4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 04:59:29PM +0200, K=E9vin L'h=F4pital wrote:
> 10-bit bayer formats are aligned to 16 bits in memory, so this is what
> needs to be used as bpp for calculating the size of the buffers to
> allocate.
>=20
> Signed-off-by: K=E9vin L'h=F4pital <kevin.lhopital@bootlin.com>

Generally speaking, you should also explain why it's not an issue for
the callers. Depending on what that function is supposed to be doing
(returning the padded bits or the padded bits per pixel), your patch
could be either right or wrong.

Since all the callers are using it to generate the number of bytes per
line, your patch is indeed correct. But it should be mentionned in the
commit log.

Maxime

--bfmdwl5kcym7nka4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0PxCAAKCRDj7w1vZxhR
xcvsAQCvN3gtT1RS8+Z8WwFFELIkFm7M6jqWf3Z9ZBbmSc0aVQD/SUIIWtkekTpB
V+AbU7eYR7tD5BwIbp+/2hTXdMfqogM=
=YTpD
-----END PGP SIGNATURE-----

--bfmdwl5kcym7nka4--
