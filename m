Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B052F5F8EF3
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 23:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbiJIVXV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 17:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbiJIVXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 17:23:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D60410FE0;
        Sun,  9 Oct 2022 14:23:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0E547B80D9A;
        Sun,  9 Oct 2022 21:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0430BC433C1;
        Sun,  9 Oct 2022 21:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665350595;
        bh=yFS/PCpZl5mS1BZ/oMc8mFIPNf0Kk6CwYUVHSVUSUOI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QnrTEvlPPY3mrq3etiMXavPO93nMwTBB8iOBJ7RSib22qK9PnmBCl6SBHeVe8bQzs
         LKuNoXKX86bgivc2ZGAPNZHz++G2TCqRJD17quZbT8fxvhaRZBMGYp8zWBDF64gceS
         D+joOrbYPIh3GfUgVLkxkK7qQubmRjuFLmHSP896ZVW1e9peweSgiPeGoRIaZnSKV3
         5eVs+W4jmijM/753ik3H3Z5H6nwBENlJAuF1CHUjZocZxDGFaDl2BuSJv65LgKdD0f
         5OLFNH13J2Nq1QNv99GDUhi9eQ/UF4rdPSZZSAieXqigIug1LyFEhA8vzsTia9IPfe
         +6DpR2SumOovQ==
Date:   Sun, 9 Oct 2022 23:23:12 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: i2c: adv748x: Remove dead function declaration
Message-ID: <Y0M7wKRl8Y+X3+Sy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20221008141205.3493964-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DYXNEn36yuYEx5UC"
Content-Disposition: inline
In-Reply-To: <20221008141205.3493964-1-niklas.soderlund+renesas@ragnatech.se>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--DYXNEn36yuYEx5UC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 08, 2022 at 04:12:05PM +0200, Niklas S=C3=B6derlund wrote:
> There is no implementation of adv748x_register_subdevs(), remove the
> declaration in the header file.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

True.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--DYXNEn36yuYEx5UC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNDO8AACgkQFA3kzBSg
KbYMjA/+MDx9IRlZYtxNjNbqJRgP152X5iFmziCLqmazEofD+9cIS4G6lu+sagBK
vu+SsrFpeZPdfxi3QqnRTcTKslSkAU5VufKcmea1ZHu0am+9XOR6cKwjvhJkXnGn
KgzVDefnHqfqiQo+zXGB5tlQCc1DEWvcuF8Lrcr0TboLl7o2lNMVxmVsQikJIvii
TVfLuMau388LuO/9XQdIrK3BG0XSzsWKvwjPY8Km12ThWJ9Uv7RZARX5v12PiXta
hS29T1suYhSTtdtcc30LWbQr2uM/iVGfb8K9A2/LNLg2iQrOFuZjl2aH/p7522o3
oS7S6mKzcelpScPAFloQsyB42PG/EHaPJwO1rI1osmW2wN6eKEkOpNSQiQhUraTg
AnBJAiKXmhpUtrsL8/HEX4Cys11t1AqcliIH4E4KKDeCloGS19QEPHTUjx5ndadL
UsIw0PE5C57gBRv+zZobEvoj7W0rCRznY+KK/gnNuGJBQp8g81gifMfgsbHQ1X3W
CpcmxjtFpFzZIPtMBI0tCOzs/KewPGLWMVVV1qiL+7ll1pNEAoECoAKcVJ3TJu1g
ZDkMQKm1eF3gtacvDwBxgfMXunmnTpOZDCN32H5K0wY+Ns0UECxl3txVK5/V1kIs
BjENOTxeSTwhNyYBGMFe981OwXFM4TqyRvCSl4LAyEZ5dclcW2g=
=dM2J
-----END PGP SIGNATURE-----

--DYXNEn36yuYEx5UC--
