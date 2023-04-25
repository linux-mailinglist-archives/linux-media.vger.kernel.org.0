Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E13F56EE846
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 21:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbjDYTai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 15:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235511AbjDYTah (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 15:30:37 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027F235AC
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 12:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=nbGpmVWQIaPTFwdaqQ8da+YgUxNs
        05I7Ipa2cSbCS7w=; b=H9iI8VI0o/FU+06wcD9/E+np3Re9YKySXYeet/MOCbUi
        UxkkRumqpS6/h5f1CGTPiR8GBB2tsSPKKhEsIEZngC2cWKNXKazyXXXgSi98psgh
        o7pS/e49b+HLWJXK7wzQ6U5jR2LXhCKze7DxIA/5XSTmkcp/idLFtOnfYzv+VP4=
Received: (qmail 1468238 invoked from network); 25 Apr 2023 21:30:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Apr 2023 21:30:29 +0200
X-UD-Smtp-Session: l3s3148p1@UQz5Jy76CuAujnsI
Date:   Tue, 25 Apr 2023 21:30:28 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: renesas: fdp1: Identify R-Car Gen2 versions
Message-ID: <ZEgqVJo4yRWvb/7G@sai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <453e34f0eda526f79b0297952937dc0a0b5aacf8.1682435583.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q+Z7SO+65lv9FBFe"
Content-Disposition: inline
In-Reply-To: <453e34f0eda526f79b0297952937dc0a0b5aacf8.1682435583.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--q+Z7SO+65lv9FBFe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023 at 05:15:02PM +0200, Geert Uytterhoeven wrote:
> On R-Car M2-W:
>=20
>     rcar_fdp1 fe940000.fdp1: FDP1 Unidentifiable (0x02010101)
>     rcar_fdp1 fe944000.fdp1: FDP1 Unidentifiable (0x02010101)
>=20
> Although the IP Internal Data Register on R-Car Gen2 is documented to
> contain all zeros, the actual register contents seem to match the FDP1
> version ID of R-Car H3 ES1.*, which has just been removed.
> Fortunately this version is not used for any other purposes yet.
>=20
> Fix this by re-adding the ID, now using an R-Car Gen2-specific name.
>=20
> Fixes: af4273b43f2bd9ee ("media: renesas: fdp1: remove R-Car H3 ES1.* han=
dling")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

>  /* Internal Data (HW Version) */
>  #define FD1_IP_INTDATA			0x0800
> +#define FD1_IP_GEN2			0x02010101

Maybe add a comment here saying that this is needed despite the
information in the datasheets?


--q+Z7SO+65lv9FBFe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmRIKlQACgkQFA3kzBSg
Kbb59g//aMlIWbSWMrMeTQTAlH7+J9Qum4Ck7XV5E6VqzS0mCGgcGBXNouzE2L4X
z0MWMrMlehPZKQIGFZoCvioyFzdl5Hh/EdJw+RhF1HOoiLXrp6XzYPQ4Br/w++bP
qHjRmpgT7MOYc/5JQMmzuk9MErxRaxxc9/Q5lPGo71yVGyc0NNetjdOKqBZrFdB/
c8fQVfiHxFVSAfMFiP3ZeVLj0kEhQNKoBddKCz6orHfhpNvXgoFqhwPanQ7C54pH
a3l7c99OW/r+cPjn+24Myfj0X+fTKvOw+YUg9s3XJT2oW1f/u99NYLBGnOl1CN1J
up9sWyt5tteXURdJtcH7alSHrHWA7rHkGxSc7NLc/b74QPeft5PaM4lAulfV5BNQ
QCWbZ79XM4Trx52LsdUtEjkiuRUXzYV7W1W+CZxpuFbrwVnSvk8mF4GCvFkrrJyc
/aiRWO0HFm46XwJTQBaUEqthTHCS8RlRkfeuxi13ABH33xzpOopSfVzfpS4PdQEY
PtWp5GAdmU6Z+RBt6LU8uNV8gunWYTYwucOI1SVnIFg4/jpsj3jYr3ng9fGUw95b
bwlCyi1n9cCgu8je9NJXXhKrI0GyKg4uxJAiv/VUPv67BMjNWWSRUi/W2Rk4FTZ/
6oVymCZ5v8d3Mu0F1mw7VXLGf9xNU+YaicM8QGk8nuEs/v1J50A=
=rJ+e
-----END PGP SIGNATURE-----

--q+Z7SO+65lv9FBFe--
